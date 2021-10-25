Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29C7C433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 15:47:40 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web09.45.1635176860383515729
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 08:47:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y9ZXpaVM;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id u12so4538591pjy.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 08:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HWBJZ0xUwLA8F4IyblqvecQdmabzAiiyZBH4eypC98w=;
        b=Y9ZXpaVMKp1hr0G2O9rB4TIDJXKDuBK8uS/AXvCCxenIr3cFAKhQQnOQFvvqTCY259
         NHB3Q9yMX8/w+nEjx7d9UfjBkgK6QB6WLiI9xRcUzWieCd78EQsA/mw5Wo7w7kk0Xjf5
         vlx3Xtx5GhGzG32wyTmSW2+k0JdwMXJvkZw5nbO8pg1XhhAaUrdzIuZ+//KuijOn/0jB
         wuYqQe/psOaIVUcXn9Kj2YIqUQgggNUEvCZ1kPG9RpcoiSiHunR1bBEOlWX1vGsQcLET
         9rzBmB7JV9ZHleC2w8UcGC6Jdwt4UjDA9OYkCSLW/rw7bxx/4lgiA9ScqntM8MYcGfPg
         iQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HWBJZ0xUwLA8F4IyblqvecQdmabzAiiyZBH4eypC98w=;
        b=0TAUsc/vIU43g8sauxlyHACkSGsB9j5dJQc6u4B960NmgXuLgOTMTH6ZDgR7Y5e9jf
         AzUG6xJlM7SvfmajrMT0hicuZDwlO/+mXWCq1/YpCtQrYf+pxtm5Zv/P5Al03V47XXKH
         ow0gXhwYrt4mZ8SyHtctW+0GkKAJRlyYD/a2I/GAlgXfL1Wvb7ZPomOZDxxtV2zM7e/1
         9M+UMaP76SKG09xy0CF0oPWF7+DeA4jzRxlrVJXt02EUEX5XPga90aCEcWqXPIIkxmQA
         SUDR9sDOCaoM1WU00z93uekzNcCju3sxWeW6XJ5cP+tU5YyTIEiVkSnuRAdLwOjbyvaC
         2esg==
X-Gm-Message-State: AOAM531wRYF3zscqOfCXg1jtcpO2yTR9osYPKcmkesbgKYPKjeVNgbly
	ayijP746NwiicmoChq5NzQT8/oCDpbY=
X-Google-Smtp-Source: 
 ABdhPJxDl75Ma5AVmiCCw/Bas5mPBVaTgCJAmYifpiBcOjKHwTRllosiJI5ElGM5B1iucNqXga1H1Q==
X-Received: by 2002:a17:90b:3ecc:: with SMTP id
 rm12mr21669688pjb.48.1635176859577;
        Mon, 25 Oct 2021 08:47:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8f6a])
        by smtp.gmail.com with ESMTPSA id
 lp9sm20870874pjb.35.2021.10.25.08.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 08:47:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Philippe Coval <philippe.coval@huawei.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] lvgl: Lint recipe
Date: Mon, 25 Oct 2021 08:47:36 -0700
Message-Id: <20211025154736.858903-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211025154736.858903-1-raj.khem@gmail.com>
References: <20211025154736.858903-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Oct 2021 15:47:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93569

From: Philippe Coval <philippe.coval@huawei.com>

Forwarded: https://github.com/openembedded/meta-openembedded/pull/461
Relate-to: https://github.com/lvgl/lvgl/issues/2534
Signed-off-by: Philippe Coval <philippe.coval@huawei.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lvgl_8.0.3.bb | 23 +++++++--------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_8.0.3.bb b/meta-oe/recipes-graphics/lvgl/lvgl_8.0.3.bb
index 5f37efda79..2ca7f60e85 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_8.0.3.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_8.0.3.bb
@@ -1,19 +1,16 @@
-# -*- mode: bitbake; c-basic-offset: 4; indent-tabs-mode: nil -*-
-
 # SPDX-FileCopyrightText: Huawei Inc.
+#
 # SPDX-License-Identifier: MIT
 
-# TODO: Pin upstream release (current is v8.0.3-dev-239-g7b7bed37d)
-src_org = "lvgl"
-SRC_URI = "gitsm://github.com/${src_org}/lvgl;destsuffix=${S};protocol=https;nobranch=1"
-SRCREV = "7b7bed37d3e937c59ec99fccba58774fbf9f1930"
-
+HOMEPAGE = "https://lvgl.io/"
+DESCRIPTION = "LVGL is an OSS graphics library to create embedded GUI"
+SUMMARY = "Light and Versatile Graphics Library"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE.txt;md5=bf1198c89ae87f043108cea62460b03a"
 
-HOMEPAGE = "https://lvgl.io/"
-SUMMARY = "Light and Versatile Graphics Library"
-DESCRIPTION = "LVGL is an open-source graphics library providing everything you need to create embedded GUI with easy-to-use graphical elements, beautiful visual effects and low memory footprint."
+# TODO: Pin upstream release (current is v8.0.3-dev-239-g7b7bed37d)
+SRC_URI = "gitsm://github.com/lvgl/lvgl;destsuffix=${S};protocol=https;nobranch=1"
+SRCREV = "7b7bed37d3e937c59ec99fccba58774fbf9f1930"
 
 REQUIRED_DISTRO_FEATURES = "wayland"
 
@@ -24,17 +21,13 @@ S = "${WORKDIR}/${PN}-${PV}"
 
 EXTRA_OECMAKE += "-Dinstall:BOOL=ON"
 
-
 do_configure:prepend() {
     [ -r "${S}/lv_conf.h" ] \
         || sed -e "s|#if 0 /*Set it to \"1\" to enable the content*/|#if 1 // Enabled by ${PN}|g" \
             < "${S}/lv_conf_template.h" > "${S}/lv_conf.h"
 }
 
-
-FILES:${PN}-dev = "\
+FILES:${PN}-dev += "\
     ${includedir}/${PN}/ \
     ${includedir}/${PN}/lvgl/ \
     "
-
-FILES:${PN}-staticdev = "${libdir}/"
-- 
2.33.1


