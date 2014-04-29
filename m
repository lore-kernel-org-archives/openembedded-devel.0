Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id B485960808
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 23:10:18 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id kq14so953771pab.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 16:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cjDBjOHuv++4qo1qpwt7f+6Q1Zo7r6XRQBukHRXWJJw=;
	b=jtKnDNk+WesNUMAOfc1zx51ER23Sxjv66JOp8ZIeMXPuHfrEsbA5jPF7aAsA3icqQY
	ULT4ATkxrk88sh3HheW0zs8cRpbh8rMgHPvTpJM22vmIbnBNL9Al21SJx7ajsQZlVGpw
	XqCVVPrvLgI/INcIFB+a4fLi8jh86/TLeCrq7x+pxiJP+yu6hAwR8VosYV5pGQKWrwTJ
	xuQq/0VhT/IUDv5WBqr8laTqErIwGlA9PZYXHUgPCBV/jis5f3xNNchK7IYKbM45HMAw
	ZBvSEIWcF3acHwW5B/NKJnwYLPhxTb6iqyL3ohgrCORPnhpyNbyLwm2cN0Nzq0XatpS4
	fB/A==
X-Received: by 10.66.161.231 with SMTP id xv7mr417754pab.7.1398806071796;
	Tue, 29 Apr 2014 14:14:31 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	kt8sm118692323pab.7.2014.04.29.14.14.30 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Apr 2014 14:14:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Apr 2014 14:16:33 -0700
Message-Id: <1398806193-17743-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] llvm3: Fix build when S != B
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
X-List-Received-Date: Tue, 29 Apr 2014 23:10:18 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm3.inc |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/llvm/llvm3.inc b/meta-oe/recipes-core/llvm/llvm3.inc
index 798d4a2..a5bd896 100644
--- a/meta-oe/recipes-core/llvm/llvm3.inc
+++ b/meta-oe/recipes-core/llvm/llvm3.inc
@@ -21,14 +21,14 @@ EXTRA_OEMAKE += "REQUIRES_RTTI=1 VERBOSE=1"
 
 do_configure_prepend() {
     # Remove RPATHs
-    sed -i 's:$(RPATH) -Wl,$(\(ToolDir\|LibDir\|ExmplDir\))::g' Makefile.rules
+    sed -i 's:$(RPATH) -Wl,$(\(ToolDir\|LibDir\|ExmplDir\))::g' ${S}/Makefile.rules
 
     # Drop "svn" suffix from version string
-    sed -i 's/${PV}svn/${PV}/g' configure
+    sed -i 's/${PV}svn/${PV}/g' ${S}/configure
 
     # Fix paths in llvm-config
-    sed -i "s|sys::path::parent_path(CurrentPath))\.str()|sys::path::parent_path(sys::path::parent_path(CurrentPath))).str()|g" tools/llvm-config/llvm-config.cpp
-    sed -ri "s#/(bin|include|lib)(/?\")#/\1/${LLVM_DIR}\2#g" tools/llvm-config/llvm-config.cpp
+    sed -i "s|sys::path::parent_path(CurrentPath))\.str()|sys::path::parent_path(sys::path::parent_path(CurrentPath))).str()|g" ${S}/tools/llvm-config/llvm-config.cpp
+    sed -ri "s#/(bin|include|lib)(/?\")#/\1/${LLVM_DIR}\2#g" ${S}/tools/llvm-config/llvm-config.cpp
 
     # Fails to build unless using separate directory from source
     mkdir -p ${LLVM_BUILD_DIR}
-- 
1.7.10.4


