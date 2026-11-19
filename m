Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1907.1795113486193319101
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:38:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=RU7QehHK;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so67481b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113485; x=1795718285; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sz/oXJGQuT7STL02UEDYZ3i8MsiPJdSnDSgvN9ru3TI=;
        b=RU7QehHKwT4J8qUnr5d2/QFj//GyyeG7Qp7SyI7qsBhWfeOBAMyaBDmT+UKyUmnV+X
         /3uG7igz12R3FAgocFyWn4ZKBtYDMMHFxeF7zMILsOpfU9tKdYNP9pyZPkRBupjyn75N
         4ScSKxs4Uk2DNKzus1VYGbCftEKk/Cgb2FcjTZv8Vd4gIzDK3Brhi76vnubCRNWGnUL2
         xdr0UGLD44xE7tm0nllLxKvx1I+EHDN6toJhGFhjucxIQ9IUwfRyLOf+ydah7xzO5y3V
         97HLEKaiJoGPccH8qmLEtAlCFgv/3zGXELlKVEprCoNpmtzDe3WKncmoDuOcmgau0Y7B
         4lBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113485; x=1795718285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sz/oXJGQuT7STL02UEDYZ3i8MsiPJdSnDSgvN9ru3TI=;
        b=n1M3YZPC30EFh4Ksiwg/M1KPxEJKcRi2XYmEFadYTTPh9i2vkIunfF/8j19baAQSY2
         SgsBPeYCTejSr3ixmK2Ar68TRe1wvcjZaFfNIRo/NNM1WWzm6xUv3JV11cBt8T4u+vbj
         muzA7YYUb4Tup2vh6Ad6tiaqkp1rvjkvWJEwY3vKXqfmHRzL5QKobhtb+LRpwGFZxDFK
         SyLGVV4ZXd45bfy5nCp8shEIbOsfuoC7wjfOVH83YKnWdFM3KTq7PTClFKTuk5Q2AK5c
         lYWHRFGHwVloEdoww54V2pmW1o8dEPcCVGvmTnt6VZO3Z2GZv2CjUvbQizbM2TkIn52c
         5Uhw==
X-Gm-Message-State: APuU4Z/TXFkSB7O8s6BS4k8YkNsfm6RUlxDMhC0aLdgk9K2VksxhCQUb
	B11P7yH4CMGCdJdpuQDOmRel+NKhu1MnElP9BxJVFHCzgLy7vGerKYKdqwU66Q==
X-Gm-Gg: AYBFou1ed+oztDRCzhK/Tn0/8d/W6WzsXJ89F5yLHc06mZqaE0lm/vFF+n0AEPlTc/i
	c/W/jkyN0Tfkn2VExp1ajAfuWg5OuhIXuRR9B7zX9QfCONU4d1ftxdmWC43FB1FLj4U31CSKMOq
	Tsr8qQe7YqP3RxJnlAzN6/VfcmsM8NHhSW9addsSFWXHNaLqtvoHQQo4VQaQYguUkKmAli4ivRb
	oqlWgLNycRYTB8dMMX1UwVjoz6U3gTaHNC/bNDX4oZMbi4Rc1jHJZB+zKLLE47NLnWQE/7mOPSx
	zBlmwoL4DE+5urPtbtJ0BKjuYDjttPYzJT3DDY/+nYOvryY/UEG7Yt1lP4SfZaHPtHRjdmvKOCx
	TrhEr2alLizJkPF3q14C/FEJFjdteFbBcawAcSGdWFkiiIEu3ec4UTWF/UDQnHkjX5B3DHb2P3z
	c6RSLVH00kpCpd2PeNs1wqgKMGY26CnPgmACgsXXFx/vCIwhFKWCLZTSNUFdZ3hPbITvy7cUuxa
	fTR3BF200AfmQEX9+p51XSpQWwBsffEdb+D4cacxhUUzfF96odiR/NC6XhTyBcNUFfO+j0sKc84
	RiYl7TmGotFPNgYEp+WV8ODCzM6Thqjh33CR7ln16wn0wKRuQXooMBKJmEeltqV1wR/W9AyrVgB
	cGXC2Esarvg==
