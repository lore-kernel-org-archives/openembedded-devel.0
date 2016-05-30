Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0B31C77123
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2016 07:39:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4U7dQVV011773
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 30 May 2016 00:39:26 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 30 May 2016 00:39:25 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 30 May 2016 03:39:23 -0400
Message-ID: <1464593963-76595-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] efivar-native: fix compile failure with older host gcc (<=4.6)
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
X-List-Received-Date: Mon, 30 May 2016 07:39:27 -0000
Content-Type: text/plain

While host gcc version is 4.6.3 in ubuntu 1204, it
did not recognize -std=gnu11 and -Wmaybe-uninitialized.

While host gcc version is 4.4.7 in centos6, it
did not recognize -std=gnu11, -Wmaybe-uninitialized,
and -flto.

For native build, use -std=gnu99 to replace -std=gnu11,
and directly remove -Wmaybe-uninitialized and -flto.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../fix-compile-failure-with-host-gcc-4.6.patch    | 45 ++++++++++++++++++++++
 meta-oe/recipes-extended/efivar/efivar_0.23.bb     |  2 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-extended/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch

diff --git a/meta-oe/recipes-extended/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch b/meta-oe/recipes-extended/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch
new file mode 100644
index 0000000..1c68a29
--- /dev/null
+++ b/meta-oe/recipes-extended/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch
@@ -0,0 +1,45 @@
+From 1361225abbaba878960f970df39a4570bbc39553 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 26 May 2016 21:50:01 -0400
+Subject: [PATCH] fix compile failure with older host gcc (<=4.6)
+
+While host gcc version is 4.6.3 in ubuntu 1204, it
+did not recognize -std=gnu11 and -Wmaybe-uninitialized.
+
+While host gcc version is 4.4.7 in centos6, it
+did not recognize -std=gnu11, -Wmaybe-uninitialized,
+and -flto.
+
+For native build, use -std=gnu99 to replace -std=gnu11,
+and directly remove -Wmaybe-uninitialized and -flto.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ gcc.specs | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gcc.specs b/gcc.specs
+index 0d4bbda..3802ca6 100644
+--- a/gcc.specs
++++ b/gcc.specs
+@@ -2,13 +2,13 @@
+ + -D_GNU_SOURCE
+ 
+ *efivar_cpp_options:
+- -Werror -Wall -std=gnu11 -Wextra
++ -Werror -Wall -std=gnu99 -Wextra
+ 
+ *cpp_options:
+ + %(efivar_cpp_options)
+ 
+ *cc1_options:
+-+ %(efivar_cpp_options) -Wmaybe-uninitialized -fno-merge-constants -flto -fvisibility=hidden %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}}
+++ %(efivar_cpp_options) -fno-merge-constants -fvisibility=hidden %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}}
+ 
+ *self_spec:
+ + %{!shared:%{!static:%{!r:-pie}}} %{static:-Wl,-no-fatal-warnings -Wl,-static -static -Wl,-z,relro,-z,now}
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-extended/efivar/efivar_0.23.bb b/meta-oe/recipes-extended/efivar/efivar_0.23.bb
index 6e9a51f..046cad9 100644
--- a/meta-oe/recipes-extended/efivar/efivar_0.23.bb
+++ b/meta-oe/recipes-extended/efivar/efivar_0.23.bb
@@ -14,6 +14,8 @@ SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch \
                                 file://0003-efivar-fix-for-cross-compile.patch \
                                 file://0004-fix-unknow-option-for-gold-linker.patch \
                               "
+SRC_URI_append_class-native = " file://fix-compile-failure-with-host-gcc-4.6.patch \
+                              "
 
 S = "${WORKDIR}/git"
 
-- 
2.8.1


