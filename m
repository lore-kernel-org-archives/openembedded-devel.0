Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775D0EB64DC
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 07:21:43 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.3324.1688196093843932584
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Jul 2023 00:21:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=OpQskjbP;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fbc59de009so20532725e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Jul 2023 00:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688196092; x=1690788092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GMhZpNpYI/LAwmGydw059hdiIGwxPWmHAoQ9riFBvJk=;
        b=OpQskjbP0IwTRnFDUHdHU1ThVm7l3WDwo5lwTBbdwwofQneUzcvjeeqh+Akqt8Ay+N
         LGtr0B/NdZ6EStfpii/4+HSjDiTsqj1YQzgJGqFzJCETgFM2N9ahDKT2aR24imchaGI8
         2QJxMjIFFebIh2/++Ec+A5MM34BcYAy93NknQUz6+SSTqYYo8Uwmu+19jdMQRGLAxX/e
         h5Gv2YqiD6wKvqXvAQVgeVsN1M3H815TulPUn66ewljVf740AcMiAYhCl/TDAARZpepq
         ti5U73ZjmtgXC7DHk3rIeHSTAomScH/zoCjhDAPzqniUJ9t7caBx6CQp1Ww6NmHQiRVj
         LBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688196092; x=1690788092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GMhZpNpYI/LAwmGydw059hdiIGwxPWmHAoQ9riFBvJk=;
        b=G1VShjAKHg35SygnbV+5cxLdwr5IOX64ThM8VXV3W7rsTgalh9I6e4AjqVly017mJ7
         lUwTKoOTLK+HpuhGKyhXjbrUtjiRzNyqihMDxUvTlIuQ6lFzpjLStfiHldZ4nbKVLu3y
         fQA0K9ZRT832rycsBW5hJyHJKxdvoRaReAaBxzKX2kz1nT7vvIfGlcqe76BUwpSQgdFQ
         vJZZ6MNhnl6udOPC18CgiXJ6fek/qSoxtg33sbtCvhb3vaZmEOCuEW4LW0RK3elz/TJj
         Wg6YulrZ+6wNqUhVZcKAtWsFo5r+6+n9lIpniZQZlJrRFVBszzNu7FFG7LY5I6FQnFCk
         BsmQ==
X-Gm-Message-State: ABy/qLZUYiAxcLcnOdzcnileqNLeycDUu4aZiuWtGN6D04d6xruCpqLe
	JIRO2N5TXDDX7B8A2GLGHFPN2qA537U=
X-Google-Smtp-Source: APBJJlHPghg1kg2xLV3sqtFT93MvtFwTSnKw0BL8EpYxqBX2SFOBEpDpMRfUhADD/LSOMmocNC8Knw==
X-Received: by 2002:adf:db43:0:b0:314:248d:d9df with SMTP id f3-20020adfdb43000000b00314248dd9dfmr2812495wrj.13.1688196091728;
        Sat, 01 Jul 2023 00:21:31 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id x11-20020adff0cb000000b0031424f4ef1dsm3018997wro.19.2023.07.01.00.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jul 2023 00:21:31 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] ostree: Upgrade 2023.4 -> 2023.5
Date: Sat,  1 Jul 2023 08:21:26 +0100
Message-Id: <20230701072126.23287-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Jul 2023 07:21:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103646

Drop upstreamed __off_t patch.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 ...001-lib-deploy-Use-off_t-not-__off_t.patch | 27 -------------------
 .../{ostree_2023.4.bb => ostree_2023.5.bb}    |  3 +--
 2 files changed, 1 insertion(+), 29 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-lib-deploy-Use-off_t-not-__off_t.patch
 rename meta-oe/recipes-extended/ostree/{ostree_2023.4.bb => ostree_2023.5.bb} (98%)

diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-lib-deploy-Use-off_t-not-__off_t.patch b/meta-oe/recipes-extended/ostree/ostree/0001-lib-deploy-Use-off_t-not-__off_t.patch
deleted file mode 100644
index a64d9de5ef6d..000000000000
--- a/meta-oe/recipes-extended/ostree/ostree/0001-lib-deploy-Use-off_t-not-__off_t.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 6d690ebf64ce640afce3085f01da8694a04853a9 Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Tue, 20 Jun 2023 19:24:04 +0100
-Subject: [PATCH] lib/deploy: Use off_t not __off_t
-
-Not clear why this was __off_t which is the sole appearance in the code
-base, but it breaks musl builds.
-
-Upstream-Status: Submitted [https://github.com/ostreedev/ostree/pull/2896]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- src/libostree/ostree-sysroot-deploy.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libostree/ostree-sysroot-deploy.c b/src/libostree/ostree-sysroot-deploy.c
-index 8fcd5e802758..2454a5877d94 100644
---- a/src/libostree/ostree-sysroot-deploy.c
-+++ b/src/libostree/ostree-sysroot-deploy.c
-@@ -2536,7 +2536,7 @@ get_kernel_layout_size (OstreeSysroot *self, OstreeDeployment *deployment, guint
- /* This is a roundabout but more trustworthy way of doing a space check than
-  * relying on statvfs's f_bfree when you know the size of the objects. */
- static gboolean
--dfd_fallocate_check (int dfd, __off_t len, gboolean *out_passed, GError **error)
-+dfd_fallocate_check (int dfd, off_t len, gboolean *out_passed, GError **error)
- {
-   /* If the requested size is 0 then return early. Passing a 0 len to
-    * fallocate results in EINVAL */
diff --git a/meta-oe/recipes-extended/ostree/ostree_2023.4.bb b/meta-oe/recipes-extended/ostree/ostree_2023.5.bb
similarity index 98%
rename from meta-oe/recipes-extended/ostree/ostree_2023.4.bb
rename to meta-oe/recipes-extended/ostree/ostree_2023.5.bb
index d2a7b0456280..3028c4c92ad9 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2023.4.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2023.5.bb
@@ -21,9 +21,8 @@ DEPENDS = " \
 GITHUB_BASE_URI = "https://github.com/ostreedev/ostree/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
            file://run-ptest \
-           file://0001-lib-deploy-Use-off_t-not-__off_t.patch \
            "
-SRC_URI[sha256sum] = "7cee8ace6aae3c778527927a85abefbfbd491c021f52ae229c51ca3077f9c5d1"
+SRC_URI[sha256sum] = "bc593afb31fe1ac3d50419f917fafe321a0a3561d7bb2ba498a83740fe3adb14"
 
 S = "${WORKDIR}/libostree-${PV}"
 
-- 
2.39.0


