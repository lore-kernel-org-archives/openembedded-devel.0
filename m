Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FABC55172
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 08:58:58 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12049.1785833934113160768
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 01:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Et57RCjD;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-81e8fa1b8d6so56276017b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 01:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785833933; x=1786438733; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=91srrBUeWZXz99epIubD1Klrgox2jxRRxzC1yHESDfE=;
        b=Et57RCjD5/Tt++8SsPvRFZqBSZgKH/A21UnGfE4OTUZCgypJ2bFpH0vm1JnIb6aiDg
         lU/NqV0lySobOU7mlZuBzwddfqaFOnVwddyqOibGXqJhdtw6fP0C90DGuHeHW0CjzXNl
         nD0AeeAnrEWWxL0BB4hAHT5T2hOe2uLcVhGgl0mHODMy2wEwv0a3ZyqMWQB4W0QBfS0Q
         62XJLLhecv0DK66Y8TL721+zz+x0yVJzZy6vFhX3D4PnMGvg1S90pWjIPCQ29i98ytuB
         0jpSo/8Opa/QGZC0Wtz3KnuWHSE6ugxuYqp7aC7/S5euoCMskLjNaSPkKvIhOHl/Z67w
         dsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785833933; x=1786438733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=91srrBUeWZXz99epIubD1Klrgox2jxRRxzC1yHESDfE=;
        b=J+9WiAduS+YerTRtTnxhHZ24fzK2FTaMNeBqbUVltSblkO2pmuDGeIDNRL2OhGtgQP
         fB5NlH/Y1WGMulbiCcmK2+BexAj37voRlMKsxRWPg2XCyqnfwIPztqKHrrq9sTdIh3TS
         VH4aN8vFrRYA4sNAR8dd3li2/EI7doclWDlWP0YRs+KGIoXk7OQN3yrJ3HPDNZi75uoc
         zHg9AISaUgNWMx8bKaneSO8apL5rDakaKW4p8e1ZYjrloY/EucuFaMHzoEDrrgqD1ewe
         gCC6Rr9K7Ypw6+B+z60YD+3eNIDSBGSA4rnQPZfBNrIKHpMUt/SpBDH24PpU7xp7l6Qc
         xbxA==
X-Gm-Message-State: AOJu0Yyv33NGXrU/O5ydI8SUhxQ8MbKLPl3QRWk5EUKUuUO19yaq4OMZ
	CoWHquCakOKWFCNGNcuhHH/9NcgsSmawLMPKvE5IY/+lbVy2l2My3R41nBEBwLY4
X-Gm-Gg: AR+sD126TMT5DGqgmclKvzbdvE8xANqJQMtUNF8sp/SpKfjRN3eCi4byhNDkV1pLGoE
	SrsMKnGKrufwRz90BK7TsNCxlOQuVaKxdNaC6ZLrKmUFs9F6shTWMRiETDrReLT2ujci9C0zI7o
	CUFN5Hsk8XhVuoS2mSUsGWffTlwX+lEBA5NHM7TGjCZNQbgectw9+XF/8fcZleOvfjFv1m5cWXk
	hiDjxypoJHHQJbXj3A6DBSM1QSkXmk11x6snImkp2HN5M7fZOqJr+9GfT9wFbjxFD+AccKG63Lr
	wBk5Zglgg+HLUsE/+0Uvxe2jbQwqxOOI7yGYdHf/a3Rkjgk+gR6aY2ubx3+pOW7f/253X2cZ6Zz
	5oih5yjqKij/8Nflfm8YotuBBcgxUlue4ZOQDFjAyVaIW3Xs9j0PXUAcwbMhcUg1T/eLD9tETzn
	vjc3+ehVBDzOhxHTOpjBJNw0lroerk/qGx1QrnSzUnkE7wtOUqOO1GDRx64Ww7/8ngulDiKFjg7
	7C6CQIbcbfGihhE3YENGpKK58hQHEc8A3BAUTjkwrSdFdCipiNcE7hrtyq8QnHGBARAsPidZ/ix
	3dtJ6YekXxKJ
X-Received: by 2002:a05:690c:6c13:b0:7bd:cf35:e33b with SMTP id 00721157ae682-81fd4b372e4mr165757377b3.17.1785833932799;
        Tue, 04 Aug 2026 01:58:52 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-82013487b13sm1729737b3.38.2026.08.04.01.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 01:58:52 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH v2] thunar: upgrade 4.21.5 -> 4.21.6
