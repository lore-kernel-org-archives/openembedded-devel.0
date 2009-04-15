Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Lu4PX-0008Gd-BL
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 14:40:30 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id 9B29A683CB;
	Wed, 15 Apr 2009 16:36:00 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@openembedded.org
Date: Wed, 15 Apr 2009 16:35:51 +0400
Message-Id: <1239798960-3586-2-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.1
In-Reply-To: <1239798960-3586-1-git-send-email-khimov@altell.ru>
References: <200904151633.49146.khimov@altell.ru>
	<1239798960-3586-1-git-send-email-khimov@altell.ru>
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
Subject: [PATCH 02/11] binutils: add binutils-x86_64_i386_biarch.patch
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
 .../binutils-x86_64_i386_biarch.patch              |   25 ++++++++++++++++++++
 recipes/binutils/binutils_2.18.bb                  |    2 +-
 2 files changed, 26 insertions(+), 1 deletions(-)
 create mode 100644 recipes/binutils/binutils-2.18/binutils-x86_64_i386_biarch.patch

diff --git a/recipes/binutils/binutils-2.18/binutils-x86_64_i386_biarch.patch b/recipes/binutils/binutils-2.18/binutils-x86_64_i386_biarch.patch
new file mode 100644
index 0000000..b79a76a
--- /dev/null
+++ b/recipes/binutils/binutils-2.18/binutils-x86_64_i386_biarch.patch
@@ -0,0 +1,25 @@
+#!/bin/sh -e
+## 127_x86_64_i386_biarch.dpatch
+##
+## DP: Description: Add (/usr)/lib32 to the search paths on x86_64.
+## DP: Author: Aurelien Jarno <aurel32.debian.org>
+## DP: Upstream status: Debian specific
+#
+# Hacked to apply with quilt
+
+--- binutils/ld/emulparams/elf_i386.sh
++++ binutils/ld/emulparams/elf_i386.sh
+@@ -12,3 +12,13 @@
+ GENERATE_PIE_SCRIPT=yes
+ NO_SMALL_DATA=yes
+ SEPARATE_GOTPLT=12
++
++# Linux modify the default library search path to first include
++# a 32-bit specific directory.
++case "$target" in
++  x86_64*-linux* | i[3-7]86*-linux* | x86_64*-kfreebsd*-gnu | i[3-7]86*-kfreebsd*-gnu)
++    case "$EMULATION_NAME" in
++      *i386*) LIBPATH_SUFFIX=32 ;;
++    esac
++    ;;
++esac
diff --git a/recipes/binutils/binutils_2.18.bb b/recipes/binutils/binutils_2.18.bb
index 9367196..562c8ba 100644
--- a/recipes/binutils/binutils_2.18.bb
+++ b/recipes/binutils/binutils_2.18.bb
@@ -12,8 +12,8 @@ SRC_URI = "\
      file://binutils-uclibc-300-006_better_file_error.patch;patch=1 \
      file://binutils-uclibc-300-012_check_ldrunpath_length.patch;patch=1 \
      file://binutils-uclibc-gas-needs-libm.patch;patch=1 \
+     file://binutils-x86_64_i386_biarch.patch;patch=1 \
      "
 
 # powerpc patches
 SRC_URI += "file://binutils-2.16.1-e300c2c3.patch;patch=1"
-
-- 
1.6.2.1


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



