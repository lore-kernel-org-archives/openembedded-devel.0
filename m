Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42154C10F13
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:22 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.2282.1699061894545459158
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DIeahcF+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=W1IA/f5X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b97fb121b-09de8019-7697-4db6-8d8f-f7cf430c578e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061895;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NEh2y1G6hWj5L+47EYZmX/rGu+C/1YjfXzOAkO2dCMc=;
	b=DIeahcF+WNt5Xdab2SZkJx2sZBxo0EB07740qrKB3P0ZqW+kMxkk7DsvlfO9eSsz
	F5n4IbFzs8QY6TGLN3uCV9sZzYzuaFg9ESMZXyz8TbxX0d4MX9GLQOyU67Pd9Vx8BpN
	7bJNyojS/IZ21IT8z0OfnQD561Mtef8LU9mSN2BI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061895;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NEh2y1G6hWj5L+47EYZmX/rGu+C/1YjfXzOAkO2dCMc=;
	b=W1IA/f5XsowqORlYRUyGUqv5OVLHzvUBrytl128wvn4DduelYUSO/65HkoV97v0O
	Qwpyo8K7ZvizGK14CCVcmvWtYlmorFKNLaxtP3x6ZYBswt1oheGOfG9JG/4GtqUryTY
	O1MDKAueZ92mUNrSIu4LRdr01PcJ5gOPqFZdgYgU=
Content-Type: multipart/mixed; boundary="===============3543542006278164752=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-kivy: upgrading to 2.2.1 SUCCEEDED
Message-ID: <0101018b97fb121b-09de8019-7697-4db6-8d8f-f7cf430c578e-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106130

--===============3543542006278164752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-kivy* to *2.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-kivy-upgrade-2.1.0-2.2.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 17d9895af0aae3330a04a6565b04147a5f7a80d3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 22:29:14 +0000
Subject: [PATCH] python3-kivy: upgrade 2.1.0 -> 2.2.1

---
 .../0001-add-support-for-glesv2.patch         | 19 ++++++++---
 ...n3-kivy_2.1.0.bb => python3-kivy_2.2.1.bb} | 32 ++++++++++++++-----
 2 files changed, 39 insertions(+), 12 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-kivy_2.1.0.bb => python3-kivy_2.2.1.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch b/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch
index 0abc6c5c7..e38b31d34 100644
--- a/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch
+++ b/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch
@@ -1,8 +1,19 @@
+From 98224fec48d6e0f32b28d81220bf1ee1637ce045 Mon Sep 17 00:00:00 2001
+From: William Huang <whuang8933@gmail.com>
+Date: Thu, 2 Sep 2021 07:25:07 -0400
+Subject: [PATCH] recipes-devtools: python: add support for Kivy
+
 Upstream-Status: Pending
 
+---
+ setup.py | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 35e34afdd..0ba3aca72 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -695,7 +695,18 @@ def determine_gl_flags():
+@@ -730,7 +730,18 @@ def determine_gl_flags():
          c_options['use_x11'] = True
          c_options['use_egl'] = True
      else:
@@ -22,7 +33,7 @@ Upstream-Status: Pending
      return flags, base_flags
  
  
-@@ -723,14 +734,13 @@ def determine_sdl2():
+@@ -774,14 +785,13 @@ def determine_sdl2():
              sdl_inc = join(include, 'SDL2')
              if isdir(sdl_inc):
                  sdl2_paths.append(sdl_inc)
@@ -36,5 +47,5 @@ Upstream-Status: Pending
 -        ['/usr/local/lib/'])
 +        [''])
  
-     if sdl2_flags:
-         flags = merge(flags, sdl2_flags)
+     if kivy_sdl2_path:
+         # If we have a custom path, we need to add the rpath to the linker
diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.1.0.bb b/meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-kivy_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb
index b02c55a85..9e3c7bb69 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb
@@ -1,24 +1,40 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,4 +1,4 @@
+# -Copyright (c) 2010-2022 Kivy Team and other contributors
+# +Copyright (c) 2010-2023 Kivy Team and other contributors
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy
+#  of this software and associated documentation files (the "Software"), to deal
+# 
+#
+
 SUMMARY = "Open source Python library for rapid development of applications \
     that make use of innovative user interfaces, such as multi-touch apps."
 HOMEPAGE = "https://kivy.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=22e7b4dd8140eec57fd7edfd9fa23dfc"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ed5cd0f2cfda42852c332e3b88c85fea"
 
 inherit setuptools3 pkgconfig features_check
 PIP_INSTALL_PACKAGE = "Kivy"
 
