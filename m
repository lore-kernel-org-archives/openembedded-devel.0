Received: from mail-da0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UTCAc-0007UG-Q1
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Apr 2013 16:20:12 +0200
Received: by mail-da0-f45.google.com with SMTP id v40so1969474dad.18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Apr 2013 07:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=syGmRcJaLTtT70KMyKitrg0TeMqiXnBmJNGklbgCVCg=;
	b=uZ8tzabWLKahzy0Og860BMu885QU9DbA/shYyYkCcsVaVkOfuQy6Rof4oO/pnSQ/8A
	ZbVrYy1VHlDFke6rSmeNYlEm781GvI8FAdXShMwXjSLuKoQTBc3z/u2EgY5LaRZXOGx0
	wc2wbUxiOUabrUqL8V4HhtD/rIjZHO23h6L5DIyNwIZr5Av3na+M/vZU6ptZSbTZGcu5
	n2phWE3pNzYgzfolAJjyG7gD/TG3dr8YjFw9mdtki9Nvj2tpFm/8+s6j3L2CJjicJl2X
	2OdZX/mrkE3ALSsfC1C3t6r1T2Z11MMYEATwDaQUNfIxg4ZfoYyeRxd8fkogjPOaRmk9
	xESQ==
X-Received: by 10.68.211.161 with SMTP id nd1mr19700610pbc.59.1366380155513;
	Fri, 19 Apr 2013 07:02:35 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id b3sm13570963pbw.4.2013.04.19.07.02.33
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 07:02:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Apr 2013 16:02:22 +0200
Message-Id: <1366380143-12256-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1366380143-12256-1-git-send-email-Martin.Jansa@gmail.com>
References: <1366380143-12256-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/3] llvm2.9: fix build with gcc-4.7
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
X-List-Received-Date: Fri, 19 Apr 2013 14:20:14 -0000
X-List-Received-Date: Fri, 19 Apr 2013 14:20:14 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm2.9/0035-gcc-4.7.patch | 16 ++++++++++++++++
 meta-oe/recipes-core/llvm/llvm2.9_2.9.bb             |  2 ++
 2 files changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-core/llvm/llvm2.9/0035-gcc-4.7.patch

diff --git a/meta-oe/recipes-core/llvm/llvm2.9/0035-gcc-4.7.patch b/meta-oe/recipes-core/llvm/llvm2.9/0035-gcc-4.7.patch
new file mode 100644
index 0000000..4cf8d44
--- /dev/null
+++ b/meta-oe/recipes-core/llvm/llvm2.9/0035-gcc-4.7.patch
@@ -0,0 +1,16 @@
+Upstream-Status: Pending
+
+Imported from http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=673266
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+--- a/lib/ExecutionEngine/JIT/Intercept.cpp	2012-05-17 16:11:46.956180361 +0200
++++ b/lib/ExecutionEngine/JIT/Intercept.cpp	2012-05-17 16:14:35.256184996 +0200
+@@ -52,6 +52,7 @@
+ #include <sys/stat.h>
+ #endif
+ #include <fcntl.h>
++#include <unistd.h>
+ /* stat functions are redirecting to __xstat with a version number.  On x86-64 
+  * linking with libc_nonshared.a and -Wl,--export-dynamic doesn't make 'stat' 
+  * available as an exported symbol, so we have to add it explicitly.
diff --git a/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb b/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
index 68cf70b..d5b8c01 100644
--- a/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
+++ b/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
@@ -2,6 +2,8 @@ require llvm.inc
 
 PR = "${INC_PR}.0"
 
+SRC_URI += "file://0035-gcc-4.7.patch"
+
 SRC_URI_append_libc-uclibc = " file://arm_fenv_uclibc.patch "
 
 PARALLEL_MAKE_virtclass-native = ""
-- 
1.8.2.1



