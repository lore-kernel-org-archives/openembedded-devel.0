Return-Path: <diego.rondini@kynetics.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 146DC751F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 08:36:23 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id f8-v6so2862277wmc.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 01:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=jmLSpPib7pdgkntD3aqjvh1b9qZBj+SK30tUzdV+rS0=;
	b=Hb++erjYvj12e48WB88lXd1U2ssgKloZuh8ZtQtpO7HRysbjgbfaaAHcbiVBVvP/1P
	n5QvUheMglm5ZA5PMm18qIZ70kifzrmvqVDeRi+uinnrNr3GwdurJXvOhSJcam2XudqJ
	hODQCL0KdDMJ+dqiD1E2dMWQP02hxmih7PaNk7463Wsa/fpMfl/TeyCbyey5CFIp9jPc
	xW4AtrFTso5fgLqCJvrUjiSWcfZoNE18N6tn3mPJpqIA8uy5UM7BxCtT8jxWVQTV6pLB
	BtVl2kaqQsMbh2ZgC3ckyOtV/gw2gTE7uQD6u5HjJMOFUHYa0np4picGma46E75Sd0q2
	yKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jmLSpPib7pdgkntD3aqjvh1b9qZBj+SK30tUzdV+rS0=;
	b=IfGzG5puR9/7OLR+yQMe5FWzkGFxiYLAGR0P7WltrFTj9sssBGIdgMJrKuGC2g3vEG
	Fy2ge/VAtPfbmWHiVjQIOzhmUVy8+e8MmEwROMhTgsCWFOsO/i6YDSTbDNzy5H3SeOiv
	UfUuLybzrMAT9+XNEVlo6pLxiuJLdF5L1n408xEmxArRrgIiHnf2aW35W9T2A6zRvxdz
	u/5DOt4QCadNMT51HAKptRWacXx+LKNLj+rB8Z4XYDE2dKr3pTIABwRHLunY9e9L25s3
	KgUsNEnopOfXkCg4Ew7b82ocAwQcZXKNFxVw9QanL/iPjdKoyXoV3HOk1qBXmvLEjSAj
	LrfA==
X-Gm-Message-State: ALKqPwdAJ9VBELw2WyDL19r3AyymUhU7kkUUqBvf3l2/8HuT18G3RHyP
	CfvH5vur1T16++lFTCNji1G4NKMR
X-Google-Smtp-Source: AB8JxZpC4cXVNcgEwd8qzeEcXIbftLMaPkscYomImC9US1MuPusUfisFyxEU9bIxUQ+hCVinvkLRaQ==
X-Received: by 2002:a50:8833:: with SMTP id
	b48-v6mr1126762edb.274.1525941384177; 
	Thu, 10 May 2018 01:36:24 -0700 (PDT)
Received: from ip-172-31-7-228.eu-west-1.compute.internal
	(ec2-54-194-24-197.eu-west-1.compute.amazonaws.com. [54.194.24.197])
	by smtp.gmail.com with ESMTPSA id
	c24-v6sm427174ede.3.2018.05.10.01.36.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 May 2018 01:36:23 -0700 (PDT)
From: Diego Rondini <diego.rondini@kynetics.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 May 2018 08:36:06 +0000
Message-Id: <1525941366-2432-1-git-send-email-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.7.4
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: [meta-qt5][PATCH] python-pyqt5: update recipe to 5.10.1
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
X-List-Received-Date: Thu, 10 May 2018 08:36:25 -0000

Update recipe to version 5.10.1, removing upstreamed patches in the process.

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
 ...sip-fix-build-with-accessibility-disabled.patch | 35 ----------------------
 recipes-python/pyqt5/files/fix-sm.patch            | 17 -----------
 ...ython-pyqt5_5.8.2.bb => python-pyqt5_5.10.1.bb} |  8 ++---
 3 files changed, 3 insertions(+), 57 deletions(-)
 delete mode 100644 recipes-python/pyqt5/files/0001-qtabbar.sip-fix-build-with-accessibility-disabled.patch
 delete mode 100644 recipes-python/pyqt5/files/fix-sm.patch
 rename recipes-python/pyqt5/{python-pyqt5_5.8.2.bb => python-pyqt5_5.10.1.bb} (88%)

