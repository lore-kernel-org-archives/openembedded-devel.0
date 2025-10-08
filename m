Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631BECAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 12:08:25 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.14296.1759925295713130879
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 05:08:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ErDdbTAS;
 spf=pass (domain: konsulko.com, ip: 209.85.208.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-636de696e18so12652395a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 05:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1759925294; x=1760530094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nfev4DEZW1sYnr/mYarHBaCctBGopOKkp+13gbGAklg=;
        b=ErDdbTAS/kiRX4AsRZhKwhFcbKBBHh6mk1lZAlp7IhUcdjqoH+GGZXBF9U7+jWbqSy
         I0BbEPxZtwgE3GonMAAH1W59qLwy4WJZA2z+QJdaXK7q19nAmeGoio6SC+ibi1BvKpDx
         qCQXaYszyPLTRYFTEZ9e/vBVkN65iUlPpQvCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759925294; x=1760530094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nfev4DEZW1sYnr/mYarHBaCctBGopOKkp+13gbGAklg=;
        b=swxh7yE6uqM6J0V8C7oW3qVEnowTD9XzxXRBCNtM2naWdJgxLIpmZ7LkRtb1g0E55K
         babZGB46hkQd44oJxHWSplppju3Rn5MSYTSNSFdMNCX2NQbCiBvzalNum0kcP/KehOa4
         jZ6mduRTHmMLFJr+LuEb6Py+siKW23qfFKPXwQzY+8sa2ve43o+665urF3IgZHux41Su
         unDn2cHVawu5sd1lqQe2ciro6rKk9Gmw4jI4PKWZeEOPW6hkorNyq0GDj20NK55jZmeA
         yFoR8qtobOGSgEQW+KYpUQdbDdxR1L7+L7ybdJjuJkokZ27gpg/VPlG1qNp8V6lIprk3
         /SQQ==
X-Gm-Message-State: AOJu0YyuuJ78whnx4uQJH9MbQ9/VPJgibKzmC5NG35UbPyQr98LIx1db
	rXqgviOeBOKYKIm/TUlKoWaIVNZT3b6aD0k9D2YidcIT3W/HoYdLjcsg+pL2zH3+1RU0EB+cZGC
	gHcVK
X-Gm-Gg: ASbGncvvRG+oGWFyaG5/S8MVRVvwXR2AkL4TgxbzxaooBR6ZIIGOyQWn52Q/7D/Lm5k
	TRxH/FIxLjgLoo9VTPHghs1k6EHFOmTGdavsAVwZfUL1HPuIOUfLLO1w6LaX3VdCgQYl5taNL2B
	OIWrN3XS/9HgUKD2gJYn5QIzFGPIZ7p6YARhOzLM+rV3KYB/h6AGE1dMcnwOqFKDpVfeDlG2sW+
	c0WLZVxbB++afmwqIHlxWupWMtLYRjBXkHjt73hJEVRcy4wj6OzvLt7jz8i4TrjybqZWLqGwG++
	qjgAat43vvyVJOV9euPGxZKDmdrSYzxzHyIWQDF0h7MiWhUVIEC/zvdlFi5aPIOj+7vIX7p813G
	ZkgtH/8GfYj3ThyMqqE3FrJWk0fZba6XGv9uLRixNlX3Yy54fSbrqoIk7k/Lb
X-Google-Smtp-Source: AGHT+IFT5a2Jk7uTwNP31o40X9DowRaHgNhIABNa27o7JrhKxAeVL4g8PxOiYdQyVLNkn0mWogKyPA==
X-Received: by 2002:a17:907:ea5:b0:b3f:f822:2db2 with SMTP id a640c23a62f3a-b50a9c5b35emr348705066b.11.1759925293579;
        Wed, 08 Oct 2025 05:08:13 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b4csm1645487566b.86.2025.10.08.05.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 05:08:13 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2] python3-xxhash: Upgrade 3.5.0 -> 3.6.0
Date: Wed,  8 Oct 2025 15:08:11 +0300
Message-ID: <20251008120811.2119418-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 12:08:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120364

Upgrade to release 3.6.0:

- Build wheels for Python 3.14
- Python free-threading support
- Typing: Use Buffer type stubs
- Deprecate xxhash.VERSION_TUPLE, it will be removed in the next
  major release

License-Update: Update years

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


