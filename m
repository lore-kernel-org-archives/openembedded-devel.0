Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F9CC77B7C
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 07:53:13 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.3698.1684914784009855663
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 00:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=UeTUmxRj;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-51403554f1dso1182288a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 00:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684914782; x=1687506782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0FHyPZMFOMhP4PpCtIo6rS9IE6G8yVFkGWRWd64Yww=;
        b=UeTUmxRjPnTCk6W/B5N6YmHjcxfnX8ncso7pwwPhV+qyygTgpp/VAJejLYQF8A5cI/
         lgXDYbkEdtpkGZ32RYXuOPSETTB2tQNh/cHNvGQbDxncADqoK5fK/NO4LJ60lgwwESlG
         849k71O01/yXpSnLml6rIvnt5IH9obgLagsL9uez1ShowVKdgFi6JWFLylfgqfj4PIp4
         hZVh9ycNYyV5qXGxiyT39omRqhzfc48cWZlfi65IWQXwH19qiN6ti92Zs2hLH1LxKYu2
         ByvknhvzpQ+ENsJYTcSwJNPFbeFS3IzXAQcmyoI57PQY9TpKVfta2VZmNstTew7AaY60
         afvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684914782; x=1687506782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0FHyPZMFOMhP4PpCtIo6rS9IE6G8yVFkGWRWd64Yww=;
        b=C6gGgf/a0mEWZB7Nin2F/VmE4rLPyFCkCp7VAd+aM1V7qEeVbSk0HdwECksQGgPuzR
         2x+n8L5dqb2LJp8acYCtI8IaVtnFWzkjB1mGOd1J9saNGTRFzf0ZXjddrWAlvPQ1uRhJ
         TaWqYlNQlF/l3sPX4lzgbVRUralLXKntUZqwzUByAhoD3znsbiEye1rwlawJzcBU27Ew
         740N0a2RgoxOS/XA4Gkn0S3eZRxDMFgo11xwUi061U0V8qC71cqELnyC0ujAQn8e0TBk
         MSFHkL++JzIdzFLYcmT7WTclLKUu76sg/iUliDKEcfuFUQ/WeZdUWOwF2WHRzSrJQ0Zq
         Un8w==
X-Gm-Message-State: AC+VfDzHsfqER6porhFUvTrx3B2NxF9uxccJG0y3pgZirrNexBJoX2fw
	aBqSrayTR4Pyj8U+1hddH3uHaST5Gp8=
X-Google-Smtp-Source: ACHHUZ7+h5em+/q6wycuF9JZz63fAK5EntnDcQCAqqPy9dX0XYHz43i8LtIx1v1v58x1VtrjhyfYeg==
X-Received: by 2002:a17:907:ea9:b0:96a:4bca:8408 with SMTP id ho41-20020a1709070ea900b0096a4bca8408mr17589180ejc.60.1684914782156;
        Wed, 24 May 2023 00:53:02 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id my19-20020a1709065a5300b0094f3d700868sm5331650ejc.80.2023.05.24.00.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:53:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 02/20] meta-python: remove unused patches from python2 recipes
Date: Wed, 24 May 2023 09:52:35 +0200
Message-Id: <20230524075253.1033593-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
References: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 07:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102756

* python2 recipes were removed in:
  https://git.openembedded.org/meta-openembedded/commit/?id=05d0c5eee319055816bbea8b9dd972f723f68019
  but some of the unused patch files were left behind

* meta-python/recipes-devtools/python/python-pyrex/pyrex-fix-optimized-mode.patch:
  https://git.openembedded.org/meta-openembedded/diff/meta-python/recipes-devtools/python/python-pyrex_0.9.9.bb?id=05d0c5eee319055816bbea8b9dd972f723f68019

* meta-python/recipes-devtools/python/python-imaging/0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch
  meta-python/recipes-devtools/python/python-imaging/allow.to.disable.some.features.patch
  meta-python/recipes-devtools/python/python-imaging/fix-freetype-includes.patch
  meta-python/recipes-devtools/python/python-imaging/python-imaging-CVE-2016-2533.patch
  meta-python/recipes-devtools/python/python-imaging/remove-host-libdir.patch
  https://git.openembedded.org/meta-openembedded/diff/meta-python/recipes-devtools/python/python-imaging_1.1.7.bb?id=05d0c5eee319055816bbea8b9dd972f723f68019