X-Received: by 2002:a05:6a21:6e4a:b0:3f9:da7f:317a with SMTP id adf61e73a8af0-4014ee4f4cbmr446115637.70.1795113485499;
        Thu, 19 Nov 2026 10:38:05 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:38:05 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 52/64] mpv: fix a file descriptor leak in the render API
Date: Fri, 20 Nov 2026 07:33:20 +1300
Message-ID: <cab7d3850d61af23c0db5522b1051e1cf38f05ce.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:38:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132742
Content-Type: text/plain; charset="utf-8"

From: Markus Volk <f_l_k@t-online.de>

With the OpenGL render API (vo_libmpv) every frame left a fence behind
that nothing cleaned up. On v3d each one holds a sync file, so after about
a minute of video the process ran into the open file limit and the
picture stopped ("MESA: error: Export failed"). Backport the upstream
fix.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 2826f6233d450a7cb788a9e04f77f2cd55d951f0)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...equire-swap_buffers-param-for-FenceS.patch | 35 +++++++++++++++++++
 .../recipes-multimedia/mplayer/mpv_0.41.0.bb  |  5 ++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/0001-opengl-context-require-swap_buffers-param-for-FenceS.patch

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv/0001-opengl-context-require-swap_buffers-param-for-FenceS.patch b/meta-oe/recipes-multimedia/mplayer/mpv/0001-opengl-context-require-swap_buffers-param-for-FenceS.patch
new file mode 100644
index 0000000000..70ba81b34c
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mpv/0001-opengl-context-require-swap_buffers-param-for-FenceS.patch
@@ -0,0 +1,35 @@
+From f74adc4243bd9e1a8ee96d187c939e6232510650 Mon Sep 17 00:00:00 2001
+From: Dudemanguy <random342@airmail.cc>
+Date: Thu, 22 Jan 2026 11:12:22 -0600
+Subject: [PATCH] opengl/context: require swap_buffers param for FenceSync
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
+Upstream-Status: Backport [https://github.com/mpv-player/mpv/commit/f74adc4243bd9e1a8ee96d187c939e6232510650]
+---
+ video/out/opengl/context.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/video/out/opengl/context.c b/video/out/opengl/context.c
+index 86e8d5daac8b4..86e5c797d670a 100644
+--- a/video/out/opengl/context.c
++++ b/video/out/opengl/context.c
+@@ -232,7 +232,7 @@ bool ra_gl_ctx_submit_frame(struct ra_swapchain *sw, const struct vo_frame *fram
+     if (p->opts->use_glfinish)
+         gl->Finish();
+ 
+-    if (gl->FenceSync) {
++    if (gl->FenceSync && p->params.swap_buffers) {
+         GLsync fence = gl->FenceSync(GL_SYNC_GPU_COMMANDS_COMPLETE, 0);
+         if (fence)
+             MP_TARRAY_APPEND(p, p->vsync_fences, p->num_vsync_fences, fence);
diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
index c8a0222ebf..7178182c29 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
@@ -23,7 +23,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=570a9b3749dd0463a1778803b12a6dce"
 LICENSE_FLAGS = "commercial"
 
 SRCREV = "41f6a645068483470267271e1d09966ca3b9f413"
-SRC_URI = "git://github.com/mpv-player/mpv;name=mpv;branch=release/${@oe.utils.trim_version('${PV}', 2)};protocol=https;tag=v${PV}"
+SRC_URI = " \
+    git://github.com/mpv-player/mpv;name=mpv;branch=release/${@oe.utils.trim_version('${PV}', 2)};protocol=https;tag=v${PV} \
+    file://0001-opengl-context-require-swap_buffers-param-for-FenceS.patch \
+"
 
 inherit meson pkgconfig mime-xdg
 
