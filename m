Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF6C7BD72
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 21:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id DB5631873B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 23:09:22 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id hn-kJdi7dr8I
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 23:09:21 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 182941847C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 23:09:21 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F3F801A075
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 23:09:20 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E91881A06D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 23:09:20 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 23:09:20 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id DD4D0231F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 23:09:20 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id x35L9KEt032737
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 5 Apr 2019 23:09:20 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id x35L9Kjl032733
	for openembedded-devel@lists.openembedded.org;
	Fri, 5 Apr 2019 23:09:20 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Apr 2019 23:09:18 +0200
Message-Id: <20190405210918.32563-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [meta-oe][PATCH] doxygen: Make it build with ninja 1.9.0
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
X-List-Received-Date: Fri, 05 Apr 2019 21:09:22 -0000

ninja 1.9.0 turned the previous dupbuild warning into an error, which
resulted in the following error:

  ninja: error: build.ninja:1948: multiple rules generate
  generated_src/configvalues.h [-w dupbuild=err]

Turn the error back into a warning until upstream corrects the build
rules.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-devtools/doxygen/doxygen_1.8.15.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.15.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.15.bb
index 784684620..2435b587d 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.15.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.15.bb
@@ -4,8 +4,6 @@ HOMEPAGE = "http://www.doxygen.org/"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-inherit cmake python3native
-
 DEPENDS = "flex-native bison-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz \
@@ -13,4 +11,11 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz \
 SRC_URI[md5sum] = "2c98c73eba392d334f5bbaf15e09bae3"
 SRC_URI[sha256sum] = "bd9c0ec462b6a9b5b41ede97bede5458e0d7bb40d4cfa27f6f622eb33c59245d"
 
+inherit cmake python3native
+
+# Avoid the following error:
+#   ninja: error: build.ninja:1948: multiple rules generate
+#   generated_src/configvalues.h [-w dupbuild=err]
+EXTRA_OECMAKE_BUILD += "-w dupbuild=warn"
+
 BBCLASSEXTEND = "native"
-- 
2.12.0


