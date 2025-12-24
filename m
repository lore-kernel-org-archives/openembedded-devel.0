Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B1B3E78486
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 19:25:25 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126343.1766604322557712473
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 11:25:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kROO5IYS;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso25576185e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 11:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766604321; x=1767209121; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oI4fUnLmH3SN+RpGMxXJZbYp17MX9wePWDAt9+TpLGs=;
        b=kROO5IYS0Y62Xy/6tSd2DWvb4UGwvlFh0rEkkniQHzotj6bT4VjfP7k/FAlfAnlKHt
         JxVa3+a+UZqmq5WTL9D82oejryNf4VBMQSjG5e2HFnYAQLr9QiEDWdnkvbnSjBkM8/5m
         djQ/u10lLT+uKL4pPmOeKF2oVkR8w6/aMfd3wIwt7ZbxLJHsPWkRLvybZMrm+PYZwKky
         36MlJ6kCvAOQewz8t1y22xXNhzpspCrfVHaNBG5LcXPlxawsH9NNb+Ymd9ckMU9zkMR/
         Y6ou6EMAnvF/B1dAuQ75SibzO1TcO0rBtoeZestfL+3CcQy/OPV24Kh9jfC+EFruDLW+
         8hVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766604321; x=1767209121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oI4fUnLmH3SN+RpGMxXJZbYp17MX9wePWDAt9+TpLGs=;
        b=nKyizMN9WmSVi5JZVkhDYp2Wy9FIhwJk/wEluqaC0QUsjWyOx++Yx0fEkj+iEnE7xF
         e9ma+6OCma4LPLbpx64UvEFOcIU1lLHQqaf6f0hEEz47V4yRHkc1unOpmzHzU7ymF3Wh
         DmwrgbfUhwmzXB93ZDzSmy5nGnGLYayysroiKiYgvepqONS4B91t10XOssnSZurLCaON
         P4hvs/XhnC8cLOApmAhO0DXfPIYMeWQ3RQQ/HmQGSdAdQyd4StwtxIG82QrBx7x7FUO3
         M66yrs4ZNC/j31wm+qiaxIsSrIud5P/hzq8Z3NES7XB96c1nJmwVJO4M9K2eCkb4PFXy
         GfTg==
X-Gm-Message-State: AOJu0YyjQwyVDP1Iwt36UfEXhM8/n5XEYDbg88hBWGUamQAVIMZqnfux
	taVzUS5VzvCoIWsvxDyiOBU3XgnW9Dc30nOLMmwXEwZSCpF1jy2Hvn9MZ1VOWQ==
X-Gm-Gg: AY/fxX5IAFYVXpCgTUfaItzI1nKXoXJq2fzqc23nSwrYXbR5xE6VnT511olB193XILx
	OeKHcaKwwxVs8Z3xyVmTD0fmo6fkFk7/6+zSiV7UJGt44LlqZXFLHxK1CV38rDkYINeGEWydhjk
	D+f48cx2ODMaR+bJdsrH6HwuABA5XErPjDpAKCt63jHiWxZgZEWge+gemWYrp78+Sx6WKUjLIyl
	CBoP6F2EtMkbMnybIImvO58cfQV8foyFa+bzf/PtIJX6EgZPucP0eZ6eUep5E21VQn0ChoYVRmI
	NdYFqZKaA8fPk2eyBe0fCeRjDWngwYAmMxswch5nIwD1F3kzYLU2ABFHUcfz72QjgsuAAuJNP/m
	V6OEx/owplyVdD02e055ptPExqcen7cRaGcrYMOYooNYncAoDTwxsru3bf3n5SPRy/kpS2yPC/X
	a5gdn/BFHv
X-Google-Smtp-Source: AGHT+IEwzyNLzBIg1oUSfkm5sDcUdEJZpv+n0je9YU+5dA5ocRyDik9CcIkrUa1OG/+16eEMcI6zrQ==
X-Received: by 2002:a05:600c:4e8e:b0:477:9f34:17b8 with SMTP id 5b1f17b1804b1-47d195330dcmr184715345e9.1.1766604320712;
        Wed, 24 Dec 2025 11:25:20 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea227e0sm36782038f8f.17.2025.12.24.11.25.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 11:25:20 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/6] libsrtp: upgrade 2.5.0 -> 2.7.0
Date: Wed, 24 Dec 2025 20:25:14 +0100
Message-ID: <20251224192519.2630037-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 19:25:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122886

Changelog:
2.7.0:
- Fix function signature mismatch for srtp_remove_stream
- Fix srtp_unprotect_rtcp_mki when RTP auth != RTCP

2.6.0:
- remove use of pointers to 32bit values
- Cleaning up cmake and enabled more warnings.
- start using const on internal arguments
- Some srtp_driver fixes
- remove travis reference from README.md
- meson.build: implement mbedtls support
- iv length is constant so set only once
- Add x86 SIMD optimizations to crypto datatypes
- Add a missing typedef for stream list ctx
- cmake: Rename TEST_APPS as LIBSRTP_TEST_APPS option
- cmake: Support configuring as subproject

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libsrtp/{libsrtp_2.5.0.bb => libsrtp_2.7.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-support/libsrtp/{libsrtp_2.5.0.bb => libsrtp_2.7.0.bb} (84%)

diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.5.0.bb b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.7.0.bb
similarity index 84%
rename from meta-multimedia/recipes-support/libsrtp/libsrtp_2.5.0.bb
rename to meta-multimedia/recipes-support/libsrtp/libsrtp_2.7.0.bb
index 9130b290b9..3e992c403b 100644
--- a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.5.0.bb
+++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.7.0.bb
@@ -8,8 +8,8 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2909fcf6f09ffff8430463d91c08c4e1"
 
-SRC_URI = "git://github.com/cisco/libsrtp.git;branch=main;protocol=https"
-SRCREV = "a566a9cfcd619e8327784aa7cff4a1276dc1e895"
+SRC_URI = "git://github.com/cisco/libsrtp.git;branch=2_x_dev;protocol=https;tag=v${PV}"
+SRCREV = "ee1a77c9f9dc02c42bda9901038c500c5efe4cfa"
 
 
 PACKAGECONFIG ?= ""

