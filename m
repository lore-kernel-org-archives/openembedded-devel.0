Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27EAEC44501
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 09:02:50 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7914.1768986166565813793
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 01:02:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=NIucLIXB;
 spf=pass (domain: konsulko.com, ip: 209.85.128.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47ee07570deso44607655e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 01:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1768986164; x=1769590964; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ltWK9R8dqSbHiZBvX6sSfPdFhvJ/IMcooxNP2zwnYI=;
        b=NIucLIXBBTp4vCCXM1juQdwBrDoa2q4/HAetxl4DmoN1O1R23EiA1z6YpSiC9eTujs
         8wi5EcqMwSOT5YcuOsuQhH9LQB69TlVpUbPqAHAU6ioaL6OUO2IjdHjgt97bsWXJ5KUw
         rrvGwxGorJA9GWUwcUlZq2GB1Uj61Cobxw5b8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768986164; x=1769590964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ltWK9R8dqSbHiZBvX6sSfPdFhvJ/IMcooxNP2zwnYI=;
        b=WUb8AeVT+uYUfMOk4MP44EpmjdZoUA8pJljclxJ4BwXBT3Bl2nlBMwEOM3F/JZdUvS
         Prn3mP0LHcHsV7NojdYkEmrazY+Z9D3YyTn5CAoxGHmUJbc+OTbOZnZSgLcg6gEny4rT
         RvX4hJ/4m0aEioQT4H7m3U/L7novgFzR7cmvudpWdZ4w2/5TUmoZLpyeVF7YRvhwt6DO
         qXqPf4c4IgYYf8x5axHOgAc3+wIvkENA9EKdYNxTQxUecOgQwdnFn8v7uxXY+rO63NyP
         xh4X7npuwTFwE+16avWUqxIH/5u9E1tgPKARFttPBAridKf6Qvzsq1lHoUqA0tAOGlVR
         M9Sg==
X-Gm-Message-State: AOJu0YwHnSGKCixM1+FAP3OqkMLpJiQae9DqXApPzCgwIVCHVwLcDIQa
	rf/6yR4Q3YSMdBDpf2wSz2JjP1MiGc/kCzgSVgCc0WTE2551GFUHvYP9jJymyGpChbAMZEEjT6X
	u2uUA
X-Gm-Gg: AZuq6aKz0Q5fIPvfwvnAM7b+r+PwcSii1WAQBri24YXH3MVcQ6b2FiWI128DkLtzCEN
	t4SXER8aFWRvnd/0vZ3N0fFKHbS+4a/2zuj0EKKg0MqMSmc7IZ74kY+kWf0nldVeWmUrEIxka19
	Jy+fSws2QJegN+78mxkaIKU0gs+MiscMR1inyV4vyc9VzkMi7JEhrQpZuR2vAr2+aHsbu4ooeH1
	tgBDc2Q9eEA73PnDk6QSIYGatzkUZwEq+VJZy6X0N8TNJS2Nj89rHyyHmdHyvS5vga+/0S8p4pc
	IRN1rOgkGXK8Jv9XsiKwHFHgWllWa8BcN031B7IjwSDAXhS5hV50b7vv7wYWleABGz/KQ259Tvd
	6OUQH/+tZG8WYFHkPsL+gin7uBf7C+zpFT5n3+4s+WB4QSb9EINAr6q0jOCodNr9R79aeRi0wEP
	XraU7sl3ZRXRP6PfGga3NbuVzA
X-Received: by 2002:a05:600c:4448:b0:477:b0b9:312a with SMTP id 5b1f17b1804b1-4801eab9db5mr213073665e9.7.1768986164211;
        Wed, 21 Jan 2026 01:02:44 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8caceesm295050815e9.13.2026.01.21.01.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 01:02:43 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-bumble: Upgrade 0.0.221 -> 0.0.223
Date: Wed, 21 Jan 2026 11:02:39 +0200
Message-ID: <20260121090241.2437885-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 09:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123689

Upgrade to release 0.0.223:

- Add annotation for Heart Rate and Battery Service
- Add test for Heart Rate and Battery Service
- Add support for RTL8761CU
- feat: Add filtering options for usb probe
- Fix GATT TemplateSerivce annotations
- Improve Address type annotations
- Replace send_pdu() with write()
- GATT: Support Multiple Requests
- Correct ATT_MTU in enhanced bearers
- Add HCI Packets annotations and send_sco_sdu
- Return 'invalid handle' for malformed read by type request

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bumble_0.0.221.bb => python3-bumble_0.0.223.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bumble_0.0.221.bb => python3-bumble_0.0.223.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-bumble_0.0.221.bb b/meta-python/recipes-devtools/python/python3-bumble_0.0.223.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-bumble_0.0.221.bb
rename to meta-python/recipes-devtools/python/python3-bumble_0.0.223.bb
index 87a0b8376b..3d9a6aa89f 100644
--- a/meta-python/recipes-devtools/python/python3-bumble_0.0.221.bb
+++ b/meta-python/recipes-devtools/python/python3-bumble_0.0.223.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/google/bumble"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a775f1b11285b6abedd76748d176125"
 
-SRC_URI[sha256sum] = "44e9ed8aab0aba256491c2acedd3080b48bb070cdb6776017d6d794e035f0dec"
+SRC_URI[sha256sum] = "2a5c3f2605fc5ecd6a519c1fb89ada6c825b4d27db32f8be9ab1c0a654703d3c"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.3


