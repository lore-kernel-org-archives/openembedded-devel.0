Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23240.1794814555039657692
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 23:35:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hchUctS+;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso23123445e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 23:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794814553; x=1795419353; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2pCiqBwX12vZSHKpUR/Tr/AwTN6eDPSF7d+ngS0Cq1U=;
        b=hchUctS+m4F9ajMmIerMrksgt5m7TL8cD/xtczuMNZ/g5B8Kch+j1bL4O0O65VKMQf
         YkxvML2qeKGKPlyBNAIUDL618Op6HhLh8Amlu4pbZ3804fNN7DjeCIJLuC5G6UNnZU2j
         9qvd9vQPXqrYTY8P5vZ05fqQn6RunmN6w9ZEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814553; x=1795419353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2pCiqBwX12vZSHKpUR/Tr/AwTN6eDPSF7d+ngS0Cq1U=;
        b=yLSlUKdp2P+rsJ4PV5lH8nfEtp8mjzIX0jpUnaTe1L+PVJVlxOuYOBKyxHMNDvAbxk
         tH/PTpYZI/qES74Wj389DaI/nJVVI0jUyYgY0gxRy9vnzrNf6Ea2MPMw/+X38B+0uFRK
         lWZRmzFkiVq30aOkfyDwX25+OrBX0QmfbrpQsadAgr7MYlQNm/KIEIAX9jDx7uWFQVq1
         pdGh3TKfjOkv8gFr1d5sXsHonNKM/7lvgLaECda7hGmh8MAPIXh68EY+odNTDCuzjAGp
         sQD76EQ7OMbZWmHoHdKf3ZWhhIwddJGYTmF7ne+oT4EZZ77m9LmW2YwvFQRUIaaHenre
         8pPg==
X-Gm-Message-State: APuU4Z/gasl09GeA6gBuVFQMl0nDfycch0f65nKzZgFiiZkd8lf/jyaE
	fNQfMTPmqpJcj4Bq/KcvYj5Zr2CLKKbWGrle1ker+dzQwzF6G8CX5d/BnTVGrkAvJ0Eu44RVtW3
	EoXqP
X-Gm-Gg: AYBFou1QJwnB7esi8eVVHgVFFXjFvmDeDz1sEHuVbSxAWoMdK8zX+Wzq1bvbBeJ9Hs+
	uvWlJYfTv+oZWkzmWUACwgZcIz4rszlYiRut6ONNw9/SylYINVn/Of2jTb6zhT9vG//TRrCI1yV
	RncWJkoyhJo3VxqcbQ67sC26eJDUMdfuJaEx+CEris9G7QpEwfIwyyNp4u+iL7npyd1l8Yvgg3m
	M6RXPwhgnwg4MKC3OJbqS6nEyOgbVmYtVkwptTQbZCNeU0n2aQ4sKPx0DBMhF/2vZ5r9B0pQxIq
	KYMiwkJZMd59BP4/bd3PTJiGloZoOP5x3yL6Avdhpp7V/Lz02UPGoKkGnAVqP4O6m6ZIHn6aAx5
	8SVBaHt3GEUJ5XZDhZr0kVC8bI5bjM4EWOB/y+iEiXXdyB7D1Pvfjxj/jtrDgrfHDboDd09DWyB
	St6ris9ejG8PERlycN8X5JNoYCCRHDFEz2RyUk9baS2QOfUwNk8ufXwvUrtoPOw3BAaWT091CgI
	FTzozP191rEI/R2e+GP6g+vY1sdZa6LPSDoVUVlNFV5kbOKXWu11XRzxFhA07jd0b2R8uzMeP3O
	My9lWrR5z4mb9dK0FjOVA/woEBN9+mdP4Hd71UjM6ijDWDHymnxp5xZuYMRDGvBYiNSuPMbFB3P
	lDpq3PxaXb6JEi2vNGpPgDKSdf0wX6YrLKW981aisp37wkFLCovu5EA==
X-Received: by 2002:a05:600c:34d5:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4bb55ab1610mr190478345e9.26.1794814553347;
        Sun, 15 Nov 2026 23:35:53 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm289781975e9.10.2026.11.15.23.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:35:53 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 22/24] python3-xxhash: Upgrade 4.0.2 -> 4.1.0
Date: Mon, 16 Nov 2026 09:35:29 +0200
Message-ID: <20261116073532.880420-22-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116073532.880420-1-leon.anavi@konsulko.com>
References: <20261116073532.880420-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 07:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132450
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.1.0:

- Dispatch XXH3 on x86 targets at runtime: link xxh_x86dispatch.c
  into vendored x86 and x86_64 builds so one baseline wheel selects
  SSE2, AVX2, or AVX512 for xxh3_64 and xxh3_128 inputs longer than
  240 bytes, including streaming update(). On AVX2 those inputs are
  about 1.5x faster.
- Upgrade bundled xxHash from v0.8.3 to v0.8.4.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-xxhash_4.0.2.bb => python3-xxhash_4.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xxhash_4.0.2.bb => python3-xxhash_4.1.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-xxhash_4.0.2.bb b/meta-python/recipes-devtools/python/python3-xxhash_4.1.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-xxhash_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-xxhash_4.1.0.bb
index fd2ce3be5a..65b540b2f4 100644
--- a/meta-python/recipes-devtools/python/python3-xxhash_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-xxhash_4.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c6a4f6d709b13927e4d5e9ff13cf8956"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "af3d1b3cfa5280e84d8968e9f30c9eca75781db4915eb6d6acb0dd4fc93e0f47"
+SRC_URI[sha256sum] = "c9b288e4c1f5dae54417bc8a05e6f6daf505783d916b4783f4dd2f2e7d5db486"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.47.3

