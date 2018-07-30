Return-Path: <robert.joslyn@redrectangle.org>
Received: from slow1-d.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
	by mail.openembedded.org (Postfix) with ESMTP id 5A90978D50
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 03:38:07 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
	by slow1-d.mail.gandi.net (Postfix) with ESMTP id C6A8A3A2125
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 04:16:32 +0200 (CEST)
X-Originating-IP: 204.52.246.158
Received: from localhost.localdomain (eastside-a.concentrator.fsr.net
	[204.52.246.158])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 4F70CE0005;
	Mon, 30 Jul 2018 02:16:29 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Jul 2018 19:16:09 -0700
Message-Id: <20180730021613.26889-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.16.4
X-Spam-Level: 
Subject: [meta-python][PATCH 1/5] python-linecache2: Add recipe
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
X-List-Received-Date: Mon, 30 Jul 2018 03:38:07 -0000

---
 .../recipes-devtools/python/python-linecache2_1.0.0.bb      | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-linecache2_1.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python-linecache2_1.0.0.bb b/meta-python/recipes-devtools/python/python-linecache2_1.0.0.bb
new file mode 100644
index 000000000..386da2daa
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-linecache2_1.0.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "A backport of linecache to older supported Pythons"
+HOMEPAGE = "https://github.com/testing-cabal/linecache2"
+LICENSE = "Python-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=19;endline=19;md5=368ddc8588431c180ae7c33f4fb57519"
+
+DEPENDS = "${PYTHON_PN}-pbr-native"
+
+SRC_URI[md5sum] = "7b25d0289ec36bff1f9e63c4329ce65c"
+SRC_URI[sha256sum] = "4b26ff4e7110db76eeb6f5a7b64a82623839d595c2038eeda662f2a2db78e97c"
+
+inherit pypi setuptools
+
+CLEAN_BROKEN = "1"
-- 
2.16.4


