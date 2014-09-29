Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C82C3605B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 06:23:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8T6NRlT013570
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Sep 2014 23:23:27 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 28 Sep 2014 23:23:27 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 29 Sep 2014 14:24:17 +0800
Message-ID: <1411971857-31420-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] ebtables: fix for sysvinit and systemd
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Sep 2014 06:23:34 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The solution mainly references Fedora20.
Extract the common part of the code and install it into ${sbindir}.
Add systemd service file.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../ebtables/ebtables-2.0.10-4/ebtables.common     |  163 ++++++++++++++++++++
 .../ebtables/ebtables-2.0.10-4/ebtables.init       |  162 +------------------
 .../ebtables/ebtables-2.0.10-4/ebtables.service    |   11 ++
 .../recipes-filter/ebtables/ebtables_2.0.10-4.bb   |   22 ++-
 4 files changed, 192 insertions(+), 166 deletions(-)
 create mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.common
 create mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.service

diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.common b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.common
new file mode 100644
index 0000000..640025d
--- /dev/null
+++ b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.common
@@ -0,0 +1,163 @@
+#!/bin/sh
+
+[ -x /sbin/ebtables ] || exit 1
+
+EBTABLES_DUMPFILE_STEM=/etc/ebtables/dump
+
+RETVAL=0
+prog="ebtables"
+desc="Ethernet bridge filtering"
+umask 0077
+
+#default configuration
+EBTABLES_MODULES_UNLOAD="yes"
+EBTABLES_LOAD_ON_START="no"
+EBTABLES_SAVE_ON_STOP="no"
+EBTABLES_SAVE_ON_RESTART="no"
+EBTABLES_SAVE_COUNTER="no"
+EBTABLES_BACKUP_SUFFIX="~"
+
+config=/etc/default/$prog
+[ -f "$config" ] && . "$config"
+
+function get_supported_tables() {
+	EBTABLES_SUPPORTED_TABLES=
+	/sbin/ebtables -t filter -L 2>&1 1>/dev/null | grep -q permission
+	if [ $? -eq 0 ]; then
+		echo "Error: insufficient privileges to access the ebtables rulesets."
+		exit 1
+	fi
+	for table in filter nat broute; do
+		/sbin/ebtables -t $table -L &> /dev/null
+		if [ $? -eq 0 ]; then
+			EBTABLES_SUPPORTED_TABLES="${EBTABLES_SUPPORTED_TABLES} $table"
+		fi
+	done
+}
+
+function load() {
+	RETVAL=0
+	get_supported_tables
+	echo -n "Restoring ebtables rulesets: "
+	for table in $EBTABLES_SUPPORTED_TABLES; do
+		echo -n "$table "
+		if [ -s ${EBTABLES_DUMPFILE_STEM}.$table ]; then
+			/sbin/ebtables -t $table --atomic-file ${EBTABLES_DUMPFILE_STEM}.$table --atomic-commit
+			RET=$?
+			if [ $RET -ne 0 ]; then
+				echo -n "(failed) "
+				RETVAL=$RET
+			fi
+		else
+			echo -n "(no saved state) "
+		fi
+	done
+	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
+		echo -n "no kernel support. "
+	else
+		echo -n "done. "
+	fi
+	if [ $RETVAL -eq 0 ]; then
+		echo "ok"
+	else
+		echo "fail"
+	fi
+}
+
+function clear() {
+	RETVAL=0
+	get_supported_tables
+	echo -n "Clearing ebtables rulesets: "
+	for table in $EBTABLES_SUPPORTED_TABLES; do
+		echo -n "$table "
+		/sbin/ebtables -t $table --init-table
+	done
+
+	if [ "$EBTABLES_MODULES_UNLOAD" = "yes" ]; then
+		for mod in $(grep -E '^(ebt|ebtable)_' /proc/modules | cut -d' ' -f1) ebtables; do
+			rmmod $mod 2> /dev/null
+		done
+	fi
+	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
+		echo -n "no kernel support. "
+	else
+		echo -n "done. "
+	fi
+	if [ $RETVAL -eq 0 ]; then
+		echo "ok"
+	else
+		echo "fail"
+	fi
+}
+
+function save() {
+	RETVAL=0
+	get_supported_tables
+	echo -n "Saving ebtables rulesets: "
+	for table in $EBTABLES_SUPPORTED_TABLES; do
+		echo -n "$table "
+		[ -n "$EBTABLES_BACKUP_SUFFIX" ] && [ -s ${EBTABLES_DUMPFILE_STEM}.$table ] && \
+		  mv ${EBTABLES_DUMPFILE_STEM}.$table ${EBTABLES_DUMPFILE_STEM}.$table$EBTABLES_BACKUP_SUFFIX
+		/sbin/ebtables -t $table --atomic-file ${EBTABLES_DUMPFILE_STEM}.$table --atomic-save
+		RET=$?
+		if [ $RET -ne 0 ]; then
+			echo -n "(failed) "
+			RETVAL=$RET
+		else
+			if [ "$EBTABLES_SAVE_COUNTER" = "no" ]; then
+				/sbin/ebtables -t $table --atomic-file ${EBTABLES_DUMPFILE_STEM}.$table -Z
+			fi
+		fi
+	done
+	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
+		echo -n "no kernel support. "
+	else
+		echo -n "done. "
+	fi
+	if [ $RETVAL -eq 0 ]; then
+		echo "ok"
+	else
+		echo "fail"
+	fi
+}
+
+case "$1" in
+  start)
+	[ "$EBTABLES_LOAD_ON_START" = "yes" ] && load
+	;;
+  stop)
+	[ "$EBTABLES_SAVE_ON_STOP" = "yes" ] && save
+	clear
+	;;
+  restart|reload|force-reload)
+	[ "$EBTABLES_SAVE_ON_RESTART" = "yes" ] && save
+	clear
+	[ "$EBTABLES_LOAD_ON_START" = "yes" ] && load
+	;;
+  load)
+	load
+	;;
+  save)
+	save
+	;;
+  status)
+	get_supported_tables
+	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
+		echo "No kernel support for ebtables."
+		RETVAL=1
+	else
+		echo -n "Ebtables support available, number of installed rules: "
+		for table in $EBTABLES_SUPPORTED_TABLES; do
+			COUNT=$(( $(/sbin/ebtables -t $table -L | sed -e "/^Bridge chain/! d" -e "s/^.*entries: //" -e "s/,.*$/ +/") 0 ))
+			echo -n "$table($COUNT) "
+		done
+		echo ok
+		RETVAL=0
+	fi
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart|reload|force-reload|load|save|status}" >&2
+	RETVAL=1
+esac
+
+exit $RETVAL
diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.init b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.init
index 0044e98..c9a77a2 100755
--- a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.init
+++ b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.init
@@ -23,164 +23,4 @@
 # Description:		Saves and restores the state of the ebtables rulesets.
 ### END INIT INFO
 
