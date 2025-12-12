Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5501D4920B
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 11:58:04 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11135.1765540680164161538
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 03:58:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DIL7jasO;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7ba55660769so908017b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 03:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765540679; x=1766145479; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdgw2toeZXWFr5/4mtSvxozRTqaQMx5m/tEqPvu0lcI=;
        b=DIL7jasO4raYHMEN2ZLEjyVU5/bopvxkYNc+ZcaZ20WHoGlSNOxpaJiEuHizMc3lFu
         ZdbsUktBZ30Hh0+LEHlYYkWA0bQxxuQTxhJkTmKrvipNZSCZLACAnGIPv39ppK/PkJ/p
         98mfhWi3/8yelKvKbd5SQ/eDWU8yVifdRSeoif22m2TGhfL1wNrNLWZVqcpgUK6GkyEj
         4aiPcSvqSgLl6CSPBE5jFPLs+ASN0zzLgvClkHXrP3WFS+2jWCxPyTG5b3lq7DVjgxMM
         BshJ5deno8nUAdOhudVCJ7nL96UeMEEAuD8KcggIQn9dXJv6yLLRyS5GeijHmvMIdgyF
         LO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765540679; x=1766145479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qdgw2toeZXWFr5/4mtSvxozRTqaQMx5m/tEqPvu0lcI=;
        b=h6IMG91JAowBRQa8LJAvVM0NNdeznuZxUjbyN32j+ZWFp1grwHOnZeQGpKqBGKq2ag
         20Y9pcrV7GBJkkN2vgzvyjo0o7x2IBWndQEOYnHNFQaLL4WDHhYmirHA1pQktf9zhFxR
         cgwkjRWqKOH4XDjr3dkLqxFV+v9MLK1ejcGIHFeZwPMxl9jIYQBngtW7ffQH9t4wsHCy
         ZPc3bEQK6ZegSBRqeoPzCt+ZOjGj9V/8KB+cqEn2nUNWXRWWWqo/vWiVUqWj8wWYP5NM
         fQ4NiQGklqWYuFQjlx/w+jW9Jli+glH18fuF49t6gXRJoyntuS+wL5UvGVRM5N+rBIfR
         U/9g==
X-Gm-Message-State: AOJu0YybQxBdO9GZqzuQZyQomxQH+E8sEzlD/Ai6Xp0CtczJp4W41yFh
	qkDN6JFn+jk+ZXG8/kN+ffcA+8MsPuKcLb0OCuJEqm/SA6kHXiFntxQPagufPw==
X-Gm-Gg: AY/fxX66m0egXwh+zbJdmo9YR0ROgdOYo/Cvz+b6p705KYgA3ftqJV4hs8yu/+BlD97
	YkW1INNyYKQkw2RR86NWOz7MLCEIShx/5VzMbwMQONK58kEFTKDpkjwjwiWzv4X2r+R74Eh/emz
	LN1xmPdFBt2/QPyu9pMFz63kXRQ8rBliL2U8vj0Mqo4qejuwA4n+DDTp2j6YUU3oMSQZGUTw+D4
	HAEVHZVgRyOsst5Hqj50+0H68T2LZBIDyelFyav+hN9117kDg6NLbsUv2hkwSmiYk23fGn+2BAZ
	5XpQ89QthijKpxFto6+0kgZctH3iAa2nQO1eB4hn3DVteZwZNQIM+HXLCVYyVHB4ytFxGsOQdiz
	n56sqXwaSspfaNQksMjVqVFYaMuTeg00SWy+uCk3t/fdnu5m0eMCiz5w/iVJyMnTuQnylEraxmY
	BeBWx62YbfkT/icSz8CZTCS70=
X-Google-Smtp-Source: AGHT+IFrJfFUevSwCTefgAkksgi9AQUzO7rJRCcOtkRssj5VdolT7Gw2Sdmlh5EcaHtiNdmjUY8YdA==
X-Received: by 2002:a05:6a00:6ca4:b0:7ac:69cd:ea0d with SMTP id d2e1a72fcca58-7f667d182afmr1567187b3a.19.1765540679318;
        Fri, 12 Dec 2025 03:57:59 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c27771b3sm5163198b3a.27.2025.12.12.03.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 03:57:59 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 05/15] python3-django: upgrade 4.2.25 -> 4.2.26
Date: Fri, 12 Dec 2025 17:27:34 +0530
Message-ID: <20251212115744.569676-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
References: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 11:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122605

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://docs.djangoproject.com/en/dev/releases/4.2.26/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5551a12170f347cd9e50d2c57fefa3967a4f80c6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-django_4.2.25.bb => python3-django_4.2.26.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.25.bb => python3-django_4.2.26.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.25.bb b/meta-python/recipes-devtools/python/python3-django_4.2.26.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-django_4.2.25.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.26.bb
index 861f7747d2..ea790e4b7f 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.25.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.26.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "2391ab3d78191caaae2c963c19fd70b99e9751008da22a0adcc667c5a4f8d311"
+SRC_URI[sha256sum] = "9398e487bcb55e3f142cb56d19fbd9a83e15bb03a97edc31f408361ee76d9d7a"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \
@@ -9,6 +9,6 @@ RDEPENDS:${PN} += "\
 "
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
-# default. To build the 4.x branch, 
+# default. To build the 4.x branch,
 # PREFERRED_VERSION_python3-django = "4.2.%" can be added to local.conf
 DEFAULT_PREFERENCE = "-1"

