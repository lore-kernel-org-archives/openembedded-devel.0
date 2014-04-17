Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CB9CA65D0F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Apr 2014 08:50:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3H8oIgv002995
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Apr 2014 01:50:18 -0700 (PDT)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.204) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 17 Apr 2014 01:50:17 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Apr 2014 16:50:16 +0800
Message-ID: <1397724616-12883-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] postgresql: add init script and enable some bindings
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
X-List-Received-Date: Thu, 17 Apr 2014 08:50:20 -0000
Content-Type: text/plain

1. Add init script for starting up the PostgreSQL server.
2. Add DESCRIPTION
3. Make tests, plperl, plpython, pltcl subpackages as dynamic in case
other packages runtime depend on them.
4. Disable krb5 by default and enable pam, openssl, python, uuid, libxml,
tcl, nls, libxml and perl bindings.
5. Make contrib and split them in postgresql-contrib.
6. Multilib builds set the package name (PN) to both foo and lib32-foo
breaking build.use BPN instead to get the Base package name.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../postgresql/files/postgresql-bashprofile        |    4 +
 .../postgresql/files/postgresql.init               |  241 ++++++++++++++
 .../postgresql/files/postgresql.pam                |    4 +
 meta-oe/recipes-support/postgresql/postgresql.inc  |  330 ++++++++++++++++++--
 4 files changed, 560 insertions(+), 19 deletions(-)
 create mode 100644 meta-oe/recipes-support/postgresql/files/postgresql-bashprofile
 create mode 100644 meta-oe/recipes-support/postgresql/files/postgresql.init
 create mode 100644 meta-oe/recipes-support/postgresql/files/postgresql.pam

