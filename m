Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 9BBBA7865F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 11:45:39 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v8DBjdZj026265
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 13:45:40 +0200
Received: from dev.sbt.siemens.com ([139.16.24.231])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v8DBjdOI021177;
	Wed, 13 Sep 2017 13:45:39 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Sep 2017 13:45:30 +0200
Message-Id: <1505303130-14127-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] capnproto: add version 0.6.1
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
X-List-Received-Date: Wed, 13 Sep 2017 11:45:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../recipes-devtools/capnproto/capnproto_0.6.1.bb  | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb b/meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb
new file mode 100644
index 0000000..d900fae
--- /dev/null
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Cap'n Proto serialization/RPC system"
+DESCRIPTION = "Cap’n Proto is an insanely fast data interchange format and capability-based RPC system. "
+HOMEPAGE = "https://github.com/sandstorm-io/capnproto"
+SECTION = "console/tools"
+LICENSE = "MIT"
+
+PACKAGE_BEFORE_PN = "${PN}-compiler"
+
+RDEPENDS_${PN}-dev += "${PN}-compiler"
+
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=0a5b5b742baf10cc1c158579eba7fb1d"
+
+SRCREV = "c949a18da5f041a36cc218c5c4b79c7705999b4f"
+
+SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV}"
+
+EXTRA_OECMAKE += "\
+	-DBUILD_TESTING=OFF \
+  "
+
+inherit cmake
+
+S = "${WORKDIR}/git/c++"
+
+FILES_${PN}-dev += "${libdir}/cmake"
+FILES_${PN}-compiler = "${bindir}"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.1.4


