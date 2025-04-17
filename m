Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1659C369CF
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 12:32:47 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.7704.1744893158292490051
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Apr 2025 05:32:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=oR+0Duln;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso4944915e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 05:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1744893156; x=1745497956; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QMHYXcctZO0WBaoG/ORxk+kSQl77e3np3CSZvfqXkOE=;
        b=oR+0DulnnhKQu3km0ZR+s858uadsK+mStMcTPSoJhKyhRQxraBPMPWuFLwmlBtO/FY
         9DGXEJdFBAbymSCKxbeQsXQd6gWFX1zIPkJWzs/lv42NQ1nD/xTlDI8k/BzrCauU6xIK
         j0O5UqvYcHbfwhApQ7+dapRiR1f5/kl/RTecA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744893156; x=1745497956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QMHYXcctZO0WBaoG/ORxk+kSQl77e3np3CSZvfqXkOE=;
        b=txzCCuucTfho9Y5gjiwEzqfS8m9F9dbKZ9LB+uad1cq3CQvHqdMHBl56k/lJo7JA5F
         BxUoMpy9jN9hNDobmmK/+d9s5XWXBvWorSuBTytWbCJwNB0FqgkAFRTAGvzYXiFaeN/d
         Dm2dYX5EXcbS7ixvEldw/VXMwA71gpjEL1MaiT+auKlULSXVsLasZdPNCHFhxS1XXDy/
         VP3lZtlIKyIBMZwedz3BNh6W39tGm4N2sY/Kb279Qswo2qCwlebtUvcUajmvi1nrtet2
         Lx3tBB+7bliDuAew8GRiAzNF0JU3vNHySLN3nHz1/XAYVanyV2Q2tfpCJ3v1fmZHDRaJ
         RSGg==
X-Gm-Message-State: AOJu0YwHeb/Bov5Vln2pED6TJcgY1jX640AWsNmAEhtS5Ac3ltat4Rid
	tooJg1IwobXmZ2Od1Lhshps2Kt2tgphDH6qYiT825A7ICoZyaP3pRF45leH6vFIGf1F+kiMpZRP
	W
X-Gm-Gg: ASbGnctzEOrseplherfXQ+oDlKOTMTmzHFG3oSJsCQgmphsalZFIj6PQtCNKQQ7YpDq
	jyA9dW2Oe9foZ7fSVFHvpn9CGMpXw724vP9+aJ7Gwi8eiRv1IPrclu/+MW28S9mZZUJLRPj2g0j
	FijqQ2/UlkbuqIAssSKnU9Kw6cdFznTMTXjqDsEr2M2p5za7ulbPZh+wwi/TUrtKJRbRrLPFHGj
	MVhkgnTeGjmq+grh7hzP4U0GmTm7sWjf5CzSios2whaskBsKFee9EHJlimqwn2GpUjMuTpULDxS
	jxrzwaMySADRz0yowJ05Wfz0yTFIdzU8KjOyg2UBpASD+HJWkzBq9YI=
X-Google-Smtp-Source: AGHT+IGwHVifuGJ8/ozycCLGMwX0tjN+Jf+1MWM+mpKaweXJdZgvnnnIYb31eCEEpu1uIStTNdBrGg==
X-Received: by 2002:a05:600c:1e02:b0:439:9737:675b with SMTP id 5b1f17b1804b1-44063695043mr25701855e9.7.1744893156387;
        Thu, 17 Apr 2025 05:32:36 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96407esm20208804f8f.17.2025.04.17.05.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:32:36 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/6] python3-pytest-aiohttp: Upgrade 1.0.5 -> 1.1.0
Date: Thu, 17 Apr 2025 15:32:28 +0300
Message-Id: <20250417123231.3063208-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250417123231.3063208-1-leon.anavi@konsulko.com>
References: <20250417123231.3063208-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 12:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116933

Upgrade to release 1.1.0:

- Drop Python 3.8
- Export the plugin types at top-level
- Add host parameter to aiohttp_server fixture

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-aiohttp_1.0.5.bb => python3-pytest-aiohttp_1.1.0.bb} | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-aiohttp_1.0.5.bb => python3-pytest-aiohttp_1.1.0.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.0.5.bb b/meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.1.0.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.0.5.bb
rename to meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.1.0.bb
index 977ce807f9..7bd7e4fe8a 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.1.0.bb
@@ -4,8 +4,13 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c251ea89d32d196dddd14c669ed3d482"
 
 DEPENDS = "python3-setuptools-scm-native"
-SRC_URI[sha256sum] = "880262bc5951e934463b15e3af8bb298f11f7d4d3ebac970aab425aff10a780a"
+
+SRC_URI[sha256sum] = "147de8cb164f3fc9d7196967f109ab3c0b93ea3463ab50631e56438eab7b5adc"
+
+PYPI_PACKAGE = "pytest_aiohttp"
 
 inherit pypi python_setuptools_build_meta
 
-PYPI_PACKAGE = "pytest-aiohttp"
+PYPI_PACKAGE = "pytest_aiohttp"
+
+RDEPENDS:${PN} += "python3-aiohttp"
-- 
2.39.5


