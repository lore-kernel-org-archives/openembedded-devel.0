Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D4C8E73196
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 12:06:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 466ZMK3ZSDz4q
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 14:06:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1565611597;
	bh=X/rsykDYHc+a9mse65eSbeW6aJpL3QF5qGNAbpJWAyI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=f6/oztuEyjXtr2mbdS9L+TskoLJ8Dfe4ZbM5XkDg/SwByRkiYa68LHKV0g7jGohE9
	5WcWJwAKrzWWq7uvYzWQ0tdPbwvRJ10cGTcu3z9tmD+bnhdfUQbsw2KnacAv0hJLun
	QUimHoSWWstaLGwZhQZVbo4JwIn20tm11ArJmQFTYy7NRImENtpbmOFhVhCqVobzPb
	t8s6Bm2BGKhtW9ez0QGwxZjKGDKhd+PP+g2aApc+iPBJUZWuFy4pU8VTHWt3SC4dRJ
	UN1oxCMn8T0Od3LFKC132JR7sxWz8bT7qVxL4/tX4/gLe2AgBS23LPYR3jWqwuOWtI
	6jH2Iqwa86usbxzm2WmL4ZNfyH1NYlkZnwrqzR2v2Bw5lwNBBCNhNtBWHkqMotHQIm
	oGzbgtrN+Qph/Z2aMV6TzWjtrvJHqwkqcYZ3Iks9b93xjMfEj9aXttf45MwvXPndXB
	6Um+K2LBLLoxkoJrBqM/uOo+sAmCeaWGtV1XYHc09/fGb3y18iP/hD0kETYsm2pu6N
	i9GkYS+Mx/yhPYop223gaoXDIBuExU2bLC4EvyuzOXodFI4Ufe5sSVvnPBYHRbcoV0
	1Nn2QFoQy6O+W3XxcZyS6K2462HvGLUb0/SNrwneeL0JDRbBt57xDJ6Wfyw1OuV+/Q
	J53m469d5yx0OokHJattdu2c=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Aug 2019 15:06:36 +0300
Message-Id: <20190812120636.22643-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190812120636.22643-1-bunk@stusta.de>
References: <20190812120636.22643-1-bunk@stusta.de>
Subject: [meta-oe][PATCH] t1lib: Remove, gtkmathview was the last user
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
X-List-Received-Date: Mon, 12 Aug 2019 12:06:37 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
The recipe will be submitted to meta-office.
---
 .../packagegroups/packagegroup-meta-oe.bb     |   2 +-
 .../t1lib/t1lib-5.1.2/configure.patch         | 141 -----------------
 .../t1lib/t1lib-5.1.2/format_security.patch   |  58 -------
 .../t1lib/t1lib-5.1.2/libtool.patch           | 144 ------------------
 meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb |  29 ----
 5 files changed, 1 insertion(+), 373 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/t1lib/t1lib-5.1.2/configure.patch
 delete mode 100644 meta-oe/recipes-extended/t1lib/t1lib-5.1.2/format_security.patch
 delete mode 100644 meta-oe/recipes-extended/t1lib/t1lib-5.1.2/libtool.patch
 delete mode 100644 meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 6a9592cfa..c77a1e54e 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -142,7 +142,7 @@ RDEPENDS_packagegroup-meta-oe-extended ="\
     can-utils libsocketcan tipcutils tiptop \
     tmux uml-utilities upm vlock volume-key wipe zlog zram \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11 wayland opengl", "boinc-client", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", " libgxim t1lib gnuplot libwmf", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", " libgxim gnuplot libwmf", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "bluez", "collectd", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam-plugin-ccreds pam-plugin-ldapdb", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam-ssh-agent-auth openwsman sblim-sfcb ", "", d)} \
