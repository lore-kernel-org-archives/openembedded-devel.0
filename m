Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 800936FF78
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 08:48:34 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id 99so44169040lfu.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 01:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YbFjz/70s6s3KIHgOFTMknt0KXwPv4AP7EPQ5pB2a4U=;
	b=UpQLili1rhxavOf+9D1X5DrGPcKTuMdOjzEx5DLgANwCyPknGboJeYE0t4igba8osy
	QhtWx5HKiHIe8yVOhVVA18EI91RPoaMtBfCvSU2igKR1V4dbzdE12wCS/XDIvOW/UYv4
	zvRbr96ygXcGuRw7nkQ9x3nOSOkTrZnwdvYX2WY3pto9A0NnR/EpDWOleFnd9cY9u8uN
	JduUvK91M5i6WPb7XtZaEdHIDL6kRXtomR+OVE/13Y6/X9+Etok21XaiAeokOtYriBYx
	QOkqnqxRyDWrN9lwtoIEcCnaJjFl+VpPojW09YKtUvCTj5TEM84gqYMP4i0JGpHSJ3Ed
	dcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YbFjz/70s6s3KIHgOFTMknt0KXwPv4AP7EPQ5pB2a4U=;
	b=I4cSoR28TW+zFDb3xQsfneyC+kbMfvrAFhenM7IIYMJ5cR2ely0oXeUTMCI0yqW/tK
	b2tyVPEFK70c7zRbaUJYIlkqFZRn7K7gmRBGtzvGkU3efUSpVzXNjPagilXx1CU1fLHU
	2m8kkZYv7v1ne6O0iZGoGgeP4dHlLb82ezo+lHTvsBnrJDe9mfoI9uxYPpOz7siK2jx4
	gLE1CRY0nfkxd7UMaRbp3FpznDbkHPMwt2I7RUwmlo9cqiawLePVj2lFjVazz4KtOxJq
	VIKCQFLbufuClloNzS8RxVxR1JxHKAsWN58/DEKnXHcQ0k9w+ExjXLJ+vEohksikdfI3
	a/TA==
X-Gm-Message-State: AODbwcBsHo4vINnnz8Xn/k9gP5Uid4n2QqX5Fli/tiwtJFD04UbI1w4V
	IpJRt548wYRLMQ==
X-Received: by 10.25.22.89 with SMTP id m86mr7328717lfi.104.1495529315347;
	Tue, 23 May 2017 01:48:35 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id s26sm24117ljd.27.2017.05.23.01.48.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 May 2017 01:48:34 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, peter.kjellerstedt@axis.com,
	linussn@axis.com
Date: Tue, 23 May 2017 10:48:31 +0200
Message-Id: <20170523084831.12243-2-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170523084831.12243-1-ricardo.ribalda@gmail.com>
References: <20170523084831.12243-1-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH 2/2] meson: Use pkgconfig-native for the native tools
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
X-List-Received-Date: Tue, 23 May 2017 08:48:36 -0000

QT relies on host compilers such mas mocc. Modify meson to use
pkgconfig-native instead of pkgconfig in such cases.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 .../meson/meson/native_bindir.patch                | 52 ++++++++++++++++++++++
 meta-oe/recipes-devtools/meson/meson_0.37.1.bb     |  5 ++-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/meson/meson/native_bindir.patch

diff --git a/meta-oe/recipes-devtools/meson/meson/native_bindir.patch b/meta-oe/recipes-devtools/meson/meson/native_bindir.patch
new file mode 100644
index 000000000000..53eeff7b688b
--- /dev/null
+++ b/meta-oe/recipes-devtools/meson/meson/native_bindir.patch
@@ -0,0 +1,52 @@
+diff --git a/mesonbuild/dependencies.py b/mesonbuild/dependencies.py
+index da73a57b7ecd..22100f69c580 100644
+--- a/mesonbuild/dependencies.py
++++ b/mesonbuild/dependencies.py
+@@ -65,7 +65,7 @@ class Dependency():
+     def need_threads(self):
+         return False
+ 
+-    def get_pkgconfig_variable(self, variable_name):
++    def get_pkgconfig_variable(self, variable_name, use_native=False):
+         raise MesonException('Tried to get a pkg-config variable from a non-pkgconfig dependency.')
+ 
+ class InternalDependency(Dependency):
+@@ -177,8 +177,12 @@ class PkgConfigDependency(Dependency):
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
+         return (p.returncode, out.strip())
+ 
+     def _set_cargs(self):
+@@ -212,8 +216,8 @@ class PkgConfigDependency(Dependency):
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
+@@ -933,10 +937,10 @@ class QtBaseDependency(Dependency):
+             corekwargs = {'required': 'false', 'silent': 'true'}
+             core = PkgConfigDependency(self.qtpkgname + 'Core', env, corekwargs)
+         # Used by self.compilers_detect()
+-        self.bindir = core.get_pkgconfig_variable('host_bins')
++        self.bindir = core.get_pkgconfig_variable('host_bins', use_native=True)
+         if not self.bindir:
+             # If exec_prefix is not defined, the pkg-config file is broken
+-            prefix = core.get_pkgconfig_variable('exec_prefix')
++            prefix = core.get_pkgconfig_variable('exec_prefix', use_native=True)
+             if prefix:
+                 self.bindir = os.path.join(prefix, 'bin')
+ 
diff --git a/meta-oe/recipes-devtools/meson/meson_0.37.1.bb b/meta-oe/recipes-devtools/meson/meson_0.37.1.bb
index a83af77b3ab6..dbbea6447605 100644
--- a/meta-oe/recipes-devtools/meson/meson_0.37.1.bb
+++ b/meta-oe/recipes-devtools/meson/meson_0.37.1.bb
@@ -4,7 +4,10 @@ SUMMARY = "A high performance build system"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI = "git://github.com/mesonbuild/meson.git"
+SRC_URI = " \
+    git://github.com/mesonbuild/meson.git \
+    file://native_bindir.patch \
+"
 
 SRCREV = "3d4bfdcb22314ea7db45a5b075f8b2a9c1498aab"
 
-- 
2.11.0


