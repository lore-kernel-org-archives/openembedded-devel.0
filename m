Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0BF0C561E6
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:40:51 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24977.1785872445470193654
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:40:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=P1A1YgN9;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ceaf8a1265so3632765ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872445; x=1786477245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pjsNDc3BfnqlyMYiB/qCCsWKZVWo9V99DDFsXRbL6Qk=;
        b=P1A1YgN9TPsIftW6hq0Uot2ZctOHXCzPOuDS2QYmMCrkCvtuvzzy7f4CMzwEedHdUy
         ToEj5EB+mXiMGB7tKW22bU8KZNnsn+tmwhjPbccGHEUiu9z1KjogQ8m9E1bk9cts+SKQ
         qPS2TbmO/ONa2ax1CKcsUijIKdmLAwksYmmWGSKJ9OiSHab4hDvDRfr9BBkYi49g2CVt
         nzqwd5ZuYSPtuAh318QpI7hxg427sowbwj35E9WKctHQ+KLPWjsfgdyf6gDRHH2yJZDH
         SzO1B5DGH5m4Gxy8Rjbep8RkKj8p9ZZFqxgk+hfRMlvQcJaQyh5E5pROIiD9bzz410wa
         sFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872445; x=1786477245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pjsNDc3BfnqlyMYiB/qCCsWKZVWo9V99DDFsXRbL6Qk=;
        b=LGFfQRfGjNzxsBozvjK21DErAlOPr19kdHjL8BXMOiDSfdTrKXsdsLdV3IjI+FF/7X
         o27kUgUE1eiPk5kvavHJ841CFQiEQq1OpWfIF8wgMstx1Y8uEz13GopqVZ8PTH+aVxKl
         E8f4yGAgUjce/FltDsW1eM4Sq9Bc8sn0rP6Y0gtlenQN/8Vih/6M/cn3ySzYb7JePaU0
         vft+5+U0bMcI6LxhMwJ7zCzs0VBN2ztqoRb/AjgE7eNaQ4o2kZSPzoE3exqlkNhNDZLy
         WhYanNmERn51JK1x+v8rEP3A1LcXVEHwbe7er4iGgLQQD6/CTezCDKi8MaF+8ol0n10b
         lrBg==
X-Gm-Message-State: AOJu0YyegjWZhqEbyzLajpIpjJQD8hvkpLu6eZC9wRr/nounjfdtQijD
	TaZeAOP38Vz0Nuo32KOdVmZJsCSkmOuCVZ427XKw1LWnN9j14wF1SRUsnA2QyuFH
X-Gm-Gg: AR+sD10aULOpq7z+9QoJoEDG5lSu7WyoyxTdDveuJDATXTma1Jm4s5h2ah622F6Ux0R
	RAkAtUhatf8nrIxgrjM6oUMNLOXDz35gPT2cyExUAFvNH/W6jYQFgDQJL1j7Jfo2d5nPhRX5v3n
	r7PzgbLdDgFnu1+Gf0qFsW9G7XKPPFaE8Y/jiLEIpIHFZIiBxSGi9kK0v4Kh+kpEJf7gbTo9nsV
	J/KeibVpWrnmGTcrbPf/2/YGMrHfOSr9jetkjRTwNWDSDSaV018SNTsvsmaX8F36/eUrNRXRZHL
	OGAr5U8ZUkoqdBj835DX9ahuMFkgZA4HYHGTeB+x8ZkvyfiyXkSc2owR0RYHmlDSFOOQYCB4b46
	vEyxUmdFpn7eZ/F5V/BAbqF/M5JZowWN0KRezY8ist5R8oZdeExwW7jwBD3IGaKiaP1dcPqKugC
	N318bsMewR9ByMQd6F5xANjxUbrX5kG5dnLJ/dX2M8nVyIlLmqarw67/IiFwcbWpdDvHURs2ESB
	w==
X-Received: by 2002:a17:903:ac4:b0:2cf:a1c0:d4ca with SMTP id d9443c01a7336-2d0ca961ad6mr14051215ad.22.1785872444478;
        Tue, 04 Aug 2026 12:40:44 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:40:44 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 14/36] smarty: upgrade 5.8.3 -> 5.8.4
Date: Wed,  5 Aug 2026 07:39:41 +1200
Message-ID: <20260804194003.3158916-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:40:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128761

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fixed a 'TypeError' on PHP 8 when 'Security::$static_classes' was set to a
  non-array value (e.g. the string ''none'') to disable static class access;
  any non-array value now cleanly denies access. Use 'Security::$static_classes =
  null' to disable access to all static classes.
- Security: the built-in 'stream:' resource type now validates the nested
  stream wrapper against the security policy, so a template such as
  'stream:php://filter/...' can no longer bypass 'Security::$streams' (including
  'Security::$streams = null') to read local files

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 43fc425c3276352529cf0b7073b68cb7cf9b63be)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/smarty/{smarty_5.8.3.bb => smarty_5.8.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/smarty/{smarty_5.8.3.bb => smarty_5.8.4.bb} (95%)

diff --git a/meta-oe/recipes-support/smarty/smarty_5.8.3.bb b/meta-oe/recipes-support/smarty/smarty_5.8.4.bb
similarity index 95%
rename from meta-oe/recipes-support/smarty/smarty_5.8.3.bb
rename to meta-oe/recipes-support/smarty/smarty_5.8.4.bb
index f0779efb7e..dcb7c85a80 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.8.3.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.8.4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c0f216b2120ffc367e20f2b56df51b3"
 
 SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "042dff64a912c272e7692a442590880a3388c4b9"
+SRCREV = "94a27cbbc7820198d7adc17a2be8d457fb267753"
 
 
 INHIBIT_DEFAULT_DEPS = "1"

