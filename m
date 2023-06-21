Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A106EB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 06:39:45 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.5170.1687329580029959866
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jun 2023 23:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=FdIWyQsc;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f90b4ac529so41112075e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 23:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687329578; x=1689921578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vFNC2lw2NI24GOQKCgtxHdgMOZsWUP0KCixu31DcMIA=;
        b=FdIWyQscMZBO5ulVV/2eVknDd2LHhwKCWD/YbByONSJs8XZmJ4NCkkYi3xvpJm/4tN
         VU+eRVFqBH+yjavpTVP1goQs8rkyspd8Q7Ksiw3hqxF1IyTzLnG9jDTjwC4AkJluQynx
         kwdZ7AMJSQjzZh0tsWpXNwsLPHUFI0hzlm8Hc9lN0J7I1YItlMwfpST3ShRRzy8bqMJc
         vzO1iPpxu0bWgM0Oz4Y3uoqCN6oItZumsw0i+rNmKh0wntG4TY0PUqQxJj5031sB5nwT
         2ct++nPEUhwAfbXcVYPOq/QiTtNay4mTjb9U6LeFxAsi3XqFJxJ8n5R4AjALiPWslUhz
         EsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687329578; x=1689921578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFNC2lw2NI24GOQKCgtxHdgMOZsWUP0KCixu31DcMIA=;
        b=PMkIKSoPukG4VUfLcs2S26SZ1N/Frw+gBEnaEmO13pzYLFBaRI2rRMlzJ5x+d/C+WZ
         AKnMSSnwSHN5mSMXPYAshQPMfE2HSaY6OXL4DAqemBZRr/seHKnkQy8QyiX51bocENl2
         dQf4Pnr82Ch26MXrYnETgkt7xEGZYX5xbWAs+K1ePRDU5+e4oqYF5cRxhntfwQ5ENW32
         p04SqbjwZeMEVRMcR8PtUN1kIgvJF5wZfJjLJElHvU0NU5Hs/vF3zWiCa1oSOxpoqpT9
         2tELVHsjpgko+61BzJW5i8mIdXEbeV9OPaECvZPkF2P9YpYmkSJKX6ioYPWbu0TSWerz
         8EJw==
X-Gm-Message-State: AC+VfDysFGNbzBwdtb5UK3SJ2MBN0hZ48EHscgVkfEXXzSsPrRyHHYeq
	dCQNMAGepeBE2rqrA1V+GlstvEgz+Y0=
X-Google-Smtp-Source: ACHHUZ5WXSzzDKATeyBpupuKb3ko4NXkIfC7OIb+QzGi0/LURgWLem/ujz+zwG7HJx9ZjvhcoKdhMQ==
X-Received: by 2002:a7b:c41a:0:b0:3f9:bdcd:e6dd with SMTP id k26-20020a7bc41a000000b003f9bdcde6ddmr867707wmi.39.1687329577878;
        Tue, 20 Jun 2023 23:39:37 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id h25-20020a1ccc19000000b003f42158288dsm15117815wmb.20.2023.06.20.23.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 23:39:37 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] ostree: Upgrade 2023.3 -> 2023.4
Date: Wed, 21 Jun 2023 07:39:29 +0100
Message-Id: <20230621063929.18341-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jun 2023 06:39:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103469

Drop upstreamed gpg_strerror_r fix.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 ...001-lib-deploy-Use-off_t-not-__off_t.patch | 27 ++++++++++++++++
 ...ith-libgpg-error-for-gpg_strerror_r-.patch | 31 -------------------
 .../{ostree_2023.3.bb => ostree_2023.4.bb}    | 11 +++----
 3 files changed, 32 insertions(+), 37 deletions(-)
 create mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-lib-deploy-Use-off_t-not-__off_t.patch
 delete mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-libostree-Link-with-libgpg-error-for-gpg_strerror_r-.patch
 rename meta-oe/recipes-extended/ostree/{ostree_2023.3.bb => ostree_2023.4.bb} (96%)

diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-lib-deploy-Use-off_t-not-__off_t.patch b/meta-oe/recipes-extended/ostree/ostree/0001-lib-deploy-Use-off_t-not-__off_t.patch
new file mode 100644
index 000000000000..a64d9de5ef6d
--- /dev/null
+++ b/meta-oe/recipes-extended/ostree/ostree/0001-lib-deploy-Use-off_t-not-__off_t.patch
@@ -0,0 +1,27 @@
+From 6d690ebf64ce640afce3085f01da8694a04853a9 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Tue, 20 Jun 2023 19:24:04 +0100
+Subject: [PATCH] lib/deploy: Use off_t not __off_t
+
+Not clear why this was __off_t which is the sole appearance in the code
+base, but it breaks musl builds.
+
+Upstream-Status: Submitted [https://github.com/ostreedev/ostree/pull/2896]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ src/libostree/ostree-sysroot-deploy.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libostree/ostree-sysroot-deploy.c b/src/libostree/ostree-sysroot-deploy.c
+index 8fcd5e802758..2454a5877d94 100644
+--- a/src/libostree/ostree-sysroot-deploy.c
++++ b/src/libostree/ostree-sysroot-deploy.c
+@@ -2536,7 +2536,7 @@ get_kernel_layout_size (OstreeSysroot *self, OstreeDeployment *deployment, guint
+ /* This is a roundabout but more trustworthy way of doing a space check than
+  * relying on statvfs's f_bfree when you know the size of the objects. */
+ static gboolean
+-dfd_fallocate_check (int dfd, __off_t len, gboolean *out_passed, GError **error)
++dfd_fallocate_check (int dfd, off_t len, gboolean *out_passed, GError **error)
+ {
+   /* If the requested size is 0 then return early. Passing a 0 len to
+    * fallocate results in EINVAL */
diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-libostree-Link-with-libgpg-error-for-gpg_strerror_r-.patch b/meta-oe/recipes-extended/ostree/ostree/0001-libostree-Link-with-libgpg-error-for-gpg_strerror_r-.patch
deleted file mode 100644
index b87a41bfbb82..000000000000
--- a/meta-oe/recipes-extended/ostree/ostree/0001-libostree-Link-with-libgpg-error-for-gpg_strerror_r-.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 597120777ff9410b715c19298df824ce3170d6d7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 12 Jun 2023 14:04:44 -0700
-Subject: [PATCH] libostree: Link with libgpg-error for gpg_strerror_r API
-
-With f461c02bb55bf2853a3b81ed5c8618040ab54e98 use of gpg_strerror_r
-was added this symbol comes from libgpg-error however, therefore its
-needed to add -lgpg-error to cmdline to resolve this symbol especially
-with gold and lld linker. Fixes
-
-aarch64-yoe-linux-ld.lld: error: undefined reference due to --no-allow-shlib-undefined: gpg_strerror_r
->>> referenced by ./.libs/libostree-1.so
-
-Upstream-Status: Submitted [https://github.com/ostreedev/ostree/pull/2880]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile-libostree.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -243,8 +243,7 @@ AC_ARG_WITH(gpgme,
- 	    [], [with_gpgme=yes])
- AS_IF([test x$with_gpgme != xno], [
-     have_gpgme=yes
--    PKG_CHECK_MODULES([OT_DEP_GPGME], gpgme >= $LIBGPGME_DEPENDENCY, [], have_gpgme=no)
--    PKG_CHECK_MODULES([OT_DEP_GPG_ERROR], [gpg-error], [], have_gpgme=no)
-+    PKG_CHECK_MODULES([OT_DEP_GPGME], [gpgme >= $LIBGPGME_DEPENDENCY gpg-error], [have_gpgme=yes], [have_gpgme=no])
-     ]
- )
- AS_IF([test x$with_gpgme != xno && test x$have_gpgme != xyes], [
diff --git a/meta-oe/recipes-extended/ostree/ostree_2023.3.bb b/meta-oe/recipes-extended/ostree/ostree_2023.4.bb
similarity index 96%
rename from meta-oe/recipes-extended/ostree/ostree_2023.3.bb
rename to meta-oe/recipes-extended/ostree/ostree_2023.4.bb
index f5cd7d6ac6ca..d2a7b0456280 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2023.3.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2023.4.bb
@@ -19,12 +19,11 @@ DEPENDS = " \
 "
 
 GITHUB_BASE_URI = "https://github.com/ostreedev/ostree/releases"
-SRC_URI = " \
-    ${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
-    file://0001-libostree-Link-with-libgpg-error-for-gpg_strerror_r-.patch \
-    file://run-ptest \
-"
-SRC_URI[sha256sum] = "9c575a094da2c307769f0aee15de95470c3b5550cbff211fbbc4f6fc75f333b1"
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
+           file://run-ptest \
+           file://0001-lib-deploy-Use-off_t-not-__off_t.patch \
+           "
+SRC_URI[sha256sum] = "7cee8ace6aae3c778527927a85abefbfbd491c021f52ae229c51ca3077f9c5d1"
 
 S = "${WORKDIR}/libostree-${PV}"
 
-- 
2.39.0


