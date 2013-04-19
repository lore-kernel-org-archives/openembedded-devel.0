Received: from mail-gg0-f182.google.com ([209.85.161.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steven.w.warren@gmail.com>) id 1UTBLZ-0002NJ-3N
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Apr 2013 15:27:27 +0200
Received: by mail-gg0-f182.google.com with SMTP id u2so610721ggn.41
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Apr 2013 06:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=XGKeqOQPn9o0CmVPdcaxIlA5/jFrJCsEWX38lFXdGT4=;
	b=AY5dpISRx7M89zdIy0Pz8kOeyYoDNk2fDEnpD2q4oJELElb8t9/wJwH0py5vKXJN9K
	EMYRtlwasNeHpPN0UivNfuE6J5aTLjDFybQHlyA113uaApX6Hev0icSqZ+C4oPoIaYP9
	aePRVcr+c6nsnIIPy5Y5un+euIxxHOwv/6JAlG9x7Wjt9FoPsp+FEv4c7Hf9yoq2kbKz
	ixQxETy/B5h9UNnJ6eUw+6i9AAG0R7NeQEeGu6RKeBSQ22Gm2TfD2p5doRTNpxGFoTP7
	GHhlshsyYtyDh5v9sgEEYMcFZvithRx7DICkZH1jVgPk97HA3ge7arezYKNfP5ek0dqz
	PVwQ==
X-Received: by 10.236.113.202 with SMTP id a50mr11189587yhh.204.1366376990090; 
	Fri, 19 Apr 2013 06:09:50 -0700 (PDT)
Received: from engineering0.emacinc.com (watcher.emacinc.com. [66.186.100.194])
	by mx.google.com with ESMTPS id h53sm24522796yhf.0.2013.04.19.06.09.49
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 06:09:49 -0700 (PDT)
From: Wayne Warren <steven.w.warren@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Apr 2013 08:09:43 -0500
Message-Id: <1366376983-26493-1-git-send-email-steven.w.warren@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Wayne Warren <steven.w.warren@gmail.com>
Subject: [PATCH] qtserialport: Adds initial recipe.
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
X-List-Received-Date: Fri, 19 Apr 2013 13:27:42 -0000

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



