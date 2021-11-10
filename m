Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B59C0C433EF
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 15:06:48 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web08.13004.1636556807373462088
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Nov 2021 07:06:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VakEw63r;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id b13so3303531plg.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Nov 2021 07:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bXTaZmX7k/gEuZWFvkRxMC8woiQSv/3b2vKoMHrHqj4=;
        b=VakEw63roAxSWhHvrb4qhxu3LN5pgHjmMQDNlx0BpZ7TqMCRZcQDiOOzoH1qf72qIc
         GuyWhWBIoFE2nIPD3qtCYhiNvc8F7wWiH0tlhPk6fxEOQurEN48S8PffivwcCuSr/yZn
         sUbxX2JqDVy+t2O2v2YXZMh4B1QX4c+f12hbtrdOaLnpRaw8e+nz7j8JB+h5F+4PY2m1
         aREWGuCGZ84yh2hJNeZAQbKw6UubA2UTKf0B0QzM4UtR1WMuBNaw5RF2BqnMiKyRRknJ
         ESdzNiX+plbt4eIJ1awWvdzD/PGwnS+2QvuWyPTymn+s1O+hZSpnrpGzk0dD6ekgcixm
         D6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bXTaZmX7k/gEuZWFvkRxMC8woiQSv/3b2vKoMHrHqj4=;
        b=gcXPlnOqTX3Q5a9ocJC8kZ8PJ42VzRs3B5d7V8a4DrZrK9Ro5aX47WF+bKmA4SJDNW
         BRskEeNMO9exxBX/TDoWe60/farCBNKmZNXLAxDegikWffXTP+0tEuvGoQH8Fj8CWuXA
         s4pCvAGuAypqVtwSOCzpad+tbPmKkoDSLNjUwrVzW39X8U877LFWK4z0iUoiAGoZtEAl
         2v4cRxRWeGb3zcfKIWHgXyVwN8f08dS1xfU8rLwON33iOaDNIiGRTcxg4yhMqzKYfuHe
         aOIAs46xbBlxVnKgoAx4cGswIW+U0ciOlfXrPId7uUoi62I3FMjULGo010uKJyg6J6IK
         qilQ==
X-Gm-Message-State: AOAM531kmukfd/fUOhuIqGmqYM8Th0H10AATHSqdjnl6QgaJ5l+MT/k7
	JhqYBqadB0IFwzleLDGqojE5h9oCO18=
X-Google-Smtp-Source: 
 ABdhPJzlPD8c5u14WtUb1ZoIJyO0fqiv530MEI8ifgnv/UrHsVfjA08Z70Ehol5Pp6bj2P3er2CkZw==
X-Received: by 2002:a17:902:8690:b0:13f:ffd6:6c63 with SMTP id
 g16-20020a170902869000b0013fffd66c63mr16223476plo.23.1636556806475;
        Wed, 10 Nov 2021 07:06:46 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:19ee:1da0:daa0:d5b4])
        by smtp.gmail.com with ESMTPSA id i2sm27065pfe.70.2021.11.10.07.06.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 07:06:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][honister][v4][PATCH] recipes: remove tabs and spaces in
 SRC_URI
Date: Wed, 10 Nov 2021 07:06:44 -0800
Message-Id: <20211110150644.57813-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Nov 2021 15:06:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93904

Missed tabs and spaces in the SRC_URI during
'Update SRC_URI branch and protocols' translation.

[V2]
Fix typo in imagemagick, change "gitk" to "git"

[v3]
Give a typo, fix a typo

[V4]
Give a commit summary (it was there in v2), but now there is only:

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
index 1b41732ecd..bb111a1c9b 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -11,7 +11,7 @@ DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
 
 BASE_PV := "${PV}"
 PV .= "_25"
-SRC_URI = "git://github.com/ImageMagick/ImageMagick.git ;branch=master;protocol=https"
+SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=master;protocol=https"
 SRCREV = "8b4e00829eb84d4e7b4da11acf1f98f1e8166e5b"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


