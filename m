Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.51684.1622508809259492605
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 May 2021 17:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JBUXkGRb;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id v14so9442953pgi.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 May 2021 17:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V73xPzUEgW9MrZz8nwNmbw/aSeH6oMEydQVPSf5/xE0=;
        b=JBUXkGRbP8o81rjqGscvCwxsm7TIi+qNMAoXrevk17xTOyjvqowEU1FDsCEgOtd/Xj
         kxQhtTHCFEm134jT6iRPdrnLl9QZiv2B0CzA35zHEspLsFjkb0GMBUQVYqjwog75QZZa
         C9NuJJRNr1WGtzOCbTM2yN3Mk/5PaEKQrisvgW0ocWsOCxbH8gCpms8m8AWNITYqF8cR
         4RBgLtbalMj6MyKYOvaPt4v/msIi9pNCpVeE/7QgjFi8c8vBtVhrP24JRP4DfLpbTPQ3
         BvO/EJBiUwuIe9I2otsNyDsY8m8OaJ3T+AxBMtPP7SvRi0BSVKVeigdbg80NmqD9/XPp
         AIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V73xPzUEgW9MrZz8nwNmbw/aSeH6oMEydQVPSf5/xE0=;
        b=etFjN4IqfqvHPGB+T2bYaeCX1q0g+3Eix0ERE3+JjPGeafKdn5iOcwXXkD54HfX+q4
         liE9ZL+b1TdngsQfYJ6w0KtpQjzEHM4ljBsc+HkPk+G0h32BUWj7kW3vhKa/9MUbXqRq
         bjhCGOVPWfXLLdDVDyVTnEd20CwhQmjCNUbTiu17Ib0tU12cuXmhYhzitiO7jOLXVxkz
         N4nk+c+367cLp6S2RmdRB8VdUuU31Tb+JvazxaZApWHOI5FnBPoGbI++qhWJ2GwXVNne
         ioXKhyGWzj+US0otDCl1MVLl0SLC1D6COs3TGuvmICyPjMRPnKs9LzB0OLVeTLDGKVF7
         pZmg==
X-Gm-Message-State: AOAM530xFIDm+NH+KKqdARjpkOY1knndTb5Ktqk8S9zw96N8fvRL6CyQ
	a8WsASt+YnznuN7dGg6iwzylvNzX8yC+Cw==
X-Google-Smtp-Source: ABdhPJyFXbifyzi4arYfivdCwIfi+nyrGEXY1gQBOFwq6R05KyH/xjgoph8pl6o/mLmcPudyQV4pUw==
X-Received: by 2002:a65:4d4e:: with SMTP id j14mr15219268pgt.343.1622508808270;
        Mon, 31 May 2021 17:53:28 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id q4sm5194301pgg.0.2021.05.31.17.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 17:53:27 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] vk-gl-cts: Fix O_TRUNC conflict with fcntl.h
Date: Mon, 31 May 2021 17:53:25 -0700
Message-Id: <20210601005325.2913482-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../vk-gl-cts/files/0001-vulkancts.patch      | 40 +++++++++++++++++++
 .../vk-gl-cts/khronos-cts.inc                 |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-vulkancts.patch

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-vulkancts.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-vulkancts.patch
new file mode 100644
index 0000000000..2fd1d7123a
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-vulkancts.patch
@@ -0,0 +1,40 @@
+From 273df2423d9226093310cbcaa8b924bb6b5d6586 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 31 May 2021 17:31:33 -0700
+Subject: [PATCH] vulkancts:
+
+O_TRUNC value in OperationId enum collides with the macro O_TRUNC
+defined in the POSIX header fnctl.h. To avoid the collision undefine
+O_TRUNC in this particular sourcefile before its is used in enums
+down below.
+
+This is fixed upstream differently
+https://github.com/KhronosGroup/VK-GL-CTS/commit/564c6062f72fe7ecd92b4aea1558c441e651c76b
+
+But until we get this module uprev'ed to that, lets use a simpler
+workaround
+
+Upstream-Status: Inappropriate [Fixed Differently]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp     | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/external/vulkancts/modules/vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp b/external/vulkancts/modules/vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp
+index 22e6c75fa..db7f4b54a 100644
+--- a/external/vulkancts/modules/vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp
++++ b/external/vulkancts/modules/vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp
+@@ -38,6 +38,10 @@
+ #include <limits>
+ #include <fenv.h>
+ 
++#ifdef O_TRUNC
++#undef O_TRUNC
++#endif
++
+ namespace vkt
+ {
+ namespace SpirVAssembly
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index d0f0e23429..dc38bd1697 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -24,6 +24,7 @@ DEPENDS += "libpng zlib virtual/libgles2 virtual/egl"
 
 SRC_URI += "file://0001-Workaround-for-GCC-11-uninit-variable-warnings-946.patch;patchdir=external/amber/src \
             file://0001-Include-limits-header-for-numeric_limits.patch;patchdir=external/vulkancts \
+            file://0001-vulkancts.patch \
 "
 
 SRC_URI_append_libc-musl = "\
-- 
2.31.1

