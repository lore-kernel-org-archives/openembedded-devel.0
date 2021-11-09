Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09045C433EF
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 17:01:44 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.15053.1636477302945460133
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Nov 2021 09:01:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q3To2E7x;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id r80so8740931pgr.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Nov 2021 09:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hT9Fr+Gmd2Dy9OJDnxLBpY8wTZ3wLt4Le0STMY1Hwpw=;
        b=Q3To2E7x6/2s1HdJuqtEeiLllJ+UX2bJAt6T6KGXYSfF0V9UM54Yd/0x1Ig2/69PHR
         EI0hpsbfYKMSFRD33uXpswlrCag2XnKLqTyOtlWb/9Vt4XIo5qwcwM3Ok8GyiakrxaOZ
         vywK7x1imkQZXb2ZEVJTLGfJk6wW795kpWggISxKjZbwgpp/CS5m4/G15XAxGW8TrY3b
         WNV9oZ3geAF4W6jaCyv5KM6XTOVf4STcSeUTc2+O7aYms4+dOHenQ4PYH89O71UpQDkA
         OvMHyJ/OLq2hwKXuJMfhEv138ugpwN8PtjL1P34PM9TRQNQrGy4wqTfcRaKqWI+kGoKd
         vGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hT9Fr+Gmd2Dy9OJDnxLBpY8wTZ3wLt4Le0STMY1Hwpw=;
        b=KtDC37wvkiv/ZmrJaUqAqGcALOV3NzMnf98K2TfrUpc3h9TJawRzFA0pS8oO05uM6o
         6ppLxbDCJqD4qSEF7d4+UyFEPQlcDoh6bhMl0YH9uvOKZqNm5ujRbU9Qvf1m0oBdctjF
         W+Kljjc+S++zTduBE4KgS8Z2bBOqHJy47ydhhZ2eXoIvpwWXIln3s98BtNM8ieWQc4d8
         BGPjmiyn9VgjDDBpe3bvmKQvl6FuAsAEKdR+tB4gTJnfWU/jQhBRVhf3VEZ2F1xSVRM4
         9JV1fbqGPi+6eun09N8gwa9ChzseRjnjyaDQxx8GD2/y/deE7tF6RZa9reyVuTLdRTHU
         KHwQ==
X-Gm-Message-State: AOAM5300BxUrh7ylyuS75AxlnideHS9GePu7qmnR9cEctt+Ai8vo4OSs
	OYnOvG2aqVMAcrz3o2m6ojTh3LHxjNQ=
X-Google-Smtp-Source: 
 ABdhPJwHQmv8s6QFm8qMZ3WSXjKF1dso7PHEtks3ytVjPNVf8PKNCxHlEmm657kMl3GHf9/z1jgAzQ==
X-Received: by 2002:a63:6b84:: with SMTP id
 g126mr7175504pgc.110.1636477302062;
        Tue, 09 Nov 2021 09:01:42 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:16ce:5a14:d81a:4e0d])
        by smtp.gmail.com with ESMTPSA id
 c1sm11292314pfm.77.2021.11.09.09.01.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 09:01:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][v3][honister][PATCH]
Date: Tue,  9 Nov 2021 09:01:40 -0800
Message-Id: <20211109170140.40651-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Nov 2021 17:01:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93888

Missed tabs and spaces in the SRC_URI during
'Update SRC_URI branch and protocols' translation.

[V2]
Fix typo in imagemagick, change "gitk" to "git"

[v3]
Give a typo, fix a typo

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


