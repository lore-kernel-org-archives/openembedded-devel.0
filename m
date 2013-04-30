Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UXDmP-00019H-Qw
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Apr 2013 18:52:02 +0200
Received: by mail-pb0-f49.google.com with SMTP id rp8so340801pbb.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2013 09:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=syGmRcJaLTtT70KMyKitrg0TeMqiXnBmJNGklbgCVCg=;
	b=U/4nvcEE/+iaVlkg4ZXeUg/EwrvkErZe+X9OFNIW9IjXaYwaezJUOEyOynVPXi/Z8R
	cQkrIImG3D40PWIEiO8jZT3jj1ySHJ+3vDoki5D0rDwnuup+bOEVbgZpyBy3yEV2Nvfs
	+N7n7qE6eIFTTQAXBLSMV0MeYkRz9WUYZJLWGHirHtcFIza2T+8PQk59CpQbOttQR2CH
	396svNljat/w6LokYtiBMhaxrZH5V8Quu4uLfd6PznVjZOu8zT84fftUlf2A75l0Czc5
	AYUFG6WcNobX2O9P8bl+T8t/VNR9dJel8nbbiRn6xGwO1H9LShAlkpkr/+jFqB2ei3Ke
	GQsg==
X-Received: by 10.68.210.5 with SMTP id mq5mr76962548pbc.44.1367339638380;
	Tue, 30 Apr 2013 09:33:58 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	hp1sm31288780pac.3.2013.04.30.09.33.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Apr 2013 09:33:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Apr 2013 18:32:52 +0200
Message-Id: <db8e72e1f5ea2059f2b294c5e3e65feb329dfe03.1367339449.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1367339449.git.Martin.Jansa@gmail.com>
References: <cover.1367339449.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1367339449.git.Martin.Jansa@gmail.com>
References: <cover.1367339449.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][dylan][PATCH 02/12] llvm2.9: fix build with gcc-4.7
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
X-List-Received-Date: Tue, 30 Apr 2013 16:52:14 -0000

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



