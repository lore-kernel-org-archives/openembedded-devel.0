Return-Path: <kergoth@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2B3BE7325A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 16:10:26 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id g132so2346857pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 09:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=4e45Ajl17hb6Vf90RSc5Obf/uSrpZECMgvSOKUf+Lx0=;
	b=1DC+rLwsyi+U6axYAk4TWthy9ONSpYoGNzJUiRlAQ1QgTLpgVN1e0IS8NapiuFFUIK
	Sd7EiBL3NI4pMk5Tnc5CaeOApj5gPpDMj1oJPQIPU3du6lDdkPOn8s53WI/4fYro4WFE
	3AmMAwsOGBLgGWGnmUwsCV8A1lHDuik0vkRZfQKXhuTNQm2LRt6xC958qpaRDPjtSYLa
	ZGA8rvGsHrYLrbUF6PqgMAzd8EdlIlH+AWFCrngMeArRtdrqfYRJZJzxmsofgxHdCZep
	y+fXitoKIba4SCE+032Zg6zNf7TGZe8s8TzVNdWpWMkdbcoj0JFJjfOpiFamNAaihf53
	Nogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=4e45Ajl17hb6Vf90RSc5Obf/uSrpZECMgvSOKUf+Lx0=;
	b=k6ijXJx05eM912dYB3rI2vy2WGW8lrlGeYfDlUGllobeaqM4dkzisDaRzLc1VBNH/D
	rD+h+cWYAsJ38HyjpIxiAe0SiODlrYfTBVzRah6J+KXWL8uu/S+QTfSkTQEctvapk9YO
	OGowODKSJsEf+CL7PrsU6mQA/avlgLAA6NoMgH/NTN+4LzoxeP20O3/NKc3LHkfZUItX
	W6bK9mvQB0IW9wDNLEZThSNnJChylryp7h1w5R4s9a69AnyacQQTofxL+UrUVjkQPZUT
	0NULYssEdS2LwBWgYVL05dkg9I59vHXIs6G9pcsTgteoM3QYHRNlyQAbq6pG5PE13B+4
	KPBQ==
X-Gm-Message-State: AOPr4FUZU6mGjZLVJqwQZrcu+I2sKSUp19WjRu9O4RfiwF8zPSULU2znCrsO+yDoQpeC0Q==
X-Received: by 10.98.42.196 with SMTP id q187mr3303946pfq.140.1463501428004;
	Tue, 17 May 2016 09:10:28 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	rw2sm5868665pab.30.2016.05.17.09.10.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 May 2016 09:10:26 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 May 2016 09:10:16 -0700
Message-Id: <328bdd83910d94b0c35eaff11abd98838c20493e.1463501350.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <3ab55100823a114a701c63eaa703d0352bca5513.1463501350.git.chris_larson@mentor.com>
References: <3ab55100823a114a701c63eaa703d0352bca5513.1463501350.git.chris_larson@mentor.com>
In-Reply-To: <cover.1463501350.git.chris_larson@mentor.com>
References: <cover.1463501350.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 2/6] luajit: fix build issues, obey more vars
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
X-List-Received-Date: Tue, 17 May 2016 16:10:27 -0000

From: Christopher Larson <chris_larson@mentor.com>

Rework how variables are passed in to ensure that more of our flag vars are
obeyed, make it obey more of our target path vars, and use fewer of its
hardcoded flags. Also add verbosity to the compile output for debugging.

Without this, errors were seen for us:

    | In file included from .../lib/gcc/i686-pc-linux-gnu/5.2.0/include-fixed/64/sgxx-glibc/syslimits.h:7:0,
    |                  from .../lib/gcc/i686-pc-linux-gnu/5.2.0/include-fixed/64/sgxx-glibc/limits.h:34,
    |                  from luaconf.h:12,
    |                  from lua.h:16,
    |                  from lj_arch.h:9:
    | .../lib/gcc/i686-pc-linux-gnu/5.2.0/include-fixed/64/sgxx-glibc/limits.h:168:61: fatal error: limits.h: No such file or directory
    | compilation terminated.
    | Makefile:233: *** Unsupported target architecture.  Stop.
    | make[1]: Leaving directory '.../luajit/2.0.4-r0/LuaJIT-2.0.4/src'

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb | 53 +++++++++++++++++++------
 1 file changed, 40 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
