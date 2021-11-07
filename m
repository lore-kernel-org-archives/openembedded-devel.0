Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9217C433EF
	for <webhook@archiver.kernel.org>; Sun,  7 Nov 2021 18:39:41 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.34538.1636310380882824067
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Nov 2021 10:39:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nUaaghnV;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id c4so2194877pfj.2
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Nov 2021 10:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9SVWuIhhPzyc2B7kd7yE39hr5Ur8sRG3mVrQROiYpQs=;
        b=nUaaghnVi3Y53KeCv5kyleuf3Z2Ietb8vev1KenPDNs9hJmQXGIVJr/I6NFcH9exAK
         xwIt7c/XepVJ/DUTOw0zSwzDJassl0fNJndGFUbrW9cL+upeVNw904pvFD6zHIoKxtqz
         qJFecA9nFmcQ9ZQfX0xMxyE1kCSo4yZjFCTwwnyIWIqNi7Wb0KIlX4I31a3hDt6b/DVz
         7Y9VQi1LBNbVkYtgz6gJ4sSjNJJhpWVAr/9XR3OA67GS/JG9j7nnddb8Z+Q+vzCWEC90
         mRtu8NmG4iQC8MeKTCTgz0cN1GH0k5Qu+uAEgIn5j9P6gGRjxQpWKt4Ft9iUnXLUTaqi
         qOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9SVWuIhhPzyc2B7kd7yE39hr5Ur8sRG3mVrQROiYpQs=;
        b=GnDqVyCDxj8l6ayBheq1e+ABq6kvOGYsUeEFFvzY315A64PsPFWgM14yOD5eyXW43u
         YgYx5EYKAlgIabmPCZNqzOKUzDHolX99hkPx6/Vz/TMVyEzXjxRhvapCCdcsq7wWqkfk
         XNab6Hnq6SXd3fVbo1/uoW67aU+Ze5+NrmkdQN/kbkL1b3y+9hzXLJ9zs8mEVRI8PsnK
         RLGuc/z+jtpW4J9Hv819+GQU7H9xrfXmc/Oh/i5qDpQcxJ6E3qrxaeLeWXkExvW4dHYt
         RbjYUgmALMYFREi6dElVMneI4N98mhZHqLcYqwyp0sX+L++IWKFWDb1UPHFk51m8wya0
         pZtg==
X-Gm-Message-State: AOAM533wNgZZ2MK/YHMGylT1YCzeMiEHEYjHT6YEkERCGhGsjobrQzxK
	ZQO5XzgO+GBPMI7zsqwLnq1IEBF0M1c=
X-Google-Smtp-Source: 
 ABdhPJx86PWwnlYfZoYjC9Ln9Ch/dfMyAYmj9V5Olm/Dv5y7u6imx3wrRZ09GWTgNz8ADNdCDCn05w==
X-Received: by 2002:a05:6a00:15c1:b0:49f:d21f:1d63 with SMTP id
 o1-20020a056a0015c100b0049fd21f1d63mr2754555pfu.18.1636310380050;
        Sun, 07 Nov 2021 10:39:40 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:91fe:57b9:7728:4c4e])
        by smtp.gmail.com with ESMTPSA id
 mm22sm11026783pjb.28.2021.11.07.10.39.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 10:39:39 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][v2][honister][PATCH] recipes: remove tabs and spaces in
 SRC_URI
Date: Sun,  7 Nov 2021 10:39:38 -0800
Message-Id: <20211107183938.882549-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Nov 2021 18:39:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93867

Missed tabs and spaces in the SRC_URI during
'Update SRC_URI branch and protocols' translation.

[V2]
Fix typo in imagemagick, change "gitk" to "git"

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb         | 2 +-
 meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb | 2 +-
 meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb                 | 2 +-
 meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index 6ba58829e3..37d5d81238 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
 PV = "20210324.2+git${SRCPV}"
 SRCREV = "278e0a071885a22dcd2fd1b5576cc44757299343"
 BRANCH = "lts_2021_03_24"
-SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH}        ;protocol=https \
+SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            file://0001-absl-always-use-asm-sgidefs.h.patch             \
            file://0002-Remove-maes-option-from-cross-compilation.patch \
            file://abseil-ppc-fixes.patch \
diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
index cbc7a9a5eb..2c9e45fce7 100644
--- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/ubinux/dnf-plugin-tui.git;branch=master ;protocol=https"
+SRC_URI = "git://github.com/ubinux/dnf-plugin-tui.git;branch=master;protocol=https"
 SRCREV = "b0d80b7129f1d84cc563a4098d869e7420bcf4bc"
 PV = "1.3"
 
diff --git a/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb b/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
index 688c63d14a..84f6c3ce24 100644
--- a/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
+++ b/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 COMPATIBLE_HOST = "(x86_64|aarch64|arm)"
 
 SRCREV = "09724edb1783a98da2b7ae53c5aaa87493aabc9b"
-SRC_URI = "git://github.com/billfarrow/pcimem.git ;branch=master;protocol=https"
+SRC_URI = "git://github.com/billfarrow/pcimem.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index 1b41732ecd..3f2472ba7e 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -11,7 +11,7 @@ DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
 
 BASE_PV := "${PV}"
 PV .= "_25"
-SRC_URI = "git://github.com/ImageMagick/ImageMagick.git ;branch=master;protocol=https"
+SRC_URI = "git://github.com/ImageMagick/ImageMagic.git;branch=master;protocol=https"
 SRCREV = "8b4e00829eb84d4e7b4da11acf1f98f1e8166e5b"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


