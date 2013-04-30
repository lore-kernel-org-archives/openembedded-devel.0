Received: from mail-da0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UXDn2-0001C4-7i
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Apr 2013 18:52:51 +0200
Received: by mail-da0-f45.google.com with SMTP id v40so318423dad.32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2013 09:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=5TOUpBbgbBZf2ZUagkZzE76P9QWSlZMo/HSdQ8vm98c=;
	b=fTRJfQjsGVd0Vt4mIO7xsY2PUe9VSWZINapkbluSFSloJ/fnNsXpyDVk2uTV/FOc6b
	1rjg1dsk+uG6v9aTR5f3TuEWPi6xVjrqw7c2ZDxrywFQz73/q+NrQ/dYmDlltvA0U1YS
	ENYhvZyN8pfH391PlZTBxbG8BvzE8Ro130z+QV5Jea5uRgvTWTDvWEnvC4nbrWKtQfGH
	XPDxGzw+NivW4kGGaY2upd3tpBsuUZhypPJp8F94QTjTWBIwgEQfBf3R9p6TY0gaZLxh
	HXE9RghZKkNP48TNcBK8pydfhPPp4DvB/MhQlY8BYV5D+ZVh8qyWv9zu2nLQIZkKvYxP
	7yRg==
X-Received: by 10.68.190.131 with SMTP id gq3mr11588006pbc.185.1367339676784; 
	Tue, 30 Apr 2013 09:34:36 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	z8sm29107782pbt.23.2013.04.30.09.34.31 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Apr 2013 09:34:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Apr 2013 18:32:54 +0200
Message-Id: <27b6ea6adcf1b6f5da4ab83efc7b2a903e1147e7.1367339449.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1367339449.git.Martin.Jansa@gmail.com>
References: <cover.1367339449.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1367339449.git.Martin.Jansa@gmail.com>
References: <cover.1367339449.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][dylan][PATCH 04/12] llvm2.9: remove X86 from LLVM_TARGETS_TO_BUILD
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
X-List-Received-Date: Tue, 30 Apr 2013 16:52:57 -0000

* when building for qemux86* it tries to build X86 twice and fails with:
  | CMake Error at lib/Target/CMakeLists.txt:24 (add_subdirectory):
  |   The binary directory
  |
  |     /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-oe-linux/llvm2.9/2.9-r2.0/llvm-2.9/build/lib/Target/X86
  |
  |   is already used to build a source directory.  It cannot be used to build
  |   source directory
  |
  |     /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-oe-linux/llvm2.9/2.9-r2.0/llvm-2.9/lib/Target/X86
  |
  |   Specify a unique binary directory name.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm2.9_2.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb b/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
index dc7f873..04195d9 100644
--- a/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
+++ b/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
@@ -19,7 +19,7 @@ PARALLEL_MAKE_virtclass-native = ""
 
 EXTRA_OECMAKE = "\
     -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm${LLVM_RELEASE}/tblgen \
-    -DLLVM_TARGETS_TO_BUILD="X86;${LLVM_ARCH}" \
+    -DLLVM_TARGETS_TO_BUILD="${LLVM_ARCH}" \
     -DCMAKE_LINKER:FILEPATH=${LD} \
     -DCMAKE_AR:FILEPATH=${AR} \
     -DCMAKE_OBJCOPY:FILEPATH=${OBJCOPY} \
-- 
1.8.2.1



