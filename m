Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C4AC4332F
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 11:10:25 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web08.18346.1665832218323779030
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Oct 2022 04:10:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BC8I3q9s;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id fy4so15422397ejc.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Oct 2022 04:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QEj3j5JDdnziMWbDHsImLlRgZ4N7FCOH5KnEFGeffOs=;
        b=BC8I3q9sZ+3Ip+460XI07hHrcjIuPM+VbUOTtwD3TUvkdcb+Skugvx3aoOZvfkuhtk
         oT+Ei9fklaalWQ2iXY+0EJtp1eJY3RwihzBcU6cN9Z04S9HWbgiI5zbDNXS0psx3eOaj
         /crCoob/wul8WgI7EqTCXyCnz8VkyA8iPmi5Ck40ZaTayM5i0npQ8LNEX1D4iEckb/Hk
         WowhXyekfAzT+B+cw7m/KZbSPLaE2W2TBVDmej5upj85kTSuR/FTYL8gAIJyTHr6tOpX
         gxvvMdK9BRmgShG0GgjogCUu6pGZrKDVBn+pWbYBSMH/qf6dPFlaIh0HICE2XD3nUMp+
         PdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QEj3j5JDdnziMWbDHsImLlRgZ4N7FCOH5KnEFGeffOs=;
        b=5bxcu2dG8l0rVDYOhMkb1tbtkt123za2LmBMqfF60kyY1eCyH1E8XKKMY5KfWrC0tH
         XarPQicnLgLwwgOyOfcBWT3o5VOSVzx3QnBVrSICytpgBzCRFqsFOFzcWJgoA8WxTd+U
         j/E/uk915qoJWoVYs0LMefTZfGAqFT7Z5g0Q5JtNVGfth1SogrrXiDgg7AjwwUVVqv1O
         BmxwWh6tdutyyi+8sBkDeuvdpbqccrwJq6MpQvZX3duuq5xNuKSUL7no2RU9o5CBQTK4
         G1dgitMGw+1Hk8yzOPZzFfl/adVNI6babv5Cr4Jv6QWD5BK021RFAoRHUXDqCukC+UZD
         gR2w==
X-Gm-Message-State: ACrzQf0+XU9EwyTHCucmCGDaQ4LYUKeN6JBBqrNAlz40WTkOjmmKWnoO
	FFHrhxkoA7D0NjGKqiTMBPCXnDULnFE=
X-Google-Smtp-Source: AMsMyM7j5HIfpkhq3U2RQC/nbv7Vi1Ho7FoATTvtpocJOyvOX0soNuZML4d+/VTe6iSf5Ra4TVTAlg==
X-Received: by 2002:a17:907:3f89:b0:78d:4cca:3643 with SMTP id hr9-20020a1709073f8900b0078d4cca3643mr1640718ejc.353.1665832216413;
        Sat, 15 Oct 2022 04:10:16 -0700 (PDT)
Received: from thanks-buchmuellers.speedport.ip (p200300f07f0b6339fe12cf1d98605f5c.dip0.t-ipconnect.de. [2003:f0:7f0b:6339:fe12:cf1d:9860:5f5c])
        by smtp.gmail.com with ESMTPSA id 12-20020a170906300c00b0077a1dd3e7b7sm2990012ejz.102.2022.10.15.04.10.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Oct 2022 04:10:15 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] onboard: remove
Date: Sat, 15 Oct 2022 13:09:54 +0200
Message-Id: <20221015110954.97668-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Oct 2022 11:10:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99176

* it has not seen notable activity for 5 years
* it broke here 8 month ago: image folder is empty

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ine-error-API-if-platform-does-not-h.patch | 67 -------------------
 .../recipes-support/onboard/onboard_1.4.1.bb  | 29 --------
 2 files changed, 96 deletions(-)
 delete mode 100644 meta-gnome/recipes-support/onboard/onboard/0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch
 delete mode 100644 meta-gnome/recipes-support/onboard/onboard_1.4.1.bb

