Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A584DC433EF
	for <webhook@archiver.kernel.org>; Sat,  6 Nov 2021 18:39:59 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web12.22407.1636223998523072784
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Nov 2021 11:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JOqUnN+U;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id m14so12020204pfc.9
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Nov 2021 11:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nueki04QwGIZaPQkKFDH6cNry9NvB1vtpgWLw0O+npE=;
        b=JOqUnN+UQIx47rhhnS2OmLmWRTg/DuS7GcKKZbluWiQke5jZNEa61GpcuVB9DkM1Va
         GexMbf9RQXsVlVaeZ/DNcbGYGFrlOtyJSOLObkLhkrr+PJQAn8jtpSaCGWCz55hMnlzm
         h7UVpKSl+51F+UXPdR44R5qS4KAm8/3R4R3TH0cy8TKMA8tFKnxVh6KrwpR0Zm+rQXkL
         J7TaVhqiHipvtea61kipJ7m1EEyaNDmGcMkhj7ocP5jb6LFzjAAL64w9ht/2y+vu5gHc
         L7NQAyUvvpK9D+rRTg8rz5vs4TpRLTr/mBcxKQ7XAVuUgYhsBefQKZq2cecc1qcv5PpA
         Wtlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nueki04QwGIZaPQkKFDH6cNry9NvB1vtpgWLw0O+npE=;
        b=rqmu9ZTGa2oqEKL7aGNvEK17cPfoBnl7llILT913DXImtDUxdaB+gK+/NMP+nrPn/e
         40Dqv5Se38BPy52Da4PH541xwLHO+TeJ+iIwqc0bo63sOhAaw18gl0rWjjQ7DUKozt9x
         RwFcbPHkQIX/METdZ6UpqwC8hNQvYM1lKVPUB7MY2WMeDF7jfbEwvReygU32EfONo2vQ
         OPFLM4kdHKmP54w6+ZS+QUPjiWQ1nyu8oD3wi4OgCzT4vDOmgaEUgbf3a4kVcBsPe/JT
         Zv/AJbrbyHFH5+P7MB+DYf12Jxb4O4Qx2nVEQq8OLhfYziPD4BvsKzd4AgzS6QNlETmE
         oI0g==
X-Gm-Message-State: AOAM530vwYn9j0vfC5M6IveXFBKt4DCiwuI26CBmGYY/PcmFxT4+Sas3
	x3woLuHcd1a+JWP1Mqc0z2j05lW6hJ8=
X-Google-Smtp-Source: 
 ABdhPJyBBUwkkYPvq8NDLC1AqQ0DlVSMLeCji/IHggDkTfe8yjtU92p41EmvsQKkmjlZR0T1vZhc+Q==
X-Received: by 2002:a62:8343:0:b0:49f:a2a1:e64 with SMTP id
 h64-20020a628343000000b0049fa2a10e64mr11046252pfe.79.1636223997634;
        Sat, 06 Nov 2021 11:39:57 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:68d9:b431:d568:20cb])
        by smtp.gmail.com with ESMTPSA id f4sm160248pfg.34.2021.11.06.11.39.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 11:39:57 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][honister][PATCH] recipes: remove tabs and spaces in SRC_URI
Date: Sat,  6 Nov 2021 11:39:56 -0700
Message-Id: <20211106183956.869978-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Nov 2021 18:39:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93860

Missed tabs and spaces in the SRC_URI during
'Update SRC_URI branch and protocols' translation.

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
index 1b41732ecd..93493c3c3f 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -11,7 +11,7 @@ DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
 
 BASE_PV := "${PV}"
 PV .= "_25"
-SRC_URI = "git://github.com/ImageMagick/ImageMagick.git ;branch=master;protocol=https"
+SRC_URI = "git://github.com/ImageMagick/ImageMagic.gitk;branch=master;protocol=https"
 SRCREV = "8b4e00829eb84d4e7b4da11acf1f98f1e8166e5b"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


