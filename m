Return-Path: <eu@felipetonello.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4247F60EAA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2013 17:16:45 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id k14so3997647oag.33
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2013 10:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uMsIk+h0y/9lDF05eF/6+G69RmK2+Eo+Tegwc+pHaHU=;
	b=CU66L2gtRrFQd9bylY5JWFTjFtZzdJbOURUkXxAaTwxfVYuX5YCx5E3TbzQuCJnHmW
	UxAACZama0fr/hYQzufpUYLoJkcYBrJ1kWV5P1eRFcj5DJ+aCFPIHUFMW9/LEuVWJLrV
	k2WoXitV6mdDtFIi17+6JXrnZRAo7jqtScnbQAhOEzuvPYLtkSn20I6YPt1lXqImkBo4
	V2WkVcijOKgVn+mZqnAES/lHAGW9Aje86DPe56MphqRotz8g0G5piHYpWw6IrPumV7hO
	Qs1xzkRrlahLaS3to+yjk31SWAJsFez7JlSVPW6aL8DgRyhq18N09XWMKTQ4y9IlrJNw
	bSUw==
X-Gm-Message-State: ALoCoQl3V7hVFqf/L8Pj1RX/ehNgHfrKyHWXQyqedYJls5BgU87ewHiDMmu899HRDfE0omVEB+E0
X-Received: by 10.182.75.201 with SMTP id e9mr20725049obw.28.1380561406879;
	Mon, 30 Sep 2013 10:16:46 -0700 (PDT)
Received: from localhost.localdomain.com (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id xx9sm1936151obc.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 30 Sep 2013 10:16:46 -0700 (PDT)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Sep 2013 10:16:40 -0700
Message-Id: <1380561400-574-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] ofono: libqofono: Added libqofono recipe
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
X-List-Received-Date: Mon, 30 Sep 2013 17:16:45 -0000

From: "Felipe F. Tonello" <eu@felipetonello.com>

libqofono is a Qt library for oFono that provides easy to use Qt library and
QML components to use oFono.

OBS: This recipe provides the Qt4 support only, but the library also works
with Qt5.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta-oe/recipes-qt/libqofono/libqofono_0.4.bb | 88 +++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 meta-oe/recipes-qt/libqofono/libqofono_0.4.bb

diff --git a/meta-oe/recipes-qt/libqofono/libqofono_0.4.bb b/meta-oe/recipes-qt/libqofono/libqofono_0.4.bb
new file mode 100644
index 0000000..7c34db2
--- /dev/null
+++ b/meta-oe/recipes-qt/libqofono/libqofono_0.4.bb
@@ -0,0 +1,88 @@
+DESCRIPTION = "Qt Library for oFono"
+HOMEPAGE = "https://github.com/nemomobile/libqofono"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://README;endline=3;md5=8a15bce3921d1238d9a9f23828612947"
+
+SECTION = "qt/lib"
+
+PR = "r0"
+
+inherit qt4x11 pkgconfig
+
+RDEPENDS_${PN} = "ofono"
+RDEPENDS_${PN}-plugin = "${PN}"
+
+PROVIDES += "${PN}-plugin"
+
+PACKAGES =+ "${PN}-plugin ${PN}-plugin-dbg ${PN}-test"
+RRECOMMENDS_${PN} = "${PN}-plugin"
+
+BRANCH = "master"
+TAG = "${PV}"
+
+SRC_URI = " \
+  git://github.com/nemomobile/${PN}.git;branch=${BRANCH};tag=${TAG} \
+"
+
+S = "${WORKDIR}/git"
+
+QT_IMPORTS_DIR = "${libdir}/qt4/imports"
+PLUGINS_TARGET = "${QT_IMPORTS_DIR}/MeeGo/QOfono"
+
+FILES_${PN} = " \
+  ${libdir}/libqofono${SOLIBS} \
+"
+
+FILES_${PN}-dev = " \
+  ${includedir}/qofono/* \
+  ${includedir}/qofono/dbus/* \
+  ${libdir}/libqofono${SOLIBSDEV} \
+  ${libdir}/libqofono.prl \
+  ${libdir}/pkgconfig/qofono.pc \
+  ${datadir}/qt4/mkspecs/features/qofono.prf \
+"
+
+FILES_${PN}-plugin = " \
+  ${PLUGINS_TARGET}/qmldir \
+  ${PLUGINS_TARGET}/lib*.so \
+"
+
+FILES_${PN}-plugin-dbg = " \
+  ${PLUGINS_TARGET}/.debug \
+"
+
+FILES_${PN}-test = " \
+  /opt/ofonotest/bin/ofonotest \
+  /opt/ofonotest/qml/ofonotest \
+  ${libdir}/libqofono/tests/tst_qofonotest \
+"
+
+FILES_${PN}-dbg += " \
+  /opt/ofonotest/bin/.debug \
+  ${libdir}/libqofono/tests/.debug \
+"
+
+EXTRA_QMAKEVARS_PRE = " \
+  PREFIX=${prefix} \
+"
+
+do_configure_prepend() {
+  # Hack *.pro variables
+  find . -iname '*.pro' -exec sed -i -e 's,$$\[QT_INSTALL_IMPORTS\],${QT_IMPORTS_DIR},g' '{}' ';'
+  find . -iname '*.pro' -exec sed -i -e 's,$$\[QT_INSTALL_PREFIX\],$$INSTALL_ROOT$$PREFIX,g' '{}' ';'
+}
+
+do_install() {
+  cd ${S} && (INSTALL_ROOT=${D} oe_runmake install)
+
+  cd ${D}/${datadir}/qt4/mkspecs/features
+
+  sed -i -e '/DEPENDPATH.*/d' qofono.prf
+  sed -i -e '/INCLUDEPATH.*/d' qofono.prf
+  sed -i -e '/LIBS.*/d' qofono.prf
+
+  # to make it work with the SDK
+  echo 'DEPENDPATH += $(OE_QMAKE_INCDIR_QT)/../qofono' >> qofono.prf
+  echo 'INCLUDEPATH += $(OE_QMAKE_INCDIR_QT)/../qofono' >> qofono.prf
+  echo 'LIBS += -lqofono' >> qofono.prf
+}
-- 
1.8.3.1


