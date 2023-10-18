Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C297CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 11:14:26 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.278652.1697627658024784227
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Oct 2023 04:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nEFwaShz;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-53e2dc8fa02so9958237a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 04:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697627656; x=1698232456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WevXEq7/4rBZ5O5rlSnOh4sw7BB0Ghp9BTmrfRN4Ep8=;
        b=nEFwaShzdRkRfSr6IIwcszq65N/TkQu0nrzus55pKBhtRArEsALqyxwc2AWP2VsjlZ
         c2l5rqoDlFQcdYwSwS4Vm95pVrS6Ob0folLBFErtIpi650h1xWbXv105C0IVIk5TXJo7
         nje2uZ8w5iZSe77RvyluxCOioSdp9iAbmIYC/GYJmgLzMpScuobytvmotpAy6FbNcdCU
         bgx3G/BEwzccFI4hd84Dbf7GU9TeRYKP23hS+e0NUwBrQp6IUdfzQCPH8MEPEK8LrUaz
         IL3MfXv7YxJ9mm6qB9g5tp+0fbrVn7txUbTxANv3vyjaA5Jo1KGhLuwYe9u++cBE3ju7
         MdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697627656; x=1698232456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WevXEq7/4rBZ5O5rlSnOh4sw7BB0Ghp9BTmrfRN4Ep8=;
        b=tX/xfZADcfTU8Gj7iRs2hZhWeU9lSSkpEv4tPX106XnWEUdD2Y38usEKbT6I2GFwq7
         wetDw9jg96Oiz6QpmWoNBXER2UdP9yoMRgFzID3M38x41DxW549xI4b12rDgSMqlqIo5
         1Bhr0gTbbBLJEvRk56eTN/CcAtcY9Eg82gBt/nF1DKamqRWeYVToUT7f4qYUXFjEEb6C
         RxtGn1m78iEX75AudXLqOP6lRm6WkdgjAZS7DkNE//bckvyiYAaLiumO9RE+r1RqlJgP
         BwD0zBY1jHkJEVb+fWkr8PpxdtjaACJfHGdU3J6wWBvGGHC0fNVZhyIsrL5UPjOVhsPQ
         ZIkg==
X-Gm-Message-State: AOJu0Yw1QoQAId2PqS8kUHoWjjBNpzIazpwGE56Y4/HnKSTWznaWU/5a
	zpXAnRPFB7bFFOe8yQWFFhOIPQlg/eo=
X-Google-Smtp-Source: AGHT+IEQaTMOMksY2LeaXhzADzUm2qk7ik274se5s9CYgAcyqXsYqj9ZQycBHZ1DGMmm4OANRaC+iw==
X-Received: by 2002:a17:907:60cd:b0:9be:a2b6:7eae with SMTP id hv13-20020a17090760cd00b009bea2b67eaemr3572173ejc.52.1697627655558;
        Wed, 18 Oct 2023 04:14:15 -0700 (PDT)
Received: from Unimatrix08-Jammy.lan (mob-5-90-41-13.net.vodafone.it. [5.90.41.13])
        by smtp.gmail.com with ESMTPSA id m8-20020a170906160800b009ae54585aebsm1484260ejd.89.2023.10.18.04.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 04:14:14 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vbxguestdrivers: upgrade 7.0.10 -> 7.0.12
