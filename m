Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB5C9C47088
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 07:19:31 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.5225.1669792761810633484
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Nov 2022 23:19:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HNqczYsn;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id jn7so15803031plb.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 23:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RESxSbCXxIcZnDqc+OeJMuFrH6+zEVfWjMPiLkS4e38=;
        b=HNqczYsn491en3SH5I6HZqYLB4eGHLcfhS/RUnVWh97lUUmTRohBGV2OO62m4Uoz+8
         IaCzA5G24QT6ctPDQNRf5EJd5NYDn+G2DmkNROmePJtuUfAxZ8SJXXMyjNsdB9bdH0HZ
         mpXGclcf6r6HJoRAVUrlGO5DrRlVjFpbCA4L3sBnQJxCD/URXC+VkUardf8OFqCcDEjH
         din0aqNF/b4p+oVBVdp81r4OuqKyoHZN/q8Z4jVP0v060Ei1l3b8WYDjCKztIBm1w8wM
         Jvc8+mmm0qLMtXO7uemQ89ZcMuU/n7LDJVvWkxLWW+FregxdxqE4Bnl4GsKJpPXQ141a
         8Uyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RESxSbCXxIcZnDqc+OeJMuFrH6+zEVfWjMPiLkS4e38=;
        b=0ZJhy4DBFm8ahiEWGtdeaN0JiIqyTkiNmzXa1yrcngYnAB+8J48hX9wRlm4i/lvKoT
         hU7tG3P24PWlMiIo9BO+8TzuzUxiNP6QjtZSLWGUUzhop6v8vAmxjFs1IUq1Vwi0Jt1U
         WVsE6lq20W8NlYiyPygt5dSQrcE/IP8k01gslFrZjy7yBJwxnHEeOJIABXtB93wXUg3P
         lxLIIBXMHs5iIGm7Uc+UlX5Mu0e3VJU4PG8Y3cjKtSTBXROlv+Qz/dObtcxu49WlXD17
         QA5j3O+Agg3GAkp2dxbYfNoMxoW0u/F22vIxKpM3YpHNuEKOMAI7qgI0srfwPDeTimvz
         HYjQ==
X-Gm-Message-State: ANoB5plD8yuTm8Z5Y7a0LEa2LcUHre/wFoRv7LYvPgB0dCnEw024ai5Z
	prxLSxReoxyJqbpiZ/IYHLWow4gS5bA=
X-Google-Smtp-Source: AA0mqf4lse/c7EFGaM1s/TEfXnNRM9N2sWaToaL+OD5VuhrPS2+AtUtxSzceE1uhSzOQp3Rk01zzaQ==
X-Received: by 2002:a17:90a:4313:b0:212:e24e:16b3 with SMTP id q19-20020a17090a431300b00212e24e16b3mr68540611pjg.69.1669792760998;
        Tue, 29 Nov 2022 23:19:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::a42c])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b00189812a5397sm577447plb.180.2022.11.29.23.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 23:19:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 07/10] gfbgraph: Use rest 0.8.1
Date: Tue, 29 Nov 2022 23:19:10 -0800
Message-Id: <20221130071913.1805812-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130071913.1805812-1-raj.khem@gmail.com>
References: <20221130071913.1805812-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 07:19:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99864

Drop the patch needed to use rest 1.0 API ( 0.9 onwards )

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Update-rest-requirement-to-rest-1.0.patch | 58 -------------------
 .../recipes-gnome/gfbgraph/gfbgraph_0.2.5.bb  |  5 +-
 2 files changed, 3 insertions(+), 60 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gfbgraph/gfbgraph/0001-Update-rest-requirement-to-rest-1.0.patch

