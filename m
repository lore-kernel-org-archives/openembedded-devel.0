Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A596C0218D
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 10:58:52 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.9326.1737716330668053193
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jan 2025 02:58:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dgxzYxAd;
 spf=pass (domain: konsulko.com, ip: 209.85.218.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aab925654d9so359071566b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 02:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1737716329; x=1738321129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGG7sfxiT8yCoBGbA9WXI9MnAnWPLLCGfNGufmzICrI=;
        b=dgxzYxAdIt7IZlR9nW+cqrAQqsQhpfuJuRz3kYHpqfspUxjnse65Dc3qkowVsfbWhG
         NSWL9A1yQTvFZmZWQ35nNJWtEZTLUKIt8DtBBaB8rYFY6DaiiG6p5ZVHonWh6mIh21k5
         S2WY2jlp/+ufIrJE6FwOc/j+qeZA8wlhcvlCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737716329; x=1738321129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mGG7sfxiT8yCoBGbA9WXI9MnAnWPLLCGfNGufmzICrI=;
        b=dkM1fV3Ie4UJYDccpV8GYCoCJrQpd0hAm59wtfrbbBnjKwD2u2UAeGdJaNO3KtgLCZ
         CQsKJ42eU0HEuyg/a9yuFHzTVT4zlezx7Hob+lN1TeYT0cYlSZ11S+Vo/bDPEmUSgm3e
         txhXDGTutuHsuQrhYmjuUNGqmex2PoUBecgjbI9h/kv1B5QYiFvqHlKdlVn8l3x59rp5
         hBfPeuKr2bYhUn0kEB5fgI5xu6mqYAIgVD9MoXL903j/SYgoa+ZTGjvSpwXNL8O6B1yn
         69a28A2PM7LVrlnDGMCjCu8p1LQuKVsduodNCoitQ0m9aiS8Cff8LH34Qz/tNHbDPueh
         bQ4Q==
X-Gm-Message-State: AOJu0YxuW7gacL9qNJEEYm139ZM/N6aVHVeSh45zBxOTyNIUXUgEaG0X
	5wdAXVx0Bog+2J1cUTqKT78HUkh82TDllqJLe4q3gBzbI8rzRas7C+RYcUuuYTdf5z16O9vjRU/
	t
X-Gm-Gg: ASbGnctADfy3TxzYqDlP9f5amgc7IMsMVsl93AaRFbIaWseFULwHeKo0uQ6FBf+sUD0
	eBmmkUsa4jH1BaaqEpOdHn3gnBnhw9wLUL2fqLRp6jMj9im9Q/e6vSTAQfbHRyblTbwj3pEoV2i
	7feYr3+UqWwuH6L+EsmoIkVPQfrHInB8hLItPGRK73EDiwsAJqXxeDhfH0ag3PhaXGHW9OWXoGI
	FWIcZW4SSQ6c14bA2q2oYXCCPwJP4SDdMMnjUDu0wq76IJ0O5AKtU3/FjfNXFtF75K2LzXLgreF
	7v2NG7omrM+3Q2U/QY0J5BvCGpRcgQ==
X-Google-Smtp-Source: AGHT+IFNJUntBmnyxtveOKabdMjCkAcottTl2ppHpqZ7es6V3Dy+MQhDb9FKESmzFlzBErOPTtrOiQ==
X-Received: by 2002:a17:907:3f11:b0:ab2:aea7:510f with SMTP id a640c23a62f3a-ab38b320310mr2924027766b.30.1737716328724;
        Fri, 24 Jan 2025 02:58:48 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab676117260sm107842766b.185.2025.01.24.02.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 02:58:48 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-hpack: Upgrade 4.0.0 -> 4.1.0
Date: Fri, 24 Jan 2025 12:58:42 +0200
Message-Id: <20250124105843.2035512-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250124105843.2035512-1-leon.anavi@konsulko.com>
References: <20250124105843.2035512-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 10:58:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115055

Upgrade to release 4.1.0:

API Changes (Backward Incompatible)

- Support for Python 3.6 has been removed.
- Support for Python 3.7 has been removed.
- Support for Python 3.8 has been removed.
- Renamed InvalidTableIndex exception to InvalidTableIndexError.

API Changes (Backward Compatible)

- Support for Python 3.9 has been added.
- Support for Python 3.10 has been added.
- Support for Python 3.11 has been added.
- Support for Python 3.12 has been added.
- Support for Python 3.13 has been added.
- Optimized bytes encoding of headers.
- Updated packaging and testing infrastructure.
- Code cleanup and linting.
- Added type hints.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-hpack_4.0.0.bb => python3-hpack_4.1.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-connectivity/python-hpack/{python3-hpack_4.0.0.bb => python3-hpack_4.1.0.bb} (64%)

diff --git a/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb b/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.1.0.bb
similarity index 64%
rename from meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb
rename to meta-python/recipes-connectivity/python-hpack/python3-hpack_4.1.0.bb
index 9fc1d6c0d5..a5b9130d00 100644
--- a/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb
+++ b/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.1.0.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393"
 
-SRC_URI[sha256sum] = "fc41de0c63e687ebffde81187a948221294896f6bdc0ae2312708df339430095"
+SRC_URI[sha256sum] = "ec5eca154f7056aa06f196a557655c5b009b382873ac8d1e66e79e87535f1dca"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "python3-logging"
-- 
2.39.5


