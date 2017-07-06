Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8781077BD9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jul 2017 20:21:30 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id r30so12072552qtc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jul 2017 13:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=RXl/CNaybimbztee78QjD13CAfC65O2vmVPSX7F7CWg=;
	b=O4nKNOwcBlu9a+4AwCpE4Czj+ffeOMaMPe5T3swdJ/igHcYZCR6Bx5kmB9k3QooI1b
	fZA4k4Zx3BmpGtUEOVKDl6/Ev4o5qammNaGmP9hHPXf5FpSDtRnlw7ot5tKKsXslHX5m
	P7iQu9PiP680IX0a3Bq1R3GcY0QHekpX/O77mJGZZVG+Mjh1L/aLGSkqTgw40VbbqibH
	iLNVr8i9YinOSJTdgFJZMs3IFAeyrKN/2TQoxp0jUqRSc4xs5rIIzag5V2lC84Fu6sWj
	hq3/G65gShQ444uaTocvS3wWyfzsSJkEiESpFA8ut4H7HaDU7hI4g/ko91fMPgcgIeeK
	ss9g==
X-Gm-Message-State: AKS2vOzo6wNhA4rhE8gXNnONO1npJj3qM/8pZPPSt/Tzddt1Fhh4mDzB
	l8ljkUYupzcit0A/
X-Received: by 10.237.63.141 with SMTP id s13mr66054163qth.61.1499372491247;
	Thu, 06 Jul 2017 13:21:31 -0700 (PDT)
Received: from localhost.localdomain ([179.105.243.125])
	by smtp.gmail.com with ESMTPSA id w72sm867960qka.63.2017.07.06.13.21.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 06 Jul 2017 13:21:29 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 06 Jul 2017 17:21:20 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Thu,  6 Jul 2017 17:21:15 -0300
Message-Id: <20170706202116.8293-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.13.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe PATCH] glmark2: Bump to 9fa385e revision
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
X-List-Received-Date: Thu, 06 Jul 2017 20:21:32 -0000

This includes following changes:

9fa385e GLStateEGL: Use eglGetPlatformDisplayEXT when possible
ac983d7 wayland: Don't store the opaque region unnecessarily
5fcdba1 wayland: Fix destruction order of surface-related objects
bf766f8 SceneTerrain: Add missing header file for std::abs

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 ...ace-should-be-destoryed-after-the-wl_wind.patch | 34 ----------------------
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb   |  3 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/glmark2/files/0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch

diff --git a/meta-oe/recipes-benchmark/glmark2/files/0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch b/meta-oe/recipes-benchmark/glmark2/files/0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch
deleted file mode 100644
index 439508102..000000000
--- a/meta-oe/recipes-benchmark/glmark2/files/0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 9c74ec83e2929b1d5ab65d5137b6ba42edeb332d Mon Sep 17 00:00:00 2001
-From: Yong Gan <b45748@freescale.com>
-Date: Tue, 27 Oct 2015 18:15:20 +0800
-Subject: [PATCH] Fix: wl_surface should be destoryed after the wl_window
- destroyed.
-
-Upstream-Status: Submitted [https://github.com/glmark2/glmark2/issues/12]
-
-Signed-off-by: Yong Gan <b45748@freescale.com>
-
----
- src/native-state-wayland.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/native-state-wayland.cpp b/src/native-state-wayland.cpp
-index 41fc743..cdcdf34 100644
---- a/src/native-state-wayland.cpp
-+++ b/src/native-state-wayland.cpp
-@@ -56,10 +56,10 @@ NativeStateWayland::~NativeStateWayland()
-             wl_shell_surface_destroy(window_->shell_surface);
-         if (window_->opaque_reqion)
-             wl_region_destroy(window_->opaque_reqion);
--        if (window_->surface)
--            wl_surface_destroy(window_->surface);
-         if (window_->native)
-             wl_egl_window_destroy(window_->native);
-+        if (window_->surface)
-+            wl_surface_destroy(window_->surface);
-         delete window_;
-     }
- 
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 85d7bf16e..5d05c47cd 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -16,10 +16,9 @@ COMPATIBLE_HOST_rpi  = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics',
 
 SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https \
     file://build-Check-packages-to-be-used-by-the-enabled-flavo.patch \
-    file://0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch \
     file://Fix-configure-for-sqrt-check.patch \
 "
-SRCREV = "9b1070fe9c5cf908f323909d3c8cbed08022abe8"
+SRCREV = "9fa385e86950d18c5ca1f64ca5fc323348a336fa"
 
 S = "${WORKDIR}/git"
 
-- 
2.13.2


