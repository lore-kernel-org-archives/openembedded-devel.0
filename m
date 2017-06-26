Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6B1DF77EA1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 15:11:32 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id 77so146265430wrb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 08:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0sdpBi99LThLE0EruqfgP/Gxl2HoM8ZKt3svCsBEzE0=;
	b=0nj//I5jaSL6wj6VBRJKXNLfaTCMh1bEfGZl0vg7hBVcUL2W3YQRh9aIkwRFalHocv
	6h6hORIBwhYl0tw/Wk13NWuSq33JOJ9lLgmdXRyiyhE7VYKl+I758nyQMHl7Jtd2K7VT
	YAmfxgX/FKVINJuBjUPJqjJt5qAj+pW4AxbOlz/tfJ+D4LMtS7By4YfaaNgUpPLNq8DC
	1NcTGkhleTGrSve4/tHugiGzx3CpEA7WE7m4zvQ65VRv4Kc3fpRE00tZsM78QZHu0s3Z
	ExYkh0ybigkMF/1s4szQEKAk+1ZkivmuIUlmi3JRkTUD3QL1pUcy8cjMJd4Q1iS8a0cF
	XGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0sdpBi99LThLE0EruqfgP/Gxl2HoM8ZKt3svCsBEzE0=;
	b=eY0ZdQLvfVuNMT0XqQ05r3ii3ueITTJr0opQyn+PnJrJ55aytFRp959CowLb3cMDqn
	tlZcXK8OOfLwE0aGAYnS62RhOq0ZDjWLkCOh4Gq1hxIktMGy9vyMSAfo7tBtEL3andik
	qOQKzha64yux2nWWM5P60qEk4DB7KKOiO1vqwIqN7ZXUaw5ZvhJx6/bbCX8eJG+18bOH
	3ajFKtc5LbIafh8ve/+/YIuH2eS/yu8YtYDXWLVUsPN8eqiRSX7P8M4AiyWdNmLKGTax
	82AvyQYecrMgyhAeDv8OByoGfXCXCu+nEQyt/4GmayS/TtAhNDPrfIAUPZFjwsn8hGiD
	rDbA==
X-Gm-Message-State: AKS2vOwdb/N+Ae6booGH3jmTCOJZk5Fvg7i0EeJvzBaZKyCTiznDFFsL
	m22UQ3GY/u42xpW/4G4=
X-Received: by 10.223.139.24 with SMTP id n24mr13220001wra.116.1498489892959; 
	Mon, 26 Jun 2017 08:11:32 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d91sm368379wma.7.2017.06.26.08.11.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jun 2017 08:11:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Jun 2017 16:11:15 +0100
Message-Id: <20170626151117.6221-6-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170626151117.6221-1-ross.burton@intel.com>
References: <20170626151117.6221-1-ross.burton@intel.com>
Subject: [meta-oe][PATCH 6/8] meson: remove redundant patch
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
X-List-Received-Date: Mon, 26 Jun 2017 15:11:32 -0000

This patch doesn't apply to 0.40.1 and hopefully the PKG_CONFIG patch fixes the
problem with the wrong pkg-config binary being invoked.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../meson/meson/native_bindir.patch                | 52 ----------------------
 1 file changed, 52 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/meson/meson/native_bindir.patch

diff --git a/meta-oe/recipes-devtools/meson/meson/native_bindir.patch b/meta-oe/recipes-devtools/meson/meson/native_bindir.patch
deleted file mode 100644
index 53eeff7b6..000000000
--- a/meta-oe/recipes-devtools/meson/meson/native_bindir.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-diff --git a/mesonbuild/dependencies.py b/mesonbuild/dependencies.py
-index da73a57b7ecd..22100f69c580 100644
---- a/mesonbuild/dependencies.py
-+++ b/mesonbuild/dependencies.py
-@@ -65,7 +65,7 @@ class Dependency():
-     def need_threads(self):
-         return False
- 
--    def get_pkgconfig_variable(self, variable_name):
-+    def get_pkgconfig_variable(self, variable_name, use_native=False):
-         raise MesonException('Tried to get a pkg-config variable from a non-pkgconfig dependency.')
- 
- class InternalDependency(Dependency):
-@@ -177,8 +177,12 @@ class PkgConfigDependency(Dependency):
-         return s.format(self.__class__.__name__, self.name, self.is_found,
-                         self.version_reqs)
- 
--    def _call_pkgbin(self, args):
--        p, out = Popen_safe([self.pkgbin] + args, env=os.environ)[0:2]
-+    def _call_pkgbin(self, args, use_native=False):
-+        if use_native:
-+            pkgbin = [self.pkgbin + "-native"]
-+        else:
-+            pkgbin = [self.pkgbin]
-+        p, out = Popen_safe(pkgbin + args, env=os.environ)[0:2]
-         return (p.returncode, out.strip())
- 
-     def _set_cargs(self):
-@@ -212,8 +216,8 @@ class PkgConfigDependency(Dependency):
-                 self.is_libtool = True
-             self.libs.append(lib)
- 
--    def get_pkgconfig_variable(self, variable_name):
--        ret, out = self._call_pkgbin(['--variable=' + variable_name, self.name])
-+    def get_pkgconfig_variable(self, variable_name, use_native=False):
-+        ret, out = self._call_pkgbin(['--variable=' + variable_name, self.name], use_native=use_native)
-         variable = ''
-         if ret != 0:
-             if self.required:
-@@ -933,10 +937,10 @@ class QtBaseDependency(Dependency):
-             corekwargs = {'required': 'false', 'silent': 'true'}
-             core = PkgConfigDependency(self.qtpkgname + 'Core', env, corekwargs)
-         # Used by self.compilers_detect()
--        self.bindir = core.get_pkgconfig_variable('host_bins')
-+        self.bindir = core.get_pkgconfig_variable('host_bins', use_native=True)
-         if not self.bindir:
-             # If exec_prefix is not defined, the pkg-config file is broken
--            prefix = core.get_pkgconfig_variable('exec_prefix')
-+            prefix = core.get_pkgconfig_variable('exec_prefix', use_native=True)
-             if prefix:
-                 self.bindir = os.path.join(prefix, 'bin')
- 
-- 
2.11.0