-SRC_URI = "\
-    git://github.com/kivy/kivy.git;protocol=https;branch=master \
-"
+SRC_URI = "git://github.com/kivy/kivy.git;protocol=https;branch=stable \
+           file://0001-add-support-for-glesv2.patch \
+           "
 
 # Kivy's setup files only look for GLES libraries for Android, iOS, RPi,
 # and mali-based OS's. We need to patch the setup file to tell Kivy setup
 # that our machine has GLES libaries installed as well
 # Also, if using SDL2 as backend, SDL2 needs to be configured wth gles
-SRC_URI += " \
-    file://0001-add-support-for-glesv2.patch \
-"
-SRCREV = "960b95dc666753f59eff1b449124490fbec10184"
+SRCREV = "344768bfefd2e8f5302cc9dfb8ca41991ce6f7e7"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============3543542006278164752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-kivy: PKGV changed from 2.1.0 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/python3-kivy: SRC_URI changed from "git://github.com/kivy/kivy.git;protocol=https;branch=master file://0001-add-support-for-glesv2.patch" to "git://github.com/kivy/kivy.git;protocol=https;branch=stable file://0001-add-support-for-glesv2.patch"
packages/core2-64-poky-linux/python3-kivy: PV changed from "2.1.0" to "2.2.1"
packages/core2-64-poky-linux/python3-kivy/python3-kivy-dbg: PV changed from "2.1.0" to "2.2.1"
packages/core2-64-poky-linux/python3-kivy/python3-kivy-dbg: PKGSIZE changed from 28071664 to 28986920 (+3%)
packages/core2-64-poky-linux/python3-kivy/python3-kivy-dbg: FILELIST: added "/usr/lib/python3.11/site-packages/kivy/graphics/.debug/boxshadow.cpython-311-x86_64-linux-gnu.so"
packages/core2-64-poky-linux/python3-kivy/python3-kivy-dbg: PKGV changed from 2.1.0 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/python3-kivy/python3-kivy-dev: PV changed from "2.1.0" to "2.2.1"
packages/core2-64-poky-linux/python3-kivy/python3-kivy-dev: PKGV changed from 2.1.0 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/python3-kivy/python3-kivy-doc: PV changed from "2.1.0" to "2.2.1"
packages/core2-64-poky-linux/python3-kivy/python3-kivy-doc: PKGV changed from 2.1.0 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/python3-kivy/python3-kivy-examples: PV changed from "2.1.0" to "2.2.1"
packages/core2-64-poky-linux/python3-kivy/python3-kivy-examples: PKGSIZE changed from 9796893 to 9798683 (+0%)
packages/core2-64-poky-linux/python3-kivy/python3-kivy-examples: FILELIST: added "/usr/share/kivy-examples/svg/rotated.svg"
packages/core2-64-poky-linux/python3-kivy/python3-kivy-examples: PKGV changed from 2.1.0 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/python3-kivy/python3-kivy-locale: PV changed from "2.1.0" to "2.2.1"
packages/core2-64-poky-linux/python3-kivy/python3-kivy-locale: PKGV changed from 2.1.0 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/python3-kivy/python3-kivy-src: PV changed from "2.1.0" to "2.2.1"
packages/core2-64-poky-linux/python3-kivy/python3-kivy-src: PKGSIZE changed from 32938112 to 33888542 (+3%)
packages/core2-64-poky-linux/python3-kivy/python3-kivy-src: FILELIST: directory renamed /usr/src/debug/python3-kivy/2.1.0-r0/kivy/lib/libtess2/Include -> /usr/src/debug/python3-kivy/2.2.1-r0/kivy/lib/libtess2/Include, directory renamed /usr/src/debug/python3-kivy/2.1.0-r0/kivy/core/window -> /usr/src/debug/python3-kivy/2.2.1-r0/kivy/core/window, directory renamed /usr/src/debug/python3-kivy/2.1.0-r0/kivy/core/audio -> /usr/src/debug/python3-kivy/2.2.1-r0/kivy/core/audio, directory renamed /usr/src/debug/python3-kivy/2.1.0-r0/kivy/core/text -> /usr/src/debug/python3-kivy/2.2.1-r0/kivy/core/text, directory renamed /usr/src/debug/python3-kivy/2.1.0-r0/kivy/lib/libtess2/Source -> /usr/src/debug/python3-kivy/2.2.1-r0/kivy/lib/libtess2/Source, directory renamed /usr/src/debug/python3-kivy/2.1.0-r0/kivy -> /usr/src/debug/python3-kivy/2.2.1-r0/kivy, directory renamed /usr/src/debug/python3-kivy/2.1.0-r0/kivy/graphics/cgl_backend -> /usr/src/debug/python3-kivy/2.2.1-r0/kivy/graphics/cgl_backe
 nd, directory renamed /usr/src/debug/python3-kivy/2.1.0-r0/kivy/core/image -> /usr/src/debug/python3-kivy/2.2.1-r0/kivy/core/image, directory renamed /usr/src/debug/python3-kivy/2.1.0-r0/kivy/core/clipboard -> /usr/src/debug/python3-kivy/2.2.1-r0/kivy/core/clipboard, directory renamed /usr/src/debug/python3-kivy/2.1.0-r0/kivy/lib/gstplayer -> /usr/src/debug/python3-kivy/2.2.1-r0/kivy/lib/gstplayer, removed "/usr/src/debug/python3-kivy/2.1.0-r0/kivy/graphics/fbo.c /usr/src/debug/python3-kivy/2.1.0-r0/kivy/graphics/instructions.c /usr/src/debug/python3-kivy/2.1.0-r0/kivy/graphics/opengl.c /usr/src/debug/python3-kivy/2.1.0-r0/kivy/graphics/svg.c /usr/src/debug/python3-kivy/2.1.0-r0/kivy/graphics/cgl.c /usr/src/debug/python3-kivy/2.1.0-r0/kivy/graphics/stencil_instructions.c /usr/src/debug/python3-kivy/2.1.0-r0/kivy/graphics/vbo.c /usr/src/debug/python3-kivy/2.1.0-r0/kivy/graphics/context_instructions.c /usr/src/debug/python3-kivy/2.1.0-r0/kivy/graphics/compiler.c /usr/src/debug/python3
 -kivy/2.1.0-r0/kivy/graphics/vertex_instructions.c /usr/src/debug/python3-kivy/2.1.0-r0/kivy/graphics/buffer.c /usr/src/debug/python3-kivy/2.1.0-r0/kivy/graphics/shader.c /usr/src/debug/python3-kivy/2.1.0-r0/kivy/graphics/vertex.c /usr/src/debug/python3-kivy/2.1.0-r0/kivy/graphics/transformation.c /usr/src/debug/python3-kivy/2.1.0-r0/kivy/graphics/tesselator.c /usr/src/debug/python3-kivy/2.1.0-r0/kivy/graphics/context.c /usr/src/debug/python3-kivy/2.1.0-r0/kivy/graphics/texture.c /usr/src/debug/python3-kivy/2.1.0-r0/kivy/graphics/opengl_utils.c /usr/src/debug/python3-kivy/2.1.0-r0/kivy/graphics/scissor_instructions.c /usr/src/debug/python3-kivy/2.1.0-r0/kivy/graphics/gl_instructions.c", added "/usr/src/debug/python3-kivy/2.2.1-r0/kivy/graphics/cgl.c /usr/src/debug/python3-kivy/2.2.1-r0/kivy/graphics/gl_instructions.c /usr/src/debug/python3-kivy/2.2.1-r0/kivy/graphics/context.c /usr/src/debug/python3-kivy/2.2.1-r0/kivy/graphics/context_instructions.c /usr/src/debug/python3-kivy/2.2.1
 -r0/kivy/graphics/vbo.c /usr/src/debug/python3-kivy/2.2.1-r0/kivy/graphics/stencil_instructions.c /usr/src/debug/python3-kivy/2.2.1-r0/kivy/graphics/fbo.c /usr/src/debug/python3-kivy/2.2.1-r0/kivy/graphics/shader.c /usr/src/debug/python3-kivy/2.2.1-r0/kivy/graphics/tesselator.c /usr/src/debug/python3-kivy/2.2.1-r0/kivy/graphics/instructions.c /usr/src/debug/python3-kivy/2.2.1-r0/kivy/graphics/boxshadow.c /usr/src/debug/python3-kivy/2.2.1-r0/kivy/graphics/opengl_utils.c /usr/src/debug/python3-kivy/2.2.1-r0/kivy/graphics/scissor_instructions.c /usr/src/debug/python3-kivy/2.2.1-r0/kivy/graphics/vertex.c /usr/src/debug/python3-kivy/2.2.1-r0/kivy/graphics/svg.c /usr/src/debug/python3-kivy/2.2.1-r0/kivy/graphics/compiler.c /usr/src/debug/python3-kivy/2.2.1-r0/kivy/graphics/vertex_instructions.c /usr/src/debug/python3-kivy/2.2.1-r0/kivy/graphics/opengl.c /usr/src/debug/python3-kivy/2.2.1-r0/kivy/graphics/transformation.c /usr/src/debug/python3-kivy/2.2.1-r0/kivy/graphics/texture.c /usr/src
 /debug/python3-kivy/2.2.1-r0/kivy/graphics/buffer.c"
