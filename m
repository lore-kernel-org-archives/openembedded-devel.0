Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0376EC3ABBF
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 23:26:21 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.64032.1746487572182396967
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 16:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OEun5FuB;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c0dfba946so3986909f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 16:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1746487570; x=1747092370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zVmpUDMv6y3spgzXUu3CUK2QokdsSW+CehJ9PCLrAzE=;
        b=OEun5FuBcm75Yn5xS1uU3Fvu8t8Ib+gjU9lh0u3mVuI1MI0+NmF43y9U/wCQcaiHgm
         BhNJUY6ZtKodd2lSrR80hX03vdDD4AirsIADfn+cTKIodOIPBj8dbePKn2jM71zAq7Sl
         +o+qJXCWF0Xk4oZC2zz4rlG8Br00GPDhCyiB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487570; x=1747092370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zVmpUDMv6y3spgzXUu3CUK2QokdsSW+CehJ9PCLrAzE=;
        b=uRPJl1QZdYsfEllVylt5H0D3moRTb7BcBkF4G1tUY+UnbPlvPxH9MfJT4hF+IkYKEA
         VCttm99uDFXUQv90BeUzBYsf+xCT3HEUB0+DT5ZaqwqTZJQn+2iNPInYwvCv8o8VhAOr
         VqV7ehihNg6CL8innNkP3MbgbjOlz+ATw1uSKYalm7t7w23eODair9vgKZohRq7EIeLw
         rPGMb+Hk6S8eNrBrm7lerjBnuE9oaHXGzII81OCdX+U4YyzEVkQL6vL5NtaBS+mRlOtJ
         iDC67GLobtaS784B/o/MdZLtwBQcU7Drx3F+zMRryPtipQGSiH3HvIszP52v/LqAr82Q
         94AA==
X-Gm-Message-State: AOJu0YxQoERMIO+YiUZ6r9K3LIsiyOAJnrA0zn9hx2f71dnHUgVQFmJq
	N7I+XnWBpCpJDn/yGQ9c2nJuVhTl2e/+o+aIMlRQwhhQlKQ9IHx/6BreLrtYfDctyPYrf7PrP+S
	q
X-Gm-Gg: ASbGncudxHESFsq8DuBMaTbuNMnGXTytkQya7IrSyoVnmU8cEq4F2mX8qMdXrFsToy/
	uu1w1wHNj7iwnk6hYDc7sS5DnpBXCdozNHaccWKWN5qHba8dq7p9nF5thJMyEgEhxM/aCqEKScq
	QaBTph6VQd50Cxkkb2AXVgenB9qViIX1/8jXe4c2NmSA5B7ElWNBZteA650PS1weKzBwWwDC6+6
	D2gVLMoOO4O52BINVno7GrSZccV1lg5WnYuZVdBMryRsugsbgsp8DTBt7JczAeJmBncOCDtLPI7
	PdlNclyvz5zfXtW14i9F0D3oQmWMdxPYO1A3JcN7VPPNuOazMtdstQF0X3/Sfmiz0TXlTs5K/XD
	s1IAcOgCvr+pBry4ze7+mjpZw2+QedzjUFl9P48cm0mxbfYys
X-Google-Smtp-Source: AGHT+IFKKB6bVF4GBG1pm+WPqGi4wJQERTy4LzqSL0ffcXb+V1bRJHX//L+Lq8q+V1l1YIcOLpj0Sg==
X-Received: by 2002:a05:6000:4006:b0:399:71d4:a2 with SMTP id ffacd0b85a97d-3a0ac0d91ccmr567410f8f.14.1746487569679;
        Mon, 05 May 2025 16:26:09 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa00b6621c32eca023c1.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b662:1c32:eca0:23c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7b09sm11557066f8f.48.2025.05.05.16.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:26:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-gnome][PATCH] cogl-1.0: fix incompatible-pointer-types build error
Date: Tue,  6 May 2025 01:25:57 +0200
Message-Id: <20250505232557.2768595-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 23:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117334

From: Yoann Congal <yoann.congal@smile.fr>

Use an intermediary (void *) cast to workaround the
incompatible-pointer-types error.

