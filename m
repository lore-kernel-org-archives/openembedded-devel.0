Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF90C433EF
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 00:48:41 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web08.1814.1645836521210640033
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 16:48:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W6mGpUL+;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id o8so6057601pgf.9
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 16:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y/+GR7OeuoDDXO2ebsPimOIszl518ugYFtPaTQzl4P4=;
        b=W6mGpUL+/+GmlmA7Ew6jtsHvPbM3XEEd+240OR8vNYGwSBVVIXnKgF/owbcVfkXkJU
         64D8Dv75UWc38Whgh58zdzZj5o88r/Czfa+poRJcMbMGYz44fjVkPvBKjRlGeYBP4juX
         ydAxVfBI5gr99jdGmOuvHbYqjtjcrRp8ybLQltW9OGewFm72s06OIGXwUmE3z1U69xhe
         AwysWJicrSBFrhmFTjjQ7WCngfohQNuqVQgbjeJNxiKgfnvXWiJWydL8aAs766BKhMxG
         tR/nik970IFc6UcEBUgEMV0TusROM289/FDaWJNmMCykPRjJbriVZG5sqIvsnvj8Fc2r
         D93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y/+GR7OeuoDDXO2ebsPimOIszl518ugYFtPaTQzl4P4=;
        b=S68cHYBVc63YWxEHZ5is24A5xI2ikao6IPy9kceYInWRi+CPijYgg55lHFS8DYx5MT
         vSBZYnMEWRns7Ux9fD2ZnTzc1nWTSRUVQr7HUekmp+Z/meEq+LcgbGKIlIS5UlHh62H6
         iSdit2j3Nms670EFqC56eWfeZ4BgBrDpA7446QrASBN5h4CQ/nu1omIuKApkDwieEECk
         s0t+MbzKnvWlnl7lCJ7VAZ63SFxWhC5hcGfBzrELgh6fpwU1KsnTRkgOC0JkeI8Kfg39
         6jfU4DDX52MVNDnbkmsiMcS6jyNxVSCZMXQuRdkpx7+FabN3gG2LJpCJy0IYaEGcsYtu
         Gdfw==
X-Gm-Message-State: AOAM532+U7i+/NdD8H+BHC//ddHVlEWf3uPOZqS2xPxF0qNtwSH0szcd
	R7z26hdWeXtMmv9RvIy6PctjDpf5cQ4=
X-Google-Smtp-Source: 
 ABdhPJwpObfNRxHKAFy0fY48tdy0p6g+8aKr8OKYYM3bL2IpMGuOgrI/AaknS/nRI6A/6PxWbG2+rw==
X-Received: by 2002:a63:e54d:0:b0:375:5987:af5d with SMTP id
 z13-20020a63e54d000000b003755987af5dmr8307107pgj.14.1645836520196;
        Fri, 25 Feb 2022 16:48:40 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d615:a2e3:253b:5be5])
        by smtp.gmail.com with ESMTPSA id
 u25-20020a634559000000b003747f87e98asm3729112pgk.54.2022.02.25.16.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 16:48:39 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-oe][PATCH] python3-distutils-extra; merge inc, fix wheel build
Date: Fri, 25 Feb 2022 16:48:31 -0800
Message-Id: <20220226004831.682543-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Feb 2022 00:48:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95528

We have not supported Python2 for quite some time now, so there is no
reason to maintain a separate inc file.

This recipe does not inherit pypi and the PN does not match the built
wheel. Set PIP_INSTALL_PACKAGE appropriately so the wheel can be found.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-distutils-extra.bb   | 9 ---------
 ...stutils-extra.inc => python3-distutils-extra_2.39.bb} | 8 ++++++--
 2 files changed, 6 insertions(+), 11 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/python/python3-distutils-extra.bb
 rename meta-oe/recipes-devtools/python/{python-distutils-extra.inc => python3-distutils-extra_2.39.bb} (82%)

diff --git a/meta-oe/recipes-devtools/python/python3-distutils-extra.bb b/meta-oe/recipes-devtools/python/python3-distutils-extra.bb
deleted file mode 100644
index 580842d0d6..0000000000
--- a/meta-oe/recipes-devtools/python/python3-distutils-extra.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require python-distutils-extra.inc
-
-inherit setuptools3
-
-S = "${WORKDIR}/python-distutils-extra-${PV}"
-
-RDEPENDS:${PN} = "\
-    python3-setuptools \
-"
diff --git a/meta-oe/recipes-devtools/python/python-distutils-extra.inc b/meta-oe/recipes-devtools/python/python3-distutils-extra_2.39.bb
similarity index 82%
rename from meta-oe/recipes-devtools/python/python-distutils-extra.inc
rename to meta-oe/recipes-devtools/python/python3-distutils-extra_2.39.bb
index 3430cedf63..8aca4ca3ac 100644
--- a/meta-oe/recipes-devtools/python/python-distutils-extra.inc
+++ b/meta-oe/recipes-devtools/python/python3-distutils-extra_2.39.bb
@@ -5,9 +5,13 @@ SECTION = "devel/python"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4325afd396febcb659c36b49533135d4"
 
-PV = "2.39"
 SRC_URI = "https://launchpad.net/python-distutils-extra/trunk/${PV}/+download/python-distutils-extra-${PV}.tar.gz"
-SRC_URI[md5sum] = "16e06db0ef73a35b4bff4b9eed5699b5"
 SRC_URI[sha256sum] = "723f24f4d65fc8d99b33a002fbbb3771d4cc9d664c97085bf37f3997ae8063af"
 
+inherit setuptools3
+
+PIP_INSTALL_PACKAGE = "python_distutils_extra"
+
+S = "${WORKDIR}/python-distutils-extra-${PV}"
+
 BBCLASSEXTEND = "native"
-- 
2.30.2


