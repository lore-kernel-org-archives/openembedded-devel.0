Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 432DA731D1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 16:56:57 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r12so6037626wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 09:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rcsOhZxzKQLJgp2buVA1IvCe3QvTdp9pV6aUxPU3bp0=;
	b=VghtqXyhqlPI6C5GvAXbl68oNroRyajQSwv4eNAu0H7LKrSB281QVJjZ5WcASxZhEQ
	ybmV511SFr6/MjoJDiVz7gmoX6tk++HH8H/uDEzsEOhpmYVZMns2CHDI6scRATUPDo1W
	S0P6xalojjxLRZkxF5CXyIGhB65Z63Ef/Bf5RZq5eFvG4juv/1GNjM/w8vznJWKDUxHt
	UHqAq8f7PtCOaWWpLDNiBnTIWuMlrUZB3+J7jx5QDRbkxaR9lMnN+prOwIDY2qT4a7oX
	p96s4bEITg1hy8Blhw2fflnu8ye8erov1bGJ5UPPW/ES/9h121VC2CtX9V2higioc3WI
	YZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rcsOhZxzKQLJgp2buVA1IvCe3QvTdp9pV6aUxPU3bp0=;
	b=XCKfSAS5nwToOhsJBfki8FJh39kB32mEY7iyjJT6UanXUZ0cxeTXoPwuT5VsgtKBMi
	eq2yU4hzjrX5e+RWkBNQJTr2G9UYWUZ97iCErrK8qDv7gq9wK74D0UdholN6uBn3k269
	1zgjMfBpPyheaFZdcKrxFZHEZMAlZuaWKfGZXd6D0VcqeM7muC4XSjI3JwXcedTYqJpj
	vCi0/J2p9SJlQZ/w+fKrru+tG5Xf02m07yw/cUDPWb1vR0WxMDUnTXBgVvA2JgvLRsNv
	UzD3nbIORxtUm9iCAzPmdKuilorOeIZvELRx6SMSTbdXfLgri/mzW8QyrksmD9HBL9Qy
	dOzA==
X-Gm-Message-State: AOPr4FXK2XPpWEi/vG6q9uL3fpo25sapwJ8pfEQpv9fsSEhBYTx2gMjy0oFyZJKWDKPEiQ==
X-Received: by 10.28.179.7 with SMTP id c7mr5209448wmf.46.1461689818492;
	Tue, 26 Apr 2016 09:56:58 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jh2sm29836222wjb.39.2016.04.26.09.56.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Apr 2016 09:56:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Apr 2016 18:57:09 +0200
Message-Id: <1461689830-8750-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461689830-8750-1-git-send-email-Martin.Jansa@gmail.com>
References: <1461689830-8750-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-qt5 3/4] qtbase: remove fonts packages
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
X-List-Received-Date: Tue, 26 Apr 2016 16:56:59 -0000

* fonts were removed from qtbase in:
  commit c5ceabb9a1caf6b9b7615a28c3097f221772f645
  Author: Laszlo Agocs <laszlo.agocs@theqtcompany.com>
  Date:   Mon Aug 17 18:32:41 2015 +0200

    Purge all fonts

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../packagegroup-qt5-toolchain-target.bb           |  1 -
 recipes-qt/qt5/qtbase_git.bb                       | 40 ----------------------
 2 files changed, 41 deletions(-)

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
index cc4d4b5..eb8a740 100644
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -40,7 +40,6 @@ RDEPENDS_${PN} += " \
     ${@base_contains('DISTRO_FEATURES', 'opengl', 'qt3d-mkspecs', '', d)} \
     ${@base_contains('DISTRO_FEATURES', 'opengl', 'qt3d-qmlplugins', '', d)} \
     qtbase-dev \
-    qtbase-fonts \
     qtbase-mkspecs \
     qtbase-plugins \
     qtbase-staticdev \
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 201a605..e2a5d02 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -201,14 +201,6 @@ do_configure() {
 do_install_append() {
     install -m 0755 ${B}/bin/qmake-target ${D}/${bindir}${QT_DIR_NAME}/qmake
 
-    ### Fix up the binaries to the right location
-    ### TODO: FIX
-    # install fonts manually if they are missing
-    if [ ! -d ${D}/${OE_QMAKE_PATH_QT_FONTS} ]; then
-        mkdir -p ${D}/${OE_QMAKE_PATH_QT_FONTS}
-        cp -d ${S}/lib/fonts/* ${D}/${OE_QMAKE_PATH_QT_FONTS}
-        chown -R root:root ${D}/${OE_QMAKE_PATH_QT_FONTS}
-    fi
     # Remove example.pro file as it is useless
     rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro
 
@@ -224,38 +216,6 @@ do_install_append() {
         ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/*.pri
 }
 
-PACKAGES =. " \
-    ${PN}-fonts \
-    ${PN}-fonts-ttf-vera \
-    ${PN}-fonts-ttf-dejavu \
-    ${PN}-fonts-pfa \
-    ${PN}-fonts-pfb \
-    ${PN}-fonts-qpf \
-"
-
-RRECOMMENDS_${PN}-fonts = " \
-    ${PN}-fonts-ttf-vera \
-    ${PN}-fonts-ttf-dejavu \
-    ${PN}-fonts-pfa \
-    ${PN}-fonts-pfb \
-    ${PN}-fonts-qpf \
-"
-
-ALLOW_EMPTY_${PN}-fonts = "1"
-
-FILES_${PN}-fonts-ttf-vera       = "${OE_QMAKE_PATH_QT_FONTS}/Vera*.ttf"
-FILES_${PN}-fonts-ttf-dejavu     = "${OE_QMAKE_PATH_QT_FONTS}/DejaVu*.ttf"
-FILES_${PN}-fonts-pfa            = "${OE_QMAKE_PATH_QT_FONTS}/*.pfa"
-FILES_${PN}-fonts-pfb            = "${OE_QMAKE_PATH_QT_FONTS}/*.pfb"
-FILES_${PN}-fonts-qpf            = "${OE_QMAKE_PATH_QT_FONTS}/*.qpf*"
-FILES_${PN}-fonts                = "${OE_QMAKE_PATH_QT_FONTS}/README \
-                                    ${OE_QMAKE_PATH_QT_FONTS}/fontdir"
-
 RRECOMMENDS_${PN}-plugins += "${@base_contains('DISTRO_FEATURES', 'x11', 'libx11-locale', '', d)}"
 
-sysroot_stage_dirs_append() {
-    # $to is 2nd parameter passed to sysroot_stage_dir, e.g. ${SYSROOT_DESTDIR} passed from sysroot_stage_all
-    rm -rf $to${OE_QMAKE_PATH_QT_FONTS}
-}
-
 SRCREV = "84330007e12122bf1b690a4e68b5ef8e973c7882"
-- 
2.8.1


