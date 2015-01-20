Return-Path: <andrea.adami@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 945E571353
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2015 23:01:48 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id l2so377086wgh.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2015 15:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=oKRDlVms1WIptwZ28Kg3svqDon2YO/f6DQ0Balo/mBw=;
	b=vcQvMOtkv5sBYU1Kd0iRYP3lmF69weN3kzjq6e0BpVoLvpzOn0tgoBuFIMXMIzuWZF
	fVXSizkv8O4HP+sb3qzMIkS5gDsdJVb7dv8O12IXeoZVP4Fbq/oXhxgCI5l1EP/Xk8Ec
	J6t9cOjtquCt04d+lViXSNIpLKu8WUeMg2nOm21OfEoeWAk5HE2bdgNCkc8CEKueh8q9
	FGIwe6KFZ/gtvo2r13E2X7ILrmfjTEllsHPtfKDiL+sn+MG470HUZxMjm9DwAZrCDFBj
	m395z5d3nD36kvZIDykn/piB/W2mffZGtq7Js0Rqq32nup4T0QPYG5gwQEVqUfspBUXZ
	ZC9Q==
X-Received: by 10.194.59.33 with SMTP id w1mr76619555wjq.123.1421794908303;
	Tue, 20 Jan 2015 15:01:48 -0800 (PST)
Received: from mizar.208.67.220.220
	(host30-62-dynamic.24-79-r.retail.telecomitalia.it. [79.24.62.30])
	by mx.google.com with ESMTPSA id ej10sm4860420wib.2.2015.01.20.15.01.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Jan 2015 15:01:47 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jan 2015 00:01:42 +0100
Message-Id: <1421794902-18855-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-initramfs][PATCH] kexec-tools-klibc_2.0.2: backport patch to fix build with separate B and S
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
X-List-Received-Date: Tue, 20 Jan 2015 23:01:52 -0000

Catching up with oe-core commit 5fccfd0f0a9dd4dca96389f5d856d3fab21745e2
( kexec-tools: separate B and S) which removed autotools-brokensep for a newer
version.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../fix-out-of-tree-build.patch                    | 54 ++++++++++++++++++++++
 .../kexec/kexec-tools-klibc_2.0.2.bb               |  2 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/fix-out-of-tree-build.patch

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/fix-out-of-tree-build.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/fix-out-of-tree-build.patch
new file mode 100644
index 0000000..ccbb24d
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/fix-out-of-tree-build.patch
@@ -0,0 +1,54 @@
+From 37737527725e465833be649101c4a6f8352c5d5e Mon Sep 17 00:00:00 2001
+From: Tyler Hall <tylerwhall@gmail.com>
+Date: Tue, 7 Feb 2012 18:50:05 -0500
+Subject: Fix out-of-tree build
+
+Use automatic variables for prerequisites when copying man pages and
+include a makefile relative to $(srcdir).
+
+Backported to 2.0.2-klibc
+
+Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
+Signed-off-by: Simon Horman <horms@verge.net.au>
+
+diff --git a/kdump/Makefile b/kdump/Makefile
+index 1e2b72c..5dfa928 100644
+--- a/kdump/Makefile
++++ b/kdump/Makefile
+@@ -22,7 +22,7 @@ $(KDUMP): $(KDUMP_OBJS)
+ 
+ $(KDUMP_MANPAGE): kdump/kdump.8
+ 	$(MKDIR) -p     $(MANDIR)/man8
+-	cp kdump/kdump.8 $(KDUMP_MANPAGE)
++	cp $^ $(KDUMP_MANPAGE)
+ echo::
+ 	@echo "KDUMP_SRCS $(KDUMP_SRCS)"
+ 	@echo "KDUMP_DEPS $(KDUMP_DEPS)"
+diff --git a/kexec/Makefile b/kexec/Makefile
+index 2137cab..8c815b5 100644
+--- a/kexec/Makefile
++++ b/kexec/Makefile
+@@ -82,7 +82,7 @@ $(KEXEC): CPPFLAGS+=-I$(srcdir)/kexec/arch/$(ARCH)/include
+ 
+ $(KEXEC_MANPAGE): kexec/kexec.8
+ 	@$(MKDIR) -p     $(MANDIR)/man8
+-	cp kexec/kexec.8 $(KEXEC_MANPAGE)
++	cp $^ $(KEXEC_MANPAGE)
+ echo::
+ 	@echo "KEXEC_SRCS $(KEXEC_SRCS)"
+ 	@echo "KEXEC_DEPS $(KEXEC_DEPS)"
+diff --git a/kexec/arch/ppc/Makefile b/kexec/arch/ppc/Makefile
+index 3dba7cf..41242a5 100644
+--- a/kexec/arch/ppc/Makefile
++++ b/kexec/arch/ppc/Makefile
+@@ -1,7 +1,7 @@
+ #
+ # kexec ppc (linux booting linux)
+ #
+-include kexec/arch/ppc/libfdt/Makefile.libfdt
++include $(srcdir)/kexec/arch/ppc/libfdt/Makefile.libfdt
+ 
+ ppc_KEXEC_SRCS =  kexec/arch/ppc/kexec-ppc.c
+ ppc_KEXEC_SRCS += kexec/arch/ppc/kexec-elf-ppc.c
+
+
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
index b1b6ffc..3c829fa 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
@@ -4,6 +4,7 @@ SUMMARY = "Kexec tools, statically compiled against klibc"
 SRC_URI[md5sum] = "92eff93b097475b7767f8c98df84408a"
 SRC_URI[sha256sum] = "09e180ff36dee087182cdc939ba6c6917b6adbb5fc12d589f31fd3659b6471f2"
 
+#inherit autotools-brokensep
 inherit klibc
 
 FILESPATH =. "${FILE_DIRNAME}/kexec-tools-${PV}:"
@@ -17,6 +18,7 @@ SRC_URI += " \
             file://purgatory_string.patch \
             file://sha256.patch \
             file://sysconf_nrprocessors.patch \
+            file://fix-out-of-tree-build.patch \
             "
 
 SRC_URI_append_arm = " file://arm_crashdump.patch"
-- 
1.9.1