* meta-python/recipes-devtools/python/python-mccabe/0001-python-mccabe-remove-unnecessary-setup_requires-pyte.patch
  https://git.openembedded.org/meta-openembedded/tree/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb?id=698c36f58434009844b90d7bda1ab38b5af3d62a

* meta-python/recipes-devtools/python/python-pygpgme/0001-reflect-2.1-reporting-for-key-imports.patch
  meta-python/recipes-devtools/python/python-pygpgme/0002-passphrase_cb-is-deprecated.patch
  meta-python/recipes-devtools/python/python-pygpgme/0003-handle-generic-error-when-no-passphrase-callback-pre.patch
  https://git.openembedded.org/meta-openembedded/tree/meta-python/recipes-devtools/python/python-pygpgme_0.3.bb?id=698c36f58434009844b90d7bda1ab38b5af3d62a

* meta-python/recipes-devtools/python/python-daemon/0001-Workaround-for-issue-2-1.patch
  https://git.openembedded.org/meta-openembedded/diff/meta-python/recipes-devtools/python/python-daemon_2.1.2.bb?id=05d0c5eee319055816bbea8b9dd972f723f68019

* meta-python/recipes-devtools/python/python-numeric/0001-it-tries-to-define-this-function-differently-than-it.patch
  https://git.openembedded.org/meta-openembedded/diff/meta-python/recipes-devtools/python/python-numeric_24.2.bb?id=05d0c5eee319055816bbea8b9dd972f723f68019

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-Workaround-for-issue-2-1.patch       | 31 -------
 ...etup.py-force-paths-for-zlib-freetyp.patch | 55 ------------
 .../allow.to.disable.some.features.patch      | 65 --------------
 .../fix-freetype-includes.patch               | 30 -------
 .../python-imaging-CVE-2016-2533.patch        | 38 --------
 .../python-imaging/remove-host-libdir.patch   | 25 ------
 ...move-unnecessary-setup_requires-pyte.patch | 33 -------
 ...ne-this-function-differently-than-it.patch | 30 -------
 ...eflect-2.1-reporting-for-key-imports.patch | 90 -------------------
 .../0002-passphrase_cb-is-deprecated.patch    | 52 -----------
 ...rror-when-no-passphrase-callback-pre.patch | 30 -------
 .../python/python-pygpgme/run-ptest           |  3 -
 .../pyrex-fix-optimized-mode.patch            | 15 ----
 13 files changed, 497 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-daemon/0001-Workaround-for-issue-2-1.patch
 delete mode 100644 meta-python/recipes-devtools/python/python-imaging/0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch
 delete mode 100644 meta-python/recipes-devtools/python/python-imaging/allow.to.disable.some.features.patch
 delete mode 100644 meta-python/recipes-devtools/python/python-imaging/fix-freetype-includes.patch
 delete mode 100644 meta-python/recipes-devtools/python/python-imaging/python-imaging-CVE-2016-2533.patch
 delete mode 100644 meta-python/recipes-devtools/python/python-imaging/remove-host-libdir.patch
 delete mode 100644 meta-python/recipes-devtools/python/python-mccabe/0001-python-mccabe-remove-unnecessary-setup_requires-pyte.patch
 delete mode 100644 meta-python/recipes-devtools/python/python-numeric/0001-it-tries-to-define-this-function-differently-than-it.patch
 delete mode 100644 meta-python/recipes-devtools/python/python-pygpgme/0001-reflect-2.1-reporting-for-key-imports.patch
 delete mode 100644 meta-python/recipes-devtools/python/python-pygpgme/0002-passphrase_cb-is-deprecated.patch
 delete mode 100644 meta-python/recipes-devtools/python/python-pygpgme/0003-handle-generic-error-when-no-passphrase-callback-pre.patch
 delete mode 100644 meta-python/recipes-devtools/python/python-pygpgme/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python-pyrex/pyrex-fix-optimized-mode.patch

