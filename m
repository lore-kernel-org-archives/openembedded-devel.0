Received: from qmta01.westchester.pa.hmc1.comcast.net ([76.96.53.8])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jfaith@soundmetrics.com>) id 1NYpHL-0002hR-LJ
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 00:20:35 +0100
Received: from omta01.westchester.pa.hmc1.comcast.net ([76.96.53.6])
	by qmta01.westchester.pa.hmc1.comcast.net with comcast
	id ZAcG1d002082Dic01BGyjd; Sat, 23 Jan 2010 23:16:58 +0000
Received: from fermion ([75.147.191.205])
	by omta01.westchester.pa.hmc1.comcast.net with bizsmtp
	id ZBGx1d0014SLwm301BGyq4; Sat, 23 Jan 2010 23:16:58 +0000
Received: from jfaith by fermion with local (Exim 4.69)
	(envelope-from <jfaith@fermion.soundmetrics.com>)
	id 1NYpDu-00025o-DI; Sat, 23 Jan 2010 15:16:58 -0800
From: John Faith <john@soundmetrics.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2010 15:16:46 -0800
Message-Id: <1264288606-8013-1-git-send-email-john@soundmetrics.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 76.96.53.8
X-SA-Exim-Mail-From: jfaith@soundmetrics.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH v2] socat: Add version 1.7.1.2
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
X-List-Received-Date: Sat, 23 Jan 2010 23:20:35 -0000

Second try. Added package source checksums, changed PR to r0, and removed some trailing whitespace in the patch.

Allow socat 1.7.1.2 to cross build.  In configure.in, the 4th value in AC_TRY_RUN() gives a default value for cross build environments since a test program cannot be run on the build system.  There are 2 places where AC_MSG_RESULT() is used instead of a default value which seems to result in code like "#define CRDLY_SHIFT" which breaks preprocessor checks like "#if CRDLY_SHIFT >= 0".

The patch gives default values in configure and configure.in for cross compiling and checks were added in the affected source.

Signed-off-by: John Faith <john@soundmetrics.com>
---
 conf/checksums.ini                            |    4 +
 recipes/socat/files/socat-1.7.1.2-cross.patch |   98 +++++++++++++++++++++++++
 recipes/socat/socat_1.7.1.2.bb                |   23 ++++++
 3 files changed, 125 insertions(+), 0 deletions(-)
 create mode 100644 recipes/socat/files/socat-1.7.1.2-cross.patch
 create mode 100644 recipes/socat/socat_1.7.1.2.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 68babd1..d191072 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -25150,6 +25150,10 @@ sha256=ecfbca297c26eff6cb04c2c45af1ee5c21d4a123a05f8b056a1c81ffcdfa1e3a
 md5=860fe417ea5e9ca2d2b2225192b85b87
 sha256=ecfbca297c26eff6cb04c2c45af1ee5c21d4a123a05f8b056a1c81ffcdfa1e3a
 
