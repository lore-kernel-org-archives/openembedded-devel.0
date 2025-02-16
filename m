Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6853FC021A4
	for <webhook@archiver.kernel.org>; Sun, 16 Feb 2025 14:02:13 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.29090.1739714528844190149
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Feb 2025 06:02:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j6YA9HYt;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4395dddb07dso36941005e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Feb 2025 06:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739714527; x=1740319327; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AppZu96OL3GZXXQgqWKmC3yfybo1+uNEvn+7RAvusqE=;
        b=j6YA9HYtZ3mZmgr8Bmhm8kT2yKMKOOTyvgGlLt9F11tB/xef8iCsDvoJyyYwKiaE7V
         tDjaURaTVrhMlY4yD9ZvcUb7OUHYOrAGHgm7ZDHjF/xBUiYg+jpNxylyiq8SxNtEKi0E
         Pcn/wgPgo8n8/dzLDJMDaqYmsZumdgkEZ+ldGTiNjUkmRYtK8tW3D9iuaGcSP74Am+Nc
         xok7JBh4b2HJ5Y3q1ZFWevnZdpvSd39/ufBxLVslqCqoKkSMs4UCrDqiR0sduzbYYqI9
         62Jqp+LT1ZhO0rEC5GQpCS658bcWLaY/KXvAfSGKxciQvp+rTk16TrzJAzkACxZ2gieo
         uD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739714527; x=1740319327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AppZu96OL3GZXXQgqWKmC3yfybo1+uNEvn+7RAvusqE=;
        b=sW6iaPoAMfqTkoKmvTRx0AXwd63AJTzWRPPou6ft1U/2qkASeioVszsGNvhua24DT8
         3WqRjQ7ODXpsF/pwCxYNNr7zYSge2mD1DqXxb8kQPWZO4rvANGzCjYIBaRlHtp7rcPFi
         glJHARVMoVucju3xgEgZcToQu++wpkoKbnGJh+urYZ+e1HIJZZm4tHVB+9Ht/hN36VMf
         aPK6ZSdBbubkU+ELN6yHtgyk6EZnZYwpculLf0tKzH+GqN0xFbE+EfpaGGPCyvP+EHUJ
         kP4oN9N7+0j9PZvwezYqBMaaHriNNGFd56YgNHM1QBVJePW7Jrlxr/FDQsw1Noayw9jL
         ivGg==
X-Gm-Message-State: AOJu0Yxn55Ymrh6NWFqhT0LUN9ZFzoftLjuaB5O/H5VeuATWkhWgzC8V
	/W78L0KyCRGFJzx7zrELog0CxMw6jevq/CIlW6LxtwbcPKHwDWPiQiAoXw==
X-Gm-Gg: ASbGnctv5dFjTin3a21ovwWd22bFwsfPtttBx5t/sFuAzBxnI0isXMM3CUFK1X7Vhna
	NQ4zQdLwmagzKpglTw3A53e1E4WNv+RDmG+Rn6cP43rD6F2NqQDihcP+nYt4SJcVDiuy7turwqR
	bGtye0UyQuqoseQ0XuNHVZ9ZkNMCflnmtXwbnbczgOqfcpSkjinkYtU9xHVh44Woay0FMbTU3vG
	vt/wEDKjB0U48jXkonHR3bmyx72icPTBjdajRfqOECcbdXry6grR48y3+Akil5kVJ7+rSITYdLh
	agD85vvKh8r0UfOk61IVp/0wliCuCgA=
X-Google-Smtp-Source: AGHT+IFsdAq47G4zHTms9KukvNC4n+o3X/svpB4rrB2cl4z6eLUiR931dINGMNIEOKO/9CA93IQpaw==
X-Received: by 2002:a05:6000:1f87:b0:38f:2c10:da07 with SMTP id ffacd0b85a97d-38f340735d8mr6383457f8f.45.1739714526712;
        Sun, 16 Feb 2025 06:02:06 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ddba7sm9854640f8f.38.2025.02.16.06.02.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 06:02:06 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] libplacebo: fix glslang PACKAGECONFIG
Date: Sun, 16 Feb 2025 15:02:04 +0100
Message-ID: <20250216140205.1527859-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Feb 2025 14:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115502

In case glslang PACKAGECONFIG is enabled, compilation fails with
a lot of errors about undefined references from the glslang namespace, e.g.

