Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 59B4A731F6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2016 16:19:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4AGJtvw029429
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 May 2016 09:19:55 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 10 May 2016 09:19:54 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <Martin.Jansa@gmail.com>, <koen.kooi@linaro.org>
Date: Tue, 10 May 2016 12:19:39 -0400
Message-ID: <ef3df7d5c7a3fe7420e4a53f165de480f2d172f2.1462896891.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1462896891.git.hongxu.jia@windriver.com>
References: <cover.1462896891.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/5] efivar: fix unknown option while gold linker used
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
X-List-Received-Date: Tue, 10 May 2016 16:19:55 -0000
Content-Type: text/plain

- Use '-fPIC' to replace 'PIC';

- Use 'pie' to replace 'PIE'

- Remove unknown '--add-needed'

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0004-fix-unknow-option-for-gold-linker.patch   | 40 ++++++++++++++++++++++
 meta-oe/recipes-extended/efivar/efivar_0.23.bb     |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch

diff --git a/meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch b/meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch
new file mode 100644
index 0000000..44194d1
--- /dev/null
+++ b/meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch
@@ -0,0 +1,40 @@
+From 3ea4b2d9eb0aab65413b66ece1e0234f3fc5e8a0 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 10 May 2016 11:47:20 -0400
+Subject: [PATCH] fix unknow option for gold linker
+
+- Revert the following patch, since oe-core work with gcc 5
+...
+commit 3055a3797f16693dfdd855fa68bc57fd900dc408
+Author: Peter Jones <pjones@redhat.com>
+Date:   Mon Feb 15 14:15:40 2016 -0500
+
+    Make gcc.specs work with gcc 6 / binutils 2.26
+
+    Apparently binutils 2.26 gets real picky about "ld -PIC" vs "ld -fPIC".
+
+    Signed-off-by: Peter Jones <pjones@redhat.com>
+...
+
+- Remove unknown option '--add-needed'
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ gcc.specs | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc.specs b/gcc.specs
+index 24fabc2..d27feb3 100644
+--- a/gcc.specs
++++ b/gcc.specs
+@@ -14,4 +14,4 @@
+ + %{!shared:%{!static:%{!r:-pie}}} %{static:-Wl,-no-fatal-warnings -Wl,-static -static -Wl,-z,relro,-z,now}
+ 
+ *link:
+-+ %{!static:--fatal-warnings} --no-undefined-version --no-allow-shlib-undefined --add-needed -z now --build-id %{!static:%{!shared:-PIE}} %{shared:-z relro -PIC} %{static:%<pie}
+++ %{!static:--fatal-warnings} --no-undefined-version --no-allow-shlib-undefined -z now --build-id %{!static:%{!shared:-fPIE}} %{shared:-z relro -fPIC} %{static:%<pie}
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-extended/efivar/efivar_0.23.bb b/meta-oe/recipes-extended/efivar/efivar_0.23.bb
index 9c47461..6e9a51f 100644
--- a/meta-oe/recipes-extended/efivar/efivar_0.23.bb
+++ b/meta-oe/recipes-extended/efivar/efivar_0.23.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/rhinstaller/efivar.git"
 SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch \
                                 file://0002-disable-static-build.patch \
                                 file://0003-efivar-fix-for-cross-compile.patch \
+                                file://0004-fix-unknow-option-for-gold-linker.patch \
                               "
 
 S = "${WORKDIR}/git"
-- 
2.8.1


