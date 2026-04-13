Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903E4F531C3
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 18:51:14 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75.1776106271845657541
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2026 11:51:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sjjANgdD;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43cf7683a28so3167990f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 11:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776106270; x=1776711070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLhiZI6nYLl1U5X8I9o0/xPFJ/EI1vRVHJfuIPUJK/o=;
        b=sjjANgdDunFDzT/h60OEJGZpBZk+mFtetmPzvr52Pg/fsdAXkQxm8m1YvEPY1PcevF
         7ClXDSxTJnQfmjsKi1FjCh11Tdy86IJ64fmVHK+yO32cSEkOPUMWmTIGLRMQ7Eazcx9r
         JibbbgeTWQmBoRCUHg76X9Etps42vqU7BdA3PNj4zLZlUECo0370piEUh+uzasi8gEM+
         k+WxK6IdwGCFgkzUZCp8FjMYXmn+cL5enQDFAPPoc1BOf9GQ/E9FqpblwlJSguxMcai9
         TkMMW9s8umxbR4iCtA8v2DtaBgSP7SuKpSssuCL6XnMcWkmu36uKlRgKsaHpYh+CUDkP
         prFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776106270; x=1776711070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JLhiZI6nYLl1U5X8I9o0/xPFJ/EI1vRVHJfuIPUJK/o=;
        b=hIvIcMaZGcDLoe3Jj3LckuSZ2aDFiKUiAC6umenhXUqIJMcVaCne4LqwE8OrFHePQv
         pNFC+zVza7pjSD4kVfjyo8GfJc4oyekNhlNjbMVKDFG2NAC14s6TC4apvWI3wLJ4hrCw
         rP++gLl0siQSj2wL9MJtzM+B6dUeRwy20eoFdLeTsBzCCoTlwxAbcqtQOn8XIO7Marrx
         8gekDM/CUzngPycgdp2B8dxvnSyBK0flEVEr12ApLzo0yvHQZUxpD+70K02r5DRUNUfU
         WnRK1TCRn3ja4mYKR5GJ37H4LAJDTSg6BkGdjvNOAaeEGJVMvbZb8j8Te5P5Wv+CuDVu
         B8Aw==
X-Gm-Message-State: AOJu0YyuGMjd74pyuI+9ocKEdimx/YcbtBKvvtPGOnuxAwzNiwROHjjZ
	1T5tdw5mPZbQmysv4j3IebnJYwveg5HMg+tuodLiYQ4PRrEG1oxrS9/Ndg2Y0w==
X-Gm-Gg: AeBDiesj8DN50QfocS6wRVQEzeIvDj/RtEbKq0fkbh2rI15EgdnODwPJP9HqplExEIw
	oq/PqDdWZUxuCODGeOHxef0NImx8DES6C+VKOPkT61gbcCcDeXKU2FgOFtMhz3M/j4TiVpJICUq
	bJCeFjTMDxSUZ2YZE19ZvHH+73LKqnOqenEGvYNPvJsswjHAKzBhdk8sjfyPfrWLs9BRbdmROid
	UMl4AzSIrHF03YtTetdXwsidbyfJkN5izb9XG/us7eUi5DNxgXpymZa5ezUKUe73T3/zu829wyM
	bad38WaQf4BFfKId8jgHMu57511ZJAlsdaxBQSsi6T+6F/M5HFQyxzHE2o0p+8m+3DGmcv/CtSx
	0ph7DEOmyGf/2RHS1+v1ETt0u5a7SSXHaZOgORWosV2NWCa2iKJ26aeWfSv/zTz8mL6fgSAJmim
	U8ITB9YgaTp7YuU8J/+h1C61dLoabgcqI=
X-Received: by 2002:a05:6000:2301:b0:43d:e31:68d1 with SMTP id ffacd0b85a97d-43d6428e2damr21540723f8f.21.1776106270013;
        Mon, 13 Apr 2026 11:51:10 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e4f16bsm33544682f8f.26.2026.04.13.11.51.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:51:09 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/3] python3-django: upgrade 5.2.12 -> 5.2.13
Date: Mon, 13 Apr 2026 20:51:06 +0200
Message-ID: <20260413185106.1098314-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413185106.1098314-1-skandigraun@gmail.com>
References: <20260413185106.1098314-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 18:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126289

Contains fixes for CVE-2026-3902, CVE-2026-4277, CVE-2026-4292,
CVE-2026-33033 and CVE-2026-33034.

Changelog: https://docs.djangoproject.com/en/6.0/releases/5.2.13/

Ptests passed successfully:
Ran 18163 tests in 457.705s

OK (skipped=1389, expected failures=5)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-django_5.2.12.bb => python3-django_5.2.13.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.12.bb => python3-django_5.2.13.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.12.bb b/meta-python/recipes-devtools/python/python3-django_5.2.13.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-django_5.2.12.bb
rename to meta-python/recipes-devtools/python/python3-django_5.2.13.bb
index 13166d4c53..fcf50e939d 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.2.12.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.13.bb
@@ -2,4 +2,4 @@ require python3-django.inc
 inherit python_setuptools_build_meta
 
 SRC_URI += "file://0001-fix-test_msgfmt_error_including_non_ascii-test.patch"
-SRC_URI[sha256sum] = "6b809af7165c73eff5ce1c87fdae75d4da6520d6667f86401ecf55b681eb1eeb"
+SRC_URI[sha256sum] = "a31589db5188d074c63f0945c3888fad104627dfcc236fb2b97f71f89da33bc4"

