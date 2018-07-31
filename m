Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
	[217.70.183.201])
	by mail.openembedded.org (Postfix) with ESMTP id 8005A745BC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 03:10:37 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 22A7D1BF206;
	Tue, 31 Jul 2018 03:10:36 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jul 2018 20:09:34 -0700
Message-Id: <20180731030937.3685-3-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20180731030937.3685-1-robert.joslyn@redrectangle.org>
References: <20180731030937.3685-1-robert.joslyn@redrectangle.org>
X-Spam-Level: 
Subject: [meta-python][PATCH v2 2/5] python-traceback2: Add recipe
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
X-List-Received-Date: Tue, 31 Jul 2018 03:10:37 -0000

---
 .../recipes-devtools/python/python-traceback2_1.4.0.bb    | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-traceback2_1.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python-traceback2_1.4.0.bb b/meta-python/recipes-devtools/python/python-traceback2_1.4.0.bb
new file mode 100644
index 000000000..696c875c6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-traceback2_1.4.0.bb
@@ -0,0 +1,15 @@
+SUMMARY = "A backport of traceback to older supported Pythons"
+HOMEPAGE = "https://github.com/testing-cabal/traceback2"
+LICENSE = "Python-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=31;endline=31;md5=368ddc8588431c180ae7c33f4fb57519"
+
+DEPENDS = "${PYTHON_PN}-pbr-native"
+
+SRC_URI[md5sum] = "9e9723f4d70bfc6308fa992dd193c400"
+SRC_URI[sha256sum] = "05acc67a09980c2ecfedd3423f7ae0104839eccb55fc645773e1caa0951c3030"
+
+inherit pypi setuptools
+
+CLEANBROKEN = "1"
+
+RDEPENDS_${PN} = "${PYTHON_PN}-linecache2"
-- 
2.16.4


