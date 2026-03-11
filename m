Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1379FD065E
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 08:52:29 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16100.1773219145165492026
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 01:52:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KNslpK9j;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4853f2826f7so28878975e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 01:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773219143; x=1773823943; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HYKybnjLDfFkEGOsgJIvyj9lkEIUdodh+JXg2zoWIxA=;
        b=KNslpK9jmpjHOH8sFuRlQh7pCWr7Z0wKApZD2IU9fXEyosw+f2MV1Z3un763MJU6d3
         Q2Jllt+OXqGXYl15T4AVn18c//bOjqe1FAM5lFli8XCsvoFO84o4m69Dt/7cJVPIQY9W
         a7zAlTi/WM/Bwo2K2M7socLbgowUMBTtYQ0p2ERuzG5DzsHd4UWeBP01w9FudBVEOAjM
         gitAhxl9UYIw24/e9vukSpoq2L8GFDK6m7gpWXxjtN/On1Fsc9ECMO6HbribFQJz8X9+
         2n29pz7CBGeNd+wEmw0n7zDHq/oS4UKGa5clUsGTGWMOS/rZtDoFaGmO2NMQhh7yZx7s
         ddEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773219143; x=1773823943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYKybnjLDfFkEGOsgJIvyj9lkEIUdodh+JXg2zoWIxA=;
        b=orKKZnvvUa1KxMMUJZw1k14HQJZ+McfjydRR1rRy7inlbg3W+2hJo48lnEuodG2QQe
         hwlk6a98PMvUZe8/vFhi4ZmSLF2G/uBuBnMuqR2KQRKO3EfXNqD2rI+jzihBBrkkIjV8
         QgOeELMhzUcBDJS7w+Z6VDRlCYCg8Swx3eDjR8iX8JooWCMN/VwcaMAKUiJ77IPwIguH
         l0SWihjZb6j9p4Eb7ZCL+d+NbQY+F8hQ375WFRCA+FFb/hR4Zi1sXFoUe/dRZuX8xSNC
         rnweIrSu3hyk1dnIcslX/wUD0A9eVcq9w3yrNxZuGiz5202m5H8ux+yxI3DvsJxbtSe9
         935g==
X-Gm-Message-State: AOJu0YyfWJVBMMvOI0I4SPnZAqC+F4BazlUP8DheXdA0svxpYTMaq9u0
	43ho0bhd6ZmMh0b5HffjnhEyUPtZ+fFG01PPlD3mh+wBUm+ilQfWbXlT7t1wbQ==
X-Gm-Gg: ATEYQzzHHXjEnGiPOHUwZstSByWv0UiYlzjqFIm1ejFCk9XakxYGyZE6fH02l0xNuzF
	9JCn8Ne422Z9IcJxjZEPYxDQPSxqn9s32ezFhy7PT/LTovVxEcSwJhPknL9vAzMQkg3Hjrc7ySn
	rz0A5HK7jerL0e7bbNKGk2eJTJnObVc5T5j5+BKMzk3oWKZ2Ni5dPHWC/mM3NTrpAFnwfZmDyaB
	rAcEPz2NnOTgv5OgJhhmGr2pt5MJOjdkndisOI/hy0JnZkz3P+e5L/uZLJPz5NLWtc+U1KCqRm+
	0pwwbm38cCwMZdsjOJv45AZPvIY8/Rea58duFAnIIX1Ku+0yQM/Ck4EKvGQjTvi8eqQUWzukMGA
	IJFQEY+4QlOYwA/IUBKI8cqTNHgEUsMvAoXK+XARAiquXVfcWl6BPGKmfAW+JtIrulZwIAJgE2W
	OQJuHVjkfZA6U0nAfMLC0X
X-Received: by 2002:a05:600c:8b65:b0:483:6d42:25c6 with SMTP id 5b1f17b1804b1-4854b10f1ffmr27636935e9.23.1773219143202;
        Wed, 11 Mar 2026 01:52:23 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854a18de05sm16169265e9.0.2026.03.11.01.52.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 01:52:22 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH] ettercap: patch CVE-2026-3603
Date: Wed, 11 Mar 2026 09:52:21 +0100
Message-ID: <20260311085221.1597448-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 08:52:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125071

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-3606

Pick the commit that is marked to solve the related Github
issue[1]. Its commit message also references the CVE ID explicitly.

[1]: https://github.com/Ettercap/ettercap/issues/1297

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../ettercap/ettercap/CVE-2026-3606.patch     | 48 +++++++++++++++++++
 .../ettercap/ettercap_0.8.3.1.bb              |  4 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3606.patch

diff --git a/meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3606.patch b/meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3606.patch
new file mode 100644
index 0000000000..8affaffce5
--- /dev/null
+++ b/meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3606.patch
@@ -0,0 +1,48 @@
+From 94c25ba50ed6e83b20527acdbc3f54edafef9c93 Mon Sep 17 00:00:00 2001
+From: Alexander Koeppe <alexander@koeppe.rocks>
+Date: Sun, 8 Mar 2026 17:57:39 +0100
+Subject: [PATCH] Fix heap-out-of-bounds read issue in etterfilter
+ (CVE-2026-3606)
+
+CVE: CVE-2026-3606
+Upstream-Status: Backport [https://github.com/Ettercap/ettercap/commit/41c312d4be6f6067968a275bf66b2abd2a0ba385]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ include/ec.h                  | 6 ++++++
+ utils/etterfilter/ef_output.c | 4 ++--
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/include/ec.h b/include/ec.h
+index 4e363b0a..66da146e 100644
+--- a/include/ec.h
++++ b/include/ec.h
+@@ -81,6 +81,12 @@
+    ON_ERROR(x, NULL, "virtual memory exhausted"); \
+ } while(0)
+ 
++#define SAFE_RECALLOC(x, s) do { \
++   x = realloc(x, s); \
++   ON_ERROR(x, NULL, "virtual memory exhausted"); \
++   memset(x, 0, s); \
++} while(0)
++
+ #define SAFE_STRDUP(x, s) do{ \
+    x = strdup(s); \
+    ON_ERROR(x, NULL, "virtual memory exhausted"); \
+diff --git a/utils/etterfilter/ef_output.c b/utils/etterfilter/ef_output.c
+index 2530e599..2f49177e 100644
+--- a/utils/etterfilter/ef_output.c
++++ b/utils/etterfilter/ef_output.c
+@@ -150,10 +150,10 @@ static size_t create_data_segment(u_char** data, struct filter_header *fh, struc
+ static size_t add_data_segment(u_char **data, size_t base, u_char **string, size_t slen)
+ {
+    /* make room for the new string */
+-   SAFE_REALLOC(*data, base + slen + 1);
++   SAFE_RECALLOC(*data, base + slen + 1);
+ 
+    /* copy the string, NULL separated */
+-   memcpy(*data + base, *string, slen + 1);
++   memcpy(*data + base, *string, slen);
+ 
+    /* 
+     * change the pointer to the new string location 
diff --git a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
index 723d7c8f78..b7f550ef7b 100644
--- a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
+++ b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
@@ -21,7 +21,9 @@ DEPENDS += "ethtool \
 RDEPENDS:${PN} += "bash ethtool libgcc"
 
 SRC_URI = "gitsm://github.com/Ettercap/ettercap;branch=master;protocol=https \
-           file://0001-sslstrip-Enhance-the-libcurl-version-check-to-consid.patch"
+           file://0001-sslstrip-Enhance-the-libcurl-version-check-to-consid.patch \
+           file://CVE-2026-3606.patch \
+           "
 
 SRCREV = "7281fbddb7da7478beb1d21e3cb105fff3778b31"
 

