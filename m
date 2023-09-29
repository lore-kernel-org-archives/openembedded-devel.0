Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13485E728E5
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 20:10:06 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.27812.1696018202066603939
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 13:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HhOUVQHz;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-77574dec71bso330347085a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 13:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696018201; x=1696623001; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QY4VhDlHWLETOpKCt9xP8VcZwPkpsYlNmQp6c9z34qM=;
        b=HhOUVQHzH7bdHwsEvJYfOLdlQwjor7a+slc5vsBYQGSrQmpNHrappfEYQPWj343xGL
         flutWA3Mw8GGAXMjZ63z9NpclecDku+NCRKZPMEqyAW1rnlPOpi+BWDBvUq9Qyot7yvl
         e/sbC5kTa13qXkxoJenQ+GUvv5I4sdUrkQ56SugxdTsok43We/wOMUyeO3CtLT+Xu+il
         bTmYWKBjTiOmTYbKNSDHX2o3qFw4iWgNNhMG9SNwbkt6kIr5RRj1UoMM2ZHs9Cx8mNoY
         d1e66kkQjijtLN3OP/GU3ZmzmU5mB3EZivdVI1/YYczHHgNvNVhDUkwwdHoG9pGDQZzA
         KxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696018201; x=1696623001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QY4VhDlHWLETOpKCt9xP8VcZwPkpsYlNmQp6c9z34qM=;
        b=kmSsgBVPUK1JXOLjrKa3ejoCxqF11rVYp5t++qJrrJJerwO2HvMylaKuixxtYC6TZH
         sgJXEBPcz7Wb1OQ9o1au3CCrHffEnJDvd5s9AL/DaELdWkxTInUzQTFxKdoIQ8Vidaeb
         KnFwpzBVP0uZhGuo6FVWmNzT7ZGU04Ym70lE/MdJrRK0DwZ43TIRwKuvny3Zq/DDbh+C
         elVfFqwA7JCCcQP1F4lBD0Q9CN+tdY6dUp+gk0MqDK6L+fOhm5KYwZ5MvOkArZh8z9dN
         KknEE2mRjOTuqx5q2nm138ZNqjUX1e3YPjYcKPwnzSb+mp2sBnQfsEJCXNWTJt0AgcRt
         7Wlw==
X-Gm-Message-State: AOJu0YyI5clREg6dQD+KpZFNGCOg9UZ7kbxKCVksIfUwXKO94K1KJ6si
	XKkvhZEzgdB4Z9YalI8j2urAC1C9pgiWmg==
X-Google-Smtp-Source: AGHT+IECsd/m7OoDixR4YqKtCDE7ezzXRbUmwfBikm+jWzwlFHE3SSOwtd2xdxfZRk8X40ZIF7DRXw==
X-Received: by 2002:ac8:5987:0:b0:417:ce99:35c9 with SMTP id e7-20020ac85987000000b00417ce9935c9mr5956089qte.33.1696018200872;
        Fri, 29 Sep 2023 13:10:00 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id iv2-20020a05622a6f0200b004109086e54bsm4724497qtb.38.2023.09.29.13.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 13:09:59 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [PATCH 2/2 v2][meta-oe] vboxguestdrivers: fix kernel v6.5 build
Date: Fri, 29 Sep 2023 16:09:57 -0400
Message-Id: <20230929200957.3516503-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929200957.3516503-1-bruce.ashfield@gmail.com>
References: <20230929200957.3516503-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 20:10:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105266

From: Bruce Ashfield <bruce.ashfield@gmail.com>

When building against the 6.5 kernel (and kernel headers), the following
build error is encountered:

   | vboxguestdrivers/7.0.10/vboxguestdrivers-7.0.10/vboxvideo/vbox_fb.c:194:24: error: 'drm_fb_helper_sys_fillrect' undeclared here (not in a function); did you mean 'drm_fb_helper_lastclose'?
   |   194 |         .fb_fillrect = drm_fb_helper_sys_fillrect,
   |       |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   |       |                        drm_fb_helper_lastclose
   | vboxguestdrivers/7.0.10/vboxguestdrivers-7.0.10/vboxvideo/vbox_fb.c:195:24: error: 'drm_fb_helper_sys_copyarea' undeclared here (not in a function); did you mean 'drm_fb_helper_set_par'?
   |   195 |         .fb_copyarea = drm_fb_helper_sys_copyarea,
   |       |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   |       |                        drm_fb_helper_set_par
   | vboxguestdrivers/7.0.10/vboxguestdrivers-7.0.10/vboxvideo/vbox_fb.c:196:25: error: 'drm_fb_helper_sys_imageblit' undeclared here (not in a function) |   196 |         .fb_imageblit = drm_fb_helper_sys_imageblit,
   |       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~

