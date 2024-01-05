Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6907C3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 18:37:07 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.31135.1704479823510233152
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jan 2024 10:37:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout12.t-online.de (Postfix) with SMTP id C51A87AB8
	for <openembedded-devel@lists.openembedded.org>; Fri,  5 Jan 2024 19:37:01 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.175.203]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rLp3w-2G1C0P0; Fri, 5 Jan 2024 19:36:56 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] libplacebo: add recipe
Date: Fri,  5 Jan 2024 19:36:47 +0100
Message-ID: <20240105183648.61874-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1704479816-C12ED9F9-1CB5DDCA/0/0 CLEAN NORMAL
X-TOI-MSGID: 6873778e-49e6-4c07-a660-fb8e44d55df9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Jan 2024 18:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108050

libplacebo is a required build dependency for mpv-0.37

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...001-frame_queue.h-add-frame_duration.patch | 32 +++++++++++++++++++
 .../libplacebo/0001-gpu.h-add-stride_w.patch  | 30 +++++++++++++++++
 .../mplayer/libplacebo_git.bb                 | 28 ++++++++++++++++
 3 files changed, 90 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/libplacebo/0001-fr=
ame_queue.h-add-frame_duration.patch
 create mode 100644 meta-oe/recipes-multimedia/mplayer/libplacebo/0001-gp=
u.h-add-stride_w.patch
 create mode 100644 meta-oe/recipes-multimedia/mplayer/libplacebo_git.bb

diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo/0001-frame_que=
ue.h-add-frame_duration.patch b/meta-oe/recipes-multimedia/mplayer/libpla=
cebo/0001-frame_queue.h-add-frame_duration.patch
new file mode 100644
index 000000000..5b4ded981
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/libplacebo/0001-frame_queue.h-ad=
d-frame_duration.patch
@@ -0,0 +1,32 @@
+From 8437cd1fa7dc1797d3290c121ca17b39a0d2fd6a Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Tue, 5 Dec 2023 19:49:42 +0100
+Subject: [PATCH] frame_queue.h: add frame_duration
+
+This fixes:
+| [ 87/266] Compiling stream/cookies.c
+| ../git/video/out/vo_gpu_next.c: In function 'draw_frame':
+| ../git/video/out/vo_gpu_next.c:932:14: error: 'struct pl_queue_params'=
 has no member named 'frame_duration'
+|   932 |             .frame_duration =3D frame->ideal_frame_duration,
+|       |              ^~~~~~~~~~~~~~
+
+---
+ src/include/libplacebo/utils/frame_queue.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/include/libplacebo/utils/frame_queue.h b/src/include/li=
bplacebo/utils/frame_queue.h
+index 2a9c90c3..8afa4355 100644
+--- a/src/include/libplacebo/utils/frame_queue.h
++++ b/src/include/libplacebo/utils/frame_queue.h
+@@ -170,6 +170,8 @@ struct pl_queue_params {
+     // should instead be interpreted by the provided callback.
+     uint64_t timeout;
+=20
++    const float frame_duration;
++
+     // This callback will be used to pull new frames from the decoder. =
It may
+     // block if needed. The user is responsible for setting appropriate=
 time
+     // limits and/or returning and interpreting QUEUE_MORE as sensible.
+--=20
+2.42.1
+
diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo/0001-gpu.h-add=
-stride_w.patch b/meta-oe/recipes-multimedia/mplayer/libplacebo/0001-gpu.=
h-add-stride_w.patch
new file mode 100644
index 000000000..f08e122cf
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/libplacebo/0001-gpu.h-add-stride=
_w.patch
@@ -0,0 +1,30 @@
+From fbf74064bbb7133efe9234ef83976f06b3690e88 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Tue, 5 Dec 2023 19:35:51 +0100
+Subject: [PATCH] gpu.h: add stride_w
+
+this fixes:
+| [113/257] Compiling common/codecs.c
+| ../git/video/out/vo_gpu_next.c: In function 'update_overlays':
+| ../git/video/out/vo_gpu_next.c:268:14: error: 'struct pl_tex_transfer_=
params' has no member named 'stride_w'
+|   268 |             .stride_w   =3D item->packed->stride[0] / tex_fmt-=
>texel_size,
+|       |              ^~~~~~~~
+---
+ src/include/libplacebo/gpu.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/include/libplacebo/gpu.h b/src/include/libplacebo/gpu.h
+index a63fdf7c..57b4f195 100644
+--- a/src/include/libplacebo/gpu.h
++++ b/src/include/libplacebo/gpu.h
+@@ -904,6 +904,7 @@ struct pl_tex_transfer_params {
+=20
+     // Note: The contents of the memory region / buffer must exactly ma=
tch the
+     // texture format; i.e. there is no explicit conversion between for=
mats.
++    size_t stride_w;    //
+ };
+=20
+ #define pl_tex_transfer_params(...) (&(struct pl_tex_transfer_params) {=
 __VA_ARGS__ })
+--=20
+2.42.1
+
diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo_git.bb b/meta-=
oe/recipes-multimedia/mplayer/libplacebo_git.bb
new file mode 100644
index 000000000..dd0796782
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_git.bb
@@ -0,0 +1,28 @@
+SUMMARY =3D "The core rendering algorithms and ideas of mpv rewritten as=
 an independent library."
+SECTION =3D "multimedia"
+HOMEPAGE =3D "https://opensourcelibs.com/lib/libplacebo"
+
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D435ed639f84d4585d93824e7da3d8=
5da"
+
+SRC_URI =3D " \
+	git://code.videolan.org/videolan/libplacebo.git;protocol=3Dhttps;branch=
=3Dv6.338 \
+	file://0001-gpu.h-add-stride_w.patch \
+	file://0001-frame_queue.h-add-frame_duration.patch \
+"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "2805a0d01c029084ab36bf5d0e3c8742012a0b27"
+PV =3D "6.338.1"
+
+inherit meson pkgconfig
+
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'vulkan openg=
l', d)}"
+
+PACKAGECONFIG[vulkan] =3D  "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulka=
n-loader vulkan-headers shaderc spirv-shader-generator python3-mako-nativ=
e python3-jinja2-native glad-native"
+PACKAGECONFIG[opengl] =3D "-Dopengl=3Denabled,-Dopengl=3Ddisabled,glad,g=
lad"
+PACKAGECONFIG[lcms] =3D "-Dlcms=3Denabled,-Dlcms=3Ddisabled,lcms"
+PACKAGECONFIG[demos] =3D "-Ddemos=3Dtrue,-Ddemos=3Dfalse,ffmpeg libsdl2 =
libsdl2-image"
+
+EXTRA_OEMESON =3D "-Dvulkan-registry=3D${STAGING_DATADIR}/vulkan/registr=
y/vk.xml"
+
--=20
2.43.0


