Return-Path: <cengic@gmail.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 32E0B60116
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 19:15:39 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id j11so82714690lfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 12:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=zcbFTEpocGJYeZd+pOk5nW+22xTZxXj7NKs6nNQxnvY=;
	b=JmpyNcgMDoxdXwH7GCHDABi/2PpWMfR5x+Dp6HL3iPg80y8/fDN5yW49hsFUaLiEx/
	f7itF4r3QkNImWSHD+6McXY++wx1VYWlSKZaIqGscSs3TZNimpqTk9DHxuXUuFVEls3a
	RppFr5f1stikDkbB50FCydJcgakBJpZ+gCVG5QbteMZEFezrMWhINxmwgvbKdX7H3JCb
	5oQcD6B3JVLJ2kkvNlaXKIZglO6IKbD6gvBoJJ7E2JFxrSh/+rJwIpM1d79bBSSZZKeL
	ImhXftLqJGeTRfoK9y6bSxO3MuFLcDrl+8YH97ysfgpIVsYOqnfNsYLjAKZY8qQi0pfh
	c6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=zcbFTEpocGJYeZd+pOk5nW+22xTZxXj7NKs6nNQxnvY=;
	b=gIDQkCfj28ac/YGAiVZRZV22VRrRRBGetJvOfMu6LG2jJV0k6E+q/h2sDiJRob3h/g
	h9hm9WFKzBa+kwZmyJ8gh2MrqT9bP6ggW+UnwG3EDZ8WbcelLDEXnb/euHnvdwDYlIt4
	tEQk7l2i1d99/B+3S/SrMWbm9ZLMqjIAL6SsLqArCI2oXx+WpKy6oPml6ZpMgmcl3lYG
	lSu0kG/84hnRB3fSvZOmK194ZTTLzd0WtnDwbVp8JTT3Y/lhy/ajNDBwXaW/1zWRLGQz
	KOt0L3uI6DfW2+YkSUNbch1uwU1z68nY+HCk1Ey8koKp6yW1IjrX/zXRSLznf00WIb/r
	v/Sg==
X-Gm-Message-State: AOPr4FWlLc3CDli8rT8sBc7VOoUDXehM2NbFIHu+11ynt0cXeeIFDWna8fP3+Ha+mW2EmA==
X-Received: by 10.112.26.172 with SMTP id m12mr4781030lbg.44.1460574938969;
	Wed, 13 Apr 2016 12:15:38 -0700 (PDT)
Received: from cenga.s2.chalmers.se (cenga.s2.chalmers.se. [129.16.80.179])
	by smtp.gmail.com with ESMTPSA id
	ez1sm6229159lbc.29.2016.04.13.12.15.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Apr 2016 12:15:38 -0700 (PDT)
From: Goran Cengic <cengic@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Apr 2016 21:15:35 +0200
Message-Id: <1460574935-24224-1-git-send-email-cengic@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][RFC PATCH] crash: add cross package
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
X-List-Received-Date: Wed, 13 Apr 2016 19:15:42 -0000

This patch adds the cross package for the crash recipe. I've built and
tested crash-cross for ARM on x86_64 host only. 

The way to pass GDB_CONF_FLAGS and --target to GDB build without
removing -m32 from CFLAGS is awkward but that is what I could come up
with, without changing the patch files included with the recipe or
breaking target and native builds. Anyone got any ideas on how to
better do this?

Thanks,

     Goran

Signed-off-by: Goran Cengic <cengic@gmail.com>
---
 meta-oe/recipes-kernel/crash/crash_7.1.3.bb | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-kernel/crash/crash_7.1.3.bb b/meta-oe/recipes-kernel/crash/crash_7.1.3.bb
index d057300..b787f02 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.1.3.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.1.3.bb
@@ -32,7 +32,7 @@ SRC_URI[gdb.sha256sum] = "8070389a5dcc104eb0be483d582729f98ed4d761ad19cedd3f17b5
 
 inherit gettext
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native cross"
 
 # crash 7.1.3 and before don't support mips64
 COMPATIBLE_HOST = "^(?!mips64).*"
@@ -42,7 +42,21 @@ EXTRA_OEMAKE = 'RPMPKG="${PV}" \
                 GDB_HOST="${BUILD_SYS}" \
                 GDB_MAKE_JOBS="${PARALLEL_MAKE}" \
                 '
+
+EXTRA_OEMAKE_class-cross = 'RPMPKG="${PV}" \
+                            GDB_TARGET="${BUILD_SYS} \
+                                        \${GDB_CONF_FLAGS} \
+                                        --target=${TARGET_SYS}" \
+                            GDB_HOST="${BUILD_SYS}" \
+                            GDB_MAKE_JOBS="${PARALLEL_MAKE}" \
+                            '
+
 EXTRA_OEMAKE_append_class-native = " LDFLAGS='${BUILD_LDFLAGS}'"
+EXTRA_OEMAKE_append_class-cross = " LDFLAGS='${BUILD_LDFLAGS}'"
+
+REMOVE_M32 = "sed -i -e 's/#define TARGET_CFLAGS_ARM_ON_X86_64.*/#define TARGET_CFLAGS_ARM_ON_X86_64\t\"TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64\"/g' ${S}/configure.c"
+
+REMOVE_M32_class-cross = ""
 
 do_configure() {
     :
@@ -60,7 +74,7 @@ do_compile_prepend() {
     esac
 
     sed -i s/FORCE_DEFINE_ARCH/"${ARCH}"/g ${S}/configure.c
-    sed -i -e 's/#define TARGET_CFLAGS_ARM_ON_X86_64.*/#define TARGET_CFLAGS_ARM_ON_X86_64\t\"TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64\"/g' ${S}/configure.c
+    ${REMOVE_M32}
     sed -i 's/&gt;/>/g' ${S}/Makefile
 }
 
@@ -85,8 +99,13 @@ do_install_class-native () {
     oe_runmake DESTDIR=${D}${STAGING_DIR_NATIVE} install
 }
 
+do_install_class-cross () {
+    install -m 0755 ${S}/crash ${D}/${bindir}
+}
+
 RDEPENDS_${PN} += "liblzma"
 RDEPENDS_${PN}_class-native = ""
+RDEPENDS_${PN}_class-cross = ""
 
 # Causes gcc to get stuck and eat all available memory in qemuarm builds
 # jenkins  15161  100 12.5 10389596 10321284 ?   R    11:40  28:17 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.2/cc1 -quiet -I . -I . -I ./common -I ./config -I ./../include/opcode -I ./../opcodes/.. -I ./../readline/.. -I ../bfd -I ./../bfd -I ./../include -I ../libdecnumber -I ./../libdecnumber -I ./gnulib/import -I build-gnulib/import -isysroot /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm -MMD eval.d -MF .deps/eval.Tpo -MP -MT eval.o -D LOCALEDIR="/usr/local/share/locale" -D CRASH_MERGE -D HAVE_CONFIG_H -D TUI=1 eval.c -quiet -dumpbase eval.c -march=armv5te -mthumb -mthumb-interwork -mtls-dialect=gnu -auxbase-strip eval.o -g -O2 -Wall -Wpointer-arith -Wformat-nonliteral -Wno-pointer-sign -Wno-unused -Wunused-value -Wunused-function -Wno-switch -Wno-char-subscripts -Wmissing-prototypes -Wdeclaration-after-statement -Wempty-body -feliminate-unused-debug-types -o -
-- 
2.7.4


