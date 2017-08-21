Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B18F578273
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 06:00:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7L60iPI005416
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 20 Aug 2017 23:00:44 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 20 Aug 2017 23:00:43 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Aug 2017 02:00:37 -0400
Message-ID: <bb49a5b8354304bf5ba5cca7cd7a5ca2f8147088.1503295148.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1503295148.git.hongxu.jia@windriver.com>
References: <cover.1503295148.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] python3-pykickstart: tweak shebang to python3
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
X-List-Received-Date: Mon, 21 Aug 2017 06:00:44 -0000
Content-Type: text/plain

Fix the following file-rdeps QA issue:
...
|ERROR: python3-pykickstart-2.35-r0 do_package_qa: QA Issue:
/usr/bin/ksvalidator contained in package python3-pykickstart requires
/usr/bin/python, but no providers found in RDEPENDS_python3-pykickstart?
[file-rdeps]
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../files/0005-tweak-shebang-to-python3.patch      | 25 ++++++++++++++++++++++
 .../python-pykickstart/python3-pykickstart_2.35.bb |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-extended/python-pykickstart/files/0005-tweak-shebang-to-python3.patch

diff --git a/meta-python/recipes-extended/python-pykickstart/files/0005-tweak-shebang-to-python3.patch b/meta-python/recipes-extended/python-pykickstart/files/0005-tweak-shebang-to-python3.patch
new file mode 100644
index 0000000..3d61495
--- /dev/null
+++ b/meta-python/recipes-extended/python-pykickstart/files/0005-tweak-shebang-to-python3.patch
@@ -0,0 +1,25 @@
+From 8a1f598223bd4cbcc877eb2aba3f5586c75c9d14 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 21 Aug 2017 10:05:06 +0800
+Subject: [PATCH] tweak shebang to python3
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ tools/ksvalidator.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/ksvalidator.py b/tools/ksvalidator.py
+index d6051d5..c3682e8 100755
+--- a/tools/ksvalidator.py
++++ b/tools/ksvalidator.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/python3
+ #
+ # Chris Lumens <clumens@redhat.com>
+ #
+-- 
+1.8.3.1
+
diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_2.35.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_2.35.bb
index e96af43..2a2840f 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_2.35.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_2.35.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=py
            file://0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch \
            file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch \
            file://0004-load.py-retry-to-invoke-request-with-timeout.patch \
+           file://0005-tweak-shebang-to-python3.patch \
            "
 SRCREV = "b2787a818540e678c2f9c5dca0c6bbd65b8b55e5"
 
-- 
2.8.1