packages/core2-64-poky-linux/python3-kivy/python3-kivy-src: PKGV changed from 2.1.0 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/python3-kivy/python3-kivy-staticdev: PV changed from "2.1.0" to "2.2.1"
packages/core2-64-poky-linux/python3-kivy/python3-kivy-staticdev: PKGV changed from 2.1.0 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/python3-kivy/python3-kivy: PV changed from "2.1.0" to "2.2.1"
packages/core2-64-poky-linux/python3-kivy/python3-kivy: PKGSIZE changed from 15634972 to 16077034 (+3%)
packages/core2-64-poky-linux/python3-kivy/python3-kivy: FILELIST: directory renamed /usr/lib/python3.11/site-packages/Kivy-2.1.0.dev0.dist-info -> /usr/lib/python3.11/site-packages/Kivy-2.2.1.dist-info, removed "/usr/lib/python3.11/site-packages/kivy/tests/test_urlrequest.py /usr/lib/python3.11/site-packages/kivy/tests/__pycache__/test_urlrequest.cpython-311.pyc", added "/usr/lib/python3.11/site-packages/kivy/eventmanager/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/kivy/tests/test_urlrequest/__pycache__/test_urlrequest_requests.cpython-311.pyc /usr/lib/python3.11/site-packages/kivy/tests/test_graphics_svg.py /usr/lib/python3.11/site-packages/kivy/tests/test_urlrequest/test_urlrequest_urllib.py /usr/lib/python3.11/site-packages/kivy/tests/__pycache__/test_uix_videoplayer.cpython-311.pyc /usr/lib/python3.11/site-packages/kivy/tests/test_uix_videoplayer.py /usr/lib/python3.11/site-packages/kivy/tests/__pycache__/test_graphics_svg.cpython-311.pyc /usr/lib/pytho
 n3.11/site-packages/kivy/eventmanager/__init__.py /usr/lib/python3.11/site-packages/kivy/graphics/boxshadow.cpython-311-x86_64-linux-gnu.so /usr/lib/python3.11/site-packages/kivy/tests/pytest.ini /usr/lib/python3.11/site-packages/kivy/graphics/boxshadow.pxd /usr/lib/python3.11/site-packages/kivy/tests/test_urlrequest/__pycache__/test_urlrequest_urllib.cpython-311.pyc /usr/lib/python3.11/site-packages/kivy/tests/test_urlrequest/test_urlrequest_requests.py"
