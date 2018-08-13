Return-Path: <fritjof.jonsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id BEA0C78E67
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 13:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 2E2581836F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 15:20:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id R0fR-t3_03MD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 15:20:54 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 9562818055
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 15:20:54 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3FDA91E0BD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 15:20:54 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34A241E0BF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 15:20:54 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 15:20:54 +0200 (CEST)
Received: from lnxfritjofj.se.axis.com (lnxfritjofj.se.axis.com [10.88.130.23])
	by thoth.se.axis.com (Postfix) with ESMTP id 288F22F05;
	Mon, 13 Aug 2018 15:20:54 +0200 (CEST)
Received: by lnxfritjofj.se.axis.com (Postfix, from userid 12665)
	id 2511E409CC; Mon, 13 Aug 2018 15:20:54 +0200 (CEST)
From: Fritjof Jonsson <fritjof.jonsson@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 15:20:30 +0200
Message-Id: <20180813132030.22046-1-fritjofj@axis.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
Cc: Fritjof Jonsson <fritjofj@axis.com>
Subject: [meta-oe][PATCH v2] Add recipe for cereal, a header-only C++11 serialization library.
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
X-List-Received-Date: Mon, 13 Aug 2018 13:20:55 -0000

Change-Id: I93a3d6b34650998d67f5c00ed8ff14e2658cbec7
Signed-off-by: Fritjof Jonsson <fritjofj@axis.com>
---
 meta-oe/recipes-support/libcereal/libcereal_1.2.2.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-support/libcereal/libcereal_1.2.2.bb

diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.2.2.bb b/meta-oe/recipes-support/libcereal/libcereal_1.2.2.bb
new file mode 100644
index 000000000..6507dd63e
--- /dev/null
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.2.2.bb
@@ -0,0 +1,16 @@
+SUMMARY = "A C++11 library for serialization"
+HOMEPAGE = "https://uscilab.github.io/cereal/"
+
+SECTION = "libs"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "[file://LICENSE;md5=e612690af2f575dfd02e2e91443cea23]file://LICENSE;md5=e612690af2f575dfd02e2e91443cea23"
+
+SRCREV = "51cbda5f30e56c801c07fe3d3aba5d7fb9e6cca4"
+SRC_URI = "git://github.com/USCiLab/cereal.git"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE = "-DJUST_INSTALL_CEREAL=ON"
-- 
2.11.0