diff --git a/meta-python/recipes-devtools/python/python-daemon/0001-Workaround-for-issue-2-1.patch b/meta-python/recipes-devtools/python/python-daemon/0001-Workaround-for-issue-2-1.patch
deleted file mode 100644
index dbb8407186..0000000000
--- a/meta-python/recipes-devtools/python/python-daemon/0001-Workaround-for-issue-2-1.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 0981eee9f0198c2045dc0eaa78a005d06fc7bfe4 Mon Sep 17 00:00:00 2001
-From: Carlos Eduardo Moreira dos Santos <cems@cemshost.com.br>
-Date: Tue, 28 Mar 2017 18:23:44 -0300
-Subject: [PATCH] Workaround for issue 2 [1]
-
-[1] https://pagure.io/python-daemon/issue/2
----
- version.py | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/version.py b/version.py
-index d58422a377ee..293e2d64c2b7 100644
---- a/version.py
-+++ b/version.py
-@@ -648,9 +648,10 @@ class ChangelogAwareDistribution(distutils.dist.Distribution, object):
- 
-     @lru_cache(maxsize=128)
-     def get_version_info(self):
--        changelog_path = get_changelog_path(self)
--        version_info = generate_version_info_from_changelog(changelog_path)
--        return version_info
-+        return {
-+            'version': '2.1.2',
-+            'maintainer': 'Ben Finney'
-+        }
- 
-     def get_version(self):
-         version_info = self.get_version_info()
--- 
-2.7.4
-
diff --git a/meta-python/recipes-devtools/python/python-imaging/0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch b/meta-python/recipes-devtools/python/python-imaging/0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch
deleted file mode 100644
index 2575306bec..0000000000
--- a/meta-python/recipes-devtools/python/python-imaging/0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 07d4f095a9e22ae676a8d68073101131e65012dc Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Tue, 15 Nov 2011 13:16:54 +0100
-Subject: [PATCH] python imaging setup.py: force paths for zlib, freetype and jpeg and don't add host paths
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-
-Upstream-Status: Inappropriate [embedded specific]
----
- setup.py |   14 +++-----------
- 1 files changed, 3 insertions(+), 11 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 5d4d53a..b1a22ec 100644
---- a/setup.py
-+++ b/setup.py
-@@ -34,10 +34,10 @@ def libinclude(root):
- # TIFF_ROOT = libinclude("/opt/tiff")
- 
- TCL_ROOT = None
--JPEG_ROOT = None
--ZLIB_ROOT = None
-+JPEG_ROOT = os.environ['STAGING_LIBDIR']
-+ZLIB_ROOT = os.environ['STAGING_LIBDIR']
- TIFF_ROOT = None
--FREETYPE_ROOT = None
-+FREETYPE_ROOT =  os.environ['STAGING_LIBDIR'], os.environ['STAGING_INCDIR']
- LCMS_ROOT = None
- 
- # FIXME: add mechanism to explicitly *disable* the use of a library
-@@ -147,7 +147,6 @@ class pil_build_ext(build_ext):
-             add_directory(library_dirs, "/opt/local/lib")
-             add_directory(include_dirs, "/opt/local/include")
- 
--        add_directory(library_dirs, "/usr/local/lib")
-         # FIXME: check /opt/stuff directories here?
- 
-         prefix = sysconfig.get_config_var("prefix")
-@@ -207,13 +206,6 @@ class pil_build_ext(build_ext):
-             if os.path.isfile(os.path.join(tcl_dir, "tk.h")):
-                 add_directory(include_dirs, tcl_dir)
- 
--        # standard locations
--        add_directory(library_dirs, "/usr/local/lib")
--        add_directory(include_dirs, "/usr/local/include")
--
--        add_directory(library_dirs, "/usr/lib")
--        add_directory(include_dirs, "/usr/include")
--
-         #
-         # insert new dirs *before* default libs, to avoid conflicts
-         # between Python PYD stub libs and real libraries
--- 
-1.7.2.5
-
diff --git a/meta-python/recipes-devtools/python/python-imaging/allow.to.disable.some.features.patch b/meta-python/recipes-devtools/python/python-imaging/allow.to.disable.some.features.patch
deleted file mode 100644
index 4960ed4661..0000000000
--- a/meta-python/recipes-devtools/python/python-imaging/allow.to.disable.some.features.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-At least lcms wasn't deterministicly detected from sysroot.
-
-This will allow to export LCMS_ENABLED=False when lcms isn't in PACKAGECONFIG.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-diff -uNr Imaging-1.1.7.orig/setup.py Imaging-1.1.7/setup.py
---- Imaging-1.1.7.orig/setup.py	2013-07-22 10:17:02.081457075 +0200
-+++ Imaging-1.1.7/setup.py	2013-07-22 13:10:09.029707492 +0200
-@@ -39,6 +39,12 @@
- TIFF_ROOT = None
- FREETYPE_ROOT =  os.environ['STAGING_LIBDIR'], os.environ['STAGING_INCDIR']
- LCMS_ROOT = None
-+TCL_ENABLED = os.getenv('TCL_ENABLED', "True")
-+JPEG_ENABLED = os.getenv('JPEG_ENABLED', "True")
-+ZLIB_ENABLED = os.getenv('ZLIB_ENABLED', "True")
-+TIFF_ENABLED = os.getenv('TIFF_ENABLED', "True")
-+FREETYPE_ENABLED = os.getenv('FREETYPE_ENABLED', "True")
-+LCMS_ENABLED = os.getenv('LCMS_ENABLED', "True")
- 
- # FIXME: add mechanism to explicitly *disable* the use of a library
- 
-@@ -220,22 +226,22 @@
-             zlib = jpeg = tiff = freetype = tcl = tk = lcms = None
-         feature = feature()
- 
--        if find_include_file(self, "zlib.h"):
-+        if ZLIB_ENABLED == 'True' and find_include_file(self, "zlib.h"):
-             if find_library_file(self, "z"):
-                 feature.zlib = "z"
-             elif sys.platform == "win32" and find_library_file(self, "zlib"):
-                 feature.zlib = "zlib" # alternative name
- 
--        if find_include_file(self, "jpeglib.h"):
-+        if JPEG_ENABLED == 'True' and find_include_file(self, "jpeglib.h"):
-             if find_library_file(self, "jpeg"):
-                 feature.jpeg = "jpeg"
-             elif sys.platform == "win32" and find_library_file(self, "libjpeg"):
-                 feature.jpeg = "libjpeg" # alternative name
- 
--        if find_library_file(self, "tiff"):
-+        if TIFF_ENABLED == 'True' and find_library_file(self, "tiff"):
-             feature.tiff = "tiff"
- 
--        if find_library_file(self, "freetype"):
-+        if FREETYPE_ENABLED == 'True' and find_library_file(self, "freetype"):
-             # look for freetype2 include files
-             freetype_version = 0
-             for dir in self.compiler.include_dirs:
-@@ -256,11 +262,11 @@
-                 if dir:
-                     add_directory(self.compiler.include_dirs, dir, 0)
- 
--        if find_include_file(self, "lcms.h"):
-+        if LCMS_ENABLED == 'True' and find_include_file(self, "lcms.h"):
-             if find_library_file(self, "lcms"):
-                 feature.lcms = "lcms"
- 
--        if _tkinter and find_include_file(self, "tk.h"):
-+        if TCL_ENABLED == 'True' and _tkinter and find_include_file(self, "tk.h"):
-             # the library names may vary somewhat (e.g. tcl84 or tcl8.4)
-             version = TCL_VERSION[0] + TCL_VERSION[2]
-             if find_library_file(self, "tcl" + version):
diff --git a/meta-python/recipes-devtools/python/python-imaging/fix-freetype-includes.patch b/meta-python/recipes-devtools/python/python-imaging/fix-freetype-includes.patch
deleted file mode 100644
index 9ecc63a0d6..0000000000
--- a/meta-python/recipes-devtools/python/python-imaging/fix-freetype-includes.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From c6040f618d8f2706a7b46d1cdf37d1a587f9701f Mon Sep 17 00:00:00 2001
-From: Andrew Stromnov <stromnov@gmail.com>
-Date: Thu, 28 Nov 2013 16:58:43 +0400
-Subject: [PATCH] fix compiling with FreeType 2.5.1
-
----
- _imagingft.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/_imagingft.c b/_imagingft.c
-index 47d50bd..f19555b 100644
---- a/_imagingft.c
-+++ b/_imagingft.c
-@@ -59,7 +59,11 @@ struct {
-     const char* message;
- } ft_errors[] =
- 
-+#if defined(USE_FREETYPE_2_1)
-+#include FT_ERRORS_H
-+#else
- #include <freetype/fterrors.h>
-+#endif
- 
- /* -------------------------------------------------------------------- */
- /* font objects */
--- 
-1.8.5.1
diff --git a/meta-python/recipes-devtools/python/python-imaging/python-imaging-CVE-2016-2533.patch b/meta-python/recipes-devtools/python/python-imaging/python-imaging-CVE-2016-2533.patch
deleted file mode 100644
index b01136f9ac..0000000000
--- a/meta-python/recipes-devtools/python/python-imaging/python-imaging-CVE-2016-2533.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-python-imaging: CVE-2016-2533
-
-the patch comes from:
-https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2533
-https://github.com/python-pillow/Pillow/commit/ae453aa18b66af54e7ff716f4ccb33adca60afd4#diff-8ff6909c159597e22288ad818938fd6b
-
-PCD decoder overruns the shuffle buffer, Fixes #568
-
-Signed-off-by: Li Wang <li.wang@windriver.com>
----
- libImaging/PcdDecode.c |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libImaging/PcdDecode.c b/libImaging/PcdDecode.c
-index b6898e3..c02d005 100644
---- a/libImaging/PcdDecode.c
-+++ b/libImaging/PcdDecode.c
-@@ -47,7 +47,7 @@ ImagingPcdDecode(Imaging im, ImagingCodecState state, UINT8* buf, int bytes)
- 	    out[0] = ptr[x];
- 	    out[1] = ptr[(x+4*state->xsize)/2];
- 	    out[2] = ptr[(x+5*state->xsize)/2];
--	    out += 4;
-+	    out += 3;
- 	}
- 
- 	state->shuffle((UINT8*) im->image[state->y],
-@@ -62,7 +62,7 @@ ImagingPcdDecode(Imaging im, ImagingCodecState state, UINT8* buf, int bytes)
- 	    out[0] = ptr[x+state->xsize];
- 	    out[1] = ptr[(x+4*state->xsize)/2];
- 	    out[2] = ptr[(x+5*state->xsize)/2];
--	    out += 4;
-+	    out += 3;
- 	}
- 
- 	state->shuffle((UINT8*) im->image[state->y],
--- 
-1.7.9.5
-
diff --git a/meta-python/recipes-devtools/python/python-imaging/remove-host-libdir.patch b/meta-python/recipes-devtools/python/python-imaging/remove-host-libdir.patch
deleted file mode 100644
index 028a51ad59..0000000000
--- a/meta-python/recipes-devtools/python/python-imaging/remove-host-libdir.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Avoid getting host sysroot paths in the library paths to fix issue like:
-
-| /home/andrei/work/yocto/build-rpi-master/tmp/sysroots/x86_64-linux/usr/lib/libz.so: file not recognized: File format not recognized
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
-
-
-Index: Imaging-1.1.7/setup.py
-===================================================================
---- Imaging-1.1.7.orig/setup.py
-+++ Imaging-1.1.7/setup.py
-@@ -155,11 +155,6 @@ class pil_build_ext(build_ext):
- 
-         # FIXME: check /opt/stuff directories here?
- 
--        prefix = sysconfig.get_config_var("prefix")
--        if prefix:
--            add_directory(library_dirs, os.path.join(prefix, "lib"))
--            add_directory(include_dirs, os.path.join(prefix, "include"))
--
-         #
-         # locate tkinter libraries
- 
diff --git a/meta-python/recipes-devtools/python/python-mccabe/0001-python-mccabe-remove-unnecessary-setup_requires-pyte.patch b/meta-python/recipes-devtools/python/python-mccabe/0001-python-mccabe-remove-unnecessary-setup_requires-pyte.patch
deleted file mode 100644
index 941bed3d73..0000000000
--- a/meta-python/recipes-devtools/python/python-mccabe/0001-python-mccabe-remove-unnecessary-setup_requires-pyte.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 3484bdfa7adbaebcf8bb8e7d4820f64b12717932 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Fri, 29 Jul 2016 15:37:18 +0800
-Subject: [PATCH] python-mccabe: remove unnecessary setup_requires
- pytest-runner
-
-* Remove setup_requires pytest-runner as the
-  setup_requires pytest-runner actually is not
-  used for pytest which only in do_compile phase
-  via setup.py build
-
-Upstream-Status: Pending
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- setup.py | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index e59903d..bf2aaba 100644
---- a/setup.py
-+++ b/setup.py
-@@ -33,7 +33,6 @@ setup(
-     license='Expat license',
-     py_modules=['mccabe'],
-     zip_safe=False,
--    setup_requires=['pytest-runner'],
-     tests_require=['pytest'],
-     entry_points={
-         'flake8.extension': [
--- 
-2.8.1
-
diff --git a/meta-python/recipes-devtools/python/python-numeric/0001-it-tries-to-define-this-function-differently-than-it.patch b/meta-python/recipes-devtools/python/python-numeric/0001-it-tries-to-define-this-function-differently-than-it.patch
deleted file mode 100644
index 81ed744cbd..0000000000
--- a/meta-python/recipes-devtools/python/python-numeric/0001-it-tries-to-define-this-function-differently-than-it.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 322e781c67d7a78fc2cfc3d377f50b825fc64abb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 2 Jun 2017 20:21:01 -0700
-Subject: [PATCH] it tries to define this function differently than it is
- defined in sys/time.h.
-
-Use the definition from system
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Packages/RNG/Src/ranf.c | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/Packages/RNG/Src/ranf.c b/Packages/RNG/Src/ranf.c
-index 5ca7dc5..e669fa8 100644
---- a/Packages/RNG/Src/ranf.c
-+++ b/Packages/RNG/Src/ranf.c
-@@ -149,9 +149,6 @@ void Mixranf(int *s,u32 s48[2])
- #else
- 	struct timeval tv;
- 	struct timezone tz;
--#if !defined(__sgi)
--	int gettimeofday(struct timeval *, struct timezone *);
--#endif
- 
- 	(void)gettimeofday(&tv,&tz);
- 	s48[0] = (u32)tv.tv_sec;
--- 
-2.13.0
-
diff --git a/meta-python/recipes-devtools/python/python-pygpgme/0001-reflect-2.1-reporting-for-key-imports.patch b/meta-python/recipes-devtools/python/python-pygpgme/0001-reflect-2.1-reporting-for-key-imports.patch
deleted file mode 100644
index 1f31cb805e..0000000000
--- a/meta-python/recipes-devtools/python/python-pygpgme/0001-reflect-2.1-reporting-for-key-imports.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From ed44474c11f577c1644910964a917a4cf701bb0f Mon Sep 17 00:00:00 2001
-From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
-Date: Tue, 26 Jan 2016 14:24:26 -0500
-Subject: [PATCH] reflect 2.1 reporting for key imports
-
-GnuPG 2.1 changes how it reports key imports.  These changes should
-make the pygpgme test suite compatible with GnuPG 2.1.
-
-See also:
-https://lists.gnupg.org/pipermail/gnupg-devel/2016-January/030718.html
-
-Upstream-Status: Backport
-
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
-
----
- tests/test_import.py | 22 +++++++++++-----------
- 1 file changed, 11 insertions(+), 11 deletions(-)
-
-diff --git a/tests/test_import.py b/tests/test_import.py
-index 10eb816..597eb47 100644
---- a/tests/test_import.py
-+++ b/tests/test_import.py
-@@ -55,7 +55,7 @@ class ImportTestCase(GpgHomeTestCase):
-         ctx = gpgme.Context()
-         with self.keyfile('key1.sec') as fp:
-             result = ctx.import_(fp)
--        self.assertEqual(result.considered, 1)
-+        self.assertEqual(result.considered, 3)
-         self.assertEqual(result.no_user_id, 0)
-         self.assertEqual(result.imported, 1)
-         self.assertEqual(result.imported_rsa, 0)
-@@ -64,18 +64,18 @@ class ImportTestCase(GpgHomeTestCase):
-         self.assertEqual(result.new_sub_keys, 0)
-         self.assertEqual(result.new_signatures, 0)
-         self.assertEqual(result.new_revocations, 0)
--        self.assertEqual(result.secret_read, 1)
--        self.assertEqual(result.secret_imported, 1)
-+        self.assertEqual(result.secret_read, 3)
-+        self.assertEqual(result.secret_imported, 2)
-         self.assertEqual(result.secret_unchanged, 0)
-         self.assertEqual(result.skipped_new_keys, 0)
-         self.assertEqual(result.not_imported, 0)
-         self.assertEqual(len(result.imports), 2)
-         self.assertEqual(result.imports[0],
-                          ('E79A842DA34A1CA383F64A1546BB55F0885C65A4',
--                          None, gpgme.IMPORT_NEW | gpgme.IMPORT_SECRET))
-+                          None, gpgme.IMPORT_NEW))
-         self.assertEqual(result.imports[1],
-                          ('E79A842DA34A1CA383F64A1546BB55F0885C65A4',
--                          None, gpgme.IMPORT_NEW))
-+                          None, gpgme.IMPORT_NEW | gpgme.IMPORT_SECRET))
-         # can we get the public key?
-         key = ctx.get_key('E79A842DA34A1CA383F64A1546BB55F0885C65A4')
-         # can we get the secret key?
-@@ -102,17 +102,17 @@ class ImportTestCase(GpgHomeTestCase):
-         fp = BytesIO(b'\n'.join(keys))
-         ctx = gpgme.Context()
-         result = ctx.import_(fp)
--        self.assertEqual(result.considered, 3)
-+        self.assertEqual(result.considered, 5)
-         self.assertEqual(result.no_user_id, 0)
-         self.assertEqual(result.imported, 2)
--        self.assertEqual(result.imported_rsa, 1)
-+        self.assertEqual(result.imported_rsa, 0)
-         self.assertEqual(result.unchanged, 0)
-         self.assertEqual(result.new_user_ids, 0)
-         self.assertEqual(result.new_sub_keys, 0)
-         self.assertEqual(result.new_signatures, 1)
-         self.assertEqual(result.new_revocations, 0)
--        self.assertEqual(result.secret_read, 1)
--        self.assertEqual(result.secret_imported, 1)
-+        self.assertEqual(result.secret_read, 3)
-+        self.assertEqual(result.secret_imported, 2)
-         self.assertEqual(result.secret_unchanged, 0)
-         self.assertEqual(result.skipped_new_keys, 0)
-         self.assertEqual(result.not_imported, 0)
-@@ -122,10 +122,10 @@ class ImportTestCase(GpgHomeTestCase):
-                           None, gpgme.IMPORT_NEW))
-         self.assertEqual(result.imports[1],
-                          ('E79A842DA34A1CA383F64A1546BB55F0885C65A4',
--                          None, gpgme.IMPORT_NEW | gpgme.IMPORT_SECRET))
-+                          None, gpgme.IMPORT_SIG))
-         self.assertEqual(result.imports[2],
-                          ('E79A842DA34A1CA383F64A1546BB55F0885C65A4',
--                          None, gpgme.IMPORT_SIG))
-+                          None, gpgme.IMPORT_NEW | gpgme.IMPORT_SECRET))
-         self.assertEqual(result.imports[3],
-                          ('93C2240D6B8AA10AB28F701D2CF46B7FC97E6B0F',
-                           None, gpgme.IMPORT_NEW))
diff --git a/meta-python/recipes-devtools/python/python-pygpgme/0002-passphrase_cb-is-deprecated.patch b/meta-python/recipes-devtools/python/python-pygpgme/0002-passphrase_cb-is-deprecated.patch
deleted file mode 100644
index c18cf3feba..0000000000
--- a/meta-python/recipes-devtools/python/python-pygpgme/0002-passphrase_cb-is-deprecated.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From ba0dc8273e4f83bcd2d43baa5910aae34b93048c Mon Sep 17 00:00:00 2001
-From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
-Date: Mon, 1 Feb 2016 19:25:12 -0500
-Subject: [PATCH] passphrase_cb is deprecated
-
-https://bugs.gnupg.org/gnupg/issue767 indicates that
-gpgme_set_passphrase_cb is a deprecated corner of the API and that
-developers using gpgme should really rely on the gpg-agent to handle
-this stuff.  This should actually simplify things for most
-installations -- just strip out all passphrase handling from your
-application entirely, relying on gpg to figure out how to find the
-agent, and relying on the agent figuring out how to prompt the user
-(if necessary).
-
-However, if a developer really wants to use the passphrase callback
-approach, they'll have to use loopback pinentry.  This sets up the
-test suite to be able to make those tests.
-
-Upstream-Status: Backport
-
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
-
----
- tests/util.py | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/tests/util.py b/tests/util.py
-index cd803c2..86892ca 100644
---- a/tests/util.py
-+++ b/tests/util.py
-@@ -28,7 +28,9 @@ keydir = os.path.join(os.path.dirname(__file__), 'keys')
- 
- class GpgHomeTestCase(unittest.TestCase):
- 
--    gpg_conf_contents = ''
-+    gpg_conf_contents = 'pinentry-mode loopback'
-+    gpg_agent_conf_contents = 'allow-loopback-pinentry'
-+
-     import_keys = []
- 
-     def keyfile(self, key):
-@@ -41,6 +43,10 @@ class GpgHomeTestCase(unittest.TestCase):
-         fp.write(self.gpg_conf_contents.encode('UTF-8'))
-         fp.close()
- 
-+        fp = open(os.path.join(self._gpghome, 'gpg-agent.conf'), 'wb')
-+        fp.write(self.gpg_agent_conf_contents.encode('UTF-8'))
-+        fp.close()
-+
-         # import requested keys into the keyring
-         ctx = gpgme.Context()
-         for key in self.import_keys:
diff --git a/meta-python/recipes-devtools/python/python-pygpgme/0003-handle-generic-error-when-no-passphrase-callback-pre.patch b/meta-python/recipes-devtools/python/python-pygpgme/0003-handle-generic-error-when-no-passphrase-callback-pre.patch
deleted file mode 100644
index 6acb68bfe7..0000000000
--- a/meta-python/recipes-devtools/python/python-pygpgme/0003-handle-generic-error-when-no-passphrase-callback-pre.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 579b5930e15de8855bf63b3c20b6c3aaf894c3eb Mon Sep 17 00:00:00 2001
-From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
-Date: Mon, 1 Feb 2016 19:27:59 -0500
-Subject: [PATCH] handle generic error when no passphrase callback present
-
-apparently gpg 2.1 returns ERR_GENERAL right now if the pinentry was
-in loopback mode and no passphrase callback was supplied.  Earlier
-versions supplied ERR_BAD_PASSPHRASE.
-
-Upstream-Status: Backport
-
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
-
----
- tests/test_passphrase.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/test_passphrase.py b/tests/test_passphrase.py
-index 0a235e9..35b3c59 100644
---- a/tests/test_passphrase.py
-+++ b/tests/test_passphrase.py
-@@ -41,7 +41,7 @@ class PassphraseTestCase(GpgHomeTestCase):
-             new_sigs = ctx.sign(plaintext, signature, gpgme.SIG_MODE_CLEAR)
-         except gpgme.GpgmeError as exc:
-             self.assertEqual(exc.args[0], gpgme.ERR_SOURCE_GPGME)
--            self.assertEqual(exc.args[1], gpgme.ERR_BAD_PASSPHRASE)
-+            self.assertEqual(exc.args[1], gpgme.ERR_GENERAL)
-         else:
-             self.fail('gpgme.GpgmeError not raised')
- 
diff --git a/meta-python/recipes-devtools/python/python-pygpgme/run-ptest b/meta-python/recipes-devtools/python/python-pygpgme/run-ptest
deleted file mode 100644
index ce2abb66a5..0000000000
--- a/meta-python/recipes-devtools/python/python-pygpgme/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-GPG_AGENT_INFO= python test_all.py -v 2>&1 | sed -e '/\.\.\. ok/ s/^/PASS: /g' -e '/\.\.\. [ERROR|FAIL]/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
diff --git a/meta-python/recipes-devtools/python/python-pyrex/pyrex-fix-optimized-mode.patch b/meta-python/recipes-devtools/python/python-pyrex/pyrex-fix-optimized-mode.patch
deleted file mode 100644
index c58c3280e2..0000000000
--- a/meta-python/recipes-devtools/python/python-pyrex/pyrex-fix-optimized-mode.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Pending
-
-Index: Pyrex-0.9.8.4/Pyrex/Distutils/extension.py
-===================================================================
---- Pyrex-0.9.8.4.orig/Pyrex/Distutils/extension.py
-+++ Pyrex-0.9.8.4/Pyrex/Distutils/extension.py
-@@ -15,7 +15,7 @@ except ImportError:
-     warnings = None
- 
- class Extension(_Extension.Extension):
--    _Extension.Extension.__doc__ + \
-+    _Extension.Extension.__doc__ or "" + \
-     """pyrex_include_dirs : [string]
-         list of directories to search for Pyrex header files (.pxd) (in
-         Unix form for portability)
-- 
2.40.1