packages/core2-64-poky-linux/python3-kivy/python3-kivy: PKGV changed from 2.1.0 [default] to 2.2.1 [default]
Changes to packages/core2-64-poky-linux/python3-kivy (sysroot):
  /usr/lib/python3.11/site-packages/Kivy-2.2.1.dist-info was added
  /usr/lib/python3.11/site-packages/Kivy-2.2.1.dist-info/AUTHORS was added
  /usr/lib/python3.11/site-packages/Kivy-2.2.1.dist-info/dependency_links.txt was added
  /usr/lib/python3.11/site-packages/Kivy-2.2.1.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/Kivy-2.2.1.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/Kivy-2.2.1.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/Kivy-2.2.1.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/Kivy-2.2.1.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/kivy/eventmanager was added
  /usr/lib/python3.11/site-packages/kivy/eventmanager/__init__.py was added
  /usr/lib/python3.11/site-packages/kivy/eventmanager/__pycache__ was added
  /usr/lib/python3.11/site-packages/kivy/eventmanager/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/kivy/graphics/boxshadow.cpython-311-x86_64-linux-gnu.so was added
  /usr/lib/python3.11/site-packages/kivy/graphics/boxshadow.pxd was added
  /usr/lib/python3.11/site-packages/kivy/tests/__pycache__/test_graphics_svg.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/kivy/tests/__pycache__/test_uix_videoplayer.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/kivy/tests/pytest.ini was added
  /usr/lib/python3.11/site-packages/kivy/tests/test_graphics_svg.py was added
  /usr/lib/python3.11/site-packages/kivy/tests/test_uix_videoplayer.py was added
  /usr/lib/python3.11/site-packages/kivy/tests/test_urlrequest was added
  /usr/lib/python3.11/site-packages/kivy/tests/test_urlrequest/__pycache__ was added
  /usr/lib/python3.11/site-packages/kivy/tests/test_urlrequest/__pycache__/test_urlrequest_requests.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/kivy/tests/test_urlrequest/__pycache__/test_urlrequest_urllib.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/kivy/tests/test_urlrequest/test_urlrequest_requests.py was added
  /usr/lib/python3.11/site-packages/kivy/tests/test_urlrequest/test_urlrequest_urllib.py was added
  /usr/share/kivy-examples/svg/rotated.svg was added
  /usr/lib/python3.11/site-packages/Kivy-2.1.0.dev0.dist-info was removed
  /usr/lib/python3.11/site-packages/Kivy-2.1.0.dev0.dist-info/AUTHORS was removed
  /usr/lib/python3.11/site-packages/Kivy-2.1.0.dev0.dist-info/dependency_links.txt was removed
  /usr/lib/python3.11/site-packages/Kivy-2.1.0.dev0.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/Kivy-2.1.0.dev0.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/Kivy-2.1.0.dev0.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/Kivy-2.1.0.dev0.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/Kivy-2.1.0.dev0.dist-info/WHEEL was removed
  /usr/lib/python3.11/site-packages/kivy/tests/__pycache__/test_urlrequest.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/kivy/tests/test_urlrequest.py was removed

