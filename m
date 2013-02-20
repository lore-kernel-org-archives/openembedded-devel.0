Received: from mail-ye0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1U8Fm5-0004CG-6j
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2013 20:56:17 +0100
Received: by mail-ye0-f175.google.com with SMTP id j12so135451yeg.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2013 11:40:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=CXUTJ1V0y9/lE/26+fzqrA4Y2EzaTsh6ozknXwfRyi8=;
	b=PKUflhgOUD1WW+SXd/kj2j3H/zHE0Cz91F84u+PITmKodhiiqMfsEAmyMeeBHjFvEf
	7tYda/4XlbJb4UFQt1Df6M0TgDKldvYJoBkXaiA7iXAby/mCdvIC+7tqeVbBAR+/9H4l
	7XWJmFtXg5mXkuavsnqmT+PzEdzAsPuKyRv8K2Lh8KWEmvXxEXK2JldHQOWVaGsupLxj
	tNw5t+A36OAB61VGRYb80NrwCqTpFPEBJkKG6Gk7hDXm/b98r8bWFVpDO+coptqYh1gf
	pQpWyMKr0OTKRrT5fZpSsjdevgKkPPf5EhbbiDDQUIRDT6kKdC5tdi/7uSO3VPl5njq3
	AZ4w==
X-Received: by 10.236.76.135 with SMTP id b7mr38593431yhe.38.1361389205201;
	Wed, 20 Feb 2013 11:40:05 -0800 (PST)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id k45sm17667917yhd.2.2013.02.20.11.40.03
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Feb 2013 11:40:04 -0800 (PST)
From: eu@felipetonello.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Feb 2013 11:40:01 -0800
Message-Id: <1361389201-30878-1-git-send-email-ftonello@cercacor.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQkMaTDx1RYspkYhkCII2g46WWtY7JooQVgsDDnbHbGXDqs0ZtmXUp0bfcbP9gx8uL9AGKDU
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
X-List-Received-Date: Wed, 20 Feb 2013 19:56:17 -0000

From: "Felipe F. Tonello" <ftonello@cercacor.com>

QExtSerialPort is a serial port library for Qt4/5.

Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
---
 .../qextserialport/qextserialport_1.2rc.bb         |   53 ++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb

diff --git a/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb b/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
new file mode 100644
index 0000000..da83404
--- /dev/null
+++ b/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
@@ -0,0 +1,53 @@
+DESCRIPTION = "Qt Ext Serial Port Library"
+HOMEPAGE = "http://http://code.google.com/p/qextserialport/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b866a28cda707ec714878bd933f46251"
+SECTION = "qt/libs"
+
+PR = "r0"
+
+inherit qt4x11 pkgconfig
+
+DEPENDS = "udev"
+
+SRC_URI = " \
+  http://qextserialport.googlecode.com/files/qextserialport-${PV}.zip \
+"
+
+SRC_URI[md5sum] = "ffa061edb9f64666468d18402eee6108"
+SRC_URI[sha256sum] = "9cbee267aac9830f9944bb1d13872e51fba400aa9afe158e64f0fe265a0176bc"
+
+
+S = "${WORKDIR}/qextserialport-${PV}"
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
+  /usr/src/debug/qextserialport-${PV}-${PR}/qextserialport-${PV}/* \
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



