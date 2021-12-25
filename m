Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B91DC433EF
	for <webhook@archiver.kernel.org>; Sat, 25 Dec 2021 21:29:50 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.11092.1640467789489547440
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Dec 2021 13:29:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HXwKS9p9;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id mj19so10211691pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Dec 2021 13:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5IK8F8iAk1Kn5RMq9T2TF7fhi3L9jAvToGidofEhoVM=;
        b=HXwKS9p9ssLFM3ltmH2nXQHbdK4XWyrrND91h2LrjGtVDxBF33D4nDoCXzbslU379I
         GpFzPgG1iFGtx6ySYcrPbUDQN0H/PDhVBnnqinjlhZ3J3k6BSnbGXRD9kdnO2cUsIf/S
         /losLecJJ5ldBMpsogXrgXoVn5JS8LnpXejP0rBMeDB6l0xRfuaonlAFbdUZ3NBRMJJM
         Wn8xRICEpkVwNJifZzAlC0hn/GAb3ZgnhNtr7VCiWFLoUtOw3kQDt7Xc7eA97ytS6pyA
         7A5OXRmg5DH4PgXDdiZSBRB91AAEV3ooKVFQUKi0Ef4UirQgyAHvcwVXYinmmJpLMTyp
         QzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5IK8F8iAk1Kn5RMq9T2TF7fhi3L9jAvToGidofEhoVM=;
        b=a355TreF8sOFSAcGNZ7FbbgxSWh1rae4zJsNDipa4hg9BCgXlZvlebIG7QqihSy7AS
         NuehTUapfm7FNUad6WJAjdkLVUirUmNuXLXe7sfE5j+GjONhlEHxL49qHs/+8FYmxgEV
         p3CD02865AVOMZeQfFkrvdZu9IapYQnVKv66uozzb79wBsHtkk+FEHxIGt+HQVM96rrt
         +zMXvoZ/ay0w5tcgusRoVlr3ng8lvd/G3QSjLGNYu+J2gkZp+GjeFzvv/u4d1ttXUofJ
         rSNY0PmvVu0CO+5u4MEWdYcNHjWOBtNp84M/FA9cHNoMc8Lm3b5T2KbaLNFYAT3219By
         hlIg==
X-Gm-Message-State: AOAM533hmeYcX6g+k8NL7igLWqlry6lPfzDOTciJmwjWWhRHD3GdMoCG
	jGnvYMzL0AKjjQ4ST0dIsxeuHqZKnxOw/w==
X-Google-Smtp-Source: 
 ABdhPJxtAzYZ+OzoxVBlGHEsEMWydd7qj8X4Y0loKM3LdEokyFY1gKUF/JZqRNCKae839yMmidapDA==
X-Received: by 2002:a17:90b:1082:: with SMTP id
 gj2mr13715597pjb.187.1640467788773;
        Sat, 25 Dec 2021 13:29:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2b9d])
        by smtp.gmail.com with ESMTPSA id
 mi5sm15233160pjb.21.2021.12.25.13.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Dec 2021 13:29:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] pkcs11-helper: Fix build with nss >= 3.73.1
Date: Sat, 25 Dec 2021 13:29:45 -0800
Message-Id: <20211225212945.3727095-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Dec 2021 21:29:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94498

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-nss-use-nss-pkcs11-h.patch           | 61 +++++++++++++++++++
 .../pkcs11-helper/pkcs11-helper_1.27.bb       |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch

diff --git a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch
new file mode 100644
index 0000000000..3070fc41a0
--- /dev/null
+++ b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch
@@ -0,0 +1,61 @@
+From 083a3a62f2e631deec2fb2799d10660a41c50294 Mon Sep 17 00:00:00 2001
+From: Alon Bar-Lev <alon.barlev@gmail.com>
+Date: Fri, 30 Jul 2021 20:06:36 +0300
+Subject: [PATCH] nss: use nss pkcs11.h
+
+make nss happy with its own extensions and non-standard behavior.
+
+Taken from Archlinux [1]
+
+[1] https://github.com/archlinux/svntogit-packages/commit/238f5e90946f527b2d4a507e02c30e977db38a97
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/_pkcs11h-crypto-nss.c | 14 ++++++++++----
+ lib/common.h              |  7 +++++++
+ 2 files changed, 17 insertions(+), 4 deletions(-)
+
+--- a/lib/_pkcs11h-crypto-nss.c
++++ b/lib/_pkcs11h-crypto-nss.c
+@@ -48,15 +48,21 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include "common.h"
+-
+-#include "_pkcs11h-crypto.h"
++#ifdef HAVE_CONFIG_H
++#include <config.h>
++#endif
+ 
+ #if defined(ENABLE_PKCS11H_ENGINE_NSS)
+-#define _PKCS11T_H_ /* required so no conflict with ours */
+ #include <nss.h>
+ #include <cert.h>
+ 
++/* Use PKCS#11 of nss to avoid conflicts and make nss happy with its own extensions */
++#define PKCS11_H 1
++
++#include "common.h"
++
++#include "_pkcs11h-crypto.h"
++
+ static
+ int
+ __pkcs11h_crypto_nss_initialize (
+--- a/lib/common.h
++++ b/lib/common.h
+@@ -72,5 +72,12 @@
+ 
+ #define _PKCS11H_ASSERT		assert
+ 
++#ifndef FALSE
++#define FALSE 0
++#endif
++#ifndef TRUE
++#define TRUE 1
++#endif
++
+ #endif
+ 
diff --git a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.27.bb b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.27.bb
index 1af9004fea..389d1bc7bb 100644
--- a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.27.bb
+++ b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.27.bb
@@ -17,6 +17,7 @@ LIC_FILES_CHKSUM = " \
 "
 SRC_URI = "git://github.com/OpenSC/${BPN}.git;branch=master;protocol=https \
            file://0001-build-openssl-remove-RSA_SSLV23_PADDING-constant-usa.patch \
+           file://0001-nss-use-nss-pkcs11-h.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


