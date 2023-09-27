Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA11E82CB0
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 16:46:05 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.22195.1695833164154400539
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 09:46:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bf8etSem;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40566f8a093so84701345e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 09:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695833162; x=1696437962; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5f7PqW087D8GBw7Wcy5PPw+FR6m14Ilfd3DE8haWHUw=;
        b=bf8etSem2lQChkmbp+RDl9mcf98U3APmoZY06qNzfstxTz3GsaUu8ABEbts3A/9rAq
         6UtA5qUBzonANGdOOqDVAyRJ0si33tY0FFHkCXjaYzsL3/vrarYpoNIcZazQJGZv+Vwz
         TW5+y+0npRQC9JvB+EtzCskaH/COIhPOwKDAhrwpj+o+LcJ93kYqrITX3hYVEh5KNyQK
         AiJRt9tVhTk25fuRBcc0YJmrpDXS7l+jfYX8dkSKgnFC3v5G1cZAM+wEKUxqiDiTHrb9
         uyXoSFo5g8N4fvkvFfl6rrwL4vxLSdkbfM35UQ/dypu08gimbGACHEvNljA9J2orQb6r
         h3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695833162; x=1696437962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5f7PqW087D8GBw7Wcy5PPw+FR6m14Ilfd3DE8haWHUw=;
        b=bTJjeLpajulu59AgCKaDeulF+4RNtp8/Lesg25ST75BlZ5NNo1HlAz7Z9mV0zntwyQ
         vy0U+etm0CoUz4izF9GuDL/kvY7ExDIx/P9r8HVX4iMn9igKNvrb9z2fBw8jXTxuZGlu
         cI29MFznHX6SNLQofnKkItqOoeTiiKlktglYCrD9yQZZRFiPCY1w2iE+uq9FX7KJAdA4
         y4Ah0UJa9aG5Oy8eoqUPsTu4Tsw+xjZoTmVYsBPGm4l58J0Lj2ZoWRK+ka1NbBI2qLD1
         7AxckXO011RLynrLDNf8IUr0CfJvL1q1ADtA4IcDhLl6H1mdrbDg7xi2XFLT4r2d32m3
         U8KA==
X-Gm-Message-State: AOJu0Yzt2eAx+OkgeY9jBruB9QjWGa46Xu+m+SQb3st87A/gP+KHLGRY
	3uoHlXCQArIM3Tc4w+p2hzK8KTP355Y=
X-Google-Smtp-Source: AGHT+IGk90XDT+4tHfX4EVXbBpI4Oc5/JG+ZxSzb5eCYICN6yFHl1ZxRX0NgzqwdQ0KulgbjIBSPqg==
X-Received: by 2002:a05:600c:230b:b0:405:3955:5872 with SMTP id 11-20020a05600c230b00b0040539555872mr2304900wmo.18.1695833162223;
        Wed, 27 Sep 2023 09:46:02 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id c6-20020a7bc846000000b0040641a9d49bsm2548612wml.17.2023.09.27.09.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 09:46:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] gupnp-tools: fix build with meson-1.2.0
Date: Wed, 27 Sep 2023 18:45:58 +0200
Message-ID: <20230927164558.1985001-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 16:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105195

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../0001-build-Fix-wrap-file-syntax.patch     | 56 +++++++++++++++++++
 .../gupnp/gupnp-tools_0.10.2.bb               |  4 +-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-tools/0001-build-Fix-wrap-file-syntax.patch

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools/0001-build-Fix-wrap-file-syntax.patch b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools/0001-build-Fix-wrap-file-syntax.patch
new file mode 100644
index 0000000000..5c13ce0bd5
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools/0001-build-Fix-wrap-file-syntax.patch
@@ -0,0 +1,56 @@
+From 4c86f814fbe17eb5774055d69102408bbfc1cd63 Mon Sep 17 00:00:00 2001
+From: Jens Georg <mail@jensge.org>
+Date: Sun, 9 Jul 2023 21:47:48 +0200
+Subject: [PATCH] build: Fix wrap file syntax
+
+No idea why it worked in the first place
+
+Fixes #26
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gupnp-tools/-/commit/1372f9ebe45180d58cefb6c0475fafe77de37ef2]
+---
+ subprojects/gssdp-1.2.wrap    | 4 ++--
+ subprojects/gupnp-1.2.wrap    | 4 ++--
+ subprojects/gupnp-av-1.0.wrap | 4 ++--
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/subprojects/gssdp-1.2.wrap b/subprojects/gssdp-1.2.wrap
+index 34d9b0b..f78d2fa 100644
+--- a/subprojects/gssdp-1.2.wrap
++++ b/subprojects/gssdp-1.2.wrap
+@@ -3,6 +3,6 @@ url = https://gitlab.gnome.org/GNOME/gssdp.git
+ revision = master
+ depth = 1
+  
+-[provides]
+-dependency_name = gssdp-1.2
++[provide]
++dependency_names = gssdp-1.2
+ 
+diff --git a/subprojects/gupnp-1.2.wrap b/subprojects/gupnp-1.2.wrap
+index c345910..f92c055 100644
+--- a/subprojects/gupnp-1.2.wrap
++++ b/subprojects/gupnp-1.2.wrap
+@@ -3,6 +3,6 @@ url = https://gitlab.gnome.org/GNOME/gupnp.git
+ revision = master
+ depth = 1
+  
+-[provides]
+-dependency_name = gupnp-1.2
++[provide]
++dependency_names = gupnp-1.2
+ 
+diff --git a/subprojects/gupnp-av-1.0.wrap b/subprojects/gupnp-av-1.0.wrap
+index 967e6d3..8c3b490 100644
+--- a/subprojects/gupnp-av-1.0.wrap
++++ b/subprojects/gupnp-av-1.0.wrap
+@@ -3,6 +3,6 @@ url = https://gitlab.gnome.org/GNOME/gupnp-av.git
+ revision = master
+ depth = 1
+  
+-[provides]
+-dependency_name = gupnp-av-1.0
++[provide]
++dependency_names = gupnp-av-1.0
+ 
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.10.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.10.2.bb
index 20aced8329..9731ede274 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.10.2.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.10.2.bb
@@ -9,7 +9,9 @@ inherit features_check meson pkgconfig gettext gtk-icon-cache
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "http://download.gnome.org/sources/${BPN}/0.10/${BPN}-${PV}.tar.xz"
+SRC_URI = "http://download.gnome.org/sources/${BPN}/0.10/${BPN}-${PV}.tar.xz \
+    file://0001-build-Fix-wrap-file-syntax.patch \
+"
 SRC_URI[sha256sum] = "6de49ef4b375b8a164f74b766168b1184e0d28196b6b07a4f5341f08dfd85d6c"
 
 RRECOMMENDS:${PN} = "adwaita-icon-theme"
-- 
2.42.0


