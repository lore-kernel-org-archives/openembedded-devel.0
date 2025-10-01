Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79ED2CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:53:18 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.18472.1759326788483734481
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XPjFO7g/;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-62fc89cd68bso13373730a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759326787; x=1759931587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=blrahaA9+/eDz1a3rNKo/jrpNv/7Kvu1e4ROdR20yXI=;
        b=XPjFO7g/ibwc1Wl3A4CVN27/1cWfpGMeTYtyfmvhstonK5bTC1PQJ4TtEfJfcgmEUD
         9dKluMkRS7OH5rQSHb+mmCSXhdtAlOOBm7caA7JJbnSWtNFKGeHCGHvbPUMFiWzINeAf
         3TRFYna8eOzuGbGV7JbHfNSlSiIxpIGG9T67zg8b0uVKe6agwuGs4JTXkDsjZSGh+Mkh
         PqVcE/6Mc4KMkihFPLDKxwPmBnRbxoicM6cUfRGaD7Dkg9SzuwJR96P5NqnYIEoQydYZ
         3IvNso2gk0vkS+tZEYZC0LIKVcbGrIxXnJNombnachiHHpQZfaGV1cjNQk1IdivjShG8
         TMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326787; x=1759931587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=blrahaA9+/eDz1a3rNKo/jrpNv/7Kvu1e4ROdR20yXI=;
        b=NgZxykKv5aVDvhkzz4Xelag4bK072GoSzu+9yG1lHIUg0+VyqjopEAUSPiNxLyA15x
         R/Of2zrXkCh2g1hbTwk0zcMuWaBsT8DHmsPdlc0/LUXCpNCslViwg3E9xYbZmZA7R0aC
         iA3VopxqcQ0eozbp5FsgWd9WhbKGJG4w///Mp+c7HInjMSXaLyV1zgiPL+R+X8MTf2Ea
         QxFYHMr3F9NkcVKdPLRX7rLbF8FEnysvEL6k2xIogs4nQ7bcuElqJUtaqK6/jvavnJ7c
         2IUyPIJlaSSoNO6ucyf4DQSw++ZvcUaWB6LpS/GURCOhbhqZRpFw/Zu4014SwsC6LP/y
         NMqQ==
X-Gm-Message-State: AOJu0Yw89B0tWF1YvCx7dNvILg7C47aaS3TeX8V5UbUHBRMgiyRTa4fu
	krbXDHSBojRPQEMeFnAk3YdjArTD0cE2+jJfwNjBpGpTzo1WcLefJVjOD2l0tQ==
X-Gm-Gg: ASbGnctZ8sim9UCu6WIzgJCHEP/+u+zjPh4v359MGgNSdBYCh267HPhpW1xsL7X94oB
	nEM4dACegNRQ2DlyAyRobbeyVpxS+wfOHWSs9GKzmmOXPhzBepM+gTnmj2VOchJp01Y05+8Q1og
	ddP0gWQHCqjxtCUPoYWsqO89FqRpSyRsRu1coB+RkUgdKS/jm2mejKbEzWqluNB8FpgVNX/GYrk
	2T6IFm6rkX0+YUnTuTOZKP7r/nRkR1MeDQqdPLz1eMaTvtwfVGLvKjRNgXfqydeF+6DauZCr8k1
	y9RIP4V11H8+hwHQ7BL1nVWZGH3FUZpni3F1ECtx7trcQZpsgmz8jE+RILv4297Liy/tmtL7p68
	pKjCxUOFrIfZnCcq63bCbCjiXTMjtqzeOvFRWIO6Me8Wg
X-Google-Smtp-Source: AGHT+IESOVND6dTM85/bI/WepPwE9d9ualIktMLG3WNIjNot+IW6AqTXUKN41y5PAKZ/0UK2IRWWmg==
X-Received: by 2002:a05:6402:51c8:b0:633:afb7:2e6a with SMTP id 4fb4d7f45d1cf-63678cb3f52mr3994099a12.18.1759326786732;
        Wed, 01 Oct 2025 06:53:06 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm11507823a12.9.2025.10.01.06.53.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:53:06 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 25/25] softhsm: switch source to GitHub repository
Date: Wed,  1 Oct 2025 15:52:43 +0200
Message-ID: <20251001135243.1490753-26-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001135243.1490753-1-skandigraun@gmail.com>
References: <20251001135243.1490753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:53:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120140

From: Jiaying Song <jiaying.song.cn@windriver.com>

The original source URL is unavailable, so it has been replaced with the
official GitHub repository.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f88db75ffa29e0d654f73cc174e01d9edaec6df2)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
index d7bcd4f03b..b601a7444d 100644
--- a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
+++ b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
@@ -5,8 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ef3f77a3507c3d91e75b9f2bdaee4210"
 
 DEPENDS = "sqlite3"
 
-SRC_URI = "https://dist.opendnssec.org/source/softhsm-2.6.1.tar.gz"
-SRC_URI[sha256sum] = "61249473054bcd1811519ef9a989a880a7bdcc36d317c9c25457fc614df475f2"
+SRC_URI = "git://github.com/softhsm/SoftHSMv2.git;protocol=https;branch=develop"
+SRCREV = "7f99bedae002f0dd04ceeb8d86d59fc4a68a69a0"
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig siteinfo
 