This corrects these 4 errors:
|../../cogl-1.22.8/cogl-path/cogl-path.c: In function '_cogl_path_build_fill_attribute_buffer':
|../../cogl-1.22.8/cogl-path/cogl-path.c:1361:20: error: passing argument 3 of 'gluTessCallback' from incompatible pointer type [-Wincompatible-pointer-types]
| 1361 |                    _cogl_path_tesselator_begin);
|      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|      |                    |
|      |                    void (*)(GLenum,  CoglPathTesselator *) {aka void (*)(unsigned int,  struct _CoglPathTesselator *)}
|In file included from ../../cogl-1.22.8/cogl-path/cogl-path.c:49:
|../../cogl-1.22.8/cogl-path/tesselator/tesselator.h:57:70: note: expected 'void (*)(void)' but argument is of type 'void (*)(GLenum,  CoglPathTesselator *)' {aka 'void (*)(unsigned int,  struct _CoglPathTesselator *)'}
|   57 | void gluTessCallback (GLUtesselator* tess, GLenum which, _GLUfuncptr CallBackFunc);
|      |                                                          ~~~~~~~~~~~~^~~~~~~~~~~~
|../../cogl-1.22.8/cogl-path/cogl-path.c:1094:1: note: '_cogl_path_tesselator_begin' declared here
| 1094 | _cogl_path_tesselator_begin (GLenum type,
|      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|../../cogl-1.22.8/cogl-path/cogl-path.c:1363:20: error: passing argument 3 of 'gluTessCallback' from incompatible pointer type [-Wincompatible-pointer-types]
| 1363 |                    _cogl_path_tesselator_vertex);
|      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|      |                    |
|      |                    void (*)(void *, CoglPathTesselator *) {aka void (*)(void *, struct _CoglPathTesselator *)}
|../../cogl-1.22.8/cogl-path/tesselator/tesselator.h:57:70: note: expected 'void (*)(void)' but argument is of type 'void (*)(void *, CoglPathTesselator *)' {aka 'void (*)(void *, struct _CoglPathTesselator *)'}
|   57 | void gluTessCallback (GLUtesselator* tess, GLenum which, _GLUfuncptr CallBackFunc);
|      |                                                          ~~~~~~~~~~~~^~~~~~~~~~~~
|../../cogl-1.22.8/cogl-path/cogl-path.c:1164:1: note: '_cogl_path_tesselator_vertex' declared here
| 1164 | _cogl_path_tesselator_vertex (void *vertex_data,
|      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|../../cogl-1.22.8/cogl-path/cogl-path.c:1365:20: error: passing argument 3 of 'gluTessCallback' from incompatible pointer type [-Wincompatible-pointer-types]
| 1365 |                    _cogl_path_tesselator_end);
|      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
|      |                    |
|      |                    void (*)(CoglPathTesselator *) {aka void (*)(struct _CoglPathTesselator *)}
|../../cogl-1.22.8/cogl-path/tesselator/tesselator.h:57:70: note: expected 'void (*)(void)' but argument is of type 'void (*)(CoglPathTesselator *)' {aka 'void (*)(struct _CoglPathTesselator *)'}
|   57 | void gluTessCallback (GLUtesselator* tess, GLenum which, _GLUfuncptr CallBackFunc);
|      |                                                          ~~~~~~~~~~~~^~~~~~~~~~~~
|../../cogl-1.22.8/cogl-path/cogl-path.c:1223:1: note: '_cogl_path_tesselator_end' declared here
| 1223 | _cogl_path_tesselator_end (CoglPathTesselator *tess)
|      | ^~~~~~~~~~~~~~~~~~~~~~~~~
|../../cogl-1.22.8/cogl-path/cogl-path.c:1367:20: error: passing argument 3 of 'gluTessCallback' from incompatible pointer type [-Wincompatible-pointer-types]
| 1367 |                    _cogl_path_tesselator_combine);
|      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|      |                    |
|      |                    void (*)(double *, void **, float *, void **, CoglPathTesselator *) {aka void (*)(double *, void **, float *, void **, struct _CoglPathTesselator *)}
|../../cogl-1.22.8/cogl-path/tesselator/tesselator.h:57:70: note: expected 'void (*)(void)' but argument is of type 'void (*)(double *, void **, float *, void **, CoglPathTesselator *)' {aka 'void (*)(double *, void **, float *, void **, struct _CoglPathTesselator *)'}
|   57 | void gluTessCallback (GLUtesselator* tess, GLenum which, _GLUfuncptr CallBackFunc);
|      |                                                          ~~~~~~~~~~~~^~~~~~~~~~~~
|../../cogl-1.22.8/cogl-path/cogl-path.c:1229:1: note: '_cogl_path_tesselator_combine' declared here
| 1229 | _cogl_path_tesselator_combine (double coords[3],
|      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|make[3]: *** [Makefile:905: libcogl_path_la-cogl-path.lo] Error 1

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...plicit-cast-to-avoid-an-incompatible.patch | 94 +++++++++++++++++++
 .../recipes-graphics/cogl/cogl-1.0_1.22.8.bb  |  5 +-
 2 files changed, 98 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-graphics/cogl/cogl-1.0/0001-cogl-path-add-explicit-cast-to-avoid-an-incompatible.patch

diff --git a/meta-gnome/recipes-graphics/cogl/cogl-1.0/0001-cogl-path-add-explicit-cast-to-avoid-an-incompatible.patch b/meta-gnome/recipes-graphics/cogl/cogl-1.0/0001-cogl-path-add-explicit-cast-to-avoid-an-incompatible.patch
new file mode 100644
index 0000000000..a9f2d654d1
--- /dev/null
+++ b/meta-gnome/recipes-graphics/cogl/cogl-1.0/0001-cogl-path-add-explicit-cast-to-avoid-an-incompatible.patch
@@ -0,0 +1,94 @@
+From 69690b0fdff43cdf6ab1718cd86396de3b27081f Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Tue, 6 May 2025 00:00:38 +0200
+Subject: [PATCH] cogl-path: add explicit cast to avoid an
+ incompatible-pointer-types error
+
+Callbacks declarations are not compatible with gluTessCallback(...,
+_GLUfuncptr CallBackFunc) under gcc15. Use an intermediary (void *) cast
+to workaround the incompatible-pointer-types error.
+
+This is safe to do because inside gluTessCallback(), function pointers
+are cast back to their proper prototypes.
+
+This corrects these 4 errors:
+|../../cogl-1.22.8/cogl-path/cogl-path.c: In function '_cogl_path_build_fill_attribute_buffer':
+|../../cogl-1.22.8/cogl-path/cogl-path.c:1361:20: error: passing argument 3 of 'gluTessCallback' from incompatible pointer type [-Wincompatible-pointer-types]
+| 1361 |                    _cogl_path_tesselator_begin);
+|      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
+|      |                    |
+|      |                    void (*)(GLenum,  CoglPathTesselator *) {aka void (*)(unsigned int,  struct _CoglPathTesselator *)}
+|In file included from ../../cogl-1.22.8/cogl-path/cogl-path.c:49:
+|../../cogl-1.22.8/cogl-path/tesselator/tesselator.h:57:70: note: expected 'void (*)(void)' but argument is of type 'void (*)(GLenum,  CoglPathTesselator *)' {aka 'void (*)(unsigned int,  struct _CoglPathTesselator *)'}
+|   57 | void gluTessCallback (GLUtesselator* tess, GLenum which, _GLUfuncptr CallBackFunc);
+|      |                                                          ~~~~~~~~~~~~^~~~~~~~~~~~
+|../../cogl-1.22.8/cogl-path/cogl-path.c:1094:1: note: '_cogl_path_tesselator_begin' declared here
+| 1094 | _cogl_path_tesselator_begin (GLenum type,
+|      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
+|../../cogl-1.22.8/cogl-path/cogl-path.c:1363:20: error: passing argument 3 of 'gluTessCallback' from incompatible pointer type [-Wincompatible-pointer-types]
+| 1363 |                    _cogl_path_tesselator_vertex);
+|      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
+|      |                    |
+|      |                    void (*)(void *, CoglPathTesselator *) {aka void (*)(void *, struct _CoglPathTesselator *)}
+|../../cogl-1.22.8/cogl-path/tesselator/tesselator.h:57:70: note: expected 'void (*)(void)' but argument is of type 'void (*)(void *, CoglPathTesselator *)' {aka 'void (*)(void *, struct _CoglPathTesselator *)'}
+|   57 | void gluTessCallback (GLUtesselator* tess, GLenum which, _GLUfuncptr CallBackFunc);
+|      |                                                          ~~~~~~~~~~~~^~~~~~~~~~~~
+|../../cogl-1.22.8/cogl-path/cogl-path.c:1164:1: note: '_cogl_path_tesselator_vertex' declared here
+| 1164 | _cogl_path_tesselator_vertex (void *vertex_data,
+|      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
+|../../cogl-1.22.8/cogl-path/cogl-path.c:1365:20: error: passing argument 3 of 'gluTessCallback' from incompatible pointer type [-Wincompatible-pointer-types]
+| 1365 |                    _cogl_path_tesselator_end);
+|      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
+|      |                    |
+|      |                    void (*)(CoglPathTesselator *) {aka void (*)(struct _CoglPathTesselator *)}
+|../../cogl-1.22.8/cogl-path/tesselator/tesselator.h:57:70: note: expected 'void (*)(void)' but argument is of type 'void (*)(CoglPathTesselator *)' {aka 'void (*)(struct _CoglPathTesselator *)'}
+|   57 | void gluTessCallback (GLUtesselator* tess, GLenum which, _GLUfuncptr CallBackFunc);
+|      |                                                          ~~~~~~~~~~~~^~~~~~~~~~~~
+|../../cogl-1.22.8/cogl-path/cogl-path.c:1223:1: note: '_cogl_path_tesselator_end' declared here
+| 1223 | _cogl_path_tesselator_end (CoglPathTesselator *tess)
+|      | ^~~~~~~~~~~~~~~~~~~~~~~~~
+|../../cogl-1.22.8/cogl-path/cogl-path.c:1367:20: error: passing argument 3 of 'gluTessCallback' from incompatible pointer type [-Wincompatible-pointer-types]
+| 1367 |                    _cogl_path_tesselator_combine);
+|      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+|      |                    |
+|      |                    void (*)(double *, void **, float *, void **, CoglPathTesselator *) {aka void (*)(double *, void **, float *, void **, struct _CoglPathTesselator *)}
+|../../cogl-1.22.8/cogl-path/tesselator/tesselator.h:57:70: note: expected 'void (*)(void)' but argument is of type 'void (*)(double *, void **, float *, void **, CoglPathTesselator *)' {aka 'void (*)(double *, void **, float *, void **, struct _CoglPathTesselator *)'}
+|   57 | void gluTessCallback (GLUtesselator* tess, GLenum which, _GLUfuncptr CallBackFunc);
+|      |                                                          ~~~~~~~~~~~~^~~~~~~~~~~~
+|../../cogl-1.22.8/cogl-path/cogl-path.c:1229:1: note: '_cogl_path_tesselator_combine' declared here
+| 1229 | _cogl_path_tesselator_combine (double coords[3],
+|      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+|make[3]: *** [Makefile:905: libcogl_path_la-cogl-path.lo] Error 1
+
+Upstream-Status: Inactive-Upstream [lastcommit: 2021-05-02]
+Gitlab instance is redirected to https://gitlab.gnome.org/Archive/cogl
+with a notice: "This is an archived project. Repository and other
+project resources are read-only."
+
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ cogl-path/cogl-path.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/cogl-path/cogl-path.c b/cogl-path/cogl-path.c
+index 2b4b3c6..f87ea4a 100644
+--- a/cogl-path/cogl-path.c
++++ b/cogl-path/cogl-path.c
+@@ -1358,13 +1358,13 @@ _cogl_path_build_fill_attribute_buffer (CoglPath *path)
+   gluTessNormal (tess.glu_tess, 0.0, 0.0, 1.0);
+ 
+   gluTessCallback (tess.glu_tess, GLU_TESS_BEGIN_DATA,
+-                   _cogl_path_tesselator_begin);
++                   (void *) _cogl_path_tesselator_begin);
+   gluTessCallback (tess.glu_tess, GLU_TESS_VERTEX_DATA,
+-                   _cogl_path_tesselator_vertex);
++                   (void *) _cogl_path_tesselator_vertex);
+   gluTessCallback (tess.glu_tess, GLU_TESS_END_DATA,
+-                   _cogl_path_tesselator_end);
++                   (void *) _cogl_path_tesselator_end);
+   gluTessCallback (tess.glu_tess, GLU_TESS_COMBINE_DATA,
+-                   _cogl_path_tesselator_combine);
++                   (void *) _cogl_path_tesselator_combine);
+ 
+   gluTessBeginPolygon (tess.glu_tess, &tess);
+ 
diff --git a/meta-gnome/recipes-graphics/cogl/cogl-1.0_1.22.8.bb b/meta-gnome/recipes-graphics/cogl/cogl-1.0_1.22.8.bb
index b9446fab38..8e9a74d20d 100644
--- a/meta-gnome/recipes-graphics/cogl/cogl-1.0_1.22.8.bb
+++ b/meta-gnome/recipes-graphics/cogl/cogl-1.0_1.22.8.bb
@@ -1,6 +1,9 @@
 require cogl-1.0.inc
 
-SRC_URI += "file://0001-configure.ac-don-t-require-eglmesaext.h.patch"
+SRC_URI += " \
+	file://0001-configure.ac-don-t-require-eglmesaext.h.patch \
+	file://0001-cogl-path-add-explicit-cast-to-avoid-an-incompatible.patch \
+"
 SRC_URI[archive.sha256sum] = "a805b2b019184710ff53d0496f9f0ce6dcca420c141a0f4f6fcc02131581d759"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"

