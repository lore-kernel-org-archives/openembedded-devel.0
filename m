Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id C02BC7FD7C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 07:04:39 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id q10so1853680wrm.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 23:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=/LTWayJ9Z6Uu+s1odBapGa17IoD6n+nPldRwoOaeBAc=;
	b=H87mPfPzglVcEL8jDA/iLtelbB2pyvApCSOiYk4Qp62YS0kjBbN6PXiyGJedGzYDD8
	vD2KTt5e6U1A1V9LPWDzl11Tt1UlTkUkE5hxlHLBzcU9HABdVF82myeV91cP93Fhl9mc
	zgau0rwCC59Abj5v+qFIlshAbxJSRU8lXa7a+/3IvHAgcCOFZ6wW7mtJT6Af2X2SaZUW
	eiA4E7VeaZh1NmRNo8Fj2VQH3fIg72apWAk2rUCyDR29JFaGoMxkfu81/BxrLZ1ZjG/O
	WN3hhxTFIuJgFfcf5fhjVMsDX2WTDA9H2TVZOKw4Wx/raXMn0EiG0iJHIQ8bKQaDYvth
	feDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/LTWayJ9Z6Uu+s1odBapGa17IoD6n+nPldRwoOaeBAc=;
	b=a3ycNNsyiLN47eQYokERSyd2aqxvUyPwxU7IFzW1QFXK0EOqinDyN8CXrw0umhaAkJ
	y0WKJ+rotawiQqhVs9xlIccjf6/49u9pfoa7Xq3BIg7OGTWMQsRfMAXhzPgZb1vbB+dn
	G0AHA+VPnnajKzFkZWkaw0ai1cFp506Y7oL0h/ftjxHmT0kBvt2IgKABBi4zvU32QmE6
	WkbrHBOmu1ltHg+DAQWg+a7tutJqYQRJT6yrxGG0j/4il70mBi+fbWUnUKi36+5Jim/7
	0qnXFFGjv1QX5dgz1N/jHSkIg3Picp17W4CuGnfg5YFQEh74t0KkHEvm+i49B3sBzUH/
	/lbg==
X-Gm-Message-State: APjAAAURppvjZNSs/5NlrMD53OTG91JfJAfcMDXsPRubu8viQ2n2JYyR
	JGdJPHnWGO2Ab+Ofe8UxBPwUaO2CdZI=
X-Google-Smtp-Source: APXvYqx1czVrpIY5d0ulu7997p9MjBU0KXQDr9Bg8MeTC7hTxYIc1S/d9JyoUWtr9Mj3UxhDo2JJYA==
X-Received: by 2002:a5d:6284:: with SMTP id k4mr3551732wru.398.1579590279720; 
	Mon, 20 Jan 2020 23:04:39 -0800 (PST)
Received: from superandy.speedport.ip ([2003:f0:7f3c:a181:cd3d:6aad:9ff5:758d])
	by smtp.gmail.com with ESMTPSA id
	e16sm51237593wrs.73.2020.01.20.23.04.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 23:04:38 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Date: Tue, 21 Jan 2020 08:04:18 +0100
Message-Id: <20200121070418.2197-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200121070418.2197-1-schnitzeltony@gmail.com>
References: <20200121070418.2197-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] mozjs: upgrade 60.5.2 -> 60.9.0 and rework
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
X-List-Received-Date: Tue, 21 Jan 2020 07:04:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* build with firefox-esr sources to simplyfy upgrade path
* cleanup: Should make python2-> python3 transition easier

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...001-do-not-create-python-environment.patch | 15 +----
 ...toconf-2.13-to-refresh-old.configure.patch | 42 --------------
 ...ix-cross-compilation-on-i586-targets.patch | 20 +++++--
 .../{mozjs_60.5.2.bb => mozjs_60.9.0.bb}      | 56 +++++++++----------
 4 files changed, 45 insertions(+), 88 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0004-do-not-use-autoconf-2.13-to-refresh-old.configure.patch
 rename meta-oe/recipes-extended/mozjs/{mozjs_60.5.2.bb => mozjs_60.9.0.bb} (82%)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-do-not-create-python-environment.patch b/meta-oe/recipes-extended/mozjs/mozjs/0001-do-not-create-python-environment.patch
index a3c1b69e2..985fc36c1 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/0001-do-not-create-python-environment.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0001-do-not-create-python-environment.patch
@@ -8,10 +8,12 @@ Use oe's python environment rather than create one of host
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Rebase to 60.9.0 (firefox-esr sources)
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
  build/moz.configure/init.configure | 18 ------------------
  configure.py                       | 10 +++++++++-
