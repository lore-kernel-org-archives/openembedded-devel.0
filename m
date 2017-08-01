Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id F048D7835D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Aug 2017 12:11:52 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id g13so7324280ioj.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Aug 2017 05:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=TSOt0HXT0rwVIhBJ4nN0Y01rXSjNqPcfz3bF2MyMBLc=;
	b=Ge94FnCGIHaImIC+iQTSHfFXxuPmzJzjwe0OS4EUYR1jp7wFDMXit9ZjI0sOD+IVCU
	MjnSn5vQGsUcdg5Hw+K+s2c0c+6NdKFXG5HYufD0dCL01UiMhGy2rtkWfGP6pkGxHV3z
	wNPmS2GNqJRw8BnA/32UsJGOYIIkoZ4Gx/ANg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TSOt0HXT0rwVIhBJ4nN0Y01rXSjNqPcfz3bF2MyMBLc=;
	b=hdtuGl0FpJzYQbEO7nohDVvVr+qO9sNMDzBG8ZTU0Gs3HezoFN1KDdeeiPYOPpLFZK
	FGiVutMckqw86aaIka8GFzC5WULbqsTcnEBv80Xp6nQIcT7C0hDUw5Hft+i3kJOp2qj8
	1mqE3wCufR9pQ+EQPGWdpp3dD3CKbPezpIYUoUmm09fqhbdKAu40aGWTx/EvtGpJqAHT
	ypHCxZlUJ9Lo001T7UlmDknR7vUBsPCbzrW9Oxw/0cItrxv+NDSuxDk5OlvOqdfez4x8
	KeT8Ov0HXzrcqAwOXIzu/XKs1vgYMp0eY82tpb1AbumP1QsZt5RbAmHr1+gpRzvW8/Rf
	3qpA==
X-Gm-Message-State: AIVw112K7tZqJ2vnVDM6w/eIGrWPTjXf8/qW3p83IJz9xKOjPmBWzeWw
	lNbr+4UBmG0Jr8VpF64kpg==
X-Received: by 10.107.3.74 with SMTP id 71mr21777490iod.144.1501589513758;
	Tue, 01 Aug 2017 05:11:53 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8])
	by smtp.gmail.com with ESMTPSA id g75sm668171ita.23.2017.08.01.05.11.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Aug 2017 05:11:52 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Aug 2017 14:11:36 +0200
Message-Id: <20170801121136.29085-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] glmark2: Upgrade to 2017.07 release
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
X-List-Received-Date: Tue, 01 Aug 2017 12:11:53 -0000

Upstream added new dependency on udev in
a7ae55d NativeStateDRM: Probe the DRM node path to use with udev

Patch removed since it was merged upstream in
5fcdba1 wayland: Fix destruction order of surface-related objects

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 ...ace-should-be-destoryed-after-the-wl_wind.patch | 34 ----------------------
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb   |  7 ++---
 2 files changed, 3 insertions(+), 38 deletions(-)
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
index 85d7bf16e..4c5e0567b 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -8,18 +8,17 @@ LICENSE = "GPLv3+ & SGIv1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.SGI;beginline=5;md5=269cdab4af6748677acce51d9aa13552"
 
-DEPENDS = "libpng jpeg"
+DEPENDS = "libpng jpeg udev"
 
-PV = "2014.03+${SRCPV}"
+PV = "2017.07+${SRCPV}"
 
 COMPATIBLE_HOST_rpi  = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '.*-linux*', 'null', d)}"
 
 SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https \
     file://build-Check-packages-to-be-used-by-the-enabled-flavo.patch \
-    file://0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch \
     file://Fix-configure-for-sqrt-check.patch \
 "
-SRCREV = "9b1070fe9c5cf908f323909d3c8cbed08022abe8"
+SRCREV = "182dcbffe5c8483eadff025b429ee1aacc69c6c2"
 
 S = "${WORKDIR}/git"
 
-- 
2.11.0


