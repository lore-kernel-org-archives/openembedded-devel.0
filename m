Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QL15A-0001od-OW
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 May 2011 00:43:40 +0200
Received: (qmail 28725 invoked by uid 503); 13 May 2011 23:34:19 -0000
Received: from b6.ovh.net (HELO mail408.ha.ovh.net) (213.186.33.56)
	by 63.mail-out.ovh.net with SMTP; 13 May 2011 23:34:19 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 14 May 2011 00:40:53 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 14 May 2011 00:40:52 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 May 2011 00:31:52 +0200
Message-Id: <1305325912-14112-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12930960430710893897
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.500036/N
Subject: [PATCH] qt4-native: unbreak qt4 compilation by providing the necessary native tools
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
X-List-Received-Date: Fri, 13 May 2011 22:43:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

was broken by commit 5a6efd58cdc85d08ab9e106c84bbac5110b5aecd

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/qt4/qt4-native.inc |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/recipes/qt4/qt4-native.inc b/recipes/qt4/qt4-native.inc
index d99d9de..2156023 100644
--- a/recipes/qt4/qt4-native.inc
+++ b/recipes/qt4/qt4-native.inc
@@ -51,7 +51,10 @@ TOBUILD = "\
   src/gui \
   src/testlib \
   src/qt3support \
+  src/tools/uic3 \
   tools/linguist/lrelease \
+  tools/linguist/lupdate \
+  tools/qdbus \
 "
 
 do_compile() {
@@ -63,6 +66,18 @@ do_compile() {
 NATIVE_INSTALL_WORKS = "1"
 
 do_install() {
+    install -d ${D}${bindir}/
+    install -m 0755 bin/qmake ${D}${bindir}/qmake2
+    for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp; do
+        install -m 0755 bin/${i} ${D}${bindir}/${i}4
+    done
+
+    install -d ${D}${datadir}/qt4/
+    cp -PfR mkspecs ${D}${datadir}/qt4/
+    ln -sf linux-g++ ${D}${datadir}/qt4/mkspecs/${BUILD_OS}-oe-g++
+    cp -f ${WORKDIR}/g++.conf ${WORKDIR}/linux.conf ${D}${datadir}/qt4/mkspecs/common/
+    install -m 0644 tools/porting/src/q3porting.xml ${D}${datadir}/qt4/
+
     for i in ${TOBUILD}; do
         cd ${S}/$i && oe_runmake install INSTALL_ROOT=${D}
     done
-- 
1.7.0.4



