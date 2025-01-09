Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014E8E7719A
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 13:53:19 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.48590.1736430794069077862
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jan 2025 05:53:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=OfIPh7qI;
 spf=pass (domain: konsulko.com, ip: 209.85.221.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38a34e8410bso550154f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 05:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1736430792; x=1737035592; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=joe7snD5trZJh4Ala20YPPuTxUpxDExm6+QIIm4YBu8=;
        b=OfIPh7qIj+mZYdSn7t9Yf2DBu2IdFOo9HFaspy39bQAnPPkArJuVswu5TRUGh7qPDJ
         EnX14PWHnqT7WiGxqz7icZs9Gewd1ec1UJL/kFtPN0vxhUxBbuu+UcO4DeKiXqd5ZH4K
         nNULngdNQ+I09Z9pTN6vZ9bgQHOe7FswGiNGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736430792; x=1737035592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=joe7snD5trZJh4Ala20YPPuTxUpxDExm6+QIIm4YBu8=;
        b=XwCEDeqi4WvdPAap0DY6GY4XhhyFzyKYqBMr+cWRSGU4Yk+E9DnwTf6ypfoetw8Z/k
         qNA3cbvR1pvy+bp1d1U+iLiNk1RfmNlCij9ChItETIeXBHuCYs4OIl+idHLgThp01+3k
         lk4czj0QMaiQoIeCenvjSbUU9ZPiv2iiOGRaZ5lbMJBMzFY9fiCo/u/Br7mG5TpIagSB
         AUxD1mzrF00ASW4GAc8K1tUJlm8y/Ma4IPcsRmO8JwnCytN6dOcbrLJ6hgZJ55SKzzFV
         Qftpb653DuAwdtwCvSXlxdkO1aS1gCTicRdRf1dWwOw2ywKL21iCKKS4tILeF/+IEvav
         uIrQ==
X-Gm-Message-State: AOJu0Ywo7zKt5FIJqvvhQ0qhinJQjr1wwPN8oNHll9zIT/XHXrsDzvuZ
	Eqtlm+Ulq8L21zE34YGoYegGqk0LLleBJwn/mbJKWkwLwX98OSgw9gEX2X+4GmU/BVtxrR9p1FZ
	W
X-Gm-Gg: ASbGncugNlNQJoUeU252rNSVwthH44Z1bkjugNDtfK0ZI5hMBfXWn+wWLMF2i8bYDOC
	1S29jgXWWsfCCuRM6OZbcMZro6kl5yKEjNI3Qbn1fmVr7p90tEIm5C8BlPPjsXy97sHPwtiuijq
	8WpZ5ODHQtSOclKRdxSKm7pX0OHF1Lt8Jr10qqUpZtER3YXqzGJd+uBctXgMrKd0sVWCoxo8I4o
	yUkUiV2n4jUj6cg84/W0jOXmhK7lrswXV1N4hi8tOohG0pkc+9NQ1SEqtIFP7kMu+43au8=
X-Google-Smtp-Source: AGHT+IGrxHJAOjnEKkmxNdgN10HMtuO9rceOGb0tJiXTP+7Oh0a/OOmi4UEvgayEj3rvE61MGwhpjw==
X-Received: by 2002:a05:6000:490e:b0:386:32cb:4aa with SMTP id ffacd0b85a97d-38a8730ef59mr6517816f8f.45.1736430792244;
        Thu, 09 Jan 2025 05:53:12 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38332asm1870994f8f.23.2025.01.09.05.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:53:11 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-deprecated: Upgrade 1.2.14 -> 1.2.15
Date: Thu,  9 Jan 2025 15:53:07 +0200
Message-Id: <20250109135308.2948649-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 13:53:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114752

Upgrade to release 1.2.15:

- Resolve Python 2.7 support issue introduced in v1.2.14 in
  sphinx.py.
- Add extra_stacklevel argument for interoperating with other
  wrapper functions (refer to #68 for a concrete use case).
- Update class method deprecation warnings for Python 3.13.
- Update GitHub workflows and fix development dependencies for
  Python 3.12.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-deprecated_1.2.14.bb => python3-deprecated_1.2.15.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-deprecated_1.2.14.bb => python3-deprecated_1.2.15.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb b/meta-python/recipes-devtools/python/python3-deprecated_1.2.15.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb
rename to meta-python/recipes-devtools/python/python3-deprecated_1.2.15.bb
index 49d5f01c8f..46b8a19ddc 100644
--- a/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb
+++ b/meta-python/recipes-devtools/python/python3-deprecated_1.2.15.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://deprecated.readthedocs.io/en/latest/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=44288e26f4896bdab14072d4fa35ff01"
 
-PYPI_PACKAGE = "Deprecated"
-SRC_URI[sha256sum] = "e5323eb936458dccc2582dc6f9c322c852a775a27065ff2b0c4970b9d53d01b3"
+SRC_URI[sha256sum] = "683e561a90de76239796e6b6feac66b99030d2dd3fcf61ef996330f14bbb9b0d"
 
 inherit pypi setuptools3
 
-- 
2.39.5


