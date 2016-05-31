Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 491107718E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2016 17:38:20 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id di3so43755pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2016 10:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=B9wg9cLlZQ7bZupTdk/OJXPzgNKzSxLZrcGz3CditQk=;
	b=teXt0Zrjhg9H8r7hnxlFn++QGq3LS0stgP8hilOBWjmzTIir3BmOg4uR/yd0oDj2et
	Xx3VuJzAVwpbzZD09apOSnIPO5mo6YuM6R3c/CwG/lxh50BGKn4xtMiqaR9MtjhJSH2E
	agRLTko58vi//8RQoLJsJHP+pqlE2TBhLMHPBMfSMXzYHT0tHAi/aYS0Y6EIRIbVkcpk
	otVNJO5+HEiIDN/c0R9ZWo5fB6IlCYN9d8Dwaprn+OP42qRXbpfS8MJc9vVr43krsQdx
	o5Kx9qk7S6FdqkfJbpQOmASe+atxTJW9oTs40Dw8kU9gam2CynqVCuP03+sK6A5IiqK2
	wOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=B9wg9cLlZQ7bZupTdk/OJXPzgNKzSxLZrcGz3CditQk=;
	b=OSzyURfMHXjXPZAAMW0tdibCiLqmxJFbxzR3JGP5tcnX+mSl5qJ+HBGARc6DMo6fay
	8F+fkH+JjjXW1gSSzuOhybjRnH0C2CMZ5ilt3uQSuKk4gDXptYB7s8QvasHermrXjKYn
	E5kb2pXhMTYg4wCNOLOm6n78rCMLIVQ0uq1woVUhWfFm4+cVX13kR5VSZv4ohpS5dJoY
	IJC2pr0xJz9PLDIfMAry0qL7+EnXhrjH3Ep/WiZSmlJTTlklk0hQw9LIpUb116ckmb5b
	1keOUqkx1Rs/U4Ac0tkpE9Zpsnd7votFlMBaDVwjYA6z5M4Dp1UUtewbyybWayuQVmiG
	jyzA==
X-Gm-Message-State: ALyK8tIxRaPpQfQYHvaQ+18NegukTSwHPNfHwLqugkASy5qA/ivMKh3oHfIgjDVIxssGIA==
X-Received: by 10.66.1.135 with SMTP id 7mr57469620pam.106.1464716301714;
	Tue, 31 May 2016 10:38:21 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	ap3sm18070056pad.33.2016.05.31.10.38.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 May 2016 10:38:20 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 May 2016 10:38:58 -0700
Message-Id: <1464716338-14365-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <328bdd83910d94b0c35eaff11abd98838c20493e.1463501350.git.chris_larson@mentor.com>
References: <328bdd83910d94b0c35eaff11abd98838c20493e.1463501350.git.chris_larson@mentor.com>
In-Reply-To: <328bdd83910d94b0c35eaff11abd98838c20493e.1463501350.git.chris_larson@mentor.com>
References: <328bdd83910d94b0c35eaff11abd98838c20493e.1463501350.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCHv2] luajit: fix build issues, obey more vars
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
X-List-Received-Date: Tue, 31 May 2016 17:38:23 -0000

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
v2 changes: fixed http://errors.yoctoproject.org/Errors/Details/68382/ by
ensuring LUA_TARGET_OS is correct. The lua buildsystem didn't recognize the os
with the LIBCEXTENSION+ABIEXTENSION.

 meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb | 56 +++++++++++++++++++------
 1 file changed, 43 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
index a0252aa..964dc1d 100644
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
@@ -30,20 +25,52 @@ BUILD_CC_ARCH_append_powerpc = ' -m32'
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
+LUA_TARGET_OS = "Unknown"
+LUA_TARGET_OS_darwin = "Darwin"
+LUA_TARGET_OS_linux = "Linux"
+LUA_TARGET_OS_linux-gnueabi = "Linux"
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
@@ -52,6 +79,9 @@ do_install () {
 
 PACKAGES += 'luajit-common'
 
+# See the comment for EXTRA_OEMAKEINST. This is needed to ensure the hardcoded
+# paths are packaged regardless of what the libdir and datadir paths are.
+FILES_${PN} += "${prefix}/${baselib} ${prefix}/share"
 FILES_${PN} += "${libdir}/libluajit-5.1.so.2 \
     ${libdir}/libluajit-5.1.so.${PV} \
 "
-- 
2.8.0


