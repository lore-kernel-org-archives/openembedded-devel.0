Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1954.1795113489213304012
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:38:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=fiSQJgoY;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8c70c2ab5a2so62536b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113488; x=1795718288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ens5hGzrN+wmZgQXRtezOl4joYugEsjZy7sXJkemFY0=;
        b=fiSQJgoYfQituHH7BNxLT0jk0NQgwcVojzVTofaL7eBkxKX6kAZiv8HpCSY66E9Cmb
         sozeehOUoe2X6oLCvX7sqWYOCt908Rotn1zQSwq/W5Sv4nS194pDyrr5z1aiScnypri5
         Whir/+aPgz78GiF/rNdURvv0b9L6ccrK7pJUmqGeEkR1A2sKLXTncmiNQnVd7TGrSDhP
         PD+Dmkg6h19psVazuhDnu2TyGFjQjygbgA0J+g6I2tRyjZgdFwJLFGN5zP26r10Xnh5M
         ymXk0ZJeAd1Q+eBegFIFnoTM+th4N0IWlGCOIGJ6UeMogdXqDCKATAMFeBXsGIpHccJn
         2Abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113488; x=1795718288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ens5hGzrN+wmZgQXRtezOl4joYugEsjZy7sXJkemFY0=;
        b=mC1Y4AYHV1PQZRXlUt2fKib09zD2Dost5zTd0PK7LLhPRPe8wqr5f6RpmwObQbsWpq
         zCUF2lrzq0jnZkv1Ex219kO0gPqIeSMj5zhoQKgKMm4qMCNzqsUTjs1koGAOEmd7kD7H
         QWvpkxWsaLJWh+VZ79jOYiPdlmN+z1/ooyVm59RHYr1blGePF5GTOLIoMMlTQdw4p59R
         92rssf8gfCMOVAMxtCVKHXNSbKnOKzCUL5kJEw98csJU9w97ylos4QgoT9IsdSMNe2kA
         Dfo08UnhTZX1PQtJ9IRorQXfkkkmYlZa+63kAuToRn1jLl2tJOb8RhJMJxkHtX5NiDe2
         0/CQ==
X-Gm-Message-State: APuU4Z9+PK1cbkqxvCRARpGJ2ozqB61yAF15ZwNqxewu/aLGBiBCK8/0
	agAyNj1QaeW6gqzr2CM6eNDrmFlHrb6uakmSlqeB+EBBuWLQoPxn5apBApu3Lg==
X-Gm-Gg: AYBFou3U3yl0iMFNyj/zjmQF0Jj4U62K1zfYoemU4wpO1RKO+d992h4hUyabngLT0/j
	/is/0/TXtiS5bVlhy5GrjdlGyEevt1cetOZ9UJm+/oMq4mgvZw7Ua4g7FzCq2iKWOTMCZaEYzkt
	OpQwfN40+braD2YRjtHnzWlmmmVpOIfOEZUn1dt0eM3Q46m+7RN2nXAV1PPmrXCzl7USrOREPoz
	5P4pp/Wf2dlHSgtshaqN9Fp72cvmsIkEUEYZdtBX19CakFuvpqBKkmR5APruZuk1m7ZXABIJ67l
	E5QdVBSiWqEExHKs+wyRUi2bLvxK6kWJ0XHzTlEiJb6VZpFEEQppZx8GOB8Backfo/HCTk2qxzU
	G8/cNOEDfGAU1ITpfCfHW30nvz8G6e5LndFeoE1u+yJr28itIJphsJUka1phV3KvIFIzujtKhZx
	ruV2mgX7N6wdhiOa3NCusBT9RNw72CMABj/HB+Ae5lJGAI6V6A1cJwP6g5L/ChZtxZTwfQaCuLB
	aHCOsNBaVxUWIct6Qr5IWkHhPsKHUGiw+Z8FqEibdyJNhUK1rOpcaGA5LQnCutONNzbxxHDfbvv
	R5QPnz0l+ZRKt3xuxWzKT9hTLIouOvK4MvYaeGqtYL/5zgWLNCfsP72d85V2Z2yNVwXbGQf22Rv
	jqIDeIk8=
