Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70525F3D5E1
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 20:53:44 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.91787.1775595219614479738
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2026 13:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Uo9fkGSG;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43b949bf4easo150135f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 13:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775595217; x=1776200017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LBIQgvl/eoUEyhUZ6uiuukHUEANvAh6zaJTPrf8U+t4=;
        b=Uo9fkGSG6EJ5ow5qLVkzH8wHo2QMwapxqA0z4EWyzDdkWGrsj0LfQU9a06GX56/3Ut
         l8ZaL2IVK9WXdSmOA59aJFtO6jphDvXFZK9ICih88+15ClL2mYdUJjINBUfq8VDT1tnN
         Yy2eHSImHybMhV0AT3TB/XaaSAdADoscvb4V3U+x1xqcx+8OZmR+p7Sjwt+bbsDlhXKX
         NHVAbNgEOVN1mvTzlaY35QlEJkKZ2jOmlnoKIFfoDhfuPfkovkIK6AqlKy9OjAYkh4Mp
         Jdy3QM2cIHIOJZCrEaIA5PBrsli+ToBSFW7/5O4w6obLHLYze1L7zZTKFJLlmAQrB8a6
         YeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775595217; x=1776200017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBIQgvl/eoUEyhUZ6uiuukHUEANvAh6zaJTPrf8U+t4=;
        b=FRsS7n1Z8l0FJtCmBR2yUhZyI/6HHzx5INWGybrEv/C4UjIZOZGdhR/3ETMQu3avp2
         PBxrofKHKJ+D2hubYvt6X0IS0SR4gzhZxRW7y6FuHxeXM+DJ5aNaa3l7gTDafk7olUja
         hXHb4E3eXILu7J10ac9+DcWpA0t5cj1Vq+6S6PdWvZYoNY/D6AVzKWZQtozb722y5YjZ
         FgJzCZIJnBermIIsBBwfMo5+QpOkraokQ43XfuaBmoeMNcVCJi6m+5SnRgPD9ckn7UBP
         2Chc8rUmhwwpG44f4Vg0Ti4ZrnqkNaRPAEzA0pQzTDwBGKbYWYwhuVGcwh/RQLngMJwU
         s9zw==
X-Gm-Message-State: AOJu0YwCeL0m8lhOEQea7qhGFpPyNPQbvXQ7jds5jGptWgL3+4TU+mIM
	0Cr9VnxGoXYBYloH6phl5c/BD9wKPol2Q2ITf1U/IiGorTZyuQKbANy/+bGCUg==
X-Gm-Gg: AeBDiesEr/tC87szLDP67frKN/9AowNFpdEWSNjrYuzq165f3eH95xgSv/D482WxnE3
	jrWCQZdp8DlP61MDgJKO9iqP3ORT1hvvK3tQHEeXZXufQXtGsZRovnQPRRYQ08FKgWonQjjikJ3
	JqCpGWXQuWrssS2ZLnEWHP4sGW51KVJYK9YGSs7qzOt0TP8AGwK5a9Oo6i+ZBqAdj8zsxipeB0v
	dyqYuIzjb5Y3UfqGp7/U+g+UXtNI2ey0QOSCbGxKl5YE8LrRShHDy2Y86+kl7kvJMSbqMquUBc/
	EWFwOjdbiN2GK6GObP3VbzYM8c1TP5w/3WOT/cUiJZ1p44MpFzum3+TNOYRys0L1Fkr47EINICt
	vf9L87TxUtf8EzgZfPBNt4N/pPV/XJosrsSN4KeYVhTD3UL7W0jpv8GN6Oirh7B+C+49cEUq55K
	WZIBBHS1uuwRF6ZhtfjDfWp2IrpOUmtQ8SjvKatr9kPYq9NT/Q
X-Received: by 2002:a05:6000:2681:b0:437:7719:ca82 with SMTP id ffacd0b85a97d-43d28f8cd49mr27981691f8f.3.1775595217069;
        Tue, 07 Apr 2026 13:53:37 -0700 (PDT)
