Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id A46C26AC56
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 May 2015 13:50:45 +0000 (UTC)
Received: by wgso17 with SMTP id o17so183940581wgs.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 May 2015 06:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=qC572bLmF11cypHw2Nqnm6Dq9MOLCHOclO2tOXzkico=;
	b=F6A8G73+PsmrwkB7D9DK1mwEQXIO+de/d58VIaJ06MTDAy3n++/eFKFfgYv9bQmWam
	m7UyjJHQMNmNf7mfHkp9kUx5NlXAkOqSx6xjRPTPb/zA50CoZACPWcmHjXIMZxDQnotx
	zaVcVq898WeVgwTzbHcTA95jadxgstt1VZzSBVbSSHxQzJmgqwJZ3bHI+hv3QvVn0bWQ
	WMYXjI5mP1Q7V5rTsPKT/VlvJbUDl8RyJXhH+dihbHXUqUVkzHGyKvmXR3sJrFDPOqtd
	BvXq0cqsle+/aNZdux1WslTEOmLZdCsHVB8Xbp3iLolFpbSmH14a9lm2e66m+U+7NQCe
	pklw==
X-Received: by 10.180.81.3 with SMTP id v3mr4234067wix.36.1430833835124;
	Tue, 05 May 2015 06:50:35 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	bm9sm25697303wjc.21.2015.05.05.06.50.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 May 2015 06:50:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 May 2015 15:50:38 +0200
Message-Id: <1430833838-21720-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][meta-gnome][meta-multimedia][WIP][PATCH] crash, libsecret, mpg123, tinymembench, gammu, mosh, llvm3.3, breakpad, php, mozjs, libopus: disable thumb where it fails for qemuarm
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
X-List-Received-Date: Tue, 05 May 2015 13:50:49 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb       |  9 +++++++++
 meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb |  7 +++++++
 meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb |  8 ++++++++
 meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb         | 11 +++++++++++
 meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb            |  9 +++++++++
 meta-oe/recipes-core/llvm/llvm3.3_3.3.bb                   |  8 ++++++++
 meta-oe/recipes-devtools/breakpad/breakpad_svn.bb          | 11 +++++++++++
 meta-oe/recipes-devtools/php/php_5.5.24.bb                 |  9 +++++++++
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb             |  9 +++++++++
 meta-oe/recipes-kernel/crash/crash_7.0.9.bb                |  4 ++++
 meta-oe/recipes-multimedia/libopus/libopus_1.1.bb          | 14 ++++++++++++++
 11 files changed, 99 insertions(+)

diff --git a/meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb b/meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb
index 06e94bd..7c75cf5 100644
--- a/meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb
+++ b/meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb
@@ -12,3 +12,12 @@ EXTRA_OECONF += "--disable-manpages"
 
 SRC_URI[archive.md5sum] = "279d723cd005e80d1d304f74a3488acc"
 SRC_URI[archive.sha256sum] = "0c73aa762dbd1e38ba7b03de350e23ce818cb810b0784375e95ef61e004b02e3"
+
+# Fails to build with thumb-1 (qemuarm)
+# | {standard input}: Assembler messages:
+# | {standard input}:686: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#3'
+# | {standard input}:686: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#13'
+# | {standard input}:687: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#29'
+# | {standard input}:687: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#19'
+# | {standard input}:688: Error: lo register required -- `orr r10,r10,r10'
+ARM_INSTRUCTION_SET = "arm"
diff --git a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
index 4efdeab..3aa5f3d 100644
--- a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
+++ b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
@@ -49,3 +49,10 @@ EXTRA_OECONF = " \
     ${@bb.utils.contains('TUNE_FEATURES', 'altivec', '--with-cpu=altivec', '', d)} \
 "
 
+# Fails to build with thumb-1 (qemuarm)
+#| {standard input}: Assembler messages:
+#| {standard input}:47: Error: selected processor does not support Thumb mode `smull r5,r6,r7,r4'
+#| {standard input}:48: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r5,r5,lsr#24'
+#...
+#| make[3]: *** [equalizer.lo] Error 1
+ARM_INSTRUCTION_SET = "arm"
diff --git a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
index ae7887d..9898a70 100644
--- a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
+++ b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
@@ -17,3 +17,11 @@ do_install() {
     install -d ${D}${bindir}
     install -m755 tinymembench ${D}${bindir}/
 }
+
+# Fails to build with thumb-1 (qemuarm)
+#| {standard input}: Assembler messages:
+#| {standard input}:66: Error: instruction not supported in Thumb16 mode -- `subs r1,r1,#16'
+#| {standard input}:69: Error: instruction not supported in Thumb16 mode -- `subs r1,r1,#16'
+#| {standard input}:82: Error: selected processor does not support Thumb mode `mla r3,r4,r3,r5'
+#| {standard input}:82: Error: unshifted register required -- `and r8,r7,r3,lsr#16'
+ARM_INSTRUCTION_SET = "arm"
diff --git a/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb b/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb
index a2f0ad8..e9807d4 100644
--- a/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb
+++ b/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb
@@ -56,3 +56,14 @@ FILES_python-${PN} = "${PYTHON_SITEPACKAGES_DIR}/gammu/*.??"
 RDEPENDS_${PN} += "bash"
 RDEPENDS_${PN}-dev += "bash"
 
