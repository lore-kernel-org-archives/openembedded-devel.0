Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.8843.1623133351013860852
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 23:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iYnuDlNf;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id c9so11471685wrt.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jun 2021 23:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UEVgDSWM6v4FjDBnEkU9hapZ0v5kKIaYVlmhsm2LCZU=;
        b=iYnuDlNfqtux/RLSVwIMRCgNKjhZHukdDGQDSzcEcXgjYSEvRuxiPQrlyDDs8OYLmc
         RU9Z19PwVk9xLht28mEpWAWe5X0UwyLyRBqsgVO+Mm9cnnzOCD2hT0+qSj0BJBztRE0D
         BHLkLGqDuGtOd+UuEcDyiFSCPBOIW9mQgNJ0X2th3ne0sRVOf+pE0P8nC3fq/t0GHtPv
         lmLM3vSQfyAGV2XoeFQ04Y/g239+YpK5cwQtlptDfvNFCcrYvW5HlCllLE7v6u2m/PPi
         gO/TtTRWTyDKjJXBQhFyVOg3eoNZMc6xu8xyfbeEePV5LmRDa9dhWt7fc0gRnnsQRBc5
         r+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UEVgDSWM6v4FjDBnEkU9hapZ0v5kKIaYVlmhsm2LCZU=;
        b=FudMqnkWfhPBE2peckj4yQV7XP3R2IrmsF41akbv7daBECeg8xxk0B4yic340fpL7Z
         EwfTSEVIXSlrsdiwySl4zkQLF8/GL19/+fqFJNkwMLW3VEAOQysz0hNt9Uc7ZVltlSnR
         VIVtGcUm+akTkTGQr7uEYV7nX275TyH0jh7XQuMtT6tESHIoTGR+djInLjyQl2eFpaVH
         OISLICwrZdeTE6f914DTsGjVPh+hO0McGQuRct7vUwEJuhLZrhSRm2cIL1pLuVaonN4Z
         fQ37O9uUWLkS6I1v5nGd4+StyaxLFXwwQ3tIIsMe7tTytqwMPeiMedNC3zlquSKhu7rS
         5awg==
X-Gm-Message-State: AOAM530GVZEHLqgbf0GmquZRWUVek5tSIvrj5XSd+SDYoDoDmR+u+MC4
	b8EtLnMz28rPnxX4fmk0CBZAoxbKcxrM+g==
X-Google-Smtp-Source: ABdhPJwcrlDmnittjcOfhA7A9Uj1pyAJrOMVOsqDIgrXGC5Vd9WvU4IlCztdTTZzvSnQjsn1Eq/ksA==
X-Received: by 2002:adf:f748:: with SMTP id z8mr21545206wrp.115.1623133349425;
        Mon, 07 Jun 2021 23:22:29 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e97639a19d79e95f79a.dip0.t-ipconnect.de. [2003:f0:7f29:7e97:639a:19d7:9e95:f79a])
        by smtp.gmail.com with ESMTPSA id f18sm16493969wmj.13.2021.06.07.23.22.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 23:22:29 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/4] gthumb: initial add 3.10.3
Date: Tue,  8 Jun 2021 08:22:12 +0200
Message-Id: <20210608062212.2887426-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608062212.2887426-1-schnitzeltony@gmail.com>
References: <20210608062212.2887426-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/gthumb/gthumb_3.10.3.bb     | 29 +++++++++++++++++++
 .../packagegroups/packagegroup-gnome-apps.bb  |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gthumb/gthumb_3.10.3.bb

diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_3.10.3.bb b/meta-gnome/recipes-gnome/gthumb/gthumb_3.10.3.bb
new file mode 100644
index 000000000..94cac89a9
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_3.10.3.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Image viewer and browser"
+LICENSE="GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+DEPENDS = " \
+    glib-2.0-native \
+    bison-native \
+    yelp-tools-native \
+    gtk+3 \
+    gsettings-desktop-schemas \
+    zlib \
+    jpeg \
+    exiv2 \
+    colord \
+    lcms \
+    libraw \
+    librsvg \
+    libsoup-2.4 \
+    json-glib \
+    libsecret \
+"
+
+inherit gnomebase gnome-help gsettings itstool mime-xdg
+
+SRC_URI[archive.sha256sum] = "dab73f77cc2963ebe90112972c301441d228af3003cfef3f8b7300a6d5d3c212"
+
+FILES_${PN} += "${datadir}/metainfo"
diff --git a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
index 593e5866d..8771cb368 100644
--- a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
+++ b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
@@ -17,6 +17,7 @@ RDEPENDS_${PN} = " \
     gnome-font-viewer \
     gnome-photos \
     gnome-terminal \
+    gthumb \
     libwnck3 \
     nautilus \
     ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'gnome-system-monitor gnome-disk-utility', '', d)} \
-- 
2.31.1

