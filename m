Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id D109D77037
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Sep 2015 07:51:30 +0000 (UTC)
Received: by wiclp12 with SMTP id lp12so42509934wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Sep 2015 00:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aqyf7Kwbx10wn/M76sliOvmegvGmjlCCg+6kg4LFCws=;
	b=nH0wWgb55QLJYN3k8zXX4xjf+qi2KsrYSzLHWw0S6F/uFu1iPAxLX+gAnppNNPtIRc
	LGHgT0vrIB8sNrE7ADEUjTNGqoU3UuDw2fots+KJw8VFAptiUBovtl3rhWMdTDVWrXqd
	3nsOLnuzrKb+7RvgO6eSVnj8zAEyNhQUVj2x25vpBRpzzg1G2dPEFG5fRArczbOrcryd
	wjRjPWAEHEfMHZ8w2StcXw7/8/TPoV7fU6pBb9XV2jcWNJUNsP92e9VhEa+a3UH0ZRAY
	T/WJAqVfs6Nx/keGr88YUezmdV0q5nVmoq+jgfbLlkpo5VFddxCXb7XQbzuq9d3PHsuN
	ViJg==
X-Gm-Message-State: ALoCoQmrODoWYh1aMgOgXGjWf07eYJ/tskzBQ3JSLdx3RihBuT9UFDYmXYXUr7qU2QHtjSo79f84
X-Received: by 10.180.211.116 with SMTP id nb20mr11106753wic.50.1441266689606; 
	Thu, 03 Sep 2015 00:51:29 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by smtp.gmail.com with ESMTPSA id e8sm7584647wiz.0.2015.09.03.00.51.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Sep 2015 00:51:28 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Sep 2015 09:51:20 +0200
Message-Id: <1441266680-5575-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.1.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] gd: disable webp/vpx support
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
X-List-Received-Date: Thu, 03 Sep 2015 07:51:33 -0000

The recent update to libvpx 1.4.x broke gd. Upstream has replaced libvpx with libwebp, so fixing it isn't worth it.

If webp support is really needed, backport https://bitbucket.org/libgd/gd-libgd/commits/a79232c5fa69 and add a PACKAGECONFIG for it.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-support/gd/gd_2.1.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/gd/gd_2.1.1.bb b/meta-oe/recipes-support/gd/gd_2.1.1.bb
index 0731902..62008df 100644
--- a/meta-oe/recipes-support/gd/gd_2.1.1.bb
+++ b/meta-oe/recipes-support/gd/gd_2.1.1.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "http://libgd.bitbucket.org/"
 SECTION = "libs"
 LICENSE = "GD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c97638cafd3581eb87abd37332137669"
-DEPENDS = "freetype libpng jpeg zlib tiff libvpx"
+DEPENDS = "freetype libpng jpeg zlib tiff"
 
 SRC_URI = "https://bitbucket.org/libgd/gd-libgd/downloads/libgd-${PV}.tar.bz2 \
 "
@@ -26,7 +26,9 @@ EXTRA_OECONF += " --disable-rpath \
                   --with-freetype=yes \
                   --without-fontconfig \
                   --without-xpm \
-                  --without-x"
+                  --without-x \
+                  --without-vpx \
+                "
 
 EXTRA_OEMAKE = 'LDFLAGS="${LDFLAGS}"'
 
-- 
2.1.0


