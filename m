Received: from mail-pa0-f43.google.com ([209.85.220.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UXDmG-00018c-6S
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Apr 2013 18:52:02 +0200
Received: by mail-pa0-f43.google.com with SMTP id hz10so443598pad.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2013 09:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=MkEy71BRd91CJj2yhbsCp/G7nXBLSE26jw2iPy3h3Ig=;
	b=gwHpxC2S9JbbNDIXpLDTZR6VdOTJ4XooAVJRH1suW8C2YHY+gATla9TWIjwfOKrN3A
	Q7BWobLV2fni80CvHNONL7QKNoxA0e98XVZyhmGEtIZqq08wH3DBk7Cow6x0oyPpribI
	J2GpGgM78Z8RFj1Q/7TU0YewTxVWzWUwGb9ucR7wSwi7KdY4gcqg7Ev1Mw4WVLbjWFjd
	Tx6GyuQ0Cq8e+co2i5gaQDqN9Y16XEbIm0nwp6bljJ/J7//z10Qv6Aijx+pE3q/InGlu
	nhG9qMBe/ELJPVxPF8V0/JcSJYYg7aGla+oEjHV6s7Gbhbj5PZGjsWPRN/msdQHFi/U0
	sJFw==
X-Received: by 10.66.171.11 with SMTP id aq11mr49888351pac.24.1367339612783;
	Tue, 30 Apr 2013 09:33:32 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	aj2sm29134373pbc.1.2013.04.30.09.33.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Apr 2013 09:33:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Apr 2013 18:32:51 +0200
Message-Id: <7ee1b70633aae408002fd00ffe66921a08e9e756.1367339449.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1367339449.git.Martin.Jansa@gmail.com>
References: <cover.1367339449.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1367339449.git.Martin.Jansa@gmail.com>
References: <cover.1367339449.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][dylan][PATCH 01/12] llvm2.9: Import from meta-java
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
X-List-Received-Date: Tue, 30 Apr 2013 16:52:14 -0000

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



