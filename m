Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E60E728E1
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 19:50:45 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.27370.1696017040253371540
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 12:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qg/JGce9;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-417f872fb94so86654711cf.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 12:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696017039; x=1696621839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxqzBdH0kVwfqbZIkPRYGtpLnfAcnmvhVUmhjex3EwI=;
        b=Qg/JGce9vILpXr+vBOqFoZ6yYbDH9OaZ37c2S8/RRwDNKzAIO4gLFFoQ1JySeWzv0W
         uQmaJUMS6fmRpoDgEsnMCfesqrHjB7EFvsBHEmGpsNJYI3k+j5VIPioIpUxyVsonIcqM
         MD1iOvxSAcy6xLkBzy/cYDL2EZpcq6YWZx5kwCKNiSMdPGg395RoBF2bQRdHF08wnA1n
         k7cjKIkIE2Uihd5EJx81xT6lnstMHqo0K9iByxdBjI0+e3xUmd24NMk5dwPu/15iH1GP
         M2IxKoMg+UpmdWLiEUlR/X2u0xtdzfE3t2rSvEZNKbDcsl251+5TjyCEygr12YmzOLLX
         Fu6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696017039; x=1696621839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lxqzBdH0kVwfqbZIkPRYGtpLnfAcnmvhVUmhjex3EwI=;
        b=W5f3DuiFD2sH1kaQVyJxkLe28Lt/MiTiNM5GrjmO2bVj0W66G4pEA7+5lTDXU057DW
         5yqHBLblBya6JKaAGxmQOSb88vD+bmswlJHVqCRYydW7KMmPFeef5XnX2nx7SRrKV3S/
         SAEgLwwOLm25JfWQ+m6eG1pTY3C/pQVJLrqNXAQ+chYCZ0E3hq8eExG+gMr9KJJ7JNqr
         7Jd4UkXcmdI/hVMlIN0Ja0Voy8MNU+R6m87OP/VZIvfueMHHEjpYzdp5Z5cDnFVRf/+w
         El/mmMD2QOPv9SAcQFJdsxFKNhK8IrjTgouSsCZT/k9zNfKwKGu2kCn3B+cuAIas3aAu
         fz9A==
X-Gm-Message-State: AOJu0YyBq58NOhMiR0esMobobtc1mqTIXPRCw/I7esJnVDDxa0i5PFZw
	zWDMOytY+kw7iVA+41zkSH1Y2HXVJ6N20g==
X-Google-Smtp-Source: AGHT+IFbkUBa55APb7jE4XeYf3eNuUDYnFWj6wxLh//w+pv8aV93eWKLLhFv99ECCynaUMrtlOWS3A==
X-Received: by 2002:a05:622a:246:b0:413:5e4d:bf40 with SMTP id c6-20020a05622a024600b004135e4dbf40mr5931293qtx.68.1696017038997;
        Fri, 29 Sep 2023 12:50:38 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id x14-20020ac8538e000000b0040331f93ee0sm3283472qtp.77.2023.09.29.12.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 12:50:38 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [PATCH 2/2] vboxguestdrivers: fix kernel v6.5 build
Date: Fri, 29 Sep 2023 15:50:35 -0400
Message-Id: <20230929195035.3515540-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929195035.3515540-1-bruce.ashfield@gmail.com>
References: <20230929195035.3515540-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 19:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105262

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


