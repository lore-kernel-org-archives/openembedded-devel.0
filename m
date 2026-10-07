Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00466CA5FFF
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 11:08:23 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6890.1791371292881449716
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2026 04:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SGZnQoG3;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3a4a7eb86a4so1310587a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 04:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371292; x=1791976092; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Ruc1uYvxprRSvio1OcloTVAo72Ds1G5mnadOK7vLQU=;
        b=SGZnQoG3t1h/YCtPDkESYV7SK3UJswyuFPesiTiDU1Y9ASgXkjpNxq/+q7DMngN6ao
         0hIOmwETU8bfbNXJQ5Z6lA60s6ElB+NBDUIOF2lH1qcf2vS5NRlW23bBMLOoLK+DxhSY
         NLBm4YY8CUsdzIRYHxb9VFWai1lBG6TvkWY7KJXMqFMxo6bGJ2tOZEfONLXxSTecln7j
         YQ0rGMRfdgQwnCCNPqUqi52dqc/fewGrllEIs5lfR4emI775426qFYveM4OpFtnvXbfv
         U4bF86h9rVDghI4k5HaO3Mj6myi4eVuo7pnrHYx/EjyvPXJOVjzO4V1aWoo0CC6g8rdA
         PU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371292; x=1791976092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Ruc1uYvxprRSvio1OcloTVAo72Ds1G5mnadOK7vLQU=;
        b=TaFePEKg9ITJnhZ8lj2KJPHWrVvK763zFrh7kW8eTIVVtCmPTz5wZ02VNlT9zhy0Nf
         n9eMyg+GJZw0OMlUdqpkCndwa1ZrLxUei+rJT6te3nIQL5uidGW2ImsGTnhxJe1MQ/so
         mpYkktiPNYf1q1lT3mSTjRXZfw8yIPi98f3HCd52aeRlSWP2PiLPdJOPEMdQRbsRSZUp
         nuwNXOwGII6WmQJmhqhNDXWo/zbmO21Cp6Eg/9DupFDYK6U2mC05sXG3rL4ykSWyeZsB
         snvNhxpCINqNPLKM6kwN2Hlp81wv5GKmzPixRJatjukAe/V6RiqwoSUz1LjLRWKHLhea
         EWlw==
X-Gm-Message-State: AFq9FYIozosFqwy9TmumK94JQm7XT/dr/xCR8Zw2bdQzNrYws9ddNMib
	t3uWQIPGGxGl9OtLQlP97ZY+R8FNNe89lRz1mYgk8Ezb4eqEv67ii3KSxv5EjZQ/
X-Gm-Gg: AYBFou0VQtVzDSwHvjJyj0qajECrLUqqZSpTzpGrzXA2XQY0uaHXipIC7jAC6hXwEU9
	JfcxdHneC8453558BUfK0MxKBRcjBWgil54Qnll3U39jtn1bweuUnwe0ZIBiNk2JnCdJ7vBOWVF
	6N7mcBU0xwoKyQMIPWkr8Rne5dh0utBg763HS0Tlybrt27xSPAYxZyAIW813SFE2JvDLOG/Lw2v
	iMGPIAKVRKNpcSbCtghNtt584DrVJGYdQ1wav1kioihFWH+wI02kQhBYi7WQeAa+34a/4GcYo+a
	3oliLiAYsqLEnEEuzYmGsLMxR9il3aDz6y+94O/78ECY2087Ig1fDfLYAe0FZ9cilvmpfXwB3rV
	h5m4CvaAyA9AVRmENLp+bJOy4wfW9DZi70Fbf7nsiYA0O7uF2sTP+r5pHVfrw7xUZOfglL8dDwh
	n6qahNKEFCRaM6/5kw21t09LKuGuAOcssTHnP9YfUTPew9OEDIvJnolVac1X6nbEyxeODcMkolA
	42F1Z01K4fSobxevDFf0Dg=
X-Received: by 2002:a17:90b:2584:b0:39e:3713:c2e4 with SMTP id 98e67ed59e1d1-3a8a192b868mr1480497a91.14.1791371292160;
        Wed, 07 Oct 2026 04:08:12 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm10862177a91.2.2026.10.07.04.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:08:11 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 8/15] python3-aiohttp: upgrade 3.14.3 -> 3.14.4
Date: Thu,  8 Oct 2026 00:07:33 +1300
Message-ID: <20261007110740.3179543-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
References: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 11:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130650

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Refer to changelog for removals and backward incompatible breaking changes.

Changelog:
https://github.com/aio-libs/aiohttp/releases/tag/v3.14.4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-aiohttp_3.14.3.bb => python3-aiohttp_3.14.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.14.3.bb => python3-aiohttp_3.14.4.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.14.4.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.14.4.bb
index b862076869..6deb5b04be 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.14.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b5e9e27554f71f0f132919037cb967b2"
 
-SRC_URI[sha256sum] = "9491196535a88924a60afd5b5f434b5b203b6cc616250878dbdb223a8f7844bc"
+SRC_URI[sha256sum] = "831fc5bd39ec2517851e348f613ddb5447a47cf4b71cb09845af7ad7ed45d8f9"
 
 CVE_PRODUCT = "aiohttp:aiohttp"
 CVE_STATUS_GROUPS = "CVE_AIOHTTP_FIX_3_13_4"

