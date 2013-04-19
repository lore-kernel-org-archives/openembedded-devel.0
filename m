Received: from mail-da0-f53.google.com ([209.85.210.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UTCAS-0007Tm-7E
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Apr 2013 16:20:03 +0200
Received: by mail-da0-f53.google.com with SMTP id n34so1957699dal.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Apr 2013 07:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=MkEy71BRd91CJj2yhbsCp/G7nXBLSE26jw2iPy3h3Ig=;
	b=km9nv+PNK1g7py/cCd0Yk7LdJxl8jw5Or16nw6YX7IJjOTNIjIwEgLaRVTGhwa++jQ
	m70mJz8SPurLJTgzu5v3XLRe+odrtb8ZR1thEkhD/Vnjr+VUMbQVihIaE2a1vJ60XMZf
	LiGP7qxDSzKoKGfa1Bqyx+pMo3Ifej1FKYZLcGWDHd62ct4mbChHsPQhYkNuHQbSxjFD
	iL7w/4+i+xM6olvi/DT25HMk1LdAh3EdSOEJedja6pfmb4fwzKKlOnyRqPikSGS7Kr9c
	X47EOwEwlSs2I4xLOMZ9WKoJuUFgU2haPZOtrcxCzJaffQZKh2HWn7BS4zC+bGrhIj+G
	W47A==
X-Received: by 10.68.172.65 with SMTP id ba1mr19807663pbc.166.1366380144925;
	Fri, 19 Apr 2013 07:02:24 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id xz4sm13549361pbb.18.2013.04.19.07.02.22
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 07:02:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Apr 2013 16:02:21 +0200
Message-Id: <1366380143-12256-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [meta-oe][PATCH 1/3] llvm2.9: Import from meta-java
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Apr 2013 14:20:04 -0000

* llvm is generic enough to be useful outside meta-java
  e.g. we need it to enable llvmpipe galium driver in mesa

* imported without any modification (except indentation), all
  credits go to Henning Heinold and Khem Raj for maintaining
  it in meta-java

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../llvm/llvm2.9/arm_fenv_uclibc.patch             | 14 +++++++++++
 meta-oe/recipes-core/llvm/llvm2.9_2.9.bb           | 29 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-core/llvm/llvm2.9/arm_fenv_uclibc.patch
 create mode 100644 meta-oe/recipes-core/llvm/llvm2.9_2.9.bb

diff --git a/meta-oe/recipes-core/llvm/llvm2.9/arm_fenv_uclibc.patch b/meta-oe/recipes-core/llvm/llvm2.9/arm_fenv_uclibc.patch
new file mode 100644
index 0000000..c3ae494
--- /dev/null
+++ b/meta-oe/recipes-core/llvm/llvm2.9/arm_fenv_uclibc.patch
@@ -0,0 +1,14 @@
+Index: llvm-2.9/include/llvm/Support/FEnv.h
+===================================================================
+--- llvm-2.9.orig/include/llvm/Support/FEnv.h	2010-11-29 20:44:50.000000000 +0100
++++ llvm-2.9/include/llvm/Support/FEnv.h	2011-11-18 18:42:22.580161297 +0100
+@@ -17,6 +17,9 @@
+ 
+ #include "llvm/Config/config.h"
+ #include <cerrno>
++
++#undef HAVE_FENV_H
++
+ #ifdef HAVE_FENV_H
+ #include <fenv.h>
+ #endif
diff --git a/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb b/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
new file mode 100644
index 0000000..68cf70b
--- /dev/null
+++ b/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
@@ -0,0 +1,29 @@
+require llvm.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI_append_libc-uclibc = " file://arm_fenv_uclibc.patch "
+
+PARALLEL_MAKE_virtclass-native = ""
+
+EXTRA_OECMAKE = "\
+    -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm${LLVM_RELEASE}/tblgen \
+    -DLLVM_TARGETS_TO_BUILD="X86;${LLVM_ARCH}" \
+    -DCMAKE_LINKER:FILEPATH=${LD} \
+    -DCMAKE_AR:FILEPATH=${AR} \
+    -DCMAKE_OBJCOPY:FILEPATH=${OBJCOPY} \
+    -DCMAKE_OBJDUMP:FILEPATH=${OBJDUMP} \
+    -DCMAKE_RANLIB:FILEPATH=${RANLIB} \
+    -DCMAKE_STRIP:FILEPATH=${STRIP} \
+    -DNM_PATH:FILEPATH=${NM} \
+    -DLLVM_ENABLE_PIC:BOOL=ON \
+    -DLLVM_TARGET_ARCH:STRING=${LLVM_ARCH} \
+    -DLLVM_ENABLE_ASSERTIONS:BOOL=ON \
+    -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo \
+    -DBUILD_SHARED_LIBS:BOOL=ON \
+"
+
+LLVM_RELEASE = "2.9"
+
+SRC_URI[md5sum] = "793138412d2af2c7c7f54615f8943771"
+SRC_URI[sha256sum] = "661236cfa17428b48cfa9cbb9909f7569c64b8ecd219fd91dbc00e3b557b3779"
-- 
1.8.2.1



