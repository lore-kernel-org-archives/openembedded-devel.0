Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E08D2EB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 16:11:29 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.62504.1688487084669295318
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Jul 2023 09:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=GfKY7M80;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-76754b9eac0so325224385a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Jul 2023 09:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688487083; x=1691079083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KoxA2qCYHlyysXLQrEZo1CQxXheuDaFEVKB3bXNUW6I=;
        b=GfKY7M80Dn+HsuoUxAWk3oaHwtrLirMH65oxD8P6VMaP2ke1sk4AIL/qbm6TJMpx64
         /joBxXAzfCWnU1mlRu3Bbg0wS2jV2P5JsOJYMB4h4V6RcE5YXmjpJdzuPBqPDNmSdNPh
         hbiBHJE2wSuZc2Dt3bKSplRQF00sRa6GFpYWmY+OgTiOES/QmWRWsZ7b7gRCtjt4jTCD
         J/bz1kTw/O+1cCSj76jmjH5CMAKOWQNbrdNqyKF1JmHCA6HAso5b9owf11dAYqRKtLwN
         KtFrGiaJKdoIbNHXzC/m9lQce1ZhLzwBgK+s9PhPLYQ37gxAhAe/8N2yfwy80cIGVNm/
         Gk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688487083; x=1691079083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KoxA2qCYHlyysXLQrEZo1CQxXheuDaFEVKB3bXNUW6I=;
        b=Rfnq3jBzTKsNYp8RTjs61IIJGHJoD3ZLbJcTAjBpgoDW7r1Ns4kJZ+IWfOhQLE3p9R
         7Nkl9noVFx1m31SZuvI9iV8EmxzOowAt49beBwDYksYQ/LphzpyUXEgLJ7wWCwsEVwzF
         5x7UGo7ZoGhwZPSFsthuuBwlcDDquRh6uLMuisVgtZo6dA60g1xQESii687ulJo+NAgN
         vkNKeP0z9XnhEoaXvPNAigVyi0enTgDze6cO2KcKdeF3+RUMmEFECdyVCTvOqwKa1I/v
         cFsUpAztjo9oZpiHa17++diNjQrhR3rg7J+BmXECweczja7Fh5ckWLdfjCf1j8n88rys
         pUjQ==
X-Gm-Message-State: AC+VfDxmFbdiz9wJEqMHvgU2BYkx8j9uuZIF/RFM9T4YZlTtbOZExQpv
	DdFdqTE25eWwi2PadJWYQVM1ag3E2CE=
X-Google-Smtp-Source: ACHHUZ7tXw/jwThXcEd9m/qa3DkTJll1SkMmnC1ltpozELpG1VWLZwH2+1znYf7V5vxcWHmgV3Cz0g==
X-Received: by 2002:a05:620a:454c:b0:765:4330:6e66 with SMTP id u12-20020a05620a454c00b0076543306e66mr19774130qkp.36.1688487083167;
        Tue, 04 Jul 2023 09:11:23 -0700 (PDT)
Received: from build4.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id g4-20020a37e204000000b0076750a5503csm4501691qki.63.2023.07.04.09.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 09:11:22 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [meta-oe][PATCH] vboxguestdrivers: fix compilation against 6.4 kernel / headers
Date: Tue,  4 Jul 2023 16:11:21 +0000
Message-Id: <20230704161121.981444-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Jul 2023 16:11:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103659

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The vboxguest drivers (vboxsf) fail to build against the 6.4 kernel
due to iovec iterator changes.

This is a port of the gentoo patches (which are picked from the upstream
virtualbox repository) to address the compilation issues.

We obviously can drop these when the next version of the guest additions
is available.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Khem,

At the moment, I'm unable to reach the virtualbox main site due to
a bad gateway, so I've instead grabbed the gentoo fix, and tracked
it to the upstream changset.

I'm preparing the 6.4 libc-headers and kernel and ran into this
compiliation issue, and wanted to get the change in place before
I send the main series.

