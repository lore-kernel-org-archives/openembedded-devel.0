Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BEAEEB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 09:38:55 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.9098.1689845930070655697
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jul 2023 02:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jifnsPHt;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-521dc8ae899so400432a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Jul 2023 02:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689845928; x=1690450728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N3uNWaypbd2qsW5fXJnP+PFQFPRdpf+wCSg4n4Ezc4w=;
        b=jifnsPHtI38kxEUZ87YuM1NUYBXBWmtv2KkTPWEs8IoOpnQj48ltRztik9I6i6oHoV
         QYYQDlMcOTHh9nbv3+tCRqoEmfZ5/+6430UPoZv5ZcDJL7qtpTAwR678r97LpL5xYuyj
         h+Wk2ivnwo21eWEk28iBntET3YoFzezO9BXYIYE9wIGIuA5Ku0FkE/ctJ9Zubf8UStYf
         oSyKFLPxPkQ23dgsUPaUgLO0Qq4wuGZ9rJWkT/fBBAK8aKJt/pmkmaOitUwdgokWIKbY
         aJlIdF8DdrghAtvAXnrANcnFSedUIfXkrE3fa39iOyX6vQrO0I9kITSOzUHdzeZxJo/x
         wUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689845928; x=1690450728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3uNWaypbd2qsW5fXJnP+PFQFPRdpf+wCSg4n4Ezc4w=;
        b=KDgmRfFJZ8XZy4t6JC7eeC0sMVd96ed03bS+Aahred/GiP607L8o03RZbyEODNBR93
         9VBBxgAR3A7dgg8zrloJI+0ntLKfQY+Vw4nkBsO/h8g+rwkzlawsoTAODfD33ZZdv6v5
         l09Tzyu9u/SyQPKXOoP6mt/Aw1IsKQWP3ybq1ibPkai4sg2aybZds5hBlRiNqh9g1t5h
         GEK33jIL8yW8EdTkr6C2OIwfk+rxusXcU1WsVb8xuLl5DFuz2OZKjAB5bZdp9hog8GwA
         SUegzO5OnQ/mX3o3W61kNFP5sIOIS5y/dvhHnreMNHtGkkWndt3i7VeNHofXTf9cQcp/
         HfTw==
X-Gm-Message-State: ABy/qLbi9JeJ0VJq2ZhyfuaflLl9P3t1P3UjxOomhZufafGKjDpJ5VkH
	5oaGdmk0VvYGDbrZzDjagQmgtKwMnsY=
X-Google-Smtp-Source: APBJJlFdXnuomBSvD5zMBJHBdHjQH/D6DGqI3LsCJxLFwKRAjPmOIsZQtPCzvaMdv0xOzDhROqY5wQ==
X-Received: by 2002:aa7:c3ca:0:b0:51d:a483:6089 with SMTP id l10-20020aa7c3ca000000b0051da4836089mr4496612edr.24.1689845927443;
        Thu, 20 Jul 2023 02:38:47 -0700 (PDT)
Received: from Unimatrix08-Jammy.lan ([151.58.174.15])
        by smtp.gmail.com with ESMTPSA id c12-20020aa7df0c000000b005217412e18dsm500186edy.48.2023.07.20.02.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 02:38:46 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vbxguestdrivers: upgrade 7.0.8 -> 7.0.10
