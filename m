Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6252D7F93A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Nov 2019 22:05:11 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id a15so12538220wrf.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Nov 2019 14:05:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ELukgLbgHXYC7p/mXMoDo7S89x1Iwh4ITfdqafFWbRM=;
	b=d9bDmQ6+hcPu9LYA7yx/Vqq8DwI8gzy6HXeDvcXM+RlSfwhCViTiUWMFYW8AXF3F+c
	CYRqbt3G+CdKMp+jZRfvCGhAEQ5jKdMG6PbwU3SAdBrGJzNv0PZQg5ZvvHHIrgzHVVSe
	o5FkxbWBmTe5965EgA+J/IsJZQwAGuu9VGXJwaDkgriygqIfe3E5+LBhcBgc6wv8I7Cb
	eWso5ie3+osG0RpgsVOQ/HPvg68K97q3Ll697a62YH14bIZDwAzjr2EOPXft9QRSAo0t
	NN9BEazX7VlqU/ZdUqeviKPXyq7r+VtprxN2kKHsVa3Yl8/BgVUauYwywzE1xO3mZjTT
	jIxA==
X-Gm-Message-State: APjAAAV609hczkmsm/5CRH2J4ghRlntlXI9LQFJAAr8x9e9zA2mjd8YP
	XOxWQ3BQt2of3rD4ibhMLflZ4us+
X-Google-Smtp-Source: APXvYqzX3G/7U2QGlft8aitcXrDyUieZvyzUGcpR2TYLTDPG4jTkkmyVeu8ENzH+9LDz2f7P4pOATQ==
X-Received: by 2002:adf:b746:: with SMTP id n6mr17596318wre.65.1573423511698; 
	Sun, 10 Nov 2019 14:05:11 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	t24sm29925375wra.55.2019.11.10.14.05.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 10 Nov 2019 14:05:11 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Nov 2019 22:05:06 +0000
Message-Id: <20191110220510.10077-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/5] nodejs: ensure to use correct compiler & flags always
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
X-List-Received-Date: Sun, 10 Nov 2019 22:05:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

NodeJS comes with an embedded, patched, version of gyp.

Normally, gyp supports compiling for the build machine, e.g.
native tools that need to be compiled to run during the build,
and for the host, using different variables, e.g. CC and
CC.host, etc.
Most of this has been patched out in the NodeJS version of gyp,
and essentially it only supports compiling using one compiler -
${CC}. This modification excludes LDFLAGS for native tools, and
those still evaluate LDFLAGS.host (only).

While this modified behaviour is OK for the OE use-case of building
native and target tools separately, it means that this recipe can
not work as-is with standard gyp, and wrong LDFLAGS are being used
for some of the tools compiled (torque) in either case.

By setting the make variables that gyp-generated makefiles inspect,
we support use of unpatched gyp, and we ensure that all tools
are compiled with correct LDFLAGS in either case.

This now also allows us to drop the patch that had been applied to
work-around this problem.

Signed-off-by: André Draszik <git@andred.net>
---
 .../nodejs/0006-Use-target-ldflags.patch      | 24 -------------------
 .../recipes-devtools/nodejs/nodejs_10.17.0.bb | 13 +++++++++-
 2 files changed, 12 insertions(+), 25 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0006-Use-target-ldflags.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0006-Use-target-ldflags.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0006-Use-target-ldflags.patch
deleted file mode 100644
index f6569cd57..000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0006-Use-target-ldflags.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-The target LDFLAGS have been ignored. Tools like torque
-have been loaded from system libraries, even if a native
-one was the target.
-|$ ldd torque 
-|    libz.so.1 => /lib/x86_64-linux-gnu/libz.so.1
-|    libcrypto.so.1.1 => /usr/lib/x86_64-linux-gnu/libcrypto.so.1.1
-|    libssl.so.1.1 => /usr/lib/x86_64-linux-gnu/libssl.so.1.1
-|    libicui18n.so.63 => not found
-|    libicuuc.so.63 => not found
-...
-
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-
-diff -Naur node-v10.15.1/deps/v8/gypfiles/toolchain.gypi node-v10.15.1/deps/v8/gypfiles/toolchain.gypi
---- node-v10.15.1/deps/v8/gypfiles/toolchain.gypi	2019-03-18 15:01:39.000000000 +0100
-+++ node-v10.15.1/deps/v8/gypfiles/toolchain.gypi	2019-03-18 15:04:08.628361308 +0100
-@@ -1106,6 +1106,7 @@
-             'cflags': [ '-fno-strict-aliasing' ],
-           }],
-         ],  # conditions
-+        'ldflags+': [ '$(LDFLAGS)' ],
-       }],
-       ['OS=="solaris"', {
-         'defines': [ '__C99FEATURES__=1' ],  # isinf() etc.
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
index 4013c6931..9c514e6be 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
@@ -19,7 +19,6 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
            file://0004-Make-compatibility-with-gcc-4.8.patch \
            file://0005-Link-atomic-library.patch \
-           file://0006-Use-target-ldflags.patch \
            "
 SRC_URI_append_class-target = " \
            file://0002-Using-native-torque.patch \
@@ -58,6 +57,18 @@ PACKAGECONFIG[libuv] = "--shared-libuv,,libuv"
 PACKAGECONFIG[nghttp2] = "--shared-nghttp2,,nghttp2"
 PACKAGECONFIG[zlib] = "--shared-zlib,,zlib"
 
+# We don't want to cross-compile during target compile,
+# and we need to use the right flags during host compile,
+# too.
+EXTRA_OEMAKE_append = "\
+    CC.host='${CC}' \
+    CFLAGS.host='${CPPFLAGS} ${CFLAGS}' \
+    CXX.host='${CXX}' \
+    CXXFLAGS.host='${CPPFLAGS} ${CXXFLAGS}' \
+    LDFLAGS.host='${LDFLAGS}' \
+    AR.host='${AR}' \
+"
+
 # Node is way too cool to use proper autotools, so we install two wrappers to forcefully inject proper arch cflags to workaround gypi
 do_configure () {
     rm -rf ${S}/deps/openssl
-- 
2.23.0.rc1


