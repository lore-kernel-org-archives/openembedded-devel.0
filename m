Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33667.1794851712522991527
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=X4gHx24i;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso4581688eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851712; x=1795456512; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=riFesfHk2kDrq9bzgWWmKj6iiiummPCsQlf/gh1zV4Q=;
        b=X4gHx24ifensrobDq1W6O7KiAPZUW9CBYy7u7+DOTv8b3PV1cPZ3bRJNRHlYssMZZP
         4GogWNvr1cyZSNYHGinI5qZ1VdhiLeu8Yis+kUqPl8NisnsHDNpLYftJXDTbd6XHJRS4
         dydB63yZIlg4x6N5JAHn0bcLWlyCMzFSZ1IGySeOPCGbxmACvWvudwxl+unBWd8oanJz
         toVHKj9vuEn9+amTJdxW3CXC9H0rQ/L7zRMZoxKse5JpL/l4BPAD+YIZnUiJjCStA5sj
         hL672i0h1SCCJ7Sv6tV/YGuL7z8l+C1blDqZpuBzkv+2SZoQY926w40uobrGzjPDQ55Q
         h6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851712; x=1795456512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=riFesfHk2kDrq9bzgWWmKj6iiiummPCsQlf/gh1zV4Q=;
        b=P/QjN59Kheo/aw05asd0Meex3f3Hy0/0z+3N/K/J53SuaBqDm54Ui9kSI+ZiW3AFKE
         S4bvOGFMNrBMQ8SJOy5ZgGhH31LHDw7ylzcZ85AndB2MBMyRff+VCzrXKYKDFxno9xoB
         tEJX9rFgmhz9PZYUYK8EGyvy6P4GuIZ+iVcZxdRPkWgFAVx7cfmDFy5hBdFJAOviLW6Q
         /8pyKUGlEfEf+QKahXtww9gMuvZ0ylov6PDrJkrrLa+DLrqPJEC1gco62Ahgvvd0aUm4
         gotXVXV9G/qUN813iYL3Sn38Gimze5OTO36Aw1ikAWu35pDMIGZgyIRkuoz/449r9tWk
         SCvQ==
X-Gm-Message-State: APuU4Z9oxOMUU3bhY1V6lELvdpIzsOLbs/dpAHbbFxhDCZuoW1T0wbAA
	oBSXI5yffnnsGCL2hpznfFBQJ305FkmkzWHx57kvREodo40gE63h8wFMHxOeZRjq
X-Gm-Gg: AYBFou0TeHz5mAHluLmLY1m1Je6KMdUfj1F+R2zRrVNBAO8TfX1LsZ0ELaoof3MPRAT
	dpvbcnIiSbiVdP5/0PvU2Xn9FrjduytlbHIywENpf6JhjRXJ3M8afsHKc4JftwfVJdBfLQcLbQu
	T6C9NTLeu5UXX5e43AVSb15qbxCph1vYjmN/mlxMcm9t77sEbv2Q104cGrmZlAE6byumrZuu1pK
	RNHmiLl1S7xPewOSrfzEu2pG/nDBFJje6ZxngPkaGdJN1UE8ckmGg0dGoTFJn+BYSi2ZIWuNFdo
	2ydbyPD9Ux3U3Vjx8Z0C4MmJWpBysrmAaA1RfJDWjYGWd7hAD5EyhzMJ6aBstYtkZrGPHQx5iUw
	fEgKGtS2CHAwJc3xHIJ1P7IeogmVqT/HImAXiWFVYjYz39qpBLR3rDZIfWvZikjTFMLIGKdWMLp
	vzjQ15A1JUm0GA8Tc7NGRjpFevgGJkg5MAnvfYlK80BPpR0vmX29+Q2amxDHt02ZaQ03aOa5kJ5
	PtcdrwKPa76wyfPcoHx2WZUKFMTnIJ3Fas4nVznxT+GO6ALL6g/PHZeIM56imAkMaLB8jZ2bawc
	76ppvn4nAmM25xV7xGzUuWMLpVi5aaMBYnLFNsAMBmt7YW4dS5fVQHq5AmFz+gZSxWMPYTIZzzG
	cP4NTapFRs3/zlGwQuHcAH0fOBW13T5fOLCMelm2yxGyPm5sPzVG2omRsmxv6bxqXZk+vl7YAkL
	OhK1dEZEaVmuT+M8YgtvcSpVIBuB+8WHMFmFIxBSufbWYIJREwO1m7AB/uWDJknK51CDoc8iVVp
	57oqNN5q0PVcw9lWNqypBQAOtrLUhTP/jXlIubf89pQHL5TdPuqozXsz0dPf/DP841DNvvh7Tjv
	68qx
X-Received: by 2002:a05:7301:5401:b0:35c:8b96:94d9 with SMTP id 5a478bee46e88-37966f31fddmr9655364eec.19.1794851711777;
        Mon, 16 Nov 2026 09:55:11 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 048/105] python3-kivy: upgrade 2.3.1 -> 2.3.2
Date: Mon, 16 Nov 2026 09:53:00 -0800
Message-ID: <20261116175359.342679-48-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132504
Content-Type: text/plain; charset="utf-8"

Drop the Cython long patch, it is part of this release.

Changes:
- Maintenance release for Python 3.14: CI/wheels, CodeInput finally
  return fix, asyncio examples, kivy_deps.angle ~=0.5.0 on 3.14+,
  ffpyplayer restored, Pillow/media dependencies adjusted.
