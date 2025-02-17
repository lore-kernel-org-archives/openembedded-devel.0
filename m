Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9E1C021A0
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 09:22:18 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.47549.1739784136471210373
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Feb 2025 01:22:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=EJzgQpVx;
 spf=pass (domain: konsulko.com, ip: 209.85.221.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38f29a1a93bso2498487f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Feb 2025 01:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1739784135; x=1740388935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jIyHZ5JexZNowkO243zQS6a1z3gefm+rqLom5Qefe+A=;
        b=EJzgQpVxju8B76Q+VWwsN5dWsiNmobEJNdyZbmWppJMSwoPg5UvR1PegwfBA5YYYYv
         FQQ5qNvL0Hoj9kKzJv4KpLsJDXWq7A0uQzurKItwgM6ZLvlDR/Oy5s7bvwfcRPnrpV04
         zt5MPY8PFLachU6UUKDCrsbfNR5A47bJBtEYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739784135; x=1740388935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jIyHZ5JexZNowkO243zQS6a1z3gefm+rqLom5Qefe+A=;
        b=eyAFrQ6SHy+jgnacZcoRSrH0OrGJHl4hNpdOJRJkm5izOFUWFOja/KUNNoW9jeYvx5
         NEwQxOJTJVT6n6kwri/3peGFntM7bqgDQlzlwo+YGXT+szj4cqixMp055kNGtnBV+PbR
         U1yrVt4XtzZ9h5iVTWfS68QC6GxsZ5nQiuCa8M4EvgOJskKsusclPTeakryQHiwMDx5p
         1+h3wjoGg/rHMPlbFRFifoVeZKh/W6tq37dWqEsYntXpQQR0s0IbYQ2Pxb1byXpAK39p
         z0WbZWXLTLBRZdDYrs0+1p+C2XdclkLKrrm9HbYjdQP5ZxWCcl3CanLZPMVoTPLoPsVf
         zXEQ==
X-Gm-Message-State: AOJu0YykL9mzZTRBeIm5fiUUTm4lq99fZTfmM0oqX15f3rzAeY85ld3/
	rZSKyIPODBBqVyxJhBd6OaEVrUS8lg6/7PHOuuoKdzBCOinqVlksc5hUyIF6EywCGSHkcdKVsBq
	f
X-Gm-Gg: ASbGncve2F8/6yGorTxqyX5a6XbSmyGdm8+MZc7xnA7lj4m2ZRmSVs6pUSfXaiTIPrG
	+D+04n2FtmZg+65lsuwnLE2+GUpE0lNAzgswZYWGKiDkdzxfcJvgA2D0BZgv50TilwJXfOth5Ny
	ZFWPcZGheC7ifvhDVQiEL20KicAtJJYuy8053YaOQLA7Z6K+/5xjrYqgvSlG8sk3J4ox9dJzpf/
	yIy0BXWA7j5N3yblMd3z66aCtqvQJ8x9njMR+KLcwWuhOByqjk9fBhUojdgZYAcDupasvAJRbi3
	qd/JDZ4gu+Wfer7PG2L3IvNvhtVyXA==
X-Google-Smtp-Source: AGHT+IHTTlUzKCvcJKII/MLYfrQ3NRmJnRoD91I1WNx7aUOLYady9sCD1SR2lnyrFUdubQJbhyRidQ==
X-Received: by 2002:a5d:4a4d:0:b0:38f:32ac:7e53 with SMTP id ffacd0b85a97d-38f33f437e6mr7565711f8f.39.1739784134609;
        Mon, 17 Feb 2025 01:22:14 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b4118sm12022347f8f.18.2025.02.17.01.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 01:22:14 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-cppy: Upgrade 1.3.0 -> 1.3.1
Date: Mon, 17 Feb 2025 11:22:08 +0200
Message-Id: <20250217092212.3970278-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Feb 2025 09:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115509

Upgrade to release 1.3.1:

- On Windows link to debug runtime lib when building with a debug
  Python

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cppy_1.3.0.bb => python3-cppy_1.3.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cppy_1.3.0.bb => python3-cppy_1.3.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-cppy_1.3.0.bb b/meta-python/recipes-devtools/python/python3-cppy_1.3.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-cppy_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-cppy_1.3.1.bb
index 58b5a067eb..ff463f6833 100644
--- a/meta-python/recipes-devtools/python/python3-cppy_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cppy_1.3.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://cppy.readthedocs.io/en/latest/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0bfb3e39b13587f0028f17baf0e42371"
 
-SRC_URI[sha256sum] = "da7413a286d5d31626ba35ed2c70ddfb033520cc81310088ba5a57d34039f604"
+SRC_URI[sha256sum] = "55b5307c11874f242ea135396f398cb67a5bbde4fab3e3c3294ea5fce43a6d68"
 
 RDEPENDS:${PN} += "python3-setuptools"
 
-- 
2.39.5


