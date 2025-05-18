Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C41D9C54795
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 17:33:16 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.34327.1747589593528490490
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 May 2025 10:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lw99OCs2;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7370a2d1981so2901720b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 10:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747589593; x=1748194393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kd93sYILRkmlX7gsHyafgeGt3LOK4x+wQ+Wqmp6uQ4A=;
        b=lw99OCs2nEF/rbfNhenMr2xfBgu+kIu2XFv6q+JWXviJHVKpYf4oj6dJggaO+tq+R4
         YjcKR5gwOMDFXW7YbiIqFHlQ/GzsVMGirZDdNkaAiAhUpJ8Y3LbG4M/hhTvcW7vAaDNV
         fvXIqUW1iEIBeRWDl710kxBkLHFnAeRNm0MzgWbO2+6Tmf0ttLJuV2OW9MLWajH749Qg
         p+prSXKizoEZ0UHCqH/GV4R3HD3bpdaTxZ1K78trc5xgLoIgDsUd6T2z5DI+WGcx4sVH
         ZjhF0bdEKtDPOrbeNy51L3yadjULgUapg8vNQQh8fzrr3Z++QMCeSjGamGTfHlptIIX+
         Ov9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747589593; x=1748194393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kd93sYILRkmlX7gsHyafgeGt3LOK4x+wQ+Wqmp6uQ4A=;
        b=VuRrLeR4qFkXQiiL4u2hGCG6k3Ybonb3vcesh/x1GU82GTTZtCRAZfp8F+NVZ0e+7F
         0JESJC2ze3DdwD5Cei8S95RUHvR7jjW8GXrTxNgzqx7h1K/mpGlcdwoXXFo/s+QUHkFw
         UU1gTHyd7HrtzFRxdJbLIh8sYDVJK4Jcm5Ip4lQrw448iWB9sxGXOLJrxPVsnT4IOIqi
         8rwT54WhQhiqodDjn9PpFL7hSw8hgfbCFHV2mgD/ZZ+EGzgq5BpF6AsP4Ny/+qjtqsHI
         X+S7X+ymPbcT0ySpTuUDfGjvpbqzfwFvPElIMRxyQb4vkrcTR9mi69xHsRAbs7/sAZ6f
         mIVA==
X-Gm-Message-State: AOJu0YwxISVLOhZzDSXh4D7Nh+6NmzjbZjbfgNUYm9IARAEb0wjE7Vgu
	WWeV/h/VVoAXgLRTm0NlFoe+zVgWRyNUwx5Q50jSC7M1Sddo6RwYG2yUsRya4V6N
X-Gm-Gg: ASbGncveki1ls25Y77vvu4CPeB+GBs4VJtmd9+tldRYPzy2cuDPhHzOyy7iPBePYA0p
	K2oWYRfTZQuyiW1pterULN2CMy1vhamPXP5YzMKnG3TuHOzrly7nuq5iz68CayhL0MO5Op6XaW1
	GcPwW5PP5WcLgTff5wicWwVQl541Ik7ainA667GqAmsx9D7i3tKQfS+pKaZl5QQ4OnTphgSYni1
	6gugzqFIWq/aV09ciWtU4qLXJ3msCukwG6pz/6dwmdvtGk9gy2KkwHIjcHxe6YPQyaY7L9Haqt4
	eQ3qwXI4wnBMzio3y/p1SM+KXVUDYqrzcNMvFXgVvl8=
X-Google-Smtp-Source: AGHT+IFFUIX6lu2K2xZkjPO9w8Tm4RZK7Gxs2hgq38qjkG4eQ/7iHAB/hR6PEhcko6phE0ao/9r48g==
X-Received: by 2002:a05:6a00:9094:b0:736:57cb:f2b6 with SMTP id d2e1a72fcca58-742acce138dmr13390298b3a.12.1747589592600;
        Sun, 18 May 2025 10:33:12 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970bb2fsm4890177b3a.53.2025.05.18.10.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 10:33:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/4] python3-kivy: Fix build with cython 3.1
Date: Sun, 18 May 2025 10:33:07 -0700
Message-ID: <20250518173309.3600728-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518173309.3600728-1-raj.khem@gmail.com>
References: <20250518173309.3600728-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 17:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117457

Backport needed patch from upstream top of tree branch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...n-2-long-from-Cython-files-fixes-bui.patch | 63 +++++++++++++++++++
 .../python/python3-kivy_2.3.1.bb              |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-kivy/0001-Remove-old-Python-2-long-from-Cython-files-fixes-bui.patch

