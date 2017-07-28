Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 20A5D78427
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jul 2017 07:42:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6S7gSIf010149
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jul 2017 00:42:28 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Fri, 28 Jul 2017 00:42:27 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Jul 2017 15:42:51 +0800
Message-ID: <1501227771-18322-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [meta-networking][PATCH] ntop: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Jul 2017 07:42:27 -0000
Content-Type: text/plain

ntop is a tool that shows the network usage, similar to what the popular
top Unix command does. ntop is based on pcapture and it has been written
in a portable way in order to virtually run on every Unix platform.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-support/ntop/ntop.inc      | 131 ++++++++++++
 .../recipes-support/ntop/ntop/ntop.service         |  15 ++
 .../ntop/ntop/ntop_configure_in.patch              | 164 +++++++++++++++
 .../ntop_configure_in_net_snmp_config_exist.patch  |  21 ++
 .../recipes-support/ntop/ntop/ntop_init.patch      | 228 +++++++++++++++++++++
 .../ntop/ntop/ntop_webInterface.patch              |  19 ++
 .../recipes-support/ntop/ntop/support-arm64.patch  |  28 +++
 .../ntop/ntop/use-static-inline.patch              |  32 +++
 meta-networking/recipes-support/ntop/ntop_5.0.1.bb |   4 +
 9 files changed, 642 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntop/ntop.inc
 create mode 100644 meta-networking/recipes-support/ntop/ntop/ntop.service
 create mode 100644 meta-networking/recipes-support/ntop/ntop/ntop_configure_in.patch
 create mode 100644 meta-networking/recipes-support/ntop/ntop/ntop_configure_in_net_snmp_config_exist.patch
 create mode 100644 meta-networking/recipes-support/ntop/ntop/ntop_init.patch
 create mode 100644 meta-networking/recipes-support/ntop/ntop/ntop_webInterface.patch
 create mode 100644 meta-networking/recipes-support/ntop/ntop/support-arm64.patch
 create mode 100644 meta-networking/recipes-support/ntop/ntop/use-static-inline.patch
 create mode 100644 meta-networking/recipes-support/ntop/ntop_5.0.1.bb

