Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id B080A78077
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jun 2017 06:14:34 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id q86so28050034pfl.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 23:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HNTIPjHgXYyDcSiukhwa/Qmby3Kdr3PtXbM2PdWxE3k=;
	b=s9IacYUM0s/hOodfUCFP3TTfdHZEJjCK4LFOxQtGOe5OkXzF13xy7CJ8R644anDgna
	FOJWKibsYBq/fckHK6BjziTbo6U1rh4gOHldNvInsOSijlXB9cnXJy5P23tmZ01ngbCV
	9NBN9yYDaLG/4MlEddB3GZyTPdCM79FCR8QGFSKp96J/V49XPrwon+3mDdzfLDOGVkKH
	zeaqKL8y9GIkK2uZLbNoW9CHAsA2HjM4CPUgRcR5fHOg7PSk5NgZv2Xx0YJ4WdvgPLln
	A7GdUNRBDa4XO98hDQ0WvzkT/41abfNTH8y7ZdWWZAerFKF/JkywiBKmdnl9xCEPDbhk
	xaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HNTIPjHgXYyDcSiukhwa/Qmby3Kdr3PtXbM2PdWxE3k=;
	b=FWbW7nMmxj1YwgRFw2aDPKIg5GYM2461LpTKoCnPpk12g0LocN6vXw5ISMReRsPcCZ
	GppQohRNuKrhYZMEHpo+O2HK7K/ybAE/KF3FiY4z3eHEHhq84122+/UZLq9mK1ox/UZ4
	AcFF885OXsLShtj5eIdU5ZkrOApNzSqTaLZeLUTIj+HUcCbp4TprgEIeS64Tjwo0Azh/
	UCStCSnKpMoSBazJVUZDRUEsJ9RHr6uc0kDKhprVqZWmJ0u1HtZEO3O94ihWv+Aa85ww
	xAUAlWSIbJ+6lN5bT16Ae+JiyUCwuryZ1mgupImt74fPXTEyQEtmt7JS3ewR5UFAkvkX
	AQyw==
X-Gm-Message-State: AKS2vOyxfhLOoCQHPeSA2Jbz05JabnsVBnOX/Iqs0FqPXBvIlemoyt4L
	u9XSbGy7alNOGC5x
X-Received: by 10.99.101.135 with SMTP id z129mr8769957pgb.66.1498630475135;
	Tue, 27 Jun 2017 23:14:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	r129sm2102839pfr.112.2017.06.27.23.14.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 23:14:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jun 2017 23:14:18 -0700
Message-Id: <20170628061418.16693-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170628061418.16693-1-raj.khem@gmail.com>
References: <20170628061418.16693-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 4/4] ipmiutil: Update to 3.0.5
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
X-List-Received-Date: Wed, 28 Jun 2017 06:14:35 -0000

for license change information see
https://sourceforge.net/p/ipmiutil/code-git/ci/647a155e219e56d9cec8ffc61ad5f43a35a1af3a/tree/COPYING?diff=adb40a4caea4873586803ba5030b79de1bfca601

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes v1 -> v2:
- Forward port the systemd patch instead of dropping it

 .../ipmiutil/ipmiutil/fix_systemd_path.patch       | 241 +++------------------
 .../{ipmiutil_2.9.6.bb => ipmiutil_3.0.5.bb}       |  26 +--
 2 files changed, 30 insertions(+), 237 deletions(-)
 rename meta-oe/recipes-support/ipmiutil/{ipmiutil_2.9.6.bb => ipmiutil_3.0.5.bb} (76%)

diff --git a/meta-oe/recipes-support/ipmiutil/ipmiutil/fix_systemd_path.patch b/meta-oe/recipes-support/ipmiutil/ipmiutil/fix_systemd_path.patch
index 2fa7c6883..33116b3c0 100644
--- a/meta-oe/recipes-support/ipmiutil/ipmiutil/fix_systemd_path.patch
+++ b/meta-oe/recipes-support/ipmiutil/ipmiutil/fix_systemd_path.patch
@@ -6,115 +6,11 @@ Upstream Status: Inappropriate [Embedded]
 
 Signed-off-By: Armin Kuster <akuster@mvista.com>
 
-Index: ipmiutil-2.9.6/configure
+Index: ipmiutil-3.0.5/configure.ac
 ===================================================================