diff --git a/meta-python/recipes-devtools/python/python3-kivy/0001-Remove-old-Python-2-long-from-Cython-files-fixes-bui.patch b/meta-python/recipes-devtools/python/python3-kivy/0001-Remove-old-Python-2-long-from-Cython-files-fixes-bui.patch
new file mode 100644
index 0000000000..c68e227482
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-kivy/0001-Remove-old-Python-2-long-from-Cython-files-fixes-bui.patch
@@ -0,0 +1,63 @@
+From 288e3d5ecff1bc5e7de29d9daddb83d697280004 Mon Sep 17 00:00:00 2001
+From: Mirko Galimberti <me@mirkogalimberti.com>
+Date: Sun, 18 May 2025 09:38:14 +0200
+Subject: [PATCH] Remove old Python 2 long from Cython files, fixes build with
+ Cython `3.1.x` (#9056)
+
+Upstream-Status: Backport [https://github.com/kivy/kivy/commit/5a1b27d7d3bdee6cedb55440bfae9c4e66fb3c68]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ kivy/graphics/context_instructions.pyx | 2 +-
+ kivy/graphics/opengl.pyx               | 4 ++--
+ kivy/weakproxy.pyx                     | 3 ---
+ 3 files changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/kivy/graphics/context_instructions.pyx b/kivy/graphics/context_instructions.pyx
+index 0d4b8f548..1c23c0e1c 100644
+--- a/kivy/graphics/context_instructions.pyx
++++ b/kivy/graphics/context_instructions.pyx
+@@ -86,7 +86,7 @@ cdef tuple rgb_to_hsv(float r, float g, float b):
+ 
+ cdef tuple hsv_to_rgb(float h, float s, float v):
+     if s == 0.0: return v, v, v
+-    cdef long i = long(h * 6.0)
++    cdef long i = <long>(h * 6.0)
+     cdef float f = (h * <float>6.0) - i
+     cdef float p = v * (<float>1.0 - s)
+     cdef float q = v * (<float>1.0 - s * f)
+diff --git a/kivy/graphics/opengl.pyx b/kivy/graphics/opengl.pyx
+index bcca70842..f535c62a6 100644
+--- a/kivy/graphics/opengl.pyx
++++ b/kivy/graphics/opengl.pyx
+@@ -689,7 +689,7 @@ def glDrawElements(GLenum mode, GLsizei count, GLenum type, indices):
+     cdef void *ptr = NULL
+     if isinstance(indices, bytes):
+         ptr = <void *>(<char *>(<bytes>indices))
+-    elif isinstance(indices, (long, int)):
++    elif isinstance(indices, int):
+         ptr = <void *>(<unsigned int>indices)
+     else:
+         raise TypeError("Argument 'indices' has incorrect type (expected bytes or int).")
+@@ -1539,7 +1539,7 @@ def glVertexAttribPointer(GLuint index, GLint size, GLenum type, GLboolean norma
+     cdef void *ptr = NULL
+     if isinstance(data, bytes):
+         ptr = <void *>(<char *>(<bytes>data))
+-    elif isinstance(data, (long, int)):
++    elif isinstance(data, int):
+         ptr = <void *>(<unsigned int>data)
+     else:
+         raise TypeError("Argument 'data' has incorrect type (expected bytes or int).")
+diff --git a/kivy/weakproxy.pyx b/kivy/weakproxy.pyx
+index cac4fe66b..e8e1c0b77 100644
+--- a/kivy/weakproxy.pyx
++++ b/kivy/weakproxy.pyx
+@@ -253,9 +253,6 @@ cdef class WeakProxy(object):
+     def __int__(self):
+         return int(self.__ref__())
+ 
+-    def __long__(self):
+-        return long(self.__ref__())
+-
+     def __float__(self):
+         return float(self.__ref__())
+ 
diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb b/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
index dd60ea43d5..83dc97955c 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
@@ -12,6 +12,7 @@ inherit setuptools3 pkgconfig features_check cython
 # Also, if using SDL2 as backend, SDL2 needs to be configured with gles
 SRC_URI = "git://github.com/kivy/kivy.git;protocol=https;branch=stable \
            file://0001-add-support-for-glesv2.patch \
+           file://0001-Remove-old-Python-2-long-from-Cython-files-fixes-bui.patch \
            "
 
 SRCREV = "20d74dcd30f143abbd1aa94c76bafc5bd934d5bd"

