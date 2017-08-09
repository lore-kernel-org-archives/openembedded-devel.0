Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F30C977BC9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 07:38:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v797cb2Z006676
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Aug 2017 00:38:37 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 9 Aug 2017 00:38:36 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Aug 2017 03:38:31 -0400
Message-ID: <4da5a2645def3a34a0ca502d7f11a2a00b3e7fa6.1502261386.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1502261386.git.hongxu.jia@windriver.com>
References: <cover.1502261386.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] tigervnc: fix a clang compiling issue
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
X-List-Received-Date: Wed, 09 Aug 2017 07:38:38 -0000
Content-Type: text/plain

Backport a fix from upstream

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...005-Remove-INITARGS-from-xserver119.patch.patch | 27 ++++++++++++++++++++++
 .../recipes-graphics/tigervnc/tigervnc_1.8.0.bb    |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0005-Remove-INITARGS-from-xserver119.patch.patch

diff --git a/meta-oe/recipes-graphics/tigervnc/files/0005-Remove-INITARGS-from-xserver119.patch.patch b/meta-oe/recipes-graphics/tigervnc/files/0005-Remove-INITARGS-from-xserver119.patch.patch
new file mode 100644
index 0000000..2f342c6
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/files/0005-Remove-INITARGS-from-xserver119.patch.patch
@@ -0,0 +1,27 @@
+From e4ec992984983ac9107efae1f1cc552007e4229e Mon Sep 17 00:00:00 2001
+From: Vishal Biswas <vshlbiswas@ymail.com>
+Date: Mon, 8 May 2017 11:06:11 +0530
+Subject: [PATCH] Remove INITARGS from xserver119.patch
+
+Upstream-Status: Backport
+
+---
+ unix/xserver119.patch | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/unix/xserver119.patch b/unix/xserver119.patch
+index 614f104..7adf314 100644
+--- a/unix/xserver119.patch
++++ b/unix/xserver119.patch
+@@ -66,7 +66,7 @@ diff -up xserver/mi/miinitext.c.xserver116-rebased xserver/mi/miinitext.c
+  #include "globals.h"
+  
+ +#ifdef TIGERVNC
+-+extern void vncExtensionInit(INITARGS);
+++extern void vncExtensionInit(void);
+ +#endif
+ +
+  /* The following is only a small first step towards run-time
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.8.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.8.0.bb
index d15bc9e..469745f 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.8.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.8.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.8-branch \
            file://0002-do-not-build-tests-sub-directory.patch \
            file://0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch \
            file://0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch \
+           file://0005-Remove-INITARGS-from-xserver119.patch.patch \
 "
 
 # Keep sync with xorg-server in oe-core
-- 
2.8.1


