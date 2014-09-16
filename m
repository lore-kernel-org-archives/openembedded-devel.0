Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 90A266BBAB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2014 09:36:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8G9agK1011986
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2014 02:36:43 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 16 Sep 2014 02:36:42 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Sep 2014 17:36:35 +0800
Message-ID: <1410860196-30191-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] postgresql: move initdb to postgresql-setup
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
X-List-Received-Date: Tue, 16 Sep 2014 09:36:45 -0000
Content-Type: text/plain

We shouldn't use sysvinit init script to initialize database when use systemd
as the init manager, so split initdb function to postgresql-setup.
Before starting postgresql server, we can use "postgresql-setup initdb" to
initialize the database cluster.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../postgresql/files/postgresql-setup              | 73 ++++++++++++++++++++++
 .../postgresql/files/postgresql.init               | 52 +--------------
 meta-oe/recipes-support/postgresql/postgresql.inc  |  2 +
 3 files changed, 77 insertions(+), 50 deletions(-)
 create mode 100644 meta-oe/recipes-support/postgresql/files/postgresql-setup

diff --git a/meta-oe/recipes-support/postgresql/files/postgresql-setup b/meta-oe/recipes-support/postgresql/files/postgresql-setup
new file mode 100644
index 0000000..75bb01e
--- /dev/null
+++ b/meta-oe/recipes-support/postgresql/files/postgresql-setup
@@ -0,0 +1,73 @@
+#!/bin/sh
+#
+# postgresql-setup      Initialization operation for PostgreSQL
+
+# For SELinux we need to use 'runuser' not 'su'
+if [ -x /sbin/runuser ]
+then
+    SU=runuser
+else
+    SU=su
+fi
+
+PGENGINE=/usr/bin
+PGDATA=/var/lib/postgresql/data
+PGLOG=/var/lib/postgresql/pgstartup.log
+script_result=0
+
+initdb(){
+    if [ -f "$PGDATA/PG_VERSION" ]
+    then
+	echo -n "Data directory is not empty!"
+	echo -n " [FAILED] "
+	echo
+	script_result=1
+    else
+	echo -n "Initializing database: "
+	if [ ! -e "$PGDATA" -a ! -h "$PGDATA" ]
+	then
+		mkdir -p "$PGDATA" || exit 1
+		chown postgres:postgres "$PGDATA"
+		chmod go-rwx "$PGDATA"
+	fi
+	# Clean up SELinux tagging for PGDATA
+	[ -x /sbin/restorecon ] && /sbin/restorecon "$PGDATA"
+
+	# Make sure the startup-time log file is OK, too
+	if [ ! -e "$PGLOG" -a ! -h "$PGLOG" ]
+	then
+		touch "$PGLOG" || exit 1
+		chown postgres:postgres "$PGLOG"
+		chmod go-rwx "$PGLOG"
+		[ -x /sbin/restorecon ] && /sbin/restorecon "$PGLOG"
+	fi
+
+	# Initialize the database
+	$SU -l postgres -c "$PGENGINE/initdb --pgdata='$PGDATA' --auth='ident'" >> "$PGLOG" 2>&1 < /dev/null
+
+	# Create directory for postmaster log
+	mkdir "$PGDATA/pg_log"
+	chown postgres:postgres "$PGDATA/pg_log"
+	chmod go-rwx "$PGDATA/pg_log"
+
+	if [ -f "$PGDATA/PG_VERSION" ]
+	then
+	    echo -n " [ OK ] "
+	else
+	    echo -n " [FAILED] "
+	    script_result=1
+	fi
+	echo
+    fi
+}
+
+case "$1" in
+  initdb)
+	initdb
+	;;
+  *)
+	echo "Usage: $0 initdb"
+	exit 2
+esac
+
+exit $script_result
diff --git a/meta-oe/recipes-support/postgresql/files/postgresql.init b/meta-oe/recipes-support/postgresql/files/postgresql.init
index ab46477..4a4f0cd 100644
--- a/meta-oe/recipes-support/postgresql/files/postgresql.init
+++ b/meta-oe/recipes-support/postgresql/files/postgresql.init
@@ -101,7 +101,7 @@ start(){
 	else
 		# No existing PGDATA! Warn the user to initdb it.
 		echo
-                echo "$PGDATA is missing. Use \"service postgresql initdb\" to initialize the cluster first."
+                echo "$PGDATA is missing. Use \"postgresql-setup initdb\" to initialize the cluster first."
 		echo -n " [FAILED] "
 		echo
 		exit 1
@@ -160,51 +160,6 @@ reload(){
     $SU -l postgres -c "$PGENGINE/pg_ctl reload -D '$PGDATA' -s" > /dev/null 2>&1 < /dev/null
 }
 
-initdb(){
-    if [ -f "$PGDATA/PG_VERSION" ]
-    then
-	echo -n "Data directory is not empty!"
-	echo -n " [FAILED] "
-	echo
-	script_result=1
-    else
-	echo -n $"Initializing database: "
-	if [ ! -e "$PGDATA" -a ! -h "$PGDATA" ]
-	then
-		mkdir -p "$PGDATA" || exit 1
-		chown postgres:postgres "$PGDATA"
-		chmod go-rwx "$PGDATA"
-	fi
-	# Clean up SELinux tagging for PGDATA
-	[ -x /sbin/restorecon ] && /sbin/restorecon "$PGDATA"
-
-	# Make sure the startup-time log file is OK, too
-	if [ ! -e "$PGLOG" -a ! -h "$PGLOG" ]
-	then
-		touch "$PGLOG" || exit 1
-		chown postgres:postgres "$PGLOG"
-		chmod go-rwx "$PGLOG"
-		[ -x /sbin/restorecon ] && /sbin/restorecon "$PGLOG"
-	fi
-
-	# Initialize the database
-	$SU -l postgres -c "$PGENGINE/initdb --pgdata='$PGDATA' --auth='ident'" >> "$PGLOG" 2>&1 < /dev/null
-
-	# Create directory for postmaster log
-	mkdir "$PGDATA/pg_log"
-	chown postgres:postgres "$PGDATA/pg_log"
-	chmod go-rwx "$PGDATA/pg_log"
-
-	if [ -f "$PGDATA/PG_VERSION" ]
-	then
-	    echo -n " [ OK ] "
-	else
-	    echo -n " [FAILED] "
-	    script_result=1
-	fi
-	echo
-    fi
-}
 
 # See how we were called.
 case "$1" in
@@ -230,11 +185,8 @@ case "$1" in
   force-reload)
 	restart
 	;;
