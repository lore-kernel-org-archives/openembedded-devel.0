Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBB4CD6E57
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 23:51:54 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.392.1780530711526029510
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2026 16:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=O8KBe4ix;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8423610ec93so58644b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 16:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780530711; x=1781135511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U4lf9qSB4rj3SdpDxl3Wcxpup/jZWEFz7B9D784Tm8c=;
        b=O8KBe4ixJwPJxCRB06pmyidz32F5DkDuoDa9BwoN4Yygw3zAeZAaTbUdrnboJRPsZn
         m1SLz0azj1jcc4ERISMSJwRK8K01zi9NRLuw7lTW27MXPLFwlAo+V3Fy1SCK9Hu2VUNF
         Yxtwilq+CnCPmvjE+AzoeIK7u/ni9gemC6uUlhqD7LSIqqVTamVOo9n883Fuhtswqoio
         ZZf931scqA21W0d/FA6kShrXm9uj7k+OKYAyU/OpVZdnshvd6rjddBB0NDw0uDoh18Wj
         4s9hDkaJEKEHFeFeBxkA2u9zvgd4B+jKoNalP2FxgvWoI33GmVYvlAkY5VGQEMBSatFs
         8vrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780530711; x=1781135511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4lf9qSB4rj3SdpDxl3Wcxpup/jZWEFz7B9D784Tm8c=;
        b=TwPZMZ0bIojY0lpemXs8LsGJHsMc4ZmRpXAQEw1UtL/a9Y56WKkf0O4hnBx0UdgbUp
         sL+LEkoh4ma257231cHjfuLypyS3jCIA87RXcJ5Av/HVpeqt6TAodt5s3rbt2jVMv02H
         UCgx7tn3TA5QE8DnWnv3RISz38mV9EoLPhfD/BAN3eofPNPaaBe+jPKa2iemYVD/w6P1
         CEW+RmoygphDLe5FiJ5Hb1Z3svmbKNx466xByj1C78HuEK9fQ0gcknZeYy3lcKqFNWE0
         WY7Vu2AqBwbcRTks30ApQwiqc2JKUQgKxSk64DRGk8ihURITm3nB2fLX/mOVUp49LIrV
         O95w==
X-Gm-Message-State: AOJu0Yy2YXyC7hhTp8jdY1/t4xFgtnpap9pgW/Bci7MHIVTz8x1qrRva
	/0yWtYbc97BYcpeFIFRhO5rYvdIwKaXfY+ggudpsrq3ofiwG9VxhVuhrlCZjLA==
X-Gm-Gg: Acq92OHyVJeU952FHPwsQy7ZIAfK5b0q6txAf8c/IOYwwrXQk8KJaoxz7VRqFxn73tL
	bAkSqrWPgIvqiwrFxKQUgLbcAomF2+WTXEW5AQuh3e6d68Wx6T3otRwzpTHfAOw5gCQHGuUlNP2
	7XVXoIsLqgc/a7cwK/udkLBgcCLKzPfWUxrMzfs31T2BiysKFm8uKcYZsW1yyhGVIg/LbHmRuZx
	31LFVk7nn51N9uTfnWWiwMNoftOQUGmX0UcIYCWY1tJpap4sA7y/saDz5ENC7RN3IGhQvRTNH9h
	NOh9R8OCZ8Yj+ySEr0XnziZ7uDS0HQu4cVECiYi0NymG6+bwDRvH2aPgTKNPuPNUjVR6OG/Bc87
	WQwYRzf4Zn7NrJiEt9eqjTN3KS5/9pKF5J5HGTHW9F7d/4SO8BoDhMXaKtKxxU/xTwIgPG6cGfS
	IYS6WMPO8yutjZmO+qyXE6hrHzcdpcFWFm6dN111XMhN5/oY8=
X-Received: by 2002:a05:6a00:2e05:b0:83a:4846:90bf with SMTP id d2e1a72fcca58-84284f8e64amr4906333b3a.43.1780530710846;
        Wed, 03 Jun 2026 16:51:50 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882156sm4009012b3a.33.2026.06.03.16.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 16:51:50 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 1/1] freeradius: upgrade 3.2.8 -> 3.2.9
Date: Thu,  4 Jun 2026 11:51:42 +1200
Message-ID: <20260603235142.1905694-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 23:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127391

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Added tag to the SRC_URI and dropped setting PV in the recipe.

https://github.com/FreeRADIUS/freeradius-server/releases/tag/release_3_2_9

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{freeradius_3.2.8.bb => freeradius_3.2.9.bb}          | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-connectivity/freeradius/{freeradius_3.2.8.bb => freeradius_3.2.9.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.8.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.9.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/freeradius/freeradius_3.2.8.bb
rename to meta-networking/recipes-connectivity/freeradius/freeradius_3.2.9.bb
index d9b0bc9b1e..39b43c2a73 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.8.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.9.bb
@@ -15,7 +15,9 @@ DEPENDS = "openssl-native openssl libidn libtool libpcap libtalloc"
 
 PATCHTOOL = "git"
 
-SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.2.x;lfs=0;protocol=https \
+FREERADIUS_TAG = "release_${@d.getVar('PV').replace('.', '_')}"
+
+SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.2.x;tag=${FREERADIUS_TAG};lfs=0;protocol=https \
     file://freeradius \
     file://volatiles.58_radiusd \
     file://radiusd.service \
@@ -40,9 +42,7 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.2.x;lfs=0
 
 raddbdir = "${sysconfdir}/${MLPREFIX}raddb"
 
-SRCREV = "4e4cbbd93ff3b469a773c964c7b5b6f53d01457a"
-
-PV .= "+git"
+SRCREV = "23811c830f1230ad466b3fc597e5676c045f8e0c"
 
 UPSTREAM_CHECK_GITTAGREGEX = "release_(?P<pver>\d+(\_\d+)+)"
 