diff --git a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph/0001-Update-rest-requirement-to-rest-1.0.patch b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph/0001-Update-rest-requirement-to-rest-1.0.patch
deleted file mode 100644
index 21c623ea5b..0000000000
--- a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph/0001-Update-rest-requirement-to-rest-1.0.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From d058e6eb6c9ebf5f4fff89ec0ac93323fc64c1ba Mon Sep 17 00:00:00 2001
-From: Tim Orling <ticotimo@gmail.com>
-Date: Mon, 18 Oct 2021 08:42:35 -0700
-Subject: [PATCH] Update rest requirement to rest-1.0
-
-librest 0.8.1 declares rest-1.0 and was released four years ago.
-
-https://gitlab.gnome.org/GNOME/librest/-/commit/2971b3b92701f70fc368ad64bd25cefaea043f87
-
-Upstream-Status: Submitted
-[https://gitlab.gnome.org/GNOME/libgfbgraph/-/merge_requests/6]
-
-Signed-off-by: Tim Orling <ticotimo@gmail.com>
-
----
- configure.ac         | 2 +-
- gfbgraph/Makefile.am | 2 +-
- libgfbgraph.pc.in    | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index fd1231f..9b49f3f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -40,7 +40,7 @@ AM_CONDITIONAL([ENABLE_GTK_DOC], false)
- 
- GOBJECT_INTROSPECTION_CHECK([1.30.0])
- 
--PKG_CHECK_MODULES(LIBGFBGRAPH, [glib-2.0 gio-2.0 gobject-2.0 rest-0.7 json-glib-1.0])
-+PKG_CHECK_MODULES(LIBGFBGRAPH, [glib-2.0 gio-2.0 gobject-2.0 rest-1.0 json-glib-1.0])
- 
- PKG_CHECK_MODULES(SOUP, [libsoup-2.4])
- SOUP_UNSTABLE_CPPFLAGS=-DLIBSOUP_USE_UNSTABLE_REQUEST_API
-diff --git a/gfbgraph/Makefile.am b/gfbgraph/Makefile.am
-index d07b90d..b993ab7 100644
---- a/gfbgraph/Makefile.am
-+++ b/gfbgraph/Makefile.am
-@@ -60,7 +60,7 @@ GFBGraph_@API_MAJOR@_@API_MINOR@_gir_INCLUDES = \
- 	GLib-2.0 	\
- 	Gio-2.0		\
- 	GObject-2.0	\
--	Rest-0.7	\
-+	Rest-1.0	\
- 	Json-1.0	\
- 	Soup-2.4
- 
-diff --git a/libgfbgraph.pc.in b/libgfbgraph.pc.in
-index f87073e..d4f4e3a 100644
---- a/libgfbgraph.pc.in
-+++ b/libgfbgraph.pc.in
-@@ -9,6 +9,6 @@ apiversion=@API_VERSION@
- Name: libgfbgraph
- Description: GObject library for Facebook Graph API
- Version: @VERSION@
--Requires: gio-2.0 glib-2.0 goa-1.0 json-glib-1.0 libsoup-2.4 rest-0.7
-+Requires: gio-2.0 glib-2.0 goa-1.0 json-glib-1.0 libsoup-2.4 rest-1.0
- Libs: -L${libdir} -lgfbgraph-${apiversion}
- Cflags: -I${includedir}/gfbgraph-@API_VERSION@
diff --git a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.5.bb b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.5.bb
index f3b54e7d05..faeaa8ccb9 100644
--- a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.5.bb
+++ b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.5.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5804fe91d3294da4ac47c02b454bbc8a"
 DEPENDS = " \
     glib-2.0 \
     json-glib \
-    rest \
+    librest \
+    libsoup-2.4 \
     gnome-online-accounts \
 "
 
@@ -15,7 +16,7 @@ inherit gnomebase gtk-doc gobject-introspection pkgconfig features_check
 # for gnome-online-accounts
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI += " file://0001-Update-rest-requirement-to-rest-1.0.patch"
+#SRC_URI += " file://0001-Update-rest-requirement-to-rest-1.0.patch"
 SRC_URI[archive.sha256sum] = "9cb381b3f78ba1136df97af3f06e3b11dcc2ab339ac08f74eda0f8057d6603e3"
 
 do_install:append() {
-- 
2.38.1


