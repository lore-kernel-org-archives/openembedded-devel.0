Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 903DA71F23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Dec 2014 05:16:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44927635"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Dec 2014 13:13:13 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBC5G8sY017150
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Dec 2014 13:16:08 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 12 Dec 2014 13:16:32 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 12 Dec 2014 13:15:32 +0800
Message-ID: <1418361332-6457-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [meta-oe][PATCH] openwbem: add new recipe
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
X-List-Received-Date: Fri, 12 Dec 2014 05:16:36 -0000
Content-Type: text/plain

OpenWBEM is a set of software components that help facilitate
deployment of the Common Information Model (CIM) and Web-Based
Enterprise Management (WBEM) technologies of the Distributed Management
Task Force (DMTF).

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../openwbem/openwbem/checkserverkey               |  20 ++++
 .../recipes-support/openwbem/openwbem/loadmof.sh   | 118 +++++++++++++++++++
 .../openwbem/openwbem/novell-openwbem-root-acl.mof |  21 ++++
 .../openwbem/openwbem/openwbem-etc_pam.d_openwbem  |   7 ++
 .../openwbem/openwbem/openwbem-owcimomd.init       | 131 +++++++++++++++++++++
 .../openwbem/openwbem/openwbem-rpmlintrc           |   2 +
 .../openwbem/openwbem/owcimomd.service             |  12 ++
 meta-oe/recipes-support/openwbem/openwbem/rmmof.sh |  53 +++++++++
 meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb | 112 ++++++++++++++++++
 9 files changed, 476 insertions(+)
 create mode 100644 meta-oe/recipes-support/openwbem/openwbem/checkserverkey
 create mode 100644 meta-oe/recipes-support/openwbem/openwbem/loadmof.sh
 create mode 100644 meta-oe/recipes-support/openwbem/openwbem/novell-openwbem-root-acl.mof
 create mode 100644 meta-oe/recipes-support/openwbem/openwbem/openwbem-etc_pam.d_openwbem
 create mode 100644 meta-oe/recipes-support/openwbem/openwbem/openwbem-owcimomd.init
 create mode 100644 meta-oe/recipes-support/openwbem/openwbem/openwbem-rpmlintrc
 create mode 100644 meta-oe/recipes-support/openwbem/openwbem/owcimomd.service
 create mode 100644 meta-oe/recipes-support/openwbem/openwbem/rmmof.sh
 create mode 100644 meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb

