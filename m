Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5B1E565E04
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Apr 2014 10:16:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3IAGg5f016835
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Apr 2014 03:16:42 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 18 Apr 2014 03:16:41 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Apr 2014 18:16:32 +0800
Message-ID: <fcf0027b255a0441d42df0e9f2584067c3ec3d74.1397816030.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1397816030.git.Chong.Lu@windriver.com>
References: <cover.1397816030.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] vim: add knob whether elf.h are checked
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
X-List-Received-Date: Fri, 18 Apr 2014 10:16:42 -0000
Content-Type: text/plain

Previously, it still was checked when there was no elf library in sysroots directory.
Add knob to decide whether elf.h are checked or not.

Fixed by using PACKAGECONFIG to check elf, with default disabled set.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../vim-add-knob-whether-elf.h-are-checked.patch   | 38 ++++++++++++++++++++++
 meta-oe/recipes-support/vim/vim_7.4.258.bb         |  2 ++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch

diff --git a/meta-oe/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch b/meta-oe/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
new file mode 100644
index 0000000..693d130
--- /dev/null
+++ b/meta-oe/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
@@ -0,0 +1,38 @@
+vim: add knob whether elf.h are checked
+
+Previously, it still was checked when there was no elf library in sysroots directory.
+Add knob to decide whether elf.h are checked or not.
+
+Upstream-status: Pending
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ src/configure.in |    7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/configure.in b/src/configure.in
+index d734064..f504fa6 100644
+--- a/src/configure.in
++++ b/src/configure.in
+@@ -2483,11 +2483,18 @@ AC_TRY_COMPILE([#include <stdio.h>], [int x __attribute__((unused));],
+ 	AC_MSG_RESULT(no))
+ 
+ dnl Checks for header files.
++AC_MSG_CHECKING(whether or not to look for elf.h)
++AC_ARG_ENABLE(elf-check,
++        [  --enable-elf-check      If elfutils, check for elf.h [default=no]],
++        , enable_elf_check="no")
++AC_MSG_RESULT($enable_elf_check)
++if test "x$enable_elf_check" != "xno"; then
+ AC_CHECK_HEADER(elf.h, HAS_ELF=1)
+ dnl AC_CHECK_HEADER(dwarf.h, SVR4=1)
+ if test "$HAS_ELF" = 1; then
+   AC_CHECK_LIB(elf, main)
+ fi
++fi
+ 
+ AC_HEADER_DIRENT
+ 
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-support/vim/vim_7.4.258.bb b/meta-oe/recipes-support/vim/vim_7.4.258.bb
index 9c6e231..19c8abc 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.258.bb
+++ b/meta-oe/recipes-support/vim/vim_7.4.258.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=b779e18be6ed77facc77069
 
 SRC_URI = "hg://vim.googlecode.com/hg/;protocol=https;module=vim \
            file://disable_acl_header_check.patch;patchdir=.. \
+           file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
 "
 SRCREV = "v7-4-258"
 
@@ -38,6 +39,7 @@ PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
 PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
 PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
+PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
 
 EXTRA_OECONF = " \
     --disable-gpm \
-- 
1.8.1.2


