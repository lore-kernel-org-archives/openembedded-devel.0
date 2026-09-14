Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C7DC88E64
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 03:13:43 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12170.1789355615157694728
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Sep 2026 20:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oXHRee/X;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-86a25369f16so2122802b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Sep 2026 20:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789355614; x=1789960414; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IjOgd4JjdNA+wJKOj+zqr58GYYKgezXpM8JnY0qwQYM=;
        b=oXHRee/Xgb9+vCPcuRzIUxDEVk4CI05kuDgsmzdbIdE/3z+v1wDgB57OAkLOPT19w5
         RU75SuhsLM1KhyIEcGBqigA3yuO2/+a/L6JqJmo0qf7RXpGaCIZxy9KPjVTVR4DGn6G9
         qVA3AuLOOCVwgz7eD7LkvW0im0KgM47pBR/L7YzI9/HSVtLTMpAVniL28eFKngdvQlDe
         rOaNH0hcX7hXJFBfa1aQIzYKJrUr7JcAg1na4diCAvi0bAwktFCAOsm3w+R6axKi1i0f
         LEPJZh1rjIoiX4ONzyp8NfQmJPP7u4hKyeyOfFQ3htIv1/tpWEAEngLGdn0X4USqKTnl
         uhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355614; x=1789960414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IjOgd4JjdNA+wJKOj+zqr58GYYKgezXpM8JnY0qwQYM=;
        b=fv0NxbeIOO6j3sUT5NwmHJ9wh76Cztm5U9Cw93XxbJsAj3EhHQ9qfa0zFG5IUBoI4V
         HjDjGnHRAUdi9WkYxwKr/gvidArotG5rYxb9jeUEXdGcztOUvccxc9CwdDqX4OAx7c2x
         DZJEdlupPY10K8wWe7nA1Qk3suF7kOsKmM/Ef0vK3jhYWIzG4998XFXuITCBdJDVa9Sk
         ytOAeU/oVLyTbw9IyIgF3K/iN7qKAUUc3FMY52aeMoMWK7FvCrPmmyrVLBRHgpDd8K21
         dHxeXT8K1nWEG32BGKubYvHB7eK91a6awE73PrpsrdHbvowG1gXmjme5C6BehBpGcQBn
         Ibxg==
X-Gm-Message-State: AFuF++lLR6iXnioGFFIltRQzousnY767ZSUs3qmDbGzOmHwNAa1N/KnJ
	Dx9kcYjP+tuLeG7iauhQGozQbiWux1ZFnJrCeHmT4+c71UWfZkJK1KwlOWkYHT5+
X-Gm-Gg: AYBFou1GwPVk6q7/r480qKpmu9K68atrkFAey10xt+QonJFzJ6jabdemrB9AwuyQrab
	7vqO/T7hQd19JlA+CxGOc1VANLcJU8lvnKcBK7y1lGEJ1RnB27UFOZn4jx3MsL4IVb4Nlldkv9H
	lkLwIT01+4MDTEAjPj5tO0swlZIFRPLVLVNwpRkrH/i0OMBQditQYvsyxLjFd/UYvp9hgdGwObA
	sd+ZUyzvIVRRok84bFE4lPB4IsOHLx9XUN0TAR7Ue2+UcZkqxuY1QQ90U5mwO7eOTkvP7t609aI
	ehp6o4W1QaCvx4fxtJKhyD/6qP+NxEhfeuTmKXNj1xNB9IddSY+9LCOaiC8jLMm286ekOt5gzFe
	rq0vSfgXEzITU4FeZvxUcluTp4IfB8dOKrdGx1LP+3oA7azpxZFMSiCirNIyUH0tzzZ9u+DvA0/
	wL1ky/8P3FfoR/cD8IXt167k3dKVnyeaRu+R6n6Z5QYtZrKyfPIVZm+OLJReSZRaC3UoT6AXw4X
	gTgowoiHlxaLieB8JOL
X-Received: by 2002:a05:6a00:3a0d:b0:860:507d:503e with SMTP id d2e1a72fcca58-86f857f079cmr1670193b3a.20.1789355614386;
        Sun, 13 Sep 2026 20:13:34 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([202.170.174.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a2b5c72sm3712425b3a.52.2026.09.13.20.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:13:34 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 10/10] python3-tornado: mark CVEs fixed
Date: Mon, 14 Sep 2026 15:12:58 +1200
Message-ID: <20260914031300.3677365-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914031300.3677365-1-ankur.tyagi85@gmail.com>
References: <20260914031300.3677365-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 03:13:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130018

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-49853
https://nvd.nist.gov/vuln/detail/cve-2026-49854
https://nvd.nist.gov/vuln/detail/cve-2026-49855

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
index 4dda1541b8..114822fb6c 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
@@ -41,3 +41,7 @@ FILES:${PN}-test = " \
 CVE_PRODUCT = "tornadoweb:tornado"
 
 BBCLASSEXTEND  += "native nativesdk"
+
+CVE_STATUS[CVE-2026-49853] = "fixed-version: fixed since v6.5.6"
+CVE_STATUS[CVE-2026-49854] = "fixed-version: fixed since v6.5.6"
+CVE_STATUS[CVE-2026-49855] = "fixed-version: fixed since v6.5.6"