diff --git a/meta-oe/recipes-support/openwbem/openwbem/checkserverkey b/meta-oe/recipes-support/openwbem/openwbem/checkserverkey
new file mode 100644
index 0000000..bcfa361
--- /dev/null
+++ b/meta-oe/recipes-support/openwbem/openwbem/checkserverkey
@@ -0,0 +1,20 @@
+#!/bin/bash
+
+if [ ! -f "/etc/openwbem/serverkey.pem" ]; then
+	if [ -f "/etc/ssl/servercerts/servercert.pem" \
+	     -a -f "/etc/ssl/servercerts/serverkey.pem" ]; then
+		echo "Using common server certificate /etc/ssl/servercerts/servercert.pem"
+		ln -s /etc/ssl/servercerts/server{cert,key}.pem /etc/openwbem/
+	else
+		echo "FAILED: Starting OpenWBEM server"
+		echo "There is no ssl server key available for OpenWBEM server to use."
+		echo -e "Please generate one with the following script and start the OpenWBEM service again:\n"
+		echo "##################################"
+		echo "/etc/openwbem/owgencert"
+		echo "================================="
+
+		echo "NOTE: The script uses /dev/random device for generating some random bits while generating the server key."
+		echo "      If this takes too long, you can replace the value of \"RANDFILE\" in /etc/openwsman/ssleay.cnf with /dev/urandom. Please understand the implications"
+		exit 1
+	fi
+fi
diff --git a/meta-oe/recipes-support/openwbem/openwbem/loadmof.sh b/meta-oe/recipes-support/openwbem/openwbem/loadmof.sh
new file mode 100644
index 0000000..dd87811
--- /dev/null
+++ b/meta-oe/recipes-support/openwbem/openwbem/loadmof.sh
@@ -0,0 +1,118 @@
+#!/bin/sh
+# 
+# options:
+# loadmof.sh <MOF_PATH> <NAMESPACE> <FILES>
+#
+# - or -
+#
+# options:
+# loadmof.sh -n <NAMESPACE> <FILES> [...]
+#
+# The former is preserved for compatibility with Pegasus and 
+# sblim providers.  The latter is preferred.  If $1 is "-n",
+# the latter code path is executed.  Otherwise the former is 
+# executed.
+
+if [ "x$1" != "x-n" -a "x$1" != "x-v" ]; then
+# OLD STYLE
+if [ -f "/etc/init.d/owcimomd" ]; then
+    /etc/init.d/owcimomd status 1>&2 > /dev/null
+    if [ $? = "0" ]; then
+        CIMOM_RUNNING="true"
+    else
+        CIMOM_RUNNING="false"
+    fi
+else
+    exit 1
+fi
+if [ "$YAST_IS_RUNNING" = "instsys" ]; then
+  CIMOM_RUNNING="false"
+fi
+
+CIMOM=$1
+shift
+case "$CIMOM" in
+    pegasus)
+        exit 0
+    ;;
+esac
+MOF_PATH=$1
+shift
+NS=$1
+shift
+
+REPOSITORY="/var/lib/openwbem"
+#tmp_dir=`mktemp -d -p /tmp openwbem.XXXXXX`
+case "$CIMOM_RUNNING" in 
+    true|false)
+    while [ "$#" -gt 0 ]
+    do
+        echo "Loading $MOF_PATH/$1"
+        #sed "s/cmpi:/cmpi::/g" $MOF_PATH/$1 > $tmp_dir/$1
+        /usr/bin/owmofc -c -n  $NS -d $REPOSITORY $MOF_PATH/$1 > /dev/null 2>&1
+        shift
+    done
+    ;;
+esac
+#rm -rf $tmp_dir
+# END OLD STYLE
+
+else
+# NEW STYLE
+if [ "x$3" = "x" ]; then
+    echo "Usage: $0 -n <NAMESPACE> <FILES> [...]"
+    exit 1
+fi
+
+if [ "x$1" = "x-v" ]; then
+  VERBOSE=1
+  shift
+fi
+
+# get rid of "-n" arg
+shift 
+
+NS="$1"
+
+shift 
+
+DBDIR=/var/lib/openwbem
+LOGFILE=$DBDIR/loadmof.log
+CIMOM_INIT=/etc/init.d/owcimomd
+if [ "$YAST_IS_RUNNING" != "instsys" ] ; then
+    $CIMOM_INIT status > /dev/null 2>&1
+    CIMOM_RUNNING=$?
+fi
+if [ "x$CIMOM_RUNNING" = "x0"  ]; then
+  $CIMOM_INIT stop > /dev/null 2>&1
+fi
+bkpdir=$DBDIR/backup-$$
+mkdir $bkpdir
+cp -a $DBDIR/*.{dat,ndx,lock} $bkpdir/
+rm -f $LOGFILE.9
+for i in 8 7 6 5 4 3 2 1 0; do
+  let newI=$i+1
+  if [ -f $LOGFILE.$i ]; then
+    mv $LOGFILE.$i $LOGFILE.$newI
+  fi
+done
+if [ -f $LOGFILE ]; then
+  mv $LOGFILE $LOGFILE.0
+fi
+if [ "x$VERBOSE" = "x1" ]; then
+  /usr/bin/owmofc -c -n $NS -d $DBDIR -s /usr/share/mof/cim-current "$@" 2>&1 | tee $LOGFILE
+else
+  /usr/bin/owmofc -c -n $NS -d $DBDIR -s /usr/share/mof/cim-current "$@" > $LOGFILE 2>&1
+fi
+RVAL=$?
+if [ "x$RVAL" != "x0" ]; then
+  echo "MOF import failed!  Check $LOGFILE for details."
+  mv $bkpdir/* $DBDIR/
+fi
+rm -rf $bkpdir
+if [ "x$CIMOM_RUNNING" = "x0"  ]; then
+  $CIMOM_INIT start > /dev/null 2>&1
+fi
+exit $RVAL
+fi
+
diff --git a/meta-oe/recipes-support/openwbem/openwbem/novell-openwbem-root-acl.mof b/meta-oe/recipes-support/openwbem/openwbem/novell-openwbem-root-acl.mof
new file mode 100644
index 0000000..c9970c7
--- /dev/null
+++ b/meta-oe/recipes-support/openwbem/openwbem/novell-openwbem-root-acl.mof
@@ -0,0 +1,21 @@
+#pragma namespace("root/security")
+
+instance of OpenWBEM_NamespaceACL
+{
+	nspace = "root";
+	capability = "";
+};
+
+instance of OpenWBEM_NamespaceACL
+{
+	nspace = "root/cimv2";
+	capability = "";
+};
+
+instance of OpenWBEM_UserACL
+{
+	nspace = "root/cimv2";
+	username = "root";
+	capability = "rw";
+};
+
diff --git a/meta-oe/recipes-support/openwbem/openwbem/openwbem-etc_pam.d_openwbem b/meta-oe/recipes-support/openwbem/openwbem/openwbem-etc_pam.d_openwbem
new file mode 100644
index 0000000..b3785aa
--- /dev/null
+++ b/meta-oe/recipes-support/openwbem/openwbem/openwbem-etc_pam.d_openwbem
@@ -0,0 +1,7 @@
+#%PAM-1.0
+auth       required	pam_unix2.so	nullok
+auth       required	pam_nologin.so
+account    required	pam_unix2.so
+password   required	pam_pwcheck.so	nullok
+password   required	pam_unix2.so	nullok use_first_pass use_authtok
+session    required	pam_unix2.so	none
diff --git a/meta-oe/recipes-support/openwbem/openwbem/openwbem-owcimomd.init b/meta-oe/recipes-support/openwbem/openwbem/openwbem-owcimomd.init
new file mode 100644
index 0000000..47fa8a7
--- /dev/null
+++ b/meta-oe/recipes-support/openwbem/openwbem/openwbem-owcimomd.init
@@ -0,0 +1,131 @@
+#!/bin/sh
+#
+### BEGIN INIT INFO
+# Provides: owcimomd
+# Required-Start: $network
+# Required-Stop: $network
+# Default-Start: 2 3 4 5
+# Default-Stop: 0 1 6 
+# Short-Description: OpenWBEM CIMOM Daemon
+# Description: owcimomd
+#       Start/Stop the OpenWBEM CIMOM Daemon
+### END INIT INFO
+#
+#
+# chkconfig: 2345 36 64
+# description: OpenWBEM CIMOM Daemon
+# processname: owcimomd
+
+NAME=owcimomd
+DAEMON=/usr/sbin/$NAME
+OPTIONS=
+PIDFILE=/var/run/$NAME.pid
+
+if [ $EUID != 0 ]; then
+ echo "This script must be run as root."
+ exit 1;
+fi
+
+if [ "$DESCRIPTIVE" = "" ]; then
+ DESCRIPTIVE="OpenWBEM CIMOM Daemon"
+fi
+
+lockfile=${SVIlock:-/var/lock/subsys/$NAME}
+
+[ -x $DAEMON ] || exit 0
+
+# See how we were called.
+. /etc/init.d/functions
+
+start() {
+    if [ ! -f "/etc/openwbem/serverkey.pem" ]; then
+        if [ -f "/etc/ssl/servercerts/servercert.pem" \
+                -a -f "/etc/ssl/servercerts/serverkey.pem" ]; then
+            echo "Using common server certificate /etc/ssl/servercerts/servercert.pem"
+            ln -s /etc/ssl/servercerts/server{cert,key}.pem /etc/openwbem/
+        else
+            echo "Generating OpenWBEM server public certificate and private key"
+            FQDN=`hostname --fqdn`
+            if [ "x${FQDN}" = "x" ]; then
+                FQDN=localhost.localdomain
+            fi
+cat << EOF | sh /etc/openwbem/owgencert > /dev/null 2>&1
+--
+SomeState
+SomeCity
+SomeOrganization
+SomeOrganizationalUnit
+${FQDN}
+root@${FQDN}
+EOF
+        fi
+    fi
+
+    # Start daemons.
+    echo -n "Starting the $DESCRIPTIVE"
+    daemon $DAEMON $OPTIONS > /dev/null 2>&1 
+    RETVAL=$?
+
+    if [ $RETVAL -eq 0 ]; then
+        touch $lockfile
+        success
+    fi
+
+    echo
+    return $RETVAL
+}
+
+stop() {
+    # Stop daemons.
+    echo -n "Shutting down $DESCRIPTIVE"
+    killproc $DAEMON
+    RETVAL=$?
+
+    if [ $RETVAL -eq 0 ]; then
+        rm -f $lockfile
+        success
+    else
+        failure
+    fi
+    echo
+    return $RETVAL
+}
+
+restart() {
+    stop
+    start
+}
+
+case "$1" in
+    start)
+    start
+    ;;
+
+    stop)
+    stop
+    ;;
+
+    restart|force-reload)
+    restart
+    ;;
+
+    reload)
+    echo -n "Reload service $DESCRIPTIVE"
+    killproc -p $PIDFILE  -HUP $DAEMON
+    RETVAL=$?
+    echo
+    exit $RETVAL
+    ;;
+
+    status)
+    echo -n "Checking for service $DESCRIPTIVE"
+    status $DAEMON
+    RETVAL=$?
+    exit $RETVAL
+    ;;
+
+    *)
+    echo "Usage: $0 {restart|start|stop|reload|force-reload|status}"
+esac
+
+exit $RETVAL
diff --git a/meta-oe/recipes-support/openwbem/openwbem/openwbem-rpmlintrc b/meta-oe/recipes-support/openwbem/openwbem/openwbem-rpmlintrc
new file mode 100644
index 0000000..785e32a
--- /dev/null
+++ b/meta-oe/recipes-support/openwbem/openwbem/openwbem-rpmlintrc
@@ -0,0 +1,2 @@
+addFilter("devel-file-in-non-devel-package .*/lib.*\.so")
+
diff --git a/meta-oe/recipes-support/openwbem/openwbem/owcimomd.service b/meta-oe/recipes-support/openwbem/openwbem/owcimomd.service
new file mode 100644
index 0000000..c6694b7
--- /dev/null
+++ b/meta-oe/recipes-support/openwbem/openwbem/owcimomd.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Web Based Enterprise Management (WBEM) Implementation
+After=syslog.target
+
+[Service]
+Type=forking
+ExecStart=/usr/sbin/owcimomd
+ExecStartPre=/etc/openwbem/checkserverkey
+PIDFile=/var/run/owcimomd.pid
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/openwbem/openwbem/rmmof.sh b/meta-oe/recipes-support/openwbem/openwbem/rmmof.sh
new file mode 100644
index 0000000..a495415
--- /dev/null
+++ b/meta-oe/recipes-support/openwbem/openwbem/rmmof.sh
@@ -0,0 +1,53 @@
+#!/bin/sh
+# 
+# options:
+# rmmof.sh <MOF_PATH> <NAMESPACE> <FILES>
+#
+# - or -
+#
+# options:
+# loadmof.sh -n <NAMESPACE> <FILES> [...]
+#
+# The former is preserved for compatibility with Pegasus and 
+# sblim providers.  The latter is preferred.  If $1 is "-n",
+# the latter code path is executed.  Otherwise the former is 
+# executed.
+
+if [ "x$3" = "x" ]; then
+    echo "Usage: $0 -n <NAMESPACE> <FILES> [...]"
+    exit 1
+fi
+
+# get rid of "-n" arg
+shift 
+
+NS="$1"
+
+shift 
+
+DBDIR=/var/lib/openwbem
+CIMOM_INIT=/etc/init.d/owcimomd
+if [ "$YAST_IS_RUNNING" != "instsys" ] ; then
+    $CIMOM_INIT status
+    CIMOM_RUNNING=$?
+fi
+if [ "x$CIMOM_RUNNING" = "x0"  ]; then
+  $CIMOM_INIT stop
+fi
+bkpdir=/tmp/owrep.bkp-$$
+mkdir $bkpdir
+cp -a $DBDIR $bkpdir/
+echo "Compiling MOF files"
+/usr/bin/owmofc -r -n $NS -d $DBDIR "$@" > /dev/null 2>&1
+RVAL=$?
+if [ "x$RVAL" != "x0" ]; then
+  echo "MOF import failed!"
+  rm -rf $DBDIR
+  mv $bkpdir/openwbem $DBDIR
+fi
+rm -rf $bkpdir
+if [ "x$CIMOM_RUNNING" = "x0"  ]; then
+  $CIMOM_INIT start
+fi
+exit $RVAL
+
diff --git a/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb b/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb
new file mode 100644
index 0000000..1b18632
--- /dev/null
+++ b/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb
@@ -0,0 +1,112 @@
+SUMMARY = "Web Based Enterprise Management (WBEM) Implementation"
+DESCRIPTION = "OpenWBEM is a set of software components that help facilitate \
+deployment of the Common Information Model (CIM) and Web-Based \
+Enterprise Management (WBEM) technologies of the Distributed Management \
+Task Force (DMTF). \
+ \
+Web-Based Enterprise Management (WBEM) is a set of management and \
+Internet standard technologies developed to unify the management of \
+distributed computing environments. WBEM provides the ability for the \
+industry to deliver a well-integrated set of standards-based management \
+tools, facilitating the exchange of data across otherwise disparate \
+technologies and platforms. \
+ \
+For more information about DMTF and its technologies, visit \
+http://www.dmtf.org/standards. "
+SECTION = "System/Management"
+HOMEPAGE = "http://openwbem.sourceforge.net/"
+
+inherit autotools-brokensep pkgconfig
+
+SOURCE1="novell-openwbem-root-acl.mof"
+SOURCE2="loadmof.sh"
+SOURCE3="rmmof.sh"
+SOURCE4="openwbem-owcimomd.init"
+SOURCE5="openwbem-etc_pam.d_openwbem"
+SOURCE6="openwbem-rpmlintrc"
+
+SRC_URI = " \
+   git://github.com/kkaempf/openwbem.git \
+   file://${SOURCE1} \
+   file://${SOURCE2} \
+   file://${SOURCE3} \
+   file://${SOURCE4} \
+   file://${SOURCE5} \
+   file://${SOURCE6} \
+   file://checkserverkey \
+   file://owcimomd.service \
+"
+SRCREV = "5c688eefc1f8e35a4b1c58529aae5f114c25c2a8"
+S = "${WORKDIR}/git"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM += "file://COPYING;md5=0504a2eb85e01aa92c9efd4125a34660"
+INSANE_SKIP_${PN} = "dev-so"
+DEPENDS += "openssl libpam bash"
+RDEPENDS_${PN} += "bash"
+EXTRA_OECONF = " \
+    --prefix=/usr \
+    --sysconfdir=/etc \
+    --libdir=${libdir} \
+    --localstatedir=/var/lib \
+    --libexecdir=${libdir}/openwbem/bin \
+    --mandir=/usr/share/man \
+    --enable-threads-run-as-user \
+"
+do_configure_prepend() {
+    autoreconf --force --install
+}
+
+do_install() {
+    oe_runmake DESTDIR=${D} install
+    install -d ${D}/etc/openwbem/openwbem.conf.d
+    install -d ${D}/var/adm/fillup-templates
+    install -m 644 etc/sysconfig/daemons/owcimomd ${D}/var/adm/fillup-templates/sysconfig.owcimomd
+    
+    # fix up hardcoded paths
+    sed -i -e 's,/usr/sbin/,${sbindir}/,' ${WORKDIR}/owcimomd.service
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}/${systemd_unitdir}/system
+        install -m 644 ${WORKDIR}/owcimomd.service ${D}/${systemd_unitdir}/system
+        install -m 755 ${WORKDIR}/checkserverkey ${D}${sysconfdir}/openwbem/
+    fi
+
+    install -d ${D}/etc/init.d
+    ln -sf ../../etc/init.d/owcimomd ${D}/usr/sbin/rcowcimomd
+    install -m 755 ${WORKDIR}/${SOURCE4} ${D}/etc/init.d/owcimomd
+    install -d ${D}${sbindir}
+    install -d ${D}/usr/bin
+    install -d ${D}/etc/pam.d
+    install -d ${D}/${libdir}/openwbem/cmpiproviders
+    install -m 644 etc/pam.d/openwbem ${D}/etc/pam.d
+    install -d ${D}/${libdir}/openwbem/c++providers
+    install -d ${D}/var/lib/openwbem
+    install -m 755 ${WORKDIR}/${SOURCE2} ${D}/usr/bin/ow-loadmof.sh
+    install -m 755 ${WORKDIR}/${SOURCE3} ${D}/usr/bin/ow-rmmof.sh
+    install -m 644 ${WORKDIR}/${SOURCE5} ${D}/etc/pam.d/openwbem
+
+    MOFPATH=${D}/usr/share/mof/openwbem
+    install -d $MOFPATH
+    mv ${D}/usr/share/openwbem/* $MOFPATH/
+    rmdir ${D}/usr/share/openwbem
+    install -m 644 ${WORKDIR}/${SOURCE1} $MOFPATH/
+
+    touch ${D}/var/lib/openwbem/{classassociation,instances,instassociation,namespaces,schema}.{dat,ndx,lock}
+}
+
+inherit ${@base_contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','', d)}
+SYSTEMD_SERVICE_${PN} = "owcimomd.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+FILES_${PN} += " \
+    ${libdir} \
+    ${datadir}/mof \
+    ${systemd_unitdir} \
+"
+FILES_${PN}-dbg += " \
+    ${libdir}/openwbem/c++providers/.debug \
+    ${libdir}/openwbem/provifcs/.debug \
+    ${libdir}/openwbem/bin/openwbem/.debug \
+"
+FILES_${PN}-dev = " \
+    ${includedir} \
+    ${datadir}/aclocal/openwbem.m4 \
+"
-- 
1.8.4.2


