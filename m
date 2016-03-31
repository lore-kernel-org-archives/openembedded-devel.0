Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id C9AD762135
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 17:17:58 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id j35so70860077qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 10:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=GSFmKoTsm5FnsiN8Z0jDOvOEsL5FjOilQt6F/m65ca4=;
	b=BPftJlwAtjhZhMgacj5Rnow7GFyDDHV8lVbLa1XLDNgZzqYedNZDKNUy3IA9x+Qkp7
	Kf8sj4HAbkh/vpkygP9WWji9LT9j4ozA3zlH07U4f5Tnuu8f/LyhElKY/CimrAEYlgUJ
	6vJ2lf8364JeLr0e0zX0RwUZO0uIMGiCcCchzpRlCznhhbWIBz0PrQsucOG+FlnUJKqr
	ukm+N7yRtL2SdfmKJhWrm8eH3KB+Q17hrUbA8xITX2oFFnjmGDrgWZ1e+OGkn8vC0WoI
	c8j+y9k3QJ2Q6BTLP4zkrBhJvgUFRsEquOWvPc47F/qm4N3NDeBFigs+LOOjio8kIo3L
	e/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GSFmKoTsm5FnsiN8Z0jDOvOEsL5FjOilQt6F/m65ca4=;
	b=j9MnnQwzCRGoG3AIpj52wX6aPirW8M+wQC2+ITe6D2qCisl+SEtDhgkZqpA35rl+9B
	1YacJSap1D86ZOa7FMZ2nHX58xi//4KYDFhIBkp8i9uLbaKblpy6ZaUVX5BhS/7fG/+N
	RSI4/Pbf7NaVQKg42AhEwGQfwKTipmT+4AtciDh8NF1hqZxWnbq/q2xEg0iB9rsrIj9y
	trTkB6+SJsofSlK9dVc3oVPi1lAAgpKtXh490oxtjen3sHBG3OQHrB1A2/BMqy//2HJe
	PSK0GjWJZeNWF6pK4hQnGgL461HsO8X5bItRNvr3T0FFAQq/PamSqWVfbPOgdgnHwWM4
	4nMA==
X-Gm-Message-State: AD7BkJLjWXjo19z5BvtZ2kHg4bzuIaV9hHNNUrnQR4Al7Q1EMRED+H9DmThQmFCdUHT3lg==
X-Received: by 10.140.181.137 with SMTP id c131mr19158844qha.94.1459444678675; 
	Thu, 31 Mar 2016 10:17:58 -0700 (PDT)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133]) by smtp.gmail.com with ESMTPSA id
	p101sm3699188qge.13.2016.03.31.10.17.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Mar 2016 10:17:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2016 17:17:51 +0000
Message-Id: <1459444671-7865-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] libtinyxml2: Add packageconfig support
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
X-List-Received-Date: Thu, 31 Mar 2016 17:17:59 -0000

Some package enquire using pkgconfig

Change-Id: I4b7ac35930caf25b8ca04c3f5b34a193d4ed4a3d
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libtinyxml2/libtinyxml2/libtinyxml2.pc         | 10 +++++++++
 .../recipes-support/libtinyxml2/libtinyxml2_git.bb | 26 +++++++++++++---------
 2 files changed, 26 insertions(+), 10 deletions(-)
 create mode 100644 meta-oe/recipes-support/libtinyxml2/libtinyxml2/libtinyxml2.pc

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2/libtinyxml2.pc b/meta-oe/recipes-support/libtinyxml2/libtinyxml2/libtinyxml2.pc
new file mode 100644
index 0000000..ef155a1
--- /dev/null
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2/libtinyxml2.pc
@@ -0,0 +1,10 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: TinyXml2
+Description: simple, small, C++ XML parser
+Version: 2.2.0
+Libs: -L${libdir} -ltinyxml2
+Cflags: -I${includedir}
diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb
index 6ca6f7c..e1760e4 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb
@@ -6,9 +6,13 @@ SECTION = "libs"
 
 SRCREV = "d211bb13512cf4edb408e2c4badbcf4100ce0fd0"
 
-PV = "2.2.0+git${SRCPV}"
+XML2VER = "2.2.0"
 
-SRC_URI = "git://github.com/leethomason/tinyxml2.git"
+PV = "${XML2VER}+git${SRCPV}"
+
+SRC_URI = "git://github.com/leethomason/tinyxml2.git \
+           file://libtinyxml2.pc \
+          "
 
 S = "${WORKDIR}/git"
 
@@ -17,21 +21,23 @@ EXTRA_CXXFLAGS = "-I. -fPIC"
 do_compile() {
     ${CXX} ${CXXFLAGS} ${EXTRA_CXXFLAGS} -c -o tinyxml2.o tinyxml2.cpp
     ${CXX} ${CXXFLAGS} \
-            -shared \
-            -Wl,-soname,libtinyxml2.so.${PV} \
-            -o libtinyxml2.so.${PV} \
-            ${LDFLAGS} \
-            tinyxml2.o
+        -shared \
+        -Wl,-soname,libtinyxml2.so.${XML2VER} \
+        -o libtinyxml2.so.${XML2VER} \
+        ${LDFLAGS} \
+        tinyxml2.o
+
 }
 
 do_install() {
     install -d ${D}${libdir}
-    install -m 0755 ${S}/libtinyxml2.so.${PV} ${D}${libdir}
-    ln -sf libtinyxml2.so.${PV} ${D}${libdir}/libtinyxml2.so
+    install -m 0644 ${S}/libtinyxml2.so.${XML2VER} ${D}${libdir}
+    ln -sf libtinyxml2.so.${XML2VER} ${D}${libdir}/libtinyxml2.so
+    ln -sf libtinyxml2.so.${XML2VER} ${D}${libdir}/libtinyxml2.so.2
 
     install -d ${D}${includedir}
     install -m 0644 ${S}/tinyxml2.h ${D}${includedir}
+    install -Dm644 ${WORKDIR}/libtinyxml2.pc ${D}${libdir}/pkgconfig/libtinyxml2.pc
 }
 
 BBCLASSEXTEND += "native"
-
-- 
1.9.1


