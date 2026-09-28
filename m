Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73B8CA5FA3
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:03:46 +0000 (UTC)
Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46620.1790553816737237749
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NN5ylh7i;
 spf=pass (domain: gmail.com, ip: 74.125.227.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2df964b6893so10148705ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553816; x=1791158616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NwbUkSW63eJSngyudtE0scqBbFPFZn+CITFM0XocW2s=;
        b=NN5ylh7iTipVv/MkHj4k5lbtJX8n8ElTH6UzLlNT0s+u0kyUhWOh/sA+AHbuJnTgG3
         4F1uQLklMNjzZlD9pEV8+i+Ag2jAY1B87Z69BV+rzj76aTdiiDzqtnSewUnJbjI0YwG6
         YEiYPO96RrWvS7o+CQEGDpojeX7xk6dCT9B6RbXIYK5fGKlB+hh8y+rjq9shYwR/siXI
         nrVHJawisCqH8acMOqiVPHH2JZ8Wa8TdJIRxCVUnNFBT5uvBI/BqrZa5QZkSHURh5eWa
         i+4P7EnCmLVEaS3xPfOgSVckPrgvsphBNEYjAcxvs8Cnsdv7KWJWNYnJgsntQ1sWlEeF
         3JOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553816; x=1791158616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NwbUkSW63eJSngyudtE0scqBbFPFZn+CITFM0XocW2s=;
        b=f0+l4jwoOR86Abb64POR/9YeiykSg/J9ZhTOvoeFMByAwHPrL40xDuikREkO2AOkG7
         C/BUHP9f11U4rm6qxhSXFi1m1xOeldoudF3jWlGfoH07NOQf6ZGRtqt08BojMqh3AB6V
         okRXfTIDoI12PWaXMFvMhFwz1kUExJ464+hfMUu5nA1u4vfyKvaAVsAqdUr59pVWBkFM
         2Wpfsb+dC3smVbHWTo4ZIxBrXimnX6Hri7YmJO2+2/RtH06BZRGkmCm/XM982hkT8fRz
         goM40Zwtnsu+W8xOlnuHBOv47eJAhVgoW13R79UzjyWrCYNtGEkIJhrpl8JrAmZrIeLy
         J0Jw==
X-Gm-Message-State: AFq9FYI65mVxuBUDiujdP8W3G3V/bmA6JhV7niX6S5Hq5FXOxa5h9tsq
	G52jTdcs6XBEZI0QU5JMgMB74M/0RrBS4VZeBTKUo+Q4LLImwMPhCMWp2mVUFA==
X-Gm-Gg: AYBFou3y4dvcopV8Pvzeo9gfqrRgurdXz+rB+52sbZJkrby4hdzyI7Kz2PJSS/+XRSY
	yPtsrEPYxoA5sqjnhVAuOOSqOm7LxiyVmmbqn0kHa2ZQaQ+goGHYRL7dlLUaGK3ybil9C/7h025
	6Jc9BUxzt05khmyO8KXEC6DSGnZZMsFH7EtTUIce6NZBCgAJFSFqTQ1fyLkDa9m4pIfsT/Y3/sk
	s+UY1C0ADA93xhHgxWE1rQmuMRNbuH2SrHFLt+Ac8rfkPZLXzXNt5KZTbkJtnVG8Ioojo/JnUk1
	FZcPAkQYzfakp9ya8IQInxOgq++IX1VC2olDQNjcZws8rmI+nMpX2fTBQvoqIfHltQf9BNDU2cH
	cZ8CYAye+6x9W6QtKYQduiXUmsxnVCE4PGahaLexvv0kczdK6tIKlofwyqwVwaaW69GLHLMRBdE
	TwWDbkr6gdpQiew9Mh9bR/3rhC6Pv9bctMwluaWSsdTH6Mxku/LHH8u5+hdQuh/Vu2sIj03QUb2
	QgRoele4GmBlP6VgQMmYeg=
X-Received: by 2002:a17:902:f64c:b0:2df:9eb0:760d with SMTP id d9443c01a7336-2df9eb07af8mr47796565ad.61.1790553816116;
        Sun, 27 Sep 2026 17:03:36 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:03:35 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 13/30] python3-coverage: upgrade 7.16.0 -> 7.16.1
Date: Mon, 28 Sep 2026 13:02:45 +1300
Message-ID: <20260928000302.2528437-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130400

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://coverage.readthedocs.io/en/7.16.1/changes.html#version-7-16-1-2026-09-13

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-coverage_7.16.0.bb => python3-coverage_7.16.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.16.0.bb => python3-coverage_7.16.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.16.0.bb b/meta-python/recipes-devtools/python/python3-coverage_7.16.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.16.0.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.16.1.bb
index 8a9d1cefe0..6b0204a939 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.16.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "077f0964087883176ff6ab9b074694cae29f8c708273b13ca62c183c6ed716cd"
+SRC_URI[sha256sum] = "f83981779bcf9dfa06fa0a8d4cb43e0faec1706328ce07aa3e7b665b4ac0f210"
 
 inherit pypi python_setuptools_build_meta
 

