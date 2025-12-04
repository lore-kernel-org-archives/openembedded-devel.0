Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFDF8D1F9AD
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 10:26:04 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40294.1764843961403819388
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Dec 2025 02:26:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=OYF3pycn;
 spf=pass (domain: konsulko.com, ip: 209.85.218.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b73545723ebso121703866b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 02:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764843959; x=1765448759; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AenhP3kyHz9eERSObVX3MJDPSZapFn8+nN/5CxbXOII=;
        b=OYF3pycn5ilIo9osk+rkoEOWRd0pQmeOSmKxwSAY5gHs6hffHpJU2eY7tGjadkZfk2
         JbLppDSQFeOw7S4QdWbmz5vwX8RL4Y0XGSj48HtlWqdoERBxsSJppYvQMn7DX39kLtZM
         ada/qE6cgPRirJgsTbbtxGr67o4yAsjGEjzzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764843959; x=1765448759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AenhP3kyHz9eERSObVX3MJDPSZapFn8+nN/5CxbXOII=;
        b=FDHD4bevlqssJXIO14P1L9LnelOpWMUGbuieIeCSRRcYwXWX9UJKrvRB7OspdBDE2k
         wzdPWsZv8dneJy2ckHnFrG3YaIB4swl7cJbk9EucMkPntxkXe20EM+cbsbVGZDiEwciq
         YDqYzzQr/pVUu80+GXcxUjYC1hTT3CcrBnUusSNStObkHdJfIjR366o4hb7XdZZP5tlV
         2qaDvjZnf28ux2Nr2R+XvoQEhoB0BTbV0LqRG4AVGtEgPrHZZ1TbGiO2Lenhp+m+A+W2
         jGuhD4ejbVEJ2sR0Yt307FQfQY4bQ3pPlpFZO5jA6FK46KvwocpBTh7FGzoP9O/hFaXN
         NylQ==
X-Gm-Message-State: AOJu0YyTRG4MpnC5cL8HuCmjJTtm3baVgFeczXyxLLtxjDMb51qndvds
	wEIoU+yVTZgMrfmHT1CBIQGmrtVjIw79ToUE4ULnjRKWU5Y1J7fuBS6ABg9OZ0mlbmgz8e4RjZC
	cGMbj
X-Gm-Gg: ASbGncusbS3nmwZth2Pb+19f4xvr3m88XXMXr3xuU60s/ECUS5ep8vP2uHZ9OqA/we6
	XAS0flFVkCLwstgINx8IrDEQvAVsL7tC1QDIbHxe20E4DkrkkyyafIUixwDQFmtrVjKbDKZY8KG
	JUYFVl3fCfZpt1AiK1Rl4bUjyiue1NxU3eVPh+tCArsZfxp6rScwGeoKYDs86EgyKb5mmqqkopd
	w/hG76EMS9Q4cKTsCLKCATENlFqLkM8bUFH6wKR7cHN38QJ7Xdo63cxXpDmdwfza4f2WFDURsRF
	Gkd6SCnyZofD4mlnUUie2Rjb917KaHHhCu1MWAs8o/KpXCKoBs37MJc+vMB8qtiinC6N5P2+pul
	LB2/v8XSLxnQVHFPBIpXrSD5fsk4r9G1ceZdS96JStYXN1rbi2Y2Np4K+3pp8WnNDzE37FOEMp1
	MLSWHW9UYwKq8WZfVXTMaMnUUx
X-Google-Smtp-Source: AGHT+IH9ezdMJJLJFE9RU4CA9pcjy5TL2SeYOCewB08MgVN+gyRfUcSGu5MDppOI2tyM+UjDiLQulQ==
X-Received: by 2002:a17:906:4fcb:b0:b76:3b3f:60e9 with SMTP id a640c23a62f3a-b79dc75b301mr548476366b.45.1764843958815;
        Thu, 04 Dec 2025 02:25:58 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f449d0b9sm98826366b.28.2025.12.04.02.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 02:25:58 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-polyline: Upgrade 2.0.3 -> 2.0.4
Date: Thu,  4 Dec 2025 12:25:54 +0200
Message-ID: <20251204102556.1702492-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 10:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122315

Upgrade to release 2.0.4:

- Add py.typed marker

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-polyline_2.0.3.bb => python3-polyline_2.0.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-polyline_2.0.3.bb => python3-polyline_2.0.4.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-polyline_2.0.3.bb b/meta-python/recipes-devtools/python/python3-polyline_2.0.4.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-polyline_2.0.3.bb
rename to meta-python/recipes-devtools/python/python3-polyline_2.0.4.bb
index 371bcf0163..ecfd9034ac 100644
--- a/meta-python/recipes-devtools/python/python3-polyline_2.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-polyline_2.0.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/frederickjansen/polyline"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1fb8d1dc685695195bb3c1e48adfef48"
 
-SRC_URI[sha256sum] = "abc786b9332e84f27e6e59fd4fcbcb0c4b9af6a7f7b4175e2eb6c2786278deae"
+SRC_URI[sha256sum] = "f05ade694522bf1720febebe1672f820f43a13c6a1664751e7769d47e8ca9b1b"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.3


