Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B4A2E7199A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Nov 2016 23:50:58 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a20so8461433wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Nov 2016 15:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5nPYqxTzCD+78rpHTd2JpBL/nwlwipC1Aahjh8f+2WI=;
	b=zs1I5tnHSZDOPmyMdTlqGrYGAyTK/lSIvrBwCa5ku2MuhYpo/JE8MjaDjv+bYniyD+
	B5Gc1kUMuoxHGOLguYugqMQOzqY5ak4ZG88vLChObosiO+Za+3/84Qi0JrbhDfB4HAMC
	BsNLm66LRmDC4a2f5sLg2DfZzh1b/PE8HDVcbtzvlFH3hcSAkVav5Vhwm3f0H1SGckBc
	85lJb5weJld7T9g+MtQnASHOSnHc3kR3wc2xSgSaMcX+1rZLXhD6DuY18ucPv4GTYjFI
	kBckbXkegBmErISANDwcoviOhGllW3fJV6KsGGjVOzdXoIkSYuZChZ5A9v8uJSJ9Hejd
	Batg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5nPYqxTzCD+78rpHTd2JpBL/nwlwipC1Aahjh8f+2WI=;
	b=EiMLYOQ9SnRd5STYG+EJb/u8E0jyyGoPkXRri0D3VxrYqwWqh/s/RmisvePPYxJkGW
	eaWCokXQUuA59d3oBAe5dH/zPmoD1Ratz91U2KLzVt8Ld78efjsC8PO0iVPCoglxOJbJ
	NVIyD6Zy0QU9P281eAW9z23qdui3FNyX5mzZhPPkdgzv7aA9F81C8J3w1LRgtjv37F5C
	GMk+c21JAyVqCzEwPNJ6NnSiovQRSMrFlCqPa2Fvt7Ten4q/GY276d6oIgEvgdqJMzrS
	zyA4EkmMSFQXlqEnuF5r4T8OH53AClnApVu0O1ouucEQN2xu8PB8/6qOM5bYZforB5Yq
	/xvg==
X-Gm-Message-State: ABUngvc5ic04jTto7WGoGYCTxNzSwLNR6w98YJuVmZEy9K3+BshogRY9hSu5aiIYCzJP7g==
X-Received: by 10.28.126.146 with SMTP id z140mr9245624wmc.84.1478562659653;
	Mon, 07 Nov 2016 15:50:59 -0800 (PST)
Received: from localhost.localdomain (p5B0A1A55.dip0.t-ipconnect.de.
	[91.10.26.85]) by smtp.googlemail.com with ESMTPSA id
	k74sm16293696wmd.18.2016.11.07.15.50.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Nov 2016 15:50:59 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Nov 2016 00:49:56 +0100
Message-Id: <1478562596-4919-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] glmark: update to latest sources
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
X-List-Received-Date: Mon, 07 Nov 2016 23:50:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With mesa 13.0.0 glmark-es2 crashed at the terrain part. This bug was fixed in
the latest commit. See further details at [1].

[1] https://github.com/glmark2/glmark2/issues/25

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...uild-error-due-missing-space-before-macro.patch | 27 ----------
 .../files/Fix-deprecated-declarations.patch        | 61 ----------------------
 ...-packages-to-be-used-by-the-enabled-flavo.patch |  6 +--
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb   | 14 ++---
 4 files changed, 10 insertions(+), 98 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/glmark2/files/Fix-build-error-due-missing-space-before-macro.patch
 delete mode 100644 meta-oe/recipes-benchmark/glmark2/files/Fix-deprecated-declarations.patch