--===============3543542006278164752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-kivy/python3-kivy-examples: FILELIST: added "/usr/share/kivy-examples/svg/rotated.svg"
packages/core2-64-poky-linux/python3-kivy/python3-kivy: FILELIST: directory renamed /usr/lib/python3.11/site-packages/Kivy-2.1.0.dev0.dist-info -> /usr/lib/python3.11/site-packages/Kivy-2.2.1.dist-info, removed "/usr/lib/python3.11/site-packages/kivy/tests/__pycache__/test_urlrequest.cpython-311.pyc /usr/lib/python3.11/site-packages/kivy/tests/test_urlrequest.py", added "/usr/lib/python3.11/site-packages/kivy/graphics/boxshadow.cpython-311-x86_64-linux-gnu.so /usr/lib/python3.11/site-packages/kivy/tests/__pycache__/test_uix_videoplayer.cpython-311.pyc /usr/lib/python3.11/site-packages/kivy/tests/test_urlrequest/__pycache__/test_urlrequest_requests.cpython-311.pyc /usr/lib/python3.11/site-packages/kivy/tests/test_urlrequest/test_urlrequest_requests.py /usr/lib/python3.11/site-packages/kivy/eventmanager/__init__.py /usr/lib/python3.11/site-packages/kivy/tests/test_graphics_svg.py /usr/lib/python3.11/site-packages/kivy/eventmanager/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.1
 1/site-packages/kivy/tests/test_uix_videoplayer.py /usr/lib/python3.11/site-packages/kivy/tests/test_urlrequest/__pycache__/test_urlrequest_urllib.cpython-311.pyc /usr/lib/python3.11/site-packages/kivy/tests/__pycache__/test_graphics_svg.cpython-311.pyc /usr/lib/python3.11/site-packages/kivy/tests/test_urlrequest/test_urlrequest_urllib.py /usr/lib/python3.11/site-packages/kivy/tests/pytest.ini /usr/lib/python3.11/site-packages/kivy/graphics/boxshadow.pxd"
