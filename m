Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B796DD4920C
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 11:58:04 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11030.1765540676103003276
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 03:57:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LCWquiPr;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7f1243792f2so786785b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 03:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765540675; x=1766145475; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uo6ahKw9grb93SGcx/QdrFpWFQBBuVhqAOYlMF+XOSw=;
        b=LCWquiPr6NGkcIdSK+HwTpKFfXSqGIaVEYeTZrNlpHNhTTvvF1zCv/Wz4bndb3jwe7
         +eFl/J57LEpcKxy1S+BvCts8NXqCJf8YrfRS10qBbDjNkiOQuM2HjgPOx1HN5PMM6ujS
         AnIR3vePOdNSwwZFNsd7PO2CHjL8meneewe6oiimSz0mKl/KEaoEb+JjeoRCayjV4zd1
         nESkMWBbgc5ly0tVPdhXq3tR+6dZb2pLiOud71gap7RH71nHyqU+NwsCOfotFEJ4kYcw
         xOuUPAC39/RgtzGhcnXlm4FLPx05sdYGqcLsYA2xAiggJCt7xB2snOFL6UXKckHKfBam
         6oPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765540675; x=1766145475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uo6ahKw9grb93SGcx/QdrFpWFQBBuVhqAOYlMF+XOSw=;
        b=K7SkQEY3yWLCnenU5AGG5Gou/wh82X1wQAAah6xgFNrTjvU/bAyobkGZYJ2B1jF4fv
         n52LgoZnlPh69wkMbROGISCJoryfG6QIAASdqrhtCKo4c/4AUbrVTUVybcg79syz8ijF
         DuRA+mIC58gywqGbCmvuhGvExYrLRXVLcf+Q4LnQSpUm9xDYJH9SuT00b4owG8cqFcIZ
         6TNK3nPhAaN5EL/m6Q+iw8oWbJlSnpzeGUpy8OFOgyKbARALLvvXznR9LTSdSTn7o7i5
         f/hqMtnSnaf69VtYVl9VWUuoezH4r5r/clPQ3cKRCtQeG0Din1AVj5FL9hT5UzfFs55p
         oDig==
X-Gm-Message-State: AOJu0Yz8jesZfJRRX7pb4eFzDDCs/2uHYsPcgNIe5YWuFvEvO0zjxJpc
	BuTwk2FWd6mLOWAXmSDs26tOsqOI9Zd/o2loEpZ8u76Eh3E2Ioj3kzeU+Rtnww==
X-Gm-Gg: AY/fxX5vs7qtOlDqQTkBTIWBXK0/xsAdlw9yRMLhYp1T0nA/48PA7avx00oDpasDZp/
	/CN6a6RHg/3zAZzeR0M5yKnuDZcIoEv5kUSM/aAMNWGkrpLp32DWiv/E6yEGNHOySl1gIT3W9E5
	zbBL+654YQja+/lDKufkGs0LzYSmj8ta4lriyecBmWyYlFb849o6bM5DBdd6BQcHp0z6tuZ++b2
	FkcHoi8M49DFKAKlJS88VfsW6R1Q8LMdV6k/AyS1TstpL2Mim4Z5N1GBv9JVnElDPuUYtEFLeq5
	dCGTjCAjZfSITroyNG2UPcKVP6MS/X/+shNtA5qQHIin2utfGSTwPaLRoRPP0j76HcNfDKVWom/
	/EtsiGobjOb3fjphL1m066GYkk9Qd2IUB7emV/3k815jUZBbb2Mk/wSMwp+QEKZH7xbiMWh1xZ5
	KL7LnHZwUWq9GPzumoRkVHaIg=
X-Google-Smtp-Source: AGHT+IG1588JLX9n/mrcJONjphkf0PaBzfG2vDMVWwE1Mk7qujpOAGNKcT6kvgskME8jAvrMSdrt3g==
X-Received: by 2002:a05:6a00:f98:b0:7e8:43f5:bd4b with SMTP id d2e1a72fcca58-7f6697994f1mr1950856b3a.55.1765540675236;
        Fri, 12 Dec 2025 03:57:55 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c27771b3sm5163198b3a.27.2025.12.12.03.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 03:57:54 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 03/15] python3-rich-argparse: upgrade 1.7.1 -> 1.7.2
Date: Fri, 12 Dec 2025 17:27:32 +0530
Message-ID: <20251212115744.569676-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
References: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 11:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122603

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix colors overlapping with Python 3.14.0+ which enabled colors by default in the help formatter.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 18aaa7d8a6f326c13d3963ac7501ce54aaa066e0)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...n3-rich-argparse_1.7.1.bb => python3-rich-argparse_1.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rich-argparse_1.7.1.bb => python3-rich-argparse_1.7.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-rich-argparse_1.7.1.bb b/meta-python/recipes-devtools/python/python3-rich-argparse_1.7.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-rich-argparse_1.7.1.bb
rename to meta-python/recipes-devtools/python/python3-rich-argparse_1.7.2.bb
index 8228a509a3..1d0d6ecba5 100644
--- a/meta-python/recipes-devtools/python/python3-rich-argparse_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-rich-argparse_1.7.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=06f5c372171ce02f7e6a18f5f57f0b69"
 PYPI_PACKAGE = "rich_argparse"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "d7a493cde94043e41ea68fb43a74405fa178de981bf7b800f7a3bd02ac5c27be"
+SRC_URI[sha256sum] = "64fd2e948fc96e8a1a06e0e72c111c2ce7f3af74126d75c0f5f63926e7289cd1"
 
 inherit pypi python_hatchling
 