X-Received: by 2002:a05:6a00:23c6:b0:88d:8074:1a9e with SMTP id d2e1a72fcca58-8c8793b79camr435685b3a.3.1795113488528;
        Thu, 19 Nov 2026 10:38:08 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:38:08 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 53/64] mpv: make the drmprime overlay framebuffer the whole frame
Date: Fri, 20 Nov 2026 07:33:21 +1300
Message-ID: <e5811375bf9a6da5147c86c39aaf5da98345c681.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:38:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132743
Content-Type: text/plain; charset="utf-8"

From: Markus Volk <f_l_k@t-online.de>

The DRM framebuffer was made the size of the source rect while SRC_X and
SRC_Y place that rect inside the frame. With panscan or a crop the rect
reaches past the framebuffer, the atomic commit fails with ENOSPC and the
plane stays dark. The patch, Upstream-Status: Pending, makes the
framebuffer the size of the frame.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit d364539dc6133e29c7eaf26b18445cd1897b33c2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...make-the-framebuffer-the-whole-frame.patch | 24 +++++++++++++++++++
 .../recipes-multimedia/mplayer/mpv_0.41.0.bb  |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/0002-hwdec_drmprime_overlay-make-the-framebuffer-the-whole-frame.patch

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv/0002-hwdec_drmprime_overlay-make-the-framebuffer-the-whole-frame.patch b/meta-oe/recipes-multimedia/mplayer/mpv/0002-hwdec_drmprime_overlay-make-the-framebuffer-the-whole-frame.patch
new file mode 100644
index 0000000000..577d8cfdaa
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mpv/0002-hwdec_drmprime_overlay-make-the-framebuffer-the-whole-frame.patch
@@ -0,0 +1,24 @@
+From: Markus Volk <f_l_k@t-online.de>
+Subject: [PATCH] hwdec_drmprime_overlay: make the framebuffer the whole frame
+
+The framebuffer for the DRM plane was made the size of the source rect,
+while SRC_X and SRC_Y place that rect inside the frame. As soon as the
+rect does not start at the top left, with panscan or a video crop, it
+reaches past the framebuffer and the atomic commit fails with ENOSPC; the
+plane stays dark. Make the framebuffer the size of the frame and let the
+SRC_* properties pick the part that is shown.
+
+Upstream-Status: Pending
+---
+--- a/video/out/hwdec/hwdec_drmprime_overlay.c
++++ b/video/out/hwdec/hwdec_drmprime_overlay.c
+@@ -187,7 +187,8 @@
+             int dstw = MP_ALIGN_UP(p->dst.x1 - p->dst.x0, 2);
+             int dsth = MP_ALIGN_UP(p->dst.y1 - p->dst.y0, 2);
+ 
+-            if (drm_prime_create_framebuffer(p->log, p->ctx->fd, desc, srcw, srch, &next_frame.fb, &p->handle_refs)) {
++            // The framebuffer is the whole frame, SRC_* pick the part shown
++            if (drm_prime_create_framebuffer(p->log, p->ctx->fd, desc, hw_image->w, hw_image->h, &next_frame.fb, &p->handle_refs)) {
+                 ret = -1;
+                 goto fail;
+             }
diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
index 7178182c29..f37ae4ac50 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
@@ -26,6 +26,7 @@ SRCREV = "41f6a645068483470267271e1d09966ca3b9f413"
 SRC_URI = " \
     git://github.com/mpv-player/mpv;name=mpv;branch=release/${@oe.utils.trim_version('${PV}', 2)};protocol=https;tag=v${PV} \
     file://0001-opengl-context-require-swap_buffers-param-for-FenceS.patch \
+    file://0002-hwdec_drmprime_overlay-make-the-framebuffer-the-whole-frame.patch \
 "
 
 inherit meson pkgconfig mime-xdg
