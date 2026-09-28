Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA2DCA5FA4
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:03:46 +0000 (UTC)
Received: from mail-pj2-f25.google.com (mail-pj2-f25.google.com [74.125.227.153])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46622.1790553821171983118
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AHcekOWi;
 spf=pass (domain: gmail.com, ip: 74.125.227.153, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f25.google.com with SMTP id d9443c01a7336-2dd4b43b20bso9727445ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553820; x=1791158620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SyBLyIMHzZJnQAOxx2ObWGCHUCmiaoIpt3Pn5Xa+93Y=;
        b=AHcekOWiPpMBTPnfuS3p8Jqg0iqfQXaPnQbburmihhJlPUDoGMOUTS95iR3R6IHIkI
         TjNmHcRslQ692MVLoauJirS0NW1W+e6aLSTW3C02d84K+JlGjOwuO/bytgC+7kvhNpwR
         /VTK3YssdevLwW4QB6hWcUaMs2pRMl/mEJNQW4+9jMG8mGXDpi1ZZEg6cS+zz32N2z/P
         9yJr61U3ZbL9rLbN3HnT2ZlfDlYIhMbLyR2qiJ/45cGyXejboH3FNzM03NdGIiMdX1oK
         yKQqZzFLe4DaiKacrXTy0Mlx8A29klpZxmqonUlQ8nFXpwSeP5J0Z+SQuWYB0yS0k3OI
         1tpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553820; x=1791158620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SyBLyIMHzZJnQAOxx2ObWGCHUCmiaoIpt3Pn5Xa+93Y=;
        b=2zwCz00ugmU9U+UG7HEYpHq3VYzokjjnAJShhDA0l3wI87mxQhURfpfZn0Q0GPrJdk
         x0bf6CqqdLua1nqIlrHfqVOpEveqtmDyx4rqkB5EYfk0WNQZWkpEhRnfn/N5cqa7PfPy
         WQy+vikn7ZQF/WE/7gJj56ZUgAKEX487sucdgpKi7zQcugAQp9acSf5HKR7sXX6ty+ON
         X7tFGeIs/u08bKwUx6vI5e7okFwZVaTIs2n/wjG/SNqWqTRamCndUYprj0rGlu1KoorI
         hVBEm3KtH2rQ4AAaYIH9ozhFM6msE7duC27Djo/TPxWryhv0DDg+lzJvh+x0Gb74krBI
         vjMg==
X-Gm-Message-State: AFq9FYII5h9f0K1cBeJrXFlnHByuR0qq1u7ymKkYS6nPkG1OdVcv5QpE
	b1nrDvEbRlzVlHZup5E0wb+v33vEhWGE5AjgfELESOWBCCGbUKgkigIwGrCr5A==
X-Gm-Gg: AYBFou1vBXbF3kRgV0S0ytFuW0PAubmL9ydun8mHbSJ6pKYOZ9fAmxMFQsgXO9dyj6e
	gBqU4U01nMXdLTnPGzR4s8v0EOiq/lxVsZilYxbVritQ6vLPdPqixqobXs+yolvBrHjkg3Hn1L0
	kSNJwqF8eArQpHbKSBl/oaEGqHu3/IghArr9iGKQ/qe90b5slNPpI0QdZP6Yxx16HLS8B3GzNdQ
	1slkhxTwCUfKXIgI4oK1WnNaqV4k/SK5DYozrNz0W67tvzFmDhMOhPY1gQVsc26JRBo4NRaFIVq
	dil3ruewgKtirs4AMTLYcl6iomidZ7Ma5sBfo5G7nrQ11aQdA9/kLeD7cRaKXEz9eUS3AzLkNeJ
	f8zT22l4R2b61AfOETWA8OnYghD+9tcLbJc1d+Cn2y99mw4XNq4IuUrV+ujXCylQV2KppbI8q+L
	SgICGR+clOJpQ32ussxqDPEPQ2FdjdFg1YJ6kyyR42EceS+x3YwTe/Rjv4mVAj0IHqXNex+R3Zj
	J0TgVF92CO5Ijo3sAIINdwzPOPz4cP2Dg==
X-Received: by 2002:a17:903:1987:b0:2dd:3ddf:b87a with SMTP id d9443c01a7336-2df7da68a41mr86743795ad.0.1790553820487;
        Sun, 27 Sep 2026 17:03:40 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:03:39 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 15/30] python3-discovery: upgrade 1.6.0 -> 1.6.1
Date: Mon, 28 Sep 2026 13:02:47 +1300
Message-ID: <20260928000302.2528437-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130402

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/tox-dev/python-discovery/releases/tag/1.6.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-discovery_1.6.0.bb => python3-discovery_1.6.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-discovery_1.6.0.bb => python3-discovery_1.6.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-discovery_1.6.0.bb b/meta-python/recipes-devtools/python/python3-discovery_1.6.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-discovery_1.6.0.bb
rename to meta-python/recipes-devtools/python/python3-discovery_1.6.1.bb
index c896f5f96c..8438e31f05 100644
--- a/meta-python/recipes-devtools/python/python3-discovery_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-discovery_1.6.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
 PYPI_PACKAGE = "python_discovery"
 
-SRC_URI[sha256sum] = "6393b4eae1be8b2182670635e7baff89ac21cb9f8e86fd1ff40c7b1144febb4c"
+SRC_URI[sha256sum] = "cf87d3627dfb4412437fdd5b13eae402607722998d21567993aedbc59b23c15e"
 
 inherit pypi python_hatchling ptest-python-pytest
 