-  initdb)
-	initdb
-	;;
   *)
-	echo $"Usage: $0 {start|stop|status|restart|condrestart|try-restart|reload|force-reload|initdb}"
+	echo $"Usage: $0 {start|stop|status|restart|condrestart|try-restart|reload|force-reload}"
 	exit 2
 esac
 
diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index a9b4a01..774c8fd 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -29,6 +29,7 @@ SRC_URI = "http://ftp.postgresql.org/pub/source/v${PV}/${BP}.tar.bz2 \
            file://postgresql-bashprofile \
            file://postgresql.pam \
            file://0001-Use-pkg-config-for-libxml2-detection.patch \
+           file://postgresql-setup \
 "
 
 LEAD_SONAME = "libpq.so"
@@ -171,6 +172,7 @@ do_install_append() {
     install -d ${D}${sysconfdir}/init.d
     install -m 0755 ${WORKDIR}/${BPN}.init ${D}${sysconfdir}/init.d/${BPN}-server
     sed -i -e "s/^PGVERSION=.*$/PGVERSION=${PV}/g" ${D}${sysconfdir}/init.d/${BPN}-server
+    install -m 0755 ${WORKDIR}/${BPN}-setup ${D}${bindir}/${BPN}-setup
     install -d -m 700 ${D}${localstatedir}/lib/${BPN}/data
     install -d -m 700 ${D}${localstatedir}/lib/${BPN}/backups
     install -m 644 ${WORKDIR}/${BPN}-bashprofile ${D}${localstatedir}/lib/${BPN}/.bash_profile
-- 
1.9.1


