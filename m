Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FB5FD875C
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 12:18:28 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74596.1773749907690287323
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 05:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=arJSfPZS;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso50192935e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 05:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773749906; x=1774354706; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=38xgp6fTPjDfuDhHvss6cyVqODJvGdX5Z92ULZ4iK1Q=;
        b=arJSfPZSV9rRU2nWRIa8czWZ0H6ZYjoMo31gCzbE3tZeLH2mnKBxVX8mzsAzoJU3Q5
         BdvITzAkFJWbze8qzILl52myYwAudY3aNrLg7T/+/oaF6zjOpaqxeHQTni4pk7fGQYrM
         ik0JkZse1Od/m0O0ujV7bmZLIg7SgYSRrer4kGxHRXnGxeAE24bDK9s1bG2TRdCiLXhF
         0ea/qly+F3f4x2tkHxeaXhp7Kmc8vNy/niljr5yPGoop1M6zoVxMDlAHfMRjGBGkgBDy
         0/P7XZn7gf4nghS0+rzCLQGEwWr5uTUMEDPe44H1KMvMH+OtNJiRLcFFNSi6FVVbyaHU
         4G3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773749906; x=1774354706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38xgp6fTPjDfuDhHvss6cyVqODJvGdX5Z92ULZ4iK1Q=;
        b=j3+Ss1onKulwNrNUgdoD5daoxn1EIxsL7JgP8kLvN2SmaPYnxBkiPP0Tm0IqTdtsL0
         5WbfC073UX1UzvbWlbyl/6q6UFzPhrfLqm4BAlbbgg0yIhP3/ZGTm+BjozWao7qz06yV
         o6Ih226rCoOPu2QKXwcK7KpmQsY12hbDpFo6bFoc0RvMKKxToWHbgO/xTNY5D7sHMmLP
         lcGwbhskrx3xcQHPFuHhf2pm9UXbxIx8W6ehRYQ3c40+ZhFK341HOMjsvssWR/B7DwQt
         SxCMW7yKHhYa6EAMx+xzUh1vwI2TfuiA/saGrsiOC+9PJrSOpoBC5qsdd1SDmYqVcCxG
         DUhg==
X-Gm-Message-State: AOJu0YyqDUIFO01M8kCu6DXs2QiJqCsV8FGE122CJJPg8AmTTZjNwsZT
	W5qxER5aTvshUR8CVr+BVL0jt4ztte9x6Zho11HSXWp1sCYCm43SAFsou5xzTg==
X-Gm-Gg: ATEYQzziWpwhryZB6wJMNQsZYu5Wv+fiDBq05vn5qnib2NK64rYfrnZS2hKwap28Q+v
	vcYURMgWLT+Ypp+iBTR5NqTqiSDdESFZlpAQ63+CBFutUySB44+1S6u9onaz7gqv4kinXQt3IPY
	jr3CLGsUNJ2hOze08BTpq/aRdrjwq7psZull5qDXNUSpsqdesxYmgY4EN9edLZqhI5zKHOF9oUR
	QHfwXcu5vlLLGh6vxxnL/ErVXUS1+ij3rPR/Wzw/+Iu3TsJBBVx/ORwoaIR4W6uLWyVDLq6Ae5b
	y17VT5dlQCT8M0WXwvt7bi87ZvzQeacF0LEmafgGofeMoIvr7rpmm4eFKLjs/cs8+xdncKHLZw9
	dzVSPoq0fYhbstcGw0e5iiCfFmJku5LbESunE/ZCYcFOysaq9+C/DXrniwE1RdGttWEVE1UCRwO
	fO3kGAaxDggRwO6ZMC43/o
X-Received: by 2002:a05:600c:3104:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-485566e316dmr262760725e9.1.1773749905644;
        Tue, 17 Mar 2026 05:18:25 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48634a7ac2csm31006735e9.1.2026.03.17.05.18.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:18:25 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] imagemagick: upgrade 7.1.2-16 -> 7.1.2-17
Date: Tue, 17 Mar 2026 13:18:24 +0100
Message-ID: <20260317121824.1770597-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 12:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125311

Contains bugfixes and a couple of CVE fixes:
https://github.com/ImageMagick/ImageMagick/compare/7.1.2-16...7.1.2-17

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{imagemagick_7.1.2-16.bb => imagemagick_7.1.2-17.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-16.bb => imagemagick_7.1.2-17.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-16.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-17.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-16.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-17.bb
index 56b6c0710a..2a1152087a 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-16.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-17.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "70563ce3759b7a55801900a11e69978a9301fbeb"
+SRCREV = "3f2f629405c62106d3569547c03634bc46fcd07d"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"