+[http://www.dest-unreach.org/socat/download/socat-1.7.1.2.tar.bz2]
+md5=9c0c5e83ce665f38d4d3aababad275eb
+sha256=f7395b154914bdaa49805603aac2a90fb3d60255f95691d7779ab4680615e167
+
 [http://download.ronetix.info/sk-eb926x/linux/kernel/2.6.25.4/socketcan-driver-at91.patch]
 md5=fe6945121eaea5e9c570e3dad54d7569
 sha256=578db455270592833156358f79205b21701aa12b64142da16df08fb36fca3322
diff --git a/recipes/socat/files/socat-1.7.1.2-cross.patch b/recipes/socat/files/socat-1.7.1.2-cross.patch
new file mode 100644
index 0000000..159e514
--- /dev/null
+++ b/recipes/socat/files/socat-1.7.1.2-cross.patch
@@ -0,0 +1,98 @@
+--- socat-1.7.1.2/configure.in.orig	2010-01-10 05:29:50.000000000 -0800
++++ socat-1.7.1.2/configure.in	2010-01-21 09:41:42.959191482 -0800
+@@ -1286,10 +1286,13 @@ AC_CACHE_CHECK(shift offset of $1, $2,
+  ],
+  [$2=`cat $conftestoffset`],
+  [$2=-1],
+- [AC_MSG_RESULT(please determine $1_SHIFT manually)]
++ [$2=-1]
+ )
+  LIBS="$LIBS1"])
+ AC_DEFINE_UNQUOTED($1_SHIFT, ${$2})
++if test "$2" = -1; then
++AC_MSG_WARN(please determine $1_SHIFT manually)
++fi
+ ])
+
+ AC_SHIFT_OFFSET(CRDLY,  sc_cv_sys_crdly_shift)
+--- socat-1.7.1.2/configure.orig	2010-01-10 05:39:29.000000000 -0800
++++ socat-1.7.1.2/configure	2010-01-21 10:01:27.463190768 -0800
+@@ -13596,6 +13596,7 @@ else
+  if test "$cross_compiling" = yes; then
+   { echo "$as_me:$LINENO: result: please determine CRDLY_SHIFT manually" >&5
+ echo "${ECHO_T}please determine CRDLY_SHIFT manually" >&6; }
++	sc_cv_sys_crdly_shift=-1
+
+ else
+   cat >conftest.$ac_ext <<_ACEOF
+@@ -13680,6 +13681,7 @@ else
+  if test "$cross_compiling" = yes; then
+   { echo "$as_me:$LINENO: result: please determine TABDLY_SHIFT manually" >&5
+ echo "${ECHO_T}please determine TABDLY_SHIFT manually" >&6; }
++	sc_cv_sys_tabdly_shift=-1
+
+ else
+   cat >conftest.$ac_ext <<_ACEOF
+@@ -13764,6 +13766,7 @@ else
+  if test "$cross_compiling" = yes; then
+   { echo "$as_me:$LINENO: result: please determine CSIZE_SHIFT manually" >&5
+ echo "${ECHO_T}please determine CSIZE_SHIFT manually" >&6; }
++	sc_cv_sys_csize_shift=-1
+
+ else
+   cat >conftest.$ac_ext <<_ACEOF
+--- socat-1.7.1.2/xioopts.c.orig	2010-01-04 04:29:36.000000000 -0800
++++ socat-1.7.1.2/xioopts.c	2010-01-21 10:54:03.561742501 -0800
+@@ -763,7 +763,7 @@ const struct optname optionnames[] = {
+ 	IF_IP6    ("ipv6only",	&opt_ipv6_v6only)
+ #endif
+ 	IF_TERMIOS("isig",	&opt_isig)
+-#ifdef HAVE_TERMIOS_ISPEED
++#if defined(HAVE_TERMIOS_ISPEED) && defined(ISPEED_OFFSET) && (ISPEED_OFFSET != -1)
+ 	IF_TERMIOS("ispeed",	&opt_ispeed)
+ #endif
+ 	IF_TERMIOS("istrip",	&opt_istrip)
+@@ -1077,7 +1077,7 @@ const struct optname optionnames[] = {
+ 	IF_OPENSSL("openssl-pseudo",	&opt_openssl_pseudo)
+ 	IF_OPENSSL("openssl-verify",	&opt_openssl_verify)
+ 	IF_TERMIOS("opost",	&opt_opost)
+-#ifdef HAVE_TERMIOS_ISPEED
++#if defined(HAVE_TERMIOS_ISPEED) && defined(OSPEED_OFFSET) && (OSPEED_OFFSET != -1)
+ 	IF_TERMIOS("ospeed",	&opt_ospeed)
+ #endif
+ 	IF_ANY    ("owner",	&opt_user)
+--- socat-1.7.1.2/xio-termios.c.orig	2009-04-02 00:32:48.000000000 -0700
++++ socat-1.7.1.2/xio-termios.c	2010-01-21 10:51:46.627690848 -0800
+@@ -270,8 +270,12 @@ const struct optdesc opt_raw      = { "r
+ const struct optdesc opt_sane     = { "sane",   NULL,    OPT_SANE,     GROUP_TERMIOS, PH_FD, TYPE_CONST, OFUNC_TERMIOS_SPEC };
+
+ #ifdef HAVE_TERMIOS_ISPEED
++#if defined(ISPEED_OFFSET) && (ISPEED_OFFSET != -1)
++#if defined(OSPEED_OFFSET) && (OSPEED_OFFSET != -1)
+ const struct optdesc opt_ispeed = { "ispeed", NULL, OPT_ISPEED, GROUP_TERMIOS, PH_FD, TYPE_UINT, OFUNC_TERMIOS_SPEED, ISPEED_OFFSET };
+ const struct optdesc opt_ospeed = { "ospeed", NULL, OPT_OSPEED, GROUP_TERMIOS, PH_FD, TYPE_UINT, OFUNC_TERMIOS_SPEED, OSPEED_OFFSET };
++#endif
++#endif
+ #endif /* HAVE_TERMIOS_ISPEED */
+
+
+--- socat-1.7.1.2/xioinitialize.c.orig	2009-04-02 00:32:48.000000000 -0700
++++ socat-1.7.1.2/xioinitialize.c	2010-01-21 10:46:50.620191091 -0800
+@@ -62,12 +62,16 @@ int xioinitialize(void) {
+       assert(tdata.termarg.c_oflag == tdata.flags[1]);
+       assert(tdata.termarg.c_cflag == tdata.flags[2]);
+       assert(tdata.termarg.c_lflag == tdata.flags[3]);
+-#if HAVE_TERMIOS_ISPEED
++#if HAVE_TERMIOS_ISPEED && (ISPEED_OFFSET != -1) && (OSPEED_OFFSET != -1)
++#if defined(ISPEED_OFFSET) && (ISPEED_OFFSET != -1)
++#if defined(OSPEED_OFFSET) && (OSPEED_OFFSET != -1)
+       tdata.termarg.c_ispeed = 0x56789abc;
+       tdata.termarg.c_ospeed = 0x6789abcd;
+       assert(tdata.termarg.c_ispeed == tdata.speeds[ISPEED_OFFSET]);
+       assert(tdata.termarg.c_ospeed == tdata.speeds[OSPEED_OFFSET]);
+ #endif
++#endif
++#endif
+    }
+ #endif
+
diff --git a/recipes/socat/socat_1.7.1.2.bb b/recipes/socat/socat_1.7.1.2.bb
new file mode 100644
index 0000000..2214354
--- /dev/null
+++ b/recipes/socat/socat_1.7.1.2.bb
@@ -0,0 +1,23 @@
+SECTION = "console/network"
+DEPENDS = "openssl readline"
+DESCRIPTION = "Socat is a network relay for bidirectional data \
+transfer between two independent data channels."
+LICENSE = "GPL"
+PR = "r0"
+
+SRC_URI = "http://www.dest-unreach.org/socat/download/${P}.tar.bz2 \
+           file://socat-1.7.1.2-cross.patch;patch=1 "
+
+inherit autotools
+
+do_configure() {
+	# Override this function so the included config.h.in is used instead
+	# of recreating it with autoheader.
+	(cd ${S} && gnu-configize) || die "failure in running gnu-configize"
+	oe_runconf
+}
+
+do_install_prepend () {
+	mkdir -p ${D}${bindir}
+	install -d ${D}${bindir} ${D}${mandir}/man1
+}
-- 
1.6.3.3



