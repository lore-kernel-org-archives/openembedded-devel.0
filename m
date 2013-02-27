Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UAnYP-0006J9-41
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Feb 2013 21:24:41 +0100
Received: by mail-oa0-f47.google.com with SMTP id o17so2059412oag.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2013 12:08:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=5WsNV6wB6+p96iJGs/hxK33HLbT3ZOvUMTM+T3KN1jc=;
	b=n1AalgilxkqttGx1bNJrZNU78ojDVj1XgrTCCWlVz3H8vfG3YyjBlDzRpf90iOKoN0
	Fh3PeKypAHOzWjdH0Eq3jg6lLhjq1U6U7JY53OorPtm+D0kkA/9ps8bto+i6f0PkLrrj
	5RcwhPg6arxgOmYs3Om6QMbF+uENR6JqkC3iAX9EnluCkHEJhp+nJ8OKOnr02tmusipE
	cvOdHTZzRKsAyg2d1/psVSELlIPyVbkxQq0OfXblmeEyEv66iRq7SL6pASzunoAh4DEt
	2GlCn2SlZAgQOxvgN269QmPD7GY7D6LvXPFvfS9S2cTJidYZnA1uvrflTZPrGzMFmp+z
	CxXQ==
X-Received: by 10.60.3.10 with SMTP id 10mr3653105oey.61.1361995699407;
	Wed, 27 Feb 2013 12:08:19 -0800 (PST)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id i19sm9794638obf.0.2013.02.27.12.08.17
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Feb 2013 12:08:18 -0800 (PST)
From: eu@felipetonello.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Feb 2013 12:08:21 -0800
Message-Id: <1361995702-28964-1-git-send-email-ftonello@cercacor.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQmLtu+pGsEEok4+bUoMkjTzzDrKqoJs/IMYpGonR3W4zcLsszrETLMWWqmQTIutAVDZs3kA
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
X-List-Received-Date: Wed, 27 Feb 2013 20:24:43 -0000

From: "Felipe F. Tonello" <ftonello@cercacor.com>

QExtSerialPort is a serial port library for Qt4/5.

Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
---
 .../qextserialport/qextserialport_1.2rc.bb         |   56 ++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb

diff --git a/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb b/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
new file mode 100644
index 0000000..4cc9d6c
--- /dev/null
+++ b/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
@@ -0,0 +1,56 @@
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
+FILES_${PN}-dbg = " \
+  ${libdir}/.debug/libqextserialport.so* \
+  /usr/src/debug/qextserialport-${PV}-${PR}/qextserialport-${REAL_PV} \
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



