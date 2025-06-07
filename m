Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 257D8C5B543
	for <webhook@archiver.kernel.org>; Sat,  7 Jun 2025 15:49:32 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.20899.1749311365272448177
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Jun 2025 08:49:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout11.t-online.de (Postfix) with SMTP id 64EA763B
	for <openembedded-devel@lists.openembedded.org>; Sat,  7 Jun 2025 17:49:23 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.174.249]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uNvnO-0zohfd0; Sat, 7 Jun 2025 17:49:22 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libplacebo: update 7.349.0 -> 7.351.0
Date: Sat,  7 Jun 2025 17:49:15 +0200
Message-ID: <20250607154916.4163149-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1749311362-6BFEDF68-8F08BD58/0/0 CLEAN NORMAL
X-TOI-MSGID: 4746e994-6d0b-430f-a9a5-eeeae053a450
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Jun 2025 15:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117775

This release mainly introduces a variety of miscellaneous bug fixes, alon=
gside two minor / maintenance changes.

Additions:

    add pl_{opengl,vulkan,d3d11}_params.no_compute to suppress the use of
    compute shaders
    add pl_cache_{set,get}_file()

Changes:

    libav vulkan interop now requires lavu 58.11.100+ and vulkan 1.2.175+
    "sinc" filter preset radius dropped from 3 to 2

Fixes and performance enhancements:

    fix compilation of fuzzer test
    fix shader variable renaming loop
    fix error when the same gpu descriptor is used twice in one shader
    don't expose unsupported d3d11 formats
    fix rendering with flipped planes and user shaders
    fix rendering of textures with unusual channel order
    don't apply sigmoidization to alpha channel
    attach correctly normalized extension list to vulkan device creation
    fix orthogonal scaling fast path leaking garbage pixels
    some GLES 2.0 fixes
    fix DCDM XYZ decoding into DCI-P3
    fix build with glslang 15
    fix compilation without nuklear
    fix backwards compatibility with pl_render_params.skip_target_clearin=
g
    correctly output requested alpha mode
    preserve alpha channel when blending subsampled formats
    multiply plane scale even when not scaling
    propagate correct plane format after plane merging
    fix build with instrumentation enabled
    fix bug where layout transitions happened too early in some cases
    fix handling of promoted extension and function names
    don't scale alpha when blending low bit depth YUV planes
    fix build error with recent libavformat
    fix plane channel order when merging planes
    invalidate shader cache when GL version strings change
    fix compute shader promotion for flipped outputs
    fix upload of YUVA formats with reduced bit depths

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-Fix-compiling-demos-without-nuklear.patch | 40 -------------------
 ...n-add-glslang-lib-for-15.0.0-linking.patch | 34 ----------------
 ...acebo_7.349.0.bb =3D> libplacebo_7.351.0.bb} |  6 +--
 3 files changed, 2 insertions(+), 78 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/mplayer/libplacebo/0001-Fi=
x-compiling-demos-without-nuklear.patch
 delete mode 100644 meta-oe/recipes-multimedia/mplayer/libplacebo/0001-me=
son-add-glslang-lib-for-15.0.0-linking.patch
 rename meta-oe/recipes-multimedia/mplayer/{libplacebo_7.349.0.bb =3D> li=
bplacebo_7.351.0.bb} (85%)

diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo/0001-Fix-compi=
ling-demos-without-nuklear.patch b/meta-oe/recipes-multimedia/mplayer/lib=
placebo/0001-Fix-compiling-demos-without-nuklear.patch
deleted file mode 100644
index bd849a75dd..0000000000
--- a/meta-oe/recipes-multimedia/mplayer/libplacebo/0001-Fix-compiling-de=
mos-without-nuklear.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From ad0bbc5099d99bbb0c914b39cb5ab4920fd6eeda Mon Sep 17 00:00:00 2001
-From: Gyorgy Sarvari <skandigraun@gmail.com>
-Date: Sun, 16 Feb 2025 14:23:40 +0100
-Subject: [PATCH] Fix compiling demos without nuklear
-
-Demos can't be compiled if nuklear headers are not present, because
-the implementation of parse_args function is guarded by HAVE_NUKLEAR mac=
ro.
-
-To allow compiling demos without the Nuklear headers, move the implement=
ation
-outside of this ifdef.
-
-Upstream-Status: Submitted [https://github.com/haasn/libplacebo/pull/315=
]
----
- demos/settings.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/demos/settings.c b/demos/settings.c
-index 197e8b7e..73f0e5b9 100644
---- a/demos/settings.c
-+++ b/demos/settings.c
-@@ -14,9 +14,6 @@
- #define PL_BASENAME basename
- #endif
-=20
--#ifdef HAVE_NUKLEAR
--#include "ui.h"
--
- bool parse_args(struct plplay_args *args, int argc, char *argv[])
- {
-     static struct option long_options[] =3D {
-@@ -89,6 +86,9 @@ error:
-     return false;
- }
-=20
-+#ifdef HAVE_NUKLEAR
-+#include "ui.h"
-+
- static void add_hook(struct plplay *p, const struct pl_hook *hook, cons=
t char *path)
- {
-     if (!hook)
diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo/0001-meson-add=
-glslang-lib-for-15.0.0-linking.patch b/meta-oe/recipes-multimedia/mplaye=
r/libplacebo/0001-meson-add-glslang-lib-for-15.0.0-linking.patch
deleted file mode 100644
index 8d784da0cc..0000000000
--- a/meta-oe/recipes-multimedia/mplayer/libplacebo/0001-meson-add-glslan=
g-lib-for-15.0.0-linking.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From d18a23cc275576bcefbdcc179d08ae643eeb3f3e Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Kacper=3D20Michaj=3DC5=3D82ow?=3D <kasper93@gmail.com>
-Date: Mon, 2 Dec 2024 17:10:00 +0100
-Subject: [PATCH] meson: add glslang lib for 15.0.0 linking
-
-Glslang 15.0.0 moved some code around, add also linking to glslang,
-while this is not needed for older versions, it will still work.
-
-Unfortunately CMake config embedded in distributions is not usable
-without installing additional package like glslang-tools, because at
-least Ubuntu splits it. On Arch it would work, but generally the CMake
-config require cmake binary to work also, so let's keep it as-is for
-now.
-
-Upstream-Status: Backport [https://github.com/haasn/libplacebo/commit/05=
6b852018db04aa2ebc0982e27713afcea8106b]
----
- src/glsl/meson.build | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/glsl/meson.build b/src/glsl/meson.build
-index 5a881960..8fb5e699 100644
---- a/src/glsl/meson.build
-+++ b/src/glsl/meson.build
-@@ -39,6 +39,10 @@ elif not glslang_req.disabled()
-=20
-     glslang_deps +=3D spirv
-=20
-+    # Glslang 15.0.0 moved some code around, add also linking to glslan=
g, while
-+    # this is not needed for older versions, it will still work.
-+    glslang_deps +=3D cxx.find_library('glslang', required: required, s=
tatic: static)
-+
-     if static
-       glslang_deps +=3D [
-         # Always required for static linking
diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb b/m=
eta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb
similarity index 85%
rename from meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
rename to meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb
index 6431ab3dcf..272e293fd4 100644
--- a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb
@@ -4,10 +4,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D435ed639f84d4=
585d93824e7da3d85da"
=20
 DEPENDS +=3D "fastfloat glad-native python3-mako-native python3-jinja2-n=
ative vulkan-headers"
=20
-SRC_URI =3D "git://code.videolan.org/videolan/libplacebo.git;protocol=3D=
https;branch=3Dv7.349 \
-           file://0001-meson-add-glslang-lib-for-15.0.0-linking.patch \
-           file://0001-Fix-compiling-demos-without-nuklear.patch"
-SRCREV =3D "1fd3c7bde7b943fe8985c893310b5269a09b46c5"
+SRC_URI =3D "git://code.videolan.org/videolan/libplacebo.git;protocol=3D=
https;branch=3Dv7.351"
+SRCREV =3D "3188549fba13bbdf3a5a98de2a38c2e71f04e21e"
=20
 inherit meson pkgconfig
=20
--=20
2.49.0


