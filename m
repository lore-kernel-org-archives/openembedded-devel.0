Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jekhor@gmail.com>) id 1Rq0k1-00041D-Gy
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 12:10:13 +0100
Received: by bkaq10 with SMTP id q10so4064541bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 03:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=n7Veygf0WK7PcRu1498j22pc3InJCPsomBYTomJ2Gkg=;
	b=xDttECwC0zmhyMuU48IHg8M5xrHTBuLsb/hoLgtbMpnkiquBHfua5Yfa0gSP76LQAW
	OFt3PSXytPqgofGjr8TMazxDe7HbBzA7vpd55NIZNTjGqyzXIfuawSnZdxCbrDjr7qU0
	YAZ9A3tkT6zt1jCwb5ULAFlpyxh4a2S1YyNHc=
Received: by 10.204.152.208 with SMTP id h16mr7075209bkw.6.1327488906508;
	Wed, 25 Jan 2012 02:55:06 -0800 (PST)
Received: from localhost.localdomain (mx2.promwad.com. [195.222.87.218])
	by mx.google.com with ESMTPS id ew13sm197352bkb.1.2012.01.25.02.55.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 02:55:06 -0800 (PST)
Sender: Yauhen Kharuzhy <jekhor@gmail.com>
Received: from jek by localhost.localdomain with local (Exim 4.77)
	(envelope-from <jek@jeknote.loshitsa1.net>)
	id 1Rq0VN-0007JS-5c; Wed, 25 Jan 2012 13:55:05 +0300
From: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2012 13:55:03 +0300
Message-Id: <1327488903-28082-1-git-send-email-yauhen.kharuzhy@promwad.com>
X-Mailer: git-send-email 1.7.8.3
Cc: Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>
Subject: [PATCH 02/10] Add recipe for ebtables_2.0.10-4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jan 2012 11:10:13 -0000

From: Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>

Recipe for this package has been taken from Openembedded-classic project.

Signed-off-by: Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>
---
 .../ebtables-2.0.10-4/01debian_defaultconfig.patch |   50 ++++++
 .../ebtables/ebtables-2.0.10-4/ebtables.init       |  186 ++++++++++++++++++++
 .../ebtables-2.0.10-4/installnonroot.patch         |   43 +++++
 .../recipes-extended/ebtables/ebtables_2.0.10-4.bb |   51 ++++++
 4 files changed, 330 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/ebtables/ebtables-2.0.10-4/01debian_defaultconfig.patch
 create mode 100755 meta/recipes-extended/ebtables/ebtables-2.0.10-4/ebtables.init
 create mode 100644 meta/recipes-extended/ebtables/ebtables-2.0.10-4/installnonroot.patch
 create mode 100644 meta/recipes-extended/ebtables/ebtables_2.0.10-4.bb

