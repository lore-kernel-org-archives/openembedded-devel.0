Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 881E7757AB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 08:21:49 +0000 (UTC)
Received: by lbcao8 with SMTP id ao8so57470588lbc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 01:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=u0YpdzBMZ8Ei/ZSf+B68Pihb9dCu1J9rIHxAmVc8urM=;
	b=RA6W9UXvqoB8IzKcXO6EDf8vRILat3PxYBrXwPmn72AEu55JUfomNOcV1z8J3stmyW
	Jw1rtktkZPryPiSDVDmeNMZPV9lCu4nASYQJrYkJygLoENe1XD7OyW8c/vG8QgLqzPQy
	cTlfvfdYhUT4xD8b2sGFlQqKUJiS6thCE3TTzhHzIXOTMVQBDd32ALYrDmCOHxY19r5m
	qTxY1L+P8fcWXqnVTj8/5Fu9/t4NVfMxJTqpR3lJqPI+VyXYCzdDZjAMxTq3d5w+jNFG
	5yMcGpsqt7inxv6v8mIif2As3shz6ke/kMEaYx57cvwZfzia14QTFO7vh+ZvEtiqtKjc
	vmRQ==
X-Received: by 10.112.157.166 with SMTP id wn6mr562784lbb.30.1445934108105;
	Tue, 27 Oct 2015 01:21:48 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id 34sm6820638lfx.47.2015.10.27.01.21.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Oct 2015 01:21:46 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 27 Oct 2015 09:21:45 +0100
Message-Id: <1445934105-1498-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.6.1
Subject: [meta-oe][PATCH v3] gerbil: Visualization and analysis tool for hyperspectral images
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
X-List-Received-Date: Tue, 27 Oct 2015 08:21:53 -0000

New recipe

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---

v3: So I think we have got into the root of why it failed.

There was a capitalization error on the cmake file.

I have posted the change to upstream and they have merged it
(btw extremely fast, thanks ypnos).

Hope this time it also builds on on your test system.

Sorry again for the inconveniences, and thanks for your work!

 meta-oe/recipes-graphics/gerbil/gerbil_git.bb | 30 +++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gerbil/gerbil_git.bb

diff --git a/meta-oe/recipes-graphics/gerbil/gerbil_git.bb b/meta-oe/recipes-graphics/gerbil/gerbil_git.bb
new file mode 100644
index 000000000000..cad67d01c724
--- /dev/null
+++ b/meta-oe/recipes-graphics/gerbil/gerbil_git.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Generic framework for visualization and analysis of multispectral and hyperspectral data that strives to both bring new innovations in analysis capabilities and be of use in a wide range of hyperspectral data applications"
+HOMEPAGE = "http://gerbilvis.org/"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
+DEPENDS = "boost qt4-x11-free tbb opencv libglu virtual/libgl"
+SRCREV = "b5cc1dc05b89c6c0d5190f0a49a18a77526fffa9"
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


