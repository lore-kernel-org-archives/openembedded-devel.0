Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D70AC3ABBE
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 06:33:51 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.9331.1746686020000229051
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 May 2025 23:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=PA++jPkE;
 spf=pass (domain: konsulko.com, ip: 209.85.218.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac339f53df9so103054966b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 May 2025 23:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1746686018; x=1747290818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HqAN8V1N6O3kTxij7OSpUf4JanUZikgcG1ZRNy1Sf6E=;
        b=PA++jPkEpFZkUZZA3+3X35L68QYzsbAUnqKQ9wQBA6EZ3bwJgySJGRyeRgqnVXemLD
         I5OECSkGBn1WYxHJD1wFui1x6VgU669iymJveDypfcS+D3HDGLRiOLuT1fOzzU3bdZlr
         xULApqgPPJZQWFlaSuNLx6sMkgjsqMrTi3z2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746686018; x=1747290818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HqAN8V1N6O3kTxij7OSpUf4JanUZikgcG1ZRNy1Sf6E=;
        b=vDcVl6xxEXuqbIsbmcheoqlYeddaftAqkgAzBdjXqdGHoMKNYyei6B7H736p7UEh7O
         ko2lWt3nM/cw7sxj6KAtfUd0uhwNjijxYLksPx3k5K+7oU36qKAjrxgy/pjHAUj9e6W/
         Wo3U4IefcIdNAzYHAMDrS8izGAkIU9qz5j4pTBjC+DaqAhzzegD/Zo2MrKbhmo6r4zgq
         d5yD/N5924aSpRItRbyBIXhvotJw+nOAkMglSL33nEF6tk4286hpRbuwPnQMdudDrQEm
         nn8SkpmrMyptedeXqllqCOM7KWK1+nxrZSrW696061yyR4EWGySXwaLS84kNz6BYgILW
         Ds3w==
X-Gm-Message-State: AOJu0YwQN45tjsuHYJR8lTOFE/WoYmyAtRKbNF/eWng0uGhsnMo6Nxsh
	76aW/Rak6BC9uIHEW9FqojE1X04LVPeLn9s03dlV2YOx49kM/8reoGMy9LFITbXdQ26xYmohAWd
	A
X-Gm-Gg: ASbGncsOMbeWh+HIiVOFxQZl9XRqMINo8+ZqTiUf9i38UVlurOqQ98/p5X6x7lLVPEU
	lUPl2LpXQZSfTxEv/vGzUw6BP5kaIyi5yIwfhE5evCQTRBscugv2impzU9SUOJyLfUPJ8WPSsjX
	G+MBt4uxnYZzMqY7C+GFtmiTZUTaVMsuKD0KZDpNhRjgN3ALgooFzz9s+Kq824ZP+U98P0kuWaZ
	Zr5BeOvH82Z1nES2Efn6mSLVdt3TP0TWN9Va3ur5H7pjfQRVvzFlVW9ojlCU0Rxfbqd98eGnap2
	J0wdwRX+0SLn3NH4ctntP8qtUxl9mq3rrJepNZN1wQNy5eDF+5dM0QA=
X-Google-Smtp-Source: AGHT+IHHyBPh17LkTihZwDtPH53l2xnT9ixDmee9ij0U7w1UoUE0NyZjZcEuB6ci3KhV2dstIAHeVg==
X-Received: by 2002:a17:906:6a1a:b0:ace:d7af:15e1 with SMTP id a640c23a62f3a-ad1e8bf11d7mr580013866b.28.1746686017851;
        Wed, 07 May 2025 23:33:37 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1895087d1sm1030045066b.128.2025.05.07.23.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 23:33:37 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2] python3-pillow-heif: Add recipe
Date: Thu,  8 May 2025 09:33:35 +0300
Message-Id: <20250508063335.1498917-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 May 2025 06:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117361

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
 .../python/python3-pillow-heif_0.22.0.bb      | 20 +++++++
 2 files changed, 76 insertions(+)
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
index 0000000000..7f5dfac702
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow-heif_0.22.0.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Python interface for libheif library"
+HOMEPAGE = "https://github.com/bigcat88/pillow_heif"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b6c07a92aed67c33bc346748d7c7e991"
+
+# While this item does not require it, it depends on libheif which does
+LICENSE_FLAGS = "commercial"
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


