Received: from mail-pb0-f51.google.com ([209.85.160.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UXDnR-0001Dw-Ue
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Apr 2013 18:52:58 +0200
Received: by mail-pb0-f51.google.com with SMTP id rq13so344606pbb.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2013 09:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=0AgrGlo1pIBnv6AXS8iRTwKzsESThh+sbDJb3mK5qFk=;
	b=lBNdUX6CYnPZotZIFi3kVb9uIYfFm0W6TQJZtGaEJ3Rhh0FcoNmPLbqukVBtkrG/7t
	LSwx1klreLzNkVvVzfjBd4sNxQH0jR/Ja2S2kCuZrbftQKBlsTJCV6ElyuQ/4NTeSVjR
	6r3xl4iJZ09/rzgq4SS+Wun/8BkMgeGZJ0Lw1l4ov5fuoAydRwv9cQwEEybvAXtdC5tA
	G2HKFqFDxknBmR+yIf/fqZa11PfS4vSzoVUjmFs0qO2gvWC6RSgPUPGYYyuyA0HjeVK1
	kvuGQk59VARfA+hKKx6F+zMfmhjPjrRoQ1R880QIlGC4cgNyIp40uHamYq36obh+gtWe
	DvkA==
X-Received: by 10.66.156.196 with SMTP id wg4mr66336794pab.23.1367339702318;
	Tue, 30 Apr 2013 09:35:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	qb1sm29092874pbb.33.2013.04.30.09.34.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Apr 2013 09:35:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Apr 2013 18:32:55 +0200
Message-Id: <00003b0465ed8e479d7fdaeda8b55d93c2b7b562.1367339449.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1367339449.git.Martin.Jansa@gmail.com>
References: <cover.1367339449.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1367339449.git.Martin.Jansa@gmail.com>
References: <cover.1367339449.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][dylan][PATCH 05/12] llvm2.9: add LLVM_EXTRA_ARCH to enable X86 unless building for x86
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
X-List-Received-Date: Tue, 30 Apr 2013 16:53:22 -0000

* now I see why it was there before, at least on arm it fails with:
  | CMake Error at cmake/modules/LLVMConfig.cmake:127 (message):
  |   Library `X86' not found in list of llvm libraries.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm2.9_2.9.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb b/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
index 04195d9..2b46162 100644
--- a/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
+++ b/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
@@ -17,9 +17,13 @@ SRC_URI_append_libc-uclibc = " file://arm_fenv_uclibc.patch "
 
 PARALLEL_MAKE_virtclass-native = ""
 
+LLVM_EXTRA_ARCH = "X86;"
+LLVM_EXTRA_ARCH_x86 = ""
+LLVM_EXTRA_ARCH_x86-64 = ""
+
 EXTRA_OECMAKE = "\
     -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm${LLVM_RELEASE}/tblgen \
-    -DLLVM_TARGETS_TO_BUILD="${LLVM_ARCH}" \
+    -DLLVM_TARGETS_TO_BUILD="${LLVM_EXTRA_ARCH}${LLVM_ARCH}" \
     -DCMAKE_LINKER:FILEPATH=${LD} \
     -DCMAKE_AR:FILEPATH=${AR} \
     -DCMAKE_OBJCOPY:FILEPATH=${OBJCOPY} \
-- 
1.8.2.1



