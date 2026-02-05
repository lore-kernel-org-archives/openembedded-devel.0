Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3DCE91295
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 08:50:49 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16632.1770281439622713427
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 00:50:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=SczV9xvK;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.46, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-658cc3fded3so94573a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 00:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1770281438; x=1770886238; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fm9MzVZcOZ3r5auKUMZS0yyxA7mWmXKFC7w3zIpmJqg=;
        b=SczV9xvKGNzLRQmP2qIH7MeK8tApY4+5SE+lApH+U7XFyBG/BiPh4UvRMGjHhSysF+
         Coj7cmpFGtK1+ALcWsFIpLSpzBaKEEBiaucAvyno7Y28OAuzQNRh3hSnJ88Pkq3SCbAz
         Cg1Ke9yWPc1VLp0+YaDr1P57aLVCC7Ndahm+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770281438; x=1770886238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fm9MzVZcOZ3r5auKUMZS0yyxA7mWmXKFC7w3zIpmJqg=;
        b=HI/DZel7rsHJrbLcCCu9efS3k4IPGhPf8KOqA19l00uJV0v8NV00RIU3Jl/Yo8XK0T
         2uUcWa1Gka/ufYrLs4ENKXie9KKJ2N1hByMK8fGNDk7b4a0l/Hbb95I8JY/PgKAxEz5z
         te3qFsJZ15R4ijDFKllhQJoJpB9oPFmvFGXKEwg9VMDGg/V6woubVHofugrGrJzfzbI1
         XATaUKR1uYEhzoOUgubGRyFNfzij0LFP72XrxOGUZsqagWB2eEw9Xsmn4sNyy6O2A8/v
         QIkSI5QB51awPkqh8I6wHJlbT6jesyw/r/EdOmaBn9DdZi7EHL/n1X5Y5UQRZzVSaldN
         TL4w==
X-Gm-Message-State: AOJu0Yw2VxpYvmm8EY8b131iNHVZ6xhrzfolQfUIjnsH1FwRsuyCJbhp
	EuFXBBuxuk6lLrm29/B0Zm5h20ojn5m3LDHNI7bAa6Nwqvshk7XxwGHkETrgSpXp6xeuTZrLRw/
	04rf5
X-Gm-Gg: AZuq6aLCQFUBv6sSYJh+vw1iqOD1Lxu+YotC0kLrUZvqj1AqeNax4qT2+4HZkW3VNtA
	/nXJcgepTbSj3rN5Uiv6A/jI+zJG1W8npCyMNrDdh+eT7oPWlzex8c0u21e5ztQYYdL7qE0Aqor
	JRgIe+5eC6jyzrgSIb5u7I6p7qI57qW6tgfReq/Rayr8KpzMtUbVewMfF5sp8Putroa6pDEuElV
	2hJKRj98oNelwlrUQXm1WpjX3m8l+can+eid8/iGRZmi7F8P6hL9wCXuzxR1wJ52g+Ny1Wtaywz
	eXjvEA7LW/EG5iCOVDzhtPeDeVF3ZCmEwFdsjyuPpOhNVz3TErps33Xr+b45HqQtYvByfzFlzCS
	GUjmwXSOhnw0X8VeLf9VnsiJJ9sSsoizIKUtvegItp+kPjBVRLFfVO/RZ5/WBUmrhy7DjsazOd7
	y91GwSgSd5GzkPpsDvRiZGHakqIskPEQXItZizyNfFAeSZoJEdDkQhBJkYTTzPBX/GsT1GAR33p
	A2ZGf7Q7Jga7EYTP5vAabN2r+2n/TTtO0o8PwDhMLjY1iFK5TBX
X-Received: by 2002:a17:907:9413:b0:b86:feb2:543 with SMTP id a640c23a62f3a-b8ea4de7d73mr192886566b.8.1770281437822;
        Thu, 05 Feb 2026 00:50:37 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9feeff2bsm206269666b.42.2026.02.05.00.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 00:50:37 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v4 2/2] kmscon: bump version to 9.3.1
Date: Thu,  5 Feb 2026 09:50:34 +0100
Message-ID: <20260205085034.10531-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205085034.10531-1-adam.duskett@amarulasolutions.com>
References: <20260205085034.10531-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 08:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124201

  - Remove upstreamed patch (commit ID: a1fc510a)

  - backspace_sends_delete is now a runtime option as
    of commit 0d6d85a8b865cac17529d049ae9a561db782ac59

  - The kmscon.conf file in the source is renamed to kms.conf.example
    To keep the same behavior as the previous versions, kms.conf.example
    is moved to ${sysconfdir}/kmscon/kmscon.conf before running sed.

  - The render-engine config option has been removed as of commit
    59eef2a154f78101195ad8ff08376e2418e773f0.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ..._conf.c-Fix-llvm-compilation-failure.patch | 40 -------------------
 .../{kmscon_9.2.1.bb => kmscon_9.3.1.bb}      | 10 ++---
 2 files changed, 3 insertions(+), 47 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/kmscon/files/0001-kmscon_conf.c-Fix-llvm-compilation-failure.patch
 rename meta-oe/recipes-graphics/kmscon/{kmscon_9.2.1.bb => kmscon_9.3.1.bb} (85%)

