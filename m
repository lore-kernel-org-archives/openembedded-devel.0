Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9A00A7E099
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 11:55:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 450pYg5MSlzJB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 13:55:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557489319;
	bh=5/urxqvcZU0Q8T6CLLAULOsVGq6gn4kAFWnGocVziVo=;
	h=From:To:Subject:Date:From;
	b=V8lnajkeMlXh7JM5RRbNtLAhC+UPDvaJneW+w10Js944lhsd/9w4mzv/8LJ9eeo8r
	vQQhyCq/gD6/RsG8i15/QxOZDDzoMAUqDwQt5GNlQIeZnN0ntsCrWsdHpUbhMGCIR/
	+l2gDtxGh/+HYkMk4Q47DPLf/PshLMnDvUfabib2gCPu2csHXvzkxAIsdnw3pxVgVQ
	W0LMbasjG9la7CGeaCynqY+j4GTnxGGF2Dp34XvQPgx7aQSR0lSu9SPR4ZSLilLSCJ
	VgOEQ5rH8k12JSQkeg1TnGJor8qxBOlwdZjQ0ilZGLRyTZKoDSsc6901BEviouxh6n
	aw8I2qg4Y0QvqpwyIXDWBvpVBYMmjN3ZiziHRmYqdUmnR4kaBZVxsoQbTlnw+CzAxH
	mzZ13GE0FT/vLGl4NV3vRgMEOlgB7JXdVwZAELRcPfBEXPGeEQ/kJ94+5KZjwxWE3S
	r/0NBp+FHFoFdG81Lh2pqx6E4IeUfrui/pURjZ+iSbl+nwVaFA8mDHEEQoUZmCS5Ux
	N7lepM7+vkHIfJGbXqGb4Um7RjFFiFP/Pkrz0ap9N9uP2mRU6jzX/M3BhBP/c1jF08
	RQm6j5rRd4Lic80c+Oydhxm2naOFiv1eOgHO7j3+sns4O0rQYzn4qRyV5hMPUwGd8K
	JgRtb/+NfGe0fOBIbVKHA39c=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2019 14:55:07 +0300
Message-Id: <20190510115515.19491-11-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] augeas: Upgrade 1.11.0 -> 1.12.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 May 2019 11:55:19 -0000

Remove patches for issues fixed upstream.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-support/augeas/augeas.inc     |  2 --
 ...charset_alias-when-building-for-musl.patch | 31 -------------------
 .../augeas/add-missing-argz-conditional.patch | 27 ----------------
 .../recipes-support/augeas/augeas_1.11.0.bb   |  4 ---
 .../recipes-support/augeas/augeas_1.12.0.bb   |  4 +++
 5 files changed, 4 insertions(+), 64 deletions(-)
 delete mode 100644 meta-oe/recipes-support/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch
 delete mode 100644 meta-oe/recipes-support/augeas/augeas/add-missing-argz-conditional.patch
 delete mode 100644 meta-oe/recipes-support/augeas/augeas_1.11.0.bb
 create mode 100644 meta-oe/recipes-support/augeas/augeas_1.12.0.bb

diff --git a/meta-oe/recipes-support/augeas/augeas.inc b/meta-oe/recipes-support/augeas/augeas.inc
index c939d4b89..1bbd181c3 100644
--- a/meta-oe/recipes-support/augeas/augeas.inc
+++ b/meta-oe/recipes-support/augeas/augeas.inc
@@ -6,9 +6,7 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbb461211a33b134d42ed5ee802b37ff"
 
 SRC_URI = "http://download.augeas.net/${BP}.tar.gz \
-           file://add-missing-argz-conditional.patch \
            file://sepbuildfix.patch \
-           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
           "
 
 DEPENDS = "readline libxml2"
diff --git a/meta-oe/recipes-support/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta-oe/recipes-support/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch
deleted file mode 100644
index 0ba7c76a3..000000000
--- a/meta-oe/recipes-support/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 32b15332e2130a54b25f4fbf6f58b407b851dd8f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Apr 2015 17:02:13 -0700
-Subject: [PATCH] Unset need_charset_alias when building for musl
-
-localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
-which actually shoudl be fixed in gnulib and then all downstream
-projects will get it eventually. For now we apply the fix to
-coreutils
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- gnulib/lib/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gnulib/lib/Makefile.am b/gnulib/lib/Makefile.am
-index 963b22d..75788d2 100644
---- a/gnulib/lib/Makefile.am
-+++ b/gnulib/lib/Makefile.am
-@@ -463,7 +463,7 @@ install-exec-localcharset: all-local
- 	  case '$(host_os)' in \
- 	    darwin[56]*) \
- 	      need_charset_alias=true ;; \
--	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
-+	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
- 	      need_charset_alias=false ;; \
- 	    *) \
- 	      need_charset_alias=true ;; \
diff --git a/meta-oe/recipes-support/augeas/augeas/add-missing-argz-conditional.patch b/meta-oe/recipes-support/augeas/augeas/add-missing-argz-conditional.patch
deleted file mode 100644
index 368bb4176..000000000
--- a/meta-oe/recipes-support/augeas/augeas/add-missing-argz-conditional.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 9a6e6374da7d7056db0950f0f7d6b8b905009775 Mon Sep 17 00:00:00 2001
-From: Constantin Musca <constantinx.musca@intel.com>
-Date: Fri, 15 Jul 2016 10:04:48 +0300
-Subject: [PATCH] Add missing GL_GENERATE_ARGZ_H conditional
-
-- GL_GENERATE_ARGZ_H is used in gnulib/lib/Makefile.am
-
-Upstream-Status: Pending
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
-
----
- configure.ac | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 72b6984..fb9653e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -55,6 +55,8 @@ AC_ARG_WITH([failmalloc],
- 
- AM_CONDITIONAL([WITH_FAILMALLOC], [test x$with_failmalloc != xno])
- 
-+AM_CONDITIONAL([GL_GENERATE_ARGZ_H], [test -n "$ARGZ_H"])
-+
- dnl --enable-debug=(yes|no)
- AC_ARG_ENABLE([debug],
-               [AC_HELP_STRING([--enable-debug=no/yes],
diff --git a/meta-oe/recipes-support/augeas/augeas_1.11.0.bb b/meta-oe/recipes-support/augeas/augeas_1.11.0.bb
deleted file mode 100644
index cdd11beec..000000000
--- a/meta-oe/recipes-support/augeas/augeas_1.11.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require augeas.inc
-
-SRC_URI[md5sum] = "abf51f4c0cf3901d167f23687f60434a"
-SRC_URI[sha256sum] = "393ce8f4055af89cd4c20bf903eacbbd909cf427891f41b56dc2ba66243ea0b0"
diff --git a/meta-oe/recipes-support/augeas/augeas_1.12.0.bb b/meta-oe/recipes-support/augeas/augeas_1.12.0.bb
new file mode 100644
index 000000000..d32c4691d
--- /dev/null
+++ b/meta-oe/recipes-support/augeas/augeas_1.12.0.bb
@@ -0,0 +1,4 @@
+require augeas.inc
+
+SRC_URI[md5sum] = "74f1c7b8550f4e728486091f6b907175"
+SRC_URI[sha256sum] = "321942c9cc32185e2e9cb72d0a70eea106635b50269075aca6714e3ec282cb87"
-- 
2.17.1