-[ -x /sbin/ebtables ] || exit 1
-
-EBTABLES_DUMPFILE_STEM=/etc/ebtables/dump
-
-RETVAL=0
-prog="ebtables"
-desc="Ethernet bridge filtering"
-umask 0077
-
-#default configuration
-EBTABLES_MODULES_UNLOAD="yes"
-EBTABLES_LOAD_ON_START="no"
-EBTABLES_SAVE_ON_STOP="no"
-EBTABLES_SAVE_ON_RESTART="no"
-EBTABLES_SAVE_COUNTER="no"
-EBTABLES_BACKUP_SUFFIX="~"
-
-config=/etc/default/$prog
-[ -f "$config" ] && . "$config"
-
-function get_supported_tables() {
-	EBTABLES_SUPPORTED_TABLES=
-	/sbin/ebtables -t filter -L 2>&1 1>/dev/null | grep -q permission
-	if [ $? -eq 0 ]; then
-		echo "Error: insufficient privileges to access the ebtables rulesets."
-		exit 1
-	fi
-	for table in filter nat broute; do
-		/sbin/ebtables -t $table -L &> /dev/null
-		if [ $? -eq 0 ]; then
-			EBTABLES_SUPPORTED_TABLES="${EBTABLES_SUPPORTED_TABLES} $table"
-		fi
-	done
-}
-
-function load() {
-	RETVAL=0
-	get_supported_tables
-	echo -n "Restoring ebtables rulesets: "
-	for table in $EBTABLES_SUPPORTED_TABLES; do
-		echo -n "$table "
-		if [ -s ${EBTABLES_DUMPFILE_STEM}.$table ]; then
-			/sbin/ebtables -t $table --atomic-file ${EBTABLES_DUMPFILE_STEM}.$table --atomic-commit
-			RET=$?
-			if [ $RET -ne 0 ]; then
-				echo -n "(failed) "
-				RETVAL=$RET
-			fi
-		else
-			echo -n "(no saved state) "
-		fi
-	done
-	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
-		echo -n "no kernel support. "
-	else
-		echo -n "done. "
-	fi
-	if [ $RETVAL -eq 0 ]; then
-		echo "ok"
-	else
-		echo "fail"
-	fi
-}
-
-function clear() {
-	RETVAL=0
-	get_supported_tables
-	echo -n "Clearing ebtables rulesets: "
-	for table in $EBTABLES_SUPPORTED_TABLES; do
-		echo -n "$table "
-		/sbin/ebtables -t $table --init-table
-	done
-
-	if [ "$EBTABLES_MODULES_UNLOAD" = "yes" ]; then
-		for mod in $(grep -E '^(ebt|ebtable)_' /proc/modules | cut -d' ' -f1) ebtables; do
-			rmmod $mod 2> /dev/null
-		done
-	fi
-	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
-		echo -n "no kernel support. "
-	else
-		echo -n "done. "
-	fi
-	if [ $RETVAL -eq 0 ]; then
-		echo "ok"
-	else
-		echo "fail"
-	fi
-}
-
-function save() {
-	RETVAL=0
-	get_supported_tables
-	echo -n "Saving ebtables rulesets: "
-	for table in $EBTABLES_SUPPORTED_TABLES; do
-		echo -n "$table "
-		[ -n "$EBTABLES_BACKUP_SUFFIX" ] && [ -s ${EBTABLES_DUMPFILE_STEM}.$table ] && \
-		  mv ${EBTABLES_DUMPFILE_STEM}.$table ${EBTABLES_DUMPFILE_STEM}.$table$EBTABLES_BACKUP_SUFFIX
-		/sbin/ebtables -t $table --atomic-file ${EBTABLES_DUMPFILE_STEM}.$table --atomic-save
-		RET=$?
-		if [ $RET -ne 0 ]; then
-			echo -n "(failed) "
-			RETVAL=$RET
-		else
-			if [ "$EBTABLES_SAVE_COUNTER" = "no" ]; then
-				/sbin/ebtables -t $table --atomic-file ${EBTABLES_DUMPFILE_STEM}.$table -Z
-			fi
-		fi
-	done
-	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
-		echo -n "no kernel support. "
-	else
-		echo -n "done. "
-	fi
-	if [ $RETVAL -eq 0 ]; then
-		echo "ok"
-	else
-		echo "fail"
-	fi
-}
-
-case "$1" in
-  start)
-	[ "$EBTABLES_LOAD_ON_START" = "yes" ] && load
-	;;
-  stop)
-	[ "$EBTABLES_SAVE_ON_STOP" = "yes" ] && save
-	clear
-	;;
-  restart|reload|force-reload)
-	[ "$EBTABLES_SAVE_ON_RESTART" = "yes" ] && save
-	clear
-	[ "$EBTABLES_LOAD_ON_START" = "yes" ] && load
-	;;
-  load)
-	load
-	;;
-  save)
-	save
-	;;
-  status)
-	get_supported_tables
-	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
-		echo "No kernel support for ebtables."
-		RETVAL=1
-	else
-		echo -n "Ebtables support available, number of installed rules: "
-		for table in $EBTABLES_SUPPORTED_TABLES; do
-			COUNT=$(( $(/sbin/ebtables -t $table -L | sed -e "/^Bridge chain/! d" -e "s/^.*entries: //" -e "s/,.*$/ +/") 0 ))
-			echo -n "$table($COUNT) "
-		done
-		echo ok
-		RETVAL=0
-	fi
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart|reload|force-reload|load|save|status}" >&2
-	RETVAL=1
-esac
-
-exit $RETVAL
+/usr/sbin/ebtables.common $1
diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.service b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.service
new file mode 100644
index 0000000..3abd1fe
--- /dev/null
+++ b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Ethernet Bridge Filtering Tables
+
+[Service]
+Type=oneshot
+RemainAfterExit=yes
+ExecStart=@SBINDIR@/ebtables.common start
+ExecStop=@SBINDIR@/ebtables.common stop
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
index 9222b2d..32cfc75 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
@@ -15,6 +15,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/ebtables/ebtables-v${PV}.tar.gz \
            file://installnonroot.patch \
            file://01debian_defaultconfig.patch \
            file://ebtables.init \
