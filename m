Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id 6A5CC6A4F1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2013 23:43:34 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id AAB124B0045
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 01:43:31 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 May 2013 01:43:52 +0200
Message-Id: <1369698233-4500-7-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1369698233-4500-1-git-send-email-eric@eukrea.com>
References: <1369698233-4500-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 7/8] qtbase: install and split package fonts
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
X-List-Received-Date: Mon, 27 May 2013 23:43:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- fonts were not installed (at least in qt 5.0.2) so install
them manually.
- split the font package in smaller package as done in qt4 to
save space on the target.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-qt/qt5/qtbase.inc |   30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 81cc2e1..4b4fb10 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -161,7 +161,33 @@ do_install_append() {
     # qemu built on host breaks do_package, remove it here (will be replaces with right qemu when do_compile is fixed
     # ERROR: objcopy failed with exit code 1 (cmd was 'arm-oe-linux-gnueabi-objcopy' --only-keep-debug '/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.1-r0.0/package/usr/bin/qmake' '/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.1-r0.0/package/usr/bin/.debug/qmake')
     rm -f ${D}/${bindir}/${QT_DIR_NAME}/qmake
+    # install fonts manually if they are missing
+    if [ ! -d ${D}/${libdir}/fonts ]; then
+        cp -a ${S}/lib/fonts ${D}/${libdir}
+    fi
 }
 
-PACKAGES =. "${PN}-fonts "
-FILES_${PN}-fonts = "${libdir}/${QT_DIR_NAME}/fonts ${libdir}/fonts"
+PACKAGES =. "${PN}-fonts \
+             ${PN}-fonts-ttf-vera \
+             ${PN}-fonts-ttf-dejavu \
+             ${PN}-fonts-pfa \
+             ${PN}-fonts-pfb \
+             ${PN}-fonts-qpf "
+
+RRECOMMENDS_${PN}-fonts = " \
+             ${PN}-fonts-ttf-vera \
+             ${PN}-fonts-ttf-dejavu \
+             ${PN}-fonts-pfa \
+             ${PN}-fonts-pfb \
+             ${PN}-fonts-qpf "
+
+ALLOW_EMPTY_${PN}-fonts = "1"
+PACKAGES_DYNAMIC += "^${PN}-fonts-.*"
+
+FILES_${PN}-fonts-ttf-vera       = "${libdir}/${QT_DIR_NAME}/fonts/Vera*.ttf ${libdir}/fonts/Vera*.ttf"
+FILES_${PN}-fonts-ttf-dejavu     = "${libdir}/${QT_DIR_NAME}/fonts/DejaVu*.ttf ${libdir}/fonts/DejaVu*.ttf"
+FILES_${PN}-fonts-pfa            = "${libdir}/${QT_DIR_NAME}/fonts/*.pfa ${libdir}/fonts/*.pfa"
+FILES_${PN}-fonts-pfb            = "${libdir}/${QT_DIR_NAME}/fonts/*.pfb ${libdir}/fonts/*.pfb"
+FILES_${PN}-fonts-qpf            = "${libdir}/${QT_DIR_NAME}/fonts/*.qpf* ${libdir}/fonts/*.qpf*"
+FILES_${PN}-fonts                = "${libdir}/${QT_DIR_NAME}/fonts/README ${libdir}/fonts/README \
+                                    ${libdir}/${QT_DIR_NAME}/fonts/fontdir ${libdir}/fonts/fontdir"
-- 
1.7.10.4


