Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06777C56201
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:41:02 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24812.1785872457855175406
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tHPygUPS;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso187826a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872457; x=1786477257; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RFCE+ZFrXJ/egbbMEwitVuzl7RrXPbqmhR+8wrn2ibE=;
        b=tHPygUPS//gmaPybolbAX8JsIucgDFOJ7s2ZtWJj8ymn3GUabX6YzR4T+hLR5PbFlv
         iQaoZmH+DYGmwlx9aleunpGC7xMMdiomJCd0k8rg+DshQnIANO20j0FOZy522hLNIw9d
         8lLINMTyEafeGktCf3G6J/6gVw3W6/j9DsjyoT7XBFfVFSAT7egDH2Oi3V6XVAXrqlK3
         UWPk5LM6r51HsGCpc/TimYlvhIhnrSh8uzWUkREU9I7Yrxh6iu8dC0a00m9csOxVQDhb
         f8kRbJhqF6GgY1ADpcnldquItdoKX4d1zqtPY8ApMKF2ZYD6jN/Y1LAKkHZLu1nSmymU
         /Fpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872457; x=1786477257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RFCE+ZFrXJ/egbbMEwitVuzl7RrXPbqmhR+8wrn2ibE=;
        b=dMTrpxr4wnXbd6NHCkb9Bl/ZIVeDO+NgUSX2lh/A/ht0vGDdTHVFnlgC7b2E7StZXM
         1I+V1Sz8MKesSKjbtq5cfnZtu+TQVhwN54mncHdX7I7HzQJvJwjuVXkN3YJWvFqcJYfb
         034XF1MkT833EJnjPpqhf1AIyKILbXlzS9ExPCHsr0jFuFL1eNfjVvDGcacnWrTDmhm3
         QXXuRVBxYICq56L78pFn87QRsmBwn3cogZ9ytckLf5d2bNZQuOs0r2RLtb67POHT1TcT
         5t++mms0HRsUaylle0VU5Pygty9AgV+T5iq/Rln/t2KqGlQ1FUA8YW2nNBhowr5bIJ0l
         Bd/w==
X-Gm-Message-State: AOJu0YzN+uO6L6yPBR1tn+YeHmOnVuCzD81pPdTGrolX0J/mERdJyFwk
	WM62elYre/cAQvjhbMi2XawKNHZ45Fe0I5kUDraIhADIFzb0UYbO9EU2hMadY6Ol
X-Gm-Gg: AR+sD13iMu2ag1qSr7QFqGcx7XShfcvcShVn29lNGNfrmL/uoRl0hzoBSuNED+mRBE8
	tR7A2CaKwt8EGH9OVPsK2mg+NOO4yvDWIpttTIw1pAlBCltOwUGUB+RxbS4ixdr/D0UYzltFWxn
	Yi+v1+nbgc+YkfELqYHRUSrI0n4bKknLVYGHta07fswkPGDd1aJH2P+WGexZJbzlx4NrA4wyZdC
	a6G6uQb+UjniUYuv2OQLVJ4j9R630e+2+cOo0rD4o1QcPOzWh6SojOL/s2HIIYdelE3oRj+0+gq
	SrLYsQUUywdi3kdWjqgG6N+pcOh0Rj4ZpGngnklGtBJS/ij/xVUBr1sQ3ygtKFyUOsbUhP66oC6
	QCriJA50x6Kz387JfpSER/Na23VW3S5TipiOI+7d456ggP9HdGPJ7kKsptGX8LUuw9g0Nhkwb5Z
	BDWklGzECeosFCGqgAOeJmbQC5mK9KUdccSonig5y8dW1FRfGDBGdMhHlrklzEfspWGBwnYFD6F
	A==
X-Received: by 2002:a17:90b:2245:b0:38f:bbc:6a0f with SMTP id 98e67ed59e1d1-3903c538565mr1075752a91.1.1785872457136;
        Tue, 04 Aug 2026 12:40:57 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:40:56 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 19/36] nodejs: upgrade 22.23.1 -> 22.23.2
Date: Wed,  5 Aug 2026 07:39:46 +1200
Message-ID: <20260804194003.3158916-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:41:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128766

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://nodejs.org/en/blog/release/v22.23.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../nodejs/{nodejs_22.23.1.bb => nodejs_22.23.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.23.1.bb => nodejs_22.23.2.bb} (99%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.23.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.23.2.bb
similarity index 99%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.23.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.23.2.bb
index 8ad884b9cd..bfa5e296e2 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.23.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.23.2.bb
@@ -39,7 +39,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "b27385d6845089bdb91285d94b06c2a5cf1c37f8173a3c4e10824cc1ffadeaba"
+SRC_URI[sha256sum] = "bbe768df8d5815d7fa76124052985332452e0a4742d39f32027550d1aab8f6fb"
 
 S = "${UNPACKDIR}/node-v${PV}"
 