+           file://ebtables.common \
+           file://ebtables.service \
            file://no-as-needed.patch \
 "
 
@@ -23,7 +25,7 @@ SRC_URI[sha256sum] = "dc6f7b484f207dc712bfca81645f45120cb6aee3380e77a1771e9c34a9
 
 S = "${WORKDIR}/ebtables-v${PV}"
 
-inherit update-rc.d
+inherit update-rc.d systemd
 
 EXTRA_OEMAKE = " \
         BINDIR=${base_sbindir} \
@@ -39,21 +41,29 @@ EXTRA_OEMAKE = " \
 "
 
 do_install () {
+    install -d ${D}${sbindir}
+    install -m 0755 ${WORKDIR}/ebtables.common ${D}${sbindir}/ebtables.common
+    # Fix hardcoded paths in scripts
+    sed -i 's!/sbin/!${base_sbindir}/!g' ${D}${sbindir}/ebtables.common
+    sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sbindir}/ebtables.common
+
     install -d ${D}${sysconfdir}/init.d
     install -d ${D}${sysconfdir}/default
     install -d ${D}${sysconfdir}/ebtables
     oe_runmake DESTDIR='${D}' install
     install -m 0755 ${WORKDIR}/ebtables.init ${D}/${sysconfdir}/init.d/ebtables
     mv ${D}${sysconfdir}/default/ebtables-config ${D}${sysconfdir}/default/ebtables
