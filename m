Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id D2B3B6A5A5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Aug 2013 22:53:30 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so1253242eae.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Aug 2013 15:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vyWYqITc5+Ml6VhkJRIIr027LktDZbcYzNTR/oD5AGU=;
	b=GBSTiBcrpVG2oRYSjpuMirOzHoFd3tkuIeTxApXr1dwGNHawoYgVIixpAZhAD8PGgZ
	m0s65y1HWTcrAFsIc87VJ2Vrg7/AktWQzTQS0JzO+FRdnF3769baeDM/njmJpBmEureh
	g3u8lhOQ1RnORgjPwdV6/dxCLmfofnYoR2BFT4+QTJt3BOqdYFht0cOd0i2+pLQhvMBn
	zX9h8RR4Plp0RVd1rhGXLt1YYXZPzQYyVTmPLRe8ZfE8Olvrnbf+hxuyEGrSVhgrgtbK
	HSKvmta5rJQIOgx2ZWZDWUO9rtNU4W57jqW+xhnUi3UlJMMr/9L9/D3DUVCekqduLS2s
	M+Lg==
X-Received: by 10.14.107.68 with SMTP id n44mr20799822eeg.26.1377471210706;
	Sun, 25 Aug 2013 15:53:30 -0700 (PDT)
Received: from mizar.localdomain
	(host92-223-dynamic.20-79-r.retail.telecomitalia.it. [79.20.223.92])
	by mx.google.com with ESMTPSA id a43sm16923993eep.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 25 Aug 2013 15:53:29 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Aug 2013 00:53:23 +0200
Message-Id: <1377471203-489-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-initramfs] [PATCH] klibc_2.0.2: fix hardcoded symlinks to linux-libc-headers
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
X-List-Received-Date: Sun, 25 Aug 2013 22:53:31 -0000

Klibc needs a copy of the linux headers for itself to build.
On target the libs and a second copy of headers are installed as well:
we link relatively to the staging sysroot of the target to make
these headers available when necessary.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-devtools/klibc/klibc-2.0.2/klibc-linux-libc-dev.patch       | 2 +-
 meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/staging.patch         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klibc-linux-libc-dev.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klibc-linux-libc-dev.patch
index 28efcfd..305328b 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klibc-linux-libc-dev.patch
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klibc-linux-libc-dev.patch
@@ -14,7 +14,7 @@ Index: klibc-2.0~rc2/scripts/Kbuild.install
  	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)lib
  	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)bin
 -	$(Q)$(MAKE) -C $(KLIBCKERNELSRC) ARCH=$(KLIBCARCH) INSTALL_HDR_PATH=$(INSTALLROOT)$(INSTALLDIR)/$(KCROSS) headers_install
-+	$(Q)for x in $(KLIBCKERNELSRC)/include/asm $(KLIBCKERNELSRC)/include/asm* $(KLIBCKERNELSRC)/include/linux $(KLIBCKERNELSRC)/include/mtd; do \
++	$(Q)for x in ../../../usr/include/asm ../../../usr/include/asm-generic ../../../usr/include/linux ../../../usr/include/mtd; do \
 +		ln -sf $${x} $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/ || exit; \
 +	done
  	$(Q)cp -rf usr/include/. $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/.
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/staging.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/staging.patch
index 03955f2..e8df8e0 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/staging.patch
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/staging.patch
@@ -21,7 +21,7 @@ Index: klibc-1.5.24/scripts/Kbuild.install
  	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
  	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)lib
 -	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)bin
- 	$(Q)for x in $(KLIBCKERNELSRC)/include/asm $(KLIBCKERNELSRC)/include/asm* $(KLIBCKERNELSRC)/include/linux $(KLIBCKERNELSRC)/include/mtd; do \
+ 	$(Q)for x in ../../../usr/include/asm ../../../usr/include/asm-generic ../../../usr/include/linux ../../../usr/include/mtd; do \
  		ln -sf $${x} $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/ || exit; \
  	done
 @@ -103,7 +100,6 @@
-- 
1.8.1.5


