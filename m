Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOwYL-0004uf-G3
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 21:46:33 +0200
Received: by wgbds1 with SMTP id ds1so2528781wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Apr 2012 12:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=mXBwjtHUcp6ZghYRJTgm75WCaaRx9oSxLBf5/ggPNhc=;
	b=wx54tlXkEAR3AWAAPkByylnwFCOmpUit9tDTTIonqrsdppgdeJ4YHIVnj3149gsbGe
	VbpPeILWRCPYjQBO7Gi/uAqasiNJYMP8nKI/OrJDk28mEUofq3ncAX/fX8L0Xs5dtVYc
	usGQRC8OVtlXnYMjpmDLQenklYuxz6xab8X1WKpaJuLvYtAkQZiA4rKFpMTPNtcC/Qw8
	cR+RARvyiaxRv33tVlz3mqM/EO78EFleTO2qpFzle+A8ei/SY+DotfHFM+SGIdVNotOd
	V8ZJmMIXxEEsy4rGyp2Sotvhi54egh6nPCldj1Zyz6AQM1CfZgtqZ6q5eud3Sv2LFBAS
	Xkbg==
Received: by 10.180.78.105 with SMTP id a9mr31354802wix.20.1335814611221;
	Mon, 30 Apr 2012 12:36:51 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 6sm30475033wiz.1.2012.04.30.12.36.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Apr 2012 12:36:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 21:36:43 +0200
Message-Id: <1335814603-22501-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335766581.git.Martin.Jansa@gmail.com>
References: <cover.1335766581.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 9/9] libav-0.7.4: fix build with gcc-4.7
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
X-List-Received-Date: Mon, 30 Apr 2012 19:46:33 -0000

A cmp instruction with two constants is invalid, therefore 'g'
constraint is not correct but must be "rm" instead.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libav/libav-0.7.4/h264_qpel_mmx.patch          |   57 ++++++++++++++++++++
 meta-oe/recipes-multimedia/libav/libav_0.7.4.bb    |    6 ++-
 2 files changed, 61 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/libav/libav-0.7.4/h264_qpel_mmx.patch

diff --git a/meta-oe/recipes-multimedia/libav/libav-0.7.4/h264_qpel_mmx.patch b/meta-oe/recipes-multimedia/libav/libav-0.7.4/h264_qpel_mmx.patch
new file mode 100644
index 0000000..5656c47
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libav/libav-0.7.4/h264_qpel_mmx.patch
@@ -0,0 +1,57 @@
+Backport http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=5f654897e325349dacf2546674e0510bb72ecb50;hp=250cebeb3b348c3da71f9972eb500d6005dc01f1
+
+Fixes these errors on x86
+
+libavcodec/x86/h264_qpel_mmx.c: Assembler messages:
+libavcodec/x86/h264_qpel_mmx.c:1294: Error: operand type mismatch for `cmp'
+libavcodec/x86/h264_qpel_mmx.c:1294: Error: operand type mismatch for `cmp'
+libavcodec/x86/h264_qpel_mmx.c:1298: Error: operand type mismatch for `cmp'
+libavcodec/x86/h264_qpel_mmx.c:1298: Error: operand type mismatch for `cmp'
+libavcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for `cmp'
+libavcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for `cmp'
+libavcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for `cmp'
+make[5]: *** [libavcodec/x86/dsputil_mmx.o] Error 1
+
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-status: Backport
+Index: b/libavcodec/x86/h264_qpel_mmx.c
+===================================================================
+--- a/libavcodec/x86/h264_qpel_mmx.c	2012-03-30 11:39:41.324522051 -0700
++++ b/libavcodec/x86/h264_qpel_mmx.c	2012-03-30 11:54:08.152564075 -0700
+@@ -398,7 +398,7 @@
+             "2:                         \n\t"\
+             \
+             : "+a"(src), "+c"(dst)\
+-            : "S"((x86_reg)srcStride), "D"((x86_reg)dstStride), "g"(h)\
++            : "S"((x86_reg)srcStride), "D"((x86_reg)dstStride), "rm"(h)\
+             : "memory"\
+         );\
+         src += 4-(h+5)*srcStride;\
+@@ -446,7 +446,7 @@
+             QPEL_H264HV(%%mm3, %%mm4, %%mm5, %%mm0, %%mm1, %%mm2, 15*48)\
+             "2:                     \n\t"\
+             : "+a"(src)\
+-            : "c"(tmp), "S"((x86_reg)srcStride), "g"(size)\
++            : "c"(tmp), "S"((x86_reg)srcStride), "rm"(size)\
+             : "memory"\
+             );\
+         tmp += 4;\
+@@ -823,7 +823,7 @@
+         "2:                          \n\t"\
+         \
+         : "+a"(src), "+c"(dst)\
+-        : "S"((x86_reg)srcStride), "D"((x86_reg)dstStride), "g"(h)\
++        : "S"((x86_reg)srcStride), "D"((x86_reg)dstStride), "rm"(h)\
+         : XMM_CLOBBERS("%xmm0", "%xmm1", "%xmm2", "%xmm3", \
+                        "%xmm4", "%xmm5", "%xmm6", "%xmm7",)\
+           "memory"\
+@@ -878,7 +878,7 @@
+             QPEL_H264HV_XMM(%%xmm3, %%xmm4, %%xmm5, %%xmm0, %%xmm1, %%xmm2, 15*48)
+             "2:                         \n\t"
+             : "+a"(src)
+-            : "c"(tmp), "S"((x86_reg)srcStride), "g"(size)
++            : "c"(tmp), "S"((x86_reg)srcStride), "rm"(size)
+             : XMM_CLOBBERS("%xmm0", "%xmm1", "%xmm2", "%xmm3",
+                            "%xmm4", "%xmm5", "%xmm6", "%xmm7",)
+               "memory"
diff --git a/meta-oe/recipes-multimedia/libav/libav_0.7.4.bb b/meta-oe/recipes-multimedia/libav/libav_0.7.4.bb
index c4c01db..bf077c6 100644
--- a/meta-oe/recipes-multimedia/libav/libav_0.7.4.bb
+++ b/meta-oe/recipes-multimedia/libav/libav_0.7.4.bb
@@ -10,9 +10,11 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRCREV = "d4653e882fee5a2876c3878bc23d26799e3380ad"
 
 PV = "0.7.4"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
-SRC_URI = "git://git.libav.org/libav.git;protocol=git;branch=release/0.7"
+SRC_URI = "git://git.libav.org/libav.git;protocol=git;branch=release/0.7 \
+  file://h264_qpel_mmx.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.8.6