-
-    # Fix hardcoded paths in scripts
-    sed -i 's!/sbin/!${base_sbindir}/!g' ${D}/${sysconfdir}/init.d/ebtables
-    sed -i 's!/etc/!${sysconfdir}/!g' ${D}/${sysconfdir}/init.d/ebtables
+    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/ebtables
 
     # The script ebtables-save refernces perl in exec_prefix, so
     # move it to sbindir to avoid QA issue
     install -d ${D}/${sbindir}
     mv ${D}/${base_sbindir}/ebtables-save ${D}/${sbindir}
+
+    # Install systemd service files
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/ebtables.service ${D}${systemd_unitdir}/system
+    sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/ebtables.service
 }
 
 CONFFILES_${PN} += "${sysconfdir}/default/ebtables"
@@ -61,5 +71,7 @@ CONFFILES_${PN} += "${sysconfdir}/default/ebtables"
 INITSCRIPT_NAME = "ebtables"
 INITSCRIPT_PARAMS = "start 41 S . stop 41 6 ."
 
+SYSTEMD_SERVICE_${PN} = "ebtables.service"
+
 FILES_${PN}-dbg += "${base_libdir}/ebtables/.debug"
 FILES_${PN} += "${base_libdir}/ebtables/*.so"
-- 
1.7.9.5


