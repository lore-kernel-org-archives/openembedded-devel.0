Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1F57E619CC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 13:45:38 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id z15so4447391wrl.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2020 05:45:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=m3k90g6WHWAgr3hz3g7MSiENc6eRExH2aPjrJ2WhJSg=;
	b=o6Y9+972maKsF6hvF8oExkCq6E+xEsqOO76/w5AfDI4PWyklD9JNcpSNa07ut9EGNS
	7Dyv/AnfnDq05lw3hRoUgO1gmhgbSUPsLicRGjXaAsa6/w1KkF+0cXYdkQVxnaP1/wgK
	CgopTSiKohNhsMyTL0hbTHIf0vlXDD7vXGW07gfN1iaoKfdt8E4LuNYNFlT5O2syF4B4
	yzfmfXNnoAcilWwNyaA+ZqC/9xYVo3aGhWlHJT8TI2KTJYPBwkgQ32U3AtXIyyL96ZDt
	Xr9gPPIDyDnsISBro2pnfh1psEES9HY6xxDuWDspsopXVM8pBMGeOIfty2DxVlLkkB16
	bc9A==
X-Gm-Message-State: ANhLgQ3sLx2B5Ufyl8Gp68AmyEEtkiiQqlu16dxiGr9OKRqnc1NAHTVB
	Tp9zXqAknFuer67wpYJxgbLgiMdD
X-Google-Smtp-Source: ADFU+vt+9yd4VL90GIkSTH1rq5to50SzZTpJwzUilGjA3jwvdogcU8y2C1QexzD5PQGxBKuX8vJCXA==
X-Received: by 2002:a5d:550f:: with SMTP id b15mr5591321wrv.19.1583243138975; 
	Tue, 03 Mar 2020 05:45:38 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id k2sm2411251wrn.57.2020.03.03.05.45.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Mar 2020 05:45:38 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Mar 2020 13:45:34 +0000
Message-Id: <20200303134534.36509-3-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200303134534.36509-1-git@andred.net>
References: <20200303134534.36509-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] nodejs: allow use of system brotli (and make default)
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
X-List-Received-Date: Tue, 03 Mar 2020 13:45:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Use system brotli via PACKAGECONFIG by default. So far,
nodejs had been built using its embedded copy of brotli,
which we generally try to avoid, for the known reasons
(independent updates, cve & license checks, etc).

The nodejs patches to enable this have been submitted.
brotli is in meta-oe, so enabling this by default should
not be a problem.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 ...-passing-multiple-libs-to-pkg_config.patch | 41 ++++++++++++
 ...allow-use-of-system-installed-brotli.patch | 66 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_12.14.1.bb |  7 +-
 3 files changed, 113 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-build-allow-passing-multiple-libs-to-pkg_config.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0002-build-allow-use-of-system-installed-brotli.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-allow-passing-multiple-libs-to-pkg_config.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-allow-passing-multiple-libs-to-pkg_config.patch