diff --git a/meta-oe/recipes-graphics/kmscon/files/0001-kmscon_conf.c-Fix-llvm-compilation-failure.patch b/meta-oe/recipes-graphics/kmscon/files/0001-kmscon_conf.c-Fix-llvm-compilation-failure.patch
deleted file mode 100644
index 0806f9bb04..0000000000
--- a/meta-oe/recipes-graphics/kmscon/files/0001-kmscon_conf.c-Fix-llvm-compilation-failure.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 03a330d486132e3798a125d26d4f10252ffd8e2d Mon Sep 17 00:00:00 2001
-From: Adam Duskett <adam.duskett@amarulasolutions.com>
-Date: Fri, 16 Jan 2026 11:35:39 +0100
-Subject: [PATCH] kmscon_conf.c: Fix llvm compilation failure
-
-When building with an LLVM toolchain, the follow error occurs:
-
-```
-kmscon_conf.c:757:72:
-error: expression which evaluates to zero treated as a null pointer constant
-of type 'void *' [-Werror,-Wnon-literal-null-conversion]
-CONF_OPTION(0, 0, "gpus", &conf_gpus, NULL, NULL, NULL, &conf->gpus, KMSCON_GPU_ALL),
-                                                                     ^~~~~~~~~~~~~~
-1 error generated.
-```
-
-Fix the error by adding a cast to (void *).
-
-Upstream-Status: Submitted [https://github.com/kmscon/kmscon/pull/225]
-Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
----
- src/kmscon_conf.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/kmscon_conf.c b/src/kmscon_conf.c
-index df2e51d..9e9a839 100644
---- a/src/kmscon_conf.c
-+++ b/src/kmscon_conf.c
-@@ -754,7 +754,7 @@ int kmscon_conf_new(struct conf_ctx **out)
- 		/* Video Options */
- 		CONF_OPTION_BOOL_FULL(0, "drm", aftercheck_drm, NULL, NULL, &conf->drm, true),
- 		CONF_OPTION_BOOL(0, "hwaccel", &conf->hwaccel, false),
--		CONF_OPTION(0, 0, "gpus", &conf_gpus, NULL, NULL, NULL, &conf->gpus, KMSCON_GPU_ALL),
-+		CONF_OPTION(0, 0, "gpus", &conf_gpus, NULL, NULL, NULL, &conf->gpus, (void *)KMSCON_GPU_ALL),
- 		CONF_OPTION_STRING(0, "render-engine", &conf->render_engine, NULL),
- 		CONF_OPTION_BOOL(0, "use-original-mode", &conf->use_original_mode, true),
- 		CONF_OPTION_STRING(0, "mode", &conf->mode, NULL),
--- 
-2.52.0
-
diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb b/meta-oe/recipes-graphics/kmscon/kmscon_9.3.1.bb
similarity index 85%
rename from meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
rename to meta-oe/recipes-graphics/kmscon/kmscon_9.3.1.bb
index 508f24c58e..4e27ba218a 100644
--- a/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
+++ b/meta-oe/recipes-graphics/kmscon/kmscon_9.3.1.bb
@@ -19,17 +19,13 @@ DEPENDS = "\
     udev \
 "
 
-SRC_URI = "\
-    git://github.com/kmscon/kmscon;branch=main;protocol=https \
-    file://0001-kmscon_conf.c-Fix-llvm-compilation-failure.patch \
-"
-SRCREV = "7d46650dbb0826f9b89de42f879be879391c14fd"
+SRC_URI = "git://github.com/kmscon/kmscon;protocol=https;branch=main;tag=v${PV}"
+SRCREV = "e44ff728e51c5a38b56392abe9bc3e8306db86cc"
 
 inherit meson pkgconfig systemd
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
 
-PACKAGECONFIG[backspace_sends_delete] = "-Dbackspace_sends_delete=true, -Dbackspace_sends_delete=false"
 PACKAGECONFIG[font_pango] = "-Dfont_pango=enabled, -Dfont_pango=disabled, pango"
 PACKAGECONFIG[multi_seat] = "-Dmulti_seat=enabled, -Dmulti_seat=disabled, systemd"
 PACKAGECONFIG[opengl] = "-Drenderer_gltex=enabled -Dvideo_drm3d=enabled, -Drenderer_gltex=disabled -Dvideo_drm3d=disabled, libdrm virtual/egl virtual/libgles2 virtual/libgbm"
@@ -61,9 +57,9 @@ do_install:append() {
     fi
 
     if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'true', 'false', d)}; then
+        mv ${D}${sysconfdir}/kmscon/kmscon.conf.example ${D}${sysconfdir}/kmscon/kmscon.conf
         sed -e "s@#drm@drm@g" \
             -e "s@#hwaccel@hwaccel@g" \
-            -e "s@#render-engine=gltex@render-engine=gltex@g" \
             -i ${D}${sysconfdir}/kmscon/kmscon.conf
     fi
 }
-- 
2.52.0