index a0252aa..66bf3e4 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
@@ -15,11 +15,6 @@ inherit pkgconfig binconfig
 
 BBCLASSEXTEND = "native"
 
-do_configure_prepend() {
-    sed -i 's:PREFIX= /usr/local:PREFIX= ${prefix}:g' ${S}/Makefile
-    sed -i 's:MULTILIB= lib:MULTILIB= ${baselib}:g' ${S}/Makefile
-}
-
 # http://luajit.org/install.html#cross
 # Host luajit needs to be compiled with the same pointer size
 # If you want to cross-compile to any 32 bit target on an x64 OS,
@@ -30,20 +25,49 @@ BUILD_CC_ARCH_append_powerpc = ' -m32'
 BUILD_CC_ARCH_append_x86 = ' -m32'
 BUILD_CC_ARCH_append_arm = ' -m32'
 
-EXTRA_OEMAKE_append_class-target = '\
-    CROSS=${HOST_PREFIX} \
-    HOST_CC="${BUILD_CC} ${BUILD_CC_ARCH}" \
-    TARGET_CFLAGS="${TOOLCHAIN_OPTIONS} ${TARGET_CC_ARCH}" \
-    TARGET_LDFLAGS="${TOOLCHAIN_OPTIONS}" \
-    TARGET_SHLDFLAGS="${TOOLCHAIN_OPTIONS}" \
-'
+# The lua makefiles expect the TARGET_SYS to be from uname -s
+# Values: Windows, Linux, Darwin, iOS, SunOS, PS3, GNU/kFreeBSD
+LUA_TARGET_OS = "${@'${TARGET_OS}'[0].upper() + '${TARGET_OS}'[1:]}"
+LUA_TARGET_OS_mingw32 = "Windows"
+
+# We don't want the lua buildsystem's compiler optimizations, or its
+# stripping, and we don't want it to pick up CFLAGS or LDFLAGS, as those apply
+# to both host and target compiles
+EXTRA_OEMAKE = "\
+    Q= E='@:' \
+    \
+    CCOPT= CCOPT_x86= CFLAGS= LDFLAGS= TARGET_STRIP='@:' \
+    \
+    'TARGET_SYS=${LUA_TARGET_OS}' \
+    \
+    'CC=${CC}' \
+    'TARGET_AR=${AR} rcus' \
+    'TARGET_CFLAGS=${CFLAGS}' \
+    'TARGET_LDFLAGS=${LDFLAGS}' \
+    'TARGET_SHLDFLAGS=${LDFLAGS}' \
+    'HOST_CC=${BUILD_CC}' \
+    'HOST_CFLAGS=${BUILD_CFLAGS}' \
+    'HOST_LDFLAGS=${BUILD_LDFLAGS}' \
+    \
+    'PREFIX=${prefix}' \
+    'MULTILIB=${baselib}' \
+"
 
 do_compile () {
     oe_runmake
 }
 
+# There's INSTALL_LIB and INSTALL_SHARE also, but the lua binary hardcodes the
+# '/share' and '/' + LUA_MULTILIB paths, so we don't want to break those
+# expectations.
+EXTRA_OEMAKEINST = "\
+    'DESTDIR=${D}' \
+    'INSTALL_BIN=${D}${bindir}' \
+    'INSTALL_INC=${D}${includedir}/luajit-$(MAJVER).$(MINVER)' \
+    'INSTALL_MAN=${D}${mandir}/man1' \
+"
 do_install () {
-    oe_runmake 'DESTDIR=${D}' install
+    oe_runmake ${EXTRA_OEMAKEINST} install
     rmdir ${D}${datadir}/lua/5.* \
           ${D}${datadir}/lua \
           ${D}${libdir}/lua/5.* \
@@ -52,6 +76,9 @@ do_install () {
 
 PACKAGES += 'luajit-common'
 
+# See the comment for EXTRA_OEMAKEINST. This is needed to ensure the hardcoded
+# paths are packaged regardless of what the libdir and datadir paths are.
+FILES_${PN} += "${prefix}/${baselib} ${prefix}/share"
 FILES_${PN} += "${libdir}/libluajit-5.1.so.2 \
     ${libdir}/libluajit-5.1.so.${PV} \
 "
-- 
2.8.0


