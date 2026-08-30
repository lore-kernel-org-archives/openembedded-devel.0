Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34016C61DE5
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 00:50:51 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1033.1788051043680982885
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Aug 2026 17:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dbyP8JUI;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso24777495ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 17:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788051043; x=1788655843; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JfQppX6VzW+jrzzGSfey7NKQSFNllcIWmxHOywzng04=;
        b=dbyP8JUINfiZh0yAEcPfJAd3/Vsm4yj3olbsjhZYCj+9vHyIr70Mb13N8ipzm4gj75
         BVe+kSyHsW71cEtp7HMWYzSIxUu3qxwgO2OiZ0nd/9gc17ASPjTGq9/XidfaAkFBw4dH
         4rMVFxZvXCKTigkn7CdGohPlecp8RBOCfgTpUYZACChWsdCOWrcMArKfyjr9JnghEnNi
         t8AkB2MljUuFyKZAegbqv+FC/YHRVd+FzekMv6QIa0snk8g5pKHIZr4q21GeGN7Vl2oH
         l/k7yCrFpQG/KK04Zgh8yiSojP9FldkM8awa4RrP5s+syEwfp3kEqVby5VEKF61QBFgV
         13vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788051043; x=1788655843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JfQppX6VzW+jrzzGSfey7NKQSFNllcIWmxHOywzng04=;
        b=cSRB1cLDAcJGhg4fHE8f4lYedrh+q+08D7JlIbRgAsbvOYEg/4/Dyelfu7xsMJrHnG
         qBYg1NCEM8atdqXVHaL0bkt9zk8+0g9IqtP97E3hOpVgMCt359RMpAr/cvT0FlQVRoUQ
         8xA5ocnUGaofgn1dLBjAE/v/tJia80S2uZylRU+ZhfQ4HxiC8S98c5btXm8S98Hge3GY
         kADJuhcan28FLjMhnmnp5Q/M9CkBwNiNr5fqXaNxCsJlw+O820J+5r/gCivFvLSX0bGd
         AF7b6MoWWxXFU2kd95ri6GKf2grGiS6Ez74Jcj+HYwkk5aqygkY1svYRPbQpVGVLiDz+
         VufA==
X-Gm-Message-State: AFuF++ndfZ3w8sZvT3dNqXoV6BMSTItlGs3cUmQaFZESfcAOr9t3p9YS
	wuiZe9L6PKfciF3CscMax9h8TdWr1aSNPypMzHGfdQW5PNvJXKjX8z1XpJAVTsqn
X-Gm-Gg: AYBFou0h9ZwUz3Z0JSxEHhOnWLyWcCA6rZJhyNUwmcGyHKsJy6ojVosbkfuQnXmeqpj
	6+REkP+zj00k2k665Q2aT6frNzXWv8+4KX1WhGQs5ryk90bYyre3wGdHan71eaXWT76BnRHgYiV
	pSJyF2zTnY371c3vjMbhc0ybRmZVvAr7ex+fQp09kqdRA/D7vW1Xg2gAPt5gIhxuoGl9H+tYxl8
	ySufUds8Qv/hFKWG+2/PYhVWiASFNZEVtm1AEVowid4hNeNQ9GzqR9vrVC2gbWmGeUX5HZayWgk
	OxSpPunAg5vxiDqA9vzjIxJiz1kAhyplfkVTg9RtXM5uyiJO9/d84dBg8PWOF/uUTKckTHJBGgN
	ZNyPHYam5p+UjzqmkqJMMYTtXKPlrAj2jD9FCuparazfBsYCwG7OdjL4C3XKztfGEP9VQSgKWdk
	FjYB+xQwKJ62vnFklTRBQiVqfJR2iK90L2+CbJNQkzrBqtCO2NkNQ927yo3/Ujtffwp3uA2Kh70
	0z+mXyNfe4=
X-Received: by 2002:a17:90b:1a8a:b0:398:9bd1:3211 with SMTP id 98e67ed59e1d1-3989bd135cbmr12329136a91.18.1788051042966;
        Sat, 29 Aug 2026 17:50:42 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea808csm13561826a91.2.2026.08.29.17.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 17:50:42 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 9/11] python3-discovery: upgrade 1.5.2 -> 1.6.0
Date: Sun, 30 Aug 2026 12:50:13 +1200
Message-ID: <20260830005015.2555347-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830005015.2555347-1-ankur.tyagi85@gmail.com>
References: <20260830005015.2555347-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2026 00:50:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129590

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/tox-dev/python-discovery/releases/tag/1.5.3
https://github.com/tox-dev/python-discovery/releases/tag/1.6.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-discovery_1.5.2.bb => python3-discovery_1.6.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-discovery_1.5.2.bb => python3-discovery_1.6.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-discovery_1.5.2.bb b/meta-python/recipes-devtools/python/python3-discovery_1.6.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-discovery_1.5.2.bb
rename to meta-python/recipes-devtools/python/python3-discovery_1.6.0.bb
index 00e1f1a16a..c896f5f96c 100644
--- a/meta-python/recipes-devtools/python/python3-discovery_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-discovery_1.6.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
 PYPI_PACKAGE = "python_discovery"
 
-SRC_URI[sha256sum] = "45fd4f20a4e3f9b7bf2e0817870bc8e3b320a19658da177af800768c82dbf354"
+SRC_URI[sha256sum] = "6393b4eae1be8b2182670635e7baff89ac21cb9f8e86fd1ff40c7b1144febb4c"
 
 inherit pypi python_hatchling ptest-python-pytest
 

