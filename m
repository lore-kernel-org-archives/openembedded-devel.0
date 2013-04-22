Received: from mail-oa0-f51.google.com ([209.85.219.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steven.w.warren@gmail.com>) id 1UUM19-0008IN-TZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Apr 2013 21:03:15 +0200
Received: by mail-oa0-f51.google.com with SMTP id k14so6336869oag.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2013 11:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=XGKeqOQPn9o0CmVPdcaxIlA5/jFrJCsEWX38lFXdGT4=;
	b=OpMZwevESqccyvTHTIM/G8GN4wkyaWylkUZpuXSnvR0DX+fZM/lEPQ7EBrs/gE4LQh
	XGgFzmGF236R3L/W2LE86R/E0RHKdTORx2pvhn2uHxxcIAU/w3rMOK4caTV1CpQk9yEQ
	ntU2NOtmS8HrcNPEkWHdngB6xI2b+H/7h/HmeBW+4do4BZv1y6cfAoPdyzQo/emfPioA
	e4eT7UAA9838IzACy4onD6gyCyFzGT71vGDfq52rTo1mPkWL4FdGt0xVprijus+/X40W
	PunSaVjGjphtev9zme5W6itBAKTpHvDZwCXs+kNpvcOCJEbh4rIxIL0mJpvh3XIodXPN
	lV0A==
X-Received: by 10.60.34.40 with SMTP id w8mr10618881oei.104.1366656332149;
	Mon, 22 Apr 2013 11:45:32 -0700 (PDT)
Received: from engineering0.emacinc.com (watcher.emacinc.com. [66.186.100.194])
	by mx.google.com with ESMTPS id d10sm20120079oeh.7.2013.04.22.11.45.29
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 22 Apr 2013 11:45:30 -0700 (PDT)
From: Wayne Warren <steven.w.warren@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Apr 2013 13:45:10 -0500
Message-Id: <1366656311-5589-1-git-send-email-steven.w.warren@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Wayne Warren <steven.w.warren@gmail.com>
Subject: [meta-oe][PATCH v2 1/2] qtserialport: Adds initial recipe.
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
X-List-Received-Date: Mon, 22 Apr 2013 19:03:15 -0000

---
 meta-oe/recipes-qt/qtserialport/qtserialport.inc   |   34 ++++++++++++++++++++
 .../recipes-qt/qtserialport/qtserialport_5.1.0.bb  |    6 ++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-qt/qtserialport/qtserialport.inc
 create mode 100644 meta-oe/recipes-qt/qtserialport/qtserialport_5.1.0.bb

diff --git a/meta-oe/recipes-qt/qtserialport/qtserialport.inc b/meta-oe/recipes-qt/qtserialport/qtserialport.inc
new file mode 100644
index 0000000..09f2f9a
--- /dev/null
+++ b/meta-oe/recipes-qt/qtserialport/qtserialport.inc
@@ -0,0 +1,34 @@
+DESCRIPTION = "Qt Serial Port Library"
+SECTION = "qt/libs"
+HOMEPAGE = "http://qt-project.org/wiki/QtSerialPort"
+
+LICENSE = "LGPL FDL GPL "
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.FDL;md5=3801d7932fdc07fd9efe89f9854a6caa \
+    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+    file://LICENSE.LGPL;md5=4fbd65380cdd255951079008b364516c \
+    "
+
+inherit qt4e pkgconfig
+
+SRC_URI = " \
+    git://gitorious.org/qt/qtserialport.git \
+"
+
+S = "${WORKDIR}/git"
+B = "${WORKDIR}/${BPN}-${PV}"
+
+QMAKE_PROFILES="${S}/qtserialport.pro"
+EXTRA_QMAKEVARS_PRE += "PREFIX=/usr"
+EXTRA_OEMAKE += "INSTALL_ROOT=${D}"
+
+do_compile_append() {
+ 	BOGUS_PREFIX=`qmake2 -query QT_INSTALL_PREFIX`
+	for f in `find ${B} -name "Makefile"` ;do 
+		sed -i -e "s|\(\$(INSTALL_ROOT)\)${BOGUS_PREFIX}|\1${prefix}|g" ${f}
+	done
+}
+
+do_install() {
+    oe_runmake install DESTDIR=${D} INCLUDEDIR=${includedir}
+}
diff --git a/meta-oe/recipes-qt/qtserialport/qtserialport_5.1.0.bb b/meta-oe/recipes-qt/qtserialport/qtserialport_5.1.0.bb
new file mode 100644
index 0000000..d903eb3
--- /dev/null
+++ b/meta-oe/recipes-qt/qtserialport/qtserialport_5.1.0.bb
@@ -0,0 +1,6 @@
+require qtserialport.inc
+
+PR = "r0"
+
+SRCREV="22e45f0b0f956c025339d72ad53dca57ef684858"
+
-- 
1.7.9.5