Bruce


 ...t-additions-7.0.8-kernel-6.4-patch-1.patch | 29 +++++++++++++
 ...t-additions-7.0.8-kernel-6.4-patch-2.patch | 43 +++++++++++++++++++
 .../vboxguestdrivers_7.0.8.bb                 |  2 +
 3 files changed, 74 insertions(+)
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/virtualbox-guest-additions-7.0.8-kernel-6.4-patch-1.patch
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/virtualbox-guest-additions-7.0.8-kernel-6.4-patch-2.patch

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/virtualbox-guest-additions-7.0.8-kernel-6.4-patch-1.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/virtualbox-guest-additions-7.0.8-kernel-6.4-patch-1.patch
new file mode 100644
index 000000000..37ef3a9d5
--- /dev/null
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/virtualbox-guest-additions-7.0.8-kernel-6.4-patch-1.patch
@@ -0,0 +1,29 @@
+Initial support for kernel 6.4
+https://www.virtualbox.org/changeset/99666/vbox
+
+Upstream-Status: Backport [https://gitweb.gentoo.org/repo/gentoo.git/tree/app-emulation/virtualbox-guest-additions/files/virtualbox-guest-additions-7.0.8-kernel-6.4-patch-1.patch]
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+
+--- a/src/VBox/Additions/linux/sharedfolders/regops.c
++++ b/src/VBox/Additions/linux/sharedfolders/regops.c
+@@ -75,4 +75,11 @@
+ #if RTLNX_VER_MAX(2,5,12)
+ # define PageUptodate(a_pPage) Page_Uptodate(a_pPage)
++#endif
++
++/** Starting from 6.4.0, iter_iov() macro should be used in order to access to iov field.  */
++#if RTLNX_VER_MIN(6,4,0)
++# define VBOX_ITER_IOV(_iter) iter_iov(_iter)
++#else
++# define VBOX_ITER_IOV(_iter) iter->iov
+ #endif
+ 
+@@ -2400,5 +2407,5 @@
+     if (iter_is_iovec(iter) || (VBSF_GET_ITER_TYPE(iter) & ITER_KVEC)) {
+ # endif
+-        const struct iovec *pCurIov    = iter->iov;
++        const struct iovec *pCurIov    = VBOX_ITER_IOV(iter);
+         size_t              cLeft      = iter->nr_segs;
+         size_t              cPagesSpan = 0;
+
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/virtualbox-guest-additions-7.0.8-kernel-6.4-patch-2.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/virtualbox-guest-additions-7.0.8-kernel-6.4-patch-2.patch
new file mode 100644
index 000000000..20c8fbd3f
--- /dev/null
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/virtualbox-guest-additions-7.0.8-kernel-6.4-patch-2.patch
@@ -0,0 +1,43 @@
+Initial support for kernel 6.4
+https://www.virtualbox.org/changeset/99667/vbox
+
+
+Upstream-Status: Backport [https://gitweb.gentoo.org/repo/gentoo.git/tree/app-emulation/virtualbox-guest-additions/files/virtualbox-guest-additions-7.0.8-kernel-6.4-patch-2.patch]
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+
+--- a/src/VBox/Additions/linux/sharedfolders/regops.c
++++ b/src/VBox/Additions/linux/sharedfolders/regops.c
+@@ -77,11 +77,4 @@
+ #endif
+ 
+-/** Starting from 6.4.0, iter_iov() macro should be used in order to access to iov field.  */
+-#if RTLNX_VER_MIN(6,4,0)
+-# define VBOX_ITER_IOV(_iter) iter_iov(_iter)
+-#else
+-# define VBOX_ITER_IOV(_iter) iter->iov
+-#endif
+-
+ 
+ /*********************************************************************************************************************************
+@@ -94,4 +87,12 @@
+ #else
+ # define VBSF_GET_ITER_TYPE(a_pIter) ((a_pIter)->type)
++#endif
++
++/** Starting from 6.4.0, iter_iov() macro should be used in order to access to iov field
++ * of struct iov_iter. */
++#if RTLNX_VER_MIN(6,4,0)
++# define VBSF_GET_ITER_IOV(_iter) iter_iov(_iter)
++#else
++# define VBSF_GET_ITER_IOV(_iter) iter->iov
+ #endif
+ 
+@@ -2407,5 +2408,5 @@
+     if (iter_is_iovec(iter) || (VBSF_GET_ITER_TYPE(iter) & ITER_KVEC)) {
+ # endif
+-        const struct iovec *pCurIov    = VBOX_ITER_IOV(iter);
++        const struct iovec *pCurIov    = VBSF_GET_ITER_IOV(iter);
+         size_t              cLeft      = iter->nr_segs;
+         size_t              cPagesSpan = 0;
+
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.8.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.8.bb
index ed3e429b3..233323bf7 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.8.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.8.bb
@@ -13,6 +13,8 @@ VBOX_NAME = "VirtualBox-${PV}"
 
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
+    file://virtualbox-guest-additions-7.0.8-kernel-6.4-patch-1.patch \
+    file://virtualbox-guest-additions-7.0.8-kernel-6.4-patch-2.patch \
 "
 
 SRC_URI[sha256sum] = "c305fbe480f507eac7c36893ead66dffaacda944f19c3813a4533e9c39bae237"
-- 
2.39.2


