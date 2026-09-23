Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 468A3C98309
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:42:07 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4180.1790160126683214645
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dy6Jmm/w;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469a3490bso682597b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160126; x=1790764926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lwHEKeljfrIBlrpa6d4rv58MTJU9l5fI1un5MJYrJkQ=;
        b=dy6Jmm/wwvSaq4jfErRXqduvS+DwYNteR1m58q1fjhCZNqSEngaBX7OebIF7riejGi
         rZpRxMJUoIpioQ2/NWTXCYdFvdQszrigZGeFHJOlXJxMqU3gGpM3K38ZP1RYsuJWUZz2
         yA2+UAtvzNeep8KpVu4rMB68Z6L1QZFPNi5fVirUFcKJDJvJiYy733Usu6WFmsF7hB34
         WcHKSjvuR2lQT0Qdu0uFAnMjfEUhDHIpzuAIudJ+D2Oc+GR0fD5A1M4mg0ieShKNljsA
         BekwWvUR4EG4m/mxFzSR8NlG+/lxn8v1+AO2LvvGgZ//HTrXkXm53PtABbF6XznV1/yr
         auqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160126; x=1790764926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lwHEKeljfrIBlrpa6d4rv58MTJU9l5fI1un5MJYrJkQ=;
        b=wPl5Hvyz4WmP1uT4aNT+cteXUY0681pZ0KwTYxeK10FsqwyIeHNStX5y7OrVf3zec2
         6SUlZfoMzRLf5bZn20f+sELgOCHbFc4/J2cGAr+q6pDz0tMH3iL3tFHL/YwWQ82wTgBF
         /BNu12S42dFTDDvEXflOGltVjFCRfvevEBQo307EAEl/v5IqbI9hxpuDKruFP0icthNU
         V63B2wGkvD9w96aQDjA429y0dcigX8M27qIj56nB4OpIjbyDtxtyJbRN8tvirztA2IYE
         HV+ruTffvg2Ji5gkc4O3//7ipPK3F8+JFOR2CjwbVtcF7rDYB70EIKVYOvz4bJuMXdlK
         ICVQ==
X-Gm-Message-State: AFuF++k01Zhdfj/Z/DORq0dVz1LXNDsoawZDxd6jvzKvg1UmsBCQP6uR
	7bv4EGtmK4eESCgon5LX4cP5SY/ixO+5GOhz+5sM3HVDEEbKgUpm1Kb+eKBfTQ==
X-Gm-Gg: AYBFou3Jo1mcQV1+leLUjZ/RT23ZmcVxYiNFBR43RwaV0XZ2m4VxFAoxHoZUtPF5tKJ
	IBPgVyH8I7uva7H9RwtxWHbgJ1Ap4j551aGVgjkMSoTrYHYOsRqSk2zqubVZ3m1BC50+mVLvBXQ
	BFFu0iHsssZhH1QcqglasyVsgKcWrXOxXiaAWb23M5/bWsP/K+2XBfqMvxUhksYODu1xtriqZ+P
	O4n+KgdECzpiyWniU1Aml1fI7BdUq+kNM74niYIg6MJxbqoZ5Nid7BcFPCIPZ9o2H9uuU5kPDtS
	mF02v3ot70iz7WDaLsRCau8FseeTlJPk7deoOQQ6G37giN9+VS4XAaZDHiydx/UMgytxwvP2VIL
	ANH1mQcbDPvGTE8f2YynNjD+P9tmUt+poJgZTersPw5jJ+syLPuhdBSMNbX3tUX5NPueiJJLMGf
	8n7kIKXKMPOPZ6Msl6As7zgcAw/cPdOoQa9AIm3O9bDasUYvg2KhAJIBvTQ3203ph8aJuKJJ0hP
	dcoGpyzP6xIjOYevb8AU54=
X-Received: by 2002:a05:6a00:340a:b0:878:34d7:6983 with SMTP id d2e1a72fcca58-87d1c3b6320mr1831941b3a.49.1790160126043;
        Wed, 23 Sep 2026 03:42:06 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:42:05 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 31/42] python3-twisted: correct CVE_PRODUCT mapping
Date: Wed, 23 Sep 2026 22:40:45 +1200
Message-ID: <20260923104056.457360-31-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:42:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130218

From: Devansh Patel <devanshp@cisco.com>

The product-only "twisted" value emits a wildcard-vendor identity
instead of the active identity assigned to the packaged Twisted source.

Use "twisted:twisted" for its NVD dictionary CPE, NVD configuration,
and CNA affected-data identities. With sbom-cve-check 1.3.3 and the
pinned database snapshots, the generated product identity changes; the
current CVE report is unchanged.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 2aa82f4b3376cb6946d054bfc674dfa711c112f1)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb b/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
index 3b49f56093..9b40191964 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
@@ -16,7 +16,7 @@ SRC_URI += "file://CVE-2026-42304_p1.patch \
 
 SRC_URI[sha256sum] = "1deb272358cb6be1e3e8fc6f9c8b36f78eb0fa7c2233d2dbe11ec6fee04ea316"
 
-CVE_PRODUCT = "twisted"
+CVE_PRODUCT = "twisted:twisted"
 
 inherit pypi python_hatchling
 

