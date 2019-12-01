Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5C6EE7F65C
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Dec 2019 16:51:38 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id n1so41173337wra.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Dec 2019 08:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Mu8ZuFk/+q+876TUTVeYSpRfsmERg6cRKzKzCM8OX8s=;
	b=qtXi28DvbnK9K1hdSatqrI3OzqMiwjNPw0gn4fm6n0lJeGzBuP8r8pxXeXsRMDPe5+
	jn1eEZa5Si5tK+cNSfalfS7qZgzLOytNkDSIC0YREFiyledvIThJ8/R+z6c+vagwFiCP
	g10jrXGa0NRmWcr+OHSTGaIhKKyBBsTtm3/zTtBaMWznSy0hMFDMXEaAVzMPxpxgw8iO
	HnHWFDZuNvUdukKiGgHzYi+boDApFLGI6PCJ9OHBk5lPAet+WdDW2W9HaIhzcrtz42Wi
	omxRflPITIyVgn8+cffyWVx5jKdBISkSTZLhb0qs+8sX2GxKnrUWUxCdggdm6i4VYfZG
	fTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Mu8ZuFk/+q+876TUTVeYSpRfsmERg6cRKzKzCM8OX8s=;
	b=Ih0fHMRrXs5kgMUFNyKnyo0picZ7qz6+eJSotJmBfL5Z5vlXaaN5Wae0A5dxCBAebb
	m70W0LLBCvfSqT8kmEtvtryOut1uQ5+vP5nD2/SJ0b2AgrBasi713UzPmCeC9bGs6tj2
	8BjSm1uS4EOFRBAmKSwMjNWdGYkuYkcgdDzXrC72xj/8caPSBCDsxlbMpIP/AdNK94ej
	yihrf6nIYxOcF4ILjhNms1dz46QZJJta/XTKbrlzAGlGC34/KUmqVgRspB8dBwEtq/U+
	czg6TmaHb6aY13qtl1yqSksy2wWwfZhf+it2vcxDCz3s9jIxqUAyW4qTGxWzEZD2G5dr
	q/Uw==
X-Gm-Message-State: APjAAAUjvS+LnoyEYUbS1A2tBya8GzqhzltwDpDFWlNioSdoz/CpCBJP
	aEQIZNmYPOlYaYIRUojpC4//36hO
X-Google-Smtp-Source: APXvYqx99lp8OuEjDPMpx7bN/7Cz05L93KBvqR/TTn3N1Wqxe6lMitG35nZjWqvZcDwxG683RRwrQA==
X-Received: by 2002:adf:e78a:: with SMTP id n10mr45196645wrm.62.1575219098843; 
	Sun, 01 Dec 2019 08:51:38 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CDB845ACDC091B17366D2.dip0.t-ipconnect.de.
	[2003:f0:7f3c:db84:5acd:c091:b173:66d2])
	by smtp.gmail.com with ESMTPSA id g7sm6228088wrq.21.2019.12.01.08.51.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Dec 2019 08:51:38 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Dec 2019 17:51:23 +0100
Message-Id: <20191201165123.12699-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191201165123.12699-1-schnitzeltony@gmail.com>
References: <20191201165123.12699-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] nodejs: Add PACKAGECONFIG share to allow other projects to use node as library
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
X-List-Received-Date: Sun, 01 Dec 2019 16:51:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are so many useful modules written for node.js I would like to use in
C++/Qt projects.

Run-tested both variants by installing node-red with npm and running it.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...Install-both-binaries-and-use-libdir.patch | 96 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_10.17.0.bb |  5 +-
 2 files changed, 100 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries-and-use-libdir.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries-and-use-libdir.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries-and-use-libdir.patch