Date: Tue,  4 Aug 2026 04:58:41 -0400
Message-ID: <20260804085841.2850979-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 08:58:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128741

Drop backported patch which is already built into this new version.

Changelog: https://gitlab.xfce.org/xfce/thunar/-/tags/thunar-4.21.6

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../oe-npm-cache                              |  0
 ....18.bb => nodejs-oe-cache-native_24.19.bb} |  0
 .../{nodejs_24.18.1.bb => nodejs_24.19.0.bb}  |  2 +-
 .../0001-Properly-guard-gdkx.h-include.patch  | 37 -------------------
 .../{thunar_4.21.5.bb => thunar_4.21.6.bb}    |  4 +-
 5 files changed, 2 insertions(+), 41 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-24.18 => nodejs-oe-cache-24.19}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_24.18.bb => nodejs-oe-cache-native_24.19.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_24.18.1.bb => nodejs_24.19.0.bb} (98%)
 delete mode 100644 meta-xfce/recipes-xfce/thunar/files/0001-Properly-guard-gdkx.h-include.patch
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.21.5.bb => thunar_4.21.6.bb} (88%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.18/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.19/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.18/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.19/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.19.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.18.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.19.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_24.18.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_24.19.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_24.18.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_24.19.0.bb
index db3cba1a75..4ef05cc623 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_24.18.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_24.19.0.bb
@@ -35,7 +35,7 @@ SRC_URI = "https://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
 SRC_URI:append:class-target = " \
            file://0009-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] = "86d40d594bbdfcf69009a62fdf43cb19ae72b6cb5822d2bdd8349c5a1b2fa628"
+SRC_URI[sha256sum] = "f6d95e10a0431ee1067fc6aabe9f762908b4716dd35324e1ddb4b1466b76659f"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
diff --git a/meta-xfce/recipes-xfce/thunar/files/0001-Properly-guard-gdkx.h-include.patch b/meta-xfce/recipes-xfce/thunar/files/0001-Properly-guard-gdkx.h-include.patch
deleted file mode 100644
index 9d4afc7167..0000000000
--- a/meta-xfce/recipes-xfce/thunar/files/0001-Properly-guard-gdkx.h-include.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From dd7fbf4540891053a4083228aac2485e6c469199 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
-Date: Sat, 11 Apr 2026 18:07:05 +0200
-Subject: [PATCH] Properly guard gdkx.h include
-
-Fixes: #1820
-
-Upstream-Status: Backport [https://gitlab.xfce.org/xfce/thunar/-/commit/201f8ca0c3bc7b5e651201526fc3006a130718eb]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- thunar/thunar-session-client.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/thunar/thunar-session-client.c b/thunar/thunar-session-client.c
-index c36719c..2832818 100644
---- a/thunar/thunar-session-client.c
-+++ b/thunar/thunar-session-client.c
-@@ -30,6 +30,7 @@
- 
- #ifdef ENABLE_LIBSM
- #include <X11/SM/SMlib.h>
-+#include <gdk/gdkx.h>
- #endif
- 
- #include "thunar/thunar-application.h"
-@@ -38,7 +39,6 @@
- #include "thunar/thunar-private.h"
- #include "thunar/thunar-session-client.h"
- 
--#include <gdk/gdkx.h>
- #include <glib/gstdio.h>
- 
- 
--- 
-2.34.1
-
diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.21.5.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.21.6.bb
similarity index 88%
rename from meta-xfce/recipes-xfce/thunar/thunar_4.21.5.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_4.21.6.bb
index d8e9edfc25..3ccab0ad69 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.21.5.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.21.6.bb
@@ -11,9 +11,7 @@ GTKDOC_MESON_OPTION = "gtk-doc"
 
 inherit xfce gobject-introspection mime-xdg perlnative gtk-doc
 
-SRC_URI[sha256sum] = "eddbd4bab29c73718734e0bfcf650ceea8b4fcc8cb2cbb0b24fe22b286a2be00"
-
-SRC_URI += "file://0001-Properly-guard-gdkx.h-include.patch"
+SRC_URI[sha256sum] = "5412d3feb14b4c47ccea8b00e9a9e3dcc1ea0e86e305abcee344f2fe82518bf8"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[pcre] = "-Dpcre2=enabled,-Dpcre2=disabled,libpcre2"
-- 
2.43.0


