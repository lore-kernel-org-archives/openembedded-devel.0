Received: from mail-yh0-f48.google.com ([209.85.213.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1URQhG-00083z-T6
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Apr 2013 19:26:39 +0200
Received: by mail-yh0-f48.google.com with SMTP id q46so641491yhf.21
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2013 10:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=6OHZ2PHRVbmCZOcdTX88rEXeo//yrbUzciIx2G+zKb8=;
	b=BporF25MuYRe+4ByucMrgL/BuPm34Xg8jvt7GFiw+6+uB1w0nnQy4/ab3noVoVXv0b
	qYDKDSsK/Vb2bi1SWGdvjT9T70lh1casSCR1vtlqnpxDf0QpMKVcUwRaVln1P/GXyZZm
	zoIv2qIYp0KNM0CaVjd5na/bqfzbaIGcLnexQKtqZk/Zx3SnTYpJZqrYr15hPQD0bHXn
	gm6OuROBUM1ZlBm2IkGzJ8AB7oBntrkGC6h6NzIVb8Bl/l87pqN/LaD8lBUrYq5ZtDos
	QIOJ1sE1Dk1T1Yb8YVj8IC6PNquMOny++70mAdAeIrDdAfrQhXEG0RSw1aAgUpv1x7UN
	1QUA==
X-Received: by 10.236.132.232 with SMTP id o68mr10322392yhi.104.1365959346796; 
	Sun, 14 Apr 2013 10:09:06 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id y5sm23776970yhd.3.2013.04.14.10.09.04
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 10:09:06 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Sun, 14 Apr 2013 14:08:45 -0300
Message-Id: <1365959325-17201-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe PATCH] fio: Add armv6 support
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
X-List-Received-Date: Sun, 14 Apr 2013 17:26:54 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 ...eric-assembly-nop-and-barrier-code-for-ar.patch | 30 ++++++++++++++++++++++
 meta-oe/recipes-benchmark/fio/fio_2.0.5.bb         |  3 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/fio/fio/0001-ARM-Use-generic-assembly-nop-and-barrier-code-for-ar.patch

diff --git a/meta-oe/recipes-benchmark/fio/fio/0001-ARM-Use-generic-assembly-nop-and-barrier-code-for-ar.patch b/meta-oe/recipes-benchmark/fio/fio/0001-ARM-Use-generic-assembly-nop-and-barrier-code-for-ar.patch
new file mode 100644
index 0000000..db97244
--- /dev/null
+++ b/meta-oe/recipes-benchmark/fio/fio/0001-ARM-Use-generic-assembly-nop-and-barrier-code-for-ar.patch
@@ -0,0 +1,30 @@
+From 152b969cd4ff5b4b7e1c65eca1f9ab243b8a30c8 Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Sun, 14 Apr 2013 13:53:35 -0300
+Subject: [PATCH] ARM: Use generic assembly nop and barrier code for armv6
+
+Upstream-Status: Submitted
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ arch/arch-arm.h |    4 +++-
+ 1 files changed, 3 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arch-arm.h b/arch/arch-arm.h
+index 658b688..7cd9502 100644
+--- a/arch/arch-arm.h
++++ b/arch/arch-arm.h
+@@ -18,7 +18,9 @@
+ #define __NR_sys_vmsplice	343
+ #endif
+ 
+-#if defined (__ARM_ARCH_4__) || defined (__ARM_ARCH_4T__) || defined (__ARM_ARCH_5__) || defined (__ARM_ARCH_5T__) || defined (__ARM_ARCH_5TE__) || defined (__ARM_ARCH_5TEJ__)
++#if defined (__ARM_ARCH_4__) || defined (__ARM_ARCH_4T__) \
++	|| defined (__ARM_ARCH_5__) || defined (__ARM_ARCH_5T__) || defined (__ARM_ARCH_5TE__) || defined (__ARM_ARCH_5TEJ__) \
++	|| defined(__ARM_ARCH_6__)  || defined(__ARM_ARCH_6J__) || defined(__ARM_ARCH_6Z__) || defined(__ARM_ARCH_6ZK__)
+ #define nop             __asm__ __volatile__("mov\tr0,r0\t@ nop\n\t")
+ #define read_barrier()	__asm__ __volatile__ ("" : : : "memory")
+ #define write_barrier()	__asm__ __volatile__ ("" : : : "memory")
+-- 
+1.7.2.5
+
diff --git a/meta-oe/recipes-benchmark/fio/fio_2.0.5.bb b/meta-oe/recipes-benchmark/fio/fio_2.0.5.bb
index 4c086c8..40827ff 100644
--- a/meta-oe/recipes-benchmark/fio/fio_2.0.5.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_2.0.5.bb
@@ -14,7 +14,8 @@ DEPENDS = "libaio"
 
 # rev for v2.0.5
 SRCREV = "02efadeb8b05144bcf2fc7796e1da2e7db211d00"
-SRC_URI = "git://git.kernel.dk/fio.git"
+SRC_URI = "git://git.kernel.dk/fio.git \
+           file://0001-ARM-Use-generic-assembly-nop-and-barrier-code-for-ar.patch"
 
 S = "${WORKDIR}/git"
 
-- 
1.8.1