diff --git a/meta-oe/recipes-support/postgresql/files/postgresql-bashprofile b/meta-oe/recipes-support/postgresql/files/postgresql-bashprofile
new file mode 100644
index 0000000..1c931f3
--- /dev/null
+++ b/meta-oe/recipes-support/postgresql/files/postgresql-bashprofile
@@ -0,0 +1,4 @@
+[ -f /etc/profile ] && source /etc/profile
+
+PGDATA=/var/lib/postgresql/data
+export PGDATA
diff --git a/meta-oe/recipes-support/postgresql/files/postgresql.init b/meta-oe/recipes-support/postgresql/files/postgresql.init
new file mode 100644
index 0000000..ab46477
--- /dev/null
+++ b/meta-oe/recipes-support/postgresql/files/postgresql.init
@@ -0,0 +1,241 @@
+#!/bin/sh
+#
+# postgresql	This is the init script for starting up the PostgreSQL
+#		server.
+#
+# chkconfig: - 64 36
+# description: PostgreSQL database server.
+# processname: postmaster
+# pidfile: /var/run/postmaster.PORT.pid
+
+# This script is slightly unusual in that the name of the daemon (postmaster)
+# is not the same as the name of the subsystem (postgresql)
+
+# PGVERSION is the full package version, e.g., 8.4.0
+# Note: the specfile inserts the correct value during package build
+PGVERSION=9.2.4
+# PGMAJORVERSION is major version, e.g., 8.4 (this should match PG_VERSION)
+PGMAJORVERSION=`echo "$PGVERSION" | sed 's/^\([0-9]*\.[0-9]*\).*$/\1/'`
+
+# Source function library.
+. /etc/init.d/functions
+
+# Find the name of the script
+NAME=`basename $0`
+if [ ${NAME:0:1} = "S" -o ${NAME:0:1} = "K" ]
+then
+	NAME=${NAME:3}
+fi
+
+# For SELinux we need to use 'runuser' not 'su'
+if [ -x /sbin/runuser ]
+then
+    SU=runuser
+else
+    SU=su
+fi
+
+
+# Set defaults for configuration variables
+PGENGINE=/usr/bin
+PGPORT=5432
+PGDATA=/var/lib/postgresql/data
+PGLOG=/var/lib/postgresql/pgstartup.log
+# Value to set as postmaster process's oom_adj
+PG_OOM_ADJ=-17
+
+# Override defaults from /etc/sysconfig/postgresql if file is present
+[ -f /etc/default/postgresql/${NAME} ] && . /etc/default/postgresql/${NAME}
+
+export PGDATA
+export PGPORT
+
+lockfile="/var/lock/subsys/${NAME}"
+pidfile="/var/run/postmaster.${PGPORT}.pid"
+
+script_result=0
+
+start(){
+	[ -x "$PGENGINE/postmaster" ] || exit 5
+
+	PSQL_START=$"Starting ${NAME} service: "
+
+	# Make sure startup-time log file is valid
+	if [ ! -e "$PGLOG" -a ! -h "$PGLOG" ]
+	then
+		touch "$PGLOG" || exit 4
+		chown postgres:postgres "$PGLOG"
+		chmod go-rwx "$PGLOG"
+		[ -x /sbin/restorecon ] && /sbin/restorecon "$PGLOG"
+	fi
+
+	# Check for the PGDATA structure
+	if [ -f "$PGDATA/PG_VERSION" ] && [ -d "$PGDATA/base" ]
+	then
+		# Check version of existing PGDATA
+		if [ x`cat "$PGDATA/PG_VERSION"` != x"$PGMAJORVERSION" ]
+		then
+			SYSDOCDIR="(Your System's documentation directory)"
+			if [ -d "/usr/doc/postgresql-$PGVERSION" ]
+			then
+				SYSDOCDIR=/usr/doc
+			fi
+			if [ -d "/usr/share/doc/postgresql-$PGVERSION" ]
+			then
+				SYSDOCDIR=/usr/share/doc
+			fi
+			if [ -d "/usr/doc/packages/postgresql-$PGVERSION" ]
+			then
+				SYSDOCDIR=/usr/doc/packages
+			fi
+			if [ -d "/usr/share/doc/packages/postgresql-$PGVERSION" ]
+			then
+				SYSDOCDIR=/usr/share/doc/packages
+			fi
+			echo
+			echo $"An old version of the database format was found."
+			echo $"You need to upgrade the data format before using PostgreSQL."
+			echo $"See $SYSDOCDIR/postgresql-$PGVERSION/README.rpm-dist for more information."
+			exit 1
+		fi
+	else
+		# No existing PGDATA! Warn the user to initdb it.
+		echo
+                echo "$PGDATA is missing. Use \"service postgresql initdb\" to initialize the cluster first."
+		echo -n " [FAILED] "
+		echo
+		exit 1
+	fi
+
+	echo -n "$PSQL_START"
+	test x"$PG_OOM_ADJ" != x && echo "$PG_OOM_ADJ" > /proc/self/oom_score_adj
+	$SU -l postgres -c "$PGENGINE/postmaster -p '$PGPORT' -D '$PGDATA' ${PGOPTS} &" >> "$PGLOG" 2>&1 < /dev/null
+	sleep 2
+	pid=`head -n 1 "$PGDATA/postmaster.pid" 2>/dev/null`
+	if [ "x$pid" != x ]
+	then
+		echo -n " [ OK ]"
+		touch "$lockfile"
+		echo $pid > "$pidfile"
+		echo
+	else
+		echo -n  " [FAILED]"
+		echo
+		script_result=1
+	fi
+}
+
+stop(){
+	echo -n $"Stopping ${NAME} service: "
+	if [ -e "$lockfile" ]
+	then
+	    $SU -l postgres -c "$PGENGINE/pg_ctl stop -D '$PGDATA' -s -m fast" > /dev/null 2>&1 < /dev/null
+	    ret=$?
+	    if [ $ret -eq 0 ]
+	    then
+		echo -n " [ OK ] "
+		rm -f "$pidfile"
+		rm -f "$lockfile"
+	    else
+		echo -n " [FAILED] "
+		script_result=1
+	    fi
+	else
+	    # not running; per LSB standards this is "ok"
+	    echo -n " [ OK ] "
+	fi
+	echo
+}
+
+restart(){
+    stop
+    start
+}
+
+condrestart(){
+    [ -e "$lockfile" ] && restart || :
+}
+
+reload(){
+    $SU -l postgres -c "$PGENGINE/pg_ctl reload -D '$PGDATA' -s" > /dev/null 2>&1 < /dev/null
+}
+
+initdb(){
+    if [ -f "$PGDATA/PG_VERSION" ]
+    then
+	echo -n "Data directory is not empty!"
+	echo -n " [FAILED] "
+	echo
+	script_result=1
+    else
+	echo -n $"Initializing database: "
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
+# See how we were called.
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
+	;;
+  status)
+	status postmaster
+	script_result=$?
+	;;
+  restart)
+	restart
+	;;
+  condrestart|try-restart)
+	condrestart
+	;;
+  reload)
+	reload
+	;;
+  force-reload)
+	restart
+	;;
+  initdb)
+	initdb
+	;;
+  *)
+	echo $"Usage: $0 {start|stop|status|restart|condrestart|try-restart|reload|force-reload|initdb}"
+	exit 2
+esac
+
+exit $script_result
diff --git a/meta-oe/recipes-support/postgresql/files/postgresql.pam b/meta-oe/recipes-support/postgresql/files/postgresql.pam
new file mode 100644
index 0000000..0b6fdc5
--- /dev/null
+++ b/meta-oe/recipes-support/postgresql/files/postgresql.pam
@@ -0,0 +1,4 @@
+#%PAM-1.0
+auth            include         common-auth
+account         include         common-account
+password        include         common-password
diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index 5f2088e..1d25a53 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -1,4 +1,22 @@
-DESCRIPTION = "PostgreSQL is a powerful, open source relational database system."
+SUMMARY = "PostgreSQL is a powerful, open source relational database system."
+DESCRIPTION = "\
+    PostgreSQL is an advanced Object-Relational database management system \
+    (DBMS) that supports almost all SQL constructs (including \
+    transactions, subselects and user-defined types and functions). The \
+    postgresql package includes the client programs and libraries that \
+    you'll need to access a PostgreSQL DBMS server.  These PostgreSQL \
+    client programs are programs that directly manipulate the internal \
+    structure of PostgreSQL databases on a PostgreSQL server. These client \
+    programs can be located on the same machine with the PostgreSQL \
+    server, or may be on a remote machine which accesses a PostgreSQL \
+    server over a network connection. This package contains the docs \
+    in HTML for the whole package, as well as command-line utilities for \
+    managing PostgreSQL databases on a PostgreSQL server. \
+     \
+    If you want to manipulate a PostgreSQL database on a local or remote \
+    PostgreSQL server, you need this package. You also need to install \
+    this package if you're installing the postgresql-server package. \
+    "
 HOMEPAGE = "http://www.postgresql.com"
 LICENSE = "BSD"
 DEPENDS = "zlib readline tzcode-native"
