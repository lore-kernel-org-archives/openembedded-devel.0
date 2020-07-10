Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
 by mx.groups.io with SMTP id smtpd.web10.11720.1594390884290297106
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2020 07:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mNd7Pzh/;
 spf=pass (domain: linaro.org, ip: 209.85.167.194, mailfrom: anibal.limon@linaro.org)
Received: by mail-oi1-f194.google.com with SMTP id e4so4934226oib.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2020 07:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dwao7pmBaFz0KrdEDk2A/wIeCdL6wjAQU3EE65BV2z0=;
        b=mNd7Pzh/OeRwUiMUxun7l7WXnliy/HVmq26PcfCDYogCca/QevNdbJLX4EEGkcSXx9
         coY1vzHS8T8E3M/en7lA0lBCNcbrrzWrd7goqS1l620VzWA24+ozmHc/NOOVR8lk/gyW
         73RDsnfMvHWS+nNlRhRgzJ3DPEGqY3n0ELXl4ZiSspAnVbLTcxBZ8JzVcCnS12UXjmme
         pmMnWgcNsXGsTJL8NZVis4rnycUqlmbcwhw5GbFEan+gkGp+RY5bYttBKy75AXfx+z8E
         C96Hu/1aeXrItzkPO8nCTu1NftCRWpmF7pq1w4/YfW6mpILiLcJak68bV/NVoFKDXgEL
         cHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dwao7pmBaFz0KrdEDk2A/wIeCdL6wjAQU3EE65BV2z0=;
        b=tdA+JXRshNnZnkl/OdK6kxBXQR77jm63bFdfR4nMqsMs6cAfskuuHOt6IcpHI2uBGH
         T8s0uBVOU72izJjphTHzucGZdfmQH+eUz+YeQ1UYFraFn/DOtHWzgVzpMBmvm6Wy/KRb
         1dH1qV18jwjsVgmK/NXbl6qHmwkX0V1SaM9SkWTY9g75xeKmt4Geu2vSbHOiY1daQvVJ
         2A6g1ZD/XsWMP9chQRzwefuDGGBePbwuF21KXKxLagrA4jSySYkxqMdop1lTpLjRyfd4
         J01gctuo1JvENgV5c970kXch8Z1fgJVDQOR6zlbhgpmyZSaFiwuXuuufzge5E/mNJYCR
         /iCg==
X-Gm-Message-State: AOAM533CWjubeGxY21+N/m1qSlALHF/Q4+yDJxP/os/hgjrboBy+uZ7S
	Czm+Boyz2OcJiHa250qHDH24xAEsp7A=
X-Google-Smtp-Source: ABdhPJyk+CFXY8k3E6ISln9tYma5FBJAHy+Mm+oW938vXZdOqfbTivT25ROpd0+yhGeIAI30WUsI7w==
X-Received: by 2002:aca:1e04:: with SMTP id m4mr4186534oic.76.1594390882989;
        Fri, 10 Jul 2020 07:21:22 -0700 (PDT)
Return-Path: <anibal.limon@linaro.org>
Received: from blackbox.rga.ip ([2806:109f:4:f5a5:908a:c7ff:fe6a:e9f5])
        by smtp.gmail.com with ESMTPSA id s8sm1111416otk.36.2020.07.10.07.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 07:21:22 -0700 (PDT)
From: "Anibal Limon" <anibal.limon@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: nicolas.dechesne@linaro.org,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH 2/2] recipes-graphics: Add parallel-deqp-runner recipe
Date: Fri, 10 Jul 2020 09:21:14 -0500
Message-Id: <20200710142114.10612-2-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710142114.10612-1-anibal.limon@linaro.org>
References: <20200710142114.10612-1-anibal.limon@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 ...-WORKAROUND-Remove-vulkan-dependency.patch | 42 +++++++++++++++++++
 .../parallel-deqp-runner_git.bb               | 14 +++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner/0001-meson.build-WORKAROUND-Remove-vulkan-dependency.patch
 create mode 100644 meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_git.bb

diff --git a/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner/0001-meson.build-WORKAROUND-Remove-vulkan-dependency.patch b/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner/0001-meson.build-WORKAROUND-Remove-vulkan-dependency.patch
new file mode 100644
index 000000000..0fedfad13
--- /dev/null
+++ b/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner/0001-meson.build-WORKAROUND-Remove-vulkan-dependency.patch
@@ -0,0 +1,42 @@
+From 2b74a5b160c0500291c554ab5c0944f502e72a42 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
+Date: Thu, 9 Jul 2020 20:00:53 +0200
+Subject: [PATCH] meson.build: WORKAROUND Remove vulkan dependency
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+We need a patch in the source code to allow enable when DISTRO_FEATURES
+contains vulkan.
+
+Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
+---
+ meson.build | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index db97c26..4c1b865 100644
+--- a/meson.build
++++ b/meson.build
+@@ -3,21 +3,15 @@ project('parallel-deqp-runner', ['c', 'cpp'],
+ cpp = meson.get_compiler('cpp')
+ 
+ thread_dep = dependency('threads')
+-vulkan_dep = dependency('vulkan')
+ 
+ fs_dep = cpp.find_library('stdc++fs', required : false)
+ if not fs_dep.found()
+     fs_dep = cpp.find_library('c++fs')
+ endif
+ 
+-
+ deqp_runner = executable('deqp-runner',
+            'src/deqp-runner.cc',
+            dependencies : [thread_dep, fs_dep],
+            install : true)
+ 
+-executable('hang-detection',
+-           'src/hang_detection.c',
+-           dependencies: [vulkan_dep])
+-
+ subdir('test')
diff --git a/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_git.bb b/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_git.bb
new file mode 100644
index 000000000..4c02cc55a
--- /dev/null
+++ b/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_git.bb
@@ -0,0 +1,14 @@
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4f59d6446bf2e004e80df1a0937129fa"
+
+SRC_URI = "git://gitlab.freedesktop.org/mesa/parallel-deqp-runner.git;protocol=https \
+           file://0001-meson.build-WORKAROUND-Remove-vulkan-dependency.patch \
+           "
+
+# Modify these as desired
+PV = "2020.06.15+git${SRCPV}"
+SRCREV = "e1642fb691d29b1462504b58916f7f514a963e80"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig meson
-- 
2.27.0

