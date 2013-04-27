Received: from mail-da0-f46.google.com ([209.85.210.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UWBn1-0005ar-Sg
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Apr 2013 22:32:12 +0200
Received: by mail-da0-f46.google.com with SMTP id x4so1863246daj.19
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2013 13:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=0AgrGlo1pIBnv6AXS8iRTwKzsESThh+sbDJb3mK5qFk=;
	b=dSKh9KzZZQ4ufAhynWU7Td7OiwRvGzpxJLONtOPNX90eHZ9kM9pKT/mUr2TTl053an
	Cr8c6XbdqGZITaR+kcq4DH+VgYYNhNzvPN8I3umV/TjwGcqx7iNB2k6kVywoZ8IFg8w+
	Ncej9eWvRIKeqhvePaN0gvnWjcMwOPWcUHOn7oS3O2qBeer0k2P/f1nP8hrYekw4tEiL
	cOpypFjTz36j54hW0vjwWBCWCY0zLsxUC4tHRLOLfCng4ccJ3Et61M0XHospLZ+UBIZ6
	i74R1woGGqOe9VdyK2dJ3svcRTvIe6yawJX6uLv5ZAFtzYHQ1Uij+lHz6t7BM/TtmevP
	Lc+Q==
X-Received: by 10.68.221.69 with SMTP id qc5mr54178656pbc.7.1367093664457;
	Sat, 27 Apr 2013 13:14:24 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	be7sm18416479pad.20.2013.04.27.13.14.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 27 Apr 2013 13:14:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Apr 2013 22:14:31 +0200
Message-Id: <1367093674-13613-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [meta-oe][PATCH 1/4] llvm2.9: add LLVM_EXTRA_ARCH to enable X86 unless building for x86
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
X-List-Received-Date: Sat, 27 Apr 2013 20:32:24 -0000

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