new file mode 100644
index 000000000..7aa70fec9
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries-and-use-libdir.patch
@@ -0,0 +1,96 @@
+From 5bfeffdf4b5de1c60a2ff0d1ddf65db2bb9a1533 Mon Sep 17 00:00:00 2001
+From: Elliott Sales de Andrade <quantum.analyst@gmail.com>
+Date: Tue, 19 Mar 2019 23:22:40 -0400
+Subject: [PATCH 3/3] Install both binaries and use libdir.
+
+This allows us to build with a shared library for other users while
+still providing the normal executable.
+
+Signed-off-by: Elliott Sales de Andrade <quantum.analyst@gmail.com>
+
+Stolen from [1]
+
+[1] https://src.fedoraproject.org/rpms/nodejs/raw/master/f/0003-Install-both-binaries-and-use-libdir.patch
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+
+---
+ configure.py     |  7 +++++++
+ tools/install.py | 31 ++++++++++++++-----------------
+ 2 files changed, 21 insertions(+), 17 deletions(-)
+
+diff --git a/configure.py b/configure.py
+index cfd4207..eb26f7d 100755
+--- a/configure.py
++++ b/configure.py
+@@ -552,6 +552,12 @@ parser.add_option('--shared',
+     help='compile shared library for embedding node in another project. ' +
+          '(This mode is not officially supported for regular applications)')
+ 
++parser.add_option('--libdir',
++    action='store',
++    dest='libdir',
++    default='lib',
++    help='a directory to install the shared library into')
++
+ parser.add_option('--without-v8-platform',
+     action='store_true',
+     dest='without_v8_platform',
+@@ -1095,6 +1101,7 @@ def configure_node(o):
+   if options.code_cache_path:
+     o['variables']['node_code_cache_path'] = options.code_cache_path
+   o['variables']['node_shared'] = b(options.shared)
++  o['variables']['libdir'] = options.libdir
+   node_module_version = getmoduleversion.get_version()
+ 
+   if sys.platform == 'darwin':
+diff --git a/tools/install.py b/tools/install.py
+index 028c32e..bf443c4 100755
+--- a/tools/install.py
++++ b/tools/install.py
+@@ -117,26 +117,23 @@ def subdir_files(path, dest, action):
+ 
+ def files(action):
+   is_windows = sys.platform == 'win32'
+-  output_file = 'node'
+   output_prefix = 'out/Release/'
++  output_libprefix = output_prefix
+ 
+-  if 'false' == variables.get('node_shared'):
+-    if is_windows:
+-      output_file += '.exe'
++  if is_windows:
++    output_bin = 'node.exe'
++    output_lib = 'node.dll'
+   else:
+-    if is_windows:
+-      output_file += '.dll'
+-    else:
+-      output_file = 'lib' + output_file + '.' + variables.get('shlib_suffix')
+-      # GYP will output to lib.target except on OS X, this is hardcoded
+-      # in its source - see the _InstallableTargetInstallPath function.
+-      if sys.platform != 'darwin':
+-        output_prefix += 'lib.target/'
+-
+-  if 'false' == variables.get('node_shared'):
+-    action([output_prefix + output_file], 'bin/' + output_file)
+-  else:
+-    action([output_prefix + output_file], 'lib/' + output_file)
++    output_bin = 'node'
++    output_lib = 'libnode.' + variables.get('shlib_suffix')
++    # GYP will output to lib.target except on OS X, this is hardcoded
++    # in its source - see the _InstallableTargetInstallPath function.
++    if sys.platform != 'darwin':
++      output_libprefix += 'lib.target/'
++
++  action([output_prefix + output_bin], 'bin/' + output_bin)
++  if 'true' == variables.get('node_shared'):
++    action([output_libprefix + output_lib], variables.get('libdir') + '/' + output_lib)
+ 
+   if 'true' == variables.get('node_use_dtrace'):
+     action(['out/Release/node.d'], 'lib/dtrace/node.d')
+-- 
+2.23.0
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
index e36995c25..71a47636b 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
@@ -17,12 +17,13 @@ COMPATIBLE_HOST_riscv32 = "null"
 
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
+           file://0003-Install-both-binaries-and-use-libdir.patch \
            file://0004-Make-compatibility-with-gcc-4.8.patch \
            file://0007-v8-don-t-override-ARM-CFLAGS.patch \
            "
 SRC_URI_append_class-target = " \
-           file://0005-Link-atomic-library.patch \
            file://0002-Using-native-torque.patch \
+           file://0005-Link-atomic-library.patch \
            "
 
 SRC_URI[md5sum] = "d5a56d0abf764a91f627f0690cd4b9f3"
@@ -57,6 +58,7 @@ PACKAGECONFIG[gyp] = ",,gyp-py2-native"
 PACKAGECONFIG[icu] = "--with-intl=system-icu,--without-intl,icu"
 PACKAGECONFIG[libuv] = "--shared-libuv,,libuv"
 PACKAGECONFIG[nghttp2] = "--shared-nghttp2,,nghttp2"
+PACKAGECONFIG[shared] = "--shared"
 PACKAGECONFIG[zlib] = "--shared-zlib,,zlib"
 
 # We don't want to cross-compile during target compile,
@@ -99,6 +101,7 @@ do_configure () {
    ./configure --prefix=${prefix} --without-snapshot --shared-openssl \
                --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH'), d)}" \
                --dest-os=linux \
+               --libdir=${D}${libdir} \
                ${ARCHFLAGS} \
                ${PACKAGECONFIG_CONFARGS}
 }
-- 
2.21.0


