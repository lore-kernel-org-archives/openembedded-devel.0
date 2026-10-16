Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F8E8CC6B2D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 04:07:45 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14621.1792123663128515080
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 21:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tI7xQmOh;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e977109392so5445705ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 21:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123662; x=1792728462; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5QHY66jvB5jrYo2xTrNfO/OYVIzmEvN1FgTBPOnmHGw=;
        b=tI7xQmOhooTBcxCSDEEv4nvIaMtpJCVuPvjpCDmi5QuZkfpTFYVZ59eHHuV8bXr+rT
         GPWbyukvJ20JzvFC62wvq8vOIHGgBZrvsU4PVu9Wa4HjNeZIA2vn2GVqJ9nFXLGm2lVo
         gb6Y+Z9/S99B8oMcPYgzw5ANx9vYdJeSfYPa047EgcIzIti8HzNPXvFRRaXCtcZwPock
         zK1UOHE7AsKm7ALuZk0v0RGCbBELyf4TwlqUfp7KHjT/EZfhQjHiJUVtXk2ZzqdAkSeX
         YrGfZvdh3om2taFUqbzoct3wYDSM3tLLuVf7qxHr3VP/k/ziUdCZZsrbHIR4rWeYdmZV
         N6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123662; x=1792728462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5QHY66jvB5jrYo2xTrNfO/OYVIzmEvN1FgTBPOnmHGw=;
        b=NuH4vlhi3JxQBFwrV3MOh8HdzJz99Rsk2+aGihKpw+UArBbogtnuLyisk9C8SAtSJu
         IE7x/RQML7IVxkzJ/G0rQDS/G7/3rGXkkhHVbAx2Y+505BtEZbvum16nPU5pEOnrFHaF
         GX8Tt1YXv6Qr+Ra5C+wdY0jnQ+8au2KMO6qiLAbnb+BciMtd1IVjm39GzLQvB5rFS7Ck
         oWCeGv4gUe1bp6CvkdeH2IGBbsSRAtPX8Hm4JWu+htLgPCWq4JM88Y4mm/7keV4jYDa/
         El841CMkJWW7X6XzndNZjT965uT6L3xCh8Qvkz1xGLl6to2cH2BTLhioXczVc9qeJeDJ
         zGSg==
X-Gm-Message-State: AFq9FYIHDFoLpG+GmFBjyI3+mIc6Ck+k62g39fGNrGxPt0xXdhhc5cgX
	5hdcR4uaDAvFG4pcFW8c9bxrS0vSWQsfRaBXTumiARwY0BgmB14QAOz/TdGpNg==
X-Gm-Gg: AYBFou0ssSVrsZm5vpZaTGiGX8NekKgy/Y9KXFmGtcIpDREZDHDRrRmwMwMBeLC1EN6
	ohDoBH1UntiShc67Gw0oX9aJ7UcKoMTcMISeyx1DGUXWBAGpVsBtFeN6H9CY5FemuOmOvmh0FHB
	/wLACmoKl03t/8jr/9o9K+bmI1PjnNaIxzV/nYJAhexpitT5HgG4kXsPSdd1ZLq69eDLyfs7DP/
	XH09cd8bkieqcqucvpMouUP5FKHDwpBRzEv7/V1iNSeneSI2t20s3ZcJoPDNByz3NeKztGskbTR
	CTKINTArnzE1b1B0/95oDOz5D2uSvudLwML99HlcJPNUHJItVTkXYJzSM+8wqczNolgcCPaPYit
	/gpAOiOy0uvXGbb+E2KfVGfz2y461I5LvBZ2YkJlakiSmiov11y81Gxuho6zj0/oz+1eOjDfwh8
	3mpN6nVpb+WC/YsSABgyg9rC5Qq4SmoeZBPMmn89UjXZ+hjOCDxZa1Fa2zCGWkrMYxoWDA2JO8q
	94gBtDTRfc4krpFZ22/SMHxBXvsrkRHoCX6Wlo=
X-Received: by 2002:a17:903:1a0e:b0:2e5:54b9:6b5c with SMTP id d9443c01a7336-2e842ab9b86mr165902455ad.20.1792123662369;
        Thu, 15 Oct 2026 21:07:42 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e83498csm3796335ad.35.2026.10.15.21.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:07:41 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 1/10] python3-aiohttp: upgrade 3.14.4 -> 3.14.5
Date: Fri, 16 Oct 2026 17:07:25 +1300
Message-ID: <20261016040734.1499287-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 04:07:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131037

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/aio-libs/aiohttp/releases/tag/v3.14.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-aiohttp_3.14.4.bb => python3-aiohttp_3.14.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.14.4.bb => python3-aiohttp_3.14.5.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.14.4.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.14.5.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.14.4.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.14.5.bb
index 6deb5b04be..8bcf22b9ee 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.14.4.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.14.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b5e9e27554f71f0f132919037cb967b2"
 
-SRC_URI[sha256sum] = "831fc5bd39ec2517851e348f613ddb5447a47cf4b71cb09845af7ad7ed45d8f9"
+SRC_URI[sha256sum] = "5558a7f5a05af9ecf744af91e5baefc436f93c9333e656c27ec253f9a6bbe178"
 
 CVE_PRODUCT = "aiohttp:aiohttp"
 CVE_STATUS_GROUPS = "CVE_AIOHTTP_FIX_3_13_4"

