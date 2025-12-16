Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC80CD609AE
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 15:23:06 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25123.1765898582008482886
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 07:23:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dGwZbNqF;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so37615195e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 07:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765898580; x=1766503380; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pA2wxVsLejcCS4PrlfRnqW4q5ekk8pDFix96IAWfQ1I=;
        b=dGwZbNqFcY80T4Gi1l3+Bt5wkf6qccqN5bM5gH2eDTFggjm/e6UtvZcsxgOOlpBem0
         JUn0/s/wwM4YaS29H6NCibfH81WovGbUL2uw1v5UA18RrZgKwU71r1RzmU02lgfSKZQQ
         0P1/+TNfQCpa+Zab4RLHRS42TFV4I2lKCr3D73qOgzRRxQfpyt/PHb04A1dkkBklyeGg
         sCosFudNAr35wg5KWPjlfVPNsU2S4mZCjbhxBt3/4sKfTy7mI19qmbQh0HzkSSkNfp+K
         t2Nom07g/J+kWsB/Cg09UckHvYZ4Ahg52ZG8oWeqQ2Qpw8RGTMCMQMv5Pg7EOn0VUhKi
         9XdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765898580; x=1766503380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pA2wxVsLejcCS4PrlfRnqW4q5ekk8pDFix96IAWfQ1I=;
        b=BeAcVabl0ArN7VJI9+Mmr23cFnAtS2XseR3vsSbxifm+OfBbm67WSxhavbLg8L+z52
         zJ6j9YfymPHZgQSHp/zIPEpr0/db73YKbrNsjSlt+5FBqeoNyt5FX2ozLSi0YxAUoTTl
         hmIl76CC6CwQj/LBpCW6h5mUXLgLaiEL8r03Mn5YhnWs1uF+cZAfAogBpt0HQb6amNJd
         UW1pBCPfFC/pMPDZgA/opN2a/stzZ8DmuZXv5MRVx5FqXVNEIUmR0yPfMt38ngSezVxX
         zSUjJvkTofkQTBIOZVUTkZZTgh+JR74obGk8Z1GR0aKxSWcr/x6zAkNJcanZDAU5IwTw
         FQJA==
X-Gm-Message-State: AOJu0Yx/ep9P/ZVnlBZeVbb6DyzAu97chX2eGd1PgjHsnm2/Ii/DFzoz
	7SeKKZOTRU6wTtckoVGATWytbWbP2337m4ouqDMk0exfV3ZXtUxm+P80isHc/Q==
X-Gm-Gg: AY/fxX5SED39qSumIbklNeQaC6UE6vnHVZXwgiJjRJdPClTH2j1/5wxYwoawydLGSx6
	m/BfRj+QaxsKy4FIZigeBv3kEDL176OmfeQ/qgsEf3WTEhYtZXCGFMJW0TbZq+Fvxc8xvoFoO5m
	Axe/xcBFrwjhNsj/C+uKSAXjk8RJRHehuDoCy9h7YNlDFtYx1Ci3drEyvHnctcVOpqVDmbT/3lh
	76l4a67NjogUZ7FJxpJqFSaLh8lY5X5URWvSz2uH027eBM3i1SykEiy+Ryj4Yoqo6fbK03FEb28
	A7WbUHtcprwYVwe/v0qtRFyxhxMtlqMlAk2I0fxRcG5OrK8sCW4LdYJVgNI2KzBwl/9zQa1TPdn
	YR3FicUuQ5ArWb0ZzZeQj8Hl+1vLv+VkhuKgeL0DrkbAdfcyScnTEDf0IMka4a4kZ34FpZ/9nvQ
	2IlevRG8vH
X-Google-Smtp-Source: AGHT+IG4rZyLgWtpZsZDV5yKxaDDl4W2okEx+Mftc0U2R26HYTBvkYIQM1hriELtlDJTxuaaq1h+ng==
X-Received: by 2002:a05:600c:3b05:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-47a8f8ab546mr158883775e9.6.1765898580231;
        Tue, 16 Dec 2025 07:23:00 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f280cf05sm21933938f8f.7.2025.12.16.07.22.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 07:22:59 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] python3-django: upgrade 4.2.26 -> 4.2.27
Date: Tue, 16 Dec 2025 16:22:57 +0100
Message-ID: <20251216152257.2577206-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216152257.2577206-1-skandigraun@gmail.com>
References: <20251216152257.2577206-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 15:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122699

Contains fix for CVE-2025-13372 and CVE-2025-64460

Changelog: https://github.com/django/django/blob/4.2.27/docs/releases/4.2.27.txt

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-django_4.2.26.bb => python3-django_4.2.27.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.26.bb => python3-django_4.2.27.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.26.bb b/meta-python/recipes-devtools/python/python3-django_4.2.27.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-django_4.2.26.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.27.bb
index ea790e4b7f..86425ca724 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.26.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.27.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "9398e487bcb55e3f142cb56d19fbd9a83e15bb03a97edc31f408361ee76d9d7a"
+SRC_URI[sha256sum] = "b865fbe0f4a3d1ee36594c5efa42b20db3c8bbb10dff0736face1c6e4bda5b92"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \

