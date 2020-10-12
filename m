Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.39410.1602505062796778778
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2020 05:17:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z0oGaNSC;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id e18so18916380wrw.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2020 05:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kU1XYn3SWv/twvOzfmqWMJY0hUEpSOr8O+WprMh4J7k=;
        b=Z0oGaNSCkOy6FFnpmbDTPV2NEzpVswAstxOn+qfqdu+ACCXdrtMw99mw2XqOL/uQPw
         SuQVXoeojsLB1MXCI3BKRZ4VZ5HMUU77sI8aR7HQEoHuJmZccI/ANi9HUPA/ahF0z+rV
         YT6d97DS6J64Lzen4FuQ0/2Ref2NJiLFwOjMQBa86MC2cWSsylLhKtiRAP3elTzkKG6g
         /V8MobAM7lOet4O/BaB6pYYEVo0JQAcVtE4ERsg7K4H9790AWeeoHIBcwED0B2ItaSah
         9hn5aRhJnHTaWsmpaMlxpAjHm/zPvekD0qQ9CCRiLX+d/2jlp/HUGYljzg969bxss8Su
         DxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kU1XYn3SWv/twvOzfmqWMJY0hUEpSOr8O+WprMh4J7k=;
        b=sHJ83w8SaHLXUqsmlWZ9hhu/87IjHxH/XBQVp18R6kqixXC3ekyeJWtMrpZ4tarkre
         qzij6kNMTNH9f0Ou6ovG029vmXfnLe6BcWIwaWcaxuOp2i75xa70Vzu+/6ELpiaXsxPa
         C3D2ivNWJCj+D+kNFQlwvrl4/+0/eUkHO6Xi084gaXAvpcfdKMgdv+haRUjvSSp49UCU
         ceIktUIGrYOZkSWxMRfJ0+ROpz8Ig1b/UFR/tzbqdGzl/McCN6KGpKeAgFOdhZkFjyto
         BKgex0VI4Oc9Z/mB4Tn0jQFh30Y6JiMQy7Sq2cl1FpivLS2+CfwBWLHftiHtKxgWz1AG
         /wrg==
X-Gm-Message-State: AOAM5324YhwNHiy8YlMLR2eMurHbqUE0c2jS+ORx3IqNWuaqbyue9eF+
	gTLXqc5D1djL4Vck8x6eLAMgUweiyiEqDA==
X-Google-Smtp-Source: ABdhPJzMbT0pYCMAGZIsP86RxMC3w0YiNsLk/FT52lwE5dpfBPDS1NEiHBpBauUgn2u0VukNBywWOw==
X-Received: by 2002:adf:ed52:: with SMTP id u18mr30961052wro.357.1602505060977;
        Mon, 12 Oct 2020 05:17:40 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id l1sm4158196wrb.1.2020.10.12.05.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 05:17:40 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [meta-oe][PATCH 08/13] gstreamer1.0-rtsp-server: upgrade to version 1.18.0
Date: Mon, 12 Oct 2020 13:17:24 +0100
Message-Id: <20201012121729.2094355-8-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012121729.2094355-1-quaresma.jose@gmail.com>
References: <20201012121729.2094355-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

    * 0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
      Removed since these are included in 1.18.0

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...even-when-cross-compiling-if-introsp.patch | 36 -------------------
 ....bb => gstreamer1.0-rtsp-server_1.18.0.bb} |  9 +++--
 2 files changed, 4 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.16.2.bb => gstreamer1.0-rtsp-server_1.18.0.bb} (74%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
deleted file mode 100644
index 6962a50d6e..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 95ce953e34cd0e9f5d42ce7900a9572e7bc8ca47 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
-Date: Fri, 18 Oct 2019 00:42:12 +0100
-Subject: [PATCH] meson: build gir even when cross-compiling if introspection
- was enabled explicitly
-
-This can be made to work in certain circumstances when
-cross-compiling, so default to not building g-i stuff
-when cross-compiling, but allow it if introspection was
-enabled explicitly via -Dintrospection=enabled.
-
-See gstreamer/gstreamer#454 and gstreamer/gstreamer#381.
-
-Upstream-Status: Backport [95ce953e34cd0e9f5d42ce7900a9572e7bc8ca47]
-
-Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index e1e3b1d..3f45f0e 100644
---- a/meson.build
-+++ b/meson.build
-@@ -173,7 +173,7 @@ endif
- 
- gir = find_program('g-ir-scanner', required : get_option('introspection'))
- gnome = import('gnome')
--build_gir = gir.found() and not meson.is_cross_build()
-+build_gir = gir.found() and (not meson.is_cross_build() or get_option('introspection').enabled())
- gir_init_section = [ '--add-init-section=extern void gst_init(gint*,gchar**);' + \
-     'g_setenv("GST_REGISTRY_1.0", "@0@", TRUE);'.format(meson.current_build_dir() + '/gir_empty_registry.reg') + \
-     'g_setenv("GST_PLUGIN_PATH_1_0", "", TRUE);' + \
--- 
-2.17.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb
similarity index 74%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb
index 02c3c83840..0adfa2aac9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb
@@ -8,18 +8,17 @@ DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base"
 
 PNREAL = "gst-rtsp-server"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
-           file://0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch \
-           "
+SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "8a998725820c771ba45be6e18bfdf73a"
-SRC_URI[sha256sum] = "de07a2837b3b04820ce68264a4909f70c221b85dbff0cede7926e9cdbb1dc26e"
+SRC_URI[md5sum] = "77fe28c702a83566811ab5c7bbe99ab2"
+SRC_URI[sha256sum] = "2ad19311054cbf2df0d0622936bc703dedc06ced706df46a3d3a3ea5a4b7c70f"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
 inherit meson pkgconfig upstream-version-is-even gobject-introspection
 
 EXTRA_OEMESON += " \
+    -Ddoc=disabled \
     -Dexamples=disabled \
     -Dtests=disabled \
 "
-- 
2.28.0

