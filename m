Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1AD4CA5FF1
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 01:20:18 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10932.1791163213883761094
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Oct 2026 18:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=ms2anZv7;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd90.aul.t-online.de (fwd90.aul.t-online.de [10.223.144.116])
	by mailout10.t-online.de (Postfix) with SMTP id 9383E37A26
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Oct 2026 03:20:11 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.171.181]) by fwd90.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xDXND-2qQFRB0; Mon, 5 Oct 2026 03:20:11 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/3] mpv: make the drmprime overlay framebuffer the whole frame
Date: Mon,  5 Oct 2026 03:19:55 +0200
Message-ID: <20261005011956.1224267-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005011956.1224267-1-f_l_k@t-online.de>
References: <20261005011956.1224267-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1791163211-1D7F99BF-5CA887B4/0/0 CLEAN NORMAL
X-TOI-MSGID: d13d2a1b-7d63-41e0-89ef-150856084ca8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1791163211; i=f_l_k@t-online.de;
	bh=oRWdObG8i6L9A9EUhpO0YeJGM6rzOThOtftTuEANbF8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ms2anZv77SrPzXbv4VEWunextPnPm2KXzB/1hy5kUSt3+Qc4FKKLx5FDIbqz7U/uJ
	 e+wluC2Q0D6h+J0jfVoYAJPmLWqzKgUp+SfpTc2LigPVkd2sH8dLStV4/duKwj5WUN
	 4SC6Bx2o9N4BmfxABxRdo8vy8DQtGU8+oDRJahW90RWGoMyb7dZVYRa9FdTnRqdFck
	 6NPx9zT2GvVkugll8Y/qq1KZF6hLyCtwp1sy8bT/UbhoqXdSCD4XDvHD+xk7eeZmJf
	 AE/0q+j4hwCdxd4Kx4HaYDvgxYaveLciNt/jQn/evQcUB0erD1EYbYXHhUyE5sAjN+
	 YOuuQPwnSaIkQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Oct 2026 01:20:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130621

The DRM framebuffer was made the size of the source rect while SRC_X and
SRC_Y place that rect inside the frame. With panscan or a crop the rect
reaches past the framebuffer, the atomic commit fails with ENOSPC and the
plane stays dark. The patch, Upstream-Status: Pending, makes the
framebuffer the size of the frame.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...make-the-framebuffer-the-whole-frame.patch | 24 +++++++++++++++++++
 .../recipes-multimedia/mplayer/mpv_0.41.0.bb  |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/0002-hwdec_drm=
prime_overlay-make-the-framebuffer-the-whole-frame.patch

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv/0002-hwdec_drmprime_o=
verlay-make-the-framebuffer-the-whole-frame.patch b/meta-oe/recipes-multi=
media/mplayer/mpv/0002-hwdec_drmprime_overlay-make-the-framebuffer-the-wh=
ole-frame.patch
new file mode 100644
index 0000000000..577d8cfdaa
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mpv/0002-hwdec_drmprime_overlay-=
make-the-framebuffer-the-whole-frame.patch
@@ -0,0 +1,24 @@
+From: Markus Volk <f_l_k@t-online.de>
+Subject: [PATCH] hwdec_drmprime_overlay: make the framebuffer the whole =
frame
+
+The framebuffer for the DRM plane was made the size of the source rect,
+while SRC_X and SRC_Y place that rect inside the frame. As soon as the
+rect does not start at the top left, with panscan or a video crop, it
+reaches past the framebuffer and the atomic commit fails with ENOSPC; th=
e
+plane stays dark. Make the framebuffer the size of the frame and let the
+SRC_* properties pick the part that is shown.
+
+Upstream-Status: Pending
+---
+--- a/video/out/hwdec/hwdec_drmprime_overlay.c
++++ b/video/out/hwdec/hwdec_drmprime_overlay.c
+@@ -187,7 +187,8 @@
+             int dstw =3D MP_ALIGN_UP(p->dst.x1 - p->dst.x0, 2);
+             int dsth =3D MP_ALIGN_UP(p->dst.y1 - p->dst.y0, 2);
+=20
+-            if (drm_prime_create_framebuffer(p->log, p->ctx->fd, desc, =
srcw, srch, &next_frame.fb, &p->handle_refs)) {
++            // The framebuffer is the whole frame, SRC_* pick the part =
shown
++            if (drm_prime_create_framebuffer(p->log, p->ctx->fd, desc, =
hw_image->w, hw_image->h, &next_frame.fb, &p->handle_refs)) {
+                 ret =3D -1;
+                 goto fail;
+             }
diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb b/meta-oe/r=
ecipes-multimedia/mplayer/mpv_0.41.0.bb
index 7178182c29..f37ae4ac50 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
@@ -26,6 +26,7 @@ SRCREV =3D "41f6a645068483470267271e1d09966ca3b9f413"
 SRC_URI =3D " \
     git://github.com/mpv-player/mpv;name=3Dmpv;branch=3Drelease/${@oe.ut=
ils.trim_version('${PV}', 2)};protocol=3Dhttps;tag=3Dv${PV} \
     file://0001-opengl-context-require-swap_buffers-param-for-FenceS.pat=
ch \
+    file://0002-hwdec_drmprime_overlay-make-the-framebuffer-the-whole-fr=
ame.patch \
 "
=20
 inherit meson pkgconfig mime-xdg
--=20
2.55.0