| /usr/src/debug/libplacebo/7.349.0/src/glsl/glslang.cc:79:(.text+0x160): undefined reference to `glslang::TShader::TShader(EShLanguage)'

This has been solved in the upstream project, and this change backports
the commit that fixes the meson.build file to find the correct libraries
during compilation.

Additionally, fix also the TMPDIR QA error that popped up after fixing
the above issue: remove the RECIPE_SYSROOT value from the generated
pkgconf file (and instead of referring to the libraries by absolute path,
just refer to them by name, as they are supposed to be present in the
standard library lookup path).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...n-add-glslang-lib-for-15.0.0-linking.patch | 34 +++++++++++++++++++
 .../mplayer/libplacebo_7.349.0.bb             | 10 +++++-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/libplacebo/0001-meson-add-glslang-lib-for-15.0.0-linking.patch

diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo/0001-meson-add-glslang-lib-for-15.0.0-linking.patch b/meta-oe/recipes-multimedia/mplayer/libplacebo/0001-meson-add-glslang-lib-for-15.0.0-linking.patch
new file mode 100644
index 0000000000..8d784da0cc
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/libplacebo/0001-meson-add-glslang-lib-for-15.0.0-linking.patch
@@ -0,0 +1,34 @@
+From d18a23cc275576bcefbdcc179d08ae643eeb3f3e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Kacper=20Michaj=C5=82ow?= <kasper93@gmail.com>
+Date: Mon, 2 Dec 2024 17:10:00 +0100
+Subject: [PATCH] meson: add glslang lib for 15.0.0 linking
+
+Glslang 15.0.0 moved some code around, add also linking to glslang,
+while this is not needed for older versions, it will still work.
+
+Unfortunately CMake config embedded in distributions is not usable
+without installing additional package like glslang-tools, because at
+least Ubuntu splits it. On Arch it would work, but generally the CMake
+config require cmake binary to work also, so let's keep it as-is for
+now.
+
+Upstream-Status: Backport [https://github.com/haasn/libplacebo/commit/056b852018db04aa2ebc0982e27713afcea8106b]
+---
+ src/glsl/meson.build | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/glsl/meson.build b/src/glsl/meson.build
+index 5a881960..8fb5e699 100644
+--- a/src/glsl/meson.build
++++ b/src/glsl/meson.build
+@@ -39,6 +39,10 @@ elif not glslang_req.disabled()
+ 
+     glslang_deps += spirv
+ 
++    # Glslang 15.0.0 moved some code around, add also linking to glslang, while
++    # this is not needed for older versions, it will still work.
++    glslang_deps += cxx.find_library('glslang', required: required, static: static)
++
+     if static
+       glslang_deps += [
+         # Always required for static linking
diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
index 15f324ff49..a5b38db335 100644
--- a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=435ed639f84d4585d93824e7da3d85da"
 
 DEPENDS += "fastfloat glad-native python3-mako-native python3-jinja2-native vulkan-headers"
 
-SRC_URI = "git://code.videolan.org/videolan/libplacebo.git;protocol=https;branch=v7.349"
+SRC_URI = "git://code.videolan.org/videolan/libplacebo.git;protocol=https;branch=v7.349 \
+           file://0001-meson-add-glslang-lib-for-15.0.0-linking.patch"
 SRCREV = "1fd3c7bde7b943fe8985c893310b5269a09b46c5"
 
 inherit meson pkgconfig
@@ -20,3 +21,10 @@ PACKAGECONFIG[lcms] = "-Dlcms=enabled,-Dlcms=disabled,lcms"
 PACKAGECONFIG[demos] = "-Ddemos=true,-Ddemos=false,ffmpeg libsdl2 libsdl2-image"
 
 EXTRA_OEMESON = "-Dvulkan-registry=${STAGING_DATADIR}/vulkan/registry/vk.xml"
+
+do_install:append(){
+  if [ -f ${D}${libdir}/pkgconfig/libplacebo.pc ]; then
+    sed -i "s,${RECIPE_SYSROOT}${libdir}/libSPIRV.so,-lSPIRV,g" ${D}${libdir}/pkgconfig/libplacebo.pc
+    sed -i "s,${RECIPE_SYSROOT}${libdir}/libglslang.so,-lglslang,g" ${D}${libdir}/pkgconfig/libplacebo.pc
+  fi
+}

