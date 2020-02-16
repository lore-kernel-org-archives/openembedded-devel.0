Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id D9F9761024
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Feb 2020 21:22:52 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id m16so17263989wrx.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Feb 2020 13:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4r2yANKX5LzAt94Nvh2n31XldgAmUr9xAAPW1q0LMMo=;
	b=i1IUrenf+tRbCLM/np7hNbYp+0h6kIyQbFzjdSEraN1jADr9ULlceP9Ys1U/H5bHJQ
	Ebyx9DIPpw7gna7VAMwEWr04D5QbwTt6uCwLxCQhXdD2Bc/x7woygMBGglHYB372gQsr
	dRueklacuHTc98OGhmLd9NnRWQR+yyOYt9cNa2mPbcpRtqjOwRUTut4uaGm3UsF4x+k2
	i3eJwNQ+y1OjfxedFq1UrahZ+GwFgxjR4yEts+QnqAyTdTlhtgKgXlrKdkJcbSoxgpHv
	xb3+MZeUrYBGCl0Frvso1gUgsNLfXXGcNLfIe5rTvK6Uq/4Xlpy8VVkLnY4jVWmK/Iv8
	JV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4r2yANKX5LzAt94Nvh2n31XldgAmUr9xAAPW1q0LMMo=;
	b=WtwTIJvAOWdIV2c+4KSmq3pYN7JzRwGEgFzW+ZqpfSYRa+ao4nF72GizOq63KSpXn6
	CEyzVrhDDZqof7rZkXzV1kHvTR480AusSYekVhrb+vK127Rf3qLGAbYmauRalwWOe2Qu
	1yUUP1lItC2m5jtZcg5f/XcP91xd95nFeEio+diEXcRk0Txn2/kPvg8dg84y4FIrf4cm
	MUE9pq6DDfuaZwHAqiBuHzk9y1YwSphuTSZ7uEyBf/Z0bKJwmw1rSitd10OXFLpSxR2w
	NOD84HSOoQ1+bpOqTqciZV/3KL00P0f8kgsEszeXEopERPfyT9eqCOBalS6J3fb56tT8
	w65A==
X-Gm-Message-State: APjAAAXQsiYJ9F4xFKh738R3gcnd3oCTDZ3WwtrahuE1xxEZtTGTgr4+
	YzU/Pw8JIFo2mxawNRJknBltU9il
X-Google-Smtp-Source: APXvYqwNrdcu/bVmy22sZw4B8vHFv1Y4nHPdAwr38baobOfKy5e4HHq0pwlqY4nSkvJpd7nMydZoGg==
X-Received: by 2002:a05:6000:118d:: with SMTP id
	g13mr16653779wrx.141.1581888173109; 
	Sun, 16 Feb 2020 13:22:53 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0689870B30080CC68E0727.dip0.t-ipconnect.de.
	[2003:f0:7f06:8987:b30:80c:c68e:727])
	by smtp.gmail.com with ESMTPSA id
	e22sm18296776wme.45.2020.02.16.13.22.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 13:22:52 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Feb 2020 22:22:42 +0100
Message-Id: <20200216212244.30653-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/3] mutter: upgrade 3.34.3 -> 3.34.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 16 Feb 2020 21:22:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Backported patch is included see '<-' in annnouncement:

News
====

* Handle mode set race conditions more gracefully [Jonas; !1007]
* Fix fallback to GLES2 [Adam; #635] <-
* Fix interoperation with wl_data_device_manager v1 [Carlos; #965]
* Fix visual glitches with offscreen effects applied [Georges; !992]
* Favor text over images in clipboard manager [Carlos; #919]
* Fixes crashes [Jonas, Carlos; !961, !869]
* Plugged memory leaks [Sebastian, Adam; !1002, !1011]
* Misc. bug fixes [Carlos, Robert, Olivier; !1005, #878, !1031, !1034, !1040]

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../mutter/0001-cogl-Fix-GLES2-fallback.patch | 37 -------------------
 .../{mutter_3.34.3.bb => mutter_3.34.4.bb}    |  5 +--
 2 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/mutter/mutter/0001-cogl-Fix-GLES2-fallback.patch
 rename meta-gnome/recipes-gnome/mutter/{mutter_3.34.3.bb => mutter_3.34.4.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter/0001-cogl-Fix-GLES2-fallback.patch b/meta-gnome/recipes-gnome/mutter/mutter/0001-cogl-Fix-GLES2-fallback.patch
deleted file mode 100644
index ec9200042..000000000
--- a/meta-gnome/recipes-gnome/mutter/mutter/0001-cogl-Fix-GLES2-fallback.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From f4f7e31303d78b2a8a0881b61311b8d750301b8f Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Tue, 29 Oct 2019 11:53:27 -0400
-Subject: [PATCH] cogl: Fix GLES2 fallback
-
-Say you're using intel gen3, you poor soul. Your big-GL maxes out at 1.5
-unless you use dirty tricks, but you do have GLES2. We try to fall back
-to GLES in this case, but we only ever say eglBindAPI(EGL_OPENGL_API).
-So when we go to do CreateContext, even though we think we've requested
-GLES 2.0, the driver will compare that "2.0" against the maximum big-GL
-version, and things will fail.
-
-Fix this by binding EGL_OPENGL_ES_API before trying a GLES context.
-
-https://gitlab.gnome.org/GNOME/mutter/issues/635
-
-Upstream-Status: Applied
----
- cogl/cogl/winsys/cogl-winsys-egl.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/cogl/cogl/winsys/cogl-winsys-egl.c b/cogl/cogl/winsys/cogl-winsys-egl.c
-index 99dcb8bf3..f2b439a67 100644
---- a/cogl/cogl/winsys/cogl-winsys-egl.c
-+++ b/cogl/cogl/winsys/cogl-winsys-egl.c
-@@ -329,6 +329,8 @@ try_create_context (CoglDisplay *display,
-   if (renderer->driver == COGL_DRIVER_GL ||
-       renderer->driver == COGL_DRIVER_GL3)
-     eglBindAPI (EGL_OPENGL_API);
-+  else if (renderer->driver == COGL_DRIVER_GLES2)
-+    eglBindAPI (EGL_OPENGL_ES_API);
- 
-   egl_attributes_from_framebuffer_config (display,
-                                           &display->onscreen_template->config,
--- 
-2.21.0
-
diff --git a/meta-gnome/recipes-gnome/mutter/mutter_3.34.3.bb b/meta-gnome/recipes-gnome/mutter/mutter_3.34.4.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/mutter/mutter_3.34.3.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_3.34.4.bb
index 9afa269ed..b4ddc5dad 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_3.34.3.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_3.34.4.bb
@@ -22,9 +22,8 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gettext upstream-version-is-even features_check
 
-SRC_URI[archive.md5sum] = "c3ee46ae7b84d9d0e8dd3f9e04a61ab1"
-SRC_URI[archive.sha256sum] = "cdf57ddd0bc35db952b732b77c796760e65d1ce2f7df31273e5c8d4759ed4a89"
-SRC_URI += "file://0001-cogl-Fix-GLES2-fallback.patch"
+SRC_URI[archive.md5sum] = "de19a6de98a2250dd7efdfca14359e39"
+SRC_URI[archive.sha256sum] = "0134513515f605dd0858154d0b54d2e23c5779d52590533e266d407251e20ba2"
 
 # x11 is still manadatory - see meson.build
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.21.0


