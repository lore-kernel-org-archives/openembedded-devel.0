Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFAF6D65C70
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 15:37:37 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17443.1765985854422873849
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Dec 2025 07:37:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VgkXxAB1;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6498850d3f6so7625413a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 07:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765985853; x=1766590653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FTflRo1XWpmR61CTV9/MC8IED+8BA9OIeOsMvFS9Wsk=;
        b=VgkXxAB11JC+b7rm24lNSrmuqV1rmOO2hyc9fQ4Mz53eP2CPbjVoQxvRs4oN83Uz3x
         mh9cxV90NyCnbTEQy7Sov/dzjj0L4EsLiAw0/+L/o6r5+0GdIQQo+dUobnf70FWJtp5q
         Epzsrnk6KT4frjRvFmAtk5oW24L/+9s2m7U7DcjNrxsu3E4yRM4HkDJO9gWa6PJ0O9BJ
         lVVgUzsSdpC5+XJeMKozZ0l2Yrwz6HUo9LflHLnCaCB6J+YxeDyxSb5nHu6mMmk9lU0m
         RBVI65OJIEsjw6Mndh7mBNYQ64j+3aB1DXJEq/nk50UuQYFZ70eL3YtfJWoA0UcX3/oS
         emkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765985853; x=1766590653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FTflRo1XWpmR61CTV9/MC8IED+8BA9OIeOsMvFS9Wsk=;
        b=E3S75u7VvywnQDHNgT+evC3viofTuXCBnCKtlLGYuDWLw90/7WjZKazVWITbEcqxN+
         4WljNKM6//9OGJXE3L6714kkFI5NX4H5RATBKvmnxA41STBmGq9B6QiPJJdDfXHogDUS
         YQ4UYCdA6knjPC1ncZ3ofvVUJSn1B7aEBeLl8Kx1rKyYwPcNHNpga2yo1qvvD+OYRlE1
         xkyZZPmWQiPL6wB5x+QQyayZfIcH83J5CLh0r+dncvBbPs4NGBdFf++mTaddOerG4w7f
         W9lZjkP5ZOSmUFpqlagVIuy5faco0G4639G4Iwa8G+mco360Ex3gy73GqpaYU+VK/Rhd
         RSaA==
X-Gm-Message-State: AOJu0Yyc7Uk4r8borUrA/dXdFb3sjKW7I6bQY27JlBriTrkp/lYJxYJG
	wULoW/4IPe9U2ffBiS4cQp8tJAmRU6/ZrvhNLSNn7Bz/4dFe2rEh0QINGkR2ww==
X-Gm-Gg: AY/fxX4DSWnTEY/lJqgzkk8hGmKLMsnlaZNBoc1sbIMjzvpGPARX06N96EmqMHsgoVK
	D7cPZYO+v3E8aia1AXNphEPvrSpFTsmmKAvLFrRur06Jr5S+44zpBkwH94BSV7cyq9ibTKVaNwO
	AJ5J+ET1BD0Dgoz6GAJIdhyAWhd2e9CXExBxljhgAYUYJdnVaFda6imPG15BGZCZe/qMdD3gE4l
	Pd52pWYapjebEW04c14pr8+3yzotphB5Ofq/5kDCbZxvzYkpoPWKVfMA6/isSlSvnBQxorPewfe
	b1mK5Rg9TJjHoDZ1xL8niebUjLuJd+pTV+Xjvnj/wRtekSxTJv6SexJyvKU2ZCQqJ9snF7vtpDL
	TlgQWFEyaHzxVAJKRTRcyeBGre7snX7SNsNzbFNJs1GESxTiM3TzbVDkBB0BcsUb2RUg9SY/FZf
	Vnl7jWeAKPZ1sLnILblpCo8F4DdPnKsgE9kXJL6Hz6h7bjtqbs/0nVJsuYqonc+w==
X-Google-Smtp-Source: AGHT+IEwh5lN5qMyhH23Jm0RPcxNSf+peQFIeoOWVzTT5JPMhlEtVQEb+Y7fRV4552oS3TXZYpV2iw==
X-Received: by 2002:a17:907:d8d:b0:b73:7280:7821 with SMTP id a640c23a62f3a-b7d23c5c2c6mr1761808166b.60.1765985852329;
        Wed, 17 Dec 2025 07:37:32 -0800 (PST)
Received: from ws.taila4487.ts.net (77.241.136.46.bredband.3.dk. [77.241.136.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80164a36d7sm130234766b.30.2025.12.17.07.37.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 07:37:30 -0800 (PST)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] dbus-cxx: upgrade 2.5.2 -> 2.6.0
Date: Wed, 17 Dec 2025 16:37:55 +0100
Message-ID: <20251217153757.43289-1-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 15:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122724

From: Frede Hoey Braendstrup <frede@vokalo.io>

---
 .../dbus-cxx/{dbus-cxx_2.5.2.bb => dbus-cxx_2.6.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/dbus-cxx/{dbus-cxx_2.5.2.bb => dbus-cxx_2.6.0.bb} (96%)

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.0.bb
similarity index 96%
rename from meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
rename to meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.0.bb
index 0908409e1e..79cf9449de 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.0.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPL-3.0-or-later | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=24594f493407a4cd401ce9794e0b9308"
 
 SRC_URI = "git://github.com/dbus-cxx/dbus-cxx.git;branch=master;protocol=https"
-SRCREV = "f2637e726207ecfbdaaf02744e1b36e54f929c9d"
+SRCREV = "b705ad73bef724de0ed33f60462c70b380b6b300"
 
 DEPENDS = "libsigc++-3"
 
-- 
2.51.2


