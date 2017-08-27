Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 17921782D9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Aug 2017 01:28:42 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 83so3587752pgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2017 18:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CngZv+bfk3QnJa3brQpx/o7hNBv95VnQEJfh1oyT1+w=;
	b=kjUjVjaEDN4Grd0LE6vvAkUOIQLWOvHUtr9Wc/kllcjVxZUsDZ5B+88/l+Zsn/RYXs
	X9j5XfwWYGV60MpYYdB19QBkeqRduiJFSr38alvdPAB63Px5Ugfke2CUbSvQRhpPXy0I
	shLtGNLwG9R1MIsVpWFlMkzEuWE6ck0XgfaGwUoDHa/zQJd5Zmr4BcGkgmV/MYKIm6c3
	4cpkl5V7Mta0GHaqbDlrDHc7IUz4SObF1EA8uaxYj3L9bYzjZDCOkieE9eULip8KltFL
	LY5GtIkH4JTUgL+9NYbhjXSBwO+qT9NsYMzb8kLvgUWkXAvYt6moHT3DUV+KwV3SA2GY
	BzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CngZv+bfk3QnJa3brQpx/o7hNBv95VnQEJfh1oyT1+w=;
	b=R2Hkov2434ZV2XDB2xBkd2BC8Rv//qqu1e5GNRKJeoCHiS5Bm9hPrseaaCjyP1Z61Z
	Pc0wSIxoRUBOCLWZygrIw40tJKlC012hvbZmj66cEJjLfTW5f6A+xo+7UZuIUj6rf+BB
	rxqJoH3eEPsCXuq5Yi9pAQLvLzrDtluObwnkgkIIjJZLxi+/x+4Rs4RbFKmbqlZEkL2i
	A0eeerb+Bi9n4O48+VEV2tPGBm2ISsMZHRgCV/JZwEaEbb+IyXDAXnc7oqOYkoKqFe9g
	KXEoMWZpKfUPPaWY7xDu0rtSYiKnIiT6Xu0UwOW2FwzF8HqbihQUQANgracijKSPcfjr
	nJuQ==
X-Gm-Message-State: AHYfb5hIK7WSSKHTqui/mPyg5wlNgm2uBYvwhzEu73jrspCVpX/hPihj
	2sx2uafIHZ3k1uo5
X-Received: by 10.99.23.100 with SMTP id 36mr3214873pgx.118.1503797323415;
	Sat, 26 Aug 2017 18:28:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	f123sm19301150pfg.86.2017.08.26.18.28.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Aug 2017 18:28:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Aug 2017 18:28:30 -0700
Message-Id: <20170827012830.11782-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170827012830.11782-1-raj.khem@gmail.com>
References: <20170827012830.11782-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] nodejs: Upgrade to 8.4.0
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
X-List-Received-Date: Sun, 27 Aug 2017 01:28:42 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...isable-running-gyp-files-for-bundled-deps.patch | 29 ++++++++++++++++++++++
 ...isable-running-gyp-files-for-bundled-deps.patch | 29 ++++++++++++++++++++++
 .../nodejs/{nodejs_4.8.3.bb => nodejs_8.4.0.bb}    | 13 +++++-----
 3 files changed, 65 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_4.8.3.bb => nodejs_8.4.0.bb} (88%)

