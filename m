Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C95CC38142
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:37 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.2059.1674324087091825361
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WMLQg05g;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id b10so8403175pjo.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMWUrQlJVWoll8Fiyc3ZC9IPj2hU5xdcLKOrJw0OvNk=;
        b=WMLQg05gLA3YOpbORdRR4+80U0gqqUAAha3fNzWRrcSqw9bRx0U9LIX5We+t2ZzQD/
         sh0ndIapphXdRiiP0iouzNnNsLghM/M38ivZQAyj+Pl4/Zeqr/ovWCttH2XlS/ZqgSw5
         nC6XcJwaCTpCMbIWCJNEMbyqmTZWKCVnkzwqYDuW1gOTScTS8ascRsNqKarTRJyUD5y7
         B7t2TEC0ghWCXAVZGQu7yVwkXm2MufBa3PLoZKN34hmufgreV+pTTmgTHjk5O+69qO/p
         7iYmqnkDb7mCYkpq8p08Jubn5vRmmJyZSCcdrsgsV9OYQj+zSoiMMmmRTEBB9mAJSHKt
         ZSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMWUrQlJVWoll8Fiyc3ZC9IPj2hU5xdcLKOrJw0OvNk=;
        b=MoQBAlwUuRoHxAmn5vJWCZdEUWf6091PQeFEBH9481U74zxlYrwAk4pTx/s+Dxg5tN
         CmyV+88j2YKgX5oQPwEBp3kzmURURazrPmNebYh+Y8lYS4GyETgJZ7JSjm9ryu4SMlwX
         d8f1j/iq13FQOgqIL/xrqjcAijqx6Hcme/jq07+o5/f4nic/0aVyGyihL2l8pMhAbtYF
         +1zJJPFxLhOhWjpNOVmldli5RaAY+J782LcM7MSPD35STSMiLGEZ0fEoWfuO+2vgay+Q
         Skvrp4LXQeMeinWj1LARPCMy9/upziSt66UL32GcGuGDXCcrOPudB50GZnPXDEQWLRy+
         18sg==
X-Gm-Message-State: AFqh2kpOqF6RuN6KAc0tokTIZDj9TctE4OmIDGcatMq/VD86oqNj5NHc
	GWjOv4ZR4F50OC99pwkcOq5XZ7liT+DyyA==
X-Google-Smtp-Source: AMrXdXvQLfgtul7tzn5rAAzyfZCma3074mAHnA2qKrsb5Fhbf9eodkoqxdk/KIvmKpdH17c69Ym8cg==
X-Received: by 2002:a17:90b:208:b0:229:307f:8832 with SMTP id fy8-20020a17090b020800b00229307f8832mr19856437pjb.37.1674324086194;
        Sat, 21 Jan 2023 10:01:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 03/30] satyr: Fix build with musl
Date: Sat, 21 Jan 2023 10:00:54 -0800
Message-Id: <20230121180121.1229895-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100670

Add missing typedefs for __compar_fn_t and compare_fn_t for
non __GLIBC__ case.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...mpile-failure-against-musl-C-library.patch | 24 +++++++++----------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-support/satyr/files/0002-fix-compile-failure-against-musl-C-library.patch b/meta-oe/recipes-support/satyr/files/0002-fix-compile-failure-against-musl-C-library.patch
index b6c32c4bd5..24efc13560 100644
--- a/meta-oe/recipes-support/satyr/files/0002-fix-compile-failure-against-musl-C-library.patch
+++ b/meta-oe/recipes-support/satyr/files/0002-fix-compile-failure-against-musl-C-library.patch
@@ -10,19 +10,17 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  lib/rpm.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/lib/rpm.c b/lib/rpm.c
-index 920e145..58140bf 100644
 --- a/lib/rpm.c
 +++ b/lib/rpm.c
-@@ -191,7 +191,7 @@ sr_rpm_package_sort(struct sr_rpm_package *packages)
-     }
+@@ -34,6 +34,11 @@
+ #include <assert.h>
+ #include <string.h>
  
-     /* Sort the array. */
--    qsort(array, count, sizeof(struct sr_rpm_package*), (comparison_fn_t)cmp_nevra_qsort_wrapper);
-+    qsort(array, count, sizeof(struct sr_rpm_package*), cmp_nevra_qsort_wrapper);
- 
-     /* Create a linked list from the sorted array. */
-     for (size_t loop = 0; loop < count; ++loop)
--- 
-2.8.1
-
++#if !defined(__GLIBC__)
++typedef int (*__compar_fn_t) (const void*, const void*);
++typedef __compar_fn_t comparison_fn_t;
++#endif
++
+ struct sr_rpm_package *
+ sr_rpm_package_new()
+ {
-- 
2.39.1


