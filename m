Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 57A4565E00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Apr 2014 10:16:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3IAGeZb005431
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Apr 2014 03:16:40 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 18 Apr 2014 03:16:38 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Apr 2014 18:16:31 +0800
Message-ID: <236ce9a35ef7ce2ee919d2867c60269e9577e96d.1397816030.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1397816030.git.Chong.Lu@windriver.com>
References: <cover.1397816030.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] vim: don't check acl header if acl support disabled
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
X-List-Received-Date: Fri, 18 Apr 2014 10:16:41 -0000
Content-Type: text/plain

Vim/vim-tiny always check 'sys/acl.h' existence even acl support
has been disabled from configure line. This works in mostly time
but except for acl works in an odd mode - while acl was mirrored
from sstate_cache, it will install 'sys/acl.h' to sysroot dir and
and then clean the header file with sysroot_cleansstate().

If build vim/vim-tiny and acl in parallel, below errors will occur:

* os_unix.c:2668:23: fatal error: sys/acl.h: No such file or directory

This change only workaround the failure and get build running, we
still need to fix it from acl side.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../vim/files/disable_acl_header_check.patch       | 27 ++++++++++++++++++++++
 meta-oe/recipes-support/vim/vim_7.4.258.bb         |  4 +++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/vim/files/disable_acl_header_check.patch

diff --git a/meta-oe/recipes-support/vim/files/disable_acl_header_check.patch b/meta-oe/recipes-support/vim/files/disable_acl_header_check.patch
new file mode 100644
index 0000000..8f824e7
--- /dev/null
+++ b/meta-oe/recipes-support/vim/files/disable_acl_header_check.patch
@@ -0,0 +1,27 @@
+Upstream-Status: pending
+
+Don't check 'sys/acl.h' if acl support disabled for vim/vim-tiny.
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+================================================
+diff --git a/src/configure.in b/src/configure.in
+index fb965e5..d734064 100644
+--- a/src/configure.in
++++ b/src/configure.in
+@@ -2511,7 +2511,7 @@ AC_CHECK_HEADERS(stdarg.h stdint.h stdlib.h string.h \
+ 	sys/systeminfo.h locale.h sys/stream.h termios.h \
+ 	libc.h sys/statfs.h poll.h sys/poll.h pwd.h \
+ 	utime.h sys/param.h libintl.h libgen.h \
+-	util/debug.h util/msg18n.h frame.h sys/acl.h \
++	util/debug.h util/msg18n.h frame.h \
+ 	sys/access.h sys/sysinfo.h wchar.h wctype.h)
+ 
+ dnl sys/ptem.h depends on sys/stream.h on Solaris
+@@ -3112,6 +3112,7 @@ AC_ARG_ENABLE(acl,
+ 	, [enable_acl="yes"])
+ if test "$enable_acl" = "yes"; then
+ AC_MSG_RESULT(no)
++AC_CHECK_HEADERS(sys/acl.h)
+ AC_CHECK_LIB(posix1e, acl_get_file, [LIBS="$LIBS -lposix1e"],
+ 	AC_CHECK_LIB(acl, acl_get_file, [LIBS="$LIBS -lacl"
+ 		  AC_CHECK_LIB(attr, fgetxattr, LIBS="$LIBS -lattr",,)],,),)
diff --git a/meta-oe/recipes-support/vim/vim_7.4.258.bb b/meta-oe/recipes-support/vim/vim_7.4.258.bb
index 023e8fc..9c6e231 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.258.bb
+++ b/meta-oe/recipes-support/vim/vim_7.4.258.bb
@@ -6,7 +6,9 @@ RSUGGESTS_${PN} = "diffutils"
 LICENSE = "vim"
 LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=b779e18be6ed77facc770691c967b8f8"
 
-SRC_URI = "hg://vim.googlecode.com/hg/;protocol=https;module=vim"
+SRC_URI = "hg://vim.googlecode.com/hg/;protocol=https;module=vim \
+           file://disable_acl_header_check.patch;patchdir=.. \
+"
 SRCREV = "v7-4-258"
 
 S = "${WORKDIR}/${PN}/src"
-- 
1.8.1.2