- Build: removed Python 2 "long" usage so it builds with Cython 3.1.x;
  build-time packaging requirement relaxed to packaging>=24.0,<26.
- KV parser f-strings resolve nested attribute names; SDL2 window
  creation falls back when GetDpiForWindow returns 0 (Windows).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...n-2-long-from-Cython-files-fixes-bui.patch | 63 -------------------
 ...n3-kivy_2.3.1.bb => python3-kivy_2.3.2.bb} |  3 +-
 2 files changed, 1 insertion(+), 65 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-kivy/0001-Remove-old-Python-2-long-from-Cython-files-fixes-bui.patch
 rename meta-python/recipes-devtools/python/{python3-kivy_2.3.1.bb => python3-kivy_2.3.2.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-kivy/0001-Remove-old-Python-2-long-from-Cython-files-fixes-bui.patch b/meta-python/recipes-devtools/python/python3-kivy/0001-Remove-old-Python-2-long-from-Cython-files-fixes-bui.patch
deleted file mode 100644
index c68e227482..0000000000
--- a/meta-python/recipes-devtools/python/python3-kivy/0001-Remove-old-Python-2-long-from-Cython-files-fixes-bui.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 288e3d5ecff1bc5e7de29d9daddb83d697280004 Mon Sep 17 00:00:00 2001
-From: Mirko Galimberti <me@mirkogalimberti.com>
-Date: Sun, 18 May 2025 09:38:14 +0200
-Subject: [PATCH] Remove old Python 2 long from Cython files, fixes build with
- Cython `3.1.x` (#9056)
-
-Upstream-Status: Backport [https://github.com/kivy/kivy/commit/5a1b27d7d3bdee6cedb55440bfae9c4e66fb3c68]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- kivy/graphics/context_instructions.pyx | 2 +-
- kivy/graphics/opengl.pyx               | 4 ++--
- kivy/weakproxy.pyx                     | 3 ---
- 3 files changed, 3 insertions(+), 6 deletions(-)
-
-diff --git a/kivy/graphics/context_instructions.pyx b/kivy/graphics/context_instructions.pyx
-index 0d4b8f548..1c23c0e1c 100644
---- a/kivy/graphics/context_instructions.pyx
-+++ b/kivy/graphics/context_instructions.pyx
-@@ -86,7 +86,7 @@ cdef tuple rgb_to_hsv(float r, float g, float b):
- 
- cdef tuple hsv_to_rgb(float h, float s, float v):
-     if s == 0.0: return v, v, v
--    cdef long i = long(h * 6.0)
-+    cdef long i = <long>(h * 6.0)
-     cdef float f = (h * <float>6.0) - i
-     cdef float p = v * (<float>1.0 - s)
-     cdef float q = v * (<float>1.0 - s * f)
-diff --git a/kivy/graphics/opengl.pyx b/kivy/graphics/opengl.pyx
-index bcca70842..f535c62a6 100644
---- a/kivy/graphics/opengl.pyx
-+++ b/kivy/graphics/opengl.pyx
-@@ -689,7 +689,7 @@ def glDrawElements(GLenum mode, GLsizei count, GLenum type, indices):
-     cdef void *ptr = NULL
-     if isinstance(indices, bytes):
-         ptr = <void *>(<char *>(<bytes>indices))
--    elif isinstance(indices, (long, int)):
-+    elif isinstance(indices, int):
-         ptr = <void *>(<unsigned int>indices)
-     else:
-         raise TypeError("Argument 'indices' has incorrect type (expected bytes or int).")
-@@ -1539,7 +1539,7 @@ def glVertexAttribPointer(GLuint index, GLint size, GLenum type, GLboolean norma
-     cdef void *ptr = NULL
-     if isinstance(data, bytes):
-         ptr = <void *>(<char *>(<bytes>data))
--    elif isinstance(data, (long, int)):
-+    elif isinstance(data, int):
-         ptr = <void *>(<unsigned int>data)
-     else:
-         raise TypeError("Argument 'data' has incorrect type (expected bytes or int).")
-diff --git a/kivy/weakproxy.pyx b/kivy/weakproxy.pyx
-index cac4fe66b..e8e1c0b77 100644
---- a/kivy/weakproxy.pyx
-+++ b/kivy/weakproxy.pyx
-@@ -253,9 +253,6 @@ cdef class WeakProxy(object):
-     def __int__(self):
-         return int(self.__ref__())
- 
--    def __long__(self):
--        return long(self.__ref__())
--
-     def __float__(self):
-         return float(self.__ref__())
- 
diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb b/meta-python/recipes-devtools/python/python3-kivy_2.3.2.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
rename to meta-python/recipes-devtools/python/python3-kivy_2.3.2.bb
index a2602a9a81..9b630c5ba4 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.3.2.bb
@@ -12,10 +12,9 @@ inherit setuptools3 pkgconfig features_check cython
 # Also, if using SDL2 as backend, SDL2 needs to be configured with gles
 SRC_URI = "git://github.com/kivy/kivy.git;protocol=https;branch=stable \
            file://0001-add-support-for-glesv2.patch \
-           file://0001-Remove-old-Python-2-long-from-Cython-files-fixes-bui.patch \
            "
 
-SRCREV = "20d74dcd30f143abbd1aa94c76bafc5bd934d5bd"
+SRCREV = "ec09ee880c666e70de42501f36dbc43e349e3712"
 
 
 PACKAGES += "${PN}-examples"