new file mode 100644
index 000000000..13edf229b
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-allow-passing-multiple-libs-to-pkg_config.patch
@@ -0,0 +1,41 @@
+From fdaa0e3bef93c5c72a7258b5f1e30718e7d81f9b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
+Date: Mon, 2 Mar 2020 12:17:09 +0000
+Subject: [PATCH 1/2] build: allow passing multiple libs to pkg_config
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Sometimes it's necessary to pass multiple library names to pkg-config,
+e.g. the brotli shared libraries can be pulled in with
+    pkg-config libbrotlienc libbrotlidec
+
+Update the code to handle both, strings (as used so far), and lists
+of strings.
+
+Signed-off-by: André Draszik <git@andred.net>
+---
+Upstream-Status: Submitted [https://github.com/nodejs/node/pull/32046]
+ configure.py | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/configure.py b/configure.py
+index beb08df088..e3f78f2fed 100755
+--- a/configure.py
++++ b/configure.py
+@@ -680,7 +680,11 @@ def pkg_config(pkg):
+   retval = ()
+   for flag in ['--libs-only-l', '--cflags-only-I',
+                '--libs-only-L', '--modversion']:
+-    args += [flag, pkg]
++    args += [flag]
++    if isinstance(pkg, list):
++      args += pkg
++    else:
++      args += [pkg]
+     try:
+       proc = subprocess.Popen(shlex.split(pkg_config) + args,
+                               stdout=subprocess.PIPE)
+-- 
+2.25.0
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0002-build-allow-use-of-system-installed-brotli.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0002-build-allow-use-of-system-installed-brotli.patch
new file mode 100644
index 000000000..fc038f3aa
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0002-build-allow-use-of-system-installed-brotli.patch
@@ -0,0 +1,66 @@
+From f0f927feee8cb1fb173835d5c3f6beb6bf7d5e54 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
+Date: Mon, 2 Mar 2020 12:17:35 +0000
+Subject: [PATCH 2/2] build: allow use of system-installed brotli
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+brotli is available as a shared library since 2016, so it makes sense
+to allow its use as a system-installed version.
+
+Some of the infrastructure was in place already (node.gyp and
+node.gypi), but some bits in the configure script here were missing.
+
+Add them, keeping the default as before, to use the bundled version.
+
+Refs: https://github.com/google/brotli/pull/421
+Signed-off-by: André Draszik <git@andred.net>
+---
+Upstream-Status: Submitted [https://github.com/nodejs/node/pull/32046]
+ configure.py | 22 ++++++++++++++++++++++
+ 1 file changed, 22 insertions(+)
+
+diff --git a/configure.py b/configure.py
+index e3f78f2fed..0190e31b41 100755
+--- a/configure.py
++++ b/configure.py
+@@ -301,6 +301,27 @@ shared_optgroup.add_option('--shared-zlib-libpath',
+     dest='shared_zlib_libpath',
+     help='a directory to search for the shared zlib DLL')
+ 
++shared_optgroup.add_option('--shared-brotli',
++    action='store_true',
++    dest='shared_brotli',
++    help='link to a shared brotli DLL instead of static linking')
++
++shared_optgroup.add_option('--shared-brotli-includes',
++    action='store',
++    dest='shared_brotli_includes',
++    help='directory containing brotli header files')
++
++shared_optgroup.add_option('--shared-brotli-libname',
++    action='store',
++    dest='shared_brotli_libname',
++    default='brotlidec,brotlienc',
++    help='alternative lib name to link to [default: %default]')
++
++shared_optgroup.add_option('--shared-brotli-libpath',
++    action='store',
++    dest='shared_brotli_libpath',
++    help='a directory to search for the shared brotli DLL')
++
+ shared_optgroup.add_option('--shared-cares',
+     action='store_true',
+     dest='shared_cares',
+@@ -1692,6 +1713,7 @@ configure_napi(output)
+ configure_library('zlib', output)
+ configure_library('http_parser', output)
+ configure_library('libuv', output)
++configure_library('brotli', output, pkgname=['libbrotlidec', 'libbrotlienc'])
+ configure_library('cares', output, pkgname='libcares')
+ configure_library('nghttp2', output, pkgname='libnghttp2')
+ configure_v8(output)
+-- 
+2.25.0
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
index 49bb71e28..1ea438c5b 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
@@ -20,6 +20,8 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0003-Install-both-binaries-and-use-libdir.patch \
            file://0004-v8-don-t-override-ARM-CFLAGS.patch \
            file://big-endian.patch \
+           file://0001-build-allow-passing-multiple-libs-to-pkg_config.patch \
+           file://0002-build-allow-use-of-system-installed-brotli.patch \
            "
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
@@ -51,8 +53,9 @@ ARCHFLAGS_arm = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', '-
 GYP_DEFINES_append_mipsel = " mips_arch_variant='r1' "
 ARCHFLAGS ?= ""
 
-PACKAGECONFIG ??= "ares icu libuv zlib"
+PACKAGECONFIG ??= "ares brotli icu libuv zlib"
 PACKAGECONFIG[ares] = "--shared-cares,,c-ares"
+PACKAGECONFIG[brotli] = "--shared-brotli,,brotli"
 PACKAGECONFIG[icu] = "--with-intl=system-icu,--without-intl,icu"
 PACKAGECONFIG[libuv] = "--shared-libuv,,libuv"
 PACKAGECONFIG[nghttp2] = "--shared-nghttp2,,nghttp2"
@@ -81,6 +84,8 @@ python do_unpack() {
     shutil.rmtree(d.getVar('S') + '/deps/openssl', True)
     if 'ares' in d.getVar('PACKAGECONFIG'):
         shutil.rmtree(d.getVar('S') + '/deps/cares', True)
+    if 'brotli' in d.getVar('PACKAGECONFIG'):
+        shutil.rmtree(d.getVar('S') + '/deps/brotli', True)
     if 'libuv' in d.getVar('PACKAGECONFIG'):
         shutil.rmtree(d.getVar('S') + '/deps/uv', True)
     if 'nghttp2' in d.getVar('PACKAGECONFIG'):
-- 
2.23.0.rc1