---- ipmiutil-2.9.6.orig/configure
-+++ ipmiutil-2.9.6/configure
-@@ -792,7 +792,6 @@ LTLIBOBJS
- LIBOBJS
- pkgconfigdir
- SHR_LINK
--SYSTEMD_DIR
- CROSS_LFLAGS
- CROSS_CFLAGS
- SUBDIR_S
-@@ -999,7 +998,7 @@ psdir='${docdir}'
- libdir='${exec_prefix}/lib'
- localedir='${datarootdir}/locale'
- mandir='${datarootdir}/man'
--
-+systemddir='${datarootdir}/ipmiutil'
- ac_prev=
- ac_dashdash=
- for ac_option
-@@ -1594,7 +1593,10 @@ Optional Features:
-   --enable-standalone    build standalone, with no GPL or LanPlus libs.
-   --enable-libsensors	 build libipmiutil with sensor modules [default=no]
-   --enable-gpl           build with some GPL code [default=no]
--  --enable-systemd       enable systemd service type=notify support and %_unitdir [default=disabled]
-+  --enable-systemd[=systemddir]      install systemd unit file.  If 'yes'
-+                probe the system for unit directory.
-+                If a path is specified, assume that
-+                is a valid install path.  [default=disabled]
- 
- Optional Packages:
-   --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
-@@ -12980,7 +12982,6 @@ CROSS_LFLAGS=""
- CROSS_CFLAGS=""
- LIBSENSORS=""
- SAM2OBJ="isensor2.o ievents2.o"
--SYSTEMD_DIR=/usr/share/ipmiutil
- 
- # Check whether --enable-useflags was given.
- if test "${enable_useflags+set}" = set; then
-@@ -13032,31 +13033,43 @@ if test "${enable_gpl+set}" = set; then
-     fi
- 
- fi
--
-+#
-+# Check for systemd unit files direectory exists if unit file installation
-+# is requested
-+#
- 
- # Check whether --enable-systemd was given.
--if test "${enable_systemd+set}" = set; then
--  enableval=$enable_systemd;
--fi
--
--if test "x$enable_systemd" = "xyes"; then
--   GPL_CFLAGS="$GPL_CFLAGS -DENABLE_SYSTEMD"
--   # if systemd enabled, install service scripts in unitdir
--   SYSTEMD_DIR=`rpm --eval "%{_unitdir}"`
--else
--   # otherwise install the systemd service scripts in the data dir
--  if test  "x$sysname" = "xDarwin" ; then
--    # MacOS 'which' command returns 0 always
--    SYSTEMD_DIR=/usr/share/ipmiutil
--  else
-+if test "${enable_systemd+set}" = set; then :
-+  withval=$enable_systemd; if test "$withval" = yes; then
-+  GPL_CFLAGS="$GPL_CFLAGS -DENABLE_SYSTEMD"
-+  if test -z "$systemddir"; then
-+    { $as_echo "$as_me:${as_lineno-$LINENO}: checking location of the systemd unit files directory" >&5
-+$as_echo_n "checking location of the systemd unit files directory... " >&6; }
-+    _rpmdir = ""
-     which rpm >/dev/null 2>&1
-     if test  $? -eq 0 ; then
--       datad=`rpm --eval "%{_datadir}"`
--       SYSTEMD_DIR=${datad}/ipmiutil
--    else
--       SYSTEMD_DIR=/usr/share/ipmiutil
-+      _rpmdir = `rpm --eval "%{_unitdir}"`
-     fi
-+    for systemd_d in ${datadir}/usr/share/ipmiutil ${_rpmdir} /usr/share/ipmiutil; do
-+      if test -z "$systemddir"; then
-+        if test -d "$systemd_d"; then
-+          systemddir="$systemd_d"
-+        fi
-+      fi
-+    done
-   fi
-+  if test -n "$systemddir"; then
-+    { $as_echo "$as_me:${as_lineno-$LINENO}: result: $systemddir" >&5
-+$as_echo "$systemddir" >&6; }
-+  else
-+    { $as_echo "$as_me:${as_lineno-$LINENO}: result: not found" >&5
-+$as_echo "not found" >&6; }
-+ fi
-+else
-+ if test "$withval" != no; then
-+  systemddir=$withval
-+ fi
-+fi
- fi
- 
- case "$archm" in
-Index: ipmiutil-2.9.6/configure.ac
-===================================================================
---- ipmiutil-2.9.6.orig/configure.ac
-+++ ipmiutil-2.9.6/configure.ac
-@@ -140,7 +140,6 @@ CROSS_LFLAGS=""
+--- ipmiutil-3.0.5.orig/configure.ac
++++ ipmiutil-3.0.5/configure.ac
+@@ -149,7 +149,6 @@ CROSS_LFLAGS=""
  CROSS_CFLAGS=""
  LIBSENSORS=""
  SAM2OBJ="isensor2.o ievents2.o"
