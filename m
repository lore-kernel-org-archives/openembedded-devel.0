Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F15C433FE
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 16:24:29 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.38781.1634574268746958559
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 09:24:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fpPQafHA;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 qe4-20020a17090b4f8400b0019f663cfcd1so14873029pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 09:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L8T1L8msj3nj79/hhxNDP3EYXFfxnkzi4+6cs2RNP9Q=;
        b=fpPQafHAOC6NUzmPrt7XgXKAXsuaLFXRnuzalumibUedbSXxMKd8+R13DSQX2Eklrg
         quMAcQm8wJdevDcE6z03p3HYv+EVOIRaS+UYmvLetmCwtgIyZhGxjQXlRXFOA2IeC9dQ
         rlEDwwa8a7nmvnlCNN1eoP6+GEeqJE35c2gU6EfL14m5TJgu2Jis9NVJaGSuCcEE7y7B
         ktwVDv3AyYDzACSA2QKqQXVoXP49oa1RFnP8Jkz54dfYEiuAV00wp8NIpCeEVo06aclP
         3XT47yFDyUQGMNX4pq0/kz9gcHtgU6LsM96/k8h/8GxNkSw87TwZohBJW4LBcFYh/OK6
         tqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L8T1L8msj3nj79/hhxNDP3EYXFfxnkzi4+6cs2RNP9Q=;
        b=097gCfP3W3x4DVJjakvnstgS9L8/y8c04D36QOEm7Y716Q+rm9ZKY8ScWcNf8CC3eb
         0BZYB04mDJa2SDYXBs4Wwy7N/kFhAeKvXbXnxA+buMum6REBUg0unTOuAub1r/xMJxm3
         4N+FepeMKvaJLR3KDmMOc76c0d4vsFSBqRMb1vFpOWu/lA3BB7TzGdWzsh/MbFAtb3ya
         qygjkFcUJTuth14bYq6kg48a6kJ+VKQS+v16BW+BbK/XJO0m2w8WBcGtmQYt4uDmCrHH
         vd8b9eh09cFaDZZ4evkOsLbZMRYtHKFXml574A5Nbim0lADn+VFbnDmePFD53VebVGy/
         tF9Q==
X-Gm-Message-State: AOAM533FXBswhXkAl8M00BvjwD5KwcR/XyFDMI0kTLXNND+2+PobZIkQ
	mmawE6I23bg0K6V9WIX0+Ppm8DoCazo=
X-Google-Smtp-Source: 
 ABdhPJzfxBkr3PjYnAxdhAOk51O/nqmQYxq7U9dZPEOwh75MCPjxU+12bgJ31hXora95ErjTHMRFPQ==
X-Received: by 2002:a17:90b:4f87:: with SMTP id
 qe7mr38104072pjb.29.1634574267916;
        Mon, 18 Oct 2021 09:24:27 -0700 (PDT)
Received: from nereus.local ([2601:1c0:6000:1830:ffc7:e2cb:a2b6:d240])
        by smtp.gmail.com with ESMTPSA id
 e6sm13605830pfm.212.2021.10.18.09.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 09:24:27 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-gnome][PATCH] gfbgraph: patch to build with latest rest
Date: Mon, 18 Oct 2021 09:24:15 -0700
Message-Id: <20211018162415.2340550-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Oct 2021 16:24:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93431

librest 0.8.1 declares rest-1.0 and was released four years ago.

Also inherit pkgconfig so that dependencies can be found by pkg-config

References:
https://gitlab.gnome.org/GNOME/libgfbgraph/-/merge_requests/6

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 ...-Update-rest-requirement-to-rest-1.0.patch | 72 +++++++++++++++++++
 .../recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb  |  3 +-
 2 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gfbgraph/gfbgraph/0001-Update-rest-requirement-to-rest-1.0.patch

