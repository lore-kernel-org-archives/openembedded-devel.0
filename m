Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB402C5DF6A
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:40 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28157.1786651832417133779
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AR4UqYqx;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so296511a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651832; x=1787256632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JyPiQuISrIXaAWq1AhjhPBFd5goYEfIetrGEvt5xM5c=;
        b=AR4UqYqxMnJ9vSMyUta9WwLYI7zly5BLIdqgsy1Xk4387wVPD2LKLpx0zReG5MLq3k
         pc8+TAMAF6KjA0vT8C9531oL1NsaUmr8mvTssvDWx/w54/EovGCz7VV24nzhJ34V1Hae
         AwpeqHrdyWsnP7numHeav0GEQadiu9Ht+3Ir05Iv9rH61atLdFOFTd03GjwuDQ7DCpEQ
         plpfx8Z1Qpd4omdT4rv+luSjiE6SoQ7Z6wOGuw1KXVvg6CtavzTr762p1uX10WreTPRE
         ndHsLkvDY4tp4YbMRiNkDk6M/J/efURK/PInQrv33LKkijTzIHjqyHqa4O/x2VCgjTBi
         4L2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651832; x=1787256632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JyPiQuISrIXaAWq1AhjhPBFd5goYEfIetrGEvt5xM5c=;
        b=Tu0r3BH2cKoe0VndzqAcyqM3vQqLrTqlEJyUdkiloGVoiLbUnsDxlYTADqn/PxSR07
         RLwDz1/cGnagCp6OpSv3Tb38b5MG4bF6PNRrTgDrTVpDk/hcTUdAEPuFcFaurspzSFmG
         Kbd4KOl1SYA/qSfcr37kPPFBoTmgFq99gjMvph033dmCYkgPIYjtrsPZb0nn6DPnZZ3e
         9bCL8EfL5ORIzvNhMvUdoYaEqTc2eAvXPC8THEurY+YlD/+5wTGYL0+4X7Pew0Ncdgv2
         FDYW/V5wVaJ00rXeCk7PGlcHm4PN3JQSgUDqg2NRJFpmKROSdIS9MhNNwYzWaqVt5DOn
         1G9Q==
X-Gm-Message-State: AOJu0YyD827Cjfe1UqpO+09v+K97vg3oFxW2Ya4u5+lawQbWnYuQX5Sb
	J1BNmgvSZtGWk6Umpu62atK1ahDxrcXmyLCqgTQRgu2Osq23LdHrIj7QT1Z3dQ==
X-Gm-Gg: AR+sD12gNtpobl4m+ZjRGA9Favgi3YmGY0kBdakRSrkLwDGlihRy65M1j5inP4tt/Cv
	vMO5JhDHonlLgdWZidYYbLUzdOY1mKUGBdKGZHvyw0MNP727SLzf71c8v0SpPYr0o76CPMCTIpc
	lSirs8+Jy4KT0hoC7c7Salvp/QgUqAjqBrekVbq9h35qBSUydL3W7hctWQRziBHqAKfExQJ4Dxu
	4vSidKc+EzXgGTsBGMfYnCdBFmE8576rt84PTkjzLdBOCHoYb2YJbc6oulwLgUlcHNoURisjTAS
	frIc/gOeNLivRCb0yDAUEngVxSwTaYpheEx31BH/xDM4IxCj6fvT9EITAyUrS7GfpzOsMBrtABv
	a9IT6V9Xi09t71CtPMLj8vYxoJQJdTrprAUxxQ9GR5E7GugTdIiaA4ol2mZ6D0qMWXXVVqAHJHx
	v0toQZ7xTa8p3sSgzZ2GIjoNgW/ohtwC8gCAgQOBH7NjQrb0ywVl9TdeBV9VMinHgivPQhyLHJ/
	4PNLJ86sCGT4UQnxYLQ4Wp3dDEdxQCYsUG6np0UBjMRwho6v9/uQdCpbaa0RxCTyz4OauJPJ73q
	PUfKb90i7aVabPFo3OG1jHJL9SBzHPCF6wW0RU9N47OfeuCuS6jN5J3XVvjyFjIddR1sJZUZUVA
	s+pE/bbIA/G2XqR71078kR6dI+LXcNH88sj8eF3xRp3PRSw==
X-Received: by 2002:a17:90b:2541:b0:38d:eaec:4396 with SMTP id 98e67ed59e1d1-3933e5d2332mr466354a91.11.1786651831666;
        Thu, 13 Aug 2026 13:10:31 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 63/80] python3-responses: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:17 -0700
Message-ID: <20260813200834.1302829-63-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129007

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-responses_0.26.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-responses_0.26.2.bb b/meta-python/recipes-devtools/python/python3-responses_0.26.2.bb
index 2fd5c86f33..af0eb88b47 100644
--- a/meta-python/recipes-devtools/python/python3-responses_0.26.2.bb
+++ b/meta-python/recipes-devtools/python/python3-responses_0.26.2.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0e601511a8517f4daf688a8eb95be7a2"
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 SRC_URI[sha256sum] = "9c9259b46a8349197edebf43cfa68a87e1a2802ef503ff8b2fecbabc0b45afd8"
 
 RDEPENDS:${PN} += " \

