Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FF2C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 00:31:31 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.4798.1644280290958820194
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 16:31:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MedAkmh4;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id i186so15985386pfe.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 16:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A35RV4F9OGYVEzqAzM0tm9Iikb2jwRIkvBze8a3Ggpc=;
        b=MedAkmh4KKopdHYAbrhRBDgM4L7BwEi0Ok9f1O5qTXmYcBfZSrS0ub0PxqMxPL3phg
         aR12rm2TmHsX1WrZnHaoi3hU64a3SWoXK3EMn0lB3vn/CwRVRGZu3A6eKc4rjTKPl15A
         4fI01jP4GMdecWFpE5csiuTyf45JAbyd3rFPyx9Jfno7sSEeeQDxvKIvO21m4PRq0gjB
         xlDqAi7+fZz/BfYsY9dtUgmq48/uOm5FdEuP1YKkpvYqJlO8u7dhMci0S4wExvUyhfie
         g8WHgX7v4efgVB1LZ8Hpnut+qHNKTvnoWlCxeES752thECZOH4g9wQht/813M1AKZAEn
         mhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A35RV4F9OGYVEzqAzM0tm9Iikb2jwRIkvBze8a3Ggpc=;
        b=YwPXw+JU5fGcZdAmdIbcdM+GVZ2MgmXZ4h5An2z4MRp/HXflHnkRP9tQWNnVWMxA+b
         7p7C22F0s/XeTMFGtQUormf3boqMdlJInYVPZv+ULb4AjOw7xFm6wYPjMgAyQ9YJFrp3
         nHZCgE4DcWEYWXggS+cj9Ot0Cas0qtdekFmRfm8OEePmY6ZprdHCqXgWHji01pOzxvHT
         xl7WK7Q4+s5dNgTzMEBM6W/DshMiqkJfjkV2LgP3iocrRjQSTpTzC8pKmV1ZpBqpGX+y
         QXUoLuJ1QjuM+kdGKaJLbrXH4QWg+nj7jFeW+Vvbn13XV38paQZuK3G8SBSiC1X2L6QZ
         irZw==
X-Gm-Message-State: AOAM531Rc1uKNnETTovdMJpmF7yBMcdruSjpR/KOB2kLpvxn8Jv5uDfp
	bNCFxwmqzHSJb6MIzBb47FwL7KXE923n0Q==
X-Google-Smtp-Source: 
 ABdhPJwAhQY8ZKYneJQnGsKYxNYDj8cIFSg25flwms5ymDS/U+0fw/uE1dzkMeH8rLoO2qgnG5IBUQ==
X-Received: by 2002:a63:884a:: with SMTP id l71mr1485219pgd.589.1644280289957;
        Mon, 07 Feb 2022 16:31:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id pc4sm528099pjb.3.2022.02.07.16.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 16:31:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] openldap: Fix build with musl
Date: Mon,  7 Feb 2022 16:31:27 -0800
Message-Id: <20220208003127.3016638-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Feb 2022 00:31:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95258

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...de-ldap_pvt_thread.h-before-redefini.patch | 54 +++++++++++++++++++
 .../openldap/openldap_2.5.9.bb                |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-support/openldap/openldap/0001-librewrite-include-ldap_pvt_thread.h-before-redefini.patch

diff --git a/meta-oe/recipes-support/openldap/openldap/0001-librewrite-include-ldap_pvt_thread.h-before-redefini.patch b/meta-oe/recipes-support/openldap/openldap/0001-librewrite-include-ldap_pvt_thread.h-before-redefini.patch
new file mode 100644
index 0000000000..bcd1525b67
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap/0001-librewrite-include-ldap_pvt_thread.h-before-redefini.patch
@@ -0,0 +1,54 @@
+From 79381ab335898c9184e22dd25b544adefa9bf6c5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 7 Feb 2022 16:26:57 -0800
+Subject: [PATCH] librewrite: include ldap_pvt_thread.h before redefining
+ calloc
+
+This helps compiling with musl, where sched.h is included by
+ldap_pvt_thread.h which provides prototype for calloc() and conflicts
+
+/usr/include/sched.h:84:7: error: conflicting types for 'ber_memcalloc'
+| void *calloc(size_t, size_t);
+|       ^1
+|  warning and 1 error generated.
+| ./rewrite-int.h:44:21: note: expanded from macro 'calloc'
+| #define calloc(x,y)     ber_memcalloc(x,y)
+|                         ^
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libraries/librewrite/rewrite-int.h | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/libraries/librewrite/rewrite-int.h b/libraries/librewrite/rewrite-int.h
+index 4481dd3..5ec226d 100644
+--- a/libraries/librewrite/rewrite-int.h
++++ b/libraries/librewrite/rewrite-int.h
+@@ -40,6 +40,11 @@
+ 
+ #include <rewrite.h>
+ 
++#ifndef NO_THREADS
++#define USE_REWRITE_LDAP_PVT_THREADS
++#include <ldap_pvt_thread.h>
++#endif
++
+ #define malloc(x)	ber_memalloc(x)
+ #define calloc(x,y)	ber_memcalloc(x,y)
+ #define realloc(x,y)	ber_memrealloc(x,y)
+@@ -47,11 +52,6 @@
+ #undef strdup
+ #define	strdup(x)	ber_strdup(x)
+ 
+-#ifndef NO_THREADS
+-#define USE_REWRITE_LDAP_PVT_THREADS
+-#include <ldap_pvt_thread.h>
+-#endif
+-
+ /*
+  * For details, see RATIONALE.
+  */
+-- 
+2.35.1
+
diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb b/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
index f3b8c6c987..b80bde8490 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://0001-ldif-filter-fix-parallel-build-failure.patch \
     file://0001-build-top.mk-unset-STRIP_OPTS.patch \
     file://0001-libraries-Makefile.in-ignore-the-mkdir-errors.patch \
+    file://0001-librewrite-include-ldap_pvt_thread.h-before-redefini.patch \
 "
 
 SRC_URI[md5sum] = "237fc2d881c27f8dd5d9f396e2865c11"
-- 
2.35.1


