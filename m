Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14661.1793092860389297877
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cvEZk0RE;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so26930735e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092859; x=1793697659; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CcB2c4iXRPq+4r51fjXdlZm9Ff/UzFi1CWGFWOIUhy8=;
        b=cvEZk0RE92bWnjo2T6GTUyB/Xd/AUk6kr9mYgOuQXSe7ukWTtBK+/X94jgWOqj4WKL
         yZUf4Zac0xeIT6IIyMeOPb31+qLdUDPleuVllvBFJoZqTzYLm24pV/BM4bFv/c4X0Wf+
         iQEM2r7ZRBBaXob0/d5v9MR3D3MbmuKn+g/ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092859; x=1793697659;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcB2c4iXRPq+4r51fjXdlZm9Ff/UzFi1CWGFWOIUhy8=;
        b=lgz5oQG6uG88HalSnw52yU1+tNI4gmzbHpqkGO0JfxjMNooINm5M+Wva9LIbjjLHY3
         58mdqjEZK8aHh8dNEjvTxhNK0Sj8dQbmHPXg7TBMSlHem1kdlOi6pjLIZ/cW5e61gN/l
         g0tdSGD8KKD8UKE3dscHyN9YaF31OSV01K7IgAC0hxyq2dRDyjYJ/z85T1Sg52Zh3umy
         Rxwp80CQe6oa2RkQx+df5U6SbwPkPlNrOKwFk7ierd/dThmv3rbEHu8zv8uaUpr/kK+E
         4CqgNHSfcJo0GnnsDlIn3TKTXQQtGAQo8HBhNAX7QULQP6p2AyB0PvCUXljwOCuGv8r3
         biRA==
X-Gm-Message-State: AFq9FYJyEfjdA4CqBZz3PhrbOxtW3WhrX4Ylgg7OKxgHWVbeR6ABkvug
	SJbBOTOSbb4GP9/LSXq/aQ/W5EFKRMe5iKw5NocpdQUd2BG0QoJEpDu1ZsTCZYVY3dzNcbntFBC
	hJ19C
X-Gm-Gg: AYBFou041VxoZQ9VhPK0i8M02u8BAye7O0Z7ZOO3VCQPMABQtFChuwVjorXowrgvfkF
	I55DVv/AjH6zOHGth942nLu5MX2qNTOQEXZpmXGasAIMgmP5v7kcfgXGbcO0WTZbCauiWp5I6jg
	tXdRdgOUTFLxMhNFyuD/3zVS0knpZQabHZ4+KBOe3UWIW4gbZZm/UWsT3PxSH6wFGBosRPGQ3y3
	XXGCtHkt2+pU6Yj+UcQkjbVrOuKexizLysEVQZ3iGc3kRydzGN3niko+Qyq85QJgrr1R7GihYni
	Whzma6IK1dX65UMN7Y0I/g9OaZ90y1306SbW/W5t6a/rgpBOLRZ0QacpyugcqcTOpVxliqYeLui
	905WT4vaeFe+Pv9KZS9/dYmLCYgZBggHdJcte98KHX19VMA80vQWliP54IfkNuRTC1h4EscXY1p
	u4yueJoCSuuvR6+XOHXsTWnHa118v3xj4Yl70c5xzb1+pDUofShUgEArWDVgZKaEt3vCLZ089W/
	OuYOUHzTKEaHU4XxteuzmlxY3v0JI1lVTjKmzS1Ez9El0HDUbc4TJlIB7kH/Pot2vGDSodGZfOx
	0+yxf2vpBzcp3z+/j4YcrfJeimsldyFzZ9hvH30ytB/kbBYPgyPHw38SFKfkCP+6ewm16HKLno+
	zorAv
X-Received: by 2002:a05:600c:524c:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4a35ac8bdc6mr172410645e9.8.1793092858615;
        Tue, 27 Oct 2026 02:20:58 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:20:58 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 25/61] python3-pyproj: Upgrade 3.7.2 -> 3.8.0
Date: Tue, 27 Oct 2026 11:19:52 +0200
Message-ID: <20261027092028.782979-25-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131489
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.8.0:

- DEP: Minimum supported Python version 3.12
- WHL: Wheels contain PROJ 9.8.1
- WHL: Remove MacOS 13 (X86_64) wheels
- WHL: Update to MacOS 15 (x86_64) wheels
- BLD: update build-time dependencies
- BLD: cleanup redundant instructions in MANIFEST.in
- MNT: Use dependency-groups (PEP 735) instead of requirements
  files
