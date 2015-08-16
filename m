Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3A58360043
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2015 22:02:25 +0000 (UTC)
Received: by pdbmi9 with SMTP id mi9so8032442pdb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2015 15:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Lyo33IcdFm/86vLvZXp9y75w1gD5WHiwnSTaUHZizlk=;
	b=nnlE0bKmwDtaugatwAndbUV8arICijPn55zWKfp+tSVtf6VB6edlF4vDxzoeawK0eU
	La/+6sQu40yDuQIiF+9z9kKmY8W8FPK/y0NusuI305a1suakQZl3LToHOCiyOyKDzB9r
	wdYeKzP+lTCNfqCPNYgou659t6PG1m0SeuYenb6J9EYERIPW0PgjwyKJk2OvgBXl+xes
	mTk0NWcQgV5M0p7aXGNsQRquO1ueXioSyFsgCeKpt9kzYLjeERnQcwyQqkkLa4AF8Bej
	Lpk7554O+rSyhApF5OsNBShEJzsyOugmqyuuQTYTjOdHKUmlNL0vKO4uVY6gxU1pGqmI
	VNIw==
X-Received: by 10.70.129.79 with SMTP id nu15mr40430515pdb.15.1439762546041;
	Sun, 16 Aug 2015 15:02:26 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	yt9sm12416739pac.32.2015.08.16.15.02.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 16 Aug 2015 15:02:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Aug 2015 15:02:20 -0700
Message-Id: <1439762540-15793-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-oe][PATCH] ipmiutil: add new package
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
X-List-Received-Date: Sun, 16 Aug 2015 22:02:26 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../ipmiutil/ipmiutil/fix_systemd_path.patch       | 318 +++++++++++++++++++++
 meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb |  60 ++++
 2 files changed, 378 insertions(+)
 create mode 100644 meta-oe/recipes-support/ipmiutil/ipmiutil/fix_systemd_path.patch
 create mode 100644 meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb

