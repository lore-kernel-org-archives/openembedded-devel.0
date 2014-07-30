Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 14086708C0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 13:04:47 +0000 (UTC)
Received: from soylentgreen.sue.net (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 0EADE302CC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 15:04:48 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Jul 2014 15:04:36 +0200
Message-Id: <1406725476-23048-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] libvpx: upgrade to version 1.3.0
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
X-List-Received-Date: Wed, 30 Jul 2014 13:04:50 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta-oe/recipes-multimedia/webm/libvpx.inc         |  2 +
 .../0001-configure.sh-quote-local-variables.patch  | 40 +++++++++++++
 .../webm/libvpx/CVE-2010-4203.patch                | 69 ----------------------
 .../libvpx/do-not-hardcode-softfp-float-api.patch  | 28 ---------
 meta-oe/recipes-multimedia/webm/libvpx_0.9.5.bb    | 19 ------
 meta-oe/recipes-multimedia/webm/libvpx_1.3.0.bb    | 18 ++++++
 6 files changed, 60 insertions(+), 116 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/webm/libvpx/0001-configure.sh-quote-local-variables.patch
 delete mode 100644 meta-oe/recipes-multimedia/webm/libvpx/CVE-2010-4203.patch
 delete mode 100644 meta-oe/recipes-multimedia/webm/libvpx/do-not-hardcode-softfp-float-api.patch
 delete mode 100644 meta-oe/recipes-multimedia/webm/libvpx_0.9.5.bb
 create mode 100644 meta-oe/recipes-multimedia/webm/libvpx_1.3.0.bb

