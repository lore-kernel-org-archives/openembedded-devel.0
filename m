Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6EB7B770A3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 14:22:16 +0000 (UTC)
Received: by lffz202 with SMTP id z202so49878410lff.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 07:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=YnodHx2Ey5XuTqa/lurTuOZE/xkn5Ww44Zjj8EsgPlo=;
	b=vItJ8DDYyA1GkKhDOjY3bHRZ58/f0Azcq8gGgUG3yB1QPaDE0KkjLezr8xZfTQZmuA
	rHCfi8pbdsRqO1fCVHfx3gtKrQF0Z0vZFzO0SzvxbtezC0faWsMPmyoiYA7y3GrJxx6i
	+vaVq7gAHM1YKKDoGdi66uarzedWJTgRt3mv9cSoxI2dr+My9Dhed7REkpgQU69jnnLg
	5xo1C2WTn01dGn7AOvvix51VLNTeMGXGmFHfPIU3x+TQxVIifQX1Bc34109vaRMyTzsS
	IweVHyX434t11lsnrMm/HVCzXKZMNigmwbL38fsR00gFjPRWfpsu1b3zobzA1/Xz9RFP
	XYgg==
X-Received: by 10.112.162.34 with SMTP id xx2mr8733749lbb.109.1445523735814;
	Thu, 22 Oct 2015 07:22:15 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	jj4sm2385781lbc.14.2015.10.22.07.22.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 22 Oct 2015 07:22:14 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 22 Oct 2015 16:22:13 +0200
Message-Id: <1445523733-20612-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.6.1
Subject: [meta-oe][PATCH v2] gerbil: Visualization and analysis tool for hyperspectral images
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
X-List-Received-Date: Thu, 22 Oct 2015 14:22:19 -0000

New recipe

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
v2:

v1 failed to link, it was missing the glu library.

I have not been able to replicate the build error :S

But after some static analysis it seems that:

glu should have been automatically added with the cmake
variable OPENGL_LIBRARIES, set in FindOpeGL.cmake

But if glu is not present, then it is not added....

Sorry for the inconvenience!



 meta-oe/recipes-graphics/gerbil/gerbil_git.bb | 30 +++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gerbil/gerbil_git.bb

diff --git a/meta-oe/recipes-graphics/gerbil/gerbil_git.bb b/meta-oe/recipes-graphics/gerbil/gerbil_git.bb
new file mode 100644
index 000000000000..bfcd7c7ce803
--- /dev/null
+++ b/meta-oe/recipes-graphics/gerbil/gerbil_git.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Generic framework for visualization and analysis of multispectral and hyperspectral data that strives to both bring new innovations in analysis capabilities and be of use in a wide range of hyperspectral data applications"
+HOMEPAGE = "http://gerbilvis.org/"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
+DEPENDS = "boost qt4-x11-free tbb opencv libglu virtual/libgl"
+SRCREV = "670e06da516ed51dbae75e41e043900256bdabba"
+
+SRC_URI = "git://github.com/gerbilvis/gerbil.git"
+
+S = "${WORKDIR}/git"
+
+inherit distutils-base cmake qt4x11
+
+export EXTRA_OECMAKE = "\
+                        -DQT_MOC_EXECUTABLE=${OE_QMAKE_MOC} \
+                        -DQT_UIC_EXECUTABLE=${OE_QMAKE_UIC} \
+                        -DQT_RCC_EXECUTABLE=${OE_QMAKE_RCC} \
+                        "
+
+do_configure() {
+        # Ensure we get the cmake configure and not qmake
+        cmake_do_configure
+}
+do_install() {
+        install -d ${D}${bindir}
+        install -m 755 bin/gerbil ${D}${bindir}/
+        install -m 755 bin/qgerbil ${D}${bindir}/
+}
+
+RDEPENDS_${PN} += "qt4-x11-free"
-- 
2.6.1