@@ -6,32 +24,198 @@ INC_PR = "r0"
 
 ARM_INSTRUCTION_SET = "arm"
 
-#WARNING: this recipe assumes you have the timezone compiler present in /usr/sbin/zic
-
-SRC_URI = "http://ftp.postgresql.org/pub/source/v${PV}/${P}.tar.bz2"
+SRC_URI = "http://ftp.postgresql.org/pub/source/v${PV}/${P}.tar.bz2 \
+           file://postgresql.init \
+           file://postgresql-bashprofile \
+           file://postgresql.pam \
+"
 
 LEAD_SONAME = "libpq.so"
 
 # LDFLAGS for shared libraries
 export LDFLAGS_SL = "${LDFLAGS}"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig perlnative pythonnative useradd update-rc.d
+
+enable_pam = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+PACKAGECONFIG ??= "${enable_pam} openssl python uuid libxml tcl nls libxml perl"
+PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
+PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
+PACKAGECONFIG[python] = "--with-python,--wsithout-python,python,python"
+PACKAGECONFIG[uuid] = "--with-ossp-uuid,--without-ossp-uuid,ossp-uuid,"
+# when tcl native package  is fixed change WORKDIR to STAGING_BINDIR_CROSS
+PACKAGECONFIG[tcl] = \
+    "--with-tcl --with-tclconfig=${STAGING_BINDIR_CROSS},--without-tcl,tcl,"
+PACKAGECONFIG[nls] = "--enable-nls,--disable-nls,,"
+PACKAGECONFIG[libxml] = "--with-libxml,--without-libxml,libxml2,libxml2"
+PACKAGECONFIG[perl] = "--with-perl,--without-perl,perl,perl"
 