diff --git a/meta-gnome/recipes-support/onboard/onboard/0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch b/meta-gnome/recipes-support/onboard/onboard/0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch
deleted file mode 100644
index fda37895c..000000000
--- a/meta-gnome/recipes-support/onboard/onboard/0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 1c95f64aa342147387ce4b1b7269a5c8b34bd898 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 13 Jul 2017 09:01:04 -0700
-Subject: [PATCH] pypredict/lm: Define error API if platform does not have it
-
-error() API is not implemented across all libcs on linux
-e.g. musl does not provide it.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Onboard/pypredict/lm/lm.cpp         |  1 -
- Onboard/pypredict/lm/lm.h           | 13 +++++++++++++
- Onboard/pypredict/lm/lm_dynamic.cpp |  2 --
- 3 files changed, 13 insertions(+), 3 deletions(-)
-
-diff --git a/Onboard/pypredict/lm/lm.cpp b/Onboard/pypredict/lm/lm.cpp
-index 2e64296..37ae241 100644
---- a/Onboard/pypredict/lm/lm.cpp
-+++ b/Onboard/pypredict/lm/lm.cpp
-@@ -19,7 +19,6 @@
- 
- #include <stdlib.h>
- #include <stdio.h>
--#include <error.h>
- #include <algorithm>
- #include <cmath>
- #include <string>
-diff --git a/Onboard/pypredict/lm/lm.h b/Onboard/pypredict/lm/lm.h
-index ed4164a..b8b63ee 100644
---- a/Onboard/pypredict/lm/lm.h
-+++ b/Onboard/pypredict/lm/lm.h
-@@ -32,6 +32,19 @@
- #include <algorithm>
- #include <string>
- 
-+#if defined(HAVE_ERROR_H)
-+#include <error.h>
-+#else
-+#include <err.h>
-+#define _onboard_error(S, E, F, ...) do { \
-+       if (E) \
-+               err(S, F ": %s", ##__VA_ARGS__, strerror(E)); \
-+       else \
-+               err(S, F, ##__VA_ARGS__); \
-+} while(0)
-+
-+#define error _onboard_error
-+#endif
- 
- // break into debugger
- // step twice to come back out of the raise() call into known code
-diff --git a/Onboard/pypredict/lm/lm_dynamic.cpp b/Onboard/pypredict/lm/lm_dynamic.cpp
-index 7c62824..e7c7f40 100644
---- a/Onboard/pypredict/lm/lm_dynamic.cpp
-+++ b/Onboard/pypredict/lm/lm_dynamic.cpp
-@@ -17,8 +17,6 @@
-  * along with this program. If not, see <http://www.gnu.org/licenses/>.
-  */
- 
--#include <error.h>
--
- #include "lm_dynamic.h"
- 
- using namespace std;
--- 
-2.13.2
-
diff --git a/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb b/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
deleted file mode 100644
index 9325ef9c2..000000000
--- a/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "An onscreen keyboard"
-LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING.GPL3;md5=8521fa4dd51909b407c5150498d34f4e"
-
-DEPENDS += "gtk+3 hunspell libcanberra libxkbfile dconf python3-distutils-extra-native intltool-native"
-
-SRC_URI = "https://launchpad.net/onboard/1.4/${PV}/+download/${BPN}-${PV}.tar.gz \
-           file://0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch \
-           "
-SRC_URI[md5sum] = "1a2fbe82e934f5b37841d17ff51e80e8"
-SRC_URI[sha256sum] = "01cae1ac5b1ef1ab985bd2d2d79ded6fc99ee04b1535cc1bb191e43a231a3865"
-
-inherit features_check setuptools3-base pkgconfig gtk-icon-cache gsettings mime-xdg
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-FILES:${PN} += " \
-    ${datadir}/dbus-1 \
-    ${datadir}/icons \
-    ${datadir}/gnome-shell \
-    ${datadir}/help \
-"
-
-RDEPENDS:${PN} += " \
-    ncurses \
-    python3-dbus \
-    python3-pycairo \
-    python3-pygobject \
-"
-- 
2.35.3