@@ -122,7 +18,7 @@ Index: ipmiutil-2.9.6/configure.ac
  
  AC_ARG_ENABLE([useflags],
      [  --enable-useflags    include environment CFLAGS and LDFLAGS.],
-@@ -191,25 +190,42 @@ AC_ARG_ENABLE([gpl],
+@@ -200,29 +199,42 @@ AC_ARG_ENABLE([gpl],
  
  dnl Does this Linux have systemd enabled?  Otherwise use sysv init.
  AC_ARG_ENABLE([systemd],
@@ -130,7 +26,12 @@ Index: ipmiutil-2.9.6/configure.ac
 -if test "x$enable_systemd" = "xyes"; then
 -   GPL_CFLAGS="$GPL_CFLAGS -DENABLE_SYSTEMD"
 -   # if systemd enabled, install service scripts in unitdir
--   SYSTEMD_DIR=`rpm --eval "%{_unitdir}"`
+-   which rpm >/dev/null 2>&1
+-   if test  $? -eq 0 ; then
+-	SYSTEMD_DIR=`rpm --eval "%{_unitdir}"`
+-   else
+-    SYSTEMD_DIR=/usr/share/ipmiutil
+-   fi
 +    [  --enable-systemd[=systemddir]      install systemd unit file.  If 'yes'
 +        probe the system for unit directory.
 +        If a path is specified, assume that
@@ -164,16 +65,15 @@ Index: ipmiutil-2.9.6/configure.ac
 +	fi
  else
 -   # otherwise install the systemd service scripts in the data dir
--  if test  "x$sysname" = "xDarwin" ; then
--    # MacOS 'which' command returns 0 always
--    SYSTEMD_DIR=/usr/share/ipmiutil
--  else
--    which rpm >/dev/null 2>&1
--    if test  $? -eq 0 ; then
--       datad=`rpm --eval "%{_datadir}"`
--       SYSTEMD_DIR=${datad}/ipmiutil
--    else
--       SYSTEMD_DIR=/usr/share/ipmiutil
+-  SYSTEMD_DIR=/usr/share/ipmiutil
+-  if test "x$sysname" != "xDarwin" ; then
+-    if test  "x$os" != "xhpux" ; then
+-      # MacOS and HP-UX: 'which' command returns 0 always
+-      which rpm >/dev/null 2>&1
+-      if test  $? -eq 0 ; then
+-         datad=`rpm --eval "%{_datadir}"`
+-         SYSTEMD_DIR=${datad}/ipmiutil
+-      fi
 -    fi
 -  fi
 +	if test "$withval" != no; then
@@ -183,7 +83,7 @@ Index: ipmiutil-2.9.6/configure.ac
  fi
  
  dnl start main logic
-@@ -481,7 +497,7 @@ AC_SUBST(INS_LIB)
+@@ -528,7 +540,7 @@ AC_SUBST(INS_LIB)
  AC_SUBST(SUBDIR_S)
  AC_SUBST(CROSS_CFLAGS)
  AC_SUBST(CROSS_LFLAGS)
@@ -192,74 +92,10 @@ Index: ipmiutil-2.9.6/configure.ac
  AC_SUBST(SHR_LINK)
  AC_SUBST(pkgconfigdir)
  
-Index: ipmiutil-2.9.6/Makefile.in
-===================================================================
---- ipmiutil-2.9.6.orig/Makefile.in
-+++ ipmiutil-2.9.6/Makefile.in
-@@ -182,7 +182,7 @@ SHELL = @SHELL@
- SHR_LINK = @SHR_LINK@
- STRIP = @STRIP@
- SUBDIR_S = @SUBDIR_S@
--SYSTEMD_DIR = @SYSTEMD_DIR@
-+SYSTEMD_DIR = @systemddir@
- VERSION = @VERSION@
- abs_builddir = @abs_builddir@
- abs_srcdir = @abs_srcdir@
-@@ -233,6 +233,7 @@ sbindir = @sbindir@
- sharedstatedir = @sharedstatedir@
- srcdir = @srcdir@
- sysconfdir = @sysconfdir@
-+systemddir = @systemddir@
- target_alias = @target_alias@
- top_build_prefix = @top_build_prefix@
- top_builddir = @top_builddir@
-Index: ipmiutil-2.9.6/scripts/Makefile.in
-===================================================================
---- ipmiutil-2.9.6.orig/scripts/Makefile.in
-+++ ipmiutil-2.9.6/scripts/Makefile.in
-@@ -126,7 +126,7 @@ SHELL = @SHELL@
- SHR_LINK = @SHR_LINK@
- STRIP = @STRIP@
- SUBDIR_S = @SUBDIR_S@
--SYSTEMD_DIR = @SYSTEMD_DIR@
-+SYSTEMD_DIR = @systemddir@
- VERSION = @VERSION@
- abs_builddir = @abs_builddir@
- abs_srcdir = @abs_srcdir@
-@@ -195,7 +195,8 @@ cronto = ${DESTDIR}${etcdir}/cron.daily
- sbinto = ${DESTDIR}${sbindir}
- varto = ${DESTDIR}/var/lib/ipmiutil
- initto = ${DESTDIR}@INIT_DIR@
--sysdto = ${DESTDIR}@SYSTEMD_DIR@
-+sysdto = ${DESTDIR}@systemddir@
-+systemddir = @systemddir@
- sysvinit = ${datato}
- sbinfls = ialarms ihealth ifru igetevent ireset icmd isol ilan isensor isel iserial iwdt iconfig ipicmg ifirewall ifwum ihpm
- all: all-am
-@@ -398,11 +399,14 @@ install:
- 	${INSTALL_SCRIPT_SH} evt.sh       ${datato}
- 	if [ -f /etc/debian_version ]; then \
- 	   sysvinit=${initto}; fi
--	${INSTALL_SCRIPT_SH} ipmiutil_wdt ${sysvinit}/ipmiutil_wdt
--	${INSTALL_SCRIPT_SH} ipmiutil_asy ${sysvinit}/ipmiutil_asy
--	${INSTALL_SCRIPT_SH} ipmiutil_evt ${sysvinit}/ipmiutil_evt
--	${INSTALL_SCRIPT_SH} ipmi_port.sh ${sysvinit}/ipmi_port
--	${INSTALL_SCRIPT_SH} ipmi_info    ${sysvinit}/ipmi_info
-+	if [ ! -z "${systemddir}" ]; then \
-+		$(MKDIR) ${sysdto}; \
-+		${INSTALL_SCRIPT_SH} ipmiutil_wdt ${sysvinit}/ipmiutil_wdt; \
-+		${INSTALL_SCRIPT_SH} ipmiutil_asy ${sysvinit}/ipmiutil_asy; \
-+		${INSTALL_SCRIPT_SH} ipmiutil_evt ${sysvinit}/ipmiutil_evt; \
-+		${INSTALL_SCRIPT_SH} ipmi_port.sh ${sysvinit}/ipmi_port; \
-+		${INSTALL_SCRIPT_SH} ipmi_info    ${sysvinit}/ipmi_info; \
-+	fi
- 	${INSTALL_SCRIPT_SH} checksel     ${datato}
- 	${INSTALL_DATA_SH} ipmiutil_wdt.service ${sysdto}
- 	${INSTALL_DATA_SH} ipmiutil_asy.service ${sysdto}
-Index: ipmiutil-2.9.6/scripts/Makefile.am
+Index: ipmiutil-3.0.5/scripts/Makefile.am
 ===================================================================
---- ipmiutil-2.9.6.orig/scripts/Makefile.am
-+++ ipmiutil-2.9.6/scripts/Makefile.am
+--- ipmiutil-3.0.5.orig/scripts/Makefile.am
++++ ipmiutil-3.0.5/scripts/Makefile.am
 @@ -17,7 +17,8 @@ cronto = ${DESTDIR}${etcdir}/cron.daily
  sbinto = ${DESTDIR}${sbindir}
  varto  = ${DESTDIR}/var/lib/ipmiutil
@@ -268,7 +104,7 @@ Index: ipmiutil-2.9.6/scripts/Makefile.am
 +sysdto = ${DESTDIR}@systemddir@
 +systemddir = @systemddir@
  sysvinit = ${datato}
- sbinfls = ialarms ihealth ifru igetevent ireset icmd isol ilan isensor isel iserial iwdt iconfig ipicmg ifirewall ifwum ihpm
+ sbinfls = ialarms ihealth ifru igetevent ireset icmd isol ilan isensor isel iserial iwdt iconfig ipicmg ifirewall ifwum ihpm iuser
  
 @@ -47,10 +48,14 @@ install:
  	${INSTALL_SCRIPT_SH} ipmi_port.sh ${sysvinit}/ipmi_port
@@ -289,30 +125,3 @@ Index: ipmiutil-2.9.6/scripts/Makefile.am
  	${INSTALL_SCRIPT_SH} ipmiutil.env     ${datato}
  	${INSTALL_SCRIPT_SH} ipmiutil.pre     ${datato}
  	${INSTALL_SCRIPT_SH} ipmiutil.setup   ${datato}
-Index: ipmiutil-2.9.6/lib/Makefile.in
-===================================================================
---- ipmiutil-2.9.6.orig/lib/Makefile.in
-+++ ipmiutil-2.9.6/lib/Makefile.in
-@@ -128,7 +128,7 @@ SHELL = @SHELL@
- SHR_LINK = @SHR_LINK@
- STRIP = @STRIP@
- SUBDIR_S = @SUBDIR_S@
--SYSTEMD_DIR = @SYSTEMD_DIR@
-+SYSTEMD_DIR = @systemddir@
- VERSION = @VERSION@
- abs_builddir = @abs_builddir@
- abs_srcdir = @abs_srcdir@
-Index: ipmiutil-2.9.6/lib/lanplus/Makefile.in
-===================================================================
---- ipmiutil-2.9.6.orig/lib/lanplus/Makefile.in
-+++ ipmiutil-2.9.6/lib/lanplus/Makefile.in
-@@ -177,7 +177,8 @@ SHELL = @SHELL@
- SHR_LINK = @SHR_LINK@
- STRIP = @STRIP@
- SUBDIR_S = @SUBDIR_S@
--SYSTEMD_DIR = @SYSTEMD_DIR@
-+SYSTEMD_DIR = @systemddir@
-+systemddir = @systemddir@
- VERSION = @VERSION@
- abs_builddir = @abs_builddir@
- abs_srcdir = @abs_srcdir@
diff --git a/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb b/meta-oe/recipes-support/ipmiutil/ipmiutil_3.0.5.bb
similarity index 76%
rename from meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb
rename to meta-oe/recipes-support/ipmiutil/ipmiutil_3.0.5.bb
index ee0766ea7..338cafd53 100644
--- a/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb
+++ b/meta-oe/recipes-support/ipmiutil/ipmiutil_3.0.5.bb
@@ -13,17 +13,17 @@ is detected."
 
 HOMEPAGE = "http://ipmiutil.sourceforge.net"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5f9372493401f309e6149dd2ce0a044b"
+LIC_FILES_CHKSUM = "file://COPYING;md5=626a5970304daa1fcb87f757fb42b795"
 
 DEPENDS += "openssl"
 
 PARALLEL_MAKE = ""
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/ipmiutil/ipmiutil-${PV}.tar.gz \
-    file://fix_systemd_path.patch "
-
-SRC_URI[md5sum] = "462087995f05fa9e692ed7f55c840f71"
-SRC_URI[sha256sum] = "884c1f3d8bfb0b33c303973d286c3166f5a537976451a0312e3524af54771519"
+           file://fix_systemd_path.patch \
+          "
+SRC_URI[md5sum] = "5feaf6a827205792e057bb4ff5c4e842"
+SRC_URI[sha256sum] = "b2d7f72535131c7832ba4be13dc33c81513fc3ee43fe797b4b52014600ecee5e"
 
 inherit autotools-brokensep pkgconfig systemd
 
@@ -43,20 +43,4 @@ PACKAGECONFIG[standalone] = "--enable-standalone, --enable-standalone=no"
 CFLAGS += "-I${STAGING_INCDIR}"
 LDFLAGS += "-L${STAGING_LIBDIR}"
 
-do_configure () {
-    aclocal
-    libtoolize --automake --copy --force
-    autoheader
-    automake --foreign --add-missing --copy
-
-    aclocal
-    autoconf
-    automake --foreign
-    ./configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
-}
-
-do_install () {
-    oe_runmake install DESTDIR=${D}
-}
-
 COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
-- 
2.13.2


