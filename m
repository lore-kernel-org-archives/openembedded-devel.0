Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC5DCCF9E3
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 03:40:34 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.959.1761363628566379946
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 20:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PvZkBEXB;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7a2754a7f6aso3428161b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 20:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761363628; x=1761968428; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHouysLw2ysBMKOY8yOHa4zUJM7H+b9pk8KNhjFS7Lg=;
        b=PvZkBEXBMBg4PPS0CkIxB4hfDI5Op+4ngFI6QW50PAtoqQUG9VnxtrS/MeTK8u7/km
         yip0LKZtayPXRCaLslyj2LURdICBU+JZkr13t9BNzpJHkXLoj9MRGFH2jO3BvC0He3iN
         lFbq0o6SJPZZpApiYbnJ01WiDBmfvdX2As33u5g/l2CGMuTQknrifHg2ve5uCP5dXFT0
         bVNMoHGJKac1ni/+swPjRpdv/GWjKQ6dtksgISuz+P1Hz5F3H6/wKPctJseQPhiqIZi7
         7qY2Iee/donvCcWDraenvabtJOOHtyVBGErM6wGsbXI3/ebf8xtUZCpQqBVgQouIkOmn
         MS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761363628; x=1761968428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gHouysLw2ysBMKOY8yOHa4zUJM7H+b9pk8KNhjFS7Lg=;
        b=imk2qGEdZ/hRqkAtZLL+WQBgxuL28jhR5aLpF3rBfzvGh9n0aitI/9dbMcLuUoJh+A
         y7ZpVkqU+WHBvQ1CsIGu8c8zfsskOpW/SsMfA8v/hzFCjMf1zlCCK1kzinanS5JeOej8
         b5RUCvsWAWcIoq3k/scEx9N/ghnvH57i018zIc5c2wgrxLdvCu21+cmxZ9I0roxXZzf9
         VpjGRyfrHCy36R6s216HME2yEMn/OKFMnmeYXiSzUv/pO6eCI8exi3HCeXvJp2yJONmh
         Y7wXcw/C9VZIqJ3Dl4WM4eaD67zsSp4og6iWOsfsLNXsXRkIHQzfofZLfuZK2/A7Jxwg
         uWwQ==
X-Gm-Message-State: AOJu0YyzZY8gtywM208dPhnDlHsjF1WcCtWCdbmxiKIdebsQqBN7STvO
	k9L8D5jlHBWOD+AWHOsOzhIBbRDJoDpDwgtkHzW9IQerj/RfAcGSXu+ZFiQXBvWx
X-Gm-Gg: ASbGncuQGJ2U0a4Ebp33Qck1WNFpSdVsZxeiHio6Yje4aPR2/LX67i7WDjkSBHMiCOq
	4Q0v/mXbBg9R39TW/H4SMauPRyCHKuOoKh+yW6zrj1Bah1QHR8fZWdrNglEfBkxaOkOUrO/fn4b
	uxWPr81gQO/9z4+C5XqxaP5MDZtvFFib5eF52WBhqnTa/fA8sz284dWBkc21Mh5I8UmBkO/FfpR
	VHLBhzM/rHW7296dK3xiVihsXsVQu5VnXjCA6Ol/q+RaJ3pC0DaGVxWKT55BLEjBn8TnMKYZ9mF
	HjhJpZo+ZCX6QIbpYLLgUQvvcHlNDBuaG2qrpmmCPNWNUPAreYz4prS5+8vM2eLSMLEbC3b6PHj
	BvYb7yTWQnE1XVPfbX3J4GzvHHbJfT3N2xfeJQcXCtmmN4WAVfEKO5l4r3hd9wT+6s+zSzS8FmM
	gL5eAhjGbY1SMpjDUbyhtQbpX/mfiJHwrDx2WrIQNzEbPMOrFrtLpNeXWUtIroSPTi/H2zpkyK
