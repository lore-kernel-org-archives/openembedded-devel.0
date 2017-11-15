Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0C9CE71A18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 14:15:17 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id w21so26358772lfc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 06:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=z9H9CJmCVsSyGlyhC+yZwOYyODhTbfrGSFYTLcuqn60=;
	b=RNcvGs9BdQgedWl/Hb3hzAJzUnU6o1J4qK9/5f0vxNpaUCKy0ILbXPVk1LQC86WcS5
	sb2dsUYZ10HlfJkeBeKnZTJ8p8rjvg8Hi3raiRUzPpQJ5q2YhJ+W5g7wBWLpkSKA4g+d
	O9lrAsO1TpDcKcAR+1HvHGCE2x0qXyG1oPmo/y+wawbdXryUGKpM2osbxqm1QsAsalh6
	MGi0bSSjyweL59t4BzaxJrlNx+pSJYXarDFrAKPm1vmAF2OnkV61QTdEKgUjxo0ACmVb
	v8x4NCepUjQQ5E0OSJN3r/IZmgUjx+E0yLC+hi5/UE7hcLLqoi1IuDQxpZejXPYt0Nyk
	trsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=z9H9CJmCVsSyGlyhC+yZwOYyODhTbfrGSFYTLcuqn60=;
	b=BPhwLWUVFgAxxYc9s3ynenPPrm0LMGHVYLRVghPMSzUMpGj4uBjD/GAfEeXa8oZHO2
	GMc6Wz/zHv3L7zp+rK1/eBpVuOL+i1+Kbr8Lrd3yO1PmMe7WbMXHdi99k9nGoTYYzH5P
	ey6AyeuJ7IZJjQ/VOmh4M+PJwmhex5dc/ogXy9EmVOGTX1qADg85BfaASXYB9nl6V+Kc
	dW86oupJD7A2oLFWD77WZOt9YSXQkKx15tuMRs9lYwAqNcHu2DwBr1TXJkCggCig8BVo
	ogy5gEYHgKO5+LXAOGxMAUJa5a24/cURzJy7obgIrFI6APspSipigQPGtP1DF2z56ZcN
	Sohg==
X-Gm-Message-State: AJaThX4RQ9csmlgZg4HItRvQxy1zQaQrCy3Bo0srP1JUgHt/46bTWLRT
	nk8snvCSVZb4gBhK/h/k7l4xdDkL
X-Google-Smtp-Source: AGs4zMYYCv5HwP1jJu5PgovXjTq0AwKC5cY3uV2mOgNYeKkhek+A3qVnLLmjHnO3NlUTJ36fxZViFQ==
X-Received: by 10.46.84.4 with SMTP id i4mr4078048ljb.60.1510755318111;
	Wed, 15 Nov 2017 06:15:18 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	f14sm3730344lfg.53.2017.11.15.06.15.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Nov 2017 06:15:16 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Nov 2017 15:15:02 +0100
Message-Id: <20171115141502.21516-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.15.0
Subject: [meta-oe][PATCH] meson: update meson to 0.43.0
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
X-List-Received-Date: Wed, 15 Nov 2017 14:15:18 -0000

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 .../meson/meson/native_bindir.patch                | 59 ++++++++++++++--------
 .../meson/{meson_0.40.1.bb => meson_0.43.0.bb}     |  2 +-
 2 files changed, 39 insertions(+), 22 deletions(-)
 rename meta-oe/recipes-devtools/meson/{meson_0.40.1.bb => meson_0.43.0.bb} (88%)

diff --git a/meta-oe/recipes-devtools/meson/meson/native_bindir.patch b/meta-oe/recipes-devtools/meson/meson/native_bindir.patch
index 993e9750e33e..805c1f6a50dc 100644
--- a/meta-oe/recipes-devtools/meson/meson/native_bindir.patch
+++ b/meta-oe/recipes-devtools/meson/meson/native_bindir.patch
@@ -1,22 +1,32 @@
+From 01dd18c9c9c042268b87d576624c16fc74253cd9 Mon Sep 17 00:00:00 2001
+From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+Date: Wed, 15 Nov 2017 15:05:01 +0100
+Subject: [PATCH] native_bindir
+
 There are some discussions upstream to merge this patch, but I presonaly believe
 that is is OE only. https://github.com/mesonbuild/meson/issues/1849#issuecomment-303730323
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
-diff --git a/mesonbuild/dependencies.py b/mesonbuild/dependencies.py
-index 04a22f985941..3e33bc4a79e7 100644
---- a/mesonbuild/dependencies.py
-+++ b/mesonbuild/dependencies.py
-@@ -95,7 +95,7 @@ class Dependency:
+---
+ mesonbuild/dependencies/base.py | 14 +++++++++-----
+ mesonbuild/dependencies/ui.py   |  6 +++---
+ 2 files changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
+index 0d9742d426cb..0c8e79a8e9e3 100644
+--- a/mesonbuild/dependencies/base.py
++++ b/mesonbuild/dependencies/base.py
+@@ -114,7 +114,7 @@ class Dependency:
      def need_threads(self):
          return False
  
 -    def get_pkgconfig_variable(self, variable_name):
 +    def get_pkgconfig_variable(self, variable_name, use_native=False):
