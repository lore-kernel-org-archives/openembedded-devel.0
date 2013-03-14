Received: from smarthost.techfak.uni-bielefeld.de ([129.70.137.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@herbrechtsmeier.net>) id 1UGBhU-00088P-HA
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Mar 2013 18:12:22 +0100
Received: from localhost.localdomain (sarotti.TechFak.Uni-Bielefeld.DE
	[129.70.144.156])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: sherbrec)
	by smarthost.TechFak.Uni-Bielefeld.DE (Postfix) with ESMTPSA id
	6FB4F80028; Thu, 14 Mar 2013 17:46:07 +0100 (CET)
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Mar 2013 17:45:57 +0100
Message-Id: <1363279557-5861-1-git-send-email-stefan@herbrechtsmeier.net>
X-Mailer: git-send-email 1.7.0.4
Subject: [meta-oe][PATCH] libtinyxml: Add native support and use relative paths
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Mar 2013 17:12:23 -0000

Replace CXXFLAGS += "-fPIC" with EXTRA_CXXFLAGS to allow native
build and use relative paths to simplify recipe.

Signed-off-by: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
---
 .../recipes-support/libtinyxml/libtinyxml_2.6.2.bb |   18 ++++++++++--------
 1 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
index fdadebd..8670fac 100644
--- a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
+++ b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
@@ -16,20 +16,21 @@ SRC_URI[sha256sum] = "15bdfdcec58a7da30adc87ac2b078e4417dbe5392f3afb719f9ba6d062
 
 S = "${WORKDIR}/tinyxml"
 
-CXXFLAGS += "-fPIC"
+EXTRA_CXXFLAGS = "-I. -fPIC"
 
 do_compile() {
-    ${CXX} ${CXXFLAGS} -I${S} -c -o ${S}/tinyxml.o ${S}/tinyxml.cpp
-    ${CXX} ${CXXFLAGS} -I${S} -c -o ${S}/tinyxmlerror.o ${S}/tinyxmlerror.cpp
-    ${CXX} ${CXXFLAGS} -I${S} -c -o ${S}/tinyxmlparser.o ${S}/tinyxmlparser.cpp
+    ${CXX} ${CXXFLAGS} ${EXTRA_CXXFLAGS} -c -o tinyxml.o tinyxml.cpp
+    ${CXX} ${CXXFLAGS} ${EXTRA_CXXFLAGS} -c -o tinyxmlerror.o tinyxmlerror.cpp
+    ${CXX} ${CXXFLAGS} ${EXTRA_CXXFLAGS} -c -o tinyxmlparser.o tinyxmlparser.cpp
     ${CXX} ${CXXFLAGS} \
             -shared \
             -Wl,-soname,libtinyxml.so.${PV} \
-            -o ${S}/libtinyxml.so.${PV} \
+            -o libtinyxml.so.${PV} \
             ${LDFLAGS} \
-            ${S}/tinyxml.o \
-            ${S}/tinyxmlparser.o \
-            ${S}/tinyxmlerror.o
+            tinyxml.o \
+            tinyxmlparser.o \
+            tinyxmlerror.o
+
 }
 
 do_install() {
@@ -41,3 +42,4 @@ do_install() {
     install -m 0644 ${S}/tinyxml.h ${D}${includedir}
 }
 
+BBCLASSEXTEND += "native"
-- 
1.7.0.4