diff --git a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph/0001-Update-rest-requirement-to-rest-1.0.patch b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph/0001-Update-rest-requirement-to-rest-1.0.patch
new file mode 100644
index 0000000000..c24a9e569f
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph/0001-Update-rest-requirement-to-rest-1.0.patch
@@ -0,0 +1,72 @@
+From d058e6eb6c9ebf5f4fff89ec0ac93323fc64c1ba Mon Sep 17 00:00:00 2001
+From: Tim Orling <ticotimo@gmail.com>
+Date: Mon, 18 Oct 2021 08:42:35 -0700
+Subject: [PATCH] Update rest requirement to rest-1.0
+
+librest 0.8.1 declares rest-1.0 and was released four years ago.
+
+https://gitlab.gnome.org/GNOME/librest/-/commit/2971b3b92701f70fc368ad64bd25cefaea043f87
+
+Upstream-Status: Submitted
+[https://gitlab.gnome.org/GNOME/libgfbgraph/-/merge_requests/6]
+
+Signed-off-by: Tim Orling <ticotimo@gmail.com>
+
+---
+ .dir-locals.el       | 2 +-
+ configure.ac         | 2 +-
+ gfbgraph/Makefile.am | 2 +-
+ libgfbgraph.pc.in    | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/.dir-locals.el b/.dir-locals.el
+index 77abbf0..d39cdf2 100644
+--- a/.dir-locals.el
++++ b/.dir-locals.el
+@@ -3,7 +3,7 @@
+                                "/usr/include/json-glib-1.0"
+                                "/usr/include/goa-1.0"
+                                "/usr/lib64/goa-1.0/include"
+-                               "/usr/include/rest-0.7"
++                               "/usr/include/rest-1.0"
+                                "/usr/include/dbus-1.0"
+                                "/usr/lib64/dbus-1.0/include"
+                                "/usr/include/gio-unix-2.0/"
+diff --git a/configure.ac b/configure.ac
+index fd1231f..9b49f3f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -40,7 +40,7 @@ AM_CONDITIONAL([ENABLE_GTK_DOC], false)
+ 
+ GOBJECT_INTROSPECTION_CHECK([1.30.0])
+ 
+-PKG_CHECK_MODULES(LIBGFBGRAPH, [glib-2.0 gio-2.0 gobject-2.0 rest-0.7 json-glib-1.0])
++PKG_CHECK_MODULES(LIBGFBGRAPH, [glib-2.0 gio-2.0 gobject-2.0 rest-1.0 json-glib-1.0])
+ 
+ PKG_CHECK_MODULES(SOUP, [libsoup-2.4])
+ SOUP_UNSTABLE_CPPFLAGS=-DLIBSOUP_USE_UNSTABLE_REQUEST_API
+diff --git a/gfbgraph/Makefile.am b/gfbgraph/Makefile.am
+index d07b90d..b993ab7 100644
+--- a/gfbgraph/Makefile.am
++++ b/gfbgraph/Makefile.am
+@@ -60,7 +60,7 @@ GFBGraph_@API_MAJOR@_@API_MINOR@_gir_INCLUDES = \
+ 	GLib-2.0 	\
+ 	Gio-2.0		\
+ 	GObject-2.0	\
+-	Rest-0.7	\
++	Rest-1.0	\
+ 	Json-1.0	\
+ 	Soup-2.4
+ 
+diff --git a/libgfbgraph.pc.in b/libgfbgraph.pc.in
+index f87073e..d4f4e3a 100644
+--- a/libgfbgraph.pc.in
++++ b/libgfbgraph.pc.in
+@@ -9,6 +9,6 @@ apiversion=@API_VERSION@
+ Name: libgfbgraph
+ Description: GObject library for Facebook Graph API
+ Version: @VERSION@
+-Requires: gio-2.0 glib-2.0 goa-1.0 json-glib-1.0 libsoup-2.4 rest-0.7
++Requires: gio-2.0 glib-2.0 goa-1.0 json-glib-1.0 libsoup-2.4 rest-1.0
+ Libs: -L${libdir} -lgfbgraph-${apiversion}
+ Cflags: -I${includedir}/gfbgraph-@API_VERSION@
diff --git a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb
index 1c5d90f6c7..23b3bf63a5 100644
--- a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb
+++ b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb
@@ -10,8 +10,9 @@ DEPENDS = " \
     gnome-online-accounts \
 "
 
-inherit gnomebase gtk-doc gobject-introspection
+inherit gnomebase gtk-doc gobject-introspection pkgconfig
 
+SRC_URI += " file://0001-Update-rest-requirement-to-rest-1.0.patch"
 SRC_URI[archive.md5sum] = "c38af63e49f8fe8baad99537956b69ba"
 SRC_URI[archive.sha256sum] = "6065391f35e7335588cc6b0cc4c1abbce7341488573a654551264cb9793b9379"
 
-- 
2.30.2