-         raise MesonException('Tried to get a pkg-config variable from a non-pkgconfig dependency.')
+         raise NotImplementedError('{!r} is not a pkgconfig dependency'.format(self.name))
+ 
  
- class InternalDependency(Dependency):
-@@ -224,8 +224,12 @@ class PkgConfigDependency(Dependency):
+@@ -256,8 +256,12 @@ class PkgConfigDependency(ExternalDependency):
          return s.format(self.__class__.__name__, self.name, self.is_found,
                          self.version_reqs)
  
@@ -31,9 +41,9 @@ index 04a22f985941..3e33bc4a79e7 100644
          return p.returncode, out.strip()
  
      def _set_cargs(self):
-@@ -259,8 +263,8 @@ class PkgConfigDependency(Dependency):
+@@ -291,8 +295,8 @@ class PkgConfigDependency(ExternalDependency):
                  self.is_libtool = True
-             self.libs.append(lib)
+             self.link_args.append(lib)
  
 -    def get_pkgconfig_variable(self, variable_name):
 -        ret, out = self._call_pkgbin(['--variable=' + variable_name, self.name])
@@ -42,7 +52,11 @@ index 04a22f985941..3e33bc4a79e7 100644
          variable = ''
          if ret != 0:
              if self.required:
-@@ -1091,7 +1095,7 @@ class QtBaseDependency(Dependency):
+diff --git a/mesonbuild/dependencies/ui.py b/mesonbuild/dependencies/ui.py
+index 8f183e54d4d2..34ef33e79ad9 100644
+--- a/mesonbuild/dependencies/ui.py
++++ b/mesonbuild/dependencies/ui.py
+@@ -239,7 +239,7 @@ class QtBaseDependency(ExternalDependency):
          self.bindir = self.get_pkgconfig_host_bins(core)
          if not self.bindir:
              # If exec_prefix is not defined, the pkg-config file is broken
@@ -51,16 +65,7 @@ index 04a22f985941..3e33bc4a79e7 100644
              if prefix:
                  self.bindir = os.path.join(prefix, 'bin')
  
-@@ -1202,7 +1206,7 @@ class Qt5Dependency(QtBaseDependency):
-         QtBaseDependency.__init__(self, 'qt5', env, kwargs)
- 
-     def get_pkgconfig_host_bins(self, core):
--        return core.get_pkgconfig_variable('host_bins')
-+        return core.get_pkgconfig_variable('host_bins', use_native=True)
- 
- class Qt4Dependency(QtBaseDependency):
-     def __init__(self, env, kwargs):
-@@ -1216,7 +1220,7 @@ class Qt4Dependency(QtBaseDependency):
+@@ -359,7 +359,7 @@ class Qt4Dependency(QtBaseDependency):
          applications = ['moc', 'uic', 'rcc', 'lupdate', 'lrelease']
          for application in applications:
              try:
@@ -69,3 +74,15 @@ index 04a22f985941..3e33bc4a79e7 100644
              except MesonException:
                  pass
  
+@@ -369,7 +369,7 @@ class Qt5Dependency(QtBaseDependency):
+         QtBaseDependency.__init__(self, 'qt5', env, kwargs)
+ 
+     def get_pkgconfig_host_bins(self, core):
+-        return core.get_pkgconfig_variable('host_bins')
++        return core.get_pkgconfig_variable('host_bins', use_native=True)
+ 
+ 
+ # There are three different ways of depending on SDL2:
+-- 
+2.15.0
+
diff --git a/meta-oe/recipes-devtools/meson/meson_0.40.1.bb b/meta-oe/recipes-devtools/meson/meson_0.43.0.bb
similarity index 88%
rename from meta-oe/recipes-devtools/meson/meson_0.40.1.bb
rename to meta-oe/recipes-devtools/meson/meson_0.43.0.bb
index 14644ba9ba0a..0953eadc7e7d 100644
--- a/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
+++ b/meta-oe/recipes-devtools/meson/meson_0.43.0.bb
@@ -9,7 +9,7 @@ SRC_URI = " \
     file://native_bindir.patch \
 "
 
-SRCREV = "b25d3e4d3f2b4d37029a507cc089bdde643c6240"
+SRCREV = "5626df46453e73b63827c4542aae36443fbd928b"
 
 S = "${WORKDIR}/git"
 
-- 
2.15.0


