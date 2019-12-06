Return-Path: <mohamad.noor.alim.hussin@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 10F8B7FAB7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 01:35:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Dec 2019 17:35:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,282,1571727600"; d="scan'208";a="214361041"
Received: from hussinmo-desk.png.intel.com ([172.30.199.124])
	by orsmga003.jf.intel.com with ESMTP; 05 Dec 2019 17:35:17 -0800
From: mohamad.noor.alim.hussin@intel.com
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2019 09:33:39 +0800
Message-Id: <20191206013339.12461-1-mohamad.noor.alim.hussin@intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-java][PATCH] class/java-native: remove
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
X-List-Received-Date: Fri, 06 Dec 2019 01:35:17 -0000
Content-Transfer-Encoding: 8bit

From: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>

Java-native class used NATIVE_INSTALL_WORKS which was removed
from oe-core around 2010. Also updated recipes that inherit
java-native to native class.

Signed-off-by: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>
---
 classes/java-native.bbclass                          | 9 ---------
 recipes-core/ant-contrib/ant-contrib-native_1.0b3.bb | 2 +-
 recipes-core/ant/ant-native_1.8.1.bb                 | 2 +-
 3 files changed, 2 insertions(+), 11 deletions(-)
 delete mode 100644 classes/java-native.bbclass

diff --git a/classes/java-native.bbclass b/classes/java-native.bbclass
deleted file mode 100644
index cade7b1..0000000
--- a/classes/java-native.bbclass
+++ /dev/null
@@ -1,9 +0,0 @@
-# This is to be used by recipes which rely on java-library.bbclass
-# infrastructure and are a *-native recipe which needs to install
-# jar files into staging.
-# 
-# This class has nothing to do with Java's JNI.
-
-inherit native
-
-NATIVE_INSTALL_WORKS = "1"
diff --git a/recipes-core/ant-contrib/ant-contrib-native_1.0b3.bb b/recipes-core/ant-contrib/ant-contrib-native_1.0b3.bb
index 2a44ea2..db79626 100644
--- a/recipes-core/ant-contrib/ant-contrib-native_1.0b3.bb
+++ b/recipes-core/ant-contrib/ant-contrib-native_1.0b3.bb
@@ -12,7 +12,7 @@ DEPENDS = "ant-native commons-cli-native commons-codec-native \
            oro-native bcel-native xerces-j-native \
           "
 
-inherit java-library java-native
+inherit java-library native
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/ant-contrib/ant-contrib-${PV}-src.zip"
 
diff --git a/recipes-core/ant/ant-native_1.8.1.bb b/recipes-core/ant/ant-native_1.8.1.bb
index 5a39f42..7839abd 100644
--- a/recipes-core/ant/ant-native_1.8.1.bb
+++ b/recipes-core/ant/ant-native_1.8.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://archive.apache.org/dist/ant/source/apache-ant-${PV}-src.tar.gz
 
 S = "${WORKDIR}/apache-ant-${PV}"
 
-inherit java-library java-native
+inherit java-library native
 
 DEPENDS = " \
 	jsch-native bsf-native xalan-j-native xerces-j-native \
-- 
2.19.1


