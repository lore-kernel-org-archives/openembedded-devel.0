Received: from mail-ob0-f174.google.com ([209.85.214.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steven.w.warren@gmail.com>) id 1UUM1E-0008IQ-GB
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Apr 2013 21:03:17 +0200
Received: by mail-ob0-f174.google.com with SMTP id wc20so2779958obb.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2013 11:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=qTkONGxmcJ7DlfiXbBftuwyhEA3LnUiAmhXKT5Vr+iA=;
	b=IR3Sm8jlGdugLc9TAesFr1SNQ2xHcz2F8mwr5N0ZJ+lJ2DxcfzfostqAvNUv5Ii3BC
	NC6VukGNJ8nb3o3ZJQHv2BdJYxZ5mmn5Nkq7E6YIyrI6g+fbgFi5hMRc4qSf3i3jw6LZ
	93SYwKpElI4QJ7w29ghIZ1SkgBphaqGclVhC+d9gWwPpsPC2Y34IaBhkQjzyKse7Po82
	IzcL2k/LNacXeR9sc12uKCtMCbjX4mN3lie/iuSs5Pcqm32jiUIR33ey7RRQv0LcCW/y
	zvSpSfmSTjP/MvHybkss0ObUUZQFdGCQyRAKIWDWAG/y6WdrIg7dngoSGmBYtLCPGTyY
	+lhg==
X-Received: by 10.182.231.197 with SMTP id ti5mr10489733obc.64.1366656336739; 
	Mon, 22 Apr 2013 11:45:36 -0700 (PDT)
Received: from engineering0.emacinc.com (watcher.emacinc.com. [66.186.100.194])
	by mx.google.com with ESMTPS id d10sm20120079oeh.7.2013.04.22.11.45.34
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 22 Apr 2013 11:45:35 -0700 (PDT)
From: Wayne Warren <steven.w.warren@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Apr 2013 13:45:11 -0500
Message-Id: <1366656311-5589-2-git-send-email-steven.w.warren@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1366656311-5589-1-git-send-email-steven.w.warren@gmail.com>
References: <1366656311-5589-1-git-send-email-steven.w.warren@gmail.com>
Cc: Wayne Warren <steven.w.warren@gmail.com>
Subject: [meta-oe][PATCH v2 2/2] qtserialport-e: Various fixes per openembedded-devel list comments.
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
X-List-Received-Date: Mon, 22 Apr 2013 19:03:18 -0000

 * Change DESCRIPTION to SUMMARY
 * Fix LICENSE declarations to be version-specific
 * Coding convention fixes * Don't modify Makefiles modified by qmake2; instead
   symlink qmake2 in to $WORKDIR to be run from there so that it uses
   $WORKDIR/qt.conf values

Signed-off-by: Wayne Warren <steven.w.warren@gmail.com>
---
 .../qtserialport/qtserialport-e_5.1.0.bb           |    6 ++++
 meta-oe/recipes-qt/qtserialport/qtserialport.inc   |   34 ++++++++++++++------
 .../recipes-qt/qtserialport/qtserialport_5.1.0.bb  |    6 ----
 3 files changed, 30 insertions(+), 16 deletions(-)
 create mode 100644 meta-oe/recipes-qt/qtserialport/qtserialport-e_5.1.0.bb
 delete mode 100644 meta-oe/recipes-qt/qtserialport/qtserialport_5.1.0.bb

diff --git a/meta-oe/recipes-qt/qtserialport/qtserialport-e_5.1.0.bb b/meta-oe/recipes-qt/qtserialport/qtserialport-e_5.1.0.bb
new file mode 100644
index 0000000..dcaac20
--- /dev/null
+++ b/meta-oe/recipes-qt/qtserialport/qtserialport-e_5.1.0.bb
@@ -0,0 +1,6 @@
+inherit qt4e
+
+require qtserialport.inc
+
+SRCREV = "22e45f0b0f956c025339d72ad53dca57ef684858"
+
diff --git a/meta-oe/recipes-qt/qtserialport/qtserialport.inc b/meta-oe/recipes-qt/qtserialport/qtserialport.inc
index 09f2f9a..fc2020d 100644
--- a/meta-oe/recipes-qt/qtserialport/qtserialport.inc
+++ b/meta-oe/recipes-qt/qtserialport/qtserialport.inc
@@ -1,15 +1,15 @@
-DESCRIPTION = "Qt Serial Port Library"
+SUMMARY = "Qt Serial Port Library"
 SECTION = "qt/libs"
 HOMEPAGE = "http://qt-project.org/wiki/QtSerialPort"
 
-LICENSE = "LGPL FDL GPL "
+LICENSE = "(LGPL-2.1 | GPL-3.0) & GFDL-1.3"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.FDL;md5=3801d7932fdc07fd9efe89f9854a6caa \
     file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.LGPL;md5=4fbd65380cdd255951079008b364516c \
     "
 
-inherit qt4e pkgconfig
+inherit pkgconfig
 
 SRC_URI = " \
     git://gitorious.org/qt/qtserialport.git \
@@ -18,17 +18,31 @@ SRC_URI = " \
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/${BPN}-${PV}"
 
-QMAKE_PROFILES="${S}/qtserialport.pro"
-EXTRA_QMAKEVARS_PRE += "PREFIX=/usr"
+QMAKE_PROFILES = "${S}/qtserialport.pro"
 EXTRA_OEMAKE += "INSTALL_ROOT=${D}"
+OE_QMAKE_QMAKE = "${WORKDIR}/qmake2"
 
-do_compile_append() {
- 	BOGUS_PREFIX=`qmake2 -query QT_INSTALL_PREFIX`
-	for f in `find ${B} -name "Makefile"` ;do 
-		sed -i -e "s|\(\$(INSTALL_ROOT)\)${BOGUS_PREFIX}|\1${prefix}|g" ${f}
-	done
+do_prepare_qmake_symlink() {
+    ln -sf "${STAGING_BINDIR_NATIVE}/qmake2" ${WORKDIR}
+}
+
+addtask prepare_qmake_symlink after do_generate_qt_config_file before do_configure
+
+do_configure_prepend() {
+    sed -i -e "s|\(Prefix\ =\).*|\1${prefix}|" ${WORKDIR}/qt.conf 
+    sed -i -r -e "/^(Binaries|Headers|Plugins|Mkspecs)/ d" ${WORKDIR}/qt.conf 
 }
 
 do_install() {
     oe_runmake install DESTDIR=${D} INCLUDEDIR=${includedir}
 }
+
+FILES_${PN}-dev += " \
+    ${includedir}/QtSerialPort/* \
+    ${prefix}/mkspecs/* \
+    ${libdir}/*.prl \
+"
+
+FILES_${PN}-dbg += " \
+    ${libdir}/.debug/* \
+"
diff --git a/meta-oe/recipes-qt/qtserialport/qtserialport_5.1.0.bb b/meta-oe/recipes-qt/qtserialport/qtserialport_5.1.0.bb
deleted file mode 100644
index d903eb3..0000000
--- a/meta-oe/recipes-qt/qtserialport/qtserialport_5.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require qtserialport.inc
-
-PR = "r0"
-
-SRCREV="22e45f0b0f956c025339d72ad53dca57ef684858"
-
-- 
1.7.9.5



