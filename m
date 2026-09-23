Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46AE4C982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:42:28 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4189.1790160141672098366
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MD/u0NIp;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-86ec25cf7ecso1427458b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160141; x=1790764941; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WaKaJ33yZWmu4mwV7pgg8TioTuYh2MY89vZi4i75kJI=;
        b=MD/u0NIpCuZQGPxrqPPlHOPjFnXYTBrr+6gpqTMg2WQnvXtHz70QD0XFBbFIv8zToS
         8cci3krJcwqR7x11TgL+s2nPQLzCiSqh+s5wufwEJUvmlxoiFMEI0QQK4dooKF2Dssc/
         FO2DIL8FN7BkFXgZ1QbdJNoIglGdlHgHh142h2Ky4j1pmMUsKp0a6J9Z/68RZ44d1QFn
         mW78t9yz+6KSA4Xp4FD5dcK+SzROCM+CwtEGkzJIm94TM0FuFNt9f0NeU2suhKISPk42
         ky0d8OLRVJsmbZli3sdbAbCP03cnB/r6Stb9TCPx3kefHseOXrgZtySxslv3MpnTLulx
         GHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160141; x=1790764941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WaKaJ33yZWmu4mwV7pgg8TioTuYh2MY89vZi4i75kJI=;
        b=soK1ilzkE5wMqK4JUlmoBhPHoghjNk5iQSAVTafl7EXL+bVUHyb1gjMheicm8YbqDm
         SUDVjTEzdF4YDB3gD7ufk26EG0uJV+ak/tpeb95dUb7k6Wx4bQLyjbwIL1RyPPuOB57g
         lS40MONCzUntjhCgpBu+0c+Aymj/xX18Dr71LWAurwIGYQLyi+jjNI4a935/4pq1sVPf
         8hacp741ADf/ZkOI3IcrTwD7rZS8hI56wSBBU+9tkCqIyqdWaHZIn9ctresDtpyJu8wD
         7FgiYU+fuIX/SeTD6fDXuwrZNeVw3XYfXJ7p6cTW4PaQ4fiuEpdJBBqBaIdKV5i8gbuD
         lvYA==
X-Gm-Message-State: AFuF++ksrYZHNApqN7o/BxvPTvsgCx6zua/odtlxRmr/XxC35AD/CTBg
	MKf4jUAtJKcKHwzy4ETGz36NjGIB4FqC9APq9+U5pCg7nHDLyAe89aDHOzO9sw==
X-Gm-Gg: AYBFou0GhqaP0mrqPpAgm9c7S6hbBVNnYHdcDf/LJ/Neicf7PDOmqhGiViHETaEvDak
	/jIdy8rSN4rPdgTub2uo38XoqLZQ33QMBmA9tRdODZRS4OWSQR5CqAyo10GWDhFOQn5EIbf+kED
	spK/er//64G7Pyq677/r/2wmZIb6mglhN/RpKIwJubERHBISi/ST4RhUUZDLsVO069vKgPnLw71
	DUNvxyX/u3DZZgn/TwwCVVtuNLRTFmJ1Ize8nMOht/WiIh4CVQ5qiGA3RK4dPPA1JD66aNrMbTk
	NCmvnAwT1s5OOdUckaUkdsX8qG0oCx55rCw9JSwOIcpO3DgVvJdgLM4N5vc3YGQi/P5KOT8vTCo
	bRwqhVfI4++MOyz3HdoALunAjeD1ZFZN1N8Y+AV6IBqbZ3JheuFtUseCU1zJcOIUXC/l3s+RIFF
	J0ts06mj5u5O5hCJ5KBueYfTM9szJlFvl29fnLjoavX+IURXK+YpmElHBlx3L3OgDfjdjPm7QIB
	LYAnCIO82sXHFRQCWOsqLc=
X-Received: by 2002:a05:6a00:f95:b0:877:ce59:bd6 with SMTP id d2e1a72fcca58-87c822aa47emr2716040b3a.1.1790160140972;
        Wed, 23 Sep 2026 03:42:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:42:20 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 37/42] python3-aiohttp: correct CVE_PRODUCT mapping
Date: Wed, 23 Sep 2026 22:40:51 +1200
Message-ID: <20260923104056.457360-37-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130224

From: Devansh Patel <devanshp@cisco.com>

The current "aiohttp" mapping emits the wildcard-vendor *:aiohttp CPE
instead of the exact NVD identity for the packaged aio-libs/aiohttp
source.

Use "aiohttp:aiohttp", which is both an NVD dictionary CPE and an NVD
configuration identity. CNA affected data uses "aio-libs:aiohttp" and
remains covered by scanner aliases. With sbom-cve-check 1.3.3 and the
pinned 2026-08-12 data, the generated identity changes but the current
CVE report does not.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 33d7be43195b58c66f6ef32d1f4837af085b37ac)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index b9d08ac97b..67dd8a1e40 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -19,7 +19,7 @@ SRC_URI += " \
     file://CVE-2026-54280.patch \
 "
 
-CVE_PRODUCT = "aiohttp"
+CVE_PRODUCT = "aiohttp:aiohttp"
 CVE_STATUS_GROUPS = "CVE_AIOHTTP_FIX_3_13_4"
 CVE_AIOHTTP_FIX_3_13_4[status] = "fixed-version: fixed in 3.13.4"
 CVE_AIOHTTP_FIX_3_13_4 = "CVE-2026-22815 CVE-2026-34513 CVE-2026-34514 \

