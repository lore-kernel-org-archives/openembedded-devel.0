Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F8FEB64DE
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 13:47:55 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.22641.1725972767677688110
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 05:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WOLnXkDX;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: tolvupostur@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42cc8782869so2128825e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 05:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725972766; x=1726577566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gCvSj//zLrTEnCeZQBIZo3ppWqLe5QGjHCTytUvdVeo=;
        b=WOLnXkDXNlaoJ322zOXvieHUfR6hStIFPtehVymhZgMsZorQmEIk/ah91nZnk39KbC
         Ftzscmi6Izptr+dW7p0gujGEa5IJf6w08CDw18xRQEfHxxBOoP/wbGiDz1NSkCWFP0+Q
         OODfRq0FrEzuxlvv8GkHK5svH8dBU7iZ+0iT2I6s10lA4ULgBLF+GDfRidqIRdkIHwPG
         aMVi0i0sxW0CC7i6qPwbV+EkI25anCCGc2sSomDJMV2hT7T70M7hdqhDLO8c1eDajkxy
         fzLkofsz1O8E/zWldl3qxXlH1KdS2yGrEnUBfZGW/FpT1VdCh7R0uCHAkGS2PuGfwZDE
         WeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725972766; x=1726577566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gCvSj//zLrTEnCeZQBIZo3ppWqLe5QGjHCTytUvdVeo=;
        b=cjUQD162l54k9pyx5DUnPXQJYSLiE3v4bJkzQ/sg3tJnskm5CNBdil2ATufopGYJrB
         sbnqsY8DmpqGr3XVGuSwlFU5l0qflLU0CMdOQQBasKkvH7kznSdo9tvycgHdWczHXnER
         vsDQLJs+bHc+/b7SX6zOKvC4XRFDcaupHNqVqBVFm59skUSNz37JlPlIRO8ByXe2TNIv
         /n4VbJRjtIEvEfV6U9eEytNTz5ka3B3vQZYCiaQ8Pm56QzrGGK9wQsyWjXuGDCzQJvl+
         26lTH2QEB5Tql7yCQxbiXBkx371mZIAYNALkCsAIS/3hj21JWIlG5MDs18g2H76VAabP
         33Ag==
X-Gm-Message-State: AOJu0YxYlf1cPoAA5gogKBlN/Tnz1NkMJMtJtjfP5Ygg9QzLVTdEY4zp
	0lYLIseXPOEMD3quL+3svtcO2y+BXzd0M0JZKwfWWiKe9jvlUmpGkm4/4Yuw8QE=
X-Google-Smtp-Source: AGHT+IFcheaFulmaPJa3w1BnXrC3DbBZFoOwi3ToEuWXN1GgFiaSp+W7mM4nKjYC47uhtIqgZJ5jcQ==
X-Received: by 2002:a05:600c:5493:b0:42c:b3e5:f688 with SMTP id 5b1f17b1804b1-42cb3e5f779mr63621175e9.4.1725972765562;
        Tue, 10 Sep 2024 05:52:45 -0700 (PDT)
Received: from vision3-sde.. ([213.255.218.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895649b88sm8888304f8f.6.2024.09.10.05.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 05:52:45 -0700 (PDT)
From: "Einar Gunnarsson" <tolvupostur@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Einar Jon Gunnarsson <tolvupostur@gmail.com>
Subject: [meta-oe][PATCH] v4l-utils: Install media ctrl pkgconfig files
Date: Tue, 10 Sep 2024 12:52:39 +0000
Message-Id: <20240910125239.21286-1-tolvupostur@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 13:47:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112230

Commit 5f453c3401e20eb5489fac4d3b54a5bf96d019ab installs
libraries but without the pkgconfig files, making them harder to link
to. This adds pkgconfig files for these libraries

Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
---
 ...l-Install-media-ctl-pkg-config-files.patch | 49 +++++++++++++++++++
 .../v4l2apps/v4l-utils_1.26.1.bb              |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-media-ctl-Install-media-ctl-pkg-config-files.patch

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-media-ctl-Install-media-ctl-pkg-config-files.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-media-ctl-Install-media-ctl-pkg-config-files.patch
new file mode 100644
index 000000000..8a009ae80
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-media-ctl-Install-media-ctl-pkg-config-files.patch
@@ -0,0 +1,49 @@
+From a422ddf7f8805d34ff1fbb46d335993c9cd05ead Mon Sep 17 00:00:00 2001
+From: Einar Jon Gunnarsson <tolvupostur@gmail.com>
+Date: Fri, 10 May 2024 11:56:17 +0200
+Subject: [PATCH] media-ctl: Install media-ctl pkg-config files
+
+libv4l2subdev/libmediactl can not be used in projects without the
+pkg-config files. This adds them as well.
+
+Upstream-Status: Denied
+
+This is an add-on to the previous patch:
+0001-media-ctl-Install-media-ctl-header-and-library-files.patch
+so same restrictions apply.
+
+Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
+---
+ utils/media-ctl/meson.build | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/utils/media-ctl/meson.build b/utils/media-ctl/meson.build
+index 40669b4c..6feba1af 100644
+--- a/utils/media-ctl/meson.build
++++ b/utils/media-ctl/meson.build
+@@ -38,6 +38,12 @@ libv4l2subdev = library('v4l2subdev',
+ 
+ dep_libv4l2subdev = declare_dependency(link_with : libv4l2subdev)
+ 
++pkg.generate(
++      libv4l2subdev,
++      name : 'libv4l2subdev',
++      version : meson.project_version(),
++      description : 'v4l2 subdev library')
++
+ media_ctl_sources = files(
+     'media-ctl.c',
+     'options.c',
+@@ -55,3 +61,9 @@ media_ctl = executable('media-ctl',
+                        dependencies : media_ctl_deps,
+                        install : true,
+                        include_directories : v4l2_utils_incdir)
++
++pkg.generate(
++     libmediactl,
++     name : 'libmediactl',
++     version : meson.project_version(),
++     description : 'v4l2 mediactl library')
+-- 
+2.43.5
+
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
index eb38d9713..8ab96760a 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
@@ -29,6 +29,7 @@ SRC_URI = "\
     git://git.linuxtv.org/v4l-utils.git;protocol=https;branch=stable-1.26 \
     file://0001-keytable-meson-Restrict-the-installation-of-50-rc_ke.patch \
     file://0001-media-ctl-Install-media-ctl-header-and-library-files.patch \
+    file://0002-media-ctl-Install-media-ctl-pkg-config-files.patch \
 "
 
 SRCREV = "4aee01a027923cab1e40969f56f8ba58d3e6c0d1"
-- 
2.43.5