- js/src/old-configure               |  4 ++--
  3 files changed, 11 insertions(+), 21 deletions(-)
 
 --- a/build/moz.configure/init.configure
@@ -60,14 +62,3 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  from mozbuild.configure import ConfigureSandbox
  from mozbuild.makeutil import Makefile
  from mozbuild.pythonutil import iter_modules_in_path
---- a/js/src/old-configure
-+++ b/js/src/old-configure
-@@ -9974,7 +9974,7 @@ if test "$JS_STANDALONE"; then
-   
- if test "$no_recursion" != yes; then
-   trap '' EXIT
--  if ! $PYTHON $_topsrcdir/build/subconfigure.py --list subconfigures --skip skip_subconfigures; then
-+  if ! PYTHONPATH=$_topsrcdir/python/mozbuild/ $PYTHON $_topsrcdir/build/subconfigure.py --list subconfigures --skip skip_subconfigures; then
-       exit 1
-   fi
- fi
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0004-do-not-use-autoconf-2.13-to-refresh-old.configure.patch b/meta-oe/recipes-extended/mozjs/mozjs/0004-do-not-use-autoconf-2.13-to-refresh-old.configure.patch
deleted file mode 100644
index 4cba79c5b..000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs/0004-do-not-use-autoconf-2.13-to-refresh-old.configure.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From a46adb74b5ba5e17d676d31d70faca76c1381d15 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 12 Jul 2018 21:25:46 +0800
-Subject: [PATCH 4/5] do not use autoconf 2.13 to refresh old.configure
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- build/moz.configure/old.configure | 2 +-
- js/src/old-configure              | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/build/moz.configure/old.configure b/build/moz.configure/old.configure
-index ece47f4..a73900f 100644
---- a/build/moz.configure/old.configure
-+++ b/build/moz.configure/old.configure
-@@ -83,7 +83,7 @@ def prepare_configure(old_configure, mozconfig, autoconf, build_env, shell,
-             old_configure = os.path.join(old_configure_dir, 'js', 'src',
-                                          os.path.basename(old_configure))
- 
--    refresh = True
-+    refresh = False
-     if exists(old_configure):
-         mtime = getmtime(old_configure)
-         aclocal = os.path.join(build_env.topsrcdir, 'build', 'autoconf',
-diff --git a/js/src/old-configure b/js/src/old-configure
-index 75b00e1..8a8ef52 100644
---- a/js/src/old-configure
-+++ b/js/src/old-configure
-@@ -619,7 +619,7 @@ if test -z "$srcdir"; then
-   ac_prog=$0
-   ac_confdir=`echo $ac_prog|sed 's%/[^/][^/]*$%%'`
-   test "x$ac_confdir" = "x$ac_prog" && ac_confdir=.
--  srcdir=$ac_confdir
-+  srcdir="$ac_confdir/../../"
-   if test ! -r $srcdir/$ac_unique_file; then
-     srcdir=..
-   fi
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-compilation-on-i586-targets.patch b/meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-compilation-on-i586-targets.patch
index 3ac25f6ae..e0929a8a8 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-compilation-on-i586-targets.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-compilation-on-i586-targets.patch
@@ -13,18 +13,26 @@ Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
 
 Rebase to 52.8.1
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Rebase to 60.9.0 (firefox-esr sources)
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
- js/src/old-configure | 2 +-
+ js/src/old-configure.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
---- a/js/src/old-configure
-+++ b/js/src/old-configure
-@@ -3833,7 +3833,7 @@ AS='$(CC)'
+diff --git a/js/src/old-configure.in b/js/src/old-configure.in
+index 3d53ee1..11c3d5a 100644
+--- a/js/src/old-configure.in
++++ b/js/src/old-configure.in
+@@ -405,7 +405,7 @@ AS='$(CC)'
  AS_DASH_C_FLAG='-c'
  MOZ_USER_DIR=".mozilla"
  
 -MOZ_FIX_LINK_PATHS="-Wl,-rpath-link,${DIST}/bin -Wl,-rpath-link,${prefix}/lib"
 +MOZ_FIX_LINK_PATHS="-Wl,-rpath-link,${DIST}/bin"
  
- 
- 
+ dnl Configure platform-specific CPU architecture compiler options.
+ dnl ==============================================================
+-- 
+2.21.0
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb b/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb
similarity index 82%
rename from meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb
rename to meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb
index 389bcac92..e229bf424 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb
@@ -3,13 +3,12 @@ HOMEPAGE = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/SpiderMonk
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dc9b6ecd19a14a54a628edaaf23733bf"
 
-SRC_URI = "https://dev.gentoo.org/~axs/distfiles/mozjs-60.5.2.tar.bz2 \
+SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/firefox-${PV}esr.source.tar.xz \
            file://0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch \
            file://0010-fix-cross-compilation-on-i586-targets.patch \
            file://0001-do-not-create-python-environment.patch \
            file://0002-fix-cannot-find-link.patch \
            file://0003-workaround-autoconf-2.13-detection-failed.patch \
-           file://0004-do-not-use-autoconf-2.13-to-refresh-old.configure.patch \
            file://0005-fix-do_compile-failed-on-mips.patch \
            file://add-riscv-support.patch \
            file://0001-mozjs-fix-coredump-caused-by-getenv.patch \
@@ -26,15 +25,18 @@ SRC_URI_append_libc-musl = " \
 SRC_URI_append_mipsarchn32 = " \
            file://0001-fix-compiling-failure-on-mips64-n32-bsp.patch \
            "
-SRC_URI[md5sum] = "023ed014e9e93d01620d121bc06a3589"
-SRC_URI[sha256sum] = "f51039c997415fd0f13f8e01966b4a8ff80cbf90deb8b14c18827104a369cc0d"
+SRC_URI[md5sum] = "69a0be9ce695e5dc4941ed0c78ef00c2"
+SRC_URI[sha256sum] = "9f453c8cc5669e46e38f977764d49a36295bf0d023619d9aac782e6bb3e8c53f"
+
+S = "${WORKDIR}/firefox-${@d.getVar("PV").replace("esr", "")}"
 
 inherit autotools pkgconfig perlnative pythonnative
 
 inherit features_check
 CONFLICT_DISTRO_FEATURES_mipsarchn32 = "ld-is-gold"
 
-DEPENDS += "nspr zlib python-six-native python-pytoml-native \
+DEPENDS += "nspr zlib autoconf-2.13-native \
+            python-six-native python-pytoml-native \
             python-jsmin-native python-futures-native \
             python-which-native"
 
@@ -77,15 +79,9 @@ export HOST_CXXFLAGS = "${BUILD_CXXFLAGS}"
 
 do_configure() {
     export SHELL="/bin/sh"
-    export TMP="${B}"
-    ${S}/js/src/configure ${EXTRA_OECONF}
-}
-
-do_compile_prepend() {
-    export SHELL="/bin/sh"
-    export S
-    export PYTHONPATH
     cd ${S}
+    # Add mozjs python-modules necessary
+    PYTHONPATH="$PYTHONPATH:${S}/config:${S}/build"
     for sub_dir in python testing/mozbase; do
         for module_dir in `ls $sub_dir -1`;do
             [ $module_dir = "virtualenv" ] && continue
@@ -94,25 +90,29 @@ do_compile_prepend() {
             fi
         done
     done
-    PYTHONPATH="$PYTHONPATH:${S}/config:${S}/build"
-    cd -
+    echo "$PYTHONPATH" > ${B}/PYTHONPATH
+    export PYTHONPATH=`cat ${B}/PYTHONPATH`
+
+    cd ${S}/js/src
+    autoconf213 --macrodir=${STAGING_DATADIR_NATIVE}/autoconf213 old-configure.in > old-configure
+    sed -i 's:refresh = True:refresh = False:g' ${S}/build/moz.configure/old.configure
+
+    cd ${B}
+    ${S}/js/src/configure ${EXTRA_OECONF}
+
+    # Make standard Makefile checks pass
+    touch ${S}/js/src/configure
+    touch ${B}/config.status
+}
+
+do_compile_prepend() {
+    export SHELL="/bin/sh"
+    export PYTHONPATH=`cat ${B}/PYTHONPATH`
 }
 
 do_install_prepend() {
     export SHELL="/bin/sh"
-    export S
-    export PYTHONPATH
-    cd ${S}
-    for sub_dir in python testing/mozbase; do
-        for module_dir in `ls $sub_dir -1`;do
-            [ $module_dir = "virtualenv" ] && continue
-            if [ -d "${S}/$sub_dir/$module_dir" ];then
-                PYTHONPATH="$PYTHONPATH:${S}/$sub_dir/$module_dir"
-            fi
-        done
-    done
-    PYTHONPATH="$PYTHONPATH:${S}/config:${S}/build"
-    cd -
+    export PYTHONPATH=`cat ${B}/PYTHONPATH`
 }
 
 PACKAGES =+ "lib${BPN}"
-- 
2.21.0