X-Google-Smtp-Source: AGHT+IFvav4b/+1FixSLFxaR617Hg4bDdViYQeNmTprSRVEoD/rMGvWq9JtMWCKr+QqNjZ5qP7AqFg==
X-Received: by 2002:a05:6a00:3a05:b0:781:d98e:ebda with SMTP id d2e1a72fcca58-7a220d2fbddmr35485614b3a.30.1761363627654;
        Fri, 24 Oct 2025 20:40:27 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::9dbe])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414012bf4sm808487b3a.1.2025.10.24.20.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 20:40:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 08/11] mariadb: Fix build with musl/gcc-15
Date: Fri, 24 Oct 2025 20:40:13 -0700
Message-ID: <20251025034017.2071643-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251025034017.2071643-1-raj.khem@gmail.com>
References: <20251025034017.2071643-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 03:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120992

Add cstdint for uint_64_t for more files

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-missing-includes-cstdint-and-cstdio.patch | 40 ++++++++++++++-----
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
index bc1b992919..4bbdd8c7eb 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
@@ -17,8 +17,6 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  storage/rocksdb/rocksdb/util/string_util.h                      | 1 +
  4 files changed, 4 insertions(+), 1 deletion(-)

-diff --git a/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h b/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
-index 7fb9d489..f7b4e6f0 100644
 --- a/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
 +++ b/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
 @@ -8,6 +8,7 @@
@@ -29,8 +27,6 @@ index 7fb9d489..f7b4e6f0 100644
  #include <string>
  #include <vector>
  #include "rocksdb/status.h"
-diff --git a/storage/rocksdb/rocksdb/table/block_based/data_block_hash_index.h b/storage/rocksdb/rocksdb/table/block_based/data_block_hash_index.h
-index f356395f..32152217 100644
 --- a/storage/rocksdb/rocksdb/table/block_based/data_block_hash_index.h
 +++ b/storage/rocksdb/rocksdb/table/block_based/data_block_hash_index.h
 @@ -5,6 +5,7 @@
@@ -41,8 +37,6 @@ index f356395f..32152217 100644
  #include <string>
  #include <vector>

-diff --git a/storage/rocksdb/rocksdb/util/slice.cc b/storage/rocksdb/rocksdb/util/slice.cc
-index 3c3656de..b18d7f5d 100644
 --- a/storage/rocksdb/rocksdb/util/slice.cc
 +++ b/storage/rocksdb/rocksdb/util/slice.cc
 @@ -12,7 +12,7 @@
@@ -54,8 +48,6 @@ index 3c3656de..b18d7f5d 100644
  #include "rocksdb/convenience.h"
  #include "rocksdb/slice_transform.h"
  #include "rocksdb/utilities/object_registry.h"
-diff --git a/storage/rocksdb/rocksdb/util/string_util.h b/storage/rocksdb/rocksdb/util/string_util.h
-index 7794dbb0..b480177e 100644
 --- a/storage/rocksdb/rocksdb/util/string_util.h
 +++ b/storage/rocksdb/rocksdb/util/string_util.h
 @@ -6,6 +6,7 @@
@@ -66,5 +58,33 @@ index 7794dbb0..b480177e 100644
  #include <sstream>
  #include <string>
  #include <unordered_map>
---
-2.40.0
+--- a/storage/rocksdb/rocksdb/include/rocksdb/trace_record.h
++++ b/storage/rocksdb/rocksdb/include/rocksdb/trace_record.h
+@@ -5,6 +5,7 @@
+
+ #pragma once
+
++#include <cstdint>
+ #include <memory>
+ #include <string>
+ #include <vector>
+--- a/storage/rocksdb/rocksdb/db/blob/blob_file_meta.h
++++ b/storage/rocksdb/rocksdb/db/blob/blob_file_meta.h
+@@ -6,6 +6,7 @@
+ #pragma once
+
+ #include <cassert>
++#include <cstdint>
+ #include <iosfwd>
+ #include <memory>
+ #include <string>
+--- a/storage/rocksdb/rocksdb/include/rocksdb/utilities/transaction_db_mutex.h
++++ b/storage/rocksdb/rocksdb/include/rocksdb/utilities/transaction_db_mutex.h
+@@ -6,6 +6,7 @@
+ #pragma once
+ #ifndef ROCKSDB_LITE
+
++#include <cstdint>
+ #include <memory>
+
+ #include "rocksdb/status.h"

