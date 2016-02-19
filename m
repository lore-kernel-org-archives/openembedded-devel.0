Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4E234771E2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 11:03:54 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id g62so70501561wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 03:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yOjMJ5zyE0JQsjiq3eA4pxFVNL731tMGEvoKAoIoXG8=;
	b=wwkv0j9pzmekKwa87Yb7u9jFT70RuSwa44YeE+uXTOLItXsVIgwej1oTcge+sOv8cx
	x8AyWyzfQcqtbJySn4aetEXDk6bHyTnwl8VAr7Qb4w4+ztFUsVspFJMbNmsc8y1kmOBf
	yKmlgGkFJA4vamo1UT2BEUmuCcDwQ+EynIUbbkrdxRppakrcRoTnhxX3h1uhqL6PTgI3
	uSTB9CvjxVMILLG625ep5R++XvgMuloC3e5FUOFeaYynnfppkrnVtq262amlb3N3z/UW
	aYdRF9lXTGKSNXv2f5BcdrrnPinB0yN7s3OpFk1yiQP5FC2PAA6rHTKGVIQfzjTwOyG4
	SZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yOjMJ5zyE0JQsjiq3eA4pxFVNL731tMGEvoKAoIoXG8=;
	b=fWflJdV9kyf3Isfefp+Fzz2pvVLeDAVdFOPVANJKX/x0NNTyxZvSpTvOLcwAkuU8gE
	mXYyIsCm2x5wVy5fqOGZYbE30hImeME0W+1JkSGr8q3TBb+ZpQEFRfGAham+t5/djO3S
	wvvxRWfcLKCAOgW6ug6NdcGtppltj97V2uamajHG2H5NB/SBiJRWUG4gsopXW9twP1f8
	1LFlBOOY2RBcN8mfsZyNRCF+o6kSgs2quapxwoM2TpciBmMUSqYpf1nyXpvsMr/phooY
	y/aU0HDVpqHeUnIaco/g3J69SJ0Qvf3HhnvGoDAnq6djfNpcKkD5H7qhWSToR7hHXKlY
	VmlA==
X-Gm-Message-State: AG10YOTSc390dif54l5Ya0ZA7QEJDwwMn3kqO00gKMvbNdJRLQr0TYbD43w75sv/ASmedg==
X-Received: by 10.28.65.5 with SMTP id o5mr8919092wma.75.1455879835565;
	Fri, 19 Feb 2016 03:03:55 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	d9sm10664503wjf.43.2016.02.19.03.03.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Feb 2016 03:03:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Feb 2016 12:04:19 +0100
Message-Id: <1455879859-3401-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455879859-3401-1-git-send-email-Martin.Jansa@gmail.com>
References: <1455879859-3401-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][WIP-for-5.7][meta-qt5 4/4] qtbase: remove fonts packages
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
X-List-Received-Date: Fri, 19 Feb 2016 11:03:55 -0000

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
index 65c1db5..a0e9c71 100644
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
 SRCREV = "10742cf8949497b83b87133ed66ec119cb3ab08f"
-- 
2.7.1


