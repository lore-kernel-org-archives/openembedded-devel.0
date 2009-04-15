Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Lu4PX-0008Gc-BJ
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 14:40:32 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id A85AF683CD;
	Wed, 15 Apr 2009 16:36:00 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@openembedded.org
Date: Wed, 15 Apr 2009 16:35:53 +0400
Message-Id: <1239798960-3586-4-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.1
In-Reply-To: <1239798960-3586-3-git-send-email-khimov@altell.ru>
References: <200904151633.49146.khimov@altell.ru>
	<1239798960-3586-1-git-send-email-khimov@altell.ru>
	<1239798960-3586-2-git-send-email-khimov@altell.ru>
	<1239798960-3586-3-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 04/11] gcc 4.2.4: add gcc-multilib64dir.patch
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
X-List-Received-Date: Wed, 15 Apr 2009 12:40:54 -0000

---
 recipes/gcc/files/gcc-multilib64dir.patch |   43 +++++++++++++++++++++++++++++
 recipes/gcc/gcc-4.2.4.inc                 |    1 +
 2 files changed, 44 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gcc/files/gcc-multilib64dir.patch

diff --git a/recipes/gcc/files/gcc-multilib64dir.patch b/recipes/gcc/files/gcc-multilib64dir.patch
new file mode 100644
index 0000000..301e596
--- /dev/null
+++ b/recipes/gcc/files/gcc-multilib64dir.patch
@@ -0,0 +1,43 @@
+#! /bin/sh -e
+
+# DP: Use lib instead of lib64 as multilibdir on amd64 and ppc64.
+#
+# Taken from Debian, fixed to apply with quilt
+
+Index: gcc/config/i386/t-linux64
+===================================================================
+--- gcc/config/i386/t-linux64	(revision 130706)
++++ gcc/config/i386/t-linux64	(working copy)
+@@ -13,7 +13,7 @@
+ 
+ MULTILIB_OPTIONS = m64/m32
+ MULTILIB_DIRNAMES = 64 32 
+-MULTILIB_OSDIRNAMES = ../lib64 $(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)
++MULTILIB_OSDIRNAMES = ../lib $(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)
+ 
+ LIBGCC = stmp-multilib
+ INSTALL_LIBGCC = install-multilib
+Index: gcc/config/rs6000/t-linux64
+===================================================================
+--- gcc/config/rs6000/t-linux64	(revision 130706)
++++ gcc/config/rs6000/t-linux64	(working copy)
+@@ -14,13 +14,13 @@
+ # it doesn't tell anything about the 32bit libraries on those systems.  Set
+ # MULTILIB_OSDIRNAMES according to what is found on the target.
+ 
+-MULTILIB_OPTIONS        = m64/m32 msoft-float
+-MULTILIB_DIRNAMES       = 64 32 nof
++MULTILIB_OPTIONS        = m64/m32
++MULTILIB_DIRNAMES       = 64 32
+ MULTILIB_EXTRA_OPTS     = fPIC mstrict-align
+-MULTILIB_EXCEPTIONS     = m64/msoft-float
+-MULTILIB_EXCLUSIONS     = m64/!m32/msoft-float
+-MULTILIB_OSDIRNAMES	= ../lib64 $(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib) nof
+-MULTILIB_MATCHES        = $(MULTILIB_MATCHES_FLOAT)
++MULTILIB_EXCEPTIONS     =
++MULTILIB_EXCLUSIONS     =
++MULTILIB_OSDIRNAMES	= ../lib $(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)
++MULTILIB_MATCHES        =
+ 
+ softfp_wrap_start := '\#ifndef __powerpc64__'
+ softfp_wrap_end := '\#endif'
diff --git a/recipes/gcc/gcc-4.2.4.inc b/recipes/gcc/gcc-4.2.4.inc
index 085f241..20bdfef 100644
--- a/recipes/gcc/gcc-4.2.4.inc
+++ b/recipes/gcc/gcc-4.2.4.inc
@@ -37,6 +37,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	file://gcc-4.0.2-e300c2c3.patch;patch=1 \
 	file://fortran-static-linking.patch;patch=1 \
 	file://intermask-bigendian.patch;patch=1 \
+	file://gcc-multilib64dir.patch;patch=1;pnum=0 \
 "
 
 SRC_URI_append_ep93xx = " \
-- 
1.6.2.1


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



