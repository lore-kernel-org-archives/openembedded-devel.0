Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4C5987653B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 11:50:13 +0000 (UTC)
Received: by lbbmp1 with SMTP id mp1so38206614lbb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 04:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=k1OL0SunD/a6eelpFewzd5DCoETS9Wxn8ED6gWu8HWY=;
	b=YO3WETNzsTskuGlu6Xgz9p1mJXi+epYsa2IX5R6yvvlilKca7llmhiwCyX9grSO0/3
	EVwAVGQ5WXLzBFiiiaYeWBssV/3uyMVwBhvtJRF6HsKtUY6vhAPumnxCbjjibseiR11+
	eVbiXHD0UBrqI6kKkL+SOZFB9A6tn8Pzcl1JNvPQLNykPf2XfKCIcscnRIq4D+AOEI8z
	LyYXJgnxkWlDHUu6RjzTmlxHZfXu0mZ0VdmpuctghdQhIRUI3uQCE+UPXOMounZp7Yih
	5Yk8hAiTuBkueqJmhubthf834gafX6iWX7QUkTRwDypLceObVQTopGVrmDwiins4NfrW
	lYpw==
X-Received: by 10.112.162.2 with SMTP id xw2mr41221640lbb.98.1441972212145;
	Fri, 11 Sep 2015 04:50:12 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id s2sm190355lae.28.2015.09.11.04.50.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 Sep 2015 04:50:11 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Sep 2015 13:50:04 +0200
Message-Id: <1441972204-15911-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.5.1
Subject: [meta-oe][PATCH] gerbil: Visualization and analysis tool for hyperspectral images
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
X-List-Received-Date: Fri, 11 Sep 2015 11:50:15 -0000

New recipe

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-graphics/gerbil/gerbil_git.bb | 30 +++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gerbil/gerbil_git.bb

diff --git a/meta-oe/recipes-graphics/gerbil/gerbil_git.bb b/meta-oe/recipes-graphics/gerbil/gerbil_git.bb
new file mode 100644
index 000000000000..c1d84a095433
--- /dev/null
+++ b/meta-oe/recipes-graphics/gerbil/gerbil_git.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Generic framework for visualization and analysis of multispectral and hyperspectral data that strives to both bring new innovations in analysis capabilities and be of use in a wide range of hyperspectral data applications"
+HOMEPAGE = "http://gerbilvis.org/"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
+DEPENDS = "boost qt4-x11-free tbb opencv"
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
2.5.1