- WHL: upgrade cibuildwheel to 4.1.0
- PERF: improve single point transform and remove warning from
  numpy scalars
- ENH: Add query_geodetic_crs_from_datum
- ENH: add pivot_crs and grid_check args to TransformerGroup
- ENH: TransformerGroup: add option to ignore CRS extents
- ENH: add always_xy arg to from_pipeline method
- BUG: Fix use-after-free when ContextManager frees a context on
  anothe…  (This resolved multithreading issues)
- BUG: Clear CONTEXT_THREAD_KEY when destroying the PJ_CONTEXT
- BUG: Default skew angle for CF grid mapping oblique mercator to
  90
- BUG: Fix linting issues
- BUG: fix TransformerGroup crash when
  proj_normalize_for_visualization() returns NULL
- BUG: Update and fix linting
- BUG: Fix CRS.to_2d() on CustomConstructorCRS subclasses
- TYP: Type the Geod.npts method and some crs dict typings
- TST: Fix tests for PROJ 9.7.0 and newer
- TST: Fix tests for RGF93 v1 -> ETRS89-FRA [RGF93 v1]
- TST: Update tests with new transformations in PROJ 9.8
- TST: Fix tests and workflows
- TST: Adjust transformer tests for PROJ 9.8 behavior changes
- TST: Add Python 3.14 to the testing
- MNT: Update release instructions with more details
- MNT: Update wheels to proj 9.7.1
- DOC: fix tiny typo in docstring
- DOC: Spelling fix in test function names
- DOC: Fix typos
- DOC: Update fiona CRS compatibility for fiona 1.9+
- DOC: add CPython 3.14 support trove classifier
- DOC: Fix doubled word in transformer docstring
- DOC: added windows specfic intructions for building documentation
- CI: stop publishing Sphinx doctree cache to gh-pages
- CI: Fix build CI pulling in free-threaded python

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-pyproj/rpath.patch              | 14 ++++++++++++--
 ...on3-pyproj_3.7.2.bb => python3-pyproj_3.8.0.bb} |  2 +-
 2 files changed, 13 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyproj_3.7.2.bb => python3-pyproj_3.8.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pyproj/rpath.patch b/meta-python/recipes-devtools/python/python3-pyproj/rpath.patch
index 6e230d1055..46153fa3bd 100644
--- a/meta-python/recipes-devtools/python/python3-pyproj/rpath.patch
+++ b/meta-python/recipes-devtools/python/python3-pyproj/rpath.patch
@@ -1,12 +1,22 @@
+From a5fa6c3d4162c67550cb36261f0660b4867e811b Mon Sep 17 00:00:00 2001
+From: Bas Couwenberg <sebastic@debian.org>
+Date: Mon, 19 Aug 2024 15:58:07 -0700
+Subject: [PATCH] python3-pyproj: Fix buildpaths QA Error
+
 Description: Don't set RPATH in libraries.
-Author: Bas Couwenberg <sebastic@debian.org>
 Forwarded: not-needed
 
 Upstream-Status: Inappropriate [OE-Specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ setup.py | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 54d6820..bbd11a8 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -193,9 +193,6 @@ def get_extension_modules():
+@@ -194,9 +194,6 @@ def get_extension_modules():
      ext_options = {
          "include_dirs": include_dirs,
          "library_dirs": library_dirs,
diff --git a/meta-python/recipes-devtools/python/python3-pyproj_3.7.2.bb b/meta-python/recipes-devtools/python/python3-pyproj_3.8.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pyproj_3.7.2.bb
rename to meta-python/recipes-devtools/python/python3-pyproj_3.8.0.bb
index d2cce709cb..529e1f7549 100644
--- a/meta-python/recipes-devtools/python/python3-pyproj_3.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproj_3.8.0.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta cython
 
 SRC_URI += "file://rpath.patch"
 
-SRC_URI[sha256sum] = "39a0cf1ecc7e282d1d30f36594ebd55c9fae1fda8a2622cee5d100430628f88c"
+SRC_URI[sha256sum] = "efa59725bba68bf97fa808b61302df32934acdceb6a5c92a8dd0e71dc266a876"
 
 DEPENDS = "proj proj-native python3-wheel-native"
 
-- 
2.47.3

