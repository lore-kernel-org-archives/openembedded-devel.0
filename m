Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id E0BA775979
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2015 19:47:42 +0000 (UTC)
Received: by qkfc129 with SMTP id c129so117569286qkf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2015 12:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization;
	bh=GFoJVDocjDTH+xMBzX5OZn5KP/in0eSdQN6lG3z2Bb0=;
	b=V1wi3oXYaroMIHJ9DLucX29vRfL5BlElaWCbqW4vtOTfi3a/0eTNwK74/OBT9AitAJ
	fNXakfuVf+eGG7NrmyAQAW3fyvLOVFc2fY1DzVhcitYSuRlTqxOvjVL/MOUZEuOzhH8e
	SMxcnfjwxlxdMS5YClF8SS4iJ3L10jJRROZjpgbxIShZaDvuycjHfodY7tLEHygT1+nV
	9IBEexpCuFoN1eshMA7UKjvHBbgqIpNne3WXLFsQ59/HRnMNG9fnmehI2aCr8ZLEVHNw
	LIigq2D+fAeoxyaFnGubVa1g+NNCAef6P/tVExxGnE8WB2qcnwP5z4dtErEZiVf7Y28r
	n2OA==
X-Received: by 10.140.23.147 with SMTP id 19mr6342114qgp.84.1437594462706;
	Wed, 22 Jul 2015 12:47:42 -0700 (PDT)
Received: from localhost ([179.105.243.19])
	by smtp.gmail.com with ESMTPSA id 60sm1212033qgy.37.2015.07.22.12.47.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Jul 2015 12:47:41 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 22 Jul 2015 16:47:36 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 22 Jul 2015 16:47:09 -0300
Message-Id: <1437594429-21142-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.4.6
In-Reply-To: <1437594429-21142-1-git-send-email-otavio@ossystems.com.br>
References: <1437594429-21142-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v3 4/4] glmark2: Remove X11 exclusiveness
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
X-List-Received-Date: Wed, 22 Jul 2015 19:47:43 -0000

The tool has support for multiple backends: X11, drm and Wayland.

This demanded to a fix, which has been sent upstream, to make the
flavor configuration predictable and the recipe has been rework to
support them all, making the PACKAGECONFIG to respect the
DISTRO_FEATURES available by default.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 ...-packages-to-be-used-by-the-enabled-flavo.patch | 43 ++++++++++++++++++++++
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb   | 34 +++++++++++------
 2 files changed, 66 insertions(+), 11 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/glmark2/files/build-Check-packages-to-be-used-by-the-enabled-flavo.patch

diff --git a/meta-oe/recipes-benchmark/glmark2/files/build-Check-packages-to-be-used-by-the-enabled-flavo.patch b/meta-oe/recipes-benchmark/glmark2/files/build-Check-packages-to-be-used-by-the-enabled-flavo.patch
new file mode 100644
index 0000000..ff13329
--- /dev/null
+++ b/meta-oe/recipes-benchmark/glmark2/files/build-Check-packages-to-be-used-by-the-enabled-flavo.patch
@@ -0,0 +1,43 @@
+From: Otavio Salvador <otavio@ossystems.com.br>
+Subject: [PATCH] build: Check packages to be used by the enabled flavors
+Organization: O.S. Systems Software LTDA.
+
+The packages shouldn't be dynamically detected otherwise the build
+predictability is lost. We now have all packages as mandatory but
+dependent of the flavors which use them.
+
+Upstream-Status: Submitted [https://github.com/glmark2/glmark2/pull/8]
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ wscript | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/wscript b/wscript
+index cab62a3..e7eaed0 100644
+--- a/wscript
++++ b/wscript
+@@ -121,13 +121,17 @@ def configure(ctx):
+                 ('mirclient','mirclient', '0.13', list_contains(Options.options.flavors, 'mir')),
+                 ('wayland-client','wayland-client', None, list_contains(Options.options.flavors, 'wayland')),
+                 ('wayland-egl','wayland-egl', None, list_contains(Options.options.flavors, 'wayland'))]
+-    for (pkg, uselib, atleast, mandatory) in opt_pkgs:
++    for (pkg, uselib, atleast, check) in opt_pkgs:
++        # Check packages required by the flavors
++        if not check:
++            continue
++
+         if atleast is None:
+             ctx.check_cfg(package = pkg, uselib_store = uselib,
+-                          args = '--cflags --libs', mandatory = mandatory)
++                          args = '--cflags --libs', mandatory = True)
+         else:
+             ctx.check_cfg(package = pkg, uselib_store = uselib, atleast_version=atleast,
+-                          args = '--cflags --libs', mandatory = mandatory)
++                          args = '--cflags --libs', mandatory = True)
+ 
+ 
+     # Prepend CXX flags so that they can be overriden by the
+-- 
+2.4.6
+
diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 57acad5..98ce377 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -8,32 +8,44 @@ LICENSE = "GPLv3+ & SGIv1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.SGI;beginline=5;md5=269cdab4af6748677acce51d9aa13552"
 
-DEPENDS = "libpng12 jpeg virtual/libx11"
-
-# depends on virtual/libx11
-REQUIRED_DISTRO_FEATURES = "x11"
+DEPENDS = "libpng12 jpeg"
 
 PV = "2014.03+${SRCPV}"
 
-SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https"
+SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https \
+           file://build-Check-packages-to-be-used-by-the-enabled-flavo.patch"
 SRCREV = "fa71af2dfab711fac87b9504b6fc9862f44bf72a"
 
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