diff --git a/meta-oe/recipes-benchmark/glmark2/files/Fix-build-error-due-missing-space-before-macro.patch b/meta-oe/recipes-benchmark/glmark2/files/Fix-build-error-due-missing-space-before-macro.patch
deleted file mode 100644
index 00eb2ed..0000000
--- a/meta-oe/recipes-benchmark/glmark2/files/Fix-build-error-due-missing-space-before-macro.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 3fb9b6aeed2e2758239e59ba9ba1ca98535fe510 Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Fri, 19 Aug 2016 15:08:44 +0000
-Subject: [PATCH] Fix build error due missing space before macro
-Organization: O.S. Systems Software LTDA.
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- src/native-state-x11.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/native-state-x11.cpp b/src/native-state-x11.cpp
-index 3b66b77..3c1703b 100644
---- a/src/native-state-x11.cpp
-+++ b/src/native-state-x11.cpp
-@@ -60,7 +60,7 @@ NativeStateX11::display()
- bool
- NativeStateX11::create_window(WindowProperties const& properties)
- {
--    static const char *win_name("glmark2 "GLMARK_VERSION);
-+    static const char *win_name("glmark2 " GLMARK_VERSION);
- 
-     if (!xdpy_) {
-         Log::error("Error: X11 Display has not been initialized!\n");
--- 
-2.1.4
-
diff --git a/meta-oe/recipes-benchmark/glmark2/files/Fix-deprecated-declarations.patch b/meta-oe/recipes-benchmark/glmark2/files/Fix-deprecated-declarations.patch
deleted file mode 100644
index 7a25de7..0000000
--- a/meta-oe/recipes-benchmark/glmark2/files/Fix-deprecated-declarations.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-Index: git/src/image-reader.cpp
-===================================================================
---- git.orig/src/image-reader.cpp	2016-07-29 16:17:51.000000000 -0500
-+++ git/src/image-reader.cpp	2016-07-29 16:18:43.000000000 -0500
-@@ -120,7 +120,7 @@
- 
-     Log::debug("Reading PNG file %s\n", filename.c_str());
- 
--    const std::auto_ptr<std::istream> is_ptr(Util::get_resource(filename));
-+    const std::unique_ptr<std::istream> is_ptr(Util::get_resource(filename));
-     if (!(*is_ptr)) {
-         Log::error("Cannot open file %s!\n", filename.c_str());
-         return false;
-Index: git/src/libmatrix/shader-source.cc
-===================================================================
---- git.orig/src/libmatrix/shader-source.cc	2016-07-29 16:18:14.000000000 -0500
-+++ git/src/libmatrix/shader-source.cc	2016-07-29 16:18:43.000000000 -0500
-@@ -34,7 +34,7 @@
- bool
- ShaderSource::load_file(const std::string& filename, std::string& str)
- {
--    std::auto_ptr<std::istream> is_ptr(Util::get_resource(filename));
-+    std::unique_ptr<std::istream> is_ptr(Util::get_resource(filename));
-     std::istream& inputFile(*is_ptr);
- 
-     if (!inputFile)
-Index: git/src/model.cpp
-===================================================================
---- git.orig/src/model.cpp	2016-07-29 16:18:00.000000000 -0500
-+++ git/src/model.cpp	2016-07-29 16:18:43.000000000 -0500
-@@ -361,7 +361,7 @@
- 
-     Log::debug("Loading model from 3ds file '%s'\n", filename.c_str());
- 
--    const std::auto_ptr<std::istream> input_file_ptr(Util::get_resource(filename));
-+    const std::unique_ptr<std::istream> input_file_ptr(Util::get_resource(filename));
-     std::istream& input_file(*input_file_ptr);
- 
-     if (!input_file) {
-@@ -681,7 +681,7 @@
- {
-     Log::debug("Loading model from obj file '%s'\n", filename.c_str());
- 
--    const std::auto_ptr<std::istream> input_file_ptr(Util::get_resource(filename));
-+    const std::unique_ptr<std::istream> input_file_ptr(Util::get_resource(filename));
-     std::istream& inputFile(*input_file_ptr);
-     if (!inputFile)
-     {
-Index: git/src/scene-jellyfish.cpp
-===================================================================
---- git.orig/src/scene-jellyfish.cpp	2016-07-29 16:18:08.000000000 -0500
-+++ git/src/scene-jellyfish.cpp	2016-07-29 16:18:43.000000000 -0500
-@@ -272,7 +272,7 @@
- {
-     Log::debug("Loading model from file '%s'\n", filename.c_str());
- 
--    const std::auto_ptr<std::istream> input_file_ptr(Util::get_resource(filename));
-+    const std::unique_ptr<std::istream> input_file_ptr(Util::get_resource(filename));
-     std::istream& inputFile(*input_file_ptr);
-     if (!inputFile)
-     {
diff --git a/meta-oe/recipes-benchmark/glmark2/files/build-Check-packages-to-be-used-by-the-enabled-flavo.patch b/meta-oe/recipes-benchmark/glmark2/files/build-Check-packages-to-be-used-by-the-enabled-flavo.patch
index ff13329..72b8deb 100644
--- a/meta-oe/recipes-benchmark/glmark2/files/build-Check-packages-to-be-used-by-the-enabled-flavo.patch
+++ b/meta-oe/recipes-benchmark/glmark2/files/build-Check-packages-to-be-used-by-the-enabled-flavo.patch
@@ -18,9 +18,9 @@ index cab62a3..e7eaed0 100644
 --- a/wscript
 +++ b/wscript
 @@ -121,13 +121,17 @@ def configure(ctx):
-                 ('mirclient','mirclient', '0.13', list_contains(Options.options.flavors, 'mir')),
-                 ('wayland-client','wayland-client', None, list_contains(Options.options.flavors, 'wayland')),
-                 ('wayland-egl','wayland-egl', None, list_contains(Options.options.flavors, 'wayland'))]
+                 ('mirclient','mirclient', '0.13', list_contains(ctx.options.flavors, 'mir')),
+                 ('wayland-client','wayland-client', None, list_contains(ctx.options.flavors, 'wayland')),
+                 ('wayland-egl','wayland-egl', None, list_contains(ctx.options.flavors, 'wayland'))]
 -    for (pkg, uselib, atleast, mandatory) in opt_pkgs:
 +    for (pkg, uselib, atleast, check) in opt_pkgs:
 +        # Check packages required by the flavors
diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index a2558a7..e8ccf37 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -12,13 +12,13 @@ DEPENDS = "libpng12 jpeg"
 
 PV = "2014.03+${SRCPV}"
 
-SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https \
-           file://build-Check-packages-to-be-used-by-the-enabled-flavo.patch \
-           file://0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch \
-           file://Fix-build-error-due-missing-space-before-macro.patch \
-           file://Fix-configure-for-sqrt-check.patch \
-           file://Fix-deprecated-declarations.patch"
-SRCREV = "fa71af2dfab711fac87b9504b6fc9862f44bf72a"
+SRC_URI = " \
+    git://github.com/glmark2/glmark2.git;protocol=https \
+    file://build-Check-packages-to-be-used-by-the-enabled-flavo.patch \
+    file://0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch \
+    file://Fix-configure-for-sqrt-check.patch \
+"
+SRCREV = "f413c5b423250b4fde8f95639ad368d5b02c5b9b"
 
 S = "${WORKDIR}/git"
 
-- 
2.5.5


