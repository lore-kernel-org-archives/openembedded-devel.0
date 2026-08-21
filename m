Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54437C5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 04:35:49 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.685.1787286944439470419
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 21:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=U2Dajbh4;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d53197d8b5so6451475ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 21:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787286944; x=1787891744; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjIxcJcKGGQzXC9DXuARUx7dmx68Xoz8A9j61M1rut0=;
        b=U2Dajbh4cxLdurElZkHktpDbNI+d60JEnGt2zWGZxaAXbqwyRZyDEDu3htC0eJe5dJ
         hc1BIIgE+7AdY3BDpXB5t1lzaIpYQgz6dW18aD9T5WlTDIEQjGwFPKWrflR3IZoCUVK5
         tEda3Tqc+hivMLb8BibpLpNtyGGQ2WDJZVbg5r3QbJRVKYHRPm1CtViwqXJBoivCOXKI
         EJYuy35aFT9YOBNWIe8MlmsC2023n+nURuxrbqYPq5LZsROaEEIfNktuz8xb6/qVidx/
         WtC9iDa7EVu2XgCzXIBnclnMR2RudlOZMhyk65wmu5eVVUA4IbRDyt7doBAC9TvpHiLB
         dOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787286944; x=1787891744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VjIxcJcKGGQzXC9DXuARUx7dmx68Xoz8A9j61M1rut0=;
        b=IeKgDSZvH5jv1v2RwUZkPVR2hL6GSCMvVpLF3t4f/fjy8xyVyePDLVRQxkvcnYJSmM
         RG4CY9A9iBByNZcRMeT1d9U0H45oHgQIFo90YdK4izmnrfWsArfto0VkIgiVDxdiZac5
         Y5Kw2wjprXrC9F6UCFiKqDwkL+BgEsmw5x6lrAHj52+EVGzNpV5MfZW6b79QQywQhNlj
         biklmkJW7OcNXEliPXh9qReEWwMJIL8WgdhDwyG2SUc91ZdcgJ7eswDWDNZaGP/FqSlW
         Oy7GPbQvxvy2z7mZKcBm9fyatv7ZFQJ787Oo0exjzEXE+mrdI8v9ec+lmpyEncKr1XAl
         r2pg==
X-Gm-Message-State: AOJu0YxBVTXY/5/Lx0de8A8TIP2K+vAI5s3gHo6m/PRQeRjevqVFpmEF
	VCYzf9kCrJiaCrVsuRrCYaY+xV725MIp07o5GsAodVd9uyPdku/NHdFvWhKdzQ==
X-Gm-Gg: AR+sD110f0W8z7LzvdmzAuRb94Kx7ZNexHDRMUh10xuT4kDdn9GhGt45OesRGtA6Ai0
	bN5MxIm/N+FrShIbeBHdV3NGfQViF4WGlZClJWcONzkf+qK5vJsshubuZA20itAiEhcKbgu5E7H
	bo+NX/1zCBa/J29AP5wZONBfJk49oJcvAd+MW2DbQ6z5HmvnnKi8n1bsvpYdeJj8bwUPRbr7kiZ
	V+U3VQYl05kq1bCo4tJzxWMcB7Y8ldbaknMeArske0D2lRMJGMpG1vguYjzNQ9JT0Jb7hITUOg3
	uqmEt48vCYKJs4WK2HwuT/fcu/wynTgyRZKtGsNQhtRN29Pqa11Zw9ghaa7O4BFH+EWgjoiKsKq
	+IMPy/gg2214TWfmMvd2hPEl7cO+NGKSmhGtpL05dAF0ORfXHgi8StEBzuYcavScOazdOCwGAW/
	YM1UCjuEHpd8LZmNlOLec6QCt+zvbIIAT77osps0HJIV11zA2H0UveBjfzUx042YLK0JnKTLk8w
	ip1WhRB
X-Received: by 2002:a17:902:f68b:b0:2cf:c543:2c7e with SMTP id d9443c01a7336-2d64b0ce441mr73657245ad.10.1787286943625;
        Thu, 20 Aug 2026 21:35:43 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([161.29.95.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef6ec40sm23626097eec.7.2026.08.20.21.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:35:43 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 5/15] glaze: upgrade 8.0.0 -> 8.1.0
Date: Fri, 21 Aug 2026 16:35:14 +1200
Message-ID: <20260821043525.448011-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
References: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 04:35:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129400

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/stephenberry/glaze/releases/tag/v8.1.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/glaze/{glaze_8.0.0.bb => glaze_8.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/glaze/{glaze_8.0.0.bb => glaze_8.1.0.bb} (92%)

diff --git a/meta-oe/recipes-support/glaze/glaze_8.0.0.bb b/meta-oe/recipes-support/glaze/glaze_8.1.0.bb
similarity index 92%
rename from meta-oe/recipes-support/glaze/glaze_8.0.0.bb
rename to meta-oe/recipes-support/glaze/glaze_8.1.0.bb
index a96a729ea1..2d592e0acc 100644
--- a/meta-oe/recipes-support/glaze/glaze_8.0.0.bb
+++ b/meta-oe/recipes-support/glaze/glaze_8.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4d29875d83fbbf50485c846dbbbed8"
 
 SRC_URI = "git://github.com/stephenberry/glaze;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "be4481f4b106fc82f0b7bc85f6a92202f8c0dd59"
+SRCREV = "07e5ef2e2d4c53fdfd8603a61be37053b5a27bc5"
 
 inherit cmake
 

