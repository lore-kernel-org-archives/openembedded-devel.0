Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1QLa9o-0001ES-Bg
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 14:10:48 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 91A4B799016; Sun, 15 May 2011 14:07:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from localhost (dslb-088-071-182-216.pools.arcor-ip.net
	[88.71.182.216]) by gravedo.de (Postfix) with ESMTPSA id DBF87799013;
	Sun, 15 May 2011 14:07:58 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 May 2011 14:07:56 +0200
Message-Id: <1305461276-27951-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <4DCFC1B6.6090808@gravedo.de>
References: <4DCFC1B6.6090808@gravedo.de>
Subject: [PATCH] qt4-native: build and install all needed qt4 tools
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
X-List-Received-Date: Sun, 15 May 2011 12:10:48 -0000

Without installing the qt4 binaries manually in do_install() the build process
wants to use the qt4 binaries installed on the build host. If there are no qt4
tools installed on the build host the build fails. This patch brings the install
lines which was removed by the move from qt4-tools-native to qt4-native.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/qt4/qt4-native.inc |   19 ++++++++++++++++++-
 1 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/recipes/qt4/qt4-native.inc b/recipes/qt4/qt4-native.inc
index ee702e9..71ab1f2 100644
--- a/recipes/qt4/qt4-native.inc
+++ b/recipes/qt4/qt4-native.inc
@@ -6,7 +6,7 @@ PRIORITY = "optional"
 LICENSE = "GPL"
 PROVIDES = "qt4-tools-native"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 inherit native
 
@@ -51,6 +51,11 @@ TOBUILD = "\
   src/gui \
   src/testlib \
   src/qt3support \
+  src/tools/uic3 \
+  tools/linguist/lrelease \
+  tools/linguist/lupdate \
+  tools/qdbus/qdbusxml2cpp \
+  tools/qdbus/qdbuscpp2xml \
 "
 
 do_compile() {
@@ -62,6 +67,18 @@ do_compile() {
 NATIVE_INSTALL_WORKS = "1"
 
 do_install() {
+	install -d ${D}${bindir}/
+	install -m 0755 bin/qmake ${D}${bindir}/qmake2
+	for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp; do
+		install -m 0755 bin/${i} ${D}${bindir}/${i}4
+	done
+	
+	install -d ${D}${datadir}/qt4/
+	cp -PfR mkspecs ${D}${datadir}/qt4/
+	ln -sf linux-g++ ${D}${datadir}/qt4/mkspecs/${BUILD_OS}-oe-g++
+	cp -f ${WORKDIR}/g++.conf ${WORKDIR}/linux.conf ${D}${datadir}/qt4/mkspecs/common/
+	install -m 0644 tools/porting/src/q3porting.xml ${D}${datadir}/qt4/
+
     for i in ${TOBUILD}; do
         cd ${S}/$i && oe_runmake install INSTALL_ROOT=${D}
     done
-- 
1.5.6.5