Changes to packages/core2-64-poky-linux/python3-kivy (sysroot):
  /usr/lib/python3.11/site-packages/Kivy-2.2.1.dist-info was added
  /usr/lib/python3.11/site-packages/Kivy-2.2.1.dist-info/AUTHORS was added
  /usr/lib/python3.11/site-packages/Kivy-2.2.1.dist-info/dependency_links.txt was added
  /usr/lib/python3.11/site-packages/Kivy-2.2.1.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/Kivy-2.2.1.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/Kivy-2.2.1.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/Kivy-2.2.1.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/Kivy-2.2.1.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/kivy/eventmanager was added
  /usr/lib/python3.11/site-packages/kivy/eventmanager/__init__.py was added
  /usr/lib/python3.11/site-packages/kivy/eventmanager/__pycache__ was added
  /usr/lib/python3.11/site-packages/kivy/eventmanager/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/kivy/graphics/boxshadow.cpython-311-x86_64-linux-gnu.so was added
  /usr/lib/python3.11/site-packages/kivy/graphics/boxshadow.pxd was added
  /usr/lib/python3.11/site-packages/kivy/tests/__pycache__/test_graphics_svg.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/kivy/tests/__pycache__/test_uix_videoplayer.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/kivy/tests/pytest.ini was added
  /usr/lib/python3.11/site-packages/kivy/tests/test_graphics_svg.py was added
  /usr/lib/python3.11/site-packages/kivy/tests/test_uix_videoplayer.py was added
  /usr/lib/python3.11/site-packages/kivy/tests/test_urlrequest was added
  /usr/lib/python3.11/site-packages/kivy/tests/test_urlrequest/__pycache__ was added
  /usr/lib/python3.11/site-packages/kivy/tests/test_urlrequest/__pycache__/test_urlrequest_requests.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/kivy/tests/test_urlrequest/__pycache__/test_urlrequest_urllib.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/kivy/tests/test_urlrequest/test_urlrequest_requests.py was added
  /usr/lib/python3.11/site-packages/kivy/tests/test_urlrequest/test_urlrequest_urllib.py was added
  /usr/share/kivy-examples/svg/rotated.svg was added
  /usr/lib/python3.11/site-packages/Kivy-2.1.0.dev0.dist-info was removed
  /usr/lib/python3.11/site-packages/Kivy-2.1.0.dev0.dist-info/AUTHORS was removed
  /usr/lib/python3.11/site-packages/Kivy-2.1.0.dev0.dist-info/dependency_links.txt was removed
  /usr/lib/python3.11/site-packages/Kivy-2.1.0.dev0.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/Kivy-2.1.0.dev0.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/Kivy-2.1.0.dev0.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/Kivy-2.1.0.dev0.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/Kivy-2.1.0.dev0.dist-info/WHEEL was removed
  /usr/lib/python3.11/site-packages/kivy/tests/__pycache__/test_urlrequest.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/kivy/tests/test_urlrequest.py was removed

--===============3543542006278164752==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-kivy-upgrade-2.1.0-2.2.1.patch"

