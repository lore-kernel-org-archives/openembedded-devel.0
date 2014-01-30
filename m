Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9FB496E98D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 22:28:39 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id h14so1956555eaj.35
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 14:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9m+kcKsVM15Qs7bGNDZrlsuhunNjy+06HO2+5RFbi5I=;
	b=bOlkkoty5a/whk3Czln4fg1Xl7XbtAwG/9BWGs2wwvRvqfotgKID5njN+qPLwNY7LV
	MBe4YjrrdzdOsouO6/teJuwr5LFFLFlF68a1+pGX6fNHgteKRF4txFwo9f9C6mZ16MWg
	lab7axeuf4buECjijaulzAWDP8O4YIFzxkCITwR2uP4dl3Zt0Eoy8FU0MoFUlO7O0xU5
	/2dsupWxYeTlzaNgQRUq92UVpTvuyOasK66h0WoMkJ99PTNuj6AKZjO8ewwamTxqcWP8
	HQpo4bqYLK7YjDSTbF0JPvaKQngWInpSAkpnahNGDteZdd+4TVwdlVgMlSRN8PkCyJQV
	NhkQ==
X-Received: by 10.14.111.201 with SMTP id w49mr251752eeg.92.1391120920130;
	Thu, 30 Jan 2014 14:28:40 -0800 (PST)
Received: from mizar.localdomain
	(host113-250-dynamic.40-79-r.retail.telecomitalia.it.
	[79.40.250.113])
	by mx.google.com with ESMTPSA id 4sm28319472eed.14.2014.01.30.14.28.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jan 2014 14:28:39 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Jan 2014 23:28:30 +0100
Message-Id: <1391120910-568-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-initramfs][PATCH] klibc.inc: remove ${PR} leftover
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
X-List-Received-Date: Thu, 30 Jan 2014 22:28:40 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index da9d994..983681a 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -54,4 +54,4 @@ do_configure () {
     ln -sf "${STAGING_DIR_TARGET}${exec_prefix}" linux
 }
 
-THIS_LIBKLIBC = "libklibc (= ${PV}-${PR})"
+THIS_LIBKLIBC = "libklibc (= ${PV})"
-- 
1.8.1.5


