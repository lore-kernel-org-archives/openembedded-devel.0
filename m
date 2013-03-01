Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UBUsH-00077n-GG
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Mar 2013 19:40:13 +0100
Received: by mail-ob0-f175.google.com with SMTP id uz6so898459obc.34
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Mar 2013 10:23:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=FR117GkFm5TJLNbkreY+g5wH8r6jR9SDcd7pgOWptjA=;
	b=WbMorjSelOGs0Sa6aUp9m6XJKMj59ihh6m7Xpyya3StEsQH141BZKlFMZEDHU6PJrf
	mkx5IaSKHiblfMPCaegRPzOQmw0MKvPZG6PlYlD9RJ9kYwhN0n8N7nj9xBVG6ub51fig
	m9XrtWvgHkqJp9h30TSnj/KMtu69T5jK00p4WYhhcZI2V7imzJM9VyaGNjTShXHta1at
	/2JzI4vyvuwFsjIfj35J6ek+cMk3fR9xNiDEsF7evC73eExgFUIoD1trUPolJl2thWrG
	5QyB65JCKnPZLn5e0b5ziVuuf0vmQ+VH+rWlieEaiUJTIEqMyqTH5GMw2511rcn40fuw
	lH3A==
X-Received: by 10.60.13.65 with SMTP id f1mr9168611oec.87.1362162221096;
	Fri, 01 Mar 2013 10:23:41 -0800 (PST)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id ri1sm18230986obc.12.2013.03.01.10.23.39
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 01 Mar 2013 10:23:40 -0800 (PST)
From: eu@felipetonello.com
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Mar 2013 10:23:46 -0800
Message-Id: <1362162226-24924-1-git-send-email-ftonello@cercacor.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQm2Qv0oacnuRCuSYaz0c+YiUpkFe0RPfrrBMS+D9rBtDzWqfi1CLff99o2k5mAhLqALtmdq
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: [meta-oe][PATCH] qextserialport: Added 1.2rc recipe
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
X-List-Received-Date: Fri, 01 Mar 2013 18:40:14 -0000

From: "Felipe F. Tonello" <ftonello@cercacor.com>

QExtSerialPort is a serial port library for Qt4/5.

Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
---
 .../qextserialport/qextserialport_1.2rc.bb         |   55 ++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb

diff --git a/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb b/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
new file mode 100644
index 0000000..da65215
--- /dev/null
+++ b/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
@@ -0,0 +1,55 @@
+DESCRIPTION = "Qt Ext Serial Port Library"
+HOMEPAGE = "http://http://code.google.com/p/qextserialport/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b866a28cda707ec714878bd933f46251"
+SECTION = "qt/libs"
+
+PR = "r0"
+
+# 1.2rc as version will sort lower then 1.2 when it's released
+REAL_PV = "1.2rc"
+PV = "1.1+${REAL_PV}"
+
+inherit qt4x11 pkgconfig
+
+DEPENDS = "udev"
+
+SRC_URI = " \
+  http://qextserialport.googlecode.com/files/qextserialport-${REAL_PV}.zip \
+"
+
+SRC_URI[md5sum] = "ffa061edb9f64666468d18402eee6108"
+SRC_URI[sha256sum] = "9cbee267aac9830f9944bb1d13872e51fba400aa9afe158e64f0fe265a0176bc"
+
+S = "${WORKDIR}/qextserialport-${REAL_PV}"
+
+FILES_${PN} = "${libdir}/libqextserialport${SOLIBS}"
+
+FILES_${PN}-dev = " \
+  ${libdir}/libqextserialport${SOLIBSDEV} \
+  ${libdir}/libqextserialport.prl \
+  ${includedir}/QtExtSerialPort/*.h \
+  ${datadir}/qt4/mkspecs/features/extserialport.prf \
+"
+
+FILES_${PN}-dbg += " \
+  ${libdir}/.debug/libqextserialport.so* \
+"
+
+do_configure_prepend() {
+  # based on the documentation, this line make sure we use udev in linux
+  cd ${S} && echo "linux*:CONFIG += qesp_linux_udev" > .qmake.cache
+
+  # Hacking hardcoded qmake variables
+  find *.pro -exec sed -i -e 's,$$\[QT_INSTALL_HEADERS\],${includedir},g' '{}' ';'
+  find *.pro -exec sed -i -e 's,$$\[QT_INSTALL_LIBS\],${libdir},g' '{}' ';'
+  find *.pro -exec sed -i -e 's,$$\[QMAKE_MKSPECS\],${datadir}/qt4/mkspecs/,g' '{}' ';'
+}
+
+do_install() {
+  export INSTALL_ROOT=${D}
+  oe_runmake install
+
+  # This is necessary to make it work with the qt based SDK
+  cd ${D}/${datadir}/qt4/mkspecs/features && sed -i -e "s|${STAGING_INCDIR_NATIVE}/qt4|\$(OE_QMAKE_INCDIR_QT)/..|" ./extserialport.prf
+}
-- 
1.7.9.5



