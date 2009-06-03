Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MBsgD-0000eP-FY
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 17:47:05 +0200
Received: by mail-bw0-f219.google.com with SMTP id 19so72910bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2009 08:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=UmQm+WbFMEixItS/JVUNpjqU6o76GSo7AwnA9UxcdVc=;
	b=nC2DxYl0Ib8BdtXb1CPr7+Oprix1B9mSUkS/zHEpSHo6JEwHkrCmwXgBOLUKMXI/78
	lwSTtfqImMoAuCUsh7rmRu7h6Lqiv5lphZGvPfCp9DZ3gHkSnLRFearsFgZ1L0rf5V5G
	61lzC3IISKcpdCJGgcC1+f7dpmJ+a9sb2lob0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=hTuRkv2oQ5nqmxpe0zyXEMAmw3F6usL/IzE0YKzyH3E6fY4UmVhnJR32HAL8pur+OE
	TtfncZpmHmlG7HND0kfPD++60mWQNKHUFd/UNxXTWW+CHLThF81m0QVXQb5PIzV/BauA
	TbTiy1RzI0TaKoT4dzgwz26T9whkiItXqAIqk=
Received: by 10.103.212.2 with SMTP id o2mr683400muq.131.1244043488330;
	Wed, 03 Jun 2009 08:38:08 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id w5sm151176mue.34.2009.06.03.08.38.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Jun 2009 08:38:08 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jun 2009 18:37:22 +0300
Message-Id: <1244043442-3868-13-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1244043442-3868-12-git-send-email-ihar.hrachyshka@gmail.com>
References: <20090603151754.GI26065@smtp.west.cox.net>
	<1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-2-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-3-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-4-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-5-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-6-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-7-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-8-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-9-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-10-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-11-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-12-git-send-email-ihar.hrachyshka@gmail.com>
Subject: [PATCH 12/12] task-qte-toolchain: added mkspecs and new qt4-tools-sdk recipe
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
X-List-Received-Date: Wed, 03 Jun 2009 15:47:05 -0000

Added mkspecs, qt4-tools to toolchain tasks (now meta-toolchain-qte
works ok).

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 recipes/qt4/qt4-tools-sdk_4.5.1.bb       |   72 ++++++++++++++++++++++++++++++
 recipes/tasks/task-qte-toolchain-host.bb |    2 +
 2 files changed, 74 insertions(+), 0 deletions(-)
 create mode 100644 recipes/qt4/qt4-tools-sdk_4.5.1.bb

diff --git a/recipes/qt4/qt4-tools-sdk_4.5.1.bb b/recipes/qt4/qt4-tools-sdk_4.5.1.bb
new file mode 100644
index 0000000..db919fd
--- /dev/null
+++ b/recipes/qt4/qt4-tools-sdk_4.5.1.bb
@@ -0,0 +1,72 @@
+DESCRIPTION = "SDK tools for Qt/[X11|Mac|Embedded] version 4.x"
+DEPENDS = "zlib-native dbus-native"
+SECTION = "libs"
+HOMEPAGE = "http://www.trolltech.com"
+PRIORITY = "optional"
+LICENSE = "GPL"
+
+inherit sdk
+
+SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
+           file://configure-lflags.patch;patch=1 \
+           file://qt-config.patch;patch=1 \
+           file://g++.conf \
+           file://linux.conf"
+S = "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
+
+# FIXME: make it work with "${STAGING_BINDIR_NATIVE}/pkg-config --cflags dbus-1"
+EXTRA_OECONF = "-prefix ${prefix} \
+                -qt-libjpeg -qt-gif -system-zlib \
+                -no-libjpeg -no-libpng \
+                -no-accessibility \
+                -no-cups \
+                -no-exceptions  \
+                -no-nas-sound \
+                -no-nis \
+                -verbose -release -fast -static \
+                -qt3support \
+                -I${STAGING_DIR_NATIVE}/usr/include \
+                -I${STAGING_DIR_NATIVE}/usr/include/dbus-1.0 \
+                -I${STAGING_DIR_NATIVE}/usr/lib/dbus-1.0/include"
+
+# yank default -e, otherwise we get the following error:
+# moc_qbuffer.cpp: No such file or directory
+EXTRA_OEMAKE = " "
+
+do_configure() {
+   (echo o; echo yes) | ./configure ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
+}
+
+TOBUILD = "\
+  src/tools/bootstrap \
+  src/tools/moc \
+  src/corelib \
+  src/sql \
+  src/dbus \
+  src/qt3support \
+  src/xml \
+  src/tools/uic \
+  src/tools/rcc \
+  src/network \
+  src/gui \
+  src/tools/uic3 \
+  tools/linguist/lrelease \
+  tools/linguist/lupdate \
+  tools/qdbus \
+"
+
+do_compile() {
+    for i in ${TOBUILD}; do
+        cd ${S}/$i && oe_runmake CC="${CC}" CXX="${CXX}"
+    done
+}
+
+do_stage() {
+    install -d ${STAGING_BINDIR_NATIVE}/
+    install -m 0755 bin/qmake ${STAGING_BINDIR_NATIVE}/qmake2
+    for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp; do
+        install -m 0755 bin/${i} ${STAGING_BINDIR_NATIVE}/${i}4
+    done
+}
+
+
diff --git a/recipes/tasks/task-qte-toolchain-host.bb b/recipes/tasks/task-qte-toolchain-host.bb
index 2a9b652..02c95a3 100644
--- a/recipes/tasks/task-qte-toolchain-host.bb
+++ b/recipes/tasks/task-qte-toolchain-host.bb
@@ -3,3 +3,5 @@ require task-sdk-host.bb
 DESCRIPTION = "Host packages for Qt Embedded SDK"
 LICENSE = "MIT"
 ALLOW_EMPTY = "1"
+
+RDEPENDS_${PN} += "qt4-tools-sdk"
-- 
1.6.3.1



