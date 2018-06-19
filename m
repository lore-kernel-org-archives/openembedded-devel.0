Return-Path: <prvs=7010ab24f=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 88F2F7554B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 13:05:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.51,243,1526335200"; 
   d="scan'208";a="1507419"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Jun 2018 15:04:48 +0200
Message-ID: <20180619130449.6650-3-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180619130449.6650-1-richard.leitner@skidata.com>
References: <20180619130449.6650-1-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH v2] 2/3] images/classes: add open{jdk, jre}-{7, 8} test
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
X-List-Received-Date: Tue, 19 Jun 2018 13:05:01 -0000
Content-Type: text/plain

Add image classes and images for open{jdk,jre}-{7,8} oeqa tests. These
will be the basis for future "quality gates".

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 classes/openjdk-test-image.bbclass            | 5 +++++
 classes/openjre-test-image.bbclass            | 9 +++++++++
 recipes-images/images/openjdk-7-test-image.bb | 3 +++
 recipes-images/images/openjdk-8-test-image.bb | 3 +++
 recipes-images/images/openjre-7-test-image.bb | 3 +++
 recipes-images/images/openjre-8-test-image.bb | 3 +++
 6 files changed, 26 insertions(+)
 create mode 100644 classes/openjdk-test-image.bbclass
 create mode 100644 classes/openjre-test-image.bbclass
 create mode 100644 recipes-images/images/openjdk-7-test-image.bb
 create mode 100644 recipes-images/images/openjdk-8-test-image.bb
 create mode 100644 recipes-images/images/openjre-7-test-image.bb
 create mode 100644 recipes-images/images/openjre-8-test-image.bb

diff --git a/classes/openjdk-test-image.bbclass b/classes/openjdk-test-image.bbclass
new file mode 100644
index 0000000..f6e4fca
--- /dev/null
+++ b/classes/openjdk-test-image.bbclass
@@ -0,0 +1,5 @@
+DESCRIPTION = "An image for OpenJDK testing purposes"
+
+TEST_SUITES_append = " javac"
+
+inherit openjre-test-image
diff --git a/classes/openjre-test-image.bbclass b/classes/openjre-test-image.bbclass
new file mode 100644
index 0000000..77dbd74
--- /dev/null
+++ b/classes/openjre-test-image.bbclass
@@ -0,0 +1,9 @@
+DESCRIPTION = "An image for OpenJRE testing purposes"
+
+IMAGE_FEATURES += "ssh-server-openssh package-management"
+
+IMAGE_INSTALL = "${CORE_IMAGE_BASE_INSTALL}"
+
+DEFAULT_TEST_SUITES_pn-${PN} = "ping ssh java"
+
+inherit core-image
diff --git a/recipes-images/images/openjdk-7-test-image.bb b/recipes-images/images/openjdk-7-test-image.bb
new file mode 100644
index 0000000..1e6d734
--- /dev/null
+++ b/recipes-images/images/openjdk-7-test-image.bb
@@ -0,0 +1,3 @@
+IMAGE_INSTALL_append = " openjdk-7-jdk "
+
+inherit openjdk-test-image
diff --git a/recipes-images/images/openjdk-8-test-image.bb b/recipes-images/images/openjdk-8-test-image.bb
new file mode 100644
index 0000000..d2eb040
--- /dev/null
+++ b/recipes-images/images/openjdk-8-test-image.bb
@@ -0,0 +1,3 @@
+IMAGE_INSTALL_append = " openjdk-8 "
+
+inherit openjdk-test-image
diff --git a/recipes-images/images/openjre-7-test-image.bb b/recipes-images/images/openjre-7-test-image.bb
new file mode 100644
index 0000000..2616255
--- /dev/null
+++ b/recipes-images/images/openjre-7-test-image.bb
@@ -0,0 +1,3 @@
+IMAGE_INSTALL_append = " openjdk-7-jre "
+
+inherit openjre-test-image
diff --git a/recipes-images/images/openjre-8-test-image.bb b/recipes-images/images/openjre-8-test-image.bb
new file mode 100644
index 0000000..e722ec3
--- /dev/null
+++ b/recipes-images/images/openjre-8-test-image.bb
@@ -0,0 +1,3 @@
+IMAGE_INSTALL_append = " openjre-8 "
+
+inherit openjre-test-image
-- 
2.11.0


