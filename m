Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id F11037823A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 08:57:52 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id z78so24814906lff.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 01:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2yGKxF2f2LNTtn4tWrC52u11wdK/HSypqtLFRxCHJTQ=;
	b=iNwaOHdzqUdzmXIq6Nh1sRaIHm7DRudn6Uon4iGWXSE9PAhAcRTGNpR2oSZVdGyIN9
	6Vo9UTxpKnL/yo7laAhF2Hh4cJ72wzGOoXIZvKwqyOe6+p3vw0CHDEgUHTQuS6zvvK8S
	9kdmNbfRb9ckn7Gy2THlpNGcg87vQbdVZb7OOJeMZbqh3Xvq+bLQeIR33yDhIIeDpET5
	UguLWnFjidGEmXkv922GxlcF/TmbUPrnXUdxn9xxFFxJG4mZI70ffm12daIuBTyEkzZi
	Q1YufbkF4olL82NqqI58/T+BjzwxQIJOR6EtAqgYICHEkfOJLboOOJcFX/gU28FT09Qy
	NQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2yGKxF2f2LNTtn4tWrC52u11wdK/HSypqtLFRxCHJTQ=;
	b=jdSRGrx2J4u81ZDbHWHn/oTdZ6IUyxxNHBwDA26k3Ul+6tCBZrWPy5XKe5W593tn6s
	npCbstrmT8CeXBp1wJW/851QpTOoTLGcJl8w/C/EVqHDw5ESD/GrRBj4206raMj/3iW1
	YTaY9QXNzFikGjEKHWQ3CzdLQ1fTt7l55nmAlqaX1oF2EdUinsnJ8FjdSSyEBhOLDUnl
	54gDJ6/vT4j6bNACQpLsuWj2v9ngi7MbribsDc7nwbkXwZAkP+acKtGRZ7aSE4IPi/S3
	i36srZY5xGIzauY9sewLJFl99JAj444i/RKpQNVCHhdfpVPTmpcWju3rfALOpL8psoT7
	7Uaw==
X-Gm-Message-State: AKS2vOzm7YAOTMc09xJEaJTytXCDqotiP2GMFFT+5+jops29Bjp5G/7E
	q/WdwIJpDbT4c5AHoIQ=
X-Received: by 10.46.69.69 with SMTP id s66mr215850lja.29.1498813072290;
	Fri, 30 Jun 2017 01:57:52 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	y10sm1493999lja.24.2017.06.30.01.57.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 01:57:51 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jun 2017 10:57:48 +0200
Message-Id: <20170630085748.9189-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] meson: Port pkgconfig-native patch to 0.40.1
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
X-List-Received-Date: Fri, 30 Jun 2017 08:57:53 -0000

The update to 0.40.1 did not add this patch required for qt builds.

Fixes: 163abe723deb ("meson: update Meson devtool to 0.40.1")
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 .../meson/meson/native_bindir.patch                | 36 +++++++++++++++-------
 meta-oe/recipes-devtools/meson/meson_0.40.1.bb     |  1 +
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-devtools/meson/meson/native_bindir.patch b/meta-oe/recipes-devtools/meson/meson/native_bindir.patch
index 53eeff7b688b..bd99f760ecca 100644
--- a/meta-oe/recipes-devtools/meson/meson/native_bindir.patch
+++ b/meta-oe/recipes-devtools/meson/meson/native_bindir.patch
@@ -1,8 +1,8 @@
 diff --git a/mesonbuild/dependencies.py b/mesonbuild/dependencies.py
-index da73a57b7ecd..22100f69c580 100644
+index 04a22f985941..3e33bc4a79e7 100644
 --- a/mesonbuild/dependencies.py
 +++ b/mesonbuild/dependencies.py
-@@ -65,7 +65,7 @@ class Dependency():
+@@ -95,7 +95,7 @@ class Dependency:
      def need_threads(self):
          return False
  
@@ -11,7 +11,7 @@ index da73a57b7ecd..22100f69c580 100644
          raise MesonException('Tried to get a pkg-config variable from a non-pkgconfig dependency.')
  
  class InternalDependency(Dependency):
-@@ -177,8 +177,12 @@ class PkgConfigDependency(Dependency):
+@@ -224,8 +224,12 @@ class PkgConfigDependency(Dependency):
          return s.format(self.__class__.__name__, self.name, self.is_found,
                          self.version_reqs)
  
@@ -23,10 +23,10 @@ index da73a57b7ecd..22100f69c580 100644
 +        else:
 +            pkgbin = [self.pkgbin]
 +        p, out = Popen_safe(pkgbin + args, env=os.environ)[0:2]
-         return (p.returncode, out.strip())
+         return p.returncode, out.strip()
  
      def _set_cargs(self):
-@@ -212,8 +216,8 @@ class PkgConfigDependency(Dependency):
+@@ -259,8 +263,8 @@ class PkgConfigDependency(Dependency):
                  self.is_libtool = True
              self.libs.append(lib)
  
@@ -37,12 +37,8 @@ index da73a57b7ecd..22100f69c580 100644
          variable = ''
          if ret != 0:
              if self.required:
-@@ -933,10 +937,10 @@ class QtBaseDependency(Dependency):
-             corekwargs = {'required': 'false', 'silent': 'true'}
-             core = PkgConfigDependency(self.qtpkgname + 'Core', env, corekwargs)
-         # Used by self.compilers_detect()
--        self.bindir = core.get_pkgconfig_variable('host_bins')
-+        self.bindir = core.get_pkgconfig_variable('host_bins', use_native=True)
+@@ -1091,7 +1095,7 @@ class QtBaseDependency(Dependency):
+         self.bindir = self.get_pkgconfig_host_bins(core)
          if not self.bindir:
              # If exec_prefix is not defined, the pkg-config file is broken
 -            prefix = core.get_pkgconfig_variable('exec_prefix')
@@ -50,3 +46,21 @@ index da73a57b7ecd..22100f69c580 100644
              if prefix:
                  self.bindir = os.path.join(prefix, 'bin')
  
+@@ -1202,7 +1206,7 @@ class Qt5Dependency(QtBaseDependency):
+         QtBaseDependency.__init__(self, 'qt5', env, kwargs)
+ 
+     def get_pkgconfig_host_bins(self, core):
+-        return core.get_pkgconfig_variable('host_bins')
++        return core.get_pkgconfig_variable('host_bins', use_native=True)
+ 
+ class Qt4Dependency(QtBaseDependency):
+     def __init__(self, env, kwargs):
+@@ -1216,7 +1220,7 @@ class Qt4Dependency(QtBaseDependency):
+         applications = ['moc', 'uic', 'rcc', 'lupdate', 'lrelease']
+         for application in applications:
+             try:
+-                return os.path.dirname(core.get_pkgconfig_variable('%s_location' % application))
++                return os.path.dirname(core.get_pkgconfig_variable('%s_location' % application, use_native=True))
+             except MesonException:
+                 pass
+ 
diff --git a/meta-oe/recipes-devtools/meson/meson_0.40.1.bb b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
index a2c5e4d39719..fd96b4238eea 100644
--- a/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
+++ b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = " \
     git://github.com/mesonbuild/meson.git \
+    file://native_bindir.patch \
 "
 
 SRCREV = "b25d3e4d3f2b4d37029a507cc089bdde643c6240"
-- 
2.11.0


