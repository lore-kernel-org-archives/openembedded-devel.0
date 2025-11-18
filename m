Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A2FCEBF92
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 00:27:36 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.362.1763425651271230698
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 16:27:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bs6+DoWA;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2958db8ae4fso45290245ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 16:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763425650; x=1764030450; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x8rwKXg40rnw33IHXw8jb25EBKtc+JtVPOuleINME8k=;
        b=bs6+DoWAxjR1dDq0/ugOv57NLbLwzNrVF/tdPLvKBcwqg0auTEjrzrBEfWBqY8ydQY
         HXewt38UDVzE1aSSKmZ4OlDYfhZEBHxS6aGOWQ0WoWustwEJfWh9Ah4W7v17QJWnUYIy
         pC+HpEv2jSs8RptlZlP4wfhGZDd6ofWNRGPQwW6BUo4556Sd6FFynoMpjGDWQhrX+4/C
         l3Y+XoqLyaZLe3fjZ1yeRmo7CbiMbVE0GMUxFu/2D22vEvxVBWpFr/kYFDoSuib9ce1I
         ys7nPGTEXxT+iQZM0ex/vqwSxQ06C2P8ryfwPbMfq2erWjJZ6g4LZjSy4j9sKHqpkuy2
         Y07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763425650; x=1764030450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8rwKXg40rnw33IHXw8jb25EBKtc+JtVPOuleINME8k=;
        b=WXqHCvheWa/1s+MaHUVNux4HTKC2B0QRrvUg+bN83ZKT5gRvDeQGSnNwQdfruWHRn3
         bJtpiz3eeEVyl41VkjOLhBUzKX4RQ5I2CXhG/GONrlxwFs6fuBmtfYFBjga78CHVGvfZ
         7DtvaF7dkb3XBmL4k6/IkdFJd/hNGkjiyGSPjRUpkJwa1HE8rpT56NW/4r1qNV1xJuSi
         FQw+SxdHWJdrppBQ1i8UlHqSGpKUA0qOU1XXJyucv4SY3sxmkuCpZNkgl/apxS4qYNNU
         AIVXRFvTdqcERWKpF3rsiaWsqup7/yswWfnNglk90sRvUiRLwrdfnuV+BRZBA9qXkkvi
         nrSA==
X-Gm-Message-State: AOJu0YyxYqtL9GcMDVVBkRl9voBfUWzVBUq22TgtWKn9fVYsNwIT8opY
	aziTELsFeJtjqb1h1LwJqVpOH70Lfp4dhosLvsO0IPg3Fb7itDXt2qtz4tW8OQ==
X-Gm-Gg: ASbGncvkDk+h4OUcIYHZR2KxyUvMK9IQtTBvtdN1/x2ED8qDJbNMsAM2PR01Jooj3E5
	SC7V2darJ6x4oeYqwfJLLwax8Hra0XEq7AU+zYUxlCtmue4NkffKm0hGo6LYOsRJkTz2i1Togva
	RL2yWRjzv63Rw9qPWlCec6s4VYeK+8Snsku5YHjsVF6kO+EEews5V4GvLpIWhhIoRLz67LmG24G
	X70n6OuUri1GEEJubxXT9Dn8U7whHQIGsuziscEi623y/Hp9X4ixau4ztBTeQk0PlBlp4lM0TKs
	8Zd2iq+if/x4U05iCCUNPoi3HO02Kbu8C+9zh1Cbof/uucEXyD0ZfW97LJVa/jAVF7DDwNhWvnu
	nqUQ99XJc4DRzsK55y/MHAr8m6bWS6RKhGolzUg7hS4G0U1ErCQD6K+BLehXVXtmZ9jUyHO94Dl
	KPZnmTYC11qaVSMmqtCLefgrA=
X-Google-Smtp-Source: AGHT+IHtanz1dmmdYuQIIW6KamlVPhVGWRpzJybE+fRTmP+GjrFxx1AewwaiITcjioyXbMmt2vk8Dg==
X-Received: by 2002:a17:902:e947:b0:290:b53b:7455 with SMTP id d9443c01a7336-2986a6b8746mr165180925ad.10.1763425650426;
        Mon, 17 Nov 2025 16:27:30 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm153866565ad.36.2025.11.17.16.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 16:27:30 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/6] zchunk: upgrade 1.5.1 -> 1.5.2
Date: Tue, 18 Nov 2025 13:27:18 +1300
Message-ID: <20251118002723.829508-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 00:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121787

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/zchunk/zchunk/compare/1.5.1...1.5.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/zchunk/{zchunk_1.5.1.bb => zchunk_1.5.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/zchunk/{zchunk_1.5.1.bb => zchunk_1.5.2.bb} (92%)

diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.5.1.bb b/meta-oe/recipes-support/zchunk/zchunk_1.5.2.bb
similarity index 92%
rename from meta-oe/recipes-support/zchunk/zchunk_1.5.1.bb
rename to meta-oe/recipes-support/zchunk/zchunk_1.5.2.bb
index 9ef380005c..bbdd06dfda 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.5.1.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.5.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
 
 SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;branch=main"
 
-SRCREV = "69dd7d6764e333413dd12848607d72cab310e406"
+SRCREV = "222d1a4da3661dd95c2445b96f7e1e208f55d219"
 
 DEPENDS = "zstd"
 DEPENDS:append:libc-musl = " argp-standalone"