+# Fails to build with thumb-1 (qemuarm)
+# gammu-1.32.0/libgammu/service/sms/gsmems.c:542:1: internal compiler error: in patch_jump_insn, at cfgrtl.c:1275
+# |  }
+# |  ^
+# | Please submit a full bug report,
+# | with preprocessed source if appropriate.
+# | See <http://gcc.gnu.org/bugs.html> for instructions.
+# | make[2]: *** [libgammu/CMakeFiles/libGammu.dir/service/sms/gsmems.o] Error 1
+# | make[2]: *** Waiting for unfinished jobs....
+ARM_INSTRUCTION_SET = "arm"
+
diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb b/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
index a4709ce..16e2a7d 100644
--- a/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
+++ b/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
@@ -36,3 +36,12 @@ NEEDED_PERL_MODULES = "\
 RDEPENDS_${PN} += "openssh-ssh ${NEEDED_PERL_MODULES}"
 # The server seemed not to work with dropbear either
 RDEPENDS_${PN}-server += "openssh-sshd ${NEEDED_PERL_MODULES}"
+
+# Fails to build with thumb-1 (qemuarm)
+#| {standard input}: Assembler messages:
+#| {standard input}:2100: Error: instruction not supported in Thumb16 mode -- `adds r4,r4,r4'
+#| {standard input}:2101: Error: instruction not supported in Thumb16 mode -- `adcs r5,r5,r5'
+#| {standard input}:2102: Error: instruction not supported in Thumb16 mode -- `adcs r6,r6,r6'
+#| {standard input}:2103: Error: instruction not supported in Thumb16 mode -- `adcs r7,r7,r7'
+#| {standard input}:2104: Error: selected processor does not support Thumb mode `it cs'
+ARM_INSTRUCTION_SET = "arm"
diff --git a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb b/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
index 4617efa..252c703 100644
--- a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
+++ b/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
@@ -9,3 +9,11 @@ SRC_URI[sha256sum] = "68766b1e70d05a25e2f502e997a3cb3937187a3296595cf6e0977d5cd6
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[r600] = "--enable-experimental-targets=R600,,,"
+
+# Fails to build with thumb-1 (qemuarm)
+# | {standard input}: Assembler messages:
+# | {standard input}:22: Error: selected processor does not support Thumb mode `stmdb sp!,{r0,r1,r2,r3,lr}'
+# | {standard input}:31: Error: lo register required -- `ldmia sp!,{r0,r1,r2,r3,lr}'
+# | {standard input}:32: Error: lo register required -- `ldr pc,[sp],#4'
+# | make[3]: *** [/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/llvm3.3/3.3-r0/llvm-3.3.build/lib/Target/ARM/Release/ARMJITInfo.o] Error 1
+ARM_INSTRUCTION_SET = "arm"
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb b/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
index fcebccf..7ada3a3 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
@@ -76,3 +76,14 @@ breakpad_populate_sysroot() {
         sysroot_stage_dir ${D}/usr/lib ${SYSROOT_DESTDIR}/usr/lib
 }
 
+# Fails to build with thumb-1 (qemuarm)
+#| {standard input}: Assembler messages:
+#| {standard input}:2178: Error: selected processor does not support Thumb mode `it ne'
+#| {standard input}:2179: Error: Thumb does not support conditional execution
+#| {standard input}:2180: Error: selected processor does not support Thumb mode `it eq'
+#| {standard input}:2181: Error: Thumb does not support conditional execution
+#| {standard input}:2183: Error: lo register required -- `str ip,[r1,#-4]!'
+#| {standard input}:2184: Error: Thumb does not support this addressing mode -- `str r6,[r1,#-4]!'
+#| {standard input}:2191: Error: lo register required -- `ldr pc,[sp]'
+#| make: *** [src/client/linux/handler/exception_handler.o] Error 1
+ARM_INSTRUCTION_SET = "arm"
diff --git a/meta-oe/recipes-devtools/php/php_5.5.24.bb b/meta-oe/recipes-devtools/php/php_5.5.24.bb
index 76185fb..247159e 100644
--- a/meta-oe/recipes-devtools/php/php_5.5.24.bb
+++ b/meta-oe/recipes-devtools/php/php_5.5.24.bb
@@ -234,3 +234,12 @@ MODPHP_OLDPACKAGE = "${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'modphp',
 RPROVIDES_${PN}-modphp = "${MODPHP_OLDPACKAGE}"
 RREPLACES_${PN}-modphp = "${MODPHP_OLDPACKAGE}"
 RCONFLICTS_${PN}-modphp = "${MODPHP_OLDPACKAGE}"
