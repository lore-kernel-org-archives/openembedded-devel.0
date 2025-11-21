Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5791DCFC275
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 13:17:46 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11226.1763731060626531315
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Nov 2025 05:17:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=SHybHaGB;
 spf=pass (domain: konsulko.com, ip: 209.85.221.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-429ce7e79f8so1182722f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Nov 2025 05:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1763731059; x=1764335859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wBnqGuZtIHYojEUX4Is6UudphD5ho8Qm/A4Yi4xVbwI=;
        b=SHybHaGBFlMwQQ08mtaidDQ3dMX9Uv7dblz1N/fZ/Wjzm6w09vp9fUUAHFrnFuZHjO
         Mli3BW1sWXH9bR8Kc7/lFAb3pcpx2Yk4Jfz5M9SxKMvSVoUVujQhObkM6MtDtUoTZuug
         F0J51ZjGSz8ZO0G703YhGUzWzrEGbQMoXi7RE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763731059; x=1764335859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBnqGuZtIHYojEUX4Is6UudphD5ho8Qm/A4Yi4xVbwI=;
        b=GWHCrlm2PIxoItnMpBCc1gjd/5HwK0Km303/2tMrRAg+l1JX1/j+IsjsEogEIQl/J+
         c0rPCzmoOFmgD/uCP/kwwMkhzBdpLsSHJ0fHuCm6eJSzNXE4EDz3nh57/OGSwIsgTcWJ
         Pm5n/qnnn9OSIUkBlZyFXJn9hRiadF4Cb7TGf8Ier7JpOsVCBqXwZE6I+8EbRAld4iJo
         VVIUoNnLUCwe5WwAQlKwzYlz0EMQOy1VCUGgOPvp8ejpQHCh/3Gter16RKg17RjwhWX8
         FgMaK0CbIUuuXhLWWQtIO5ekLQqQzbpdioT3uzFf8nSb0gbo7J1zRwgzO5KlTaUTduiy
         qQOQ==
X-Gm-Message-State: AOJu0YwpFjhfoLOr2hvyE+3YZL3v/jbCX+zHbVqgdedt7qe9lVerHtMq
	HcTBIw2HzYv8s23kjTMbx/C/8hcy3fs1G45/wmtVslxQGHq0HY5J+gZSoGKX/AfQaGw9P1HlS9w
	GtTvD
X-Gm-Gg: ASbGncslisTtl8C25xexP6tSMWmFzCai5koTqY0yuKKadiOx9nZ1dTnA/IW4PuYJgSI
	PozddDK7FLR6IGUtqucBN6mRZf9zspJPWnXg7aB5PjuVdNA2eTAgavjG4H2lK6Zblq5fprVgq7r
	yulDFqpIWIvxBUWNzWqBqqdc4CQaFc+CQ9UTotWdNqD6OL+IcowkA987ZyZeyFYgV6fVEd0l/WD
	7168d6fUAr9S7rLWD2VTCsaiIGqf1KYi46+lCDdHLvHIi8uzxKGeKZrrIpvYUUMEhwGwR3Zt5Nc
	V7Jgrglmlq2bPgCqXxU4VuDSEOQ9dGhO8SPGM1zdhkATSeE7vZDxygNstDxDil6YdLOv05oulow
	gvdGRJGKNvV3TPE7y9FgkgwP+3foL0nlJbRI+ZGW+9fr3TAOTgbJ7LTxYS3bF9EVvjQ1aB+FI+J
	qikhI7sbCqgEs2X4D+Guv+4MWw
X-Google-Smtp-Source: AGHT+IE4RDr4hR5HsBOqMS0RGP8/xMTmy1WgEmVQ3qBxQ11ZbtYuUwGCJAVSko0e4QuT2n1DWKRWQw==
X-Received: by 2002:a05:6000:4313:b0:429:b958:218a with SMTP id ffacd0b85a97d-42cc1d27b81mr2556305f8f.28.1763731058557;
        Fri, 21 Nov 2025 05:17:38 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm11348550f8f.26.2025.11.21.05.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:17:38 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-lief: Upgrade 0.16.7 -> 0.17.1
Date: Fri, 21 Nov 2025 15:17:35 +0200
Message-ID: <20251121131736.2998314-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Nov 2025 13:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121961

Upgrade to release 0.17.1:

- Fix missing visibility
- Fix incorrect paging computations that occurred when only a
  subset of formats was enabled.
- Fix include issue with the COFF format

This work was sponsored by GOVCERT.LU.

License-Update: Update years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-lief_0.16.7.bb => python3-lief_0.17.1.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lief_0.16.7.bb => python3-lief_0.17.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-lief_0.16.7.bb b/meta-python/recipes-devtools/python/python3-lief_0.17.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-lief_0.16.7.bb
rename to meta-python/recipes-devtools/python/python3-lief_0.17.1.bb
index e511d0232b..de54d45ef2 100644
--- a/meta-python/recipes-devtools/python/python3-lief_0.16.7.bb
+++ b/meta-python/recipes-devtools/python/python3-lief_0.17.1.bb
@@ -2,12 +2,12 @@ SUMMARY = "Library to instrument executable formats"
 DESCRIPTION = "LIEF: Library to Instrument Executable Formats"
 HOMEPAGE = "https://github.com/lief-project/LIEF"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=be298b85ef6036ef77810ae0dce93776"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9ab5db472ff936b441055522f5000547"
 SECTION = "libs"
 
-SRCREV = "a4fcb58cfb5f0016a944f7ac20dcf4fca08aa6a9"
+SRCREV = "fe54643fe3d7a699c68b164dae87afb1eb059342"
 SRC_URI = " \
-    git://github.com/lief-project/LIEF.git;protocol=https;branch=release/0.16.x;tag=${PV} \
+    git://github.com/lief-project/LIEF.git;protocol=https;branch=release/0.17.x;tag=${PV} \
     file://0001-build-requirements.txt-Allow-newer-versions.patch \
     file://0002-api-python-config-default.toml-Debug.patch \
 "
-- 
2.47.3


