Return-Path: <fritjof.jonsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2813E74580
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 11:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 28304182C8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 13:45:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id ieH-vm7s7n0q
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 13:45:50 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 99AAA182FF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 13:45:50 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4422C1E066
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 13:45:50 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37C5C1E060
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 13:45:50 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 13:45:50 +0200 (CEST)
Received: from lnxfritjofj.se.axis.com (lnxfritjofj.se.axis.com [10.88.130.23])
	by seth.se.axis.com (Postfix) with ESMTP id 2ACC4307E;
	Wed, 27 Jun 2018 13:45:50 +0200 (CEST)
Received: by lnxfritjofj.se.axis.com (Postfix, from userid 12665)
	id 260F1409C8; Wed, 27 Jun 2018 13:45:50 +0200 (CEST)
From: Fritjof Jonsson <fritjof.jonsson@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Jun 2018 13:44:55 +0200
Message-Id: <20180627114455.31496-1-fritjofj@axis.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
Cc: Fritjof Jonsson <fritjofj@axis.com>
Subject: [meta-oe][PATCH] Add recipe for cereal, a header-only C++11 serialization library.
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
X-List-Received-Date: Wed, 27 Jun 2018 11:45:51 -0000

Change-Id: Ia9e454b0b1caf16dd11ac371bda213375955f543
Signed-off-by: Fritjof Jonsson <fritjofj@axis.com>
---
 meta/recipes-support/libcereal/libcereal_1.2.2.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta/recipes-support/libcereal/libcereal_1.2.2.bb

diff --git a/meta/recipes-support/libcereal/libcereal_1.2.2.bb b/meta/recipes-support/libcereal/libcereal_1.2.2.bb
new file mode 100644
index 0000000..e733f2f
--- /dev/null
+++ b/meta/recipes-support/libcereal/libcereal_1.2.2.bb
@@ -0,0 +1,16 @@
+SUMMARY = "A C++11 library for serialization"
+HOMEPAGE = "https://uscilab.github.io/cereal/"
+
+SECTION = "libs"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e612690af2f575dfd02e2e91443cea23"
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


