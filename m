Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E51A5FEE4E6
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 09:30:58 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.116287.1772271053609815394
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Feb 2026 01:30:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UvlrIaT8;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8274843810cso1349209b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 01:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772271053; x=1772875853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5CeMJUZ8GKLDAm/zvhxO3Z01SdK92rSwreXamtUkufU=;
        b=UvlrIaT8k7pR27BM13edLv2F+tSV6ByCjsGGE8aV8XBe2zYXiO9KGau6nXtXw2HeyW
         GBM+MeHMAybpQd9/4EZzykfykeoEHwcq7vgNdYAK7g6BFurm/aOjPJYGizBRMACGEhO+
         HFcKA6ReCeMftieSZGVEs6XX5qfEHT4OrFUCeFE+T7EIm6bunrMrp6v6wEx29FxUjR+9
         iaqcZOvyFhSqAfTV1Z4mmMB6ZQLGTyqvWcKuHO8FVhJ6EOGSwfjlaiqibVtILrQ/EqFC
         0/t2LrPx39pRyJhN4t7kADjO9GSV0T1jkHLmS+YRFLx3JZaN0yDoh31Dwn2H0hsO6LrS
         aNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772271053; x=1772875853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CeMJUZ8GKLDAm/zvhxO3Z01SdK92rSwreXamtUkufU=;
        b=WcKeDLkH24wlsN/zIEalThzJ61WmMR2raEH/WWvq2H+w7o1hF9zbElGxYBiVoWPArj
         7krJPebPuXIpyOIMDZZWkY8qXxF5wDj6KZfEv91jLFfJQSSDKq2tNcviSEApHxTAW3+6
         nFXpMoiDhwHgHbi4Z9XesRlSqJqbh3FVqpB47MZUBoO5Px249Oj/6cUcvaiMXvy2sQMm
         NIA+91TYonWvudyVStf4Dp53Ccdi/tVc4+FulSYMSJn1ZcmvF96xpYp15hsIfbrQ5P0d
         RafDgd0kpcc9/8VBBEihykLvPH0CSV8mJUAG9rRb8nrtN3LkgSjhiHOWDakk+O/ptasF
         QSEg==
X-Gm-Message-State: AOJu0Yw/UOYQndDWyms60zhnBthEQupL3Bm1s0uDrp7mw1sAqn9VRZ+8
	ThYxTwVmNxSGfRNNfS8mH5hqtVrRXgHPjBzrhhEohqbWoeJAFIUmKAcQqFoF7w==
X-Gm-Gg: ATEYQzwA4Nmsz3Xhaq8gM45A/m3PeElUyHtRNI2/AUGCMGaxUS92LNdIl7SW/l5MQT9
	Jc1VLfN3zgzoiMLDMwbJSaZChXO2YQi5IvryI3IYWtzsEQpNAcVmGy0EiphUQWUspfZgdOuloX9
	De3ZLYIehKsEZ1vRjjx9wvFB1gJ6sD4XVlh0aMqvcSc2lHTAeVDqTpXfazWAiuctLXuyPquwfNE
	ah4/uEGs/p5ExW4gZTqoFuR+oWyF9BAbMOywPV6B7FhzmOZLAQuWfkWaWF7dGFiRhSO/xkGX811
	UurrH/g5yilyDE213193hm8XfdDsadiv5HsNviU4xANV6zEIlkcc5qaBOE2SVRmp7dVHYxx4wAc
	2wY2n4leb1liLPU7JABiJ6thp4nKYup/R4ZFmr2cSU3WI/XsuE71qvVvenJWBSPD8+xHFsfSh7k
	quPqz9c83H08JSev4d8GIjsSEkIgAR7dzd/g==
X-Received: by 2002:a05:6a00:9517:b0:824:374a:1425 with SMTP id d2e1a72fcca58-8274da0b8a1mr5798127b3a.53.1772271052707;
        Sat, 28 Feb 2026 01:30:52 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d8cd91sm6875158b3a.23.2026.02.28.01.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 01:30:52 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 1/4] python3-filelock: upgrade 3.20.0 -> 3.20.1
Date: Sat, 28 Feb 2026 22:30:38 +1300
Message-ID: <20260228093041.816960-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124778

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 CVE-2025-68146: Fix TOCTOU symlink vulnerability in lock file creation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c2710a2df9bbafa9fabe87610f29864c56476b9d)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-filelock_3.20.0.bb => python3-filelock_3.20.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.20.0.bb => python3-filelock_3.20.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.20.0.bb b/meta-python/recipes-devtools/python/python3-filelock_3.20.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-filelock_3.20.0.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.20.1.bb
index 4ce89a853e..a499b79c07 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.20.0.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.20.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://py-filelock.readthedocs.io/"
 LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 
-SRC_URI[sha256sum] = "711e943b4ec6be42e1d4e6690b48dc175c822967466bb31c0c293f34334c13f4"
+SRC_URI[sha256sum] = "b8360948b351b80f420878d8516519a2204b07aefcdcfd24912a5d33127f188c"
 
 BBCLASSEXTEND = "native nativesdk"
 

