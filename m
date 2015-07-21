Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2D8F273694
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 12:52:22 +0000 (UTC)
Received: by qgii95 with SMTP id i95so55760611qgi.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 05:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization;
	bh=9EjguzYtKpCW1ZG3BidIbLTzZfWxZGCbBz57n2X93tA=;
	b=fOx+1WyoGB1E4xfatOwFmgElT1Ic3fYL0IUS/KqvEKA1pSukiwV1OexrU0KwHypXzW
	alpTpzE5kpJe5S+rKQ0co1fzjnHkc4wDFwaLDCjjH5Gp+XK93F9hAYWBrATJwKXmIVJx
	bfNQTHx1aqXVdXFvB7Mu6/b4vYgW2mp77zVOK4Arjcebr1cypabV0e8rQyt67lTBH/pI
	L7Jxe8ur7NSHkE3fveSaq7fcCXvwPof5chkHS9h37ZWT+6MgnEuHGIFNa70SHvD+HZyI
	jAJg2D4Eq3lMZej4aF5ObR2q46AECWyLJ4ZS++fNiFZSNtsrd/bLfCZRGhBjO9jKcwJ1
	uYTw==
X-Received: by 10.140.234.204 with SMTP id f195mr49638284qhc.40.1437483142948; 
	Tue, 21 Jul 2015 05:52:22 -0700 (PDT)
Received: from localhost ([179.105.243.19])
	by smtp.gmail.com with ESMTPSA id a8sm1817602qka.0.2015.07.21.05.52.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jul 2015 05:52:22 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 21 Jul 2015 09:52:16 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Jul 2015 09:51:56 -0300
Message-Id: <1437483116-22509-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.4.6
In-Reply-To: <1437483116-22509-1-git-send-email-otavio@ossystems.com.br>
References: <1437483116-22509-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v2 4/4] glmark2: Remove X11 exclusiveness
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jul 2015 12:52:24 -0000

The tool has support for multiple backends: X11, drm and Wayland.

The recipe has been rework to support them all and the PACKAGECONFIG
made to respect the DISTRO_FEATURES available.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 31 ++++++++++++++++--------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 57acad5..732fdc9 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -8,10 +8,7 @@ LICENSE = "GPLv3+ & SGIv1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.SGI;beginline=5;md5=269cdab4af6748677acce51d9aa13552"
 
-DEPENDS = "libpng12 jpeg virtual/libx11"
-
-# depends on virtual/libx11
-REQUIRED_DISTRO_FEATURES = "x11"
+DEPENDS = "libpng12 jpeg"
 
 PV = "2014.03+${SRCPV}"
 
@@ -20,20 +17,34 @@ SRCREV = "fa71af2dfab711fac87b9504b6fc9862f44bf72a"
 
 S = "${WORKDIR}/git"
 
-inherit waf pkgconfig distro_features_check
+inherit waf pkgconfig
 
-PACKAGECONFIG ?= "gl gles2"
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11-gl x11-gles2', '', d)} \
+                  ${@bb.utils.contains('DISTRO_FEATURES', 'wayland opengl', 'wayland-gl wayland-gles2', '', d)} \
+                  drm-gl drm-gles2"
 
-PACKAGECONFIG[gl] = ",,virtual/libgl"
-PACKAGECONFIG[gles2] = ",,virtual/libgles2"
+PACKAGECONFIG[x11-gl] = ",,virtual/libgl virtual/libx11"
+PACKAGECONFIG[x11-gles2] = ",,virtual/libgles2 virtual/libx11"
+PACKAGECONFIG[drm-gl] = ",,virtual/libgl libdrm"
+PACKAGECONFIG[drm-gles2] = ",,virtual/libgles2 libdrm"
+PACKAGECONFIG[wayland-gl] = ",,virtual/libgl wayland"
+PACKAGECONFIG[wayland-gles2] = ",,virtual/libgles2 wayland"
 
 python __anonymous() {
     packageconfig = (d.getVar("PACKAGECONFIG", True) or "").split()
     flavors = []
-    if "gles2" in packageconfig:
+    if "x11-gles2" in packageconfig:
         flavors.append("x11-glesv2")
-    if "gl" in packageconfig:
+    if "x11-gl" in packageconfig:
         flavors.append("x11-gl")
+    if "wayland-gles2" in packageconfig:
+        flavors.append("wayland-glesv2")
+    if "wayland-gl" in packageconfig:
+        flavors.append("wayland-gl")
+    if "drm-gles2" in packageconfig:
+        flavors.append("drm-glesv2")
+    if "drm-gl" in packageconfig:
+        flavors.append("drm-gl")
     if flavors:
         d.appendVar("EXTRA_OECONF", " --with-flavors=%s" % ",".join(flavors))
 }
-- 
2.4.6


