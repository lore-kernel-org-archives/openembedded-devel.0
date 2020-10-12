Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.39176.1602505059514347864
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2020 05:17:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dLYdFvAH;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id b8so5713566wrn.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2020 05:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DKVkhVagdRst7Uqu19XwF6UfNEfU4nw+V1fjeqY9FUM=;
        b=dLYdFvAHqCDV+cbkN6RciUl9ITsvec1jw4N/LKwDkmiWhKdl9974PQxkwleO9+hwHu
         kakOGUOoUZAjxlQUdVbhi/l5KV2n7rLX85TF8j+f7fBu4xBjf+7ENCOwI+L5m27DS4IE
         h6HACI+QPiJGdpxUweHNLcOt+i9mMsJkDvXKiZQFEs7sBdyKTRJDSnBDJbLY41MMo32e
         u2itz0EM5ErT9uW0xoeJS+rJnrNSCdyEBoMw+pQyoAtDz0Fwwm8gq+MG2KsHNQif2GWC
         iNHUCSMY7t/6+8iBqzyXfXsltehO7jahCPQZ++kS+4hivUq5PM3IOGtpxCOVHxbABu0u
         Xb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DKVkhVagdRst7Uqu19XwF6UfNEfU4nw+V1fjeqY9FUM=;
        b=evU++T8xKGzNUiL591sNkXzYBIm1DB1pmyEoujpsed/xUIZtj96ba2cHNTjTrwvDpc
         NpjdWCY2nAh1gklW6pqohsYyw4hWzUAI3o8DFyLsoPAQA1yaidgQjpkjrEgcwkHYbsT/
         iYtJYdrN/A5s7nXF8zMjJi4Q+KkPFtgYlQiZTQzK1bSPf0rqlqomDidzvhGLvyFXh5yf
         hX8Ok6jDMFbvN+Wy5STaMXPxHjB/1oOWmmqjmLnStkev/jAuD1UrA1tkfxVwAcZzUPCN
         mxVExlUQgqmLQDvnkCX4I2E4ZORvphXMEwN4n4BecTVj4QeeuMLPZSh+hZI/H78nxJE/
         z1lg==
X-Gm-Message-State: AOAM531IZ7IZ4xyrA1WLdmXbzlqYcX05Z0Qmps3WOz9AD6VVRlMME50U
	Lb9EvPURT6UBTGzEoc6gCim7s+UChVRnSA==
X-Google-Smtp-Source: ABdhPJwfFqJtvcPBKiqWCH0/tzzXpRhK8qz4FoNbSrc8Fk8P4JHTrFJge/8AA5NA9k5nu2rTHBEH+w==
X-Received: by 2002:adf:eac6:: with SMTP id o6mr31461528wrn.117.1602505057769;
        Mon, 12 Oct 2020 05:17:37 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id l1sm4158196wrb.1.2020.10.12.05.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 05:17:37 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [meta-oe][PATCH 05/13] gstreamer1.0-plugins-bad: disable vulkan
Date: Mon, 12 Oct 2020 13:17:21 +0100
Message-Id: <20201012121729.2094355-5-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012121729.2094355-1-quaresma.jose@gmail.com>
References: <20201012121729.2094355-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vulkan build fail
to build vulkan, a new package is needed.
add shaderc package as a separate pacth

https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/issues/1349

| Program glslc found: NO
| gst-libs/gst/vulkan/meson.build:273:0: ERROR: Program(s) ['glslc'] not found or not executable

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb       | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
index 680b9a5cf5..7fc2eec0cb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
@@ -22,7 +22,7 @@ inherit gobject-introspection
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulkan', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
     bz2 closedcaption curl dash dtls hls rsvg sbc smoothstreaming sndfile \
@@ -76,7 +76,13 @@ PACKAGECONFIG[uvch264]         = "-Duvch264=enabled,-Duvch264=disabled,libusb1 l
 PACKAGECONFIG[va]              = "-Dva=enabled,-Dva=disabled,libva"
 PACKAGECONFIG[voaacenc]        = "-Dvoaacenc=enabled,-Dvoaacenc=disabled,vo-aacenc"
 PACKAGECONFIG[voamrwbenc]      = "-Dvoamrwbenc=enabled,-Dvoamrwbenc=disabled,vo-amrwbenc"
-PACKAGECONFIG[vulkan]          = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader"
+# FIXME: vulkan build fail
+# to build vulkan, a new package is needed.
+# add shaderc package as a separate pacth
+# https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/issues/1349
+#| Program glslc found: NO
+#| gst-libs/gst/vulkan/meson.build:273:0: ERROR: Program(s) ['glslc'] not found or not executable
+#PACKAGECONFIG[vulkan]          = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader shaderc"
 PACKAGECONFIG[wayland]         = "-Dwayland=enabled,-Dwayland=disabled,wayland-native wayland wayland-protocols libdrm"
 PACKAGECONFIG[webp]            = "-Dwebp=enabled,-Dwebp=disabled,libwebp"
 PACKAGECONFIG[webrtc]          = "-Dwebrtc=enabled,-Dwebrtc=disabled,libnice"
-- 
2.28.0

