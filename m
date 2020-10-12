Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.39179.1602505068523108769
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2020 05:17:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KDoYhg2f;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id p15so16978153wmi.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2020 05:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HC/uw1F3AAcrxaugH115Mv9rT07mQP7vPr/J+a+JJ3U=;
        b=KDoYhg2fkyPxFq8d6l+C14CFtAX5g7uSZ9Pe+kH1V9jPrDXB3/NbCS4c05LYHDEgrC
         El67+iWsaEGOOKkAAn/WByFSMkBD2Vn6U7Qt77EIA8+wdqoJQwoim/4mf2sjLdoE6Nrm
         H7pmhgynBdi+8hlC/q1FwQJCLkxJ+d8zE06Qp+E2ORV48BzqJwfs4+whVcpal9iOrkT1
         qlBJNh82JUovHc5xFwz8MhveC4ELQDkm4rXzdPbBk6sVh3vhKUy+YxnCCLqSfo4t2dfY
         0XKM2WnR5xF0Q6mFKfd48dSXwQUFex6lEtTavJh0lJYvpJhVhl/0inH98MDg1gONrSTU
         CFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HC/uw1F3AAcrxaugH115Mv9rT07mQP7vPr/J+a+JJ3U=;
        b=O4xaGtYRgiDUQqEDu5yg3ajxJBLmmewU3848MYV52ilLdQqM/3/fdfpw7wvNj/j9Ij
         VcYiQDfh9/PxHzsqI1IQyEylRANQ4F9tbH9T6e4i4fXDTyOKkCAZH+hxrLE9HvmnRC+W
         To1q6kf3Uh7NlhTZsfl6ilaT9oLkejV7Z2XwJVSgxNCeiFb0S1SdZRPAFr6h4uz8DHoR
         Oo64SFe3HCoNNBN+cTS6Pk4D/bI4fU9SzkM128eeyJfs5sl29BxODp7Vs5chyCoQMSEi
         6cfDJSwW7WKoLHZSrsldxcTNbepVgTYB/VrQKXlhFUHKmGQ+NOCVTVv8ej3K4leQenkE
         T1VQ==
X-Gm-Message-State: AOAM532W/nDDyj5T17AKq0P9qW0PoAj22AUb9THjs5KMdbeAfNgsJo+K
	TS4dD1xRWNmPhuAC3G4krV0uZ8Uzq6ez3Q==
X-Google-Smtp-Source: ABdhPJwOXnkU6zRz79QjLd3kW0OGbp7Z41Bo4Lhzv5/Xgal0lef4UMzyUuvmMSY6Ba15EuKLSMLB4g==
X-Received: by 2002:a7b:c341:: with SMTP id l1mr10905669wmj.80.1602505066740;
        Mon, 12 Oct 2020 05:17:46 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id l1sm4158196wrb.1.2020.10.12.05.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 05:17:46 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [meta-oe][PATCH 13/13] gstreamer1.0-libav: upgrade to version 1.18.0
Date: Mon, 12 Oct 2020 13:17:29 +0100
Message-Id: <20201012121729.2094355-13-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012121729.2094355-1-quaresma.jose@gmail.com>
References: <20201012121729.2094355-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: All code is now LGPL-2.1+

Starting with 1.17, we will not ship a copy of FFmpeg in our release
tarballs, and all the remaining code is LGPL2.
https://gitlab.freedesktop.org/gstreamer/gst-libav/-/commit/c437e175ad9c82732ac46e36ccc398ad041bf13b

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-libav_1.16.2.bb    | 35 -------------------
 .../gstreamer/gstreamer1.0-libav_1.18.0.bb    | 21 +++++++++++
 2 files changed, 21 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.2.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.0.bb

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.2.bb
deleted file mode 100644
index 2fdefc925e..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.2.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "Libav-based GStreamer 1.x plugin"
-HOMEPAGE = "http://gstreamer.freedesktop.org/"
-SECTION = "multimedia"
-
-LICENSE = "GPLv2+ & LGPLv2+ & ( (GPLv2+ & LGPLv2.1+) | (GPLv3+ & LGPLv3+) )"
-LICENSE_FLAGS = "commercial"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
-                    file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c"
-
-SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
-           "
-SRC_URI[md5sum] = "eacebd0136ede3a9bd3672eeb338806b"
-SRC_URI[sha256sum] = "c724f612700c15a933c7356fbeabb0bb9571fb5538f8b1b54d4d2d94188deef2"
-
-S = "${WORKDIR}/gst-libav-${PV}"
-
-DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base ffmpeg"
-
-inherit meson pkgconfig upstream-version-is-even
-
-FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
-FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
-
-delete_unused_libav_copy() {
-        # When building with meson, the internal libav copy is not used.
-        # It is only present for legacy autotools based builds. In future
-        # GStreamer versions, the autotools scripts will be gone, and so
-        # will this internal copy. Until then, it will be present. In order
-        # to make sure this copy is not included in the -src package, just
-        # manually delete the copy.
-        rm -rf "${S}/gst-libs/ext/libav/"
-}
-
-do_unpack[postfuncs] += " delete_unused_libav_copy"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.0.bb
new file mode 100644
index 0000000000..a50f65e981
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Libav-based GStreamer 1.x plugin"
+HOMEPAGE = "http://gstreamer.freedesktop.org/"
+SECTION = "multimedia"
+
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
+                    file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
+                    "
+
+SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
+SRC_URI[md5sum] = "fe2f07356fa37445837cdde274027117"
+SRC_URI[sha256sum] = "42f93f5ce9a3fc22051e5f783a4574b56ebf213f331f75dcbc3552459bd3a06a"
+
+S = "${WORKDIR}/gst-libav-${PV}"
+
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base ffmpeg"
+
+inherit meson pkgconfig upstream-version-is-even
+
+FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
+FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
-- 
2.28.0