Date: Thu, 20 Jul 2023 10:52:05 +0200
Message-Id: <20230720085205.2911779-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Jul 2023 09:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103968

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 ...t-additions-7.0.8-kernel-6.4-patch-1.patch | 29 -------------
 ...t-additions-7.0.8-kernel-6.4-patch-2.patch | 43 -------------------
 ...rs_7.0.8.bb => vboxguestdrivers_7.0.10.bb} |  4 +-
 3 files changed, 1 insertion(+), 75 deletions(-)
 delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/virtualbox-guest-additions-7.0.8-kernel-6.4-patch-1.patch
 delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/virtualbox-guest-additions-7.0.8-kernel-6.4-patch-2.patch
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.0.8.bb => vboxguestdrivers_7.0.10.bb} (93%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/virtualbox-guest-additions-7.0.8-kernel-6.4-patch-1.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/virtualbox-guest-additions-7.0.8-kernel-6.4-patch-1.patch
deleted file mode 100644
index 37ef3a9d5..000000000
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/virtualbox-guest-additions-7.0.8-kernel-6.4-patch-1.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Initial support for kernel 6.4
-https://www.virtualbox.org/changeset/99666/vbox
-
-Upstream-Status: Backport [https://gitweb.gentoo.org/repo/gentoo.git/tree/app-emulation/virtualbox-guest-additions/files/virtualbox-guest-additions-7.0.8-kernel-6.4-patch-1.patch]
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
-
---- a/src/VBox/Additions/linux/sharedfolders/regops.c
-+++ b/src/VBox/Additions/linux/sharedfolders/regops.c
-@@ -75,4 +75,11 @@
- #if RTLNX_VER_MAX(2,5,12)
- # define PageUptodate(a_pPage) Page_Uptodate(a_pPage)
-+#endif
-+
-+/** Starting from 6.4.0, iter_iov() macro should be used in order to access to iov field.  */
-+#if RTLNX_VER_MIN(6,4,0)
-+# define VBOX_ITER_IOV(_iter) iter_iov(_iter)
-+#else
-+# define VBOX_ITER_IOV(_iter) iter->iov
- #endif
- 
-@@ -2400,5 +2407,5 @@
-     if (iter_is_iovec(iter) || (VBSF_GET_ITER_TYPE(iter) & ITER_KVEC)) {
- # endif
--        const struct iovec *pCurIov    = iter->iov;
-+        const struct iovec *pCurIov    = VBOX_ITER_IOV(iter);
-         size_t              cLeft      = iter->nr_segs;
-         size_t              cPagesSpan = 0;
-
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/virtualbox-guest-additions-7.0.8-kernel-6.4-patch-2.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/virtualbox-guest-additions-7.0.8-kernel-6.4-patch-2.patch
deleted file mode 100644
index 20c8fbd3f..000000000
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/virtualbox-guest-additions-7.0.8-kernel-6.4-patch-2.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Initial support for kernel 6.4
-https://www.virtualbox.org/changeset/99667/vbox
-
-
-Upstream-Status: Backport [https://gitweb.gentoo.org/repo/gentoo.git/tree/app-emulation/virtualbox-guest-additions/files/virtualbox-guest-additions-7.0.8-kernel-6.4-patch-2.patch]
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
-
---- a/src/VBox/Additions/linux/sharedfolders/regops.c
-+++ b/src/VBox/Additions/linux/sharedfolders/regops.c
-@@ -77,11 +77,4 @@
- #endif
- 
--/** Starting from 6.4.0, iter_iov() macro should be used in order to access to iov field.  */
--#if RTLNX_VER_MIN(6,4,0)
--# define VBOX_ITER_IOV(_iter) iter_iov(_iter)
--#else
--# define VBOX_ITER_IOV(_iter) iter->iov
--#endif
--
- 
- /*********************************************************************************************************************************
-@@ -94,4 +87,12 @@
- #else
- # define VBSF_GET_ITER_TYPE(a_pIter) ((a_pIter)->type)
-+#endif
-+
-+/** Starting from 6.4.0, iter_iov() macro should be used in order to access to iov field
-+ * of struct iov_iter. */
-+#if RTLNX_VER_MIN(6,4,0)
-+# define VBSF_GET_ITER_IOV(_iter) iter_iov(_iter)
-+#else
-+# define VBSF_GET_ITER_IOV(_iter) iter->iov
- #endif
- 
-@@ -2407,5 +2408,5 @@
-     if (iter_is_iovec(iter) || (VBSF_GET_ITER_TYPE(iter) & ITER_KVEC)) {
- # endif
--        const struct iovec *pCurIov    = VBOX_ITER_IOV(iter);
-+        const struct iovec *pCurIov    = VBSF_GET_ITER_IOV(iter);
-         size_t              cLeft      = iter->nr_segs;
-         size_t              cPagesSpan = 0;
-
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.8.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb
similarity index 93%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.8.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb
index 233323bf7..f19363652 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.8.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb
@@ -13,11 +13,9 @@ VBOX_NAME = "VirtualBox-${PV}"
 
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
-    file://virtualbox-guest-additions-7.0.8-kernel-6.4-patch-1.patch \
-    file://virtualbox-guest-additions-7.0.8-kernel-6.4-patch-2.patch \
 "
 
-SRC_URI[sha256sum] = "c305fbe480f507eac7c36893ead66dffaacda944f19c3813a4533e9c39bae237"
+SRC_URI[sha256sum] = "0b1e6d8b7f87d017c7fae37f80586acff04f799ffc1d51e995954d6415dee371"
 
 S ?= "${WORKDIR}/vbox_module"
 S:task-patch = "${WORKDIR}/${VBOX_NAME}"
-- 
2.34.1