diff --git a/meta/recipes-extended/ebtables/ebtables-2.0.10-4/01debian_defaultconfig.patch b/meta/recipes-extended/ebtables/ebtables-2.0.10-4/01debian_defaultconfig.patch
new file mode 100644
index 0000000..c260403
--- /dev/null
+++ b/meta/recipes-extended/ebtables/ebtables-2.0.10-4/01debian_defaultconfig.patch
@@ -0,0 +1,50 @@
+#! /bin/sh /usr/share/dpatch/dpatch-run
+## debian_defaultconfig.dpatch by  <hesso@pool.math.tu-berlin.de>
+##
+## DP: Debian enhancements to the ebtables "sysconfig" default settings.
+
+@DPATCH@
+
+--- ebtables-2.0.8.1.orig/ebtables-config
++++ ebtables-2.0.8.1/ebtables-config
+@@ -1,17 +1,3 @@
+-# Save (and possibly restore) in text format.
+-#   Value: yes|no,  default: yes
+-# Save the firewall rules in text format to __SYSCONFIG__/ebtables
+-# If EBTABLES_BINARY_FORMAT="no" then restoring the firewall rules
+-# is done using this text format.
+-EBTABLES_TEXT_FORMAT="yes"
+-
+-# Save (and restore) in binary format.
+-#   Value: yes|no,  default: yes
+-# Save (and restore) the firewall rules in binary format to (and from)
+-# __SYSCONFIG__/ebtables.<chain>. Enabling this option will make
+-# firewall initialisation a lot faster.
+-EBTABLES_BINARY_FORMAT="yes"
+-
+ # Unload modules on restart and stop
+ #   Value: yes|no,  default: yes
+ # This option has to be 'yes' to get to a sane state for a firewall
+@@ -19,6 +5,12 @@
+ # modules.
+ EBTABLES_MODULES_UNLOAD="yes"
+ 
++# Load firewall rules on system startup.
++#   Value: yes|no,  default: no
++# Restores the ebtables rulesets from the last saved state when the
++# system boots up.
++EBTABLES_LOAD_ON_START="no"
++
+ # Save current firewall rules on stop.
+ #   Value: yes|no,  default: no
+ # Saves all firewall rules if firewall gets stopped
+@@ -35,3 +27,9 @@
+ # Save rule counters when saving a kernel table to a file. If the
+ # rule counters were saved, they will be restored when restoring the table.
+ EBTABLES_SAVE_COUNTER="no"
++
++# Backup suffix for ruleset save files.
++#   Value: <string>,  default: "~"
++# Keep one backup level of saved rules.
++# Set this variable to the empty string to disable backups.
++EBTABLES_BACKUP_SUFFIX="~"
diff --git a/meta/recipes-extended/ebtables/ebtables-2.0.10-4/ebtables.init b/meta/recipes-extended/ebtables/ebtables-2.0.10-4/ebtables.init
new file mode 100755
index 0000000..0044e98
--- /dev/null
+++ b/meta/recipes-extended/ebtables/ebtables-2.0.10-4/ebtables.init
@@ -0,0 +1,186 @@
+#!/bin/sh
+#
+# init script for the Ethernet Bridge filter tables
+#
+# Written by Dag Wieers <dag@wieers.com>
+# Modified by Rok Papez <rok.papez@arnes.si>
+#	     Bart De Schuymer <bdschuym@pandora.be>
+# Adapted to Debian by Jan Christoph Nordholz <hesso@pool.math.tu-berlin.de>
+# Adapted to OpenEmbedded by Roman I Khimov <khimov@altell.ru>
+#
+# chkconfig: - 15 85
+# description: Ethernet Bridge filtering tables
+#
+### BEGIN INIT INFO
+# Provides:		ebtables
+# Required-Start:	
+# Required-Stop:	
+# Should-Start:		$local_fs
+# Should-Stop:		$local_fs
+# Default-Start:	S
+# Default-Stop:		0 6
+# Short-Description:	ebtables ruleset management
+# Description:		Saves and restores the state of the ebtables rulesets.
+### END INIT INFO
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
diff --git a/meta/recipes-extended/ebtables/ebtables-2.0.10-4/installnonroot.patch b/meta/recipes-extended/ebtables/ebtables-2.0.10-4/installnonroot.patch
new file mode 100644
index 0000000..bcd9bed
--- /dev/null
+++ b/meta/recipes-extended/ebtables/ebtables-2.0.10-4/installnonroot.patch
@@ -0,0 +1,43 @@
+diff --git a/Makefile b/Makefile
+index c1106a4..7ea6b7a 100644
+--- a/Makefile
++++ b/Makefile
+@@ -157,31 +157,31 @@ tmp3:=$(shell printf $(PIPE) | sed 's/\//\\\//g')
+ scripts: ebtables-save ebtables.sysv ebtables-config
+ 	cat ebtables-save | sed 's/__EXEC_PATH__/$(tmp1)/g' > ebtables-save_
+ 	mkdir -p $(DESTDIR)$(BINDIR)
+-	install -m 0755 -o root -g root ebtables-save_ $(DESTDIR)$(BINDIR)/ebtables-save
++	install -m 0755 ebtables-save_ $(DESTDIR)$(BINDIR)/ebtables-save
+ 	cat ebtables.sysv | sed 's/__EXEC_PATH__/$(tmp1)/g' | sed 's/__SYSCONFIG__/$(tmp2)/g' > ebtables.sysv_
+ 	if [ "$(DESTDIR)" != "" ]; then mkdir -p $(DESTDIR)$(INITDIR); fi
+-	if test -d $(DESTDIR)$(INITDIR); then install -m 0755 -o root -g root ebtables.sysv_ $(DESTDIR)$(INITDIR)/ebtables; fi
++	if test -d $(DESTDIR)$(INITDIR); then install -m 0755 ebtables.sysv_ $(DESTDIR)$(INITDIR)/ebtables; fi
+ 	cat ebtables-config | sed 's/__SYSCONFIG__/$(tmp2)/g' > ebtables-config_
+ 	if [ "$(DESTDIR)" != "" ]; then mkdir -p $(DESTDIR)$(SYSCONFIGDIR); fi
+-	if test -d $(DESTDIR)$(SYSCONFIGDIR); then install -m 0600 -o root -g root ebtables-config_ $(DESTDIR)$(SYSCONFIGDIR)/ebtables-config; fi
++	if test -d $(DESTDIR)$(SYSCONFIGDIR); then install -m 0600 ebtables-config_ $(DESTDIR)$(SYSCONFIGDIR)/ebtables-config; fi
+ 	rm -f ebtables-save_ ebtables.sysv_ ebtables-config_
+ 
+ tmp4:=$(shell printf $(LOCKFILE) | sed 's/\//\\\//g')
+ $(MANDIR)/man8/ebtables.8: ebtables.8
+ 	mkdir -p $(DESTDIR)$(@D)
+ 	sed -e 's/$$(VERSION)/$(PROGVERSION)/' -e 's/$$(DATE)/$(PROGDATE)/' -e 's/$$(LOCKFILE)/$(tmp4)/' ebtables.8 > ebtables.8_
+-	install -m 0644 -o root -g root ebtables.8_ $(DESTDIR)$@
++	install -m 0644 ebtables.8_ $(DESTDIR)$@
+ 	rm -f ebtables.8_
+ 
+ $(DESTDIR)$(ETHERTYPESFILE): ethertypes
+ 	mkdir -p $(@D)
+-	install -m 0644 -o root -g root $< $@
++	install -m 0644 $< $@
+ 
+ .PHONY: exec
+ exec: ebtables ebtables-restore
+ 	mkdir -p $(DESTDIR)$(BINDIR)
+-	install -m 0755 -o root -g root $(PROGNAME) $(DESTDIR)$(BINDIR)/$(PROGNAME)
+-	install -m 0755 -o root -g root ebtables-restore $(DESTDIR)$(BINDIR)/ebtables-restore
++	install -m 0755 $(PROGNAME) $(DESTDIR)$(BINDIR)/$(PROGNAME)
++	install -m 0755 ebtables-restore $(DESTDIR)$(BINDIR)/ebtables-restore
+ 
+ .PHONY: install
+ install: $(MANDIR)/man8/ebtables.8 $(DESTDIR)$(ETHERTYPESFILE) exec scripts
diff --git a/meta/recipes-extended/ebtables/ebtables_2.0.10-4.bb b/meta/recipes-extended/ebtables/ebtables_2.0.10-4.bb
new file mode 100644
index 0000000..b0b95b4
--- /dev/null
+++ b/meta/recipes-extended/ebtables/ebtables_2.0.10-4.bb
@@ -0,0 +1,51 @@
+DESCRIPTION = "Utility that enables basic Ethernet frame filtering on a Linux bridge, MAC NAT and brouting."
+PRIORITY = "optional"
+LICENSE = "GPL"
+LIC_FILES_CHKSUM = "file://COPYING;md5=53b4a999993871a28ab1488fdbd2e73e"
+SECTION = "console/network"
+PR = "r2"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+SRC_URI = " \
+	${SOURCEFORGE_MIRROR}/ebtables/ebtables-v${PV}.tar.gz \
+    file://installnonroot.patch \
+    file://01debian_defaultconfig.patch \
+    file://ebtables.init \
+	"
+
+SRC_URI[md5sum] = "506742a3d44b9925955425a659c1a8d0"
+SRC_URI[sha256sum] = "dc6f7b484f207dc712bfca81645f45120cb6aee3380e77a1771e9c34a9a4455d"
+
+S = "${WORKDIR}/ebtables-v${PV}"
+
+EXTRA_OEMAKE = " \
+	BINDIR=${base_sbindir} \
+	MANDIR=${mandir} \
+	ETHERTYPESPATH=${sysconfdir} \
+	INITDIR=${sysconfdir}/init.d \
+	SYSCONFIGDIR=${sysconfdir}/default \
+	LIBDIR=${base_libdir}/ebtables \
+	'CC=${CC}' \
+	'CFLAGS=${CFLAGS}' \
+	'LD=${LD}' \
+	"
+
+do_install () {
+	install -d ${D}${sysconfdir}/init.d
+	install -d ${D}${sysconfdir}/default
+	install -d ${D}${sysconfdir}/ebtables
+	oe_runmake DESTDIR='${D}' install
+	install -m 0755 ${WORKDIR}/ebtables.init ${D}/${sysconfdir}/init.d/ebtables
+	mv ${D}${sysconfdir}/default/ebtables-config ${D}${sysconfdir}/default/ebtables
+}
+
+CONFFILES_${PN} += "${sysconfdir}/default/ebtables"
+
+inherit update-rc.d
+
+INITSCRIPT_NAME = "ebtables"
+INITSCRIPT_PARAMS = "start 41 S . stop 41 6 ."
+
+FILES_${PN}-dbg += "${base_libdir}/ebtables/.debug"
+FILES_${PN} += "${base_libdir}/ebtables/*.so"
-- 
1.7.6.4



