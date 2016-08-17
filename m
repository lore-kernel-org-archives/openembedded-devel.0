Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 20DE0731FA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 08:32:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7H8W6j4017442
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 01:32:06 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 17 Aug 2016 01:32:05 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Aug 2016 16:17:17 +0800
Message-ID: <20160817081717.3193-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-oe][PATCH] gperftools: upgrade to 2.5
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
X-List-Received-Date: Wed, 17 Aug 2016 08:32:06 -0000
Content-Type: text/plain

Upgrade gperftools and set COMPATIBLE_HOST according to testing results
for this version.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-support/gperftools/gperftools_2.4.bb | 12 ------------
 meta-oe/recipes-support/gperftools/gperftools_2.5.bb | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 12 deletions(-)
 delete mode 100644 meta-oe/recipes-support/gperftools/gperftools_2.4.bb
 create mode 100644 meta-oe/recipes-support/gperftools/gperftools_2.5.bb

diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.4.bb b/meta-oe/recipes-support/gperftools/gperftools_2.4.bb
deleted file mode 100644
index 3d8e2a9..0000000
--- a/meta-oe/recipes-support/gperftools/gperftools_2.4.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "Fast, multi-threaded malloc() and nifty performance analysis tools"
-HOMEPAGE = "http://code.google.com/p/gperftools/"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=762732742c73dc6c7fbe8632f06c059a"
-DEPENDS = "libunwind"
-
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/gperftools/gperftools-2.4.tar.gz/2171cea3bbe053036fb5d5d25176a160/gperftools-2.4.tar.gz"
-
-SRC_URI[md5sum] = "2171cea3bbe053036fb5d5d25176a160"
-SRC_URI[sha256sum] = "982a37226eb42f40714e26b8076815d5ea677a422fb52ff8bfca3704d9c30a2d"
-
-inherit autotools
diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.5.bb b/meta-oe/recipes-support/gperftools/gperftools_2.5.bb
new file mode 100644
index 0000000..1572d4c
--- /dev/null
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.5.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Fast, multi-threaded malloc() and nifty performance analysis tools"
+HOMEPAGE = "http://code.google.com/p/gperftools/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=762732742c73dc6c7fbe8632f06c059a"
+DEPENDS = "libunwind"
+
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/gperftools/gperftools-2.5.tar.gz/aa1eaf95dbe2c9828d0bd3a00f770f50/gperftools-2.5.tar.gz"
+
+SRC_URI[md5sum] = "aa1eaf95dbe2c9828d0bd3a00f770f50"
+SRC_URI[sha256sum] = "6fa2748f1acdf44d750253e160cf6e2e72571329b42e563b455bde09e9e85173"
+
+inherit autotools
+
+# On mips, we have the following error.
+#   do_page_fault(): sending SIGSEGV to ls for invalid read access from 00000008
+#   Segmentation fault (core dumped)
+# On aarch64, system hangs when using libtcmalloc.so.
+COMPATIBLE_HOST = "(i.86|x86_64|powerpc|powerpc64|arm).*-linux*"
-- 
2.8.3


