Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id B441078334
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Jul 2017 08:47:36 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id i127so65624926wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Jul 2017 01:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=LMlmUwRjgdPnGgCWf73sFOaq7DVd8AcnpIJ+O/JYCMY=;
	b=qS49d4K7tM3i2KX/5cQ2TrVNll94tqWIvE9WnwUtiN2jSilNR7nptghRS3IcvFLAWK
	wXjksQXPXVJd8p2idLUnDH+R6Gg1LURGeqjV05daeRD3+BJgwFJQulc/M2raKVRQmUGK
	aNfSNwjHFz+FTv+gjVxS5xi+zLsKNJsTHnTNjOLpZ9l/OFmySIsH1mzP3K+OGGCA6QZ4
	h0GC08v4O3iXmY0nN85PqK/XV2dbyOhBxW9AKgbaP54OF8gk1Bh18HBJAyR0YbB8+8Ut
	hf3lLktgZP6P4694fujCtYAExpxaPHPIkPhlxw4ciocZDYbG0/iBNvnkhvHInDy2ukXU
	iEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LMlmUwRjgdPnGgCWf73sFOaq7DVd8AcnpIJ+O/JYCMY=;
	b=j0Up0GZzcB51gfWWKZPDJuoISDxx0xqchCt+7t9Yhxo6EOxZ/fp4WIWdNOyI5HHNyU
	JVlIguaL9M+WamOAqSRFsFAIcYIj03NraSXcMk5LIF8uig0fyrmfP2zAJDJGkomIdIxk
	i/eSIo82s72E+Ib41USLydd/M4BCMtuC/LLq2VLRUDoaKsgoVcZDewZ02nLm+W5jVdCj
	X33T9RMTNRFtSNeLjZzzmbLpysNkcLQ8SG9nws9QhkXhDpfa7xIeCS1RRKhqBmgtKZ9C
	tcjGHJyEkS7IweX+IJZVoA8SZONeiTX5mqc9Xp86lFBffHbyAO0tHe9zYhrO8OTAC+pd
	LgiA==
X-Gm-Message-State: AKS2vOy59R5ZEIIWCkSecjRybjg8e8JJmfYCvgzslQdMQdV4cJ120RyD
	GYFdkVtLFo28jcmWH+g=
X-Received: by 10.80.181.165 with SMTP id a34mr8029704ede.167.1498898856457;
	Sat, 01 Jul 2017 01:47:36 -0700 (PDT)
Received: from localhost.localdomain (80-71-134-83.u.parknet.dk.
	[80.71.134.83])
	by smtp.gmail.com with ESMTPSA id b6sm148048ede.23.2017.07.01.01.47.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jul 2017 01:47:35 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Jul 2017 10:47:31 +0200
Message-Id: <20170701084731.17919-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH v2] meson: Port pkgconfig-native patch to 0.40.1
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
X-List-Received-Date: Sat, 01 Jul 2017 08:47:39 -0000

The update to 0.40.1 did not add this patch required for qt builds.

Fixes: 163abe723deb ("meson: update Meson devtool to 0.40.1")
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 .../meson/meson/native_bindir.patch                | 71 ++++++++++++++++++++++
 meta-oe/recipes-devtools/meson/meson_0.40.1.bb     |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/meson/meson/native_bindir.patch

diff --git a/meta-oe/recipes-devtools/meson/meson/native_bindir.patch b/meta-oe/recipes-devtools/meson/meson/native_bindir.patch
new file mode 100644
index 000000000000..993e9750e33e
--- /dev/null
+++ b/meta-oe/recipes-devtools/meson/meson/native_bindir.patch
@@ -0,0 +1,71 @@
+There are some discussions upstream to merge this patch, but I presonaly believe
+that is is OE only. https://github.com/mesonbuild/meson/issues/1849#issuecomment-303730323
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+diff --git a/mesonbuild/dependencies.py b/mesonbuild/dependencies.py
+index 04a22f985941..3e33bc4a79e7 100644
+--- a/mesonbuild/dependencies.py
++++ b/mesonbuild/dependencies.py
+@@ -95,7 +95,7 @@ class Dependency:
+     def need_threads(self):
+         return False
+ 
+-    def get_pkgconfig_variable(self, variable_name):
++    def get_pkgconfig_variable(self, variable_name, use_native=False):
+         raise MesonException('Tried to get a pkg-config variable from a non-pkgconfig dependency.')
+ 
+ class InternalDependency(Dependency):
+@@ -224,8 +224,12 @@ class PkgConfigDependency(Dependency):
+         return s.format(self.__class__.__name__, self.name, self.is_found,
+                         self.version_reqs)
+ 
+-    def _call_pkgbin(self, args):
+-        p, out = Popen_safe([self.pkgbin] + args, env=os.environ)[0:2]
++    def _call_pkgbin(self, args, use_native=False):
++        if use_native:
++            pkgbin = [self.pkgbin + "-native"]
++        else:
++            pkgbin = [self.pkgbin]
++        p, out = Popen_safe(pkgbin + args, env=os.environ)[0:2]
+         return p.returncode, out.strip()
+ 
+     def _set_cargs(self):
+@@ -259,8 +263,8 @@ class PkgConfigDependency(Dependency):
+                 self.is_libtool = True
+             self.libs.append(lib)
+ 
+-    def get_pkgconfig_variable(self, variable_name):
+-        ret, out = self._call_pkgbin(['--variable=' + variable_name, self.name])
++    def get_pkgconfig_variable(self, variable_name, use_native=False):
++        ret, out = self._call_pkgbin(['--variable=' + variable_name, self.name], use_native=use_native)
+         variable = ''
+         if ret != 0:
+             if self.required:
+@@ -1091,7 +1095,7 @@ class QtBaseDependency(Dependency):
+         self.bindir = self.get_pkgconfig_host_bins(core)
+         if not self.bindir:
+             # If exec_prefix is not defined, the pkg-config file is broken
+-            prefix = core.get_pkgconfig_variable('exec_prefix')
++            prefix = core.get_pkgconfig_variable('exec_prefix', use_native=True)
+             if prefix:
+                 self.bindir = os.path.join(prefix, 'bin')
+ 
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
index ab54b8c79d29..14644ba9ba0a 100644
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


