Return-Path: <net147@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7D222770A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 08:20:01 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id fy10so47356212pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 00:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QjIiUo0uoif6h8KVPOTuSdLl2lWSQFVVDw7TxYXjUa8=;
	b=Tc4OrW249Gvg8fO2u5CJSRGVMiFN/QsdWusmAkJ/9UnaNMKC/pY76uLiF3GzLWAfry
	L6VVIV+WoC2POqXwl6xhmK9fsTrsx6CIpt6mLjYgZXb4JfaV2E4jo71eUFNONp+BU3GD
	oQtciARMvtfIj57OBn1WWERu/tDb+o3I2EhIC1DPR1+L8PSzuu8Z0W8MODu7gFRaZJ+0
	FvRh8dlB0OV+z2d0Mcih4bV2sY79qAAks+1KAZLA1nIqD868T3KKRC3+SWrS7wD1urNX
	996woR4EoZOfxIQtEDxSohxrBr4/D9a9VGGPfYCZLDONIFyJ3DMb18kp+9nWkmabvq32
	9JKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QjIiUo0uoif6h8KVPOTuSdLl2lWSQFVVDw7TxYXjUa8=;
	b=DwHZwX6P/GoEZo4vw21wLKSbIlAU3w8mUPB0uHKJP1hpfvqcai47uY4Vplf+/oRnTx
	TCoo4/ZdzeUeH+/M8it/V/VT168viJ5Z7m5l8AiyncYwwmNlqCT1XYjncV7z1VtOXvO+
	rJz+rr0LoZt0nuORVkwgRasRq45vY35f7sVFz1t6AbmWPrPeegtwWY082QTwny96EZxc
	oGFbT7GQ1pBJTT4Sc4g4FU5lbkoFnsHCvLe4GfmZL9nL38YFW68BkyaOeR2yDRhd4FMM
	+Zt/pXaWXZGXa0dvS5HfExPhM8gVS2lk1hkQunw837kBTmXIelQVnn0eyMytvOCvp++K
	yoKw==
X-Gm-Message-State: AD7BkJJTf32gHcR3rMXOis2WUcmBzWfoxu/Ez2tX5aP04OR+I1qULNnBp0LpmgqyQpxEnA==
X-Received: by 10.66.145.194 with SMTP id sw2mr288976pab.69.1456474802124;
	Fri, 26 Feb 2016 00:20:02 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	fa3sm17300497pab.45.2016.02.26.00.20.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Feb 2016 00:20:01 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Feb 2016 19:20:12 +1100
Message-Id: <1456474812-18671-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [meta-qt5][PATCH] libconnman-qt5: remove blacklist
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
X-List-Received-Date: Fri, 26 Feb 2016 08:20:01 -0000

The package no longer fails sanity test because of connman-qt5.pc
containing references to build host paths.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/libconnman-qt/libconnman-qt5_git.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
index 71c04df..0fc4bc0 100644
--- a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
+++ b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
@@ -15,5 +15,3 @@ S = "${WORKDIR}/git"
 inherit pkgconfig
 
 RDEPENDS_${PN} += "connman"
-
-PNBLACKLIST[libconnman-qt5] ?= "BROKEN: QA Issue: connman-qt5.pc failed sanity test (tmpdir)"
-- 
2.7.1