-EXTRA_OECONF = "--disable-rpath"
-EXTRA_OECONF_sh4 = "--disable-spinlocks --disable-rpath"
+EXTRA_OECONF += "--enable-thread-safety --disable-rpath \
+                 --datadir=${datadir}/${BPN} \
+                 --sysconfdir=${sysconfdir}/${BPN} \
+                 --without-krb5 \
+"
+EXTRA_OECONF_sh4 += "--disable-spinlocks"
 EXTRA_OECONF_aarch64 += "--disable-spinlocks"
 
+PACKAGES_DYNAMIC += "^${PN}-plperl ^${PN}-plperl-dbg \
+                     ^${PN}-pltcl ^${PN}-pltcl-dbg \
+                     ^${PN}-plpython ^${PN}-plpython-dbg \
+"
+
+python populate_packages_prepend() {
+
+    def fill_more(name, dbg=True):
+        if name is None or name.strip() == "":
+            return
+
+        fpack=d.getVar('PACKAGES') or ""
+        fpack="${PN}-" + name + " " + fpack
+        if dbg:
+            fpack="${PN}-" + name + "-dbg" + " " + fpack
+        d.setVar('PACKAGES', fpack)
+
+    conf=(d.getVar('PACKAGECONFIG', True) or "").split()
+    pack=d.getVar('PACKAGES') or ""
+    bb.debug(1, "PACKAGECONFIG=%s" % conf)
+    bb.debug(1, "PACKAGES1=%s" % pack )
+
+    if "perl" in conf :
+        fill_more("plperl")
+
+    if "tcl" in conf:
+        fill_more("pltcl")
+
+    if "python" in conf:
+        fill_more("plpython")
+
+    pack=d.getVar('PACKAGES', True) or ""
+    bb.debug(1, "PACKAGES2=%s" % pack)
+
+}
+
+do_configure() {
+	# do_configure_prepend
+	# make sure configure finds python includdirs with these envs
+	export BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+	       STAGING_INCDIR=${STAGING_INCDIR} \
+	       STAGING_LIBDIR=${STAGING_LIBDIR}
+
+	# do_configure
+	autotools_do_configure
+
+	# do_configure_append
+	# workaround perl package related bugs
+	sed -i -e "s:-L/usr/local/lib:-L=/usr/local/lib:g" \
+	    ${S}/src/Makefile.global
+	LIBPNA="\${STAGING_LIBDIR_NATIVE}/perl-native"
+	LIBNA="\${STAGING_LIBDIR_NATIVE}"
+	BLIBNA="\${STAGING_BASE_LIBDIR_NATIVE}"
+	sed -i -e "/^perl_archlibexp/s:${LIBPNA}:${STAGING_LIBDIR}:g" \
+	    ${S}/src/Makefile.global
+	sed -i -e "/^perl_privlibexp/s:${LIBPNA}:${STAGING_LIBDIR}:g" \
+	    ${S}/src/Makefile.global
+	# remove the rpath, replace with correct lib path
+	sed -i \
+	    -e "/^perl_embed_ldflags/s:-Wl,-rpath,${LIBNA}::g" \
+	    -e "/^perl_embed_ldflags/s:-Wl,-rpath,${BLIBNA}::g" \
+	    -e "/^perl_embed_ldflags/s:-Wl,-rpath-link,${LIBNA}::g" \
+	    -e "/^perl_embed_ldflags/s:-Wl,-rpath-link,${BLIBNA}::g" \
+	    -e "/^perl_embed_ldflags/s:${LIBPNA}:${STAGING_LIBDIR}:g" \
+	    -e "/^perl_embed_ldflags/s:${LIBNA}:${STAGING_LIBDIR}:g"  \
+	    -e "/^perl_embed_ldflags/s:${BLIBNA}:${STAGING_BASELIBDIR}:g" \
+	${S}/src/Makefile.global
+
+	# workaround perl package's libperl.so problem
+	# we are using perlnative so this perl should have same version
+	perl_version=`perl -v 2>/dev/null | \
+            sed -n 's/This is perl.*v[a-z ]*\([0-9]\.[0-9][0-9.]*\).*$/\1/p'`
+	if [ ! -h "${STAGING_LIBDIR}/perl/$perl_version/CORE/libperl.so" -a \
+	     ! -h "${STAGING_LIBDIR}/libperl.so" ]; then
+		ln -sf ../../../libperl.so.5 \
+		    ${STAGING_LIBDIR}/perl/$perl_version/CORE/libperl.so
+	fi
+}
+
 do_compile_append() {
-    cp /usr/sbin/zic ${S}/src/timezone/
+	oe_runmake -C contrib all
+}
+
+# server needs to configure user and group
+usernum = "28"
+groupnum = "28"
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "-M -g postgres -o -r -d ${localstatedir}/lib/${BPN} \
+    -s /bin/bash -c 'PostgreSQL Server' -u ${usernum} postgres"
+GROUPADD_PARAM_${PN} = "-g ${groupnum} -o -r postgres"
+
+INITSCRIPT_PACKAGES = "${PN}"
+INITSCRIPT_NAME = "${BPN}-server"
+INITSCRIPT_PARAMS = "start 64 . stop 36 0 1 2 3 4 5 6 ."
+
+do_install_append() {
+	# install contrib
+	oe_runmake DESTDIR=${D} -C contrib install
+	# install tutorial
+	install -d -m 0755 ${D}${libdir}/${BPN}/tutorial
+	install ${S}/src/tutorial/* ${D}${libdir}/${BPN}/tutorial
+
+	# install COPYRIGHT README HISTORY
+	install -d -m 0755 ${D}${docdir}/${BPN}
+	for i in ${S}/{COPYRIGHT,README,HISTORY} \
+            ${S}/doc/{KNOWN_BUGS,MISSING_FEATURES,README*,bug.template}; do
+		[ -f $i ] && install $i ${D}${docdir}/${BPN}
+	done
+
+	# install dirs and server init
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/${BPN}.init \
+	    ${D}${sysconfdir}/init.d/${BPN}-server
+	sed -i -e "s/^PGVERSION=.*$/PGVERSION=${PV}/g" \
+	    ${D}${sysconfdir}/init.d/${BPN}-server
+	install -d -m 700 ${D}${localstatedir}/lib/${BPN}/data
+	install -d -m 700 ${D}${localstatedir}/lib/${BPN}/backups
+	install -m 644 ${WORKDIR}/${BPN}-bashprofile \
+	    ${D}${localstatedir}/lib/${BPN}/.bash_profile
+	chown -R postgres:postgres ${D}${localstatedir}/lib/${BPN}
+	# multiple server config directory
+	install -d -m 700 ${D}${sysconfdir}/default/${BPN}
+
+	if [ "${@d.getVar('enable_pam', True)}" = "pam" ]; then
+		install -d ${D}${sysconfdir}/pam.d
+		install -m 644 ${WORKDIR}/postgresql.pam \
+		    ${D}${sysconfdir}/pam.d/postgresql
+	fi
 }
 
 SSTATE_SCAN_FILES += "Makefile.global"
 
 PACKAGES =+ "${PN}-client ${PN}-server-dev ${PN}-timezone \
              libecpg-compat-dbg libecpg-compat \
-             libecpg-dbg libecpg libecpg-dev \
-             libpq-dbg libpq libpq-dev \ 
-             libpgtypes-dbg libpgtypes "
+             libecpg-dbg libecpg libecpg-dev libecpg-staticdev libecpg-doc \
+             libpq-dbg libpq libpq-dev libpq-staticdev \
+             libpgtypes-dbg libpgtypes \
+             ${PN}-contrib ${PN}-contrib-dbg \
+"
+
+FILES_${PN} += "${sysconfdir}/init.d/${BPN}-server \
+    ${localstatedir}/lib/${BPN}/data ${localstatedir}/lib/${BPN}/backups \
+    ${localstatedir}/lib/${BPN}/.bash_profile ${sysconfdir}/default/${BPN} \
+    ${libdir}/${BPN}/dict_snowball.so ${libdir}/${BPN}/plpgsql.so \
+    ${libdir}/${BPN}/euc2004_sjis2004.so \
+    ${libdir}/${BPN}/libpqwalreceiver.so \
+    ${libdir}/${BPN}/*_and_*.so \
+    ${@'${sysconfdir}/pam.d/postgresql' \
+       if 'pam' == d.getVar('enable_pam', True) \
+       else ''} \
+"
+
+FILES_${PN}-dbg += " ${libdir}/${BPN}/.debug/dict_snowball.so \
+    ${libdir}/${BPN}/.debug/plpgsql.so \
+    ${libdir}/${BPN}/.debug/euc2004_sjis2004.so \
+    ${libdir}/${BPN}/.debug/libpqwalreceiver.so \
+    ${libdir}/${BPN}/.debug/*_and_*.so \
+"
 
 FILES_${PN}-client = "${bindir}/clusterdb \
                 ${bindir}/createdb \
@@ -47,32 +231,140 @@ FILES_${PN}-client = "${bindir}/clusterdb \
                 ${bindir}/reindexdb \
                 ${bindir}/vacuumdb \
                 ${bindir}/vacuumlo \
-                ${datadir}/${PN}/psqlrc.sample"
+                ${datadir}/${BPN}/psqlrc.sample"
+
+FILES_${PN}-client-doc = "${mandir}/man1/clusterdb.* \
+    ${mandir}/man1/createdb.*   ${mandir}/man1/createlang.* \
+    ${mandir}/man1/createuser.* ${mandir}/man1/dropdb.* \
+    ${mandir}/man1/droplang.*   ${mandir}/man1/dropuser.* \
+    ${mandir}/man1/pg_dump.*    ${mandir}/man1/pg_dumpall.* \
+    ${mandir}/man1/pg_restore.* ${mandir}/man1/psql.* \
+    ${mandir}/man1/reindexdb.*  ${mandir}/man1/vacuumdb.* \
+    ${mandir}/man7/* \
+"
+
+FILES_${PN}-doc += "${docdir}/${BPN}/html ${libdir}/${BPN}/tutorial/ \
+    ${mandir}/man1/initdb.* ${mandir}/man1/pg_controldata.* \
+    ${mandir}/man1/pg_ctl.* ${mandir}/man1/pg_resetxlog.* \
+    ${mandir}/man1/postgres.* ${mandir}/man1/postmaster.* \
+"
 
-FILES_${PN}-doc += "${prefix}/doc/"
-FILES_${PN}-timezone = "${datadir}/${PN}/timezone"
-FILES_${PN}-server-dev = "${includedir}/${PN}/server"
+FILES_${PN}-timezone = "${datadir}/${BPN}/timezone \
+    ${datadir}/${BPN}/timezonesets \
+"
+RDEPENDS_${PN} += "${PN}-timezone"
+FILES_${PN}-server-dev = "${includedir}/${BPN}/server"
 
 FILES_libecpg = "${libdir}/libecpg*${SOLIBS}"
 FILES_libecpg-dbg = "${libdir}/.debug/libecpg*"
 FILES_libecpg-dev = "${libdir}/libecpg*${SOLIBSDEV} \
                      ${libdir}/libpgtypes*${SOLIBSDEV} \
-                     ${includedir}/ecpg*.h ${includedir}/${PN}/ecpg*.h \
-                     ${includedir}/pgtypes*.h ${includedir}/${PN}/informix \
+                     ${includedir}/ecpg*.h ${includedir}/${BPN}/ecpg*.h \
+                     ${includedir}/pgtypes*.h ${includedir}/${BPN}/informix \
                      ${includedir}/sql3types.h ${includedir}/sqlca.h"
+FILES_libecpg-doc = "${mandir}/man1/ecpg.*"
 FILES_libecpg-staticdev = "${libdir}/libecpg*.a"
 SECTION_libecpg-staticdev = "devel"
 RDEPENDS_libecpg-staticdev = "libecpg-dev (= ${EXTENDPKGV})"
 
 FILES_libpq = "${libdir}/libpq*${SOLIBS}"
-FILES_libpq-dbg = "${libdir}/.debug/libpq* ${libdir}/${PN}/pgxs/src/test/regress/.debug/*"
+FILES_libpq-dbg = "${libdir}/.debug/libpq* ${libdir}/${BPN}/pgxs/src/test/regress/.debug/*"
 FILES_libpq-dev = "${libdir}/libpq*${SOLIBSDEV} \
                    ${includedir}"
-FILES_libpq-staticdev = "${libdir}/libpq*.a"
+FILES_libpq-staticdev = "${libdir}/libpq*.a ${libdir}/libpgport.a"
 SECTION_libpq-staticdev = "devel"
 RDEPENDS_libpq-staticdev = "libpq-dev (= ${EXTENDPKGV})"
 
 FILES_libecpg-compat = "${libdir}/libecpg_compat*${SOLIBS}"
 FILES_libecpg-compat-dbg = "${libdir}/.debug/libecpg_compat*"
+FILES_libecpg-compat-dev = "${libdir}/libecpg_compat*${SOLIBS}"
 FILES_libpgtypes = "${libdir}/libpgtypes*${SOLIBS}"
 FILES_libpgtypes-dbg = "${libdir}/.debug/libpgtypes*"
+FILES_libpgtypes-staticdev = "${libdir}/libpgtypes*.a"
+FILES_libpgtypes-dev = "${libdir}/libpgtypes*${SOLIBS} ${includedir}/pgtypes*.h"
+
+FILES_${PN}-contrib = " ${bindir}/oid2name ${bindir}/pg_standby \
+    ${bindir}/pgbench ${bindir}/vacuumlo \
+    ${S}/contrib/spi/*.example \
+    ${libdir}/${BPN}/_int.so ${libdir}/${BPN}/adminpack.so \
+    ${libdir}/${BPN}/autoinc.so ${libdir}/${BPN}/auto_explain.so \
+    ${libdir}/${BPN}/auth_delay.so ${libdir}/${BPN}/btree_gin.so \
+    ${libdir}/${BPN}/btree_gist.so ${libdir}/${BPN}/.so \
+    ${libdir}/${BPN}/chkpass.so ${libdir}/${BPN}/citext.so \
+    ${libdir}/${BPN}/cube.so ${libdir}/${BPN}/dblink.so \
+    ${libdir}/${BPN}/dict_int.so ${libdir}/${BPN}/dict_xsyn.so \
+    ${libdir}/${BPN}/dummy_seclabel.so ${libdir}/${BPN}/earthdistance.so \
+    ${libdir}/${BPN}/file_fdw.so ${libdir}/${BPN}/fuzzystrmatch.so \
+    ${libdir}/${BPN}/hstore.so ${libdir}/${BPN}/insert_username.so \
+    ${libdir}/${BPN}/isn.so ${libdir}/${BPN}/lo.so \
+    ${libdir}/${BPN}/ltree.so ${libdir}/${BPN}/moddatetime.so \
+    ${libdir}/${BPN}/pageinspect.so ${libdir}/${BPN}/pg_buffercache.so \
+    ${libdir}/${BPN}/pg_freespacemap.so ${libdir}/${BPN}/pg_trgm.so \
+    ${libdir}/${BPN}/pgcrypto.so ${libdir}/${BPN}/pgrowlocks.so \
+    ${libdir}/${BPN}/pgstattuple.so ${libdir}/${BPN}/pg_stat_statements.so \
+    ${libdir}/${BPN}/refint.so ${libdir}/${BPN}/seg.so \
+    ${libdir}/${BPN}/sslinfo.so \
+    ${libdir}/${BPN}/tablefunc.so \
+    ${libdir}/${BPN}/test_parser.so ${libdir}/${BPN}/timetravel.so \
+    ${libdir}/${BPN}/tsearch2.so ${libdir}/${BPN}/uuid-ossp.so \
+    ${libdir}/${BPN}/pgxml.so ${libdir}/${BPN}/passwordcheck.so \
+    ${libdir}/${BPN}/pg_upgrade_support.so ${libdir}/${BPN}/.so \
+    ${libdir}/${BPN}/unaccent.so \
+"
+FILES_${PN}-contrib-dbg = " \
+    ${libdir}/${BPN}/.debug/_int.so ${libdir}/${BPN}/.debug/adminpack.so \
+    ${libdir}/${BPN}/.debug/autoinc.so ${libdir}/${BPN}/.debug/auto_explain.so \
+    ${libdir}/${BPN}/.debug/auth_delay.so ${libdir}/${BPN}/.debug/btree_gin.so \
+    ${libdir}/${BPN}/.debug/btree_gist.so ${libdir}/${BPN}/.debug/.so \
+    ${libdir}/${BPN}/.debug/chkpass.so ${libdir}/${BPN}/.debug/citext.so \
+    ${libdir}/${BPN}/.debug/cube.so ${libdir}/${BPN}/.debug/dblink.so \
+    ${libdir}/${BPN}/.debug/dict_int.so ${libdir}/${BPN}/.debug/dict_xsyn.so \
+    ${libdir}/${BPN}/.debug/dummy_seclabel.so \
+    ${libdir}/${BPN}/.debug/earthdistance.so \
+    ${libdir}/${BPN}/.debug/file_fdw.so ${libdir}/${BPN}/.debug/fuzzystrmatch.so \
+    ${libdir}/${BPN}/.debug/hstore.so ${libdir}/${BPN}/.debug/insert_username.so \
+    ${libdir}/${BPN}/.debug/isn.so ${libdir}/${BPN}/.debug/lo.so \
+    ${libdir}/${BPN}/.debug/ltree.so ${libdir}/${BPN}/.debug/moddatetime.so \
+    ${libdir}/${BPN}/.debug/pageinspect.so \
+    ${libdir}/${BPN}/.debug/pg_buffercache.so \
+    ${libdir}/${BPN}/.debug/pg_freespacemap.so \
+    ${libdir}/${BPN}/.debug/pg_trgm.so \
+    ${libdir}/${BPN}/.debug/pgcrypto.so ${libdir}/${BPN}/.debug/pgrowlocks.so \
+    ${libdir}/${BPN}/.debug/pgstattuple.so \
+    ${libdir}/${BPN}/.debug/pg_stat_statements.so \
+    ${libdir}/${BPN}/.debug/refint.so ${libdir}/${BPN}/.debug/seg.so \
+    ${libdir}/${BPN}/.debug/sslinfo.so \
+    ${libdir}/${BPN}/.debug/tablefunc.so \
+    ${libdir}/${BPN}/.debug/test_parser.so ${libdir}/${BPN}/.debug/timetravel.so \
+    ${libdir}/${BPN}/.debug/tsearch2.so ${libdir}/${BPN}/.debug/uuid-ossp.so \
+    ${libdir}/${BPN}/.debug/pgxml.so ${libdir}/${BPN}/.debug/passwordcheck.so \
+    ${libdir}/${BPN}/.debug/pg_upgrade_support.so \
+    ${libdir}/${BPN}/.debug/unaccent.so \
+"
+DESCRIPTION_${PN}-contrib = "The postgresql-contrib package contains \
+    contributed packages that are included in the PostgreSQL distribution."
+
+FILES_${PN}-pltcl = "${libdir}/${BPN}/pltcl.so ${bindir}/pltcl_delmod \
+    ${binddir}/pltcl_listmod ${bindir}/pltcl_loadmod  \
+    ${datadir}/${BPN}/unknown.pltcl"
+FILES_${PN}-pltcl-dbg = "${libdir}/${BPN}/.debug/pltcl.so"
+SUMMARY_${PN}-pltcl = "The Tcl procedural language for PostgreSQL"
+DESCRIPTION_${PN}-pltcl = "PostgreSQL is an advanced Object-Relational \
+    database management system.  The postgresql-pltcl package contains the PL/Tcl \
+    procedural language for the backend."
+
+FILES_${PN}-plperl = "${libdir}/${BPN}/plperl.so"
+FILES_${PN}-plperl-dbg = "${libdir}/${BPN}/.debug/plperl.so"
+SUMMARY_${PN}-plperl = "The Perl procedural language for PostgreSQL"
+DESCRIPTION_${PN}-plperl = "PostgreSQL is an advanced Object-Relational \
+    database management system.  The postgresql-plperl package contains the \
+    PL/Perl procedural language for the backend."
+
+# In version 8, it will be plpython.so
+# In version 9, it might be plpython{2,3}.so depending on python2 or 3
+FILES_${PN}-plpython = "${libdir}/${BPN}/plpython*.so"
+FILES_${PN}-plpython-dbg = "${libdir}/${BPN}/.debug/plpython*.so"
+SUMMARY_${PN}-plpython = "The Python procedural language for PostgreSQL"
+DESCRIPTION_${PN}-plpython = "PostgreSQL is an advanced Object-Relational \
+    database management system.  The postgresql-plpython package contains \
+    the PL/Python procedural language for the backend."
-- 
1.7.9.5


