Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4713C7F79E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 11:44:05 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t1so2671290wrv.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Nov 2019 03:44:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JBeEIRCAQZ8IZJTxNCr2pzTiOvKbmp+ylevBi13/cgA=;
	b=SxrlI0ki2owbiQZx+2qTtnfxHyzNtSa1kcYTNEKyPzefLATJfG4pmj8AkAvfZpnq1z
	KSdb4++xSZfDLpZ2kjAnKYjIuTxpnBSGJcWFTPC4/WDJGBbiycDhGGzKNVSqf88pkkWM
	ZQiVd4uKr9+Hf8kJngPVwrdJ0ylYb6l0y0oJ3qtZIgp/V4ZkqCcwnaK7mD3RyGOL+/0s
	mOlcxfzy3jLyQnDfKdtY50Jj1eGLdpEXv0qd83dO+xRAOtG3Oah8eHZSYbuJEYYmLHl6
	KY157JovsM25BlzKNOwA5U2IaLtpGcnV2bJheNyc3YViKnwN5RQrs27eCXTq72NFjA38
	gOhA==
X-Gm-Message-State: APjAAAXSfFn1AwzvrVpvilplkBNg8o4tC0RxSN0bIof4CBeK7w3xm9cO
	9PrFz3QDrsd3VS2Lo8GVAeWvdr6X
X-Google-Smtp-Source: APXvYqw7aLkpT0/xrFXBru+I8xngDRR1TQyOwmjwwLbJUePjkJnszcXO7zBssrfrc6uho9xCKd0Zug==
X-Received: by 2002:a5d:4885:: with SMTP id g5mr2581149wrq.287.1573127045528; 
	Thu, 07 Nov 2019 03:44:05 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 76sm2283613wma.0.2019.11.07.03.44.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 03:44:04 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Nov 2019 11:44:01 +0000
Message-Id: <20191107114402.933-3-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20191107114402.933-1-git@andred.net>
References: <20191107114402.933-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 3/4] nghttp2: build more of this & fix packaging
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
X-List-Received-Date: Thu, 07 Nov 2019 11:44:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nghttp2 also provides http client, server, and proxy.
Add the necessary DEPENDS and build flags to enable those.

They are all packaged into individual packages, with
'nghttp2' being a meta-package now and pulling in all
of the above three applications.

The shared library itself (the only part that this recipe
had been building so far), is also being split into its
own package, meaning existing users shouldn't be affected,
as nobody should have an RDEPENDS on 'nghttp2' at the
moment (due to bitbake's shlibs dependency tracking).

The deflatehd and inflatehd binaries have been completely
dropped, as they are (header) test applications for HTTP/2.
Debian doesn't ship them either.

The python script fetch-ocsp-response is (only) needed
by the proxy, and itself calls out to openssl. We can easily
make this python3 using a simple patch, though.

Minor additional fixes:
* sort DEPENDS alphabetically
* drop python-dir, this is implied by pythonnative
* inherit manpages so as to benefit from man-db processing
  (note that manpages are not generated here, we just want
  the automatic update of the package index caches)
  We need to add a PACKAGECONFIG, as manpages.bbclass
  requires it to be present, even though nghttp2
  unconditionally installs them

Signed-off-by: André Draszik <git@andred.net>
---
 ...0001-fetch-ocsp-response-use-python3.patch | 27 +++++++++++++++++
 .../recipes-support/nghttp2/nghttp2_1.39.2.bb | 29 +++++++++++++++++--
 2 files changed, 53 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-support/nghttp2/nghttp2/0001-fetch-ocsp-response-use-python3.patch

diff --git a/meta-networking/recipes-support/nghttp2/nghttp2/0001-fetch-ocsp-response-use-python3.patch b/meta-networking/recipes-support/nghttp2/nghttp2/0001-fetch-ocsp-response-use-python3.patch
new file mode 100644
index 000000000..e4db09638
--- /dev/null
+++ b/meta-networking/recipes-support/nghttp2/nghttp2/0001-fetch-ocsp-response-use-python3.patch
@@ -0,0 +1,27 @@
+From 73ec79432fc557a8be4f1500982b1c0f5fdf12a9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
+Date: Thu, 7 Nov 2019 09:58:52 +0000
+Subject: [PATCH] fetch-ocsp-response: use python3
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [oe specific]
+Signed-off-by: André Draszik <git@andred.net>
+---
+ script/fetch-ocsp-response | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/script/fetch-ocsp-response b/script/fetch-ocsp-response
+index 0ff7461..185116b 100755
+--- a/script/fetch-ocsp-response
++++ b/script/fetch-ocsp-response
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
+ 
+ # nghttp2 - HTTP/2 C Library
+-- 
+2.23.0.rc1
+
diff --git a/meta-networking/recipes-support/nghttp2/nghttp2_1.39.2.bb b/meta-networking/recipes-support/nghttp2/nghttp2_1.39.2.bb
index c3f06a714..7a475050f 100644
--- a/meta-networking/recipes-support/nghttp2/nghttp2_1.39.2.bb
+++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.39.2.bb
@@ -3,13 +3,36 @@ HOMEPAGE = "https://nghttp2.org/"
 SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
+DEPENDS = "c-ares cunit jansson libev libevent libxml2 openssl zlib"
 
 UPSTREAM_CHECK_URI = "https://github.com/nghttp2/nghttp2/releases"
 
-SRC_URI = "https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.xz"
+SRC_URI = "\
+    https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.xz \
+    file://0001-fetch-ocsp-response-use-python3.patch \
+"
 SRC_URI[md5sum] = "de52cd6b587b76486346745514972995"
 SRC_URI[sha256sum] = "a2d216450abd2beaf4e200c168957968e89d602ca4119338b9d7ab059fd4ce8b"
 
-DEPENDS = "libxml2 openssl zlib jansson cunit c-ares"
+inherit cmake manpages pythonnative
+PACKAGECONFIG[manpages] = ""
 
-inherit cmake pythonnative python-dir
+# examples are never installed, and don't need to be built in the
+# first place
+EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=ON"
+
+do_install_append() {
+	rm ${D}${bindir}/deflatehd ${D}${bindir}/inflatehd
+}
+
+PACKAGES =+ "lib${PN} ${PN}-client ${PN}-proxy ${PN}-server"
+
+RDEPENDS_${PN} = "${PN}-client (>= ${PV}) ${PN}-proxy (>= ${PV}) ${PN}-server (>= ${PV})"
+RDEPENDS_${PN}-proxy = "openssl python3-core python3-io python3-shell"
+
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN} = ""
+FILES_lib${PN} = "${libdir}/*${SOLIBS}"
+FILES_${PN}-client = "${bindir}/h2load ${bindir}/nghttp"
+FILES_${PN}-proxy = "${bindir}/nghttpx ${datadir}/${BPN}/fetch-ocsp-response"
+FILES_${PN}-server = "${bindir}/nghttpd"
-- 
2.23.0.rc1


