Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E693CEF06E2
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 14:51:59 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26686.1770562313642853510
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Feb 2026 06:51:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LHqIFZ1k;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so34562435e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 06:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770562312; x=1771167112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J2jwraTseZb/g9tS0SduBCtRZMCWlsu9K6lkekJU7LI=;
        b=LHqIFZ1krtEMq7/VGLJeCH8MOz8MKficnuZOI6973qs4xshTsViIJDpZjAYB2dnSVr
         h05Z/ePw6ZiHyc/XG1Rej6FObsSNLvdsKeSBGOJ/16W00oZ8NhyCsaAy0Z6vDmnP58aB
         nQeso7s066uszELK2zVEZH4JUvaSXFUC0H+sRGT9r0Fn6TgPyRfU1lCzMo2lWLoABpuQ
         orn4RhG50CRj8HBjGVcuTt28bFKodL/4zQxXtRaOp3IimwnF2IfHRTn5fUPNdmjc84hF
         +Dh33WzE87TVHAdKXNr4BD1jR9zpBvrDnQy6Dd6bHfsl2nb/TPe9K70MPDltos87wvSC
         wHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770562312; x=1771167112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J2jwraTseZb/g9tS0SduBCtRZMCWlsu9K6lkekJU7LI=;
        b=bTmy+KVa4VxR5mvYpfSZXaJ+1C7c4/jUyyg4CvYESM686tjkA718Bye2iEijsSZXl9
         qniwZVGBsgSks48q1kvZ//q8TRNVTsaFqj8GVUalrr2P84B1hj91uaqx0tqJECJAGlbZ
         C9gdhzSEnNGzyOD+irjrXlXwXALnoyvzdkeTNqooUzjJniAdECoJP+6/9/6iuBhH5hC1
         8wKZqv8ZY0Cm6MnUYk1Yx/fB3+L3TEo8+qYN5ZHKtfBed6Gmf65METf906jtSWZ518oq
         uUpt7txowwaE1W3kbYyr4ot6jEvfkUz1LyupX3A3odiHey7dRuNnYnFhMz8dtJ8F9/5q
         zWTQ==
X-Gm-Message-State: AOJu0Yx6psPqlsM2A0ZA3Bh6mfHmPcUzAcd9eCaELuZzPIFfV9ZpNPwM
	Qyzt5rR/jf74MEDueHCXtxnKpLcTHnQLc72FS9gZmaJdOiNsCilzfyYjt/L1sg==
X-Gm-Gg: AZuq6aLTPXeJcj1z2AwHS4giZ2gk8+uNR4ARqOXnY2M8DhetOgGohNpA3VkE1RSTIOF
	jgvvVxNpViF/6m/Kc15bEe6UFMyjp1IFMSiwQzq54n1Gu7B+SecMebgfrN1KkMVUIstUC4YmWN/
	jmlON07qwOpoW3lxnzGG2hAotYbBIVhKfRTGKarm9Csc7wE+b9Kij8SEliyf/2HaB0luCCiLlhT
	0qh1lq0/0ZY+5EZUTvCzNyiyzT3BSuASkgI2oulq1BkFoKkjVNn/mrewlft/MagcFzvHsRu+wiq
	jP4ste5xKfrcm37y3HkUWfUj0qJjD3/enxxXkymX5RNan5UbbajSZIk8G6l1aoBO6jKT4PnIIY7
	9gP87C9AMK8rafQ/ui9oCabayVcKmCcjnRpNWryQmy+xPiXchLqCmRg3/STVTpGEP8c8aBxBWiz
	71E1lWKG5jjHSJ/dJ8aZY=
X-Received: by 2002:a05:600c:c4a7:b0:47f:b737:5ce0 with SMTP id 5b1f17b1804b1-48320231161mr108257015e9.23.1770562311788;
        Sun, 08 Feb 2026 06:51:51 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d2ba61sm402354155e9.1.2026.02.08.06.51.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 06:51:51 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 07/10] gnome-tweaks: upgrade 40.0 -> 40.10
Date: Sun,  8 Feb 2026 15:51:40 +0100
Message-ID: <20260208145143.20464-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260208145143.20464-1-skandigraun@gmail.com>
References: <20260208145143.20464-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 14:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124280

Changes (note that there were no intermediate releases):

40.10:
This release includes a fix for the broken GNOME Extensions link and
several translation updates.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...eson-fix-invalid-positional-argument.patch | 33 -------------------
 ...e-tweaks_40.0.bb => gnome-tweaks_40.10.bb} |  3 +-
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch
 rename meta-gnome/recipes-gnome/gnome-tweaks/{gnome-tweaks_40.0.bb => gnome-tweaks_40.10.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch
deleted file mode 100644
index d921ff3308..0000000000
--- a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From dc9701e18775c01d0b69fabaa350147f70096da8 Mon Sep 17 00:00:00 2001
-From: Mae Dartmann <hello@maedartmann.name>
-Date: Wed, 16 Feb 2022 06:08:41 +0000
-Subject: [PATCH] meson: fix invalid positional argument
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gnome-tweaks/-/commit/dc9701e18775c01d0b69fabaa350147f70096da8]
----
- data/meson.build | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/data/meson.build b/data/meson.build
-index fd6d5da..74f7e82 100644
---- a/data/meson.build
-+++ b/data/meson.build
-@@ -1,5 +1,5 @@
- appdata_file = 'org.gnome.tweaks.appdata.xml'
--i18n.merge_file(appdata_file,
-+i18n.merge_file(
-   input: appdata_file + '.in',
-   output: appdata_file,
-   po_dir: '../po',
-@@ -8,7 +8,7 @@ i18n.merge_file(appdata_file,
- )
- 
- desktop_file = 'org.gnome.tweaks.desktop'
--i18n.merge_file(desktop_file,
-+i18n.merge_file(
-   input: desktop_file + '.in',
-   output: desktop_file,
-   po_dir: '../po',
--- 
-GitLab
-
diff --git a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.10.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
rename to meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.10.bb
index a8d6a2ad69..e0467ba10f 100644
--- a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.10.bb
@@ -17,10 +17,9 @@ REQUIRED_DISTRO_FEATURES = "x11 polkit systemd pam"
 REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
 GIR_MESON_OPTION = ""
 
-SRC_URI[archive.sha256sum] = "f95f3fe031b0b01c02f79a1659f889152d3772ae3e44df8403d1460ba5eec36a"
+SRC_URI[archive.sha256sum] = "cffd3b33a399577fbb4491ce8fbd02f54c5924f1056f30114e8d420290ef23fc"
 SRC_URI += " \
     file://0001-Make-python-path-configurable.patch \
-    file://0002-meson-fix-invalid-positional-argument.patch \
 "
 
 EXTRA_OEMESON = "-Dpython_site_dir=${PYTHON_SITEPACKAGES_DIR}"

