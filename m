Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TJcrH-0006pK-6z
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2012 06:16:23 +0200
Received: by mail-gh0-f175.google.com with SMTP id z2so14105ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 21:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=qgoVsXSw5vYuUsXROkN5zsITI9oYPZqOJdZB87zo0vM=;
	b=I8h/7APIq64a+/4iCwCBI2f8YHogylWcvHLwknqhKdtWKcTrd0IlOvvCWDpwrXHEKb
	vb9ypW/Jva5H6yNB4T8hpNaVOh85Gc17pm/xVJHs8bAgg1YXKPMBNF4bDYCwpXs08EO7
	bvNfublKT4+oQuzMz2/LurNfvIlMvbTMlgSLeQa98bQHFEzykXIj7JRINPz0+q84E6xe
	IdgRsjH8v3y15Bs8ozxJiVAV7njEfTd0GOMTkDhtNPvnj2HI2Ety08qbX+PBxBFJ5F0g
	TQq81mE1vtG5hWhFLQGXT6haE+xqhr4+y6YopjzY6n32r4/Em+UGa3hJybo+OTBV0qGy
	H4SA==
Received: by 10.236.200.168 with SMTP id z28mr3924061yhn.34.1349323404718;
	Wed, 03 Oct 2012 21:03:24 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id h22sm8519798yhk.13.2012.10.03.21.03.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 21:03:23 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Oct 2012 01:03:03 -0300
Message-Id: <1349323389-16520-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1349323389-16520-1-git-send-email-otavio@ossystems.com.br>
References: <1349323389-16520-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 3/9] libav: Update to 0.8.3 version
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
X-List-Received-Date: Thu, 04 Oct 2012 04:16:23 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../libav/libav-0.7.4/h264_qpel_mmx.patch          |   57 --------------------
 meta-oe/recipes-multimedia/libav/libav.inc         |    8 ++--
 .../libav/{libav_0.7.4.bb => libav_0.8.3.bb}       |   18 +++----
 3 files changed, 12 insertions(+), 71 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/libav/libav-0.7.4/h264_qpel_mmx.patch
 rename meta-oe/recipes-multimedia/libav/{libav_0.7.4.bb => libav_0.8.3.bb} (68%)

