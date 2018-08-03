Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	by mail.openembedded.org (Postfix) with ESMTP id 247D278E22
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Aug 2018 03:27:27 +0000 (UTC)
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 08F8D240004;
	Fri,  3 Aug 2018 03:27:27 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Aug 2018 20:27:00 -0700
Message-Id: <20180803032704.3521-2-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20180803032704.3521-1-robert.joslyn@redrectangle.org>
References: <20180803032704.3521-1-robert.joslyn@redrectangle.org>
Subject: [meta-python][PATCH v3 1/5] python-linecache2: Add recipe
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
X-List-Received-Date: Fri, 03 Aug 2018 03:27:28 -0000

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


