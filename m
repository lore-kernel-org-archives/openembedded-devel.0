Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D40CA5FF5
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 01:20:18 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10933.1791163213883983859
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Oct 2026 18:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=ApjyrXPr;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd90.aul.t-online.de (fwd90.aul.t-online.de [10.223.144.116])
	by mailout10.t-online.de (Postfix) with SMTP id 859CE37A1B
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Oct 2026 03:20:11 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.171.181]) by fwd90.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xDXND-2qQFRA0; Mon, 5 Oct 2026 03:20:11 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/3] mpv: fix a file descriptor leak in the render API
Date: Mon,  5 Oct 2026 03:19:54 +0200
Message-ID: <20261005011956.1224267-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1791163211-DB7FD9BF-542F428B/0/0 CLEAN NORMAL
X-TOI-MSGID: b8b2bd17-c4e9-4690-9762-b401fcd159f1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1791163211; i=f_l_k@t-online.de;
	bh=pwDkmcpyQDU782N8vbg/sLmsVtdbHmp6kXOBKvTAzTk=;
	h=From:To:Subject:Date;
	b=ApjyrXPr51YLj904nHnQAk6lEasxFXVJGmNQZONKZk9hYHeGgY3m8Hp2dH8OBHgqx
	 YHJPtV6k0cTAbiSdj9XjGasNNH8m3707u/MCOu8hTNvrX6J/bhuhAx+X/2ohNpFk24
	 IrIH8pWKTZ02HeGnzF+Xmw/dZif0Ibenu+HD7aU3SojUCj3V9AUz4jc0H4eWCXIngX
	 LIOXLjxefcGtEsLx591TZoLbNCw8sZnCzRXks5ZhPUDAEPfyF69lxaUL9POfc4y4OE
	 qGaGusFoiUh+dUFsyr6dkmLOgJT9oEP4mzbji4m/tcNBPwB58H2i0d2vdKdVXXiZPf
	 t60WWQsxGJV5g==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Oct 2026 01:20:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130620

With the OpenGL render API (vo_libmpv) every frame left a fence behind
that nothing cleaned up. On v3d each one holds a sync file, so after abou=
t
a minute of video the process ran into the open file limit and the
picture stopped ("MESA: error: Export failed"). Backport the upstream
fix.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...equire-swap_buffers-param-for-FenceS.patch | 35 +++++++++++++++++++
 .../recipes-multimedia/mplayer/mpv_0.41.0.bb  |  5 ++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/0001-opengl-co=
ntext-require-swap_buffers-param-for-FenceS.patch

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv/0001-opengl-context-r=
equire-swap_buffers-param-for-FenceS.patch b/meta-oe/recipes-multimedia/m=
player/mpv/0001-opengl-context-require-swap_buffers-param-for-FenceS.patc=
h
new file mode 100644
index 0000000000..70ba81b34c
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mpv/0001-opengl-context-require-=
swap_buffers-param-for-FenceS.patch
@@ -0,0 +1,35 @@
+From f74adc4243bd9e1a8ee96d187c939e6232510650 Mon Sep 17 00:00:00 2001
+From: Dudemanguy <random342@airmail.cc>
+Date: Thu, 22 Jan 2026 11:12:22 -0600
+Subject: [PATCH] opengl/context: require swap_buffers param for FenceSyn=
c
+
+Commits 8854c742711705be1fcfcc6a5875960a3e2593dc and
+5ae0e0ff9a6974453c1aba41ddc8442d12ac9264 eliminated the external
+swapchain API that the render backend (vo_libmpv) was previously using.
+However, it was missed that this was being used to skip the
+gl->FenceSync calls and that logic change was not properly accounted
+for. This meant that vo_libmpv would leak fences since
+ra_gl_ctx_swap_buffers is never called to clean them up.
+
+Fix this by making sure the ra_ctx_params have swap_buffers defined
+before calling gl->FenceSync. All platforms are required to implement
+this anyway with the exception of vo_libmpv since it's a funny special
+case. Fixes #17217.
+Upstream-Status: Backport [https://github.com/mpv-player/mpv/commit/f74a=
dc4243bd9e1a8ee96d187c939e6232510650]
+---
+ video/out/opengl/context.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/video/out/opengl/context.c b/video/out/opengl/context.c
+index 86e8d5daac8b4..86e5c797d670a 100644
+--- a/video/out/opengl/context.c
++++ b/video/out/opengl/context.c
+@@ -232,7 +232,7 @@ bool ra_gl_ctx_submit_frame(struct ra_swapchain *sw,=
 const struct vo_frame *fram
+     if (p->opts->use_glfinish)
+         gl->Finish();
+=20
+-    if (gl->FenceSync) {
++    if (gl->FenceSync && p->params.swap_buffers) {
+         GLsync fence =3D gl->FenceSync(GL_SYNC_GPU_COMMANDS_COMPLETE, 0=
);
+         if (fence)
+             MP_TARRAY_APPEND(p, p->vsync_fences, p->num_vsync_fences, f=
ence);
diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb b/meta-oe/r=
ecipes-multimedia/mplayer/mpv_0.41.0.bb
index c8a0222ebf..7178182c29 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
@@ -23,7 +23,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.GPL;md5=3D570a9b3=
749dd0463a1778803b12a6dce"
 LICENSE_FLAGS =3D "commercial"
=20
 SRCREV =3D "41f6a645068483470267271e1d09966ca3b9f413"
-SRC_URI =3D "git://github.com/mpv-player/mpv;name=3Dmpv;branch=3Drelease=
/${@oe.utils.trim_version('${PV}', 2)};protocol=3Dhttps;tag=3Dv${PV}"
+SRC_URI =3D " \
+    git://github.com/mpv-player/mpv;name=3Dmpv;branch=3Drelease/${@oe.ut=
ils.trim_version('${PV}', 2)};protocol=3Dhttps;tag=3Dv${PV} \
+    file://0001-opengl-context-require-swap_buffers-param-for-FenceS.pat=
ch \
+"
=20
 inherit meson pkgconfig mime-xdg
=20
--=20
2.55.0