diff --git a/meta-oe/recipes-support/ipmiutil/ipmiutil/fix_systemd_path.patch b/meta-oe/recipes-support/ipmiutil/ipmiutil/fix_systemd_path.patch
new file mode 100644
index 0000000..2fa7c68
--- /dev/null
+++ b/meta-oe/recipes-support/ipmiutil/ipmiutil/fix_systemd_path.patch
@@ -0,0 +1,318 @@
+allow systemd path to be defined by configure option.
+
+The configure probes the host for systemd path information.
+
+Upstream Status: Inappropriate [Embedded]
+
+Signed-off-By: Armin Kuster <akuster@mvista.com>
+
+Index: ipmiutil-2.9.6/configure
+===================================================================
+--- ipmiutil-2.9.6.orig/configure
++++ ipmiutil-2.9.6/configure
+@@ -792,7 +792,6 @@ LTLIBOBJS
+ LIBOBJS
+ pkgconfigdir
+ SHR_LINK
+-SYSTEMD_DIR
+ CROSS_LFLAGS
+ CROSS_CFLAGS
+ SUBDIR_S
+@@ -999,7 +998,7 @@ psdir='${docdir}'
+ libdir='${exec_prefix}/lib'
+ localedir='${datarootdir}/locale'
+ mandir='${datarootdir}/man'
+-
++systemddir='${datarootdir}/ipmiutil'
+ ac_prev=
+ ac_dashdash=
+ for ac_option
+@@ -1594,7 +1593,10 @@ Optional Features:
+   --enable-standalone    build standalone, with no GPL or LanPlus libs.
+   --enable-libsensors	 build libipmiutil with sensor modules [default=no]
+   --enable-gpl           build with some GPL code [default=no]
+-  --enable-systemd       enable systemd service type=notify support and %_unitdir [default=disabled]
++  --enable-systemd[=systemddir]      install systemd unit file.  If 'yes'
++                probe the system for unit directory.
++                If a path is specified, assume that
++                is a valid install path.  [default=disabled]
+ 
+ Optional Packages:
+   --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
+@@ -12980,7 +12982,6 @@ CROSS_LFLAGS=""
+ CROSS_CFLAGS=""
+ LIBSENSORS=""
+ SAM2OBJ="isensor2.o ievents2.o"
+-SYSTEMD_DIR=/usr/share/ipmiutil
+ 
+ # Check whether --enable-useflags was given.
+ if test "${enable_useflags+set}" = set; then
+@@ -13032,31 +13033,43 @@ if test "${enable_gpl+set}" = set; then
+     fi
+ 
+ fi
+-
++#
++# Check for systemd unit files direectory exists if unit file installation
++# is requested
++#
+ 
+ # Check whether --enable-systemd was given.
+-if test "${enable_systemd+set}" = set; then
+-  enableval=$enable_systemd;
+-fi
+-
+-if test "x$enable_systemd" = "xyes"; then
+-   GPL_CFLAGS="$GPL_CFLAGS -DENABLE_SYSTEMD"
+-   # if systemd enabled, install service scripts in unitdir
+-   SYSTEMD_DIR=`rpm --eval "%{_unitdir}"`
+-else
+-   # otherwise install the systemd service scripts in the data dir
+-  if test  "x$sysname" = "xDarwin" ; then
+-    # MacOS 'which' command returns 0 always
+-    SYSTEMD_DIR=/usr/share/ipmiutil
+-  else
++if test "${enable_systemd+set}" = set; then :
++  withval=$enable_systemd; if test "$withval" = yes; then
++  GPL_CFLAGS="$GPL_CFLAGS -DENABLE_SYSTEMD"
++  if test -z "$systemddir"; then
++    { $as_echo "$as_me:${as_lineno-$LINENO}: checking location of the systemd unit files directory" >&5
++$as_echo_n "checking location of the systemd unit files directory... " >&6; }
++    _rpmdir = ""
+     which rpm >/dev/null 2>&1
+     if test  $? -eq 0 ; then
+-       datad=`rpm --eval "%{_datadir}"`
+-       SYSTEMD_DIR=${datad}/ipmiutil
+-    else
+-       SYSTEMD_DIR=/usr/share/ipmiutil
++      _rpmdir = `rpm --eval "%{_unitdir}"`
+     fi
++    for systemd_d in ${datadir}/usr/share/ipmiutil ${_rpmdir} /usr/share/ipmiutil; do
++      if test -z "$systemddir"; then
++        if test -d "$systemd_d"; then
++          systemddir="$systemd_d"
++        fi
++      fi
++    done
+   fi
++  if test -n "$systemddir"; then
++    { $as_echo "$as_me:${as_lineno-$LINENO}: result: $systemddir" >&5
++$as_echo "$systemddir" >&6; }
++  else
++    { $as_echo "$as_me:${as_lineno-$LINENO}: result: not found" >&5
++$as_echo "not found" >&6; }
++ fi
++else
++ if test "$withval" != no; then
++  systemddir=$withval
++ fi
++fi
+ fi
+ 
+ case "$archm" in
+Index: ipmiutil-2.9.6/configure.ac
+===================================================================
+--- ipmiutil-2.9.6.orig/configure.ac
++++ ipmiutil-2.9.6/configure.ac
+@@ -140,7 +140,6 @@ CROSS_LFLAGS=""
+ CROSS_CFLAGS=""
+ LIBSENSORS=""
+ SAM2OBJ="isensor2.o ievents2.o"
+-SYSTEMD_DIR=/usr/share/ipmiutil
+ 
+ AC_ARG_ENABLE([useflags],
+     [  --enable-useflags    include environment CFLAGS and LDFLAGS.],
+@@ -191,25 +190,42 @@ AC_ARG_ENABLE([gpl],
+ 
+ dnl Does this Linux have systemd enabled?  Otherwise use sysv init.
+ AC_ARG_ENABLE([systemd],
+-    [  --enable-systemd       enable systemd service type=notify support and %_unitdir [[default=disabled]]],)
+-if test "x$enable_systemd" = "xyes"; then
+-   GPL_CFLAGS="$GPL_CFLAGS -DENABLE_SYSTEMD"
+-   # if systemd enabled, install service scripts in unitdir
+-   SYSTEMD_DIR=`rpm --eval "%{_unitdir}"`
++    [  --enable-systemd[=systemddir]      install systemd unit file.  If 'yes'
++        probe the system for unit directory.
++        If a path is specified, assume that
++        is a valid install path. [[default=disabled]]],)
++# Check whether --enable-systemd was given.
++if test "${enable_systemd+set}" = set; then :
++	withval=$enable_systemd; if test "$withval" = yes; then
++	GPL_CFLAGS="$GPL_CFLAGS -DENABLE_SYSTEMD"
++	if test -z "$systemddir"; then
++		{ $as_echo "$as_me:${as_lineno-$LINENO}: checking location of the systemd unit files directory" >&5
++		$as_echo_n "checking location of the systemd unit files directory... " >&6; }
++		_rpmdir = ""
++		which rpm >/dev/null 2>&1
++		if test  $? -eq 0 ; then
++			_rpmdir = `rpm --eval "%{_unitdir}"`
++		fi
++		for systemd_d in ${datadir}/usr/share/ipmiutil ${_rpmdir} /usr/share/ipmiutil; do
++			if test -z "$systemddir"; then
++				if test -d "$systemd_d"; then
++					systemddir="$systemd_d"
++				fi
++			fi
++		done
++	fi
++	if test -n "$systemddir"; then
++		{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $systemddir" >&5
++		$as_echo "$systemddir" >&6; }
++	else
++		{ $as_echo "$as_me:${as_lineno-$LINENO}: result: not found" >&5
++		$as_echo "not found" >&6; }
++	fi
+ else
+-   # otherwise install the systemd service scripts in the data dir
+-  if test  "x$sysname" = "xDarwin" ; then
+-    # MacOS 'which' command returns 0 always
+-    SYSTEMD_DIR=/usr/share/ipmiutil
+-  else
+-    which rpm >/dev/null 2>&1
+-    if test  $? -eq 0 ; then
+-       datad=`rpm --eval "%{_datadir}"`
+-       SYSTEMD_DIR=${datad}/ipmiutil
+-    else
+-       SYSTEMD_DIR=/usr/share/ipmiutil
+-    fi
+-  fi
++	if test "$withval" != no; then
++		systemddir=$withval
++	fi
++fi
+ fi
+ 
+ dnl start main logic
+@@ -481,7 +497,7 @@ AC_SUBST(INS_LIB)
+ AC_SUBST(SUBDIR_S)
+ AC_SUBST(CROSS_CFLAGS)
+ AC_SUBST(CROSS_LFLAGS)
+-AC_SUBST(SYSTEMD_DIR)
++AC_SUBST(systemddir)
+ AC_SUBST(SHR_LINK)
+ AC_SUBST(pkgconfigdir)
+ 
+Index: ipmiutil-2.9.6/Makefile.in
+===================================================================
+--- ipmiutil-2.9.6.orig/Makefile.in
++++ ipmiutil-2.9.6/Makefile.in
+@@ -182,7 +182,7 @@ SHELL = @SHELL@
+ SHR_LINK = @SHR_LINK@
+ STRIP = @STRIP@
+ SUBDIR_S = @SUBDIR_S@
+-SYSTEMD_DIR = @SYSTEMD_DIR@
++SYSTEMD_DIR = @systemddir@
+ VERSION = @VERSION@
+ abs_builddir = @abs_builddir@
+ abs_srcdir = @abs_srcdir@
+@@ -233,6 +233,7 @@ sbindir = @sbindir@
+ sharedstatedir = @sharedstatedir@
+ srcdir = @srcdir@
+ sysconfdir = @sysconfdir@
++systemddir = @systemddir@
+ target_alias = @target_alias@
+ top_build_prefix = @top_build_prefix@
+ top_builddir = @top_builddir@
+Index: ipmiutil-2.9.6/scripts/Makefile.in
+===================================================================
+--- ipmiutil-2.9.6.orig/scripts/Makefile.in
++++ ipmiutil-2.9.6/scripts/Makefile.in
+@@ -126,7 +126,7 @@ SHELL = @SHELL@
+ SHR_LINK = @SHR_LINK@
+ STRIP = @STRIP@
+ SUBDIR_S = @SUBDIR_S@
+-SYSTEMD_DIR = @SYSTEMD_DIR@
++SYSTEMD_DIR = @systemddir@
+ VERSION = @VERSION@
+ abs_builddir = @abs_builddir@
+ abs_srcdir = @abs_srcdir@
+@@ -195,7 +195,8 @@ cronto = ${DESTDIR}${etcdir}/cron.daily
+ sbinto = ${DESTDIR}${sbindir}
+ varto = ${DESTDIR}/var/lib/ipmiutil
+ initto = ${DESTDIR}@INIT_DIR@
+-sysdto = ${DESTDIR}@SYSTEMD_DIR@
++sysdto = ${DESTDIR}@systemddir@
++systemddir = @systemddir@
+ sysvinit = ${datato}
+ sbinfls = ialarms ihealth ifru igetevent ireset icmd isol ilan isensor isel iserial iwdt iconfig ipicmg ifirewall ifwum ihpm
+ all: all-am
+@@ -398,11 +399,14 @@ install:
+ 	${INSTALL_SCRIPT_SH} evt.sh       ${datato}
+ 	if [ -f /etc/debian_version ]; then \
+ 	   sysvinit=${initto}; fi
+-	${INSTALL_SCRIPT_SH} ipmiutil_wdt ${sysvinit}/ipmiutil_wdt
+-	${INSTALL_SCRIPT_SH} ipmiutil_asy ${sysvinit}/ipmiutil_asy
+-	${INSTALL_SCRIPT_SH} ipmiutil_evt ${sysvinit}/ipmiutil_evt
+-	${INSTALL_SCRIPT_SH} ipmi_port.sh ${sysvinit}/ipmi_port
+-	${INSTALL_SCRIPT_SH} ipmi_info    ${sysvinit}/ipmi_info
++	if [ ! -z "${systemddir}" ]; then \
++		$(MKDIR) ${sysdto}; \
++		${INSTALL_SCRIPT_SH} ipmiutil_wdt ${sysvinit}/ipmiutil_wdt; \
++		${INSTALL_SCRIPT_SH} ipmiutil_asy ${sysvinit}/ipmiutil_asy; \
++		${INSTALL_SCRIPT_SH} ipmiutil_evt ${sysvinit}/ipmiutil_evt; \
++		${INSTALL_SCRIPT_SH} ipmi_port.sh ${sysvinit}/ipmi_port; \
++		${INSTALL_SCRIPT_SH} ipmi_info    ${sysvinit}/ipmi_info; \
++	fi
+ 	${INSTALL_SCRIPT_SH} checksel     ${datato}
+ 	${INSTALL_DATA_SH} ipmiutil_wdt.service ${sysdto}
+ 	${INSTALL_DATA_SH} ipmiutil_asy.service ${sysdto}
+Index: ipmiutil-2.9.6/scripts/Makefile.am
+===================================================================
+--- ipmiutil-2.9.6.orig/scripts/Makefile.am
++++ ipmiutil-2.9.6/scripts/Makefile.am
+@@ -17,7 +17,8 @@ cronto = ${DESTDIR}${etcdir}/cron.daily
+ sbinto = ${DESTDIR}${sbindir}
+ varto  = ${DESTDIR}/var/lib/ipmiutil
+ initto = ${DESTDIR}@INIT_DIR@
+-sysdto = ${DESTDIR}@SYSTEMD_DIR@
++sysdto = ${DESTDIR}@systemddir@
++systemddir = @systemddir@
+ sysvinit = ${datato}
+ sbinfls = ialarms ihealth ifru igetevent ireset icmd isol ilan isensor isel iserial iwdt iconfig ipicmg ifirewall ifwum ihpm
+ 
+@@ -47,10 +48,14 @@ install:
+ 	${INSTALL_SCRIPT_SH} ipmi_port.sh ${sysvinit}/ipmi_port
+ 	${INSTALL_SCRIPT_SH} ipmi_info    ${sysvinit}/ipmi_info
+ 	${INSTALL_SCRIPT_SH} checksel     ${datato}
+-	${INSTALL_DATA_SH} ipmiutil_wdt.service ${sysdto}
+-	${INSTALL_DATA_SH} ipmiutil_asy.service ${sysdto}
+-	${INSTALL_DATA_SH} ipmiutil_evt.service ${sysdto}
+-	${INSTALL_DATA_SH} ipmi_port.service    ${sysdto}
++	
++	if [ ! -z "${systemddir}" ]; then \
++		$(MKDIR) ${sysdto}; \
++		${INSTALL_DATA_SH} ipmiutil_wdt.service ${sysdto}; \
++		${INSTALL_DATA_SH} ipmiutil_asy.service ${sysdto}; \
++		${INSTALL_DATA_SH} ipmiutil_evt.service ${sysdto}; \
++		${INSTALL_DATA_SH} ipmi_port.service    ${sysdto}; \
++	fi
+ 	${INSTALL_SCRIPT_SH} ipmiutil.env     ${datato}
+ 	${INSTALL_SCRIPT_SH} ipmiutil.pre     ${datato}
+ 	${INSTALL_SCRIPT_SH} ipmiutil.setup   ${datato}
+Index: ipmiutil-2.9.6/lib/Makefile.in
+===================================================================
+--- ipmiutil-2.9.6.orig/lib/Makefile.in
++++ ipmiutil-2.9.6/lib/Makefile.in
+@@ -128,7 +128,7 @@ SHELL = @SHELL@
+ SHR_LINK = @SHR_LINK@
+ STRIP = @STRIP@
+ SUBDIR_S = @SUBDIR_S@
+-SYSTEMD_DIR = @SYSTEMD_DIR@
++SYSTEMD_DIR = @systemddir@
+ VERSION = @VERSION@
+ abs_builddir = @abs_builddir@
+ abs_srcdir = @abs_srcdir@
+Index: ipmiutil-2.9.6/lib/lanplus/Makefile.in
+===================================================================
+--- ipmiutil-2.9.6.orig/lib/lanplus/Makefile.in
++++ ipmiutil-2.9.6/lib/lanplus/Makefile.in
+@@ -177,7 +177,8 @@ SHELL = @SHELL@
+ SHR_LINK = @SHR_LINK@
+ STRIP = @STRIP@
+ SUBDIR_S = @SUBDIR_S@
+-SYSTEMD_DIR = @SYSTEMD_DIR@
++SYSTEMD_DIR = @systemddir@
++systemddir = @systemddir@
+ VERSION = @VERSION@
+ abs_builddir = @abs_builddir@
+ abs_srcdir = @abs_srcdir@
diff --git a/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb b/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb
new file mode 100644
index 0000000..2bce217
--- /dev/null
+++ b/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb
@@ -0,0 +1,60 @@
+SUMMARY = "ipmiutil is an easy-to-use set of IPMI server management utilities.\
+It can get/set sensor thresholds, automate SEL management, do SOL console, etc."
+
+DESCRIPTION = "The IPMI Management Utilities currently work with platforms that \
+support the IPMI 1.5 or 2.0 specification.   IPMI servers can be managed\
+locally, or remotely via IPMI LAN, even when the OS or main CPU is not\
+functional.\n \
+The ipmiutil utilities will use an IPMI Driver, either the Intel IPMI package \
+(ipmidrvr, /dev/imb), MontaVista OpenIPMI (/dev/ipmi0), the valinux IPMI \
+Driver (/dev/ipmikcs), or the LANDesk ldipmi daemon.  The ipmiutil utilities \
+can also use direct user-space I/Os in Linux or FreeBSD if no IPMI driver \
+is detected."
+
+HOMEPAGE = "http://ipmiutil.sourceforge.net"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f9372493401f309e6149dd2ce0a044b"
+
+#PARALLEL_MAKE = ""
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/ipmiutil/ipmiutil-${PV}.tar.gz \
+    file://fix_systemd_path.patch "
+
+SRC_URI[md5sum] = "462087995f05fa9e692ed7f55c840f71"
+SRC_URI[sha256sum] = "884c1f3d8bfb0b33c303973d286c3166f5a537976451a0312e3524af54771519"
+
+inherit autotools-brokensep pkgconfig systemd
+
+PACKAGECONFIG ?= "lanplus gpl"
+PACKAGECONFIG += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+PACKAGECONFIG[systemd] = "--enable-systemd=${datadir}/${BPN}, --enable-systemd=no"
+PACKAGECONFIG[sha256] = "--enable-sha256, --enable-sha256=no, openssl-native, openssl"
+PACKAGECONFIG[lanplus] = "--enable-lanplus, --enable-lanplus=no, openssl-native, openssl"
+PACKAGECONFIG[landesk] = "--enable-landesk, --enable-landesk=no"
+PACKAGECONFIG[sensors] = "--enable-libsensors, --enable-libsensors=no" 
+
+#build with some GPL code
+PACKAGECONFIG[gpl] = "--enable-gpl, --enable-gpl=no"
+#no GPL or LanPlus libs
+PACKAGECONFIG[standalone] = "--enable-standalone, --enable-standalone=no"
+
+CFLAGS += "-I${STAGING_INCDIR}"
+LDFLAGS += "-L${STAGING_LIBDIR}"
+
+do_configure () {
+    aclocal
+    libtoolize --automake --copy --force
+    autoheader
+    automake --foreign --add-missing --copy
+
+    aclocal
+    autoconf
+    automake --foreign
+    ./configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
+}
+
+do_install () {
+    oe_runmake install DESTDIR=${D}
+}
+
+COMPATABLE_HOST = '(x86_64|i.86).*-linux'
-- 
2.3.5


