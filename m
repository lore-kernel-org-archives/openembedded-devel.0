Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B6AECEDD8F
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 12:30:20 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.15042.1728477018161492840
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 05:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=jez7rLoM;
 spf=pass (domain: konsulko.com, ip: 209.85.208.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c903f5bd0eso3427376a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 05:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1728477016; x=1729081816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JvBEMWLgBdnCaAbd7mNbZHk30HiQfRK+KYcXIsIQvw=;
        b=jez7rLoMF/HcAdWFp+rEEOqDaBIaSqsrVU+nz8pe4bZr4xZGjZBAW65cyBsqwCaHs3
         SkuWyejf9gJwCtD3IgTppKi8+D8NALKGj+GxJrVvQRaO4jt5kBdECCv5odqRdW9B6s+u
         Z6x+izeOZUT5MbA+XRLsaIyGf+6EdVoMaUtxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728477016; x=1729081816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6JvBEMWLgBdnCaAbd7mNbZHk30HiQfRK+KYcXIsIQvw=;
        b=M9JcoDYOc1ayDfmA8Zq9qGaYSQaodufeQV+3r81QXjJORVbCrzb8wAdt/GNlvw6Jaf
         2vbnbnWvwSdpeyhF+EuWFXmRKHDWnqgpyZ3gQfweMTnb23QTvilkHU0AT2aQpBbur4mk
         Di9eB+KW5/9YMqXUMdt4pLyvE4CJKS6zlcbpTlbDuJm6LpYR7yrM0a9yaoWpT2+63vF/
         XocmhefUdAizTEzsmf/IK9PTaKIMYrI9YSeCH5sD75E2jdjFgxzxe8uHJcAJOjDfyl1o
         JOSAuCl/VuZgqBoOOFOzW3SEdn54nO6sxzfJC1/X26HyxTGdH5HuixcnHj2A7Q/PsRUT
         Psjw==
X-Gm-Message-State: AOJu0YwWIXWhr/3FidLtDOu+V+jP0ydnvdnRPFtWmUo02LeiDxNdh9OA
	bda6MemKXKOIVZbhWt1XaTYZS+p7BzLGcaUmPo81ETre5QJrYT1Nepu6o99+PYGfEdJmPIRKqFQ
	f
X-Google-Smtp-Source: AGHT+IFCGQx0QgJ1Si/3++s5MBeUPTLoE/GK6kZ4DZ48mQ7dyfF0LUpjjyEJONrLtT+1TNY3uQIKqA==
X-Received: by 2002:a17:906:c113:b0:a99:5541:e172 with SMTP id a640c23a62f3a-a998d19f928mr204232366b.21.1728477016220;
        Wed, 09 Oct 2024 05:30:16 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9944c6d6basm543582266b.145.2024.10.09.05.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 05:30:15 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-yarl: Upgrade 1.13.1 -> 1.14.0
Date: Wed,  9 Oct 2024 15:30:06 +0300
Message-Id: <20241009123007.1023153-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241009123007.1023153-1-leon.anavi@konsulko.com>
References: <20241009123007.1023153-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 12:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112730

Upgrade to release 1.14.0:

- Switched to using the :mod:`propcache <propcache.api>` package
  for property caching
- Started testing with Hypothesis
- Improved performance of :py:meth:`~yarl.URL.is_default_port` when
  no explicit port is set
- Improved performance of converting :class:`~yarl.URL` to a string
  when no explicit port is set
- Improved performance of the :py:meth:`~yarl.URL.origin` method
- Improved performance of encoding hosts

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-yarl_1.13.1.bb => python3-yarl_1.14.0.bb}  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.13.1.bb => python3-yarl_1.14.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.13.1.bb b/meta-python/recipes-devtools/python/python3-yarl_1.14.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-yarl_1.13.1.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.14.0.bb
index 16708fd1f..a7406dfb8 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.13.1.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.14.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "ec8cfe2295f3e5e44c51f57272afbd69414ae629ec7c6b27f5a410efc78b70a0"
+SRC_URI[sha256sum] = "88c7d9d58aab0724b979ab5617330acb1c7030b79379c8138c1c8c94e121d1b3"
 
 SRC_URI += "file://run-ptest"
 
@@ -20,6 +20,7 @@ RDEPENDS:${PN} = "\
     python3-multidict \
     python3-idna \
     python3-io \
+    python3-propcache \
 "
 
 RDEPENDS:${PN}-ptest += " \
-- 
2.39.5