diff --git a/meta-networking/recipes-support/ntop/ntop.inc b/meta-networking/recipes-support/ntop/ntop.inc
new file mode 100644
index 0000000..b964334
--- /dev/null
+++ b/meta-networking/recipes-support/ntop/ntop.inc
@@ -0,0 +1,131 @@
+SUMMARY = "ntop is network top"
+DESCRIPTION = "ntop is a network traffic probe that shows the network usage, \
+similar to what the popular top Unix command does."
+
+SECTION = "console/network"
+
+LICENSE = "GPLv2+ & GPLv3 & OpenSSL"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LICENSE-OpenSSL.txt;md5=a409f902e447ddd889cffa0c70e7c7c2 \
+                   "
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/ntop/ntop-${PV}.tar.gz \
+           file://ntop_configure_in.patch \
+           file://ntop_init.patch \
+           file://ntop_webInterface.patch \
+           file://ntop_configure_in_net_snmp_config_exist.patch \
+           file://ntop.service \
+           file://use-static-inline.patch \
+           file://support-arm64.patch \
+          "
+
+inherit autotools-brokensep useradd pythonnative pkgconfig systemd
+
+DEPENDS = "geoip rrdtool python zlib libpcap gdbm"
+
+PACKAGECONFIG ??= "openssl snmp plugins"
+PACKAGECONFIG[openssl] = "--with-ssl, --without-ssl, openssl, openssl"
+PACKAGECONFIG[snmp] = "--enable-snmp=yes NETSNMP=${STAGING_BINDIR_CROSS}/net-snmp-config, \
+--disable-snmp,net-snmp,"
+PACKAGECONFIG[plugins] = "--enable-plugins=yes, --disable-plugins, ,"
+
+EXTRA_OECONF += "ac_cv_file_aclocal_m4=yes ac_cv_file_depcomp=no"
+
+do_configure() {
+    cp ${STAGING_DATADIR_NATIVE}/aclocal/libtool.m4 libtool.m4.in
+    cat acinclude.m4.in acinclude.m4.ntop libtool.m4.in > acinclude.m4
+    cp 3rd_party/* ./
+
+    # config nDPI
+    cd nDPI
+    ./configure ${CONFIGUREOPTS} --with-pic
+    cd ..
+
+    sed -i -e 's:^CFG_DBFILE_DIR=$localstatedir/ntop:CFG_DBFILE_DIR=$localstatedir/lib/ntop:' ${S}/configure.in
+
+    # fix the CFLAGS, CPPFLAGS, LDFLAGS, remove the host include
+    sed -i \
+        -e 's:\(^CFLAGS="\$.*\) -I/usr/local/include -I/opt/local/include":\1":' \
+        -e 's:\(^CPPFLAGS="\$.*\) -I/usr/local/include -I/opt/local/include":\1":' \
+        -e 's:\(^LDFLAGS="\$.*\) -L/usr/local/lib -L/opt/local/lib":\1":' \
+        ${S}/configure.in
+
+    # replace the DISTRO RELEASE in configure.in which are host's
+    # with our release, although those doesn't affect functionality
+    sed -i -e \
+        '/DEFINEOS="LINUX"/{N;s/DISTRO=.*/DISTRO="${DISTRO}"/;N;s/RELEASE=.*/RELEASE="${DISTRO_VERSION}"/;}' \
+        ${S}/configure.in
+
+    # osName in original configure.in should be ${TARGET_SYS}
+    # which will show in ntop's "show configuration"
+    sed -i -e \
+        's:^osName=.*:osName=${TARGET_SYS}:' \
+        ${S}/configure.in
+
+    # rename configureextra to configureextra_rename to avoid
+    # configure.in to guess host OS and pull in more configure, non needed
+    # which will cause some cross-compiling failure on specific host
+    # e.g. SUSE(SLED...)
+    test ! -f configureextra || mv -f configureextra configureextra_rename
+
+    # make sure configure finds python includdirs/libs with these envs
+    export BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+        STAGING_INCDIR=${STAGING_INCDIR} \
+        STAGING_LIBDIR=${STAGING_LIBDIR}
+
+    autotools_do_configure
+}
+
+do_compile_prepend() {
+    cd nDPI
+    oe_runmake
+    cd ..
+}
+
+do_install_append() {
+    # remove the empty dirs
+    rm -rf ${D}${libdir}/plugins
+
+    install -D -m 0755 ${S}/packages/RedHat/ntop.init \
+        ${D}${sysconfdir}/init.d/ntop
+    install -D -m 0644 ${S}/packages/RedHat/ntop.conf.sample \
+        ${D}${sysconfdir}/ntop.conf
+
+    # change ntop dir in ntop.conf
+    # don't use the -P as the ntop.init didn't support it
+    sed -i -e "s:^--db-file-path /usr/share/ntop:--db-file-path /var/lib/ntop:" \
+        -e "s:^#? -P /var/ntop:#? -P /var/lib/ntop:" \
+        ${D}${sysconfdir}/ntop.conf
+
+    # For systemd
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -D -m 0755 ${S}/packages/RedHat/ntop.init ${D}${libexecdir}/ntop-helper
+        install -D -m 0644 ${WORKDIR}/ntop.service ${D}${systemd_system_unitdir}/ntop.service
+        sed -i -e 's,@LIBEXECDIR@,${libexecdir},g' \
+            -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+            ${D}${systemd_system_unitdir}/ntop.service
+    fi
+
+    # Fix host-user-contaminated issue
+    chown -R root:root ${D}
+
+    chown -R ntop.ntop ${D}${datadir}/ntop
+    chown -R ntop:ntop ${D}${localstatedir}/lib/ntop
+}
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "-M -g ntop -r -d ${localstatedir}/lib/ntop \
+-s /usr/sbin/nologin -c 'ntop' ntop"
+GROUPADD_PARAM_${PN} = "-r ntop"
+
+SYSTEMD_SERVICE_${PN} = "ntop.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+FILES_${PN}_append = "${libdir}/ntop/plugins ${libdir}/libntop-*.so \
+                      ${libdir}/libntopreport-*.so ${libdir}/lib*-${PV}.so"
+FILES_${PN}-dev = "${includedir} ${libdir}/libntop.so \
+                   ${libdir}/libntopreport.so \
+                   ${libdir}/libnetflowPlugin.so ${libdir}/libsflowPlugin.so \
+                   ${libdir}/librrdPlugin.so \
+                   ${libdir}/*.a ${libdir}/libntopreport.a ${libdir}/*.la"
+
diff --git a/meta-networking/recipes-support/ntop/ntop/ntop.service b/meta-networking/recipes-support/ntop/ntop/ntop.service
new file mode 100644
index 0000000..1ead2a0
--- /dev/null
+++ b/meta-networking/recipes-support/ntop/ntop/ntop.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=A network traffic probe similar to the UNIX top command
+Requires=network.target
+
+ConditionPathExists=@SYSCONFDIR@/ntop.conf
+After=syslog.target network.target
+
+[Service]
+Type=oneshot
+RemainAfterExit=yes
+ExecStart=@LIBEXECDIR@/ntop-helper start
+ExecStop=@LIBEXECDIR@/ntop-helper stop
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-support/ntop/ntop/ntop_configure_in.patch b/meta-networking/recipes-support/ntop/ntop/ntop_configure_in.patch
new file mode 100644
index 0000000..392cb08
--- /dev/null
+++ b/meta-networking/recipes-support/ntop/ntop/ntop_configure_in.patch
@@ -0,0 +1,164 @@
+1)add --with-pcap-config option to use libpcap's pcap-config
+2)add AC_CHECK_LIB if user didn't specify PCAP_ROOT and pcap-config
+  put it before host check to make cross-compiling easier.
+  pcap doesn't need extra include and libs so it is fine.
+3)remove old rrd configure code but use pkg-config to config rrd
+  rrdtool should have the pkg-config file installed.
+4)fix python-config
+5)change AC_TRY_RUN to AC_COMPILE_IFELSE for pthread_rwlock_t checking
+6)fix a net-snmp-config bug
+
+Upstream-Status: Pending
+
+Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
+---
+diff --git a/configure.in b/configure.in
+index 0c7c0a5..cad40be 100644
+--- a/configure.in
++++ b/configure.in
+@@ -230,14 +230,14 @@ dnl>
+ AC_ARG_WITH(void,
+               [  +-External-source-locations:-------------------------------------------------+])
+ 
+-AC_ARG_WITH(  rrd-home,
+-              [  --with-rrd-home=DIR        Usually /usr/local/rrdtool-1.2.x],
+-              RRD_HOME="$withval",
+-              RRD_HOME=/usr/local/rrdtool-1.2.19)
+ AC_ARG_WITH(  pcap-root,
+               [  --with-pcap-root=DIR        LBNL pcap located in DIR],
+               PCAP_ROOT="$withval",
+               PCAP_ROOT=)
++AC_ARG_WITH(  pcap-config,
++              [  --with-pcap-config=path/pcap-config where to find pcap-config],
++              PCAP_CONFIG="$withval",
++              PCAP_CONFIG=)
+ AC_ARG_WITH(  gdbm-root,
+               [  --with-gdbm-root=DIR        gdbm located in DIR],
+               GDBM_DIRECTORY="$withval",
+@@ -556,6 +556,7 @@ if test ".${PCAPRING_DIR}" != .; then
+ else
+ 
+ TMP_ROOT=${HOME}/PF_RING/userland/libpcap/
++FOUND_PCAP=1
+ if test ".${PCAP_ROOT}" == . &&
+    test -d ${TMP_ROOT} &&
+    test -r ${TMP_ROOT}/libpcap.a; then
+@@ -563,6 +564,18 @@ if test ".${PCAP_ROOT}" == . &&
+        CORELIBS="${CORELIBS} -L${TMP_ROOT} -L${HOME}/PF_RING/userland/lib -lpfring -lpcap "
+        INCS="${INCS} -I ${PCAP_ROOT}"
+        AC_MSG_RESULT([found in $PCAP_ROOT])
++elif test -n "${PCAP_CONFIG}" && test -x "${PCAP_CONFIG}"; then
++       CORELIBS="${CORELIBS} $(${PCAP_CONFIG} --libs)" 
++       INCS="${INCS} $(${PCAP_CONFIG} --cflags)"
++       AC_DEFINE_UNQUOTED(HAVE_LIBPCAP, 1, [have libpcap ])
++       AC_MSG_RESULT([found pcap-config: $PCAP_CONFIG, libs:$(${PCAP_CONFIG} --libs) cflags:$(${PCAP_CONFIG} --cflags)])
++else
++     AC_CHECK_LIB(pcap, pcap_lookupdev, ,
++        [FOUND_PCAP=])
++fi
++
++if test -n "$FOUND_PCAP"; then
++	:
+ elif test ".${PCAP_ROOT}" != .; then
+   if test -d $PCAP_ROOT &&
+      test -r $PCAP_ROOT/lib/libpcap.a &&
+@@ -880,44 +893,11 @@ AC_CHECK_LIB([z], [zlibVersion], [], [
+         exit -1
+         ])
+ 
+-# RRD
+-if test -d "$RRD_HOME"; then
+-   AC_MSG_RESULT(checking for RRD home... yes)
+-else
+-   RRD_HOME=/usr/local/rrdtool
+-   if test -d "$RRD_HOME"; then
+-      AC_MSG_RESULT(Checking rrdtool in $RRD_HOME)
+-   else
+-      RRD_HOME=/usr/local
+-   fi
+-fi
+-
+-RRD_LIB="-L${RRD_HOME}/lib -lrrd_th"
+-
+-if test -f "$RRD_HOME/lib/librrd_th.so"; then
+-   AC_MSG_RESULT(checking for rrdtool... yes)
+-else
+-  if test -f "$RRD_HOME/lib/librrd_th.dylib"; then # OSX
+-     AC_MSG_RESULT(checking for rrdtool... yes)
+-  else
+-     if test -f "$RRD_HOME/lib/librrd_th.a"; then
+-       AC_MSG_RESULT(checking for rrdtool... yes)
+-     else
+-       AC_CHECK_LIB([rrd_th], [main])
+-       if test ".${ac_cv_lib_rrd_th_main}" != ".yes"; then
+-         AC_MSG_ERROR(Unable to find RRD at $RRD_HOME: please use --with-rrd-home=DIR);
+-	 AC_MSG_ERROR(RRD source can be downloaded from http://www.rrdtool.org/);
+-       else
+-         RRD_LIB=
+-       fi
+-     fi
+-  fi
+-fi
+-
+-RRD_INC=
+-if test -d "${RRD_HOME}/include"; then
+-  RRD_INC="-I${RRD_HOME}/include"
+-fi
++PKG_CHECK_MODULES( [RRD], [librrd] )
++AC_SUBST(RRD_CFLAGS)
++AC_SUBST(RRD_LIBS)
++RRD_INC=$RRD_FLAGS
++RRD_LIB=$RRD_LIBS
+ 
+ dnl> The failed recheck stuff below is courtesy of Chris Turbeville [turbo@verio.net]
+ dnl> Chris developed this for Solaris 9, confirming work I had done earlier for FreeBSD
+@@ -1041,7 +1021,7 @@ AC_CHECK_HEADERS([sched.h sys/sched.h])
+ AC_CHECK_HEADERS([pthread.h])
+ 
+ AC_MSG_CHECKING([if r/w locks are supported])
+-AC_TRY_RUN([
++AC_COMPILE_IFELSE([
+ #include <pthread.h>
+ 
+ int main()
+@@ -1443,15 +1423,15 @@ dnl> NET-SNMP
+ dnl>
+ if test ".${ac_disable_snmp}" != ".yes"; then
+   AC_CHECK_TOOL(NETSNMP, net-snmp-config)
+-  if test "x$ac_cv_prog_ac_ct_NETSNMP" = "xnet-snmp-config"; then
++  if test -n "$NETSNMP"; then
+     AC_DEFINE_UNQUOTED(HAVE_SNMP, 1, [SNMP is supported])
+-    SNMPLIBS="`net-snmp-config --libs`"
++    SNMPLIBS="`$NETSNMP --libs`"
+     SNMPLIBS="`echo ${SNMPLIBS}|sed -e s,'-R../lib',,g`"
+     echo "net-snmp libs: ${SNMPLIBS}"
+     LIBS="${LIBS} ${SNMPLIBS}"
+ dnl remove unecessary path
+     LIBS=`echo ${LIBS}|sed -e s,'-R../lib',,g`
+-    INCS="${INCS} `net-snmp-config --cflags`"
++    INCS="${INCS} `$NETSNMP --cflags`"
+   else
+     AC_MSG_RESULT(NETSNMP is not present: SNMP support is disabled)
+   fi
+@@ -1464,10 +1444,9 @@ SAVED_LIBS=$LIBS
+ dnl>
+ dnl> PYTHON
+ dnl>
+-  AC_CHECK_TOOL(PYTHON, python-config)
+-  PYTHON_CONFIG=""
++  AC_CHECK_TOOL(PYTHON_CONFIG, python-config)
+ 
+-  if test "x$ac_cv_prog_ac_ct_PYTHON" != "xpython-config"; then   
++  if test -z "$PYTHON_CONFIG"; then   
+        if test -f "/etc/debian_version"; then
+        	   AC_MSG_RESULT(Please install python-dev and rerun configure)
+ 	   exit 1
+@@ -1481,8 +1460,6 @@ dnl>
+           PYTHON_CONFIG="python-config"
+         fi
+      fi
+-  else
+-     PYTHON_CONFIG="python-config"
+   fi
+ 
+   if test "x$PYTHON_CONFIG" != "x"; then
diff --git a/meta-networking/recipes-support/ntop/ntop/ntop_configure_in_net_snmp_config_exist.patch b/meta-networking/recipes-support/ntop/ntop/ntop_configure_in_net_snmp_config_exist.patch
new file mode 100644
index 0000000..269138d
--- /dev/null
+++ b/meta-networking/recipes-support/ntop/ntop/ntop_configure_in_net_snmp_config_exist.patch
@@ -0,0 +1,21 @@
+Check net-snmp-config's existence in case user specified the
+ac_cv_prog_NETSNMP to avoid HAVE_SNMP defined if the specified
+net-snmp-config doesn't exist.
+
+Upstream-Status: Inappropriate [Embedded specific]
+
+Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
+---
+diff --git a/configure.in b/configure.in
+index 6f3e88f..8ddf017 100755
+--- a/configure.in
++++ b/configure.in
+@@ -1423,7 +1423,7 @@ dnl> NET-SNMP
+ dnl>
+ if test ".${ac_disable_snmp}" != ".yes"; then
+   AC_CHECK_TOOL(NETSNMP, net-snmp-config)
+-  if test -n "$NETSNMP"; then
++  if test -n "$NETSNMP" -a -e "$NETSNMP"; then
+     AC_DEFINE_UNQUOTED(HAVE_SNMP, 1, [SNMP is supported])
+     SNMPLIBS="`$NETSNMP --libs`"
+     SNMPLIBS="`echo ${SNMPLIBS}|sed -e s,'-R../lib',,g`"
diff --git a/meta-networking/recipes-support/ntop/ntop/ntop_init.patch b/meta-networking/recipes-support/ntop/ntop/ntop_init.patch
new file mode 100644
index 0000000..e7684c1
--- /dev/null
+++ b/meta-networking/recipes-support/ntop/ntop/ntop_init.patch
@@ -0,0 +1,228 @@
+Modify ntop.init to WRLinux 5.0 style.
+
+Fix a small problem that when ntop not running,
+/etc/init.d/ntop stop will return 1
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
+---
+ packages/RedHat/ntop.init |  102 +++++++++-----------------------------------
+ 1 files changed, 21 insertions(+), 81 deletions(-)
+
+diff --git a/packages/RedHat/ntop.init b/packages/RedHat/ntop.init
+index 40d49f1..a189c59 100755
+--- a/packages/RedHat/ntop.init
++++ b/packages/RedHat/ntop.init
+@@ -10,19 +10,9 @@
+ #           You have set the admin password - read docs/1STRUN.txt
+ #           You have created /etc/ntop.conf with appropriate parameters.
+ 
+-#  To identify an interface to ntop, use the following flags 
+-#  in /etc/sysconfig/network-scripts/ifcfg-ethx
+-
+-#   NTOP="yes"      <--- means for ntop to use this interface
+-#   NTOPCONFIG="yes"  <--- means for ntop to configure this interface
+-
+ # Note that if you give a -i parameter in either /etc/ntop.conf or
+ # the command line, the scan is NOT performed.  
+ 
+-# However, when it comes to the configuration step, with NTOPCONFIG="yes"
+-# the interface is configured regardless of how the interface list was
+-# specified.
+-
+ #
+ #  
+ # 
+@@ -107,11 +97,7 @@ ntopusesyslog="local3"
+ invoked=$0
+ 
+ # Source function library.
+-. /etc/rc.d/init.d/functions
+-
+-# Source networking configuration.
+-. /etc/sysconfig/network
+-
++. /etc/init.d/functions
+ 
+ # Basic sanity checks...
+ if ! [ -x $prog ]; then
+@@ -124,16 +110,6 @@ if ! [ -x $prog ]; then
+   exit 1
+ fi
+ 
+-if [ ${NETWORKING} = "no" ]; then
+-  echo ""
+-  echo "ERROR -"
+-  echo "        Networking is not up!"
+-  echo ""
+-  echo "Aborting..."
+-  echo ""
+-  exit 1
+-fi
+-
+ if ! [ -f ${conf} ]; then
+   echo ""
+   echo "ERROR -"
+@@ -180,8 +156,8 @@ fi
+ if [ "${debug}" = "y" ]; then echo "DEBUG: parm file temp is ${parmfile}"; fi
+  
+ cmd=`echo \
+-    @${conf} \
+     -i tbd \
++    @${conf} \
+     $extra $@`
+ 
+ echo ${cmd} | awk ' \
+@@ -305,42 +281,6 @@ logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD -      Configuration
+ 
+ # Build list of interfaces, e.g  eth0 eth1 eth1:1
+ # (Yeah, we'll have to convert that to eth0,eth1,eth1:1 later
+-if [ ".${ntopinterface}" = ".tbd" ]; then
+-
+-    ntopinterface=""
+-    iflist=`ip link show | \
+-        awk '/^[0-9]*:\ eth/ { printf("%s ", substr($2, 1, length($2)-1)) }'`
+-    logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Scanning all interfaces $iflist"
+-    if [ "${debug}" = "y" ]; then echo "DEBUG: Interface candidates are ${iflist}"; fi
+-
+-    for eth in $iflist; do
+-
+-       if ! LANG=C egrep -L "^[Nn][Tt][Oo][Pp]=['\"]?[Yy][Ee][Ss]['\"]?" \
+-                /etc/sysconfig/network-scripts/ifcfg-$eth > /dev/null ; then
+-            logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - $eth is not ntop=yes, skipping"
+-            if [ "${debug}" = "y" ]; then echo "DEBUG: $eth not ntop=yes"; fi
+-            continue
+-       fi
+-
+-       ntopinterface="${ntopinterface} $eth"
+-  
+-       ip=`ip addr show $eth | \
+-           awk '/inet/ { printf("%s", substr($2, 1, index($2, "/")-1)) }'`
+-
+-       if [ ".$ip" = "." ]; then
+-           is="is unnumbered interface"
+-       else
+-           is="has IP address $ip"
+-       fi
+-       logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - $eth is ntop=yes, ${is}"
+-       if [ "${debug}" = "y" ]; then echo "DEBUG: $eth ntop=yes, ${is}"; fi
+-
+-    done
+-
+-else
+-    logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Skipping interface scan - list in parms"
+-fi
+-
+ if [ "x${ntopinterface}" = "x" ]; then
+   ntopinterface="none"
+ fi
+@@ -462,12 +402,6 @@ config_interfaces () {
+           if="${if},${eth}"
+       fi
+ 
+-       if ! LANG=C egrep -L "^[Nn][Tt][Oo][Pp][Cc].*=['\"]?[Yy][Ee][Ss]['\"]?" \
+-                /etc/sysconfig/network-scripts/ifcfg-$eth > /dev/null ; then
+-            logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - $eth is not ntopconfigure=yes, skipping"
+-            continue
+-       fi
+-
+       logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Configuring $eth"
+       if [ "${debug}" = "y" ]; then echo "DEBUG: Configuring $eth"; fi
+ 
+@@ -527,7 +461,7 @@ start () {
+   show_extra
+   config_interfaces
+ 
+-  cmd=`echo $prog \
++  cmd=`echo \
+                @${conf} \
+                -i $if \
+                $extra $@`
+@@ -541,7 +475,7 @@ start () {
+   if [ ".${ldlibpath}" != "." ]; then
+     export LD_LIBRARY_PATH="${ldlibpath}"
+   fi
+-  daemon ${cmd}
++  start-stop-daemon --start --quiet --exec $prog -- ${cmd}
+   RETVAL=$?
+ 
+   [ $RETVAL = 0 ] && touch /var/lock/subsys/${name}${instance}
+@@ -551,6 +485,7 @@ start () {
+ stop () {
+   # stop daemon
+ 
++  NOT_RUNNING=1
+   RETVAL=1
+   echo -n $"Stopping ${name}${instance}: "
+   logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Stopping: ${name}${instance}"
+@@ -563,13 +498,14 @@ stop () {
+     if [ $rc = 0 ]; then
+       logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Sending SIGTERM to ${pid}"
+       if [ "${debug}" = "y" ]; then echo "Sending SIGTERM to ${pid}"; fi
+-      kill -s SIGTERM ${pid}
++      kill -TERM ${pid} 2>&1 > /dev/null
+       RETVAL=$?
+       rm -f ${ntopdbfilepath}/ntop.pid
+     else 
+       logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Unable to find process ${pid} ... will kill by name"
+       if [ "${debug}" = "y" ]; then echo "Unable to find process ${pid} ... will kill by name"; fi
+     fi
++    NOT_RUNNING=0
+   else
+ 
+     logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Unable to find ${ntopdbfilepath}/ntop.pid file ... will kill by name"
+@@ -577,15 +513,16 @@ stop () {
+ 
+   fi
+ 
+-  echo 
+-
+   if [ $RETVAL != 0 ]; then
+     pids=`ps axf | grep '\/usr\/bin\/ntop' | awk '{ printf(" %s", $1) }; END { print "" }'`
+-    if [ "${pids}" != " " ]; then
++    if [ "${pids}" != "" ]; then
+       logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Sending SIGTERM to ${prog}...${pids}"
+       if [ "${debug}" = "y" ]; then echo "Sending SIGTERM to ${prog}...${pids}"; fi
+-      kill -INT ${pids}
++      kill -TERM ${pids} > /dev/null 2>&1
+       RETVAL=$?
++      NOT_RUNNING=0
++    else
++      NOT_RUNNING=1
+     fi
+   fi
+ 
+@@ -597,13 +534,9 @@ stop () {
+       if [ "${debug}" = "y" ]; then echo "DEBUG: Unconfiguring interfaces"; fi
+ 
+       for eth in ${ntopinterface}; do
+-          if ! LANG=C egrep -L "^[Nn][Tt][Oo][Pp][Cc].*=['\"]?[Yy][Ee][Ss]['\"]?" \
+-                   /etc/sysconfig/network-scripts/ifcfg-$eth > /dev/null ; then
+-              logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - $eth is not ntopconfigure=yes, skipping"
+-              if [ "${debug}" = "y" ]; then echo "DEBUG: $eth is not ntopconfigure=yes"; fi
+-              continue
++          if [ "$eth" = "none" ]; then
++               continue
+           fi
+-
+           logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Unconfiguring $eth"
+           if [ "${debug}" = "y" ]; then echo "DEBUG: Unconfiguring $eth"; fi
+     
+@@ -623,6 +556,13 @@ stop () {
+       if [ "${debug}" = "y" ]; then echo "DEBUG: Interfaces are unconfigured"; fi
+   fi
+ 
++  if [ $NOT_RUNNING -eq 1 -o $RETVAL -eq 0 ]; then
++    echo " [ OK ]"
++    RETVAL=0
++  else
++    echo " [ FAILED ]"
++  fi
++
+   return $RETVAL
+ }
+ 
+-- 
+1.7.5.4
+
diff --git a/meta-networking/recipes-support/ntop/ntop/ntop_webInterface.patch b/meta-networking/recipes-support/ntop/ntop/ntop_webInterface.patch
new file mode 100644
index 0000000..9f57ca4
--- /dev/null
+++ b/meta-networking/recipes-support/ntop/ntop/ntop_webInterface.patch
@@ -0,0 +1,19 @@
+change osName to version as it prints out "ntop Version".
+
+Upstream-Status: Pending
+
+Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
+---
+diff --git a/webInterface.c b/webInterface.c
+index 5622e69..8cb7a67 100644
+--- a/webInterface.c
++++ b/webInterface.c
+@@ -5816,7 +5816,7 @@ static void printNtopConfigInfoData(int textPrintFlag, UserPref *pref) {
+   printInfoSectionTitle(textPrintFlag, "Basic Information");
+ 
+   safe_snprintf(__FILE__, __LINE__, formatBuf, sizeof(formatBuf), "%s (%d bit)",
+-		osName, sizeof(long) == 8 ? 64 : 32);
++		version, sizeof(long) == 8 ? 64 : 32);
+   printFeatureConfigInfo(textPrintFlag, "ntop Version", formatBuf);
+ 
+ #ifndef WIN32
diff --git a/meta-networking/recipes-support/ntop/ntop/support-arm64.patch b/meta-networking/recipes-support/ntop/ntop/support-arm64.patch
new file mode 100644
index 0000000..0b1e8af
--- /dev/null
+++ b/meta-networking/recipes-support/ntop/ntop/support-arm64.patch
@@ -0,0 +1,28 @@
+Add support for arm64
+
+Upstream-Status: Inappropriate [no longer maintained]
+
+Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
+
+diff --git a/nDPI/config.sub.old b/nDPI/config.sub
+index c2d1257..e4347ac 100755
+--- a/nDPI/config.sub.old
++++ b/nDPI/config.sub
+@@ -249,7 +249,7 @@ case $basic_machine in
+ 	| alpha | alphaev[4-8] | alphaev56 | alphaev6[78] | alphapca5[67] \
+ 	| alpha64 | alpha64ev[4-8] | alpha64ev56 | alpha64ev6[78] | alpha64pca5[67] \
+ 	| am33_2.0 \
+-	| arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] | avr | avr32 \
++	| arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] | avr | avr32 | aarch64 \
+ 	| bfin \
+ 	| c4x | clipper \
+ 	| d10v | d30v | dlx | dsp16xx \
+@@ -331,7 +331,7 @@ case $basic_machine in
+ 	| alpha-* | alphaev[4-8]-* | alphaev56-* | alphaev6[78]-* \
+ 	| alpha64-* | alpha64ev[4-8]-* | alpha64ev56-* | alpha64ev6[78]-* \
+ 	| alphapca5[67]-* | alpha64pca5[67]-* | arc-* \
+-	| arm-*  | armbe-* | armle-* | armeb-* | armv*-* \
++	| arm-*  | armbe-* | armle-* | armeb-* | armv*-* | aarch64-* \
+ 	| avr-* | avr32-* \
+ 	| bfin-* | bs2000-* \
+ 	| c[123]* | c30-* | [cjt]90-* | c4x-* | c54x-* | c55x-* | c6x-* \
diff --git a/meta-networking/recipes-support/ntop/ntop/use-static-inline.patch b/meta-networking/recipes-support/ntop/ntop/use-static-inline.patch
new file mode 100644
index 0000000..2b001c1
--- /dev/null
+++ b/meta-networking/recipes-support/ntop/ntop/use-static-inline.patch
@@ -0,0 +1,32 @@
+[PATCH] replace 'inline' with 'static inline' for gcc 5.x
+
+gcc 5.x defaults to -std=gnu11 instead of -std=gnu89 which change
+the semantics for inline functions and the standalone 'inline'
+causes error with "gcc5 -g -o0"
+ 
+Replace inline with static inline to be compatible with both gcc 4
+and 5.
+
+Upstream-status: Pending
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ nDPI/src/lib/protocols/ssl.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nDPI/src/lib/protocols/ssl.c b/nDPI/src/lib/protocols/ssl.c
+index 245b8c3..72beda9 100644
+--- a/nDPI/src/lib/protocols/ssl.c
++++ b/nDPI/src/lib/protocols/ssl.c
+@@ -39,7 +39,7 @@ static void ipoque_int_ssl_add_connection(struct ipoque_detection_module_struct
+ 
+ #ifdef HAVE_NTOP
+ #ifndef WIN32
+-inline int min(int a, int b) { return(a < b ? a : b); }
++static inline int min(int a, int b) { return(a < b ? a : b); }
+ #endif
+ 
+ static void stripCertificateTrailer(char *buffer, int buffer_len) {
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb b/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
new file mode 100644
index 0000000..77b5e43
--- /dev/null
+++ b/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
@@ -0,0 +1,4 @@
+include ntop.inc
+
+SRC_URI[md5sum] = "01710b6925a8a5ffe1a41b8b512ebd69"
+SRC_URI[sha256sum] = "7e8e84cb14d2173beaca4d4cb991a14d84a4bef84ec37b2276bc363f45c52ef8"
-- 
2.7.4


