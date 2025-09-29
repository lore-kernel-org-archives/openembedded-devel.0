Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5679CCA471
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 13:04:45 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.53210.1759151080981148462
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 06:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mM8tomD7;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b3e9d633b78so241046566b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 06:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759151079; x=1759755879; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bblv9HWcTFMRCFUMVM4EuYE7FCeMmYjVBLItIxC6P9s=;
        b=mM8tomD77V47F/s8ZKz38FLHeLcy3PKtGZnd9mAg8TI9Z60hqsv8yZsgic0YoFzAIr
         pSWfDrUvQuycHzZdsS/OiSxDDVD1OL+85dUxgU+Hx7eSCex2BMdbmS+xPA+L28YF9qVq
         68gB68HZ/2x/BsNb4Z61Lzg1sIA3QHfodgMzI5HvLW4vwqfS7Wo5QJiPYuKEZT7ZP/ix
         RKyTerhwww54q6OZxcWOrleUZLMC0TCCikwlmPGSPz3r8OE9LK3gExfuFe7Z9oZ9bFoZ
         jmJv+qBdDg79CPyaH34BdyicMjwCrGLW4y11D0oCXHhQDIbBjI3Jt4tkimY+5p8Rk4iN
         mdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151079; x=1759755879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bblv9HWcTFMRCFUMVM4EuYE7FCeMmYjVBLItIxC6P9s=;
        b=mRl4g6nsu15aV4J0zJpXaP0SjvqhfyMZ9nuNhxQzf6YtSog7JoT2DTul1spGN0Gqei
         6QsPlJMsIGnxBI+HNAlF/aSpdrPI2mhkpNoYJ9PQqXwi0LVL4pwI9WXy5OISjHP7Mtdl
         g6NeRy5s4+UHIlSz957LXJliWaNuN5MzOkd2R/LMxuqLB6+D6MFrrzWtoyw84ZJZEHoS
         PGHH0uKdJCGxyy8h9Tm/UjkwIY3SjE8kmpu/fP0FbhW/7VwmUAI5rT5SfeZ4bYCJRW+g
         L6xBS9UPlIFVX0Ceknk/kYPtltPcOyuj/YaE5OCC9zOGogs3+f3UtAJP3foPCICNJTfa
         A3Vg==
X-Gm-Message-State: AOJu0YyLMEWRgm/LyFrjcIeN4qzMIA/CQYMlwaAwCDIfQGVfdUJ5TKY2
	rVQxyIclWtOwxgI4/QbwrR7ItfSVvJM4t4lUvJlO3R09HwP7OzVOxJjAx9e1PQ==
X-Gm-Gg: ASbGnctN+5PmMtQ+IatAS75BodUSVbgihCka1DkGuJqVo51pgPLry+01NxAMIfRQbHo
	pQHYgzBeFUf3vDbUWox5VHXGjTl+bbMMQm6GQDvIGZ9wfx/XmZf21VbKIuG2wwWJJWPa5Um0SzQ
	yvmO7OXYdQuwn6OnQWgpMy3knG5Z3f4kujf2NxH5jltqz0jFdVwBPR9TP/7hSx34gGrEsD+PjtN
	JpyzcVktOsK1v4/gsY5NhTwbv97+XySnlLrbhAf/bEWvo4O8tdns49PxCWJ37a8cglM8tR4hcPl
	tRehkS3nPL7U5hiViMiafNAaUdFSRqmtB+kMHmkDPFUWatAJP+pCAP8SM4j4sbxkNXTWcIjt6Up
	qKHhGL8CUQCO0cfcndQzVlMQedQYLdbicNJkYvAU6kQ==
X-Google-Smtp-Source: AGHT+IG6kTazMTkZyIlCRQie6kgr4qObMcL2WagRc0qEmTbTWShP2yqqv/tHXAWwFcValylxVBUyzQ==
X-Received: by 2002:a17:907:6a14:b0:b2a:657:e733 with SMTP id a640c23a62f3a-b4138d545e0mr52606866b.15.1759151079181;
        Mon, 29 Sep 2025 06:04:39 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3cbd81bcfdsm335426166b.82.2025.09.29.06.04.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 06:04:38 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 13/22] uftp: upgrade 5.0.2 -> 5.0.3
Date: Mon, 29 Sep 2025 15:04:16 +0200
Message-ID: <20250929130425.2912077-14-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929130425.2912077-1-skandigraun@gmail.com>
References: <20250929130425.2912077-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 13:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120026

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-A memory leak fix in the prior version wasn't applied correctly, resulting
 in an invalid memory access causing a crash.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5d050f078afcb24d0532367592b074ae0787b06f)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/uftp/{uftp_5.0.2.bb => uftp_5.0.3.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/uftp/{uftp_5.0.2.bb => uftp_5.0.3.bb} (84%)

diff --git a/meta-networking/recipes-support/uftp/uftp_5.0.2.bb b/meta-networking/recipes-support/uftp/uftp_5.0.3.bb
similarity index 84%
rename from meta-networking/recipes-support/uftp/uftp_5.0.2.bb
rename to meta-networking/recipes-support/uftp/uftp_5.0.3.bb
index ca2a8ce676..6f0858cc95 100644
--- a/meta-networking/recipes-support/uftp/uftp_5.0.2.bb
+++ b/meta-networking/recipes-support/uftp/uftp_5.0.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/uftp-multicast/files/source-tar/"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/uftp-multicast/source-tar/uftp-${PV}.tar.gz"
-SRC_URI[sha256sum] = "57c12a6ae59942535fb5e620381aedeb17d50009ee71f236427ce237a46c0b14"
+SRC_URI[sha256sum] = "cb8668c19b1f10bc63a16ffa893e205dc3ec86361037d477d8003260ebc40080"
 
 DEPENDS = "openssl"
 