Received: from Unimatrix04-Noble.home ([158.47.230.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5016sm56665745f8f.33.2026.04.07.13.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 13:53:36 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [PATCH] ettercap: 0.8.4-> 0.8.4.1
Date: Tue,  7 Apr 2026 22:53:24 +0200
Message-ID: <20260407205325.2089688-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 20:53:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126091

From: Gianfranco Costamagna <locutusofborg@debian.org>

1. Changelog
   https://github.com/Ettercap/ettercap/releases/tag/v0.8.4.1

2. Remove following patches as they were merged upstream
   CVE-2026-3606.patch

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
---
 .../ettercap/ettercap/CVE-2026-3606.patch     | 48 -------------------
 ...{ettercap_0.8.4.bb => ettercap_0.8.4.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 50 deletions(-)
 delete mode 100644 meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3606.patch
 rename meta-networking/recipes-support/ettercap/{ettercap_0.8.4.bb => ettercap_0.8.4.1.bb} (93%)

diff --git a/meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3606.patch b/meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3606.patch
deleted file mode 100644
index e1b19ea05b..0000000000
--- a/meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3606.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From a7347f49b928f47fc37805c9f3a70a9487d45a65 Mon Sep 17 00:00:00 2001
-From: Alexander Koeppe <alexander@koeppe.rocks>
-Date: Sun, 8 Mar 2026 17:57:39 +0100
-Subject: [PATCH] Fix heap-out-of-bounds read issue in etterfilter
- (CVE-2026-3606)
-
-CVE: CVE-2026-3603
-Upstream-Status: Backport [https://github.com/Ettercap/ettercap/commit/41c312d4be6f6067968a275bf66b2abd2a0ba385]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- include/ec.h                  | 6 ++++++
- utils/etterfilter/ef_output.c | 4 ++--
- 2 files changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/include/ec.h b/include/ec.h
-index d69de613..80c7eaba 100644
---- a/include/ec.h
-+++ b/include/ec.h
-@@ -94,6 +94,12 @@
-    ON_ERROR(x, NULL, "virtual memory exhausted"); \
- } while(0)
- 
-+#define SAFE_RECALLOC(x, s) do { \
-+   x = realloc(x, s); \
-+   ON_ERROR(x, NULL, "virtual memory exhausted"); \
-+   memset(x, 0, s); \
-+} while(0)
-+
- #define SAFE_STRDUP(x, s) do{ \
-    x = strdup(s); \
-    ON_ERROR(x, NULL, "virtual memory exhausted"); \
-diff --git a/utils/etterfilter/ef_output.c b/utils/etterfilter/ef_output.c
-index 2530e599..2f49177e 100644
---- a/utils/etterfilter/ef_output.c
-+++ b/utils/etterfilter/ef_output.c
-@@ -150,10 +150,10 @@ static size_t create_data_segment(u_char** data, struct filter_header *fh, struc
- static size_t add_data_segment(u_char **data, size_t base, u_char **string, size_t slen)
- {
-    /* make room for the new string */
--   SAFE_REALLOC(*data, base + slen + 1);
-+   SAFE_RECALLOC(*data, base + slen + 1);
- 
-    /* copy the string, NULL separated */
--   memcpy(*data + base, *string, slen + 1);
-+   memcpy(*data + base, *string, slen);
- 
-    /* 
-     * change the pointer to the new string location 
diff --git a/meta-networking/recipes-support/ettercap/ettercap_0.8.4.bb b/meta-networking/recipes-support/ettercap/ettercap_0.8.4.1.bb
similarity index 93%
rename from meta-networking/recipes-support/ettercap/ettercap_0.8.4.bb
rename to meta-networking/recipes-support/ettercap/ettercap_0.8.4.1.bb
index 6fac3a0b84..a28de7b2bd 100644
--- a/meta-networking/recipes-support/ettercap/ettercap_0.8.4.bb
+++ b/meta-networking/recipes-support/ettercap/ettercap_0.8.4.1.bb
@@ -22,10 +22,9 @@ DEPENDS += "ethtool \
 RDEPENDS:${PN} += "bash ethtool libgcc"
 
 SRC_URI = "gitsm://github.com/Ettercap/ettercap;branch=master;protocol=https;tag=v${PV} \
-           file://CVE-2026-3606.patch \
            "
 
-SRCREV = "41da65f4026a9e4cea928e61941b976d9279f508"
+SRCREV = "0dc8409779f3a09cbfff4434b9a4d7b33480d88d"
 
 EXTRA_OECMAKE = " \
     -DCMAKE_SKIP_RPATH=TRUE \
-- 
2.43.0