RnJvbSAxN2Q5ODk1YWYwYWFlMzMzMGEwNGE2NTY1YjA0MTQ3YTVmN2E4MGQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMjoyOToxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMta2l2eTogdXBncmFkZSAyLjEuMCAtPiAyLjIuMQoKLS0tCiAuLi4vMDAwMS1hZGQtc3Vw
cG9ydC1mb3ItZ2xlc3YyLnBhdGNoICAgICAgICAgfCAxOSArKysrKysrKy0tLQogLi4ubjMta2l2
eV8yLjEuMC5iYiA9PiBweXRob24zLWtpdnlfMi4yLjEuYmJ9IHwgMzIgKysrKysrKysrKysrKyst
LS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1raXZ5
XzIuMS4wLmJiID0+IHB5dGhvbjMta2l2eV8yLjIuMS5iYn0gKDY1JSkKCmRpZmYgLS1naXQgYS9t
ZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWtpdnkvMDAwMS1hZGQt
c3VwcG9ydC1mb3ItZ2xlc3YyLnBhdGNoIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1raXZ5LzAwMDEtYWRkLXN1cHBvcnQtZm9yLWdsZXN2Mi5wYXRjaAppbmRl
eCAwYWJjNmM1YzcuLmUzOGIzMWQzNCAxMDA2NDQKLS0tIGEvbWV0YS1weXRob24vcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1raXZ5LzAwMDEtYWRkLXN1cHBvcnQtZm9yLWdsZXN2Mi5w
YXRjaAorKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWtp
dnkvMDAwMS1hZGQtc3VwcG9ydC1mb3ItZ2xlc3YyLnBhdGNoCkBAIC0xLDggKzEsMTkgQEAKK0Zy
b20gOTgyMjRmZWM0OGQ2ZTBmMzJiMjhkODEyMjBiZjFlZTE2MzdjZTA0NSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb206IFdpbGxpYW0gSHVhbmcgPHdodWFuZzg5MzNAZ21haWwuY29tPgor
RGF0ZTogVGh1LCAyIFNlcCAyMDIxIDA3OjI1OjA3IC0wNDAwCitTdWJqZWN0OiBbUEFUQ0hdIHJl
Y2lwZXMtZGV2dG9vbHM6IHB5dGhvbjogYWRkIHN1cHBvcnQgZm9yIEtpdnkKKwogVXBzdHJlYW0t
U3RhdHVzOiBQZW5kaW5nCiAKKy0tLQorIHNldHVwLnB5IHwgMTYgKysrKysrKysrKysrKy0tLQor
IDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQorCitkaWZm
IC0tZ2l0IGEvc2V0dXAucHkgYi9zZXR1cC5weQoraW5kZXggMzVlMzRhZmRkLi4wYmEzYWNhNzIg
MTAwNjQ0CiAtLS0gYS9zZXR1cC5weQogKysrIGIvc2V0dXAucHkKLUBAIC02OTUsNyArNjk1LDE4
IEBAIGRlZiBkZXRlcm1pbmVfZ2xfZmxhZ3MoKToKK0BAIC03MzAsNyArNzMwLDE4IEBAIGRlZiBk
ZXRlcm1pbmVfZ2xfZmxhZ3MoKToKICAgICAgICAgIGNfb3B0aW9uc1sndXNlX3gxMSddID0gVHJ1
ZQogICAgICAgICAgY19vcHRpb25zWyd1c2VfZWdsJ10gPSBUcnVlCiAgICAgIGVsc2U6CkBAIC0y
Miw3ICszMyw3IEBAIFVwc3RyZWFtLVN0YXR1czogUGVuZGluZwogICAgICByZXR1cm4gZmxhZ3Ms
IGJhc2VfZmxhZ3MKICAKICAKLUBAIC03MjMsMTQgKzczNCwxMyBAQCBkZWYgZGV0ZXJtaW5lX3Nk
bDIoKToKK0BAIC03NzQsMTQgKzc4NSwxMyBAQCBkZWYgZGV0ZXJtaW5lX3NkbDIoKToKICAgICAg
ICAgICAgICBzZGxfaW5jID0gam9pbihpbmNsdWRlLCAnU0RMMicpCiAgICAgICAgICAgICAgaWYg
aXNkaXIoc2RsX2luYyk6CiAgICAgICAgICAgICAgICAgIHNkbDJfcGF0aHMuYXBwZW5kKHNkbF9p
bmMpCkBAIC0zNiw1ICs0Nyw1IEBAIFVwc3RyZWFtLVN0YXR1czogUGVuZGluZwogLSAgICAgICAg
WycvdXNyL2xvY2FsL2xpYi8nXSkKICsgICAgICAgIFsnJ10pCiAgCi0gICAgIGlmIHNkbDJfZmxh
Z3M6Ci0gICAgICAgICBmbGFncyA9IG1lcmdlKGZsYWdzLCBzZGwyX2ZsYWdzKQorICAgICBpZiBr
aXZ5X3NkbDJfcGF0aDoKKyAgICAgICAgICMgSWYgd2UgaGF2ZSBhIGN1c3RvbSBwYXRoLCB3ZSBu
ZWVkIHRvIGFkZCB0aGUgcnBhdGggdG8gdGhlIGxpbmtlcgpkaWZmIC0tZ2l0IGEvbWV0YS1weXRo
b24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1raXZ5XzIuMS4wLmJiIGIvbWV0YS1w
eXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1raXZ5XzIuMi4xLmJiCnNpbWls
YXJpdHkgaW5kZXggNjUlCnJlbmFtZSBmcm9tIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMta2l2eV8yLjEuMC5iYgpyZW5hbWUgdG8gbWV0YS1weXRob24vcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1raXZ5XzIuMi4xLmJiCmluZGV4IGIwMmM1NWE4NS4u
OWUzYzdiYjY5IDEwMDY0NAotLS0gYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWtpdnlfMi4xLjAuYmIKKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1raXZ5XzIuMi4xLmJiCkBAIC0xLDI0ICsxLDQwIEBACisjIEZJWE1F
OiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRv
b2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0
aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElD
RU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhl
IGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAn
TGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFu
Z2VzOgorIworIyAtLS0gTElDRU5TRQorIyArKysgTElDRU5TRQorIyBAQCAtMSw0ICsxLDQgQEAK
KyMgLUNvcHlyaWdodCAoYykgMjAxMC0yMDIyIEtpdnkgVGVhbSBhbmQgb3RoZXIgY29udHJpYnV0
b3JzCisjICtDb3B5cmlnaHQgKGMpIDIwMTAtMjAyMyBLaXZ5IFRlYW0gYW5kIG90aGVyIGNvbnRy
aWJ1dG9ycworIyAgCisjICBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNo
YXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYSBjb3B5CisjICBvZiB0aGlzIHNvZnR3YXJl
IGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwgdG8g
ZGVhbAorIyAKKyMKKwogU1VNTUFSWSA9ICJPcGVuIHNvdXJjZSBQeXRob24gbGlicmFyeSBmb3Ig
cmFwaWQgZGV2ZWxvcG1lbnQgb2YgYXBwbGljYXRpb25zIFwKICAgICB0aGF0IG1ha2UgdXNlIG9m
IGlubm92YXRpdmUgdXNlciBpbnRlcmZhY2VzLCBzdWNoIGFzIG11bHRpLXRvdWNoIGFwcHMuIgog
SE9NRVBBR0UgPSAiaHR0cHM6Ly9raXZ5Lm9yZy8iCiBMSUNFTlNFID0gIk1JVCIKLUxJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTIyZTdiNGRkODE0MGVlYzU3ZmQ3ZWRmZDlm
YTIzZGZjIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZWQ1Y2QwZjJj
ZmRhNDI4NTJjMzMyZTNiODhjODVmZWEiCiAKIGluaGVyaXQgc2V0dXB0b29sczMgcGtnY29uZmln
IGZlYXR1cmVzX2NoZWNrCiBQSVBfSU5TVEFMTF9QQUNLQUdFID0gIktpdnkiCiAKLVNSQ19VUkkg
PSAiXAotICAgIGdpdDovL2dpdGh1Yi5jb20va2l2eS9raXZ5LmdpdDtwcm90b2NvbD1odHRwczti
cmFuY2g9bWFzdGVyIFwKLSIKK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9raXZ5L2tpdnku
Z2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1zdGFibGUgXAorICAgICAgICAgICBmaWxlOi8vMDAw
MS1hZGQtc3VwcG9ydC1mb3ItZ2xlc3YyLnBhdGNoIFwKKyAgICAgICAgICAgIgogCiAjIEtpdnkn
cyBzZXR1cCBmaWxlcyBvbmx5IGxvb2sgZm9yIEdMRVMgbGlicmFyaWVzIGZvciBBbmRyb2lkLCBp
T1MsIFJQaSwKICMgYW5kIG1hbGktYmFzZWQgT1Mncy4gV2UgbmVlZCB0byBwYXRjaCB0aGUgc2V0
dXAgZmlsZSB0byB0ZWxsIEtpdnkgc2V0dXAKICMgdGhhdCBvdXIgbWFjaGluZSBoYXMgR0xFUyBs
aWJhcmllcyBpbnN0YWxsZWQgYXMgd2VsbAogIyBBbHNvLCBpZiB1c2luZyBTREwyIGFzIGJhY2tl
bmQsIFNETDIgbmVlZHMgdG8gYmUgY29uZmlndXJlZCB3dGggZ2xlcwotU1JDX1VSSSArPSAiIFwK
LSAgICBmaWxlOi8vMDAwMS1hZGQtc3VwcG9ydC1mb3ItZ2xlc3YyLnBhdGNoIFwKLSIKLVNSQ1JF
ViA9ICI5NjBiOTVkYzY2Njc1M2Y1OWVmZjFiNDQ5MTI0NDkwZmJlYzEwMTg0IgorU1JDUkVWID0g
IjM0NDc2OGJmZWZkMmU4ZjUzMDJjYzlkZmI4Y2E0MTk5MWNlNmY3ZTciCiAKIFMgPSAiJHtXT1JL
RElSfS9naXQiCiAKLS0gCjIuMzkuMgoK

--===============3543542006278164752==--

