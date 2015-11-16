Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id DDE3673D46
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 23:16:31 +0000 (UTC)
Received: by igl9 with SMTP id 9so68226547igl.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 15:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=iZEQTI+PZ8smPnXnSO9Iat+Z8g9xfborbasRDvgaoDc=;
	b=kgNH55VBSsmnbm1pne+QKsKLhF6vIfvDqP+QnZE9uXOTAwvb8qobptyZqhIiHoqC9q
	ThpPnuuZffyUDrukSefcZH2o8EwwiwuvQQRb8aqKW5YXl7Ffes8+Ta013S8DjaUjsGTw
	H0F9WHtjwmAQddL30dYOHVAhtg16e0HyALezKiGqonWoc1G1DAbcXwqnedqk1wvVaDXq
	xXWPKPTqoqTLH0E2wOya5dUMmwQbMmnR0Gju76U7ZDb6BKMwMV+lIX2j6cy6Qd/8K8Z8
	WcT5vIEqhLyxLdxt6zOmb8UhsLzKpfmmPw5rl/ggpW5f25K33PkQpif3olszQ0iOxPeR
	JJmw==
X-Received: by 10.50.78.194 with SMTP id d2mr17817691igx.72.1447715791768;
	Mon, 16 Nov 2015 15:16:31 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id ha7sm7081015igb.5.2015.11.16.15.16.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Nov 2015 15:16:30 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Nov 2015 15:16:23 -0800
Message-Id: <1447715783-8784-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] libjpeg-turbo: update 1.4.1 -> 1.4.2
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
X-List-Received-Date: Mon, 16 Nov 2015 23:16:32 -0000

  https://github.com/libjpeg-turbo/libjpeg-turbo/blob/1.4.2/ChangeLog.txt

  1.4.2
  =====

  [1] Fixed an issue whereby cjpeg would segfault if a Windows bitmap with a
  negative width or height was used as an input image (Windows bitmaps can have
  a negative height if they are stored in top-down order, but such files are
  rare and not supported by libjpeg-turbo.)

  [2] Fixed an issue whereby, under certain circumstances, libjpeg-turbo would
  incorrectly encode certain JPEG images when quality=100 and the fast integer
  forward DCT were used.  This was known to cause 'make test' to fail when the
  library was built with '-march=haswell' on x86 systems.

  [3] Fixed an issue whereby libjpeg-turbo would crash when built with the latest
  & greatest development version of the Clang/LLVM compiler.  This was caused by
  an x86-64 ABI conformance issue in some of libjpeg-turbo's 64-bit SSE2 SIMD
  routines.  Those routines were incorrectly using a 64-bit mov instruction to
  transfer a 32-bit JDIMENSION argument, whereas the x86-64 ABI allows the upper
  (unused) 32 bits of a 32-bit argument's register to be undefined.  The new
  Clang/LLVM optimizer uses load combining to transfer multiple adjacent 32-bit
  structure members into a single 64-bit register, and this exposed the ABI
  conformance issue.

  [4] Fixed a bug in the MIPS DSPr2 4:2:0 "plain" (non-fancy and non-merged)
  upsampling routine that caused a buffer overflow (and subsequent segfault) when
  decompressing a 4:2:0 JPEG image whose scaled output width was less than 16
  pixels.  The "plain" upsampling routines are normally only used when
  decompressing a non-YCbCr JPEG image, but they are also used when decompressing
  a JPEG image whose scaled output height is 1.

  [5] Fixed various negative left shifts and other issues reported by the GCC and
  Clang undefined behavior sanitizers.  None of these was known to pose a
  security threat, but removing the warnings makes it easier to detect actual
  security issues, should they arise in the future.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../jpeg/{libjpeg-turbo_8d+1.4.1.bb => libjpeg-turbo_8d+1.4.2.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/jpeg/{libjpeg-turbo_8d+1.4.1.bb => libjpeg-turbo_8d+1.4.2.bb} (90%)

diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.2.bb
similarity index 90%
rename from meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb
rename to meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.2.bb
index e79f800..0138a63 100644
--- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb
+++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.2.bb
@@ -12,8 +12,8 @@ DEPENDS = "nasm-native"
 BASEPV = "${@d.getVar('PV',True).split('+')[1]}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${BASEPV}.tar.gz"
-SRC_URI[md5sum] = "b1f6b84859a16b8ebdcda951fa07c3f2"
-SRC_URI[sha256sum] = "4bf5bad4ce85625bffbbd9912211e06790e00fb982b77724af7211034efafb08"
+SRC_URI[md5sum] = "86b0d5f7507c2e6c21c00219162c3c44"
+SRC_URI[sha256sum] = "521bb5d3043e7ac063ce3026d9a59cc2ab2e9636c655a2515af5f4706122233e"
 
 S = "${WORKDIR}/${BPN}-${BASEPV}"
 
-- 
1.9.1


