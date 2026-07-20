Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C52A8C4452F
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:39:42 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11425.1784590778420595990
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MEe8iL0o;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2caed617615so118296145ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590778; x=1785195578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SiZg9Zn+HiGMEE/R/hS3aGRI/Ritx85FAtv9Ctt0EZ8=;
        b=MEe8iL0oARP4DeBfwdK1Ut/iJ7tny4I7yaFtpoYV4yZOhdS+Q+JHx2nkQWb0QmSMOv
         OC8yv7NGhomv0vdhVPQiN277IytKx1JjC4AouaHapx9+y73eu5AtXpr1VHw2T2PX+5cs
         NaSK4ITDCIC6lWD/5l7wsV5VmefSy2ItrnGwcofmtG9zOooe1K4xwsQd9NhRdxsSBtGN
         9fZnR/pkcoxWGQT3vk+Ssm0n6TWIQ3BObMPAHIxULsgaAmNO/LdaWHJX10NSMybyodNR
         cD8SCaSms+gZhDd/xDdK9JAXC5eNMNqPdxnqh+kPXUoXtnV3fVvfqJyRwqta9C91RIc7
         5QTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590778; x=1785195578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SiZg9Zn+HiGMEE/R/hS3aGRI/Ritx85FAtv9Ctt0EZ8=;
        b=cHST4XtIvCJsZAEYuCfOgmu/+qrjMMeBpTucq5IztiNrEI7+YBItHNs3imC/D3iP1p
         XNSJRibncpJA55J/aPtNJZL5c0cC56xlq6uFjkrZugxUEqVgNEqFN07P827SUEOHBiNP
         6Oo7boxs/YH4MW9ToPdup8sBKhIZkG4ueLZJ90th5O2CdT3qZCjoigJPXKmUVkmWZdCI
         dgldM+VzRcovoDlQXAJJM1YYDPJwPJSlzPvLDGV5JrBhzstMRpDIqeUz23sAhvljPV8a
         l/r9QVOT/5yCA0Dc022lCIbQJB7LCUnFRSPN9aEMWvgg0ejhnw1WK9mcrug88ejKv7bJ
         6ykQ==
X-Gm-Message-State: AOJu0Yz1/Fdrt4Pq1eshY+IYxFFjsRBHh6xg6ViWneXwvPWhkF2aCgS7
	qf1oQYcDFLtxHqIcTduz4g0Jp7Wc02xWboT2AviYKEGc8rLyyqJEnHwaiJSEYg==
X-Gm-Gg: AfdE7cmFiliG2b4FyCsKuTXuRss1BxpT93qVPEGltDTyx+kXX+1cv18OzdbFRcw3Oz5
	RNxeL9Z7JziMdvE7KKvgAmpq+fVEFnDvM62sxxYGnbLX64uUNLJyM9k3cT8v5YSj61MPh3fbtNF
	Sybzok1srRiak015ZPHFb1QEmA27CIotZLXxXCiHejbao+lvAfKyKOcmh/F770Qq+7sGnW3FXFx
	W/7IlZV9z1MToASBJ18+dCZtTSWbfoW2/5thkNElqdTwqNJtgl6QyHXMP+yTAo40OKDNIsF18hR
	JlmoP7MNGDrjd7LP+WjH2uUDVkTIZ1PcyeqwN50o6ujgiospcMWu/qVKVr1+rjg+kQ4iOQgzQDH
	8Nie/xYgPib3lO45mArZ/OZhyhELH3NcyCVb1PiDIGDBliyLoUGAUSMcreW3EJK89+YnoknSa/W
	dtRfiQm2YCiFaOCT8=
X-Received: by 2002:a05:6a20:a103:b0:3c3:87e1:2637 with SMTP id adf61e73a8af0-3c3ad7abaefmr17379313637.22.1784590777780;
        Mon, 20 Jul 2026 16:39:37 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:39:37 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 29/30] python3-django: upgrade 6.0.6 -> 6.0.7
Date: Tue, 21 Jul 2026 11:38:10 +1200
Message-ID: <20260720233811.2324493-29-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128330

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://docs.djangoproject.com/en/dev/releases/6.0.7/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-django_6.0.6.bb => python3-django_6.0.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_6.0.6.bb => python3-django_6.0.7.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-django_6.0.6.bb b/meta-python/recipes-devtools/python/python3-django_6.0.7.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-django_6.0.6.bb
rename to meta-python/recipes-devtools/python/python3-django_6.0.7.bb
index a96a6dbf53..4542485154 100644
--- a/meta-python/recipes-devtools/python/python3-django_6.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-django_6.0.7.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "ad03916ba59523d781ae5c3f631960c23d69a9d9c43cecda52fc23b47e953713"
+SRC_URI[sha256sum] = "2998503fc083124fb58037084bfa00de323c7c743f05f1b4284e77bff0ab8890"
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 6.x branch,

