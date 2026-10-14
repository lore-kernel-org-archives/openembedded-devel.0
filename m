Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 136B9CC6B2C
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 10:22:40 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10226.1791973358967315638
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 03:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oiCLE5sm;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso1460318a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 03:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791973358; x=1792578158; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/vHbvayGHu6W/Ve9I6tBnDBcTfFiTwvQUhhnB3sj67s=;
        b=oiCLE5smN/ZTHVQRSgsnE8p2kaDUgknGygQMb3hp+d70yfEf+aPKZ7avxIQoTSTdtd
         m7pxKYXDq1wvE4dmGG8oq5aIV3RSOsv7RtHufFhjfxgyeSWa24YrMM1D9ygrPenD4g0W
         aJyTNFfns3SmndtBh78mc6I5O0TRdSC8IoBZYdYdw4GzSc69B0TSrz6VBjVufQod5UAC
         P3Ejg6IbNn/ezjEhh7ehT1ydcI0ov7+TR5nxnZNSl8xbl1tenGbmwl4NwG1yKbs3j/ke
         mOm6Qj6yH1xi27TMgXhL4+1WSwyerILHEsEjXSvAce1u/csHbo6pO0bHuBIpyoQP4l29
         Z2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791973358; x=1792578158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/vHbvayGHu6W/Ve9I6tBnDBcTfFiTwvQUhhnB3sj67s=;
        b=CiDajK2J9uvesT8jluF1DCQUqKWrBcavvj0p7W1qK5XCNRHLsthASfxucb0ewdQHNJ
         2qz4R8AKHCW/6HaGaMYjOqHaholKHio2eFvSj/TWtCLecgm5f010zdJ6Ru5v0xgqWHjY
         R28GjidrvG9ljHlb8eZYET8q5njQMgbkeaBthB5oZ0HnXOuK/nDQKTGoI/m4PF69VU30
         ZgtDnsgMQzCInKszeG1ecw0I0nxfKequAoZL8oigaFvF3hd4DspgN2mLJ5lvwOEdK+IO
         vCtitzmHwuLLGdeM3Prprhy//VeQaLwkEhoyRZvDfaDZf2g5Zou5ZplFDFCADKPuUmFV
         zhfA==
X-Gm-Message-State: AFq9FYKYhH6Wa5xQA4yCU1mFJ222dZ4OZMABnXuV1BsxzS/Kooxba3o2
	xWhuY1B6kRrTOdFZ7Dh10spAsNKRX5CXnwPvM4NMeD8Ml6X261wLe+F13ACrzg==
X-Gm-Gg: AYBFou1/0uzsIuBKqkfYzSqxzUGLxGiC5lOoKsWwPbyCWpV81HYkTIxvdSGxd18Uzbn
	SSj4ZwwnSDfdvZo7gBVZEDHXRw70fEV6FGUwxHY4xFTXXR15TEDsExHNvaPsUdFIAqO6ZIURjtG
	dBRZ0Uh30OWkdvDePfdBWkks5Zjo0kMSEuFUFEmnoW6phipHQibcRu3L71MXgtGcQIAbqGpewd7
	YLjNO+7eQONAC2LxggcF1FshpsXu/yML5CE5q9qulA6mf3OKzTxDC9S+bS7zK5eKbwqiL7jOnoU
	STQe/nq31rAmzPsrEQLQXtDrJ2CbZLQZaujpVjAV+bfsXikHWLqqHFDr26gd/Vp6lQgW0sGZDif
	K2q8nvnouipNMeWynwmjznYjCKVII05n5ZsMqq6SJJ4rtFS7PBHcE/T5SSUjF04I7oWcB4owKTX
	k+0klpUtfL/mWFCbQGqBwDy9+C2fMeuZtV/hbp/2NnrECvQGUcRHW/KRYCuxG/nbwiOrecrIXjt
	9HAqB8Kze38BENIbnkX6b91Gqly2JX9jwYTuK32Cw==
X-Received: by 2002:a17:90b:1e47:b0:3a4:ee64:b82c with SMTP id 98e67ed59e1d1-3ab3b06bb4bmr12074816a91.66.1791973358334;
        Wed, 14 Oct 2026 03:22:38 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61170b7bsm4017740a91.16.2026.10.14.03.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:22:38 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 6/11] tinyproxy: patch CVE-2026-54388
Date: Wed, 14 Oct 2026 23:22:12 +1300
Message-ID: <20261014102218.880640-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014102218.880640-1-ankur.tyagi85@gmail.com>
References: <20261014102218.880640-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 10:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130892

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-54388

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tinyproxy/tinyproxy/CVE-2026-54388.patch  | 32 +++++++++++++++++++
 .../tinyproxy/tinyproxy_1.11.3.bb             |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54388.patch

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54388.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54388.patch
new file mode 100644
index 0000000000..4dc7f88310
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54388.patch
@@ -0,0 +1,32 @@
+From 2639058707dd9d199196b167823ba1865a60ea08 Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Thu, 7 May 2026 16:39:48 +0000
+Subject: [PATCH] reqs: prevent multiple content-lengths getting emitted
+
+addressing point 2 of #609
+
+(cherry picked from commit 364cdb67e0ea00a8e4a7037e2693e0711e816adb)
+
+CVE: CVE-2026-54388
+Upstream-Status: Backport [https://github.com/tinyproxy/tinyproxy/commit/364cdb67e0ea00a8e4a7037e2693e0711e816adb]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/reqs.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/reqs.c b/src/reqs.c
+index d5037cf..117d755 100644
+--- a/src/reqs.c
++++ b/src/reqs.c
+@@ -681,6 +681,11 @@ add_header_to_connection (pseudomap *hashofheaders, char *header, size_t len)
+         /* Calculate the new length of just the data */
+         len -= sep - header - 1;
+ 
++        /* prevent multiple content-length headers from being inserted */
++        if (!strcasecmp(header, "content-length") &&
++            pseudomap_find (hashofheaders, "content-length"))
++                return 0;
++
+         return pseudomap_append (hashofheaders, header, sep);
+ }
+ 
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
index f9d425b45a..cadddffa18 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://CVE-2026-31842.patch \
            file://CVE-2026-54387.patch \
            file://CVE-2026-55202.patch \
+           file://CVE-2026-54388.patch \
            "
 
 SRC_URI[sha256sum] = "9bcf46db1a2375ff3e3d27a41982f1efec4706cce8899ff9f33323a8218f7592"