diff --git a/meta-oe/recipes-multimedia/webm/libvpx.inc b/meta-oe/recipes-multimedia/webm/libvpx.inc
index 4d8ba9d..963ac0b 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx.inc
+++ b/meta-oe/recipes-multimedia/webm/libvpx.inc
@@ -25,6 +25,8 @@ CONFIGUREOPTS = " \
     --enable-vp8 \
     --enable-libs \
     --disable-install-docs \
+    --disable-static \
+    --enable-shared \
 "
 do_configure() {
     ${S}/configure ${CONFIGUREOPTS}
diff --git a/meta-oe/recipes-multimedia/webm/libvpx/0001-configure.sh-quote-local-variables.patch b/meta-oe/recipes-multimedia/webm/libvpx/0001-configure.sh-quote-local-variables.patch
new file mode 100644
index 0000000..bf94b2d
--- /dev/null
+++ b/meta-oe/recipes-multimedia/webm/libvpx/0001-configure.sh-quote-local-variables.patch
@@ -0,0 +1,40 @@
+From f45fe1668401d72c2937a52385b492216715c0f9 Mon Sep 17 00:00:00 2001
+From: James Zern <jzern@google.com>
+Date: Thu, 6 Mar 2014 15:58:37 -0800
+Subject: [PATCH] configure.sh: quote local variables
+
+fixes issue #711
+
+specifying a multiword CC, e.g., CC='gcc -m32', would cause the failure
+under dash
+
+reported in
+https://bugs.gentoo.org/show_bug.cgi?id=498136
+
+patch by floppymaster at gmail dot com
+
+Upstream-Status: Backport [f45fe1668401d72c2937a52385b492216715c0f9]
+
+Change-Id: I2ba246f765646161538622739961ec0f6c2d8c2d
+---
+ build/make/configure.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/build/make/configure.sh b/build/make/configure.sh
+index 449d1b9..43f8e77 100755
+--- a/build/make/configure.sh
++++ b/build/make/configure.sh
+@@ -405,8 +405,8 @@ true
+ }
+ 
+ write_common_target_config_mk() {
+-    local CC=${CC}
+-    local CXX=${CXX}
++    local CC="${CC}"
++    local CXX="${CXX}"
+     enabled ccache && CC="ccache ${CC}"
+     enabled ccache && CXX="ccache ${CXX}"
+     print_webm_license $1 "##" ""
+-- 
+1.8.3.2
+
diff --git a/meta-oe/recipes-multimedia/webm/libvpx/CVE-2010-4203.patch b/meta-oe/recipes-multimedia/webm/libvpx/CVE-2010-4203.patch
deleted file mode 100644
index 37f5108..0000000
--- a/meta-oe/recipes-multimedia/webm/libvpx/CVE-2010-4203.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From: John Koleszar <jkoleszar@google.com>
-Date: Thu, 4 Nov 2010 20:59:26 +0000 (-0400)
-Subject: fix integer promotion bug in partition size check
-X-Git-Url: https://review.webmproject.org/gitweb?p=libvpx.git;a=commitdiff_plain;h=9fb80f7170ec48e23c3c7b477149eeb37081c699
-
-fix integer promotion bug in partition size check
-
-The check '(user_data_end - partition < partition_size)' must be
-evaluated as a signed comparison, but because partition_size was
-unsigned, the LHS was promoted to unsigned, causing an incorrect
-result on 32-bit. Instead, check the upper and lower bounds of
-the segment separately.
-
-Change-Id: I6266aba7fd7de084268712a3d2a81424ead7aa06
----
-
-diff --git a/vp8/decoder/decodframe.c b/vp8/decoder/decodframe.c
-index 2d81d61..f5e49a1 100644
---- a/vp8/decoder/decodframe.c
-+++ b/vp8/decoder/decodframe.c
-@@ -462,7 +462,8 @@ static void setup_token_decoder(VP8D_COMP *pbi,
-             partition_size = user_data_end - partition;
-         }
- 
--        if (user_data_end - partition < partition_size)
-+        if (partition + partition_size > user_data_end
-+            || partition + partition_size < partition)
-             vpx_internal_error(&pc->error, VPX_CODEC_CORRUPT_FRAME,
-                                "Truncated packet or corrupt partition "
-                                "%d length", i + 1);
-@@ -580,7 +581,8 @@ int vp8_decode_frame(VP8D_COMP *pbi)
-         (data[0] | (data[1] << 8) | (data[2] << 16)) >> 5;
-     data += 3;
- 
--    if (data_end - data < first_partition_length_in_bytes)
-+    if (data + first_partition_length_in_bytes > data_end
-+        || data + first_partition_length_in_bytes < data)
-         vpx_internal_error(&pc->error, VPX_CODEC_CORRUPT_FRAME,
-                            "Truncated packet or corrupt partition 0 length");
-     vp8_setup_version(pc);
-diff --git a/vp8/vp8_dx_iface.c b/vp8/vp8_dx_iface.c
-index e7e5356..f0adf5b 100644
---- a/vp8/vp8_dx_iface.c
-+++ b/vp8/vp8_dx_iface.c
-@@ -253,8 +253,11 @@ static vpx_codec_err_t vp8_peek_si(const uint8_t         *data,
-                                    unsigned int           data_sz,
-                                    vpx_codec_stream_info_t *si)
- {
--
-     vpx_codec_err_t res = VPX_CODEC_OK;
-+
-+    if(data + data_sz <= data)
-+        res = VPX_CODEC_INVALID_PARAM;
-+    else
-     {
-         /* Parse uncompresssed part of key frame header.
-          * 3 bytes:- including version, frame type and an offset
-@@ -331,7 +334,10 @@ static vpx_codec_err_t vp8_decode(vpx_codec_alg_priv_t  *ctx,
- 
-     ctx->img_avail = 0;
- 
--    /* Determine the stream parameters */
-+    /* Determine the stream parameters. Note that we rely on peek_si to
-+     * validate that we have a buffer that does not wrap around the top
-+     * of the heap.
-+     */
-     if (!ctx->si.h)
-         res = ctx->base.iface->dec.peek_si(data, data_sz, &ctx->si);
- 
diff --git a/meta-oe/recipes-multimedia/webm/libvpx/do-not-hardcode-softfp-float-api.patch b/meta-oe/recipes-multimedia/webm/libvpx/do-not-hardcode-softfp-float-api.patch
deleted file mode 100644
index d871694..0000000
--- a/meta-oe/recipes-multimedia/webm/libvpx/do-not-hardcode-softfp-float-api.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
-
-Upstream-Status: Inappopriate [upstream has it done in other way]
-
-Problem is solved upstream but we have quite old version so backporting patches
-is waste of time.
-
----
- build/make/configure.sh |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
---- libvpx-v0.9.5.orig/build/make/configure.sh
-+++ libvpx-v0.9.5/build/make/configure.sh
-@@ -659,12 +659,12 @@ process_common_toolchain() {
-         if enabled iwmmxt || enabled iwmmxt2
-             then
-                 check_add_asflags -mcpu=${tgt_isa}
-             elif enabled armv7
-             then
--                check_add_cflags -march=armv7-a -mcpu=cortex-a8 -mfpu=neon -mfloat-abi=softfp  #-ftree-vectorize
--        check_add_asflags -mcpu=cortex-a8 -mfpu=neon -mfloat-abi=softfp  #-march=armv7-a
-+                check_add_cflags -march=armv7-a -mcpu=cortex-a8 -mfpu=neon   #-ftree-vectorize
-+        check_add_asflags -mcpu=cortex-a8 -mfpu=neon   #-march=armv7-a
-             else
-                 check_add_cflags -march=${tgt_isa}
-                 check_add_asflags -march=${tgt_isa}
-             fi
- 
diff --git a/meta-oe/recipes-multimedia/webm/libvpx_0.9.5.bb b/meta-oe/recipes-multimedia/webm/libvpx_0.9.5.bb
deleted file mode 100644
index 597d0e1..0000000
--- a/meta-oe/recipes-multimedia/webm/libvpx_0.9.5.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require libvpx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6e8dee932c26f2dab503abf70c96d8bb"
-
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://libvpx-configure-support-blank-prefix.patch \
-            file://do-not-hardcode-softfp-float-api.patch \
-            file://CVE-2010-4203.patch \
-"
-
-SRC_URI[md5sum] = "4bf2f2c76700202c1fe9201fcb0680e3"
-SRC_URI[sha256sum] = "2e93968afcded113a7e218de047feecf6659a089058803a9e40fb687de5f9bfa"
-
-CONFIGUREOPTS += " \
-    --prefix=${prefix} \
-    --libdir=${libdir} \
-"
-
diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.3.0.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.3.0.bb
new file mode 100644
index 0000000..87358bc
--- /dev/null
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.3.0.bb
@@ -0,0 +1,18 @@
+require libvpx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d5b04755015be901744a78cc30d390d4"
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://libvpx-configure-support-blank-prefix.patch \
+            file://0001-configure.sh-quote-local-variables.patch \
+"
+
+SRC_URI[md5sum] = "14783a148872f2d08629ff7c694eb31f"
+SRC_URI[sha256sum] = "d3dcc8d84af51c6c382b214397c62402e37a799e8ebcda6f4217aef0010451a9"
+
+CONFIGUREOPTS += " \
+    --prefix=${prefix} \
+    --libdir=${libdir} \
+"
+
-- 
1.8.3.2


