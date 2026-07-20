Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7479CC44524
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:39:32 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11289.1784590766519352302
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rec9LlJo;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ceb096e675so106183775ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590766; x=1785195566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KsauERNC5NMQIkCuRUZkCAvov+qc2X+ju/yW4+CKn1A=;
        b=rec9LlJodmPP9LBB7flID1LgiVq7efLSqh5zlpN1px1gURAU1bhume2Naw2o4ziurY
         fvhvgDhTE9SSZbzGl1jH3Dj4ZnuiZ8nh7RzHRCFGlhFVEkGciW7EnqrvnRLMK/6x1P1W
         UrNlblNcI+70M76MpNp4yueBOL3kxkPz0QwpHs788KtMxv08p1eOjJGPm6o+xSuLgMVq
         Td1UGOlFneqAuhH6T1aa80KoAUWY02+LGnEZmiwD5cUEiqeRH5ZkuGiCrS+yeSsGYOKW
         diDOTVoaQGvh6iKfiHEo6WjCCS/Xj/4Xl6hhWNBguavB7HMN/X7zQyBP2xOUSufxZO1Y
         h0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590766; x=1785195566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KsauERNC5NMQIkCuRUZkCAvov+qc2X+ju/yW4+CKn1A=;
        b=nXfP8nY3wdpjHePF4eVkgHjLx2E3VYJLXQYcRoJxLa3EKzLrIct4Hx/WFGn6BqNkn/
         EOXXfDCovLN+lmP45dKomkQP4hLGJLbnlFx3Ri8TiLQyuQy3q2hwvzqOAan0XCTwdpwZ
         6XNKgmvycXlyTUMWhkiotH1CAj2grQkxV1pdJceYzTvFzpBaWeh1CK3zhWPUbgVS2dVQ
         /NKM6FElNDsKzfSg1bx1RrcX4JPZeKW2WvQiJ+QUjtxcKlzlPzq3Kl/w4nenbugdqghJ
         l0c0hXRBjLb74hX/pTRXIzhvJaKkCy0lF8pRF4vI5cDhTTv1t9lh5lKoTfH5SMgaGs+N
         hDqw==
X-Gm-Message-State: AOJu0Ywdz31BA2u4nkePLJ9vAdYyW0BFdNlpXSVC2gjbPDdvCGzdn96+
	/R84eJrky5j916shlEoatZYz/7uIPlGadC9a/bxDMESEtoIlVpdahMXZTgMG3g==
X-Gm-Gg: AR+sD13UU7dMmCUdgcmwtQu2SRHX0RR12FFaqWBurxZ84YR26eXeDlSqc7Xw6K7kfoN
	Kk7AW3PStEMLeNsaUaO9xZcY0XznQ6moxEZV2bj/fUTUEqOVc/GiCIfoYV60ebYlRw85ZyvOsPM
	KO3aIKj34eUwSexbglb2PJmCGa3qcd9xaIgBVXlCF89SQZQcACrK3cIOd/phviS+MzofVNxptLs
	0SljFg5hdA+qsNNUI0dEqUGAQbbLcUF3Un7Y3l5Y5KBAiQkBEbtgrZwj+RFwmfKjD9Fe9/6Wvrc
	HN8m38aMSIQTPItXq8PdP5ejt7z9vIbi+z6MUP1G0nsHYyLKcrLNtakrxSop901Y8/oN/OOpAYS
	Oc4EMZCagVX02I0v3KoFm8kl5eDpgDiRW6NNj7zrClzrdeQVlvEoENrDfqQomWDieDLLsGYR5lN
	o0Iq/J64qK7XiVHuN8kI/zp6b+lA==
X-Received: by 2002:a17:903:19ec:b0:2c2:be43:39bc with SMTP id d9443c01a7336-2cf34964e80mr188036045ad.22.1784590765752;
        Mon, 20 Jul 2026 16:39:25 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:39:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 24/30] python3-tzdata: upgrade 2026.2 -> 2026.3
Date: Tue, 21 Jul 2026 11:38:05 +1200
Message-ID: <20260720233811.2324493-24-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:39:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128325

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit ea00a3bf35e6695581f7c1505a2a5f11ee6ff527)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-tzdata_2026.2.bb => python3-tzdata_2026.3.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tzdata_2026.2.bb => python3-tzdata_2026.3.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-tzdata_2026.2.bb b/meta-python/recipes-devtools/python/python3-tzdata_2026.3.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-tzdata_2026.2.bb
rename to meta-python/recipes-devtools/python/python3-tzdata_2026.3.bb
index 0a94aa59ff..3284b1bb51 100644
--- a/meta-python/recipes-devtools/python/python3-tzdata_2026.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tzdata_2026.3.bb
@@ -1,10 +1,11 @@
 SUMMARY = "Provider of IANA time zone data"
 HOMEPAGE = "https://github.com/python/tzdata"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fca9fd5c15a28eb874ba38577a585d48 \
-                    file://licenses/LICENSE_APACHE;md5=86d3f3a95c324c9479bd8986968f4327"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=804220b73c90950be376e7ff7b2066bb \
+                    file://licenses/LICENSE_APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
+                    "
 
-SRC_URI[sha256sum] = "9173fde7d80d9018e02a662e168e5a2d04f87c41ea174b139fbef642eda62d10"
+SRC_URI[sha256sum] = "4a1518b8993086a7982523e071643f3c0e5f213e75b21318e78bcabfff9d1415"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 

