Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A267C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 10:10:29 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.47259.1739182228055672050
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 02:10:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=TH8or1rz;
 spf=pass (domain: konsulko.com, ip: 209.85.218.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaecf50578eso826192366b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 02:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1739182226; x=1739787026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NbW66DGg++JhW4rq0NEE2YoCppiqm6LNNCdURo+av9I=;
        b=TH8or1rzEUuqLbGj7KnBOYBhBy1GRkU3fXmm+uRsrO3dIH0YyQ7NFB+xtcYvfpG3jA
         AusqVJqDDGtcnskDhRNNjSg0eItt6MRpMmVx0tbGvph6G8AMHMjr6Mm8VH7wFuCv9s59
         lwczMRD2RAxHNlizbmKYLjwWGZbENMC04T4xE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739182226; x=1739787026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NbW66DGg++JhW4rq0NEE2YoCppiqm6LNNCdURo+av9I=;
        b=C0EOSqww5lUTHMyijtw8TKlFj8XWz0yE+ldoNgvOvEz1BNvmd7cCbTqPqwZmjTC70S
         /hD+SNrd3i64+fGd42x3q5y4HgHiapLl+AD9f4Cca63Up0UUJoAEB0GE4SGA3X6Gj//G
         nTUvxuPcv+o1BsxI7p6j9pX0ObDJ8cUmTO+Eo/u3VMLTVbZmMqiPHv/dqtCc0BMIg9dI
         sEcQA/WMk8Z2AMFBJ1u3ybVdC6NhKgJb5XiG6bdqx1gF+bQlIn7xpD7yJ5yMrRqqVsRu
         BJlDS5OZON3pSeqcEgfVKMIVi/B+VgP35Xx9EqnhqTxdMEIhuDF05xL88hCOR516iPBh
         0C7Q==
X-Gm-Message-State: AOJu0YxbPmuvUXvJUsgrA2c5bds5SjnDX45YSFKKVJFUXGXteYnC3md4
	+ap6YTqc0DqgIM6u/vLuANDgCmqhwWZaYbH4EnYH+EIfa09QSwADpTObtsYIJCt+EMn4ulI4auv
	W
X-Gm-Gg: ASbGncvg27KgRljsskaEWChvF2ELD07VfxGXvC6xRvoTWmIgp2wGYhAecXmU1zMzPIy
	h1QCFXt2q1vrwltpVGozT+xRBSqnT5OLxlhelM8haUot2dgOINhmAxRLHgsC5/xw/rBqnXdCBYl
	W6nec9Up5xrHGFqMlV7NvfygYWh5U7E6/HzK+fx91Mem+aiSszqkcogMui0dPVult8EF6inawrw
	OHV98PTXt2Cex6WISwhV1Q9lfttFkWIoo512u0nPh3f5A/Iu/02lJ82GiAZyESHeXYv2DF2+qk5
	Sbeyrer2KWw5GaTdI0yWbMVcwCSbSw==
X-Google-Smtp-Source: AGHT+IHl0onE66J09reyq1Stnx4DuFWzQjOwgvx6lQHLhQFzuYEbAjc4cbvXpekkUEuS0MdwgAXnvg==
X-Received: by 2002:a17:907:97cf:b0:aae:c3c1:1361 with SMTP id a640c23a62f3a-ab789c3e4femr1337790966b.44.1739182226153;
        Mon, 10 Feb 2025 02:10:26 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bb9cc86fsm242747066b.140.2025.02.10.02.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:10:25 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-aiohttp: Upgrade 3.11.11 -> 3.11.12
Date: Mon, 10 Feb 2025 12:10:20 +0200
Message-Id: <20250210101023.1204349-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 10:10:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115395

Upgrade to release 3.11.12:

- MultipartForm.decode() now follows RFC1341 7.2.1 with a CRLF
  after the boundary
- Restored the missing total_bytes attribute to EmptyStreamReader
- Updated :py:func:~aiohttp.request to make it accept
  _RequestOptions kwargs
- Improved logging of HTTP protocol errors to include the remote
  address
- Added aiohttp-openmetrics to list of third-party libraries
- Added missing files to the source distribution to fix Makefile
  targets
- Started building armv7l musllinux wheels

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-aiohttp_3.11.11.bb => python3-aiohttp_3.11.12.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.11.11.bb => python3-aiohttp_3.11.12.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.11.11.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.11.12.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.11.11.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.11.12.bb
index 3d4cb75e6a..07cffcfb02 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.11.11.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.11.12.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "bb49c7f1e6ebf3821a42d81d494f538107610c3a705987f53068546b0e90303e"
+SRC_URI[sha256sum] = "7603ca26d75b1b86160ce1bbe2787a0b706e592af5b2504e12caa88a217767b0"
 
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
-- 
2.39.5


