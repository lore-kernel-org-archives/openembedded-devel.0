Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9723BC5DF72
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:00 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24523.1786747615143523182
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pChlN7hL;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so2102132a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747614; x=1787352414; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhR3QkYI3XjegFsT6FxNf8g3CiJ+fGgFQyYpEAmGUJY=;
        b=pChlN7hLBvJ6SgAn0WsRMOJ0hdR83oEpwdgOvn6vRcm4CrlZKZf/u73TqfPpNWIGss
         dBfNv/AHCkDWL4EeEzOCMT38LZ5ruqS5MGFROgA7zbRUQxTM+cN37NPFxrmnBG0dHm1V
         8V5PLsbyw4a49qc1a3Q+X0vTYrrsIt2kJtPi57a9Tp/4JVSGmZ5Y4Bff/678KU9JZllx
         ndwXAaxNpA2ecD15oC3WFKwMl0XcinaocNo3bUlvQg0XtvtBzjVDeqwArw7XpnlHRSa1
         IC8pUga4vpVo1AxM+Ulj+PZlhdYr667IaXCdZpybsF7jyg1oUg2J5gh31EV8UikElkHN
         eKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747614; x=1787352414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jhR3QkYI3XjegFsT6FxNf8g3CiJ+fGgFQyYpEAmGUJY=;
        b=Q33WAsF86wJW7EvpWR1o82xT9zaHHS2TeByVwthAoh196NIlzzGEK4qHrYSC1KmxjG
         kW9oMNLU7Kfs+So7BHbptN42379ZCYiyO/oc/5BRgHD1cP4U+YjwdEyBfm1u1qlUZAMh
         eMwhN5WZFE0A37dY1VIqAHHpuUstk6Se15RiDq4R/AXkNoB/8+ji/oBP8oAJ4kr+vIpD
         Vn9oUURPZF7Y1JOTKivxnsB+iYU4QKt4FOWdkuAH/JWKH+XpoobWi33oEj38eIXI/58s
         q+xfH3UeFvT8nuTVZ1KinDlzNnmZ8zCV/SOIlXXCc33Hs+L2RqtXzmQv72zfrZAAl3tn
         GfdA==
X-Gm-Message-State: AOJu0YzvN4WpL6rJjN63VDSpBMw/a0tRVqOqmua5QgXfrpxtR2U1cQea
	QaePM/G3/uK36duL1JStUiCMc4Fkdrkm6ybjqFAzk/k/+q9RndbDrw+qhOjqa+Mu
X-Gm-Gg: AR+sD12ex55CarDGAxPP3uXjHUJct00ZvUW5+qSa8+SifbahNAGiqx7JidG2vpOZgcj
	cUEG87D/WRrjNQ67aB9OQjwpsPM3o8KIEwPO9F9+RSjs8EGigdh24ll9MjATsWSwHyWlLUNgdqj
	oKgP3LoNllv9XTqXGCBBSzCCXt1Qo7YGjqilSFwN0BKlILgTD8S1pWufluQIlJerno3qNUpbyVU
	DuQ6OzmuemZ2k3LBeX7sQ1eoPg31wAyEmepNV7oYDvn3s9CLK10F5LiLRNnGOt/U6aJ/ulTghgI
	n5dDpqkB8oixlzMVpEo/Bh9NsGpe+NRWcvrtdR0z3mTfYyy3ThIP7GZo2cSpMHR8DHLfI1YQJNV
	DSXzQUIqcyFibwFNBqzxUvZxBYMTArcqB5ZSMSKzCnuwWXo6ESg+HpHShSGxL4p3sNIFbWY2TSR
	LzN4mM0eOR3zv9y/i4qb3ZdBBh4GuPt6diPFu32+9SzsugeAvKG4vfuZRo8UL+oIueWT0o+dc1Y
	BMjF2j/um3xgYGUjaCcM4u1QYExpIABnu4zNUwwelxlJySB6S8Mr9mqqhil9McxaKK5Yx/mEGoK
	rSUCQ5za2mNmnBp38DZw7ePbEU4F74IxUSKjaWsRUp1JDqQR4jqp+4Nz0JuN3KW5RD/q6g1Yrse
	+aFmGjw4liaU3DEV9kW++tAdoZIkND0cx3vYp5RbSIChcHg==
X-Received: by 2002:a17:90b:2891:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-3933b8e1ec2mr10649386a91.11.1786747614495;
        Fri, 14 Aug 2026 15:46:54 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 065/109] wtmpdb: upgrade 0.11.0 -> 0.75.0
Date: Fri, 14 Aug 2026 15:44:51 -0700
Message-ID: <20260814224539.1523174-65-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129129

Six minor releases spanning ~15 months of development on top of the 0.11.0
snapshot the recipe was pinned to: 0.71/0.72 added man-page and import fixes,
0.73 broadened -p time-format support and added Hurd CLOCK_BOOTTIME
compatibility, 0.74 fixed the varlink interface name, and 0.75 uses an empty
memory table instead of failing on empty-file reads. SRCREV points at the
v0.75.0 tag; PV matches the tag so the check-version-mismatch class sees a
clean release.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-include-libgen.h-for-basename.patch  | 32 -------------------
 .../{wtmpdb_0.11.0.bb => wtmpdb_0.75.0.bb}    |  5 ++-
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/wtmpdb/wtmpdb/0001-include-libgen.h-for-basename.patch
 rename meta-oe/recipes-extended/wtmpdb/{wtmpdb_0.11.0.bb => wtmpdb_0.75.0.bb} (91%)

diff --git a/meta-oe/recipes-extended/wtmpdb/wtmpdb/0001-include-libgen.h-for-basename.patch b/meta-oe/recipes-extended/wtmpdb/wtmpdb/0001-include-libgen.h-for-basename.patch
deleted file mode 100644
index 766865e27b..0000000000
--- a/meta-oe/recipes-extended/wtmpdb/wtmpdb/0001-include-libgen.h-for-basename.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 32f99ce7e890a457af50606ea7b577659a2a790a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 25 Mar 2024 17:35:07 -0700
-Subject: [PATCH] include libgen.h for basename
-
-basename prototype has been removed from string.h from latest musl [1]
-compilers e.g. clang-18 flags the absense of prototype as error. therefore
-include libgen.h for providing it.
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-
-Upstream-Status: Submitted [https://github.com/thkukuk/wtmpdb/pull/11]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/wtmpdb.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/wtmpdb.c b/src/wtmpdb.c
-index aac7b5b..eaffae6 100644
---- a/src/wtmpdb.c
-+++ b/src/wtmpdb.c
-@@ -30,6 +30,7 @@
- #include <time.h>
- #include <ctype.h>
- #include <errno.h>
-+#include <libgen.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
--- 
-2.44.0
-
diff --git a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.75.0.bb
similarity index 91%
rename from meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
rename to meta-oe/recipes-extended/wtmpdb/wtmpdb_0.75.0.bb
index 45097624db..4de0a300d4 100644
--- a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
+++ b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.75.0.bb
@@ -5,10 +5,9 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=020090a00b69dd2af9ab82eb0003ea2c"
 SECTION = "libs"
 
-SRCREV = "493e9704dbc50f141d5fbd41c823311e79d7e8d3"
+SRCREV = "a6f185a241ee633cbba600029ec153feb2665cf8"
 
-SRC_URI = "git://github.com/thkukuk/wtmpdb.git;branch=main;protocol=https \
-           file://0001-include-libgen.h-for-basename.patch"
+SRC_URI = "git://github.com/thkukuk/wtmpdb.git;branch=main;protocol=https"
 
 
 inherit meson pkgconfig systemd features_check