+
+# Fails to build with thumb-1 (qemuarm)
+# | {standard input}: Assembler messages:
+# | {standard input}:3719: Error: selected processor does not support Thumb mode `smull r0,r2,r9,r3'
+# | {standard input}:3720: Error: unshifted register required -- `sub r2,r2,r0,asr#31'
+# | {standard input}:3796: Error: selected processor does not support Thumb mode `smull r0,r2,r3,r3'
+# | {standard input}:3797: Error: unshifted register required -- `sub r2,r2,r0,asr#31'
+# | make: *** [ext/standard/math.lo] Error 1
+ARM_INSTRUCTION_SET = "arm"
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index ac6ce4e..240bb21 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -62,3 +62,12 @@ addtask sourceclean before do_patch after do_unpack
 PACKAGES =+ "lib${PN}"
 FILES_lib${PN} += "${libdir}/lib*.so"
 FILES_${PN}-dev += "${bindir}/js17-config"
+
+# Fails to build with thumb-1 (qemuarm)
+#| {standard input}: Assembler messages:
+#| {standard input}:2172: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r2,r1,LSR#20'
+#| {standard input}:2173: Error: unshifted register required -- `bic r2,r2,#(1<<11)'
+#| {standard input}:2174: Error: unshifted register required -- `orr r1,r1,#(1<<20)'
+#| {standard input}:2176: Error: instruction not supported in Thumb16 mode -- `subs r2,r2,#0x300'
+#| {standard input}:2178: Error: instruction not supported in Thumb16 mode -- `subs r5,r2,#52'
+ARM_INSTRUCTION_SET = "arm"
diff --git a/meta-oe/recipes-kernel/crash/crash_7.0.9.bb b/meta-oe/recipes-kernel/crash/crash_7.0.9.bb
index 8d62481..586a0ba 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.0.9.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.0.9.bb
@@ -57,3 +57,7 @@ do_install () {
     install -m 0644 ${S}/defs.h ${D}${includedir}/crash
 }   
 RDEPENDS_${PN} += "liblzma"
+
+# Causes gcc to get stuck and eat all available memory in qemuarm builds
+# jenkins  15161  100 12.5 10389596 10321284 ?   R    11:40  28:17 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.2/cc1 -quiet -I . -I . -I ./common -I ./config -I ./../include/opcode -I ./../opcodes/.. -I ./../readline/.. -I ../bfd -I ./../bfd -I ./../include -I ../libdecnumber -I ./../libdecnumber -I ./gnulib/import -I build-gnulib/import -isysroot /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm -MMD eval.d -MF .deps/eval.Tpo -MP -MT eval.o -D LOCALEDIR="/usr/local/share/locale" -D CRASH_MERGE -D HAVE_CONFIG_H -D TUI=1 eval.c -quiet -dumpbase eval.c -march=armv5te -mthumb -mthumb-interwork -mtls-dialect=gnu -auxbase-strip eval.o -g -O2 -Wall -Wpointer-arith -Wformat-nonliteral -Wno-pointer-sign -Wno-unused -Wunused-value -Wunused-function -Wno-switch -Wno-char-subscripts -Wmissing-prototypes -Wdeclaration-after-statement -Wempty-body -feliminate-unused-debug-types -o -
+ARM_INSTRUCTION_SET = "arm"
diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.1.bb b/meta-oe/recipes-multimedia/libopus/libopus_1.1.bb
index 15782a0..948d4df 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus_1.1.bb
+++ b/meta-oe/recipes-multimedia/libopus/libopus_1.1.bb
@@ -18,3 +18,17 @@ inherit autotools pkgconfig
 
 require libopus-fpu.inc
 EXTRA_OECONF = "${@get_libopus_fpu_setting(bb, d)}"
+
+# Fails to build with thumb-1 (qemuarm)
+#| {standard input}: Assembler messages:
+#| {standard input}:389: Error: selected processor does not support Thumb mode `smull r5,r7,r1,r4'
+#| {standard input}:418: Error: selected processor does not support Thumb mode `smull r5,r6,r4,r1'
+#| {standard input}:448: Error: selected processor does not support Thumb mode `smull r4,r5,r1,r0'
+#| {standard input}:474: Error: selected processor does not support Thumb mode `smull r0,r4,r8,r1'
+#| {standard input}:510: Error: selected processor does not support Thumb mode `smull fp,r0,r10,r1'
+#| {standard input}:553: Error: selected processor does not support Thumb mode `smull fp,r1,r10,r3'
+#| {standard input}:741: Error: selected processor does not support Thumb mode `smull r3,r0,r6,r10'
+#| {standard input}:761: Error: selected processor does not support Thumb mode `smull fp,r2,r3,r9'
+#| {standard input}:773: Error: selected processor does not support Thumb mode `smull fp,r3,r5,r8'
+#| make[2]: *** [celt/celt.lo] Error 1
+ARM_INSTRUCTION_SET = "arm"
-- 
2.3.5