A patch from vbox-dev has been posted to fix the issue.

Upstream-Status: Submitted [https://www.mail-archive.com/vbox-dev@virtualbox.org/msg10129.html]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

v2: fixed subject for patch 1/2

Khem,

With 6.4 going EOL upstream, I'm rushing in a bump to v6.5 for OEcore.

This is a bump for the vboxguestdrives that solves issues in my tesing.

Bruce

 .../0001-vbox_fb-fix-kernel-v6.5-build.patch  | 50 +++++++++++++++++++
 .../vboxguestdrivers_7.0.10.bb                |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-vbox_fb-fix-kernel-v6.5-build.patch

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-vbox_fb-fix-kernel-v6.5-build.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-vbox_fb-fix-kernel-v6.5-build.patch
new file mode 100644
index 000000000..01969d4a1
--- /dev/null
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-vbox_fb-fix-kernel-v6.5-build.patch
@@ -0,0 +1,50 @@
+From 4cf34517b0c793405dca154cc70c9b5d1a566a8a Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@gmail.com>
+Date: Fri, 29 Sep 2023 14:52:50 -0400
+Subject: [PATCH] vbox_fb: fix kernel v6.5 build
+
+When building against the 6.5 kernel (and kernel headers), the following
+build error is encountered:
+
+   | vboxguestdrivers/7.0.10/vboxguestdrivers-7.0.10/vboxvideo/vbox_fb.c:194:24: error: 'drm_fb_helper_sys_fillrect' undeclared here (not in a function); did you mean 'drm_fb_helper_lastclose'?
+   |   194 |         .fb_fillrect = drm_fb_helper_sys_fillrect,
+   |       |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
+   |       |                        drm_fb_helper_lastclose
+   | vboxguestdrivers/7.0.10/vboxguestdrivers-7.0.10/vboxvideo/vbox_fb.c:195:24: error: 'drm_fb_helper_sys_copyarea' undeclared here (not in a function); did you mean 'drm_fb_helper_set_par'?
+   |   195 |         .fb_copyarea = drm_fb_helper_sys_copyarea,
+   |       |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
+   |       |                        drm_fb_helper_set_par
+   | vboxguestdrivers/7.0.10/vboxguestdrivers-7.0.10/vboxvideo/vbox_fb.c:196:25: error: 'drm_fb_helper_sys_imageblit' undeclared here (not in a function)
+   |   196 |         .fb_imageblit = drm_fb_helper_sys_imageblit,
+   |       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+We backport a patch from vbox-dev to fix the issue.
+
+Upstream-Status: Submitted [https://www.mail-archive.com/vbox-dev@virtualbox.org/msg10129.html]
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ src/VBox/Additions/linux/drm/vbox_fb.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/VBox/Additions/linux/drm/vbox_fb.c b/src/VBox/Additions/linux/drm/vbox_fb.c
+index 2a8c79ab..d453533c 100644
+--- a/src/VBox/Additions/linux/drm/vbox_fb.c
++++ b/src/VBox/Additions/linux/drm/vbox_fb.c
+@@ -196,9 +196,13 @@ static struct fb_ops vboxfb_ops = {
+ 	.owner = THIS_MODULE,
+ 	.fb_check_var = drm_fb_helper_check_var,
+ 	.fb_set_par = drm_fb_helper_set_par,
++#if RTLNX_VER_MIN(6, 5, 0)
++	FB_DEFAULT_SYS_OPS,
++#else
+ 	.fb_fillrect = drm_fb_helper_sys_fillrect,
+ 	.fb_copyarea = drm_fb_helper_sys_copyarea,
+ 	.fb_imageblit = drm_fb_helper_sys_imageblit,
++#endif
+ 	.fb_pan_display = drm_fb_helper_pan_display,
+ 	.fb_blank = drm_fb_helper_blank,
+ 	.fb_setcmap = drm_fb_helper_setcmap,
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb
index f19363652..8e9013824 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb
@@ -13,6 +13,7 @@ VBOX_NAME = "VirtualBox-${PV}"
 
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
+    file://0001-vbox_fb-fix-kernel-v6.5-build.patch \
 "
 
 SRC_URI[sha256sum] = "0b1e6d8b7f87d017c7fae37f80586acff04f799ffc1d51e995954d6415dee371"
-- 
2.34.1


