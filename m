Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8263C3ABBF
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 11:50:22 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.7001.1746618612702359691
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 May 2025 04:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HIsAt+wF;
 spf=pass (domain: konsulko.com, ip: 209.85.208.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so2513857a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 May 2025 04:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1746618611; x=1747223411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mG3jx0EmHNis7HSA9p88ElycNxGPKcdsPlPBw+u4Dpw=;
        b=HIsAt+wFnYFUoJ97ii4tTict+QPqetAZjt+IedoOUVZz3JbWTsSV1ocnZkt/+qVsi2
         wtl0ye0U0sa2h5pVxynBqIbxCe570bPVw/kkVZPXt+GG4BL4vcJAXRLDsYnRceuiBWtv
         KylfijW67Ag1HnAGyQnVVhCvkQY0g+8vVOf8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746618611; x=1747223411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mG3jx0EmHNis7HSA9p88ElycNxGPKcdsPlPBw+u4Dpw=;
        b=YCFx42td07/C9u3DLjwPX3mkyswO+PuEuPw8tq2AOYJKKWAlvbhgRbulwh+EyZpWGg
         kcPmiurPzYSjUKhjsIaez9TWk7PvRJvDmYMvzn+ADAfuUyiJKiFOYklLr0IEuQdnBeFt
         560iUua2ucAZ3QFRazl3iDby6Z9xcJRHd4RgypuRBkhKSkFmTf6hHJvmsf0jMp3w1vfo
         IVg+wHpN2iM/tygmSf+1paZvt8esKs9nAXkQnDlE0QBADIZpQFx9TlJedmUnwpBP1080
         mOL+ccxZFTV9d65JlO6eVX64YrYlsKnwCvJ3u49Yg2n9fRzEDNgV4+ZbKBr8jAIR51Ju
         S6dQ==
X-Gm-Message-State: AOJu0YzROQjuJNXxISIw87/yhbBh/boVB4YotGvfzPW5goaUXRyGN4tR
	zM2ncMuqgZQkXmDsOElLsa+OdC393jYgauF4lR27d4ckNQn5A1IYYt2FVgxh4B42w3u/nCVzuXS
	s
X-Gm-Gg: ASbGncvgp2M/T/RnK6B6EEbfqBy8yUX2FLUsIQHsksgAJdRleCzpuJbcz2W41yLZ4bi
	dbZPosH4zIqNkBBfT4s83tqQDVJLE2BM/tPhx36i8jSmCDBASitksNwketIAgBNCPGw00QNbJbs
	boIyOLvz+DNV0IWiveDvVF/rFooNHbHNNUcRXV2Qn6uwIoySxaLdc4SNelUcJX5DpjUnh+kxqa0
	8GGITYk/Y9QTAfaqarhD4TJTLEvem/xxwVAK8QgORfeAjI4BhlXZAZFWwGEPZZhJERGia+zNMPs
	7+xE5tCM4E2g+2MRJO/dCsDmhzjBykMogSgblQaerGIx9YZ6Sw0Iywg=
X-Google-Smtp-Source: AGHT+IEIhSmeXVC44JTVzBCzW+Ot3k5rwvfDnKSdh0n7aBJH4Xqna6l64xJxx0UQsIjVVSj7oQXnkg==
X-Received: by 2002:a05:6402:2714:b0:5f1:e466:660 with SMTP id 4fb4d7f45d1cf-5fbe9d77ddfmr2509894a12.5.1746618610583;
        Wed, 07 May 2025 04:50:10 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fbf7562c80sm633416a12.16.2025.05.07.04.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 04:50:10 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-pillow-heif: Add recipe
Date: Wed,  7 May 2025 14:50:01 +0300
Message-Id: <20250507115001.3365087-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 May 2025 11:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117358

Add recipe for release 0.22.0:

- Boolean pillow_heif.options.DISABLE_SECURITY_LIMITS to bypass
  security limit of libheif for the image size.
- libx265 library was updated to the latest 4.1 version.
- libheif was updated from the 1.19.5 to 1.19.7 version.
- AVIF format marked as deprecated and pending for the removal.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...001-setup.py-support-cross-compiling.patch | 56 +++++++++++++++++++
 .../python/python3-pillow-heif_0.22.0.bb      | 17 ++++++
 2 files changed, 73 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow-heif/0001-setup.py-support-cross-compiling.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow-heif_0.22.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pillow-heif/0001-setup.py-support-cross-compiling.patch b/meta-python/recipes-devtools/python/python3-pillow-heif/0001-setup.py-support-cross-compiling.patch
new file mode 100644
index 0000000000..66cf7a9244
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow-heif/0001-setup.py-support-cross-compiling.patch
@@ -0,0 +1,56 @@
+From 98e6831754712221ce030ce8b27e100a3926c543 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Mon, 5 May 2025 16:08:37 +0000
+Subject: [PATCH] setup.py: support cross compiling
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ setup.py | 19 +++++++++++--------
+ 1 file changed, 11 insertions(+), 8 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 68945e4..67566e8 100644
+--- a/setup.py
++++ b/setup.py
+@@ -125,12 +125,12 @@ class PillowHeifBuildExt(build_ext):
+                     self._add_directory(library_dirs, match.group(1))
+ 
+         # include, rpath, if set as environment variables
+-        for k in ("C_INCLUDE_PATH", "CPATH", "INCLUDE"):
++        for k in ("C_INCLUDE_PATH", "CPATH", "INCLUDE", "STAGING_INCDIR"):
+             if k in os.environ:
+                 for d in os.environ[k].split(os.path.pathsep):
+                     self._add_directory(include_dirs, d)
+ 
+-        for k in ("LD_RUN_PATH", "LIBRARY_PATH", "LIB"):
++        for k in ("LD_RUN_PATH", "LIBRARY_PATH", "LIB", "STAGING_LIBDIR"):
+             if k in os.environ:
+                 for d in os.environ[k].split(os.path.pathsep):
+                     self._add_directory(library_dirs, d)
+@@ -199,12 +199,15 @@ class PillowHeifBuildExt(build_ext):
+             self._update_extension("_pillow_heif", ["heif"], extra_compile_args=["-O3", "-Werror"])
+         else:  # let's assume it's some kind of linux
+             # this old code waiting for refactoring, when time comes.
+-            self._add_directory(include_dirs, "/usr/local/include")
+-            self._add_directory(include_dirs, "/usr/include")
+-            self._add_directory(library_dirs, "/usr/local/lib")
+-            self._add_directory(library_dirs, "/usr/lib64")
+-            self._add_directory(library_dirs, "/usr/lib")
+-            self._add_directory(library_dirs, "/lib")
++            include_os_path = os.environ.get("STAGING_INCDIR")
++            if include_os_path:
++                for path in include_os_path.split(os.pathsep):
++                    self._add_directory(include_dirs, path)
++
++            lib_os_path = os.environ.get("STAGING_LIBDIR")
++            if lib_os_path:
++                for path in lib_os_path.split(os.pathsep):
++                    self._add_directory(library_dirs, path)
+ 
+             self._update_extension("_pillow_heif", ["heif"], extra_compile_args=["-O3", "-Werror"])
+ 
+-- 
+2.39.5
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow-heif_0.22.0.bb b/meta-python/recipes-devtools/python/python3-pillow-heif_0.22.0.bb
new file mode 100644
index 0000000000..34eaab92b9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow-heif_0.22.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Python interface for libheif library"
+HOMEPAGE = "https://github.com/bigcat88/pillow_heif"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b6c07a92aed67c33bc346748d7c7e991"
+
+PYPI_PACKAGE = "pillow_heif"
+
+inherit pypi python_setuptools_build_meta
+
+SRC_URI += "file://0001-setup.py-support-cross-compiling.patch"
+SRC_URI[sha256sum] = "61d473929340d3073722f6316b7fbbdb11132faa6bac0242328e8436cc55b39a"
+
+DEPENDS += "libheif"
+
+RDEPENDS:${PN} += "python3-pillow"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


