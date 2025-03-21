Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 156BBC35FFF
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 11:21:00 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.18963.1742556051184955303
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 04:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h4QMh/G1;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so3492201a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 04:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742556049; x=1743160849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3O40iyPsHgTmCFiHM3Aif3JimGyp2VmkrVmLt77yi1w=;
        b=h4QMh/G1JCI6E4uDjSrcQJmbPVQEVA6Vj8oMSKdeeKKBXvp9R7x4Wa+Xdihjo/yj6y
         o8QjUv6LjBwuxc2PiMHIbVA32TVd+uDHjXO2LtUQj2SQfPLS1gTpyY4+/qHc3yHjfo6c
         /mxtGsKYwi3BtBKHiyERDXOqdvWqgyV234WIfg3aTF91MN7OvEL0UNDLEEZ7/RmND4jp
         PIfK5juUyViaCjuHLfLAKKanrY8iXfpXQe6GewX66PZvRYQX6Lr9qcC3iNt74iQDYnaR
         YhDhs+fLQH/Y032yD6a+oAkV1QJcT6mUgsCddgmyfmT07YQ5TCznz4pVBMmwfQseXd2J
         ARVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742556049; x=1743160849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3O40iyPsHgTmCFiHM3Aif3JimGyp2VmkrVmLt77yi1w=;
        b=OY+MMvFVIR/oCfPOk6EMm103KysaGiJs/QmrG31xDvx0KwGxBkmRaMtbDTi7NSfU04
         584aoy9/x/axEWXqGAg8fOz+6k1UThhHdYOmUtNyNemphW16uVoZqy5lU47bkDPyUpZw
         uWYU1bbgw0pkE4xHCCdTsLvTAFrIHv43lmgUWWpPl1jeITdUIcW1ThrzgKOsQqOja/EU
         q9KtbU1jGNLKj8bnTJ2rimO6ozFuIYu37Upgad9qE94WCMJbMpC+aLzCfMxopkXnIiVe
         fxS5lwgwxlL/JrhZx98Kdm/a3yQ/QEgSshDObiGYQ0YNLgg4B3u4i7nnWijiwCH6IBLG
         3BuQ==
X-Gm-Message-State: AOJu0YyCUoY6EZHmLq/ba1s2dLKKDxsU/52dnP7FtfHyEY41P1/XgqXg
	8s2mESMv5WTrTezj/V3S7iThj5cP6WzVGhc6U5+26hoVxWMRswMPv5w3bw==
X-Gm-Gg: ASbGncuZ2SyJQeE7C/KmC0wGgCy22p0M7jPfM7bnqddoprdgUqQ/iH3x5mcsO66LnOz
	bBVPLcE/RoxOPOSICfYIRjJmmZ+7tmjXWV98TnfKYL7Rv2akEJZAmMLMUuPI9GYVCuIinwh/wUa
	fe+3bpeVi9Yghakm4kIc0D9xH5YCFu0mKyYJhnz8SwtNjUHE7LxFMxRafhMgho+1pseDEo1BhBQ
	0DGJpdtoheuo19iO5v1L4CvX1hICVneM2ltYbbB4xgqqXXZzbxjjcaiK7kjYZOYCjI+Ya7uAIp9
	7Y/Oy0c3NQxclPPv0oVCv2RGOKWXa7Alw45zLO5dhjrQjzGiZ1YbChYbO5S3uxriXg7OevKAOve
	41xZMzI7Smj5k
X-Google-Smtp-Source: AGHT+IFe7WxOyQA3Qa61BlQnSa346JnRxMCCNAoNuRsAVtvPt8w3wr4mfYA4NVIPdRHTUHc9p3bJaA==
X-Received: by 2002:a05:6402:354a:b0:5e0:8a34:3b5c with SMTP id 4fb4d7f45d1cf-5ebccb9875bmr2948094a12.0.1742556049083;
        Fri, 21 Mar 2025 04:20:49 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5ebccf85890sm1191472a12.24.2025.03.21.04.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 04:20:48 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] lvgl: add PACKAGECONFIG for thorvg
Date: Fri, 21 Mar 2025 12:20:42 +0100
Message-ID: <20250321112043.2425580-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 11:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116182

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lv-conf.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
index 9186015537..41133f3438 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
+++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
@@ -3,6 +3,7 @@ PACKAGECONFIG ??= "drm"
 PACKAGECONFIG[drm] = ",,libdrm"
 PACKAGECONFIG[fbdev] = ",,"
 PACKAGECONFIG[gridnav] = ",,"
+PACKAGECONFIG[thorvg] = ",,"
 PACKAGECONFIG[sdl] = ",,virtual/libsdl2 libsdl2-image"
 
 # Add libdrm include if drm is selected in PACKAGECONFIG
@@ -32,6 +33,10 @@ LVGL_CONFIG_LV_USE_GRIDNAV = "${@bb.utils.contains('PACKAGECONFIG', 'gridnav', '
 
 LVGL_CONFIG_LV_THEME_DEFAULT_DARK ?= "0"
 
+LVGL_CONFIG_USE_VECTOR_GRAPHICS = "${@bb.utils.contains('PACKAGECONFIG', 'thorvg', '1', '0', d)}"
+
+LVGL_CONFIG_USE_THORVG_INTERNAL = "${@bb.utils.contains('PACKAGECONFIG', 'thorvg', '1', '0', d)}"
+
 DEBUG_BUILD ??= "0"
 
 ALLOW_EMPTY:${PN} = "1"
@@ -77,5 +82,8 @@ do_configure:append() {
         -e "s|^([[:space:]]*#define LV_USE_GRIDNAV[[:space:]]).*|\1${LVGL_CONFIG_LV_USE_GRIDNAV}|" \
         -e "s|^([[:space:]]*#define LV_THEME_DEFAULT_DARK[[:space:]]).*|\1${LVGL_CONFIG_LV_THEME_DEFAULT_DARK}|" \
         \
+        -e "s|^([[:space:]]*#define LV_USE_VECTOR_GRAPHIC[[:space:]]).*|\1${LVGL_CONFIG_USE_VECTOR_GRAPHICS}|" \
+        -e "s|^([[:space:]]*#define LV_USE_THORVG_INTERNAL[[:space:]]).*|\1${LVGL_CONFIG_USE_THORVG_INTERNAL}|" \
+        \
         -i "${S}/lv_conf.h"
 }

