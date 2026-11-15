Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3866.1794729018060920837
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=kUMDi1pL;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3282db206d3so7235744eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729017; x=1795333817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0kAX0G5+IT+btC601PcC52HTSA5mHSIgqtoEKFWONPA=;
        b=kUMDi1pLmWwZJlZU0/86mCNeQQDcIVqRbOpQqoLCaLm2PK4o1vuwFKSElHpDmLlteO
         ENB8BaiE2qjNo5WKcqryxcNnoEPX9rhN76Kqr5270h0kSVVKJvjZk4ThNgwl8CiQI67r
         mZze0iQTZ4SUEtAsVu7jQA/6DhFzqM9tAWbznJOAYbSdXLT3LLUcF/c8KP3M8MvTXNQc
         ZT/G9B4hbZC15HDTCMxJsxnP+V8PuswrWotEvsnbfWrM1UtN+XLsFTwOdULI9kDPG/OH
         PpEtrYCzTSgAa6PYd5TNJzn0BRK0prRX4TWtZo6Hp0CWC60WaTOlJFFEhW6sL9d5r8bF
         ar6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729017; x=1795333817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0kAX0G5+IT+btC601PcC52HTSA5mHSIgqtoEKFWONPA=;
        b=aZHKymthDnErZXSssNOdZMeNPKa1DoYXO6lmYFBknJQvAGfWTRc+o7vhWBmQqvpR0o
         QwgqLit03ogUT0FKJ/00qVfiFoMBkjQNU68t94Ow63djoS8d/i4HLDkqMGwoE9R4q2gd
         h2t8hR0IXy1OVDyRRnpMrsoKYO+ufbP9+D8LhvBzy0v4ql/vxSxM9oQw+IWn4OD3ZDZ2
         n2PRTcAbjV07glpBpswpMbJKx5CG4xNnzLD+wHWi2S4nocWq9S6n62QMDDt+ocHE9Mhn
         sYd40Y1Mt2M12/wG3tap0LSISSJB2wgC8hxEOBwSu7q906Ovz1lENfsgZYWdodpWmzuS
         BvRA==
X-Gm-Message-State: APuU4Z82SUdV8u0d6ZTywX0ZTX9s0grUVTq1z3fTzBYuFDAP5ChrPOmH
	vDqaxLRu3QmwrzpLJ2ylaQ5K8DBi2H0cPoOzoHoIZCst5KJYNc9GPWW/c1ad6J/5
X-Gm-Gg: AYBFou0+0INPREa48JbfTFseJuEIpkrJV1nqFjkSzcIiJwb//wDfcb8wXxiAIBCvOgU
	LOVEsyc7a8XMdYBVTodHJBmJ74Eo0ucjmp9e33gXFFd1pIgOMDZIq33pENgWzdDqvBv5t1VMpyx
	fpiVxsv6pUfvZ7BAJgFQKhX1lo8MzoEl1PJ6fOOjVLwgjXw+zPUPy4UxkC9Y9O1N8Q0GUy+KW15
	f+F5FDp64XBCX7Nn3puHpHQq6AfB4AATYxhCE0N/CjM0il4u9gvre4ynGZzoc0zV3pG8Jde71O8
	Db1Mq6qYUj9y6igfsIlcETghk1Tw0lC4qtmLTsX8XIoLNLySpR/P8w6F871mhzETUtZ0LLQ0pob
	RrKLO02m0Qz3OECafHw8SVifW9pw8iazaqC+m59XnougOjSi0/0nhOs/yVRS5zTztW50xA6NftN
	abb4qsB9zhDgmYp65B17ylzVv9EOrBJCftrb/R2fubWlkVQQvfrlLiHgoA3jtBhOuRtgfl170IU
	rkcV2SnHe7sVeCOP/5CEcwn/J2CttdVeEmItnjEoUc8x1H/ofc6boA4mk8hLspOH0dco1s8+EHs
	SXcWAwTx5NQChdFynWXVX40HI4nM3b0cF3nBdCN64TUNSe4H1K91L4LW2J5hSNxhABT8vL20QXY
	9an+TzD3ZjNyr5G1dOyPvfAucDVZmx15OKtmbbAF8cO5M2RRGQfiX/PGSNUyzchtIMSvN1BAYY8
	5PXs+XheYnArPDhIbTPCJx4xlAHj2DP+Mv6TNhmO+w7F/UNVNDpochx8jd+W7Gkd321mSxqdhpZ
	tM+mEKsiPC3MLZ0U2OlOgotkFq6Z7Bzbd/J5DtbUEg60TZmikC3wgn/ByasC2X2RgNMfi/ZtoQb
	84jrPBx5rCO8OYVUODjo2HVMCw==
X-Received: by 2002:a05:7300:c594:b0:36f:a72d:29f with SMTP id 5a478bee46e88-37967ae6bf2mr8737041eec.34.1794729017422;
        Sat, 14 Nov 2026 23:50:17 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 35/96] mpv: upgrade 0.41.0 -> 0.42.0
Date: Sat, 14 Nov 2026 23:48:13 -0800
Message-ID: <20261115074918.2932593-35-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132305
Content-Type: text/plain; charset="utf-8"

Drop both patches, included in this release. Needs libplacebo >= 7.387.0.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...equire-swap_buffers-param-for-FenceS.patch | 35 -------------------
 ...make-the-framebuffer-the-whole-frame.patch | 24 -------------
 .../mplayer/{mpv_0.41.0.bb => mpv_0.42.0.bb}  |  4 +--
 3 files changed, 1 insertion(+), 62 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/0001-opengl-context-require-swap_buffers-param-for-FenceS.patch
 delete mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/0002-hwdec_drmprime_overlay-make-the-framebuffer-the-whole-frame.patch
 rename meta-oe/recipes-multimedia/mplayer/{mpv_0.41.0.bb => mpv_0.42.0.bb} (95%)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv/0001-opengl-context-require-swap_buffers-param-for-FenceS.patch b/meta-oe/recipes-multimedia/mplayer/mpv/0001-opengl-context-require-swap_buffers-param-for-FenceS.patch
