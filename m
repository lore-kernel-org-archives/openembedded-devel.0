Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52BCC3DA7A
	for <webhook@archiver.kernel.org>; Sat, 31 Dec 2022 17:34:22 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.46591.1672508061550220313
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Dec 2022 09:34:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iNNTj5AY;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id 20so11498583plo.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 09:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IJmnAmRmaqlrd7ah19jX8xeNWDFR09yucdwG4gauUAc=;
        b=iNNTj5AY5mHCctzyrae8+oCM37vVqkSUt/JJLfmv/9pJKIMKQZY5EMpmv0vyCI7Xjb
         EDQqZYO4PlygG21b0pTyj3hIC7o9rmTrsgBQ4cAf5c8ZrHkQR3EcX0Lk05WJARnV6SKT
         yyjjPR/vTw+c/yzlTTaUuQo6tEJ0/Mj4AAvbjROLj3W0SzGjo9QoV+mOTsBttQtAF07X
         chRnuEYgDvzZO/zEkKg4mUlCfv+sVjBZhHu0CoXJBIXrSiISIqlLyGKQAuuP6yyyAtf+
         +75avN5xdz1KeqpP4shUH3BsPTk4AlS09MZ55/C0EhGaqlsA8KKIVsBECKqEqeNFW5gN
         y7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IJmnAmRmaqlrd7ah19jX8xeNWDFR09yucdwG4gauUAc=;
        b=k2uJj7bqZMcJZ/sgsQ7kn7ZivD4b6Mf2rjqegJA9IKgYHN7Na0BEcffTCvHagi3Py5
         +AiTqr+3BbSdgIB5l9Naqwsm19GEtP9uOT9+vd61K3U6l/GQ1Qkl1vbS6wmmWS7JOOsl
         Fm0zMF5sYK6T1XCIiik7m18ZADgL6vxYSCT39+26fg4n7n0nbJY2zK8Us0sNH88EyhJB
         UlHN52De1132ddNSOifvqgKiumF0sxKu+JciJjKp1nKbXkTk2V6ZCE0G6pbazoM9cV1W
         UsRFPmojuU6CqV+CmZsWxRWjtmOJKQCP4U8PhCaXFBLj0/msukmngDZKXATZ58RUHGfd
         uWcg==
X-Gm-Message-State: AFqh2kqeoV31if27XmXmoT/3iJYB3YQhl6VOucmHNZUrMW3Qy+TCOi4y
	1MSaJWKR9KzcvcYUrmy2KH5K62yA6d4=
X-Google-Smtp-Source: AMrXdXsNGQl8B2k4eIFn2djU+aVsrXyN84WV27xmelPHC17Eh9KZodVLJMna6mdIBOj7XKvEc24qPA==
X-Received: by 2002:a17:902:f784:b0:192:b5a8:3eb6 with SMTP id q4-20020a170902f78400b00192b5a83eb6mr4474999pln.44.1672508060439;
        Sat, 31 Dec 2022 09:34:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902e74400b00178b9c997e5sm17112458plf.138.2022.12.31.09.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Dec 2022 09:34:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 1/2] gnome-online-accounts: Fix build race seen on musl systems
Date: Sat, 31 Dec 2022 09:34:16 -0800
Message-Id: <20221231173417.3502417-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 17:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100322

Backport a patch to fix correct use of dependency object

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...se-the-appropriate-dependency-object.patch | 35 +++++++++++++++++++
 .../gnome-online-accounts_3.46.0.bb           |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts/0001-build-Use-the-appropriate-dependency-object.patch

diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts/0001-build-Use-the-appropriate-dependency-object.patch b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts/0001-build-Use-the-appropriate-dependency-object.patch
new file mode 100644
index 0000000000..838ca1a7d4
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts/0001-build-Use-the-appropriate-dependency-object.patch
@@ -0,0 +1,35 @@
+From 06240574626eb21af37cf7dde5bf81e892dff467 Mon Sep 17 00:00:00 2001
+From: Emmanuele Bassi <ebassi@gnome.org>
+Date: Wed, 5 Oct 2022 22:15:37 +0100
+Subject: [PATCH] build: Use the appropriate dependency object
+
+Just using `link_with` will not ensure that the GOA web extension shared
+module is properly built against libgoa-backend and libgoa; the
+generated headers must be transitively available by the time we build
+the shared module.
+
+Fixes: #226
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gnome-online-accounts/-/commit/fe86bfb0271735c8130367c46536b08dad5c20d8]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/goabackend/meson.build | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/goabackend/meson.build b/src/goabackend/meson.build
+index f5382b3..865b2d2 100644
+--- a/src/goabackend/meson.build
++++ b/src/goabackend/meson.build
+@@ -157,9 +157,8 @@ libgoa_web_extension = shared_module(
+   'goawebextension',
+   libgoawebextension_sources,
+   include_directories: common_incs + [goa_inc],
+-  dependencies: deps,
++  dependencies: [deps, libgoa_backend_dep],
+   c_args: cflags,
+-  link_with: libgoa_backend,
+   install: true,
+   install_dir: join_paths(goa_pkglibdir, 'web-extensions')
+ )
+-- 
+2.39.0
+
diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.46.0.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.46.0.bb
index 80cf4969cd..ce02a507da 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.46.0.bb
@@ -8,6 +8,7 @@ inherit gnomebase gsettings gobject-introspection gtk-icon-cache vala features_c
 
 DEPENDS = "gtk+3 gtk+3-native gdk-pixbuf dbus json-glib libxml2 webkitgtk glib-2.0 rest libsecret"
 
+SRC_URI += "file://0001-build-Use-the-appropriate-dependency-object.patch"
 SRC_URI[archive.sha256sum] = "5e7859ce4858a6b99d3995ed70527d66e297bb90bbf75ec8780fe9da22c1fcaa"
 
 PACKAGECONFIG_SOUP ?= "soup3"
-- 
2.39.0