diff --git a/meta-oe/recipes-devtools/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch b/meta-oe/recipes-devtools/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
new file mode 100644
index 000000000..324a4683d
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
@@ -0,0 +1,29 @@
+From c2aff16cc196a61f4ab1cdae4a91c7926123c239 Mon Sep 17 00:00:00 2001
+From: Zuzana Svetlikova <zsvetlik@redhat.com>
+Date: Thu, 27 Apr 2017 14:25:42 +0200
+Subject: [PATCH] Disable running gyp on shared deps
+
+---
+ Makefile | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 0a217bd893..e1229ad07f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -79,10 +79,9 @@ $(NODE_G_EXE): config.gypi out/Makefile
+ 	$(MAKE) -C out BUILDTYPE=Debug V=$(V)
+ 	if [ ! -r $@ -o ! -L $@ ]; then ln -fs out/Debug/$(NODE_EXE) $@; fi
+ 
+-out/Makefile: common.gypi deps/uv/uv.gyp deps/http_parser/http_parser.gyp \
+-              deps/zlib/zlib.gyp deps/v8/gypfiles/toolchain.gypi \
+-              deps/v8/gypfiles/features.gypi deps/v8/src/v8.gyp node.gyp \
+-              config.gypi
++out/Makefile: common.gypi deps/http_parser/http_parser.gyp \
++              deps/v8/gypfiles/toolchain.gypi deps/v8/gypfiles/features.gypi \
++			  deps/v8/src/v8.gyp node.gyp config.gypi
+ 	$(PYTHON) tools/gyp_node.py -f make
+ 
+ config.gypi: configure
+-- 
+2.12.2
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
new file mode 100644
index 000000000..324a4683d
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
@@ -0,0 +1,29 @@
+From c2aff16cc196a61f4ab1cdae4a91c7926123c239 Mon Sep 17 00:00:00 2001
+From: Zuzana Svetlikova <zsvetlik@redhat.com>
+Date: Thu, 27 Apr 2017 14:25:42 +0200
+Subject: [PATCH] Disable running gyp on shared deps
+
+---
+ Makefile | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 0a217bd893..e1229ad07f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -79,10 +79,9 @@ $(NODE_G_EXE): config.gypi out/Makefile
+ 	$(MAKE) -C out BUILDTYPE=Debug V=$(V)
+ 	if [ ! -r $@ -o ! -L $@ ]; then ln -fs out/Debug/$(NODE_EXE) $@; fi
+ 
+-out/Makefile: common.gypi deps/uv/uv.gyp deps/http_parser/http_parser.gyp \
+-              deps/zlib/zlib.gyp deps/v8/gypfiles/toolchain.gypi \
+-              deps/v8/gypfiles/features.gypi deps/v8/src/v8.gyp node.gyp \
+-              config.gypi
++out/Makefile: common.gypi deps/http_parser/http_parser.gyp \
++              deps/v8/gypfiles/toolchain.gypi deps/v8/gypfiles/features.gypi \
++			  deps/v8/src/v8.gyp node.gyp config.gypi
+ 	$(PYTHON) tools/gyp_node.py -f make
+ 
+ config.gypi: configure
+-- 
+2.12.2
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.8.3.bb b/meta-oe/recipes-devtools/nodejs/nodejs_8.4.0.bb
similarity index 88%
rename from meta-oe/recipes-devtools/nodejs/nodejs_4.8.3.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_8.4.0.bb
index 7fde77891..5c580fb72 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_4.8.3.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_8.4.0.bb
@@ -1,19 +1,19 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f45e9ffb97e64da46d14f462d34a039f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e4d35c6120f175e1fbe5ff908b1cf2d6"
 
-DEPENDS = "openssl zlib"
+DEPENDS = "openssl10 zlib"
 
 COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
 COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
-    file://no-registry.patch \
+           file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
 "
-SRC_URI[md5sum] = "dc40053a74100ce6df641a5b4c4d4d1e"
-SRC_URI[sha256sum] = "d84e7544c2e31a2d0825b4f8b093d169bf8bdb1881ee8cf75ff937918e59e9cb"
+SRC_URI[md5sum] = "e6c85c83001340b30671e9432e1bd337"
+SRC_URI[sha256sum] = "5d5aa2a101dcc617231a475812eb8ed87cac21491f1dcc7997b9dd463563f361"
 
 S = "${WORKDIR}/node-v${PV}"
 
@@ -40,10 +40,11 @@ ARCHFLAGS ?= ""
 
 # Node is way too cool to use proper autotools, so we install two wrappers to forcefully inject proper arch cflags to workaround gypi
 do_configure () {
+    rm -rf ${S}/deps/openssl
     export LD="${CXX}"
     GYP_DEFINES="${GYP_DEFINES}" export GYP_DEFINES
     # $TARGET_ARCH settings don't match --dest-cpu settings
-   ./configure --prefix=${prefix} --without-snapshot --shared-openssl --shared-zlib \
+   ./configure --prefix=${prefix} --without-intl --without-snapshot --shared-openssl --shared-zlib \
                --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH'), d)}" \
                --dest-os=linux \
                ${ARCHFLAGS}
-- 
2.14.1


