Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29717C0218F
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 08:54:29 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.47381.1737968062559902457
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jan 2025 00:54:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kRWnR8iB;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d932eac638so8214564a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jan 2025 00:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737968061; x=1738572861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sgL/MWkyPWn8EMnrS+R2bO/mPx+210UH3ezVRBlcidk=;
        b=kRWnR8iBUmoc+XmrImaSb06h/Z5D6cYNB0xFfyXvItj+rZyIEcPA5b89Po071Fsnyv
         D/Xa73xIE0caUS15yxyUbRYPa6IKegu47YGp7+7nLrRmsFxiduVPBWu5ILpPhExoS7n+
         DWeE5RuPrYg/HrVlMfgWzZFiiq3g3OWY1k94TIGL3l7E+8F3IZOcZ4rC62quawyUJwuv
         /cz05MVPdeABqtis+0S3aObJSFTHv4DtvoKUuLPKoAGOfwdRGNB2IAytkCV3SR2KPBOY
         dvSsxXBIKWcQBWopMXt1LhHHsnaEneixqFP2t8DXIOqCzn6LC1eoKHGx4j6caN5RG7XC
         Ha8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737968061; x=1738572861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgL/MWkyPWn8EMnrS+R2bO/mPx+210UH3ezVRBlcidk=;
        b=HHdvBPigGol2FnM39DJW51sGYvKdTCiCOZ8LjNGi2ojG76NovsSyemZ9MwiAOG4Xwi
         tXzT1NnhAzVawr2ZCAAW7xOFBkcBbFE3uJoag70lNzjnevsJ1ZLscKFRWvQTtW1zvbkD
         jHDm7E9dhUrSfhRJpG6lJUoRNJXIe2MbKwQC8TAp9fEPWx7wLyNvE/hVUg7wapyWUHoH
         2DjfUEmLsOUjlrRS2SGhWnYCcIKvJgL1xRjj1o96ahhqoZnwhDutvzbXQc5JjI+mK1m9
         tbc1cSjGJdsoeJdjnXAzxS0U+6znyzJIv6CvG7TiKaanU/2oLKM+LnDeOIx+KlJyBUdj
         4zZw==
X-Gm-Message-State: AOJu0YydUzm4cmv4LgB5PAFIu6aOqV0qofZyQ7/07bEcx71I+T34xmgt
	qzrblU7+e9HRsAq9aO0F+gBwHjv/X3ItZbWt+2KUBpqSh7bQNAGiGHnZvQ==
X-Gm-Gg: ASbGncsjBGlMMAv4zuF506F1offQVjuVes8+3kp5yv40Q7KyCmhTo/RoS0iTIbG+kSq
	m33igz/FuXsIVpxFsqLU8op/amCoPaZrxvFEEnLyxtET29WbqyGFeIz19r3gOI64WSw9zc2/A8y
	/tzyK+8Sqb7XckcR/QCAIavuIqCu6Jv9GtlX5cs7WPZWvaaVwIEeVq2ViE9fEXKSn1WwXmFNf2A
	7O7I8iKAFtmlobDDNwokbFZqm0gfsr5Eov7/lUgT1LEVQ2mUWP9N2SDL1fkYXiWJZMu99cED0F3
	f+56fMH+S+7EWJKSSqb1Rhto7cuViwtphUSaSQ==
X-Google-Smtp-Source: AGHT+IG7TmEP7pU8CMVX5R6fmWru2uALBU629iBOh9okQe/6kHKhDwLt9Y1yLI3nh7nOOLdVnQ6Jgw==
X-Received: by 2002:a05:6402:1d54:b0:5d0:d1e0:8fb2 with SMTP id 4fb4d7f45d1cf-5db7d2f108bmr39735967a12.11.1737968060635;
        Mon, 27 Jan 2025 00:54:20 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dc1861836dsm5032658a12.16.2025.01.27.00.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 00:54:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][styhead][PATCH 1/2] lapack: add PACKAGECONFIG for cblas
Date: Mon, 27 Jan 2025 09:54:13 +0100
Message-ID: <20250127085414.54529-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jan 2025 08:54:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115104

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb b/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
index 4357515b71..aafcdef681 100644
--- a/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
+++ b/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
@@ -24,6 +24,7 @@ S = "${WORKDIR}/git"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[lapacke] = "-DLAPACKE=ON,-DLAPACKE=OFF"
+PACKAGECONFIG[cblas] = "-DCBLAS=ON,-DCBLAS=OFF"
 
 EXTRA_OECMAKE = " -DBUILD_SHARED_LIBS=ON \
                   ${@bb.utils.contains('PTEST_ENABLED', '1', ' -DBUILD_TESTING=ON', '', d)} \
-- 
2.48.1


