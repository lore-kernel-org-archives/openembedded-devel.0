Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web12.257.1617899827914426572
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u5t4lZ1h;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id g8-20020a9d6c480000b02901b65ca2432cso2903103otq.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=3DRgrX/WA1hraoe7v6c82FbFtr9Of5VWSOFjR/waKeg=;
        b=u5t4lZ1hDeJzZisE+lDcCoFXDcY0vQMmab0LqjRvRv+LVFehWPSf1ziit0udlrg5o6
         PRYktVM/F+vl4vtx32goBCPh1jVUohNGIc8bR6ZAy1l9EdVDU9KpIhx4KsevP3A3z1eu
         GoC2sXr+zEpq0NlKLSxpHFtRcGc9/Fyz6bfebmaVXWP0n0nPUiOYCFFvu1JJlUq2OhMN
         FjFVgmQzKY54uJUS+jR/Uk6V356RhvD65zl44feKJvhyUm1klMegwJhVleccCbOLqy3I
         6koFIaPs1U1ypSzSRzVDRo3AJ2epXTEb4x3JD5S5j4qXgwxy2AR6W3Now3pTZi1RwsBp
         MHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=3DRgrX/WA1hraoe7v6c82FbFtr9Of5VWSOFjR/waKeg=;
        b=ZWxBrRahUNi2DuNRC4OmKESvfiGbXW7EUNq5nfEDLZpH10HMJU6WqHQQT/FJSufBrn
         eze4LpLXTQ9wVG6jwVcrUayGsdHqJYc56rfVOJlrF6qQKXlE4EWFYumMeutA9UMeUDx8
         AiWng5Qw6F0olKa9S0ktuyZo5pwTey/nalGZJlo4iz7FlfGmEzLqxFO85/qws9L7B2G1
         z/NG7LYxrhn0WvzzvcJs9eLdcLXcIkix5BqD8cX/OOoTa7JGsCUyHzmZaNbnzaAI9Xtq
         p4WveGNxNIHePhvnuXDmzQdfmQA9xcPyyGCMQas31RgDq4dF599NoCuQkyIHz4ZbJHui
         bhig==
X-Gm-Message-State: AOAM5309UhZUtLNcQNoHpyPUi7eqihtdfyeTOUiv9QTTSM0G8G6m8ZAJ
	iIl+MEEGEqT28uAAcm2nWL9+4FV703E=
X-Google-Smtp-Source: ABdhPJz4mtbmvhhRJGqTLga7V+Br6vqUg8SGItevKfpmp5d9n9p3T81ALzuUDmcFwywmtFWRUbiD6w==
X-Received: by 2002:a05:6830:114c:: with SMTP id x12mr937915otq.326.1617899827131;
        Thu, 08 Apr 2021 09:37:07 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.37.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:37:06 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 58/64] libmanette: Add recipe
Date: Thu,  8 Apr 2021 09:36:05 -0700
Message-Id: <77a3b46955d5be709ef6c89f1410a366019f424c.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Its needed for gamepad support in webkit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cf0b587ddd9691a82db1c651f3c3b1ffb94196ee)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb        |  2 +-
 .../libmanette/libmanette_0.2.6.bb               | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libmanette/libmanette_0.2.6.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index a6513352c04..59908e2c0f2 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -760,7 +760,7 @@ RDEPENDS_packagegroup-meta-oe-support ="\
     ccid \
     zchunk \
     libgpiod \
-    libgpiod \
+    libmanette \
     ckermit \
     libcereal \
     daemontools \
diff --git a/meta-oe/recipes-support/libmanette/libmanette_0.2.6.bb b/meta-oe/recipes-support/libmanette/libmanette_0.2.6.bb
new file mode 100644
index 00000000000..23ab348dcfa
--- /dev/null
+++ b/meta-oe/recipes-support/libmanette/libmanette_0.2.6.bb
@@ -0,0 +1,16 @@
+# Copyright (C) 2021 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+SUMMARY = "The simple GObject game controller library"
+HOMEPAGE = "https://gnome.pages.gitlab.gnome.org/libmanette/"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = "libevdev libgudev"
+
+SRC_URI = "https://download.gnome.org/sources/libmanette/0.2/libmanette-${PV}.tar.xz"
+SRC_URI[sha256sum] = "63653259a821ec7d90d681e52e757e2219d462828c9d74b056a5f53267636bac"
+
+inherit meson pkgconfig gobject-introspection ptest vala
+
+FILES_${PN}-ptest =+ "${bindir}/manette-test"
+FILES_${PN}-dev =+ "${libdir}/girepository-1.0"
-- 
2.17.1