deleted file mode 100644
index 70ba81b34c..0000000000
--- a/meta-oe/recipes-multimedia/mplayer/mpv/0001-opengl-context-require-swap_buffers-param-for-FenceS.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f74adc4243bd9e1a8ee96d187c939e6232510650 Mon Sep 17 00:00:00 2001
-From: Dudemanguy <random342@airmail.cc>
-Date: Thu, 22 Jan 2026 11:12:22 -0600
-Subject: [PATCH] opengl/context: require swap_buffers param for FenceSync
-
-Commits 8854c742711705be1fcfcc6a5875960a3e2593dc and
-5ae0e0ff9a6974453c1aba41ddc8442d12ac9264 eliminated the external
-swapchain API that the render backend (vo_libmpv) was previously using.
-However, it was missed that this was being used to skip the
-gl->FenceSync calls and that logic change was not properly accounted
-for. This meant that vo_libmpv would leak fences since
-ra_gl_ctx_swap_buffers is never called to clean them up.
-
-Fix this by making sure the ra_ctx_params have swap_buffers defined
-before calling gl->FenceSync. All platforms are required to implement
-this anyway with the exception of vo_libmpv since it's a funny special
-case. Fixes #17217.
-Upstream-Status: Backport [https://github.com/mpv-player/mpv/commit/f74adc4243bd9e1a8ee96d187c939e6232510650]
----
- video/out/opengl/context.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/video/out/opengl/context.c b/video/out/opengl/context.c
-index 86e8d5daac8b4..86e5c797d670a 100644
---- a/video/out/opengl/context.c
-+++ b/video/out/opengl/context.c
-@@ -232,7 +232,7 @@ bool ra_gl_ctx_submit_frame(struct ra_swapchain *sw, const struct vo_frame *fram
-     if (p->opts->use_glfinish)
-         gl->Finish();
- 
--    if (gl->FenceSync) {
-+    if (gl->FenceSync && p->params.swap_buffers) {
-         GLsync fence = gl->FenceSync(GL_SYNC_GPU_COMMANDS_COMPLETE, 0);
-         if (fence)
-             MP_TARRAY_APPEND(p, p->vsync_fences, p->num_vsync_fences, fence);
diff --git a/meta-oe/recipes-multimedia/mplayer/mpv/0002-hwdec_drmprime_overlay-make-the-framebuffer-the-whole-frame.patch b/meta-oe/recipes-multimedia/mplayer/mpv/0002-hwdec_drmprime_overlay-make-the-framebuffer-the-whole-frame.patch
deleted file mode 100644
index 577d8cfdaa..0000000000
--- a/meta-oe/recipes-multimedia/mplayer/mpv/0002-hwdec_drmprime_overlay-make-the-framebuffer-the-whole-frame.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From: Markus Volk <f_l_k@t-online.de>
-Subject: [PATCH] hwdec_drmprime_overlay: make the framebuffer the whole frame
-
-The framebuffer for the DRM plane was made the size of the source rect,
-while SRC_X and SRC_Y place that rect inside the frame. As soon as the
-rect does not start at the top left, with panscan or a video crop, it
-reaches past the framebuffer and the atomic commit fails with ENOSPC; the
-plane stays dark. Make the framebuffer the size of the frame and let the
-SRC_* properties pick the part that is shown.
-
-Upstream-Status: Pending
----
---- a/video/out/hwdec/hwdec_drmprime_overlay.c
-+++ b/video/out/hwdec/hwdec_drmprime_overlay.c
-@@ -187,7 +187,8 @@
-             int dstw = MP_ALIGN_UP(p->dst.x1 - p->dst.x0, 2);
-             int dsth = MP_ALIGN_UP(p->dst.y1 - p->dst.y0, 2);
- 
--            if (drm_prime_create_framebuffer(p->log, p->ctx->fd, desc, srcw, srch, &next_frame.fb, &p->handle_refs)) {
-+            // The framebuffer is the whole frame, SRC_* pick the part shown
-+            if (drm_prime_create_framebuffer(p->log, p->ctx->fd, desc, hw_image->w, hw_image->h, &next_frame.fb, &p->handle_refs)) {
-                 ret = -1;
-                 goto fail;
-             }
diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.42.0.bb
similarity index 95%
rename from meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
rename to meta-oe/recipes-multimedia/mplayer/mpv_0.42.0.bb
index f37ae4ac50..91085a6d33 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.42.0.bb
@@ -22,11 +22,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=570a9b3749dd0463a1778803b12a6dce"
 # unbuildable "Nothing PROVIDES 'ffmpeg'" dependency.
 LICENSE_FLAGS = "commercial"
 
-SRCREV = "41f6a645068483470267271e1d09966ca3b9f413"
+SRCREV = "b0841e8c4d156b8403dc1876c4cbd9011eb583f3"
 SRC_URI = " \
     git://github.com/mpv-player/mpv;name=mpv;branch=release/${@oe.utils.trim_version('${PV}', 2)};protocol=https;tag=v${PV} \
-    file://0001-opengl-context-require-swap_buffers-param-for-FenceS.patch \
-    file://0002-hwdec_drmprime_overlay-make-the-framebuffer-the-whole-frame.patch \
 "
 
 inherit meson pkgconfig mime-xdg
