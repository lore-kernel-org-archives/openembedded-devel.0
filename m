Return-Path: <fenixk19@mail.ru>
Received: from smtp45.i.mail.ru (smtp45.i.mail.ru [94.100.177.105])
	by mail.openembedded.org (Postfix) with ESMTP id 784A160557
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2014 16:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail2; h=Message-Id:Date:Subject:Cc:To:From;
	bh=Z0MAHRImvJgmhIwYisKOya1YahASO8LL6cMDDCemS28=; 
	b=tkiFJkiGpXJjACmjrKW6mqW/bAunNjghA3xkycB3cVIJPBvHsHElKOuj16HPEVspH5pXMDSuI3PvAlxSFKG7de1fRop/YVkJSkbWASrOO2vS6Eamy2BkKTW+Y/wXGiHbay4vWHhHM22LIcpyyZbJfnhleA6NR4ChZ3KJ4rP/fbk=;
Received: from [46.28.89.34] (port=51448 helo=senya-S20-4M.shtrih.local)
	by smtp45.i.mail.ru with esmtpa (envelope-from <fenixk19@mail.ru>)
	id 1XgcTH-0007Ta-1N; Tue, 21 Oct 2014 20:39:43 +0400
From: "A. Varnin" <fenixk19@mail.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Oct 2014 20:39:27 +0400
Message-Id: <1413909567-13567-1-git-send-email-fenixk19@mail.ru>
X-Mailer: git-send-email 1.9.1
X-Spam: Not detected
X-Mras: Ok
Subject: [meta-oe][PATCH] libtinyxml2: new package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Oct 2014 16:39:45 -0000

TinyXML-2 is a rewrite of TinyXML-1. It provides some advantages over the original. They are covered on the homepage. (http://www.grinninglizard.com/tinyxml2/)

Signed-off-by: A. Varnin <fenixk19@mail.ru>
---
 .../recipes-support/libtinyxml2/libtinyxml2_git.bb | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb
new file mode 100644
index 0000000..1d3cffd
--- /dev/null
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb
@@ -0,0 +1,38 @@
+SUMMARY = "TinyXML-2 is a simple, small, efficient, C++ XML parser that can be easily integrating into other programs."
+HOMEPAGE = "http://www.grinninglizard.com/tinyxml2/"
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://readme.md;md5=0033b2f8a25283414b21354670bb1334"
+SECTION = "libs"
+
+SRCREV = "d211bb13512cf4edb408e2c4badbcf4100ce0fd0"
+
+PV = "2.2.0+git${SRCPV}"
+
+SRC_URI = "git://github.com/leethomason/tinyxml2.git"
+
+S = "${WORKDIR}/git"
+
+EXTRA_CXXFLAGS = "-I. -fPIC"
+
+do_compile() {
+    ${CXX} ${CXXFLAGS} ${EXTRA_CXXFLAGS} -c -o tinyxml2.o tinyxml2.cpp
+    ${CXX} ${CXXFLAGS} \
+            -shared \
+            -Wl,-soname,libtinyxml2.so.${PV} \
+            -o libtinyxml2.so.${PV} \
+            ${LDFLAGS} \
+            tinyxml2.o \
+
+}
+
+do_install() {
+    install -d ${D}${libdir}
+    install -m 0755 ${S}/libtinyxml2.so.${PV} ${D}${libdir}
+    ln -sf libtinyxml2.so.${PV} ${D}${libdir}/libtinyxml2.so
+
+    install -d ${D}${includedir}
+    install -m 0644 ${S}/tinyxml2.h ${D}${includedir}
+}
+
+BBCLASSEXTEND += "native"
+
-- 
1.9.1