diff --git a/recipes-python/pyqt5/files/0001-qtabbar.sip-fix-build-with-accessibility-disabled.patch b/recipes-python/pyqt5/files/0001-qtabbar.sip-fix-build-with-accessibility-disabled.patch
deleted file mode 100644
index 7e1c7bf..0000000
--- a/recipes-python/pyqt5/files/0001-qtabbar.sip-fix-build-with-accessibility-disabled.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 8a2f852417414e19d060da66cd7c5cba76e43c7d Mon Sep 17 00:00:00 2001
-From: Diego Rondini <diego.rondini@kynetics.com>
-Date: Wed, 19 Jul 2017 14:17:51 +0200
-Subject: [PATCH] qtabbar.sip: fix build with accessibility disabled
-
-Upstream-Status: Submitted
-
-Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
----
- sip/QtWidgets/qtabbar.sip | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/sip/QtWidgets/qtabbar.sip b/sip/QtWidgets/qtabbar.sip
-index ffe2d3b..80ad816 100644
---- a/sip/QtWidgets/qtabbar.sip
-+++ b/sip/QtWidgets/qtabbar.sip
-@@ -166,11 +166,15 @@ protected:
- 
- public:
- %If (Qt_5_8_0 -)
-+%If (PyQt_Accessibility)
-     QString accessibleTabName(int index) const;
- %End
-+%End
- %If (Qt_5_8_0 -)
-+%If (PyQt_Accessibility)
-     void setAccessibleTabName(int index, const QString &name);
- %End
-+%End
- 
- private:
-     QTabBar(const QTabBar &);
--- 
-2.7.4
-
diff --git a/recipes-python/pyqt5/files/fix-sm.patch b/recipes-python/pyqt5/files/fix-sm.patch
deleted file mode 100644
index f2936a2..0000000
--- a/recipes-python/pyqt5/files/fix-sm.patch
+++ /dev/null
@@ -1,17 +0,0 @@
---- PyQt5_gpl-5.8.2/sip/QtGui/qguiapplication.sip.orig	2017-05-13 13:28:42.523392315 -0400
-+++ PyQt5_gpl-5.8.2/sip/QtGui/qguiapplication.sip	2017-05-13 13:30:08.081207211 -0400
-@@ -270,12 +270,14 @@
- %End
- 
- public:
-+%If (PyQt_SessionManager)
- %If (Qt_5_6_0 -)
-     static bool isFallbackSessionManagementEnabled();
- %End
- %If (Qt_5_6_0 -)
-     static void setFallbackSessionManagementEnabled(bool);
- %End
-+%End
- 
- signals:
- %If (Qt_5_6_0 -)
diff --git a/recipes-python/pyqt5/python-pyqt5_5.8.2.bb b/recipes-python/pyqt5/python-pyqt5_5.10.1.bb
similarity index 88%
rename from recipes-python/pyqt5/python-pyqt5_5.8.2.bb
rename to recipes-python/pyqt5/python-pyqt5_5.10.1.bb
index fdfa120..9a0f849 100644
--- a/recipes-python/pyqt5/python-pyqt5_5.8.2.bb
+++ b/recipes-python/pyqt5/python-pyqt5_5.10.1.bb
@@ -10,11 +10,9 @@ DEPENDS = "sip sip-native qtbase python"
 
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/pyqt/PyQt5_gpl-${PV}.tar.gz \
-    file://fix-sm.patch \
-    file://0001-qtabbar.sip-fix-build-with-accessibility-disabled.patch \
 "
-SRC_URI[md5sum] = "c3048e9d242f3e72fd393630da1d971a"
-SRC_URI[sha256sum] = "ebd70515b30bbd6098fee29e6271a6696b1183c5530ee30e6ba9aaab195536e8"
+SRC_URI[md5sum] = "be36c2abaffc9daa8b993f1ca982968f"
+SRC_URI[sha256sum] = "9932e971e825ece4ea08f84ad95017837fa8f3f29c6b0496985fa1093661e9ef"
 
 S = "${WORKDIR}/PyQt5_gpl-${PV}"
 
@@ -63,7 +61,7 @@ do_install() {
     oe_runmake install
 }
 
-RDEPENDS_${PN} = "python-core python-sip"
+RDEPENDS_${PN} = "python-core python-sip qtbase"
 
 FILES_${PN} += "${libdir}/${PYTHON_DIR}/site-packages ${datadir}/sip/PyQt5/"
 FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/*/.debug/"
-- 
2.7.4


