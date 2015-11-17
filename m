Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8DAE0766B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2015 02:35:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAH2Z7Lv002633
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 18:35:08 -0800
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 16 Nov 2015 18:35:07 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Nov 2015 10:20:46 +0800
Message-ID: <1447726846-27486-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] gperftools: upgrade to 2.4
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
X-List-Received-Date: Tue, 17 Nov 2015 02:35:10 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-support/gperftools/gperftools_2.1.bb | 12 ------------
 meta-oe/recipes-support/gperftools/gperftools_2.4.bb | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 meta-oe/recipes-support/gperftools/gperftools_2.1.bb
 create mode 100644 meta-oe/recipes-support/gperftools/gperftools_2.4.bb

diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.1.bb b/meta-oe/recipes-support/gperftools/gperftools_2.1.bb
deleted file mode 100644
index 7d4a0b0..0000000
--- a/meta-oe/recipes-support/gperftools/gperftools_2.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "Fast, multi-threaded malloc() and nifty performance analysis tools"
-HOMEPAGE = "http://code.google.com/p/gperftools/"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=762732742c73dc6c7fbe8632f06c059a"
-DEPENDS = "libunwind"
-
-SRC_URI = "${DEBIAN_MIRROR}/main/g/google-perftools/google-perftools_${PV}.orig.tar.gz"
-
-SRC_URI[md5sum] = "5e5a981caf9baa9b4afe90a82dcf9882"
-SRC_URI[sha256sum] = "f3ade29924f89409d8279ab39e00af7420593baa4941c318db42e70ead7e494f"
-
-inherit autotools
diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.4.bb b/meta-oe/recipes-support/gperftools/gperftools_2.4.bb
new file mode 100644
index 0000000..3d8e2a9
--- /dev/null
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.4.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Fast, multi-threaded malloc() and nifty performance analysis tools"
+HOMEPAGE = "http://code.google.com/p/gperftools/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=762732742c73dc6c7fbe8632f06c059a"
+DEPENDS = "libunwind"
+
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/gperftools/gperftools-2.4.tar.gz/2171cea3bbe053036fb5d5d25176a160/gperftools-2.4.tar.gz"
+
+SRC_URI[md5sum] = "2171cea3bbe053036fb5d5d25176a160"
+SRC_URI[sha256sum] = "982a37226eb42f40714e26b8076815d5ea677a422fb52ff8bfca3704d9c30a2d"
+
+inherit autotools
-- 
1.9.1


