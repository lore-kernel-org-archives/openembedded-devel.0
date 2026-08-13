Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BE5C5DF6A
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:59 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27799.1786651791486055490
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=edYLKm6A;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso267111a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651791; x=1787256591; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pf38zQrAMDwGyAt5YbouDEI4Df61y+Gk9RqmtX0SDBo=;
        b=edYLKm6A+c+3UkuJwD0jtYduRQkJzwDxc+9pwoLwYqNY8L2mvdqVsgXZCSflHPimb0
         Ne4beedHdenGFsAS46oIw39k5C3+f1VuYxu277akTjdFI+CN8W+saBakD9ijd+9m03O9
         oimiIyblxYrIq6VyfEzdFIO6pbqmzeMB6sPoyP/Zf+yK2pjB2Hw4BLWTwV1jmngzv2H0
         yH/twUXp3r+WXttLmbUtGTmUpncQ/ciIDJjsUFDc5p5ir/+gL5QkQA0yHwHPrWBPn8xn
         GUhogCW3GSvPDX+Q+mAu2KqdZqs94k5E+WUpPBhnbuto+w5vHjdPaM6LjbEA5LB4K0XE
         xRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651791; x=1787256591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pf38zQrAMDwGyAt5YbouDEI4Df61y+Gk9RqmtX0SDBo=;
        b=T8JHYjrCE0C65nnTCO5jkgVglIZv1hhLjSOxCHQjuJUQTysnbWzmnQTEL79QU1Ez4H
         gU4otHPNUwFEQkllABrxawVlwJQptkFUdTsc0k6j2yUss5QI0x8QSL6Ui4rYb+Tt816s
         nhRienjSBZ5QNz7zBA1U3M/knCQ97s0zRejxVw17Fv3Niw5YSxumknunIAj24M7MPPYQ
         CqIAsLZuSz+53xyy02nWl/5Jvi8oQLyZPDqCbQnb8tf/5NkC8nd2TBhRE3DOH23kQ04D
         Ojm9swETkvLSJPx2A+AlfRbyT0FIMqVjeQHqcwiIECdNGNDnf/FxGLaDWJ8liCvkg2ne
         lidw==
X-Gm-Message-State: AOJu0Yx4V2wbXcooD2vko+PEiYREaV8wJdi+JiRA0BZ6etLY7dLTFmFH
	DEQ+W3nIpzQEBFGJt0IaEr+cZcm4TjL5FMtvKK3jVsF8J1ZqhgC9o93JTg9bsy9p
X-Gm-Gg: AR+sD10t2A3ZiIelAEHvq+IT7UVw/ZNCNvedOQvXwoTHB2x7JS7/l1B6qpKMpvx6AHU
	JF3FjqXVdP/hr5ie6yLX+mE6tgj8LvDEIwEdc7KNIMHwnKt7F7INlfbr9DV/QgZ1UZvVraO29eh
	J8woiMU9LcURMRVlmxJxXRaSgdlFfIV2Sh9kXHJqZZlIejwXcmRHeE6wmBxMDqZ20BxfcsuhSs8
	mnlHiBLnHpJ8aMs7Lw3cn4fVepurBKCKiGrSiSiarteliwR1eG7pU+Nymy7tTTyyYRyl4aJGTUY
	62DDDcJwzXz/VXB3NAlD+EdU2hOI5IPoPC7OG2Xipu4+dq52jY3q+b3XQIVIYMhV37TG7Xj1rFK
	12Z5cX/VuStLaS4FbNnGqOzuDCAREW1ZjoPZHIOUFLdBYiGfxYoJW9s2BZvIrjjCKIOxaRcCTws
	2O5ce7fdUHulMRxJsuhqn/YXQ1bgm+bsPKww+CeuXAwrZjVwPhmykGk2Caa/gjrRL5xC6coRIrt
	tMILOmHO/s54+8krkAlOtW+fMWW9QngAM3VnwRuOZSMxXqTcFTaGFqYr4AxDT+olgPSCQeiuZB5
	T4s6AEjwMMEmpPmLqaf6xzXa4xQEZftAS/GMeBiV3S05toO+xA+17rDhlYINCV6enjO/DC4RsqA
	hf8surrLp/K05vIyrcXc5EDyes3LGF8uY66tRpaK1KGTZ/K3YTUB/AXzB
X-Received: by 2002:a05:6a20:7349:b0:3b4:8bc6:138 with SMTP id adf61e73a8af0-3cc71c61e24mr329981637.23.1786651790659;
        Thu, 13 Aug 2026 13:09:50 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 40/80] python3-lz4: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:54 -0700
Message-ID: <20260813200834.1302829-40-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128984

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
 meta-python/recipes-devtools/python/python3-lz4_4.4.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-lz4_4.4.5.bb b/meta-python/recipes-devtools/python/python3-lz4_4.4.5.bb
index e14d722861..34f0812f77 100644
--- a/meta-python/recipes-devtools/python/python3-lz4_4.4.5.bb
+++ b/meta-python/recipes-devtools/python/python3-lz4_4.4.5.bb
@@ -13,6 +13,8 @@ SRC_URI[sha256sum] = "5f0b9e53c1e82e88c10d7c180069363980136b9d7a8306c4dca4f760d6
 
 inherit pkgconfig pypi python_setuptools_build_meta ptest-python-pytest
 
+DEPENDS += "python3-wheel-native"
+
 RDEPENDS:${PN}-ptest += "\
     python3-coverage \
     python3-pytest-cov \