diff --git a/meta-oe/recipes-multimedia/libav/libav-0.7.4/h264_qpel_mmx.patch b/meta-oe/recipes-multimedia/libav/libav-0.7.4/h264_qpel_mmx.patch
deleted file mode 100644
index 5656c47..0000000
--- a/meta-oe/recipes-multimedia/libav/libav-0.7.4/h264_qpel_mmx.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-Backport http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=5f654897e325349dacf2546674e0510bb72ecb50;hp=250cebeb3b348c3da71f9972eb500d6005dc01f1
-
-Fixes these errors on x86
-
-libavcodec/x86/h264_qpel_mmx.c: Assembler messages:
-libavcodec/x86/h264_qpel_mmx.c:1294: Error: operand type mismatch for `cmp'
-libavcodec/x86/h264_qpel_mmx.c:1294: Error: operand type mismatch for `cmp'
-libavcodec/x86/h264_qpel_mmx.c:1298: Error: operand type mismatch for `cmp'
-libavcodec/x86/h264_qpel_mmx.c:1298: Error: operand type mismatch for `cmp'
-libavcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for `cmp'
-libavcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for `cmp'
-libavcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for `cmp'
-make[5]: *** [libavcodec/x86/dsputil_mmx.o] Error 1
-
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-status: Backport
-Index: b/libavcodec/x86/h264_qpel_mmx.c
-===================================================================
---- a/libavcodec/x86/h264_qpel_mmx.c	2012-03-30 11:39:41.324522051 -0700
-+++ b/libavcodec/x86/h264_qpel_mmx.c	2012-03-30 11:54:08.152564075 -0700
-@@ -398,7 +398,7 @@
-             "2:                         \n\t"\
-             \
-             : "+a"(src), "+c"(dst)\
--            : "S"((x86_reg)srcStride), "D"((x86_reg)dstStride), "g"(h)\
-+            : "S"((x86_reg)srcStride), "D"((x86_reg)dstStride), "rm"(h)\
-             : "memory"\
-         );\
-         src += 4-(h+5)*srcStride;\
-@@ -446,7 +446,7 @@
-             QPEL_H264HV(%%mm3, %%mm4, %%mm5, %%mm0, %%mm1, %%mm2, 15*48)\
-             "2:                     \n\t"\
-             : "+a"(src)\
--            : "c"(tmp), "S"((x86_reg)srcStride), "g"(size)\
-+            : "c"(tmp), "S"((x86_reg)srcStride), "rm"(size)\
-             : "memory"\
-             );\
-         tmp += 4;\
-@@ -823,7 +823,7 @@
-         "2:                          \n\t"\
-         \
-         : "+a"(src), "+c"(dst)\
--        : "S"((x86_reg)srcStride), "D"((x86_reg)dstStride), "g"(h)\
-+        : "S"((x86_reg)srcStride), "D"((x86_reg)dstStride), "rm"(h)\
-         : XMM_CLOBBERS("%xmm0", "%xmm1", "%xmm2", "%xmm3", \
-                        "%xmm4", "%xmm5", "%xmm6", "%xmm7",)\
-           "memory"\
-@@ -878,7 +878,7 @@
-             QPEL_H264HV_XMM(%%xmm3, %%xmm4, %%xmm5, %%xmm0, %%xmm1, %%xmm2, 15*48)
-             "2:                         \n\t"
-             : "+a"(src)
--            : "c"(tmp), "S"((x86_reg)srcStride), "g"(size)
-+            : "c"(tmp), "S"((x86_reg)srcStride), "rm"(size)
-             : XMM_CLOBBERS("%xmm0", "%xmm1", "%xmm2", "%xmm3",
-                            "%xmm4", "%xmm5", "%xmm6", "%xmm7",)
-               "memory"
diff --git a/meta-oe/recipes-multimedia/libav/libav.inc b/meta-oe/recipes-multimedia/libav/libav.inc
index 21b57b7..aa170c5 100644
--- a/meta-oe/recipes-multimedia/libav/libav.inc
+++ b/meta-oe/recipes-multimedia/libav/libav.inc
@@ -11,7 +11,7 @@ ARM_INSTRUCTION_SET = "arm"
 # faac faad2 lame schroedinger libgsm
 DEPENDS = "virtual/libsdl zlib libogg libvorbis libvpx libtheora ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'liba52', d)}"
 
-INC_PR = "r5"
+INC_PR = "r6"
 
 inherit autotools pkgconfig
 
@@ -38,8 +38,8 @@ EXTRA_OECONF = " \
         --cross-prefix=${TARGET_PREFIX} \
         --prefix=${prefix} \
         \
-        --enable-ffserver \
-        --enable-ffplay \
+        --enable-avserver \
+        --enable-avplay \
         --enable-x11grab \
         --enable-libtheora  \
         --enable-libvorbis \
@@ -82,7 +82,7 @@ FILES_${PN}-dev = "${includedir}/${PN}"
 FILES_${PN}-vhook = "${libdir}/vhook"
 FILES_${PN}-vhook-dbg += "${libdir}/vhook/.debug"
 
-FILES_ffmpeg-x264-presets = "${datadir}/*.ffpreset"
+FILES_ffmpeg-x264-presets = "${datadir}/*.avpreset"
 
 LEAD_SONAME = "libavcodec.so"
 
diff --git a/meta-oe/recipes-multimedia/libav/libav_0.7.4.bb b/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb
similarity index 68%
rename from meta-oe/recipes-multimedia/libav/libav_0.7.4.bb
rename to meta-oe/recipes-multimedia/libav/libav_0.8.3.bb
index bf077c6..66a32c9 100644
--- a/meta-oe/recipes-multimedia/libav/libav_0.7.4.bb
+++ b/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb
@@ -3,18 +3,16 @@ require libav.inc
 LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LGPLv2.1;md5=e344c8fa836c3a41c4cbd79d7bd3a379 \
-                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-"
+                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-# When bumping SRCREV make sure you bump PR here and in dependant recipes (gst-ffmpeg, gnash, omxil, etc) to account for SOVERSION changes
-SRCREV = "d4653e882fee5a2876c3878bc23d26799e3380ad"
+PV = "0.8.3+git${SRCPV}"
+PR = "${INC_PR}.0"
 
-PV = "0.7.4"
-PR = "${INC_PR}.1"
-
-SRC_URI = "git://git.libav.org/libav.git;protocol=git;branch=release/0.7 \
-  file://h264_qpel_mmx.patch \
-"
+# When bumping SRCREV make sure you bump PR here and in dependant
+# recipes (gst-ffmpeg, gnash, omxil, etc) to account for SOVERSION
+# changes
+SRCREV = "2fb4be9a99a2c2a9435339830e3d940171cc0d9b"
+SRC_URI = "git://git.libav.org/libav.git;protocol=git;branch=release/0.8"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.2.5



