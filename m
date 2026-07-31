Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF85C5516D
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 10:04:41 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3364.1785492278692556648
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2026 03:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tDDkiYkN;
 spf=pass (domain: konsulko.com, ip: 209.85.221.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so597015f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 03:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785492277; x=1786097077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kKGztYBRRKI5tb2DcK42OfuNWELZRxmTS95P8Vz4XCU=;
        b=tDDkiYkNoGc8lwQR+nEccLJ8+nQI1V4Xu04GMY1ri33CqZuuwHS76IQNbVkzl5OiNq
         hXfaPsuU6FD2fEfFzR0r85d2PQdheaWeFTq3D+8JHCsDPDfYSMzZFRbpPQfE+Gkq82FK
         lzWIhsNP8cytceNHK75SznW8oJ+c/v6gn5Scc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785492277; x=1786097077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kKGztYBRRKI5tb2DcK42OfuNWELZRxmTS95P8Vz4XCU=;
        b=F4kNve16oUCLTLHb5QjIHlFVzS0kYBBoqWzETKedkOuRBbZXHt38JpuUTAGxzJaHO2
         mLyy5d3peGgDgnFMD4wx/ebNnfPZXH67s9dTGBkY4eSVWCo7tQ9id10I5322iPxHlxxk
         yKqkWN7Uc57abzL0YN8Tg1R6KG1zoNHHJiW1oNLWTIRqpTUpmP3BEYpgHCz9uksEIiap
         085rPUhOmOKCRQ5lcXDcl0LudL2TrPlbKgNpjeS5pjltxo0vwf5bds4imw54zW2xWE+j
         LsiQaABc9yCqgyP7Dyqtkjg3VVdutSvRDltvxrvDqLaoauWxQLnh70FtJPhKjjvZIDqH
         Jj4g==
X-Gm-Message-State: AOJu0YyVu+kLhpHSzIMQCwtSIihPLyJqMq9dWMULQM+Vz/XfHLwzJjC3
	Qv2XDqcuI/DpwCNUPRI7utafu6NQZkXQKfV/NBIpvP13xQ7ffwSmgac9DHPB6VOCQfUHLZ73zO0
	AMCXF
X-Gm-Gg: AR+sD11MXD10ej1SuHQDWY3k+r2FYpibTeFrAs4Mv4QK+d71ICnMnyRlejPWJqdOnlh
	++YWhBm8Psm5lAbnFrnjkDth/QS8hDsgUM82p4d+TjaOQDRvEw+pI/78fTMReBSWA5KTtx31DFw
	lZjfOBMXOaxsNcs7bUaa2TBouY3n57nO3xWS//u9piahnYKHX3sDxeVrMkm0B2sjLEOgJLaoi8e
	Mq1Pp3196yYn+puVvWJypyb2MZv8lif1U9Wn6txJNB8/vl7+pVgb4sM4HbYyuwcwBTEmbOvBF3p
	76ecCBAFechW8HFHCw0gqxL5J15Me70eIJyvrenxigV/VCDH0QA6Cy41kcIgO+qHvxL5xiJiRaD
	x+c42+XcH+LnqDmtLyzE9+81SgrM+nU7LUHigc2f1exek4pDPCli4aZOGUU+P6MqcOGf4wYMjPk
	JF9HenFE2Nt6A2TprLHOeMC1vFtGT8naL4wYLbkEtL1Q7CuyeeOl838Mpr6/PmI6O14yiPFTxi0
	7+V11/S5mkxvyqWyffvpL0aiF/8GjqPV0rWClMfbWmSXKrQf/cEMELrymKo5oIkjFhVhf6RqHPl
	nSjjIkZAyREnDDgoBURDgonk3A==
X-Received: by 2002:a05:6000:471c:b0:47f:9283:1fb3 with SMTP id ffacd0b85a97d-47fd2a428aamr3207139f8f.0.1785492276812;
        Fri, 31 Jul 2026 03:04:36 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e296csm3119808f8f.12.2026.07.31.03.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:04:36 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-fastapi: Upgrade 0.140.0 -> 0.141.1
Date: Fri, 31 Jul 2026 13:04:30 +0300
Message-ID: <20260731100430.3141022-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260731100430.3141022-1-leon.anavi@konsulko.com>
References: <20260731100430.3141022-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 10:04:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128583

Upgrade to release 0.141.1:

- Fix support for background tasks and headers from dependencies in
  app.frontend().
- Document FASTAPI_ENV in FastAPI CLI guide.

Add DESCRIPTION and SUMMARY variables.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-fastapi_0.140.0.bb => python3-fastapi_0.141.1.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-fastapi_0.140.0.bb => python3-fastapi_0.141.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.140.0.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.141.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-fastapi_0.140.0.bb
rename to meta-python/recipes-devtools/python/python3-fastapi_0.141.1.bb
index b8129fe817..d26a0ff070 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi_0.140.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.141.1.bb
@@ -1,9 +1,10 @@
-
+SUMMARY = "FastAPI framework"
+DESCRIPTION = "FastAPI framework, high performance, easy to learn, fast to code, ready for production"
 HOMEPAGE = "https://fastapi.tiangolo.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=95792ff3fe8e11aa49ceb247e66e4810"
 
-SRC_URI[sha256sum] = "f338951b82fd74ca8f843163aec43ea1a1ce84d515415a50fa98fa25572a5544"
+SRC_URI[sha256sum] = "e8822fc40db1e1858054d7a949a888695bc9bdce70139178e33bd2871a453ca1"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.47.3


