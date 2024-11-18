Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8441D49227
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 14:06:18 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.41170.1731938770017302823
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 06:06:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=3gKrGZSn;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.46, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43169902057so35062885e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 06:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731938768; x=1732543568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I8aJDPlsAoRN/SU6rIwO019AjsJV/USDTiN5cz93lEI=;
        b=3gKrGZSnwvQ/MynPwilNTd68Q+6XRJAVanKgYoeQHoZ2snCKWznwagjnTwKVLr5U+j
         hUWV0rRQiMrpvP1m/7MNaJF8pa64zDtgVwRHv6+7lduDN3g5TWgU+YeNh0KiLbISRAz/
         9XWx4/fw5YGK+cRSOtyXcPGFcf/xbTuG6HQUUCsE4YmGj1aJAa9vzj5JACg+7dm5SmMh
         6pF0GzFRzmODIqpvcT8H6PnCqHIYxtz4nCVBpeVvUusliGq8ErpZNQBrU8RUv2Hoazxp
         KKf3XRtbu+7USKNHTI0b1rwpgALf5NC7bdLg0DloleeeJ5/OsyHv4ws4e8rZUouart6T
         1wQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731938768; x=1732543568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I8aJDPlsAoRN/SU6rIwO019AjsJV/USDTiN5cz93lEI=;
        b=wFOFoQVQJxmczbi2mMKGrL71fBgXAOSRNRCInW1EJE41b5mPu4TORIU8bEtmDOYqG0
         hQbDA6Cm/RYZvEce/xwMJ5fM7i5IwxHX0lOCdDEsL6UOetnC+19jc3lcGyzlTTe7vIHU
         /GqBSKlANPGwWB5lYP+ESlKZ6d/QLTcXvQOzMgh4czeIMjIPruGBBU9Agv6kP775CiL5
         Vo/l4VeYaNEReUYSOIo9S8pCwoqCJdA6jE2x7QFu5tsRLeixo97g0VF6i2TiQMPu98hK
         pGSmitITPpKR/RF9IXaNR8gWmCPu25FXSKJVNhbBpJgaRkELNfqfwmhMR65l2va1+JVw
         /Yfw==
X-Forwarded-Encrypted: i=1; AJvYcCXfINMULrcYpkSDqbwOa6Z/SD/SJwOZst7ROSyoz3Fx2PIDdJIkEDXPhSynRgWJBSACDgE0eYSbXCCJG4lAeNLR4NQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwIobMpySBtOveWtmLMzna3A8xe9sMQ4t++Yb2aC7LMQFl7hnQU
	azLmQJEsSR4O6PlHOReC+MjR7KjyLMNxn5TLONgQD9wfcMyt+54B5lp1KLDLd3I=
X-Google-Smtp-Source: AGHT+IECjoEaEgDPDVmr8vRhNawrYMcBxY6/3zwzx+XrKxZzNHORysQZJHxH57hLJh6PGJPZ2DNebg==
X-Received: by 2002:a05:600c:4f02:b0:431:59b2:f0d1 with SMTP id 5b1f17b1804b1-432df71c4a5mr108082975e9.4.1731938768106;
        Mon, 18 Nov 2024 06:06:08 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b8ce:8ea9:933b:1ec6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab788e1sm155959475e9.15.2024.11.18.06.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 06:06:07 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH] python3-gpiod: update to v2.2.2
Date: Mon, 18 Nov 2024 15:06:00 +0100
Message-ID: <20241118140600.58984-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 14:06:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113903

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Bump the python3-gpiod package to the most recent bugfix release.

Changelog:
- fix Chip.request_lines() typing
- improve the output of LineSettings.__repr__()
- import gpiod attributes in external module
- specify a tar extract filter for python >= 3.12

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/{python3-gpiod_2.2.1.bb => python3-gpiod_2.2.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gpiod_2.2.1.bb => python3-gpiod_2.2.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.2.1.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.2.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-gpiod_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-gpiod_2.2.2.bb
index 8e1cbf849..2df87c0e7 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.2.2.bb
@@ -3,11 +3,11 @@ SUMMARY = "Python bindings for libgpiod."
 LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & CC-BY-SA-4.0"
 # The actual license files live in the upstream libgpiod from which the pypi
 # package is spun out.
-LIC_FILES_CHKSUM = "file://setup.py;beginline=237;endline=237;md5=f5ddb56912b7f20bf94aa4d1bdcd3533"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=241;endline=241;md5=f5ddb56912b7f20bf94aa4d1bdcd3533"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "802dad3a89016339a231c462c6da2d56c820f5fb11519728ff86cdff0a16da96"
+SRC_URI[sha256sum] = "aa4571f64e1070d38e4c14c491f69637ee73e23c801d3a418dde4d5410e5d53f"
 
 inherit setuptools3-base python_pep517 ptest pypi
 
-- 
2.45.2


