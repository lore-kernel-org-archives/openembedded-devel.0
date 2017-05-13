Return-Path: <philip.balister@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id 79BA7606B2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 May 2017 19:24:53 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id 203so3474662ywe.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 May 2017 12:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=cvL6/4vUcGBHiBCj11QA0AutfeB/c8vqE5WgGHmiR4M=;
	b=u9ZZ5xyxDAqnW35WRz7tJFVtWeu6KMuLKLEcp+/HivPW36qCdwCxDxQNJll7WVJZ5B
	5MtukWmtOH27B6xPp9su+xnqv6nyeA6/LKrZ2swq7+a8zuGFEyYxqqUydOLZ7dXHdqrx
	Q9auwQShjnMm+fRJBi250knpoQZwj80lOZr0sZFumeKbPTj2huozhUAow3HrYq548AM+
	5jDdW/6iKQzuchTHa2vs5FpyfTUdZ3kfWG89nrVA1NOrwWwVqqHF33eSK7pO5bCkXsp6
	rzM4vPVlsECAmIcTmPz063qwmxB4J5ZUC16aElzUhmmVlbJWuc37XS0o6Zsa6EXjSVXK
	/DMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=cvL6/4vUcGBHiBCj11QA0AutfeB/c8vqE5WgGHmiR4M=;
	b=k4xugmaSOW++JbxtFmzdE8vuHHmPyXzHHLAgK76TPV2E34tD6nWyWqVeKkfiDtvVRl
	ujsPO5pYEe+pYdgnIim/gmizYuD6u8FVK6hYC0BW7yUnbh9JgKDCSYKXTq0KbeEgha4v
	4IEK1Zf5SC1KBYOTrNbw46BfkplNQHtkYSHV1Is/g/sDwksZjZ/b35hxxPnIoT068WHt
	XeFz8gYBgSxTZa3t9I17PTEFAY5DD3E2CtvTpw60PtTu+AWABMsVCXMZV4TBX56XEj+Q
	ltnyCNqx1HkXPrGqGLWIerX5IhSk1yuMeEqsTzbZtzBeIzi82jIyhDU5WsOPsMtcjH9C
	4bEw==
X-Gm-Message-State: AODbwcCMmSshBWgIiim/DkN3pI/gNgLxmvOMrTRxquatN+bY7I1YtgBt
	uvRQSmejRc+IUA==
X-Received: by 10.129.77.7 with SMTP id a7mr8376837ywb.104.1494703494378;
	Sat, 13 May 2017 12:24:54 -0700 (PDT)
Received: from thuvia.localdomain (pool-71-171-14-165.ronkva.east.verizon.net.
	[71.171.14.165]) by smtp.gmail.com with ESMTPSA id
	w192sm3321511yww.56.2017.05.13.12.24.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 13 May 2017 12:24:52 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 May 2017 15:24:48 -0400
Message-Id: <1494703489-23588-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-qt5][PATCH 1/2] qwt: Add recipe.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 13 May 2017 19:24:54 -0000

 * Build tested for raspberrypi3.

Signed-off-by: Philip Balister <philip@balister.org>
---
 recipes-qt/qwt/qwt-qt5.inc      | 47 +++++++++++++++++++++++++++++++++++++++++
 recipes-qt/qwt/qwt-qt5_6.1.3.bb |  8 +++++++
 2 files changed, 55 insertions(+)
 create mode 100644 recipes-qt/qwt/qwt-qt5.inc
 create mode 100644 recipes-qt/qwt/qwt-qt5_6.1.3.bb

diff --git a/recipes-qt/qwt/qwt-qt5.inc b/recipes-qt/qwt/qwt-qt5.inc
new file mode 100644
index 0000000..ee4fbd7
--- /dev/null
+++ b/recipes-qt/qwt/qwt-qt5.inc
@@ -0,0 +1,47 @@
+DESCRIPTION = "Qt Widget Extension for Technical Applications"
+SECTION = "libs"
+
+# LGPLv2.1 + some exceptions
+LICENSE = "QWTv1.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dac2743472b0462ff3cfb4af42051c88"
+
+DEPENDS = "qtbase qtsvg qttools"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/qwt/qwt-${PV}.tar.bz2;name=qwt \
+          "
+#           file://qwt6.patch 
+#           file://qwt6-fix-linking-with-ld-gold.patch"
+
+S = "${WORKDIR}/qwt-${PV}"
+
+do_configure_prepend() {
+    cd ${S}
+    sed -i -e 's:RELEASE_SUFFIX      = :RELEASE_SUFFIX      = ${QT_LIBINFIX}:' *.pri
+    sed -i -e 's:qtAddLibrary(qwt:qtAddLibrary(qwt)${QT_LIBINFIX}:g' *.prf
+    sed -e 's/# QWT_CONFIG     += QwtExamples/QWT_CONFIG     += QwtExamples/g' -i qwtconfig.pri
+    sed -i -e 's:/usr/local/qwt-$$QWT_VERSION:${D}${prefix}:g' ${S}/*.pri
+}
+
+do_install() {
+    cd ${S}
+    oe_runmake -e install
+#    install -d ${D}${datadir}/doc/${PN}
+#    mv ${D}${prefix}/doc/* ${D}${datadir}/doc/${PN}/
+#    rmdir ${D}${prefix}/doc
+#    cd ${S}/examples
+#    install -d ${D}/${bindir}
+#    cd bin${QT_LIBINFIX}/
+#    for i in * ; do
+#        cp -pPR ${i} ${D}/${bindir}/${i}${QT_LIBINFIX}
+#    done
+#    install -d ${D}${libdir}/${QT_DIR_NAME}
+#    mv ${D}${prefix}/plugins ${D}${libdir}/${QT_DIR_NAME}
+}
+
+PACKAGES_prepend = "${PN}-examples ${PN}-features ${PN}-plugins "
+FILES_${PN}-examples = "${bindir}/*"
+FILES_${PN}-features = "${prefix}/features"
+FILES_${PN}-plugins = "${prefix}/plugins/designer/*.so"
+FILES_${PN}-dbg += "${prefix}/plugins/designer/.debug"
+FILES_${PN}-doc += "${prefix}/doc"
+
diff --git a/recipes-qt/qwt/qwt-qt5_6.1.3.bb b/recipes-qt/qwt/qwt-qt5_6.1.3.bb
new file mode 100644
index 0000000..626bd0a
--- /dev/null
+++ b/recipes-qt/qwt/qwt-qt5_6.1.3.bb
@@ -0,0 +1,8 @@
+inherit qmake5
+
+require qwt-qt5.inc
+
+SRC_URI[qwt.md5sum] = "19d1f5fa5e22054d22ee3accc37c54ba"
+SRC_URI[qwt.sha256sum] = "f3ecd34e72a9a2b08422fb6c8e909ca76f4ce5fa77acad7a2883b701f4309733"
+
+RPROVIDES_${PN}-dev = "libqwt-qt5-dev"
-- 
2.7.4