diff --git a/meta-oe/recipes-extended/t1lib/t1lib-5.1.2/configure.patch b/meta-oe/recipes-extended/t1lib/t1lib-5.1.2/configure.patch
deleted file mode 100644
index 976e0380e..000000000
--- a/meta-oe/recipes-extended/t1lib/t1lib-5.1.2/configure.patch
+++ /dev/null
@@ -1,141 +0,0 @@
-From 81c1ba940415595584a837ab1078c64855072f0c Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Mon, 21 Nov 2011 12:00:54 +0100
-Subject: [PATCH] t1lib: add 5.1.2
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
----
- configure.in | 95 ++++++++++++++++++++++++------------------------------------
- 1 file changed, 38 insertions(+), 57 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index eade4c0..e649ea9 100644
---- a/configure.in
-+++ b/configure.in
-@@ -74,9 +74,9 @@ T1LIB_PATCHLEVEL=builtin(eval, MACRO_T1LIB_LT_REVISION)
- T1LIB_VERSIONSTRING=\"MACRO_T1LIB_IDENTIFIER\"
- 
- 
--dnl We use this file by Andreas Zeller to check for libXaw
--builtin(include, ac-tools/ice_find_athena.m4)
--builtin(include, ac-tools/aclocal.m4)
-+#dnl We use this file by Andreas Zeller to check for libXaw
-+#builtin(include, ac-tools/ice_find_athena.m4)
-+#builtin(include, ac-tools/aclocal.m4)
- 
- dnl We want these before the checks, so the checks can modify their values.
- test -z "$LDLIBS" && LDLIBS=-lm   AC_SUBST(LDLIBS)
-@@ -162,6 +162,7 @@ fi
- 
- dnl **** Check for underscore on external symbols ****
- 
-+AH_TEMPLATE([NEED_UNDERSCORE_PREFIX], [Define if external symbols need an underscore prefix])
- AC_CACHE_CHECK("whether external symbols need an underscore prefix",
-                ac_cv_c_extern_prefix,
- [saved_libs=$LIBS
-@@ -179,68 +180,48 @@ then
-   AC_DEFINE(NEED_UNDERSCORE_PREFIX)
- fi
- 
--dnl **** Check which ANSI integer type is 16 bit 
--
--AC_CACHE_CHECK( "which ANSI integer type is 16 bit", ac_16bit_type,
--		AC_TRY_RUN([
--int main(void) {
--  if (sizeof(short)==2)
--    return(0);
--  else if (sizeof(int)==2)
--    return(1);
--  else
--    return(2);
--}], ac_16bit_type="short", ac_16bit_type="int", ac_16bit_type=))
--if test "$ac_16bit_type" = "short"
--then
--  T1_AA_TYPE16="-DT1_AA_TYPE16=short"
--  T1_INT16="short"
--else
--  T1_AA_TYPE16="-DT1_AA_TYPE16=int"
--  T1_INT16="int"
-+dnl **** Check which ANSI integer type is 16 bit
-+T1_AA_TYPE16=""
-+for type in short int; do
-+	if test x"`eval echo \\$ac_cv_sizeof_$type`" = "x2"; then
-+		T1_AA_TYPE16="-DT1_AA_TYPE16=$type"
-+		T1_INT16="$type"
-+		break
-+	fi
-+done
-+
-+if test x"$T1_AA_TYPE16" = "x"; then
-+	AC_MSG_ERROR("Unable to determine which integer type is 16 bit.")
- fi
- 
--
- dnl **** Check which ANSI integer type is 32 bit 
--
--AC_CACHE_CHECK( "which ANSI integer type is 32 bit", ac_32bit_type,
--		AC_TRY_RUN([
--int main(void) {
--  if (sizeof(int)==4)
--    return(0);
--  else if (sizeof(long)==4)
--    return(1);
--  else
--    return(2);
--}], ac_32bit_type="int", ac_32bit_type="long", ac_32bit_type=))
--if test "$ac_32bit_type" = "int"
--then
--  T1_AA_TYPE32="-DT1_AA_TYPE32=int"
--  T1_INT32="int"
--else
--  T1_AA_TYPE32="-DT1_AA_TYPE32=long"
--  T1_INT32="long"
-+T1_AA_TYPE32=""
-+for type in int long; do
-+	if test x"`eval echo \\$ac_cv_sizeof_$type`" = "x4"; then
-+		T1_AA_TYPE32="-DT1_AA_TYPE32=$type"
-+		T1_INT32="$type"
-+		break
-+	fi
-+done
-+
-+if test x"$T1_AA_TYPE32" = "x"; then
-+	AC_MSG_ERROR("Unable to determine which integer type is 32 bit.")
- fi
- 
--
- dnl **** Check which ANSI integer type is 64 bit 
--
--AC_CACHE_CHECK( "which ANSI integer type is 64 bit", ac_64bit_type,
--		AC_TRY_RUN([
--int main(void) {
--  if (sizeof(long)==8)
--    return(0);
--  else
--    return(1);
--}], ac_64bit_type="long", ac_64bit_type="<none>"))
--if test "$ac_64bit_type" = "long"
--then
--  T1_AA_TYPE64="-DT1_AA_TYPE64=long"
--else
--  T1_AA_TYPE64=
-+T1_AA_TYPE64=""
-+for type in long long_long; do
-+	if test x"`eval echo \\$ac_cv_sizeof_$type`" = "x8"; then
-+		AC_MSG_WARN("$type is 64 bit")
-+		T1_AA_TYPE64="-DT1_AA_TYPE64=\"`echo $type|tr '_' ' '`\""
-+		break
-+	fi
-+done
-+
-+if test x"$T1_AA_TYPE64" = "x"; then
-+	AC_MSG_ERROR("Unable to determine which integer type is 64 bit.")
- fi
- 
--
- CFLAGS="${CFLAGS} -DT1LIB_IDENT=\"\\\"${T1LIB_IDENTIFIER}\\\"\" -DGLOBAL_CONFIG_DIR=\"\\\"${T1LIB_DATA_DIR}\\\"\""
- 
- dnl **** Check for functions and header files ****
diff --git a/meta-oe/recipes-extended/t1lib/t1lib-5.1.2/format_security.patch b/meta-oe/recipes-extended/t1lib/t1lib-5.1.2/format_security.patch
deleted file mode 100644
index bc2476bfc..000000000
--- a/meta-oe/recipes-extended/t1lib/t1lib-5.1.2/format_security.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From cea83003de3ffebde92becd1e599fe3b28f0a7c4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 6 Mar 2017 23:13:36 -0800
-Subject: [PATCH] t1lib: Fix printf format string errors
-
-Fix printf formats to use format qualifiers
-fixes
-
-error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
----
- lib/t1lib/t1subset.c | 2 +-
- lib/type1/objects.c  | 2 +-
- lib/type1/objects.h  | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/lib/t1lib/t1subset.c b/lib/t1lib/t1subset.c
-index da427b2..e76974f 100644
---- a/lib/t1lib/t1subset.c
-+++ b/lib/t1lib/t1subset.c
-@@ -759,7 +759,7 @@ char *T1_SubsetFont( int FontID,
- 	     tr_len);
-     T1_PrintLog( "T1_SubsetFont()", err_warn_msg_buf,
- 		 T1LOG_DEBUG);
--    l+=sprintf( &(trailerbuf[l]), linebuf); /* contains the PostScript trailer */
-+    l+=sprintf( &(trailerbuf[l]), "%s", linebuf); /* contains the PostScript trailer */
-   }
-   
-   /* compute size of output file */
-diff --git a/lib/type1/objects.c b/lib/type1/objects.c
-index c413a0f..f828e6a 100644
---- a/lib/type1/objects.c
-+++ b/lib/type1/objects.c
-@@ -957,7 +957,7 @@ struct xobject *TypeErr(name, obj, expect, ret) /* non-ANSI avoids overly strict
-  
-        sprintf(typemsg, "Wrong object type in %s; expected %s, found %s.\n",
-                   name, TypeFmt(expect), TypeFmt(obj->type));
--       IfTrace0(TRUE,typemsg);
-+       IfTrace1(TRUE, "%s", typemsg);
-  
-        ObjectPostMortem(obj);
-  
-diff --git a/lib/type1/objects.h b/lib/type1/objects.h
-index 13cbae7..3a1d337 100644
---- a/lib/type1/objects.h
-+++ b/lib/type1/objects.h
-@@ -214,7 +214,7 @@ struct xobject {
- /*SHARED*/
- /* NDW: personally, I want to see status and error messages! */
- #define IfTrace0(condition,model)                                 \
--        {if (condition) printf(model);}
-+        {if (condition) fputs(model,stdout);}
- #define IfTrace1(condition,model,arg0)                            \
-         {if (condition) printf(model,arg0);}
- #define IfTrace2(condition,model,arg0,arg1)                       \
diff --git a/meta-oe/recipes-extended/t1lib/t1lib-5.1.2/libtool.patch b/meta-oe/recipes-extended/t1lib/t1lib-5.1.2/libtool.patch
deleted file mode 100644
index da54f87ab..000000000
--- a/meta-oe/recipes-extended/t1lib/t1lib-5.1.2/libtool.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-From bab41f5e1fc1fc809da1371e6a0222e0eb21e5f0 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Mon, 21 Nov 2011 12:00:54 +0100
-Subject: [PATCH] t1lib: add 5.1.2
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
----
- Makefile.in           | 5 +++--
- examples/Makefile.in  | 5 +++--
- lib/Makefile.in       | 6 ++++--
- lib/t1lib/Makefile.in | 6 ++++--
- lib/type1/Makefile.in | 6 ++++--
- type1afm/Makefile.in  | 6 ++++--
- xglyph/Makefile.in    | 6 ++++--
- 7 files changed, 26 insertions(+), 14 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 29c3468..396c020 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -18,7 +18,8 @@
- # Last modified:       2005-05-01
- #
- 
--SHELL     = /bin/sh
-+SHELL     = @SHELL@
-+LIBTOOL   = @LIBTOOL@
- CC        = @CC@
- CPP       = @CPP@
- CFLAGS    = @CFLAGS@
-@@ -149,7 +150,7 @@ distclean: clean
- 	$(RM) examples/Makefile
- 	$(RM) xglyph/Makefile
- 	$(RM) doc/Makefile
--	$(RM) libtool
-+	$(RM) $(LIBTOOL)
- 
- 
- # The following two targets are for building and cleaning the python-
-diff --git a/examples/Makefile.in b/examples/Makefile.in
-index b301db5..7a6a514 100644
---- a/examples/Makefile.in
-+++ b/examples/Makefile.in
-@@ -14,9 +14,10 @@
- # Last modified:       2001-04-01
- #
- 
-+top_builddir = @top_builddir@
- 
--LIBTOOL   = ../libtool
--SHELL     = /bin/sh
-+LIBTOOL   = @LIBTOOL@
-+SHELL     = @SHELL@
- CC        = @CC@
- CPP       = @CPP@
- CFLAGS    = @CFLAGS@
-diff --git a/lib/Makefile.in b/lib/Makefile.in
-index 89e5e86..6e0f960 100644
---- a/lib/Makefile.in
-+++ b/lib/Makefile.in
-@@ -15,8 +15,10 @@
- #
- # Contributions by H.Kakugawa to use libtool!
- 
--LIBTOOL   = ../libtool
--SHELL     = /bin/sh
-+top_builddir = @top_builddir@
-+
-+LIBTOOL   = @LIBTOOL@
-+SHELL     = @SHELL@
- CC        = @CC@
- CPP       = @CPP@
- CFLAGS    = @CFLAGS@
-diff --git a/lib/t1lib/Makefile.in b/lib/t1lib/Makefile.in
-index a6c2478..32434b3 100644
---- a/lib/t1lib/Makefile.in
-+++ b/lib/t1lib/Makefile.in
-@@ -14,8 +14,10 @@
- #
- # Modified by H.Kakugawa to use libtool
- 
--LIBTOOL   = ../../libtool
--SHELL     = /bin/sh
-+top_builddir = @top_builddir@
-+
-+LIBTOOL   = @LIBTOOL@
-+SHELL     = @SHELL@
- CC        = @CC@
- CPP       = @CPP@
- CFLAGS    = @CFLAGS@
-diff --git a/lib/type1/Makefile.in b/lib/type1/Makefile.in
-index 241f124..42efa94 100644
---- a/lib/type1/Makefile.in
-+++ b/lib/type1/Makefile.in
-@@ -14,8 +14,10 @@
- #
- # Modified by H.Kakugawa to use libtool
- 
--LIBTOOL   = ../../libtool
--SHELL     = /bin/sh
-+top_builddir = @top_builddir@
-+
-+LIBTOOL   = @LIBTOOL@
-+SHELL     = @SHELL@
- CC        = @CC@
- CPP       = @CPP@
- CFLAGS    = @CFLAGS@
-diff --git a/type1afm/Makefile.in b/type1afm/Makefile.in
-index 61611e1..9b51406 100644
---- a/type1afm/Makefile.in
-+++ b/type1afm/Makefile.in
-@@ -15,8 +15,10 @@
- #
- # Modified by H.Kakugawa to use libtool
- 
--LIBTOOL   = ../libtool
--SHELL     = /bin/sh
-+top_builddir = @top_builddir@
-+
-+LIBTOOL   = @LIBTOOL@
-+SHELL     = @SHELL@
- CC        = @CC@
- CPP       = @CPP@
- CFLAGS    = @CFLAGS@
-diff --git a/xglyph/Makefile.in b/xglyph/Makefile.in
-index 8da9b63..741334c 100644
---- a/xglyph/Makefile.in
-+++ b/xglyph/Makefile.in
-@@ -15,8 +15,10 @@
- #
- # Modified by H.Kakugawa to use libtool
- 
--LIBTOOL   = ../libtool
--SHELL     = /bin/sh
-+top_builddir = @top_builddir@
-+
-+LIBTOOL   = @LIBTOOL@
-+SHELL     = @SHELL@
- CC        = @CC@
- CPP       = @CPP@
- CFLAGS    = @CFLAGS@
diff --git a/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb b/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb
deleted file mode 100644
index 826dbda85..000000000
--- a/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "A Type1 Font Rastering Library"
-SECTION = "libs"
-DEPENDS = "virtual/libx11 libxaw"
-
-LICENSE = "LGPLv2 & GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8ca43cbc842c2336e835926c2166c28b \
-                    file://LGPL;md5=6e29c688d912da12b66b73e32b03d812 \
-"
-
-SRC_URI = "${DEBIAN_MIRROR}/main/t/t1lib/t1lib_${PV}.orig.tar.gz \
-           file://configure.patch \
-           file://libtool.patch \
-           file://format_security.patch"
-SRC_URI[md5sum] = "a5629b56b93134377718009df1435f3c"
-SRC_URI[sha256sum] = "821328b5054f7890a0d0cd2f52825270705df3641dbd476d58d17e56ed957b59"
-
-inherit autotools-brokensep distro_features_check
-# depends on virtual/libx11
-REQUIRED_DISTRO_FEATURES = "x11"
-
-# Fix GNU_HASH problem
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-EXTRA_OECONF = "--with-x --without-athena"
-EXTRA_OEMAKE = "without_doc"
-
-FILES_${PN} += " ${datadir}/t1lib/t1lib.config"
-FILES_${PN}-doc = "${datadir}/t1lib/doc/t1lib_doc.pdf"
-
-- 
2.17.1