Date: Wed, 18 Oct 2023 13:14:11 +0200
Message-Id: <20231018111411.3425204-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 11:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105570

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../0001-vbox_fb-fix-kernel-v6.5-build.patch  | 50 -------------------
 ...s_7.0.10.bb => vboxguestdrivers_7.0.12.bb} |  3 +-
 2 files changed, 1 insertion(+), 52 deletions(-)
 delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-vbox_fb-fix-kernel-v6.5-build.patch
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.0.10.bb => vboxguestdrivers_7.0.12.bb} (96%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-vbox_fb-fix-kernel-v6.5-build.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-vbox_fb-fix-kernel-v6.5-build.patch
deleted file mode 100644
index 01969d4a1..000000000
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-vbox_fb-fix-kernel-v6.5-build.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 4cf34517b0c793405dca154cc70c9b5d1a566a8a Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@gmail.com>
-Date: Fri, 29 Sep 2023 14:52:50 -0400
-Subject: [PATCH] vbox_fb: fix kernel v6.5 build
-
-When building against the 6.5 kernel (and kernel headers), the following
-build error is encountered:
-
-   | vboxguestdrivers/7.0.10/vboxguestdrivers-7.0.10/vboxvideo/vbox_fb.c:194:24: error: 'drm_fb_helper_sys_fillrect' undeclared here (not in a function); did you mean 'drm_fb_helper_lastclose'?
-   |   194 |         .fb_fillrect = drm_fb_helper_sys_fillrect,
-   |       |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
-   |       |                        drm_fb_helper_lastclose
-   | vboxguestdrivers/7.0.10/vboxguestdrivers-7.0.10/vboxvideo/vbox_fb.c:195:24: error: 'drm_fb_helper_sys_copyarea' undeclared here (not in a function); did you mean 'drm_fb_helper_set_par'?
-   |   195 |         .fb_copyarea = drm_fb_helper_sys_copyarea,
-   |       |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
-   |       |                        drm_fb_helper_set_par
-   | vboxguestdrivers/7.0.10/vboxguestdrivers-7.0.10/vboxvideo/vbox_fb.c:196:25: error: 'drm_fb_helper_sys_imageblit' undeclared here (not in a function)
-   |   196 |         .fb_imageblit = drm_fb_helper_sys_imageblit,
-   |       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-We backport a patch from vbox-dev to fix the issue.
-
-Upstream-Status: Submitted [https://www.mail-archive.com/vbox-dev@virtualbox.org/msg10129.html]
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
----
- src/VBox/Additions/linux/drm/vbox_fb.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/VBox/Additions/linux/drm/vbox_fb.c b/src/VBox/Additions/linux/drm/vbox_fb.c
-index 2a8c79ab..d453533c 100644
---- a/src/VBox/Additions/linux/drm/vbox_fb.c
-+++ b/src/VBox/Additions/linux/drm/vbox_fb.c
-@@ -196,9 +196,13 @@ static struct fb_ops vboxfb_ops = {
- 	.owner = THIS_MODULE,
- 	.fb_check_var = drm_fb_helper_check_var,
- 	.fb_set_par = drm_fb_helper_set_par,
-+#if RTLNX_VER_MIN(6, 5, 0)
-+	FB_DEFAULT_SYS_OPS,
-+#else
- 	.fb_fillrect = drm_fb_helper_sys_fillrect,
- 	.fb_copyarea = drm_fb_helper_sys_copyarea,
- 	.fb_imageblit = drm_fb_helper_sys_imageblit,
-+#endif
- 	.fb_pan_display = drm_fb_helper_pan_display,
- 	.fb_blank = drm_fb_helper_blank,
- 	.fb_setcmap = drm_fb_helper_setcmap,
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.12.bb
similarity index 96%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.12.bb
index 8e9013824..5574cdb2a 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.12.bb
@@ -13,10 +13,9 @@ VBOX_NAME = "VirtualBox-${PV}"
 
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
-    file://0001-vbox_fb-fix-kernel-v6.5-build.patch \
 "
 
-SRC_URI[sha256sum] = "0b1e6d8b7f87d017c7fae37f80586acff04f799ffc1d51e995954d6415dee371"
+SRC_URI[sha256sum] = "d76634c6ccf62503726a5aeae6c78a3462474c51a0ebe4942591ccc2d939890a"
 
 S ?= "${WORKDIR}/vbox_module"
 S:task-patch = "${WORKDIR}/${VBOX_NAME}"
-- 
2.34.1


