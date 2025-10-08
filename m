Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F70FCAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 09:36:24 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.11865.1759916178662012755
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 02:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Av7B5JmL;
 spf=pass (domain: konsulko.com, ip: 209.85.218.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b4aed12cea3so787904866b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 02:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1759916177; x=1760520977; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FgYuxHJ/QmoxYKQD+dAT7yDD1KZ5pldK/u7+l6+mvc=;
        b=Av7B5JmL3nNiEf2lTr2fhe6Ib/97IvfSGwPJv2msGuKeRNMOX9AYxy2p4WyqYpnf1t
         SX+iTxV1uUcZG6o57sbj/GgA25cEuwrZAUYplY0bgmKdL3429BWcoZKOGJ4GRUZtBnK7
         jGIfTs3siOFeqVAM0tDrVLxJf+dAj9EWUOeJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759916177; x=1760520977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FgYuxHJ/QmoxYKQD+dAT7yDD1KZ5pldK/u7+l6+mvc=;
        b=GCD4fFFmo21wJ9aUuhOwSuhWO54HyVYvsf0hOTvPG8vxY47e5Ze6P9Cd46GgmBkAN7
         vU/4SQQXmRRci158VzSlZWr72YP9ZQvCC7WrsitJ516yClZGtv2CfIr+7MapvadLwJSK
         oCvgPQ+lvw489U4OIwSwKPnJe5RHNL1mBDxxCXQkVZInrMY8wPncAj0tqAR+ei0DvNTZ
         I3koMCemkn4R8ppvZUxvoCL95HyWFp9fi9NoZ4YnhaGiVKSnUgrKLqc8pd1TWZD0eMAb
         f04Gg1xsB7fX7x4Y2YZDlmF4QMSjIyNbzaTN9VCVNwW7PybuNwBk+f3AGMft3pOercoA
         jjyQ==
X-Gm-Message-State: AOJu0YyQwFH5Sfn7vNjFex1B3t2xhCVIiTuh3W2RPdS2tdcB3tDtbQCy
	x9AFrOPlLScZ12tGjG/3Slg94t0u/cOoTBH8cJbydkOaPJyhxWm3Dhlb6OLwrE9m77fPPJAySbd
	EYg1m
X-Gm-Gg: ASbGncsrFUHkI/0P+EfapJRZYQbXq0qYmDr64JbBzOqHPb7XpcFX0q1cU4bnaWkuuSp
	/bTdZTxMElld42wXzOeOwPbQljMmzZrsqIiq3JUUMxIiApnxFTeX7nrEgYwHMK1AqYvJ7WiEhAQ
	8B0aK4eOyKm8tGABGifhSTwI5XESTu4Qlhbs+/iD90RqRHAMqRJ5pJlbZJVaYEGCI3bx8I2nFx4
	PAC1lFffDqPFZA60NTz0LKULaT2FYA5XKKhajybAo9V6qMGB+X57u/eWW5bNPkabEmYHBTFdJH3
	rsdDift1LWpa4s7OwKoN+UMq7Js7Syd0OyemvG4uY2OMRefOTUAy8CpKzHIITneO3w75zRS9IUq
	TcaiX6RRf1ZWo9xcYo86kXXDqZRI04kIBV8Se3LB7qsv0iZu20uq9GEEabmXiQ4cfqWu7hwM=
X-Google-Smtp-Source: AGHT+IEyHemHLy2CNbCq4anq+Tk7Hd7E8H98dp3nl4tP7sfRhzZ+dCOSvdOxHYKVZVx8FN9CYCj7Qw==
X-Received: by 2002:a17:907:60cb:b0:b4c:2b0d:a2aa with SMTP id a640c23a62f3a-b50aae91a28mr319965166b.27.1759916176801;
        Wed, 08 Oct 2025 02:36:16 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865f74002sm1640078866b.42.2025.10.08.02.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 02:36:14 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-xxhash: Upgrade 3.5.0 -> 3.6.0
Date: Wed,  8 Oct 2025 12:36:08 +0300
Message-ID: <20251008093609.2094597-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251008093609.2094597-1-leon.anavi@konsulko.com>
References: <20251008093609.2094597-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 09:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120359

Upgrade to release 3.6.0:

- Build wheels for Python 3.14
- Python free-threading support
- Typing: Use Buffer type stubs
- Deprecate xxhash.VERSION_TUPLE, it will be removed in the next
  major release

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-xxhash_3.5.0.bb => python3-xxhash_3.6.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xxhash_3.5.0.bb => python3-xxhash_3.6.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-xxhash_3.5.0.bb b/meta-python/recipes-devtools/python/python3-xxhash_3.6.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-xxhash_3.5.0.bb
rename to meta-python/recipes-devtools/python/python3-xxhash_3.6.0.bb
index bfa14012d0..c62595c4d1 100644
--- a/meta-python/recipes-devtools/python/python3-xxhash_3.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xxhash_3.6.0.bb
@@ -1,11 +1,11 @@
 SUMMARY = "xxhash is a Python binding for the xxHash library by Yann Collet."
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3a9dab7f159514231249aa3e108ab26b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=82f3295151c5e61043a4a201c031a5ee"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "84f2caddf951c9cbf8dc2e22a89d4ccf5d86391ac6418fe81e3c67d0cf60b45f"
+SRC_URI[sha256sum] = "f0162a78b13a0d7617b2845b90c763339d1f1d82bb04a4b07f4ab535cc5e05d6"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.47.3


