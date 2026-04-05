Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D81E8537F
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 12:49:37 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34594.1775393372624607314
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 05:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=euHpKIJ8;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b0c8362d93so19685545ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 05:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775393372; x=1775998172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYgSUryH4iNd3rH88XPcsYmTLZYJG7hSYltHLZb1XQo=;
        b=euHpKIJ8pvgTQ3vBg5cuMmSysZrRhusro2QB2+Om629BsvPSWRGXdbElyj+uYuZp1v
         PVsCHpYzL9yAX73aJtE7vNR3JamRu+sLTHdZlouo7SWz45RSD2HWkwR7PGzUmeZYbhXu
         8DYyCBk+hat1XrCt8sr2HsC+xvW3vMGCmZgW2Mj7OBioViuS7lDXuke1k/v4WmeCdXCZ
         Z+zq+QMgA3/7M9eUfl7vKR1M3bWlcmCH2k0oz40VsMigJXaCleWdHwURBFSt7Oi4HSHW
         haY+QmSUFRP1K/Q4tiCNI55SQh7LsHxaM2vOO3R65ERf7887J6fXbx31UjRKOwi2K5kO
         a5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775393372; x=1775998172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pYgSUryH4iNd3rH88XPcsYmTLZYJG7hSYltHLZb1XQo=;
        b=bREpMKl1SFhUjV5aFrS5uLeqwiF0rOSRaaFe6I/Iai+oXXJ4cuJz5bcoCjsb/O9cFA
         N0L11NLNtmPKQLkbK0TrrAeL6wAL1eXSgNC1yVnVaj2HbWWX7KcK8LB/Ftrzq7NzKPno
         AinHleXyqIh/t6oSNjnsWpXFV2itqlYJ0WgGxtvj6x3IiaxYjykEv7P+ay4J4O8a55iB
         TVkqsy9A/lMny7tmJWLxVH8KuGRp1IZF8EGrwQzLZqRdaxkwSxmpYTSUzilIWqEVwGuE
         WwZt9wrc0QvT8I5oHNonV2DLwGxpePhwYtSWYUdrUbJ2b2kzL21UyqVOCdvEMUiEWeiD
         8RKg==
X-Gm-Message-State: AOJu0YzI7iAHbgCuwayDTsCf7TIjkcSfRNd+XA9OYKyWrfv3WMFyVmo9
	FizQbtlgKThF9OvxaMl5yfx0n6aEPVThIxFjtSzjEKKFWXeihBV8xf6AAV54NfT+G/A=
X-Gm-Gg: AeBDietzCA1RjAdhSbCb6dJg0BM6fVQFXvG2hqoJPQfMF4A+NLzkdjzcZiqeiha72YM
	82LrYup8nTFMU5eIw+tHBrAyFWEC5Zvbs4TvAIRAxtKJCt0MzChIXJvavZ+AO7rudV8RvnFvKtX
	+UkyhGyLESo9bJ7CabceyXdQe5I8x5qf3wlchq35en4DLbMH1OSdSDItcK2lVgkIjuYAr3O1app
	p6bu+nBoFUKtKXbisjtm+VhLpHIAtPcC6E5UlCDqRvxJgvNWEvIODHrR159s5KlNpHHS+O+IKD9
	evH9rLB9F5TaRoHA6tdgoEVpy7gPHl7A4qde9FfesgCJCH7UsKxqdGLnIe1dzgGIOaLLzXugbhC
	xcR4fmsgVH1PT1lsXMZEMjUx13/SVOzrmA5TDbDIGiskYNHqMntJzbZ4xnT4bcUZSaYbyLlQSsV
	C/tffvc4xEMuaH4J8zyyYXdxzeUJ7kkU/N3og=
X-Received: by 2002:a17:903:f8d:b0:2b2:52a9:555a with SMTP id d9443c01a7336-2b281715be8mr95506115ad.7.1775393371731;
        Sun, 05 Apr 2026 05:49:31 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27477736dsm106828025ad.24.2026.04.05.05.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 05:49:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 2/14] wolfssl: patch CVE-2026-0819
Date: Mon,  6 Apr 2026 00:49:04 +1200
Message-ID: <20260405124916.2881008-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
References: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 12:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126001

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-0819

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2026-0819.patch         | 31 +++++++++++++++++++
 .../wolfssl/wolfssl_5.8.0.bb                  |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-0819.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-0819.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-0819.patch
new file mode 100644
index 0000000000..0594a8e03f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-0819.patch
@@ -0,0 +1,31 @@
+From ce42215d0dd20742b378211671117db4e6f7e729 Mon Sep 17 00:00:00 2001
+From: Reda Chouk <reda@wolfssl.com>
+Date: Thu, 8 Jan 2026 19:57:24 +0100
+Subject: [PATCH] Increment signedAttribsCount with the right number of
+ attributes it encoded
+
+(cherry picked from commit 9c7b58656541e8d31876d7ccd2cd38140b8ffb79)
+
+CVE: CVE-2026-0819
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/9c7b58656541e8d31876d7ccd2cd38140b8ffb79]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ wolfcrypt/src/pkcs7.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/wolfcrypt/src/pkcs7.c b/wolfcrypt/src/pkcs7.c
+index a8545ba0a..4ba96c90d 100644
+--- a/wolfcrypt/src/pkcs7.c
++++ b/wolfcrypt/src/pkcs7.c
+@@ -2107,6 +2107,11 @@ static int wc_PKCS7_BuildSignedAttributes(wc_PKCS7* pkcs7, ESD* esd,
+ 
+     /* add custom signed attributes if set */
+     if (pkcs7->signedAttribsSz > 0 && pkcs7->signedAttribs != NULL) {
++        word32 availableSpace = MAX_SIGNED_ATTRIBS_SZ - atrIdx;
++
++        if (pkcs7->signedAttribsSz > availableSpace)
++            return BUFFER_E;
++
+         esd->signedAttribsCount += pkcs7->signedAttribsSz;
+         esd->signedAttribsSz += (word32)EncodeAttributes(
+             &esd->signedAttribs[atrIdx], (int)esd->signedAttribsCount,
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
index 78d17630c7..e9be766e67 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
@@ -27,6 +27,7 @@ SRC_URI = " \
     file://CVE-2025-7394-4.patch \
     file://CVE-2025-7394-5.patch \
     file://CVE-2025-7394-6.patch \
+    file://CVE-2026-0819.patch \
 "
 
 SRCREV = "b077c81eb635392e694ccedbab8b644297ec0285"

