Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.6163.1616056127195616554
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Mar 2021 01:28:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oAPSrzcq;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id c204so2970264pfc.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Mar 2021 01:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bikQhufmeMRLLkZWFGK/yAEBW6WVvk+2D23udY2XrEE=;
        b=oAPSrzcqRK6yUL6sBS6owh79JRwb0tj691582o3ltJhI6mubp3WX/9I8MrQk4xZZdY
         lbFRMzSkF+SbMTyg2KKCkLRSpC8yK1ftiLdUym/GqbSz6CZ5bRG8oBNoNkmeh0NFjLh0
         iYzXhhBUfWn0fGgIzRKRUXiFnXc1A7JqVaYYyhIvkeLju0YWNCmDzwlqBwQ6qDBnRgI/
         fzPXR5CIXhIUgxnf3rpbS5dUuRw39/b9oiZLzwYNMIyeDlH92vem4e/+KqV7FUhol42D
         mtXN35SCsPfqTm2qYdFWa9rQpGVwIkNEfvEuCC6C3fcVaNnpqk8Obagnakw4SGzV/VwN
         c5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bikQhufmeMRLLkZWFGK/yAEBW6WVvk+2D23udY2XrEE=;
        b=jsGE7f0IcvnfyCrU/Q805c6yDCCJiovGhVkneh9kyPWUGsWDyuKaZ6mQvGyBsH8oE3
         9KAJTPOXuewiEd/KdHeTIKaUp6O7fInMOJ/3zdXWvzBXib8M1qP8JdJ8f+oyyV1gtjsB
         QANPIQ3lsyzB0jgsZuuEUc8mNeAxA+HfBPoWBecxkpFzRkX7NGC9ByPYOhxFyDvcidjU
         jV16+mPV+r+a1YC9m1i3gePB7U77BQnMzhuLGUWgBetGSVV1G4+XzfUGy7DQfvL8ZB5X
         wi3QcgZ8QNWBC7Pb2NT/YCnwa6zQv54PmEOT9mVIXjx2BiuP+cpKdl5CJXezsMKDl7nz
         /h6g==
X-Gm-Message-State: AOAM531fsX7Qa/aOxJvpSkWu4oOFJtZ67i/iYlHCYuK1q6RVv2oSr3Ex
	qtvn46wtiKpf/yfoWKY3c2et+PKScND0NQ==
X-Google-Smtp-Source: ABdhPJy28qwrPoAy6pA2WxAjhQfdwFxC2bOQlaAdJiQj7Vubihy5jnXIio3y4q8TuNPmS1e7vExtpQ==
X-Received: by 2002:a63:5044:: with SMTP id q4mr5920013pgl.178.1616056125141;
        Thu, 18 Mar 2021 01:28:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b117])
        by smtp.gmail.com with ESMTPSA id q205sm1668939pfc.126.2021.03.18.01.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 01:28:44 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] oprofile: Upgrade to 1.4.0 release
Date: Thu, 18 Mar 2021 01:28:41 -0700
Message-Id: <20210318082841.1782857-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop upstreamed patches
Backport musl fix and deterministic build patches from master

Release notes - https://oprofile.sourceforge.io/release-notes/oprofile-1.4.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../oprofile/0001-Fix-build-with-musl.patch   | 55 +++++++++++++
 .../0001-Use-new-bfd-APIs-from-2.34.patch     | 79 -------------------
 ...ix-configure-when-bin-sh-is-not-bash.patch | 40 ++++++++++
 ...processor-variable-to-improve-reprod.patch | 30 +++++++
 ...UILD_DATE-to-improve-reproducibility.patch | 63 +++++++++++++++
 ...b-definition-for-NIOS2-architecture.patch} | 11 +--
 ...ce-sym_iterator-0-with-sym_iterator.patch} |  8 +-
 ...-want-GNU-levels-of-automake-strictn.patch | 23 ++++++
 ...include-linux-limits.h-for-MAX_INPUT.patch | 30 +++++++
 ...heck-tests-on-host-if-cross-compili.patch} | 31 ++++++--
 ...e-the-root-home-directory-dynamical.patch} | 44 ++++++-----
 .../oprofile/oprofile/automake-foreign.patch  | 12 ---
 .../oprofile/oprofile/include_limits.patch    | 17 ----
 .../oprofile/oprofile/musl.patch              | 46 -----------
 .../recipes-kernel/oprofile/oprofile_1.3.0.bb | 13 ---
 .../{oprofile.inc => oprofile_1.4.0.bb}       | 36 +++++----
 16 files changed, 319 insertions(+), 219 deletions(-)
 create mode 100644 meta-oe/recipes-kernel/oprofile/oprofile/0001-Fix-build-with-musl.patch
 delete mode 100644 meta-oe/recipes-kernel/oprofile/oprofile/0001-Use-new-bfd-APIs-from-2.34.patch
 create mode 100644 meta-oe/recipes-kernel/oprofile/oprofile/0002-Fix-configure-when-bin-sh-is-not-bash.patch
 create mode 100644 meta-oe/recipes-kernel/oprofile/oprofile/0003-Define-the-C-preprocessor-variable-to-improve-reprod.patch
 create mode 100644 meta-oe/recipes-kernel/oprofile/oprofile/0004-Use-BUILD_DATE-to-improve-reproducibility.patch
 rename meta-oe/recipes-kernel/oprofile/oprofile/{0001-Add-rmb-definition-for-NIOS2-architecture.patch => 0005-Add-rmb-definition-for-NIOS2-architecture.patch} (71%)
 rename meta-oe/recipes-kernel/oprofile/oprofile/{0001-replace-sym_iterator-0-with-sym_iterator.patch => 0006-replace-sym_iterator-0-with-sym_iterator.patch} (96%)
 create mode 100644 meta-oe/recipes-kernel/oprofile/oprofile/0007-oprofile-doesn-t-want-GNU-levels-of-automake-strictn.patch
 create mode 100644 meta-oe/recipes-kernel/oprofile/oprofile/0008-include-linux-limits.h-for-MAX_INPUT.patch
 rename meta-oe/recipes-kernel/oprofile/oprofile/{oprofile-cross-compile-tests.patch => 0009-Prevent-running-check-tests-on-host-if-cross-compili.patch} (79%)
 rename meta-oe/recipes-kernel/oprofile/oprofile/{root-home-dir.patch => 0010-oprofile-Determine-the-root-home-directory-dynamical.patch} (76%)
 delete mode 100644 meta-oe/recipes-kernel/oprofile/oprofile/automake-foreign.patch
 delete mode 100644 meta-oe/recipes-kernel/oprofile/oprofile/include_limits.patch
 delete mode 100644 meta-oe/recipes-kernel/oprofile/oprofile/musl.patch
 delete mode 100644 meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
 rename meta-oe/recipes-kernel/oprofile/{oprofile.inc => oprofile_1.4.0.bb} (67%)

diff --git a/meta-oe/recipes-kernel/oprofile/oprofile/0001-Fix-build-with-musl.patch b/meta-oe/recipes-kernel/oprofile/oprofile/0001-Fix-build-with-musl.patch
new file mode 100644
index 0000000000..61191220e2
--- /dev/null
+++ b/meta-oe/recipes-kernel/oprofile/oprofile/0001-Fix-build-with-musl.patch
@@ -0,0 +1,55 @@
+From 5ed9bda8baf7465172a99ff86ed7f46397b06c7f Mon Sep 17 00:00:00 2001
+From: Andrew Savchenko <bircoph@gmail.com>
+Date: Sat, 5 Sep 2020 14:41:30 +0300
+Subject: [PATCH 01/10] Fix build with musl
+
+--Signature=_Sat__5_Sep_2020_14_41_30_+0300_B.qpPPwu83bbA.32
+Content-Type: text/plain; charset=US-ASCII
+Content-Disposition: inline
+Content-Transfer-Encoding: quoted-printable
+
+When musl is used instead of glibc, oprofile build fails because it
+uses glibc-specific FTW extension: FTW_ACTIONRETVAL for custom
+__delete_old_previous_sample_data return codes and FTW_STOP,
+FTW_CONTINUE for such return codes. Musl supports only POSIX ftw, so
+build fails.
+
+However, this extension is not really needed by oprofile, because
+FTW_SKIP_* are not used and {FTW_STOP,FTW_CONTINUE} can be handled
+by standard return codes {1,0} (more precisely standard defines
+{!0,0}, but in glibc FTW_STOP = 1, so I keep this value).
+
+Upstream-Status: Backport [https://sourceforge.net/p/oprofile/oprofile/ci/5ed9bda8baf7465172a99ff86ed7f46397b06c7f/]
+Signed-off-by: Andrew Savchenko <bircoph@gmail.com>
+---
+ pe_profiling/operf.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/pe_profiling/operf.cpp b/pe_profiling/operf.cpp
+index 06a0ea3c..00834409 100644
+--- a/pe_profiling/operf.cpp
++++ b/pe_profiling/operf.cpp
+@@ -860,9 +860,9 @@ static int __delete_old_previous_sample_data(const char *fpath,
+ {
+ 	if (remove(fpath)) {
+ 		perror("sample data removal error");
+-		return FTW_STOP;
++		return 1;
+ 	} else {
+-		return FTW_CONTINUE;
++		return 0;
+ 	}
+ }
+ 
+@@ -897,7 +897,7 @@ static void convert_sample_data(void)
+ 		return;
+ 
+ 	if (!operf_options::append) {
+-                int flags = FTW_DEPTH | FTW_ACTIONRETVAL;
++		int flags = FTW_DEPTH;
+ 		errno = 0;
+ 		if (nftw(previous_sampledir.c_str(), __delete_old_previous_sample_data, 32, flags) !=0 &&
+ 				errno != ENOENT) {
+-- 
+2.31.0
+
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile/0001-Use-new-bfd-APIs-from-2.34.patch b/meta-oe/recipes-kernel/oprofile/oprofile/0001-Use-new-bfd-APIs-from-2.34.patch
deleted file mode 100644
index faf56d1168..0000000000
--- a/meta-oe/recipes-kernel/oprofile/oprofile/0001-Use-new-bfd-APIs-from-2.34.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 34745fb066a266ae6bbb15d08466d4d2cb6a2110 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 20 Feb 2020 08:11:04 -0800
-Subject: [PATCH] Use new bfd APIs from 2.34+
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libutil++/bfd_support.cpp | 10 +++++-----
- opjitconv/create_bfd.c    |  6 +++---
- 2 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/libutil++/bfd_support.cpp b/libutil++/bfd_support.cpp
-index fa904839..e53a1530 100644
---- a/libutil++/bfd_support.cpp
-+++ b/libutil++/bfd_support.cpp
-@@ -137,7 +137,7 @@ static bool get_build_id(bfd * ibfd, unsigned char * build_id)
- 		}
- 	}
- 
--	bfd_size_type buildid_sect_size = bfd_section_size(ibfd, sect);
-+	bfd_size_type buildid_sect_size = bfd_section_size(sect);
- 	char * contents = (char *) xmalloc(buildid_sect_size);
- 	errno = 0;
- 	if (!bfd_get_section_contents(ibfd, sect,
-@@ -188,7 +188,7 @@ bool get_debug_link_info(bfd * ibfd, string & filename, unsigned long & crc32)
- 	if (sect == NULL)
- 		return false;
- 	
--	bfd_size_type debuglink_size = bfd_section_size(ibfd, sect);  
-+	bfd_size_type debuglink_size = bfd_section_size(sect);  
- 	char * contents = (char *) xmalloc(debuglink_size);
- 	cverb << vbfd
- 	      << ".gnu_debuglink section has size " << debuglink_size << endl;
-@@ -346,7 +346,7 @@ void fixup_linenr(bfd * abfd, asection * section, asymbol ** syms,
- 	// first restrict the search on a sensible range of vma, 16 is
- 	// an intuitive value based on epilog code look
- 	size_t max_search = 16;
--	size_t section_size = bfd_section_size(abfd, section);
-+	size_t section_size = bfd_section_size(section);
- 	if (pc + max_search > section_size)
- 		max_search = section_size - pc;
- 
-@@ -819,10 +819,10 @@ find_nearest_line(bfd_info const & b, op_bfd_symbol const & sym,
- 	else
- 		pc = (sym.value() + offset) - sym.filepos();
- 
--	if ((bfd_get_section_flags(abfd, section) & SEC_ALLOC) == 0)
-+	if ((bfd_section_flags(section) & SEC_ALLOC) == 0)
- 		goto fail;
- 
--	if (pc >= bfd_section_size(abfd, section))
-+	if (pc >= bfd_section_size(section))
- 		goto fail;
- 
- 	ret = bfd_find_nearest_line(abfd, section, syms, pc, &cfilename,
-diff --git a/opjitconv/create_bfd.c b/opjitconv/create_bfd.c
-index 48db143b..5c0e9152 100644
---- a/opjitconv/create_bfd.c
-+++ b/opjitconv/create_bfd.c
-@@ -86,12 +86,12 @@ asection * create_section(bfd * abfd, char const * section_name,
- 		bfd_perror("bfd_make_section");
- 		goto error;
- 	}
--	bfd_set_section_vma(abfd, section, vma);
--	if (bfd_set_section_size(abfd, section, size) == FALSE) {
-+	bfd_set_section_vma(section, vma);
-+	if (bfd_set_section_size(section, size) == FALSE) {
- 		bfd_perror("bfd_set_section_size");
- 		goto error;
- 	}
--	if (bfd_set_section_flags(abfd, section, flags) == FALSE) {
-+	if (bfd_set_section_flags(section, flags) == FALSE) {
- 		bfd_perror("bfd_set_section_flags");
- 		goto error;
- 	}
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile/0002-Fix-configure-when-bin-sh-is-not-bash.patch b/meta-oe/recipes-kernel/oprofile/oprofile/0002-Fix-configure-when-bin-sh-is-not-bash.patch
new file mode 100644
index 0000000000..2ffdc8ae53
--- /dev/null
+++ b/meta-oe/recipes-kernel/oprofile/oprofile/0002-Fix-configure-when-bin-sh-is-not-bash.patch
@@ -0,0 +1,40 @@
+From 91bedd280b8a3fb4665db627559abba960be4212 Mon Sep 17 00:00:00 2001
+From: Andrew Savchenko <bircoph@gmail.com>
+Date: Sat, 5 Sep 2020 14:40:07 +0300
+Subject: [PATCH 02/10] Fix configure when /bin/sh is not bash
+
+--Signature=_Sat__5_Sep_2020_14_40_08_+0300_w+XY/NnD8_G.Kd1s
+Content-Type: text/plain; charset=US-ASCII
+Content-Disposition: inline
+Content-Transfer-Encoding: quoted-printable
+
+When /bin/sh used by autoconf is not bash, e.g. dash, configure
+fails because it uses bash-specific equality operator "==".
+
+Fix this problem by replacing "==" with POSIX "=" which is
+sufficient for test where it is being used.
+
+Upstream-Status: Backport [https://sourceforge.net/p/oprofile/oprofile/ci/91bedd280b8a3fb4665db627559abba960be4212/]
+Signed-off-by: Andrew Savchenko <bircoph@gmail.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 05609f6e..f5fcd17d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -466,8 +466,8 @@ AX_COPY_IF_CHANGE(doc/xsl/catalog-1.xml, doc/xsl/catalog.xml)
+ 
+ if ! test "x$enable_account_check" = "xyes"; then
+ 	:
+-elif test "`getent passwd oprofile 2>/dev/null`" == "" || \
+-     test "`getent group oprofile 2>/dev/null`" == ""; then
++elif test "`getent passwd oprofile 2>/dev/null`" = "" || \
++     test "`getent group oprofile 2>/dev/null`" = ""; then
+ 	if test `id -u` != "0"; then
+ 		echo "Warning: The user account 'oprofile:oprofile' does not exist on the system."
+ 		echo "         To profile JITed code, this special user account must exist."
+-- 
+2.31.0
+
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile/0003-Define-the-C-preprocessor-variable-to-improve-reprod.patch b/meta-oe/recipes-kernel/oprofile/oprofile/0003-Define-the-C-preprocessor-variable-to-improve-reprod.patch
new file mode 100644
index 0000000000..923c39ae1b
--- /dev/null
+++ b/meta-oe/recipes-kernel/oprofile/oprofile/0003-Define-the-C-preprocessor-variable-to-improve-reprod.patch
@@ -0,0 +1,30 @@
+From 864e02eab12cdc523b2dcd3f7b87a27abc16eefc Mon Sep 17 00:00:00 2001
+From: Viktor Kleinik <vkleinik@cisco.com>
+Date: Sun, 7 Mar 2021 17:07:44 +0000
+Subject: [PATCH 03/10] Define the C preprocessor variable to improve reproducibility
+
+Define the C preprocessor variable BUILD_DATE, which can be used
+as source for reproducible build date in case when
+SOURCE_DATE_EPOCH environment variable is set.
+
+Upstream-Status: Backport [https://sourceforge.net/p/oprofile/oprofile/ci/864e02eab12cdc523b2dcd3f7b87a27abc16eefc/]
+Signed-off-by: Viktor Kleinik <vkleinik@cisco.com>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index f5fcd17d..dc447f89 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -31,6 +31,7 @@ if test -n "$SOURCE_DATE_EPOCH" ; then
+ fi
+ dnl for the man page
+ DATE="`date $dateopt '+%a %d %B %Y'`"
++AC_DEFINE_UNQUOTED([BUILD_DATE], ["$DATE"], [Use reproducible build date])
+ AC_SUBST(DATE)
+ 
+ # Since we should not permanently alter user environment variables, we'll
+-- 
+2.31.0
+
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile/0004-Use-BUILD_DATE-to-improve-reproducibility.patch b/meta-oe/recipes-kernel/oprofile/oprofile/0004-Use-BUILD_DATE-to-improve-reproducibility.patch
new file mode 100644
index 0000000000..0fcca2b689
--- /dev/null
+++ b/meta-oe/recipes-kernel/oprofile/oprofile/0004-Use-BUILD_DATE-to-improve-reproducibility.patch
@@ -0,0 +1,63 @@
+From 7bef5b905abe36adfd4e4cc16bc830376f50e8f6 Mon Sep 17 00:00:00 2001
+From: Viktor Kleinik <vkleinik@cisco.com>
+Date: Sun, 7 Mar 2021 17:22:26 +0000
+Subject: [PATCH 04/10] Use BUILD_DATE to improve reproducibility
+
+The C preprocessor variable BUILD_DATE contains the actual
+build date or some reproducible value. It depends on whether
+SOURCE_DATE_EPOCH environment variable was set previously or not.
+In this way, reproducibility can be improved when needed.
+
+Upstream-Status: Backport [https://sourceforge.net/p/oprofile/oprofile/ci/864e02eab12cdc523b2dcd3f7b87a27abc16eefc/]
+Signed-off-by: Viktor Kleinik <vkleinik@cisco.com>
+---
+ libutil/op_version.c   | 2 +-
+ pe_counting/ocount.cpp | 4 ++--
+ pe_profiling/operf.cpp | 4 ++--
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/libutil/op_version.c b/libutil/op_version.c
+index 99a844e4..a257e9c4 100644
+--- a/libutil/op_version.c
++++ b/libutil/op_version.c
+@@ -19,6 +19,6 @@ void show_version(char const * app_name)
+ {
+ 	/* Do not change the version format: it is documented in html doc */
+ 	printf("%s: " PACKAGE " " VERSION " compiled on "
+-	       __DATE__ " " __TIME__ "\n", app_name);
++	       BUILD_DATE "\n", app_name);
+ 	exit(EXIT_SUCCESS);
+ }
+diff --git a/pe_counting/ocount.cpp b/pe_counting/ocount.cpp
+index 2470745d..ae89fe61 100644
+--- a/pe_counting/ocount.cpp
++++ b/pe_counting/ocount.cpp
+@@ -660,8 +660,8 @@ static int _process_ocount_and_app_args(int argc, char * const argv[])
+ 			__print_usage_and_exit(NULL);
+ 			break;
+ 		case 'v':
+-			cout << argv[0] << ": " << PACKAGE << " " << VERSION << " compiled on " << __DATE__
+-			     << " " << __TIME__ << endl;
++			cout << argv[0] << ": " << PACKAGE << " " << VERSION << " compiled on "
++			     << BUILD_DATE << endl;
+ 			exit(EXIT_SUCCESS);
+ 			break;
+ 		default:
+diff --git a/pe_profiling/operf.cpp b/pe_profiling/operf.cpp
+index 00834409..f0f9c209 100644
+--- a/pe_profiling/operf.cpp
++++ b/pe_profiling/operf.cpp
+@@ -1342,8 +1342,8 @@ static int _process_operf_and_app_args(int argc, char * const argv[])
+ 			__print_usage_and_exit(NULL);
+ 			break;
+ 		case 'v':
+-			cout << argv[0] << ": " << PACKAGE << " " << VERSION << " compiled on " << __DATE__
+-			     << " " << __TIME__ << endl;
++			cout << argv[0] << ": " << PACKAGE << " " << VERSION << " compiled on "
++			     << BUILD_DATE << endl;
+ 			exit(EXIT_SUCCESS);
+ 			break;
+ 		default:
+-- 
+2.31.0
+
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile/0001-Add-rmb-definition-for-NIOS2-architecture.patch b/meta-oe/recipes-kernel/oprofile/oprofile/0005-Add-rmb-definition-for-NIOS2-architecture.patch
similarity index 71%
rename from meta-oe/recipes-kernel/oprofile/oprofile/0001-Add-rmb-definition-for-NIOS2-architecture.patch
rename to meta-oe/recipes-kernel/oprofile/oprofile/0005-Add-rmb-definition-for-NIOS2-architecture.patch
index ae8562a231..0fd850ff20 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile/0001-Add-rmb-definition-for-NIOS2-architecture.patch
+++ b/meta-oe/recipes-kernel/oprofile/oprofile/0005-Add-rmb-definition-for-NIOS2-architecture.patch
@@ -1,19 +1,20 @@
-From 34b0d9b1a32fb404a30327a7ae8931c7c75583bf Mon Sep 17 00:00:00 2001
+From 3539d2ab392d3a3eecffeddac989016063b23713 Mon Sep 17 00:00:00 2001
 From: Marek Vasut <marex@denx.de>
 Date: Tue, 9 Feb 2016 02:00:29 +0100
-Subject: [PATCH] Add rmb() definition for NIOS2 architecture
+Subject: [PATCH 05/10] Add rmb() definition for NIOS2 architecture
 
 Signed-off-by: Marek Vasut <marex@denx.de>
 Upstream-Status: Submitted [ http://marc.info/?l=oprofile-list&m=145501915931874&w=2 ]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  libperf_events/operf_utils.h | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/libperf_events/operf_utils.h b/libperf_events/operf_utils.h
-index 32954cc..8270e53 100644
+index 8afdbc22..8e17213e 100644
 --- a/libperf_events/operf_utils.h
 +++ b/libperf_events/operf_utils.h
-@@ -178,6 +178,11 @@ void op_release_resources(void);
+@@ -173,6 +173,11 @@ void op_release_resources(void);
  #define cpu_relax()	asm volatile("" ::: "memory")
  #endif
  
@@ -26,5 +27,5 @@ index 32954cc..8270e53 100644
  #include <asm/unistd.h>
  #define rmb()		__insn_mf()
 -- 
-2.7.0
+2.31.0
 
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile/0001-replace-sym_iterator-0-with-sym_iterator.patch b/meta-oe/recipes-kernel/oprofile/oprofile/0006-replace-sym_iterator-0-with-sym_iterator.patch
similarity index 96%
rename from meta-oe/recipes-kernel/oprofile/oprofile/0001-replace-sym_iterator-0-with-sym_iterator.patch
rename to meta-oe/recipes-kernel/oprofile/oprofile/0006-replace-sym_iterator-0-with-sym_iterator.patch
index 5fd23f809a..a8371f0af1 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile/0001-replace-sym_iterator-0-with-sym_iterator.patch
+++ b/meta-oe/recipes-kernel/oprofile/oprofile/0006-replace-sym_iterator-0-with-sym_iterator.patch
@@ -1,7 +1,7 @@
-From b7c1a2e2b0f4657fe291324ca409224f3321c9ff Mon Sep 17 00:00:00 2001
+From b126134f68f4a5bd826141be68337ac15a7c2c04 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 12 Feb 2019 11:58:34 -0800
-Subject: [PATCH] replace (sym_iterator)0 with sym_iterator()
+Subject: [PATCH 06/10] replace (sym_iterator)0 with sym_iterator()
 
 clang/libc++ find this error
 
@@ -20,7 +20,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 13 insertions(+), 13 deletions(-)
 
 diff --git a/libpp/xml_utils.cpp b/libpp/xml_utils.cpp
-index 3de41e5..f45d3ae 100644
+index 3de41e58..f45d3ae2 100644
 --- a/libpp/xml_utils.cpp
 +++ b/libpp/xml_utils.cpp
 @@ -73,7 +73,7 @@ void dump_symbol(string const & prefix, sym_iterator it, bool want_nl = true)
@@ -127,5 +127,5 @@ index 3de41e5..f45d3ae 100644
  		string module = get_image_name((*it)->image_name,
  			image_name_storage::int_filename, extra_found_images);
 -- 
-2.20.1
+2.31.0
 
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile/0007-oprofile-doesn-t-want-GNU-levels-of-automake-strictn.patch b/meta-oe/recipes-kernel/oprofile/oprofile/0007-oprofile-doesn-t-want-GNU-levels-of-automake-strictn.patch
new file mode 100644
index 0000000000..5f9ff1b962
--- /dev/null
+++ b/meta-oe/recipes-kernel/oprofile/oprofile/0007-oprofile-doesn-t-want-GNU-levels-of-automake-strictn.patch
@@ -0,0 +1,23 @@
+From fd35c343e67ca47f76d0769fce2881d5f7a027a9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 18 Mar 2021 00:48:34 -0700
+Subject: [PATCH 07/10] oprofile doesn't want GNU-levels of automake strictness
+ so tell it to be "foreign".
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -13,7 +13,7 @@ AC_PREREQ(2.13)
+ 
+ AC_INIT([OProfile], [1.4.0])
+ AC_CONFIG_SRCDIR([libop/op_config.h])
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
+ AC_CONFIG_HEADERS(config.h)
+ 
+ AC_CHECK_DECLS([basename], [], [], [[#include <libgen.h>]])
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile/0008-include-linux-limits.h-for-MAX_INPUT.patch b/meta-oe/recipes-kernel/oprofile/oprofile/0008-include-linux-limits.h-for-MAX_INPUT.patch
new file mode 100644
index 0000000000..32e79a0a45
--- /dev/null
+++ b/meta-oe/recipes-kernel/oprofile/oprofile/0008-include-linux-limits.h-for-MAX_INPUT.patch
@@ -0,0 +1,30 @@
+From 33e945f31fee2d74a392eb79025c9477e12b590d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 18 Mar 2021 00:49:48 -0700
+Subject: [PATCH 08/10] include linux/limits.h for MAX_INPUT
+
+Fixes
+op_pe_utils.cpp:533:19: error: 'MAX_INPUT' was not declared in this scope
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libpe_utils/op_pe_utils.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libpe_utils/op_pe_utils.cpp b/libpe_utils/op_pe_utils.cpp
+index 1ca4ce3a..c5d16a56 100644
+--- a/libpe_utils/op_pe_utils.cpp
++++ b/libpe_utils/op_pe_utils.cpp
+@@ -11,6 +11,7 @@
+  *
+  */
+ 
++#include <linux/limits.h>
+ #include <linux/perf_event.h>
+ #include <dirent.h>
+ #include <stdio.h>
+-- 
+2.31.0
+
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile/oprofile-cross-compile-tests.patch b/meta-oe/recipes-kernel/oprofile/oprofile/0009-Prevent-running-check-tests-on-host-if-cross-compili.patch
similarity index 79%
rename from meta-oe/recipes-kernel/oprofile/oprofile/oprofile-cross-compile-tests.patch
rename to meta-oe/recipes-kernel/oprofile/oprofile/0009-Prevent-running-check-tests-on-host-if-cross-compili.patch
index aefa9548e1..e47882c9f3 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile/oprofile-cross-compile-tests.patch
+++ b/meta-oe/recipes-kernel/oprofile/oprofile/0009-Prevent-running-check-tests-on-host-if-cross-compili.patch
@@ -1,4 +1,7 @@
-Prevent running check tests on host if cross compiling
+From 3a942cfd7d2e92667313e189930f7d1733cf40d4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 18 Mar 2021 00:59:20 -0700
+Subject: [PATCH 09/10] Prevent running check tests on host if cross compiling
 
 This patch enables running the 'make check' tests on the target
 in a cross-compiled environment. If not cross-compiling, then 'make
@@ -18,12 +21,21 @@ from an expression based on the host path 'topdir'.
 Upstream-Status: Pending
 
 Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac                | 1 +
+ libdb/tests/Makefile.am     | 2 ++
+ libop/tests/Makefile.am     | 2 ++
+ libregex/tests/Makefile.am  | 2 ++
+ libutil++/tests/Makefile.am | 4 ++++
+ libutil/tests/Makefile.am   | 2 ++
+ 6 files changed, 13 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 41ece64..ce5a16f 100644
+index 520b18ed..108a84e4 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -392,6 +392,7 @@ AC_ARG_ENABLE(account-check,
+@@ -386,6 +386,7 @@ AC_ARG_ENABLE(account-check,
  	enable_account_check=$enableval, enable_account_check=yes)
  
  AM_CONDITIONAL(CHECK_ACCOUNT, test "x$enable_account_check" = "xyes")
@@ -32,7 +44,7 @@ index 41ece64..ce5a16f 100644
  AC_SUBST(OP_CFLAGS)
  AC_SUBST(OP_CXXFLAGS)
 diff --git a/libdb/tests/Makefile.am b/libdb/tests/Makefile.am
-index 8a69003..d820090 100644
+index 8a69003f..c933baf6 100644
 --- a/libdb/tests/Makefile.am
 +++ b/libdb/tests/Makefile.am
 @@ -13,4 +13,6 @@ check_PROGRAMS = db_test
@@ -43,7 +55,7 @@ index 8a69003..d820090 100644
  TESTS = ${check_PROGRAMS}
 +endif
 diff --git a/libop/tests/Makefile.am b/libop/tests/Makefile.am
-index 8a79eb5..6d417c4 100644
+index 8a79eb5d..6b90e997 100644
 --- a/libop/tests/Makefile.am
 +++ b/libop/tests/Makefile.am
 @@ -33,4 +33,6 @@ load_events_files_tests_LDADD = ${COMMON_LIBS}
@@ -54,7 +66,7 @@ index 8a79eb5..6d417c4 100644
  TESTS = ${check_PROGRAMS} utf8_checker.sh
 +endif
 diff --git a/libregex/tests/Makefile.am b/libregex/tests/Makefile.am
-index 6f19838..1d176f9 100644
+index 6f19838f..43e84946 100644
 --- a/libregex/tests/Makefile.am
 +++ b/libregex/tests/Makefile.am
 @@ -18,4 +18,6 @@ java_test_LDADD = \
@@ -65,7 +77,7 @@ index 6f19838..1d176f9 100644
  TESTS = ${check_PROGRAMS}
 +endif
 diff --git a/libutil++/tests/Makefile.am b/libutil++/tests/Makefile.am
-index 51af031..a01ea2d 100644
+index 51af0313..dd63fbe2 100644
 --- a/libutil++/tests/Makefile.am
 +++ b/libutil++/tests/Makefile.am
 @@ -1,7 +1,9 @@
@@ -86,7 +98,7 @@ index 51af031..a01ea2d 100644
  TESTS = ${check_PROGRAMS}
 +endif
 diff --git a/libutil/tests/Makefile.am b/libutil/tests/Makefile.am
-index dfcd6ec..e8831b5 100644
+index dfcd6eca..d8b51892 100644
 --- a/libutil/tests/Makefile.am
 +++ b/libutil/tests/Makefile.am
 @@ -12,4 +12,6 @@ file_tests_LDADD = ../libutil.a
@@ -96,3 +108,6 @@ index dfcd6ec..e8831b5 100644
 +if ! CROSS_COMPILE
  TESTS = ${check_PROGRAMS}
 +endif
+-- 
+2.31.0
+
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile/root-home-dir.patch b/meta-oe/recipes-kernel/oprofile/oprofile/0010-oprofile-Determine-the-root-home-directory-dynamical.patch
similarity index 76%
rename from meta-oe/recipes-kernel/oprofile/oprofile/root-home-dir.patch
rename to meta-oe/recipes-kernel/oprofile/oprofile/0010-oprofile-Determine-the-root-home-directory-dynamical.patch
index 3eaf6a794a..03ee5155c2 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile/root-home-dir.patch
+++ b/meta-oe/recipes-kernel/oprofile/oprofile/0010-oprofile-Determine-the-root-home-directory-dynamical.patch
@@ -1,4 +1,7 @@
-oprofile: Determine the root home directory dynamically
+From 60fb7579bac738809b1776dbcd95ccacf7413c57 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 18 Mar 2021 01:02:49 -0700
+Subject: [PATCH 10/10] oprofile: Determine the root home directory dynamically
 
 This commit detects the root home directory dynamically with changes to
 the oprofile gui app source.
@@ -11,27 +14,13 @@ path to ~root, not the build time path.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
+---
+ doc/oprofile.xml | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
-Index: oprofile-1.0.0/doc/oprofile.html
-===================================================================
---- oprofile-1.0.0.orig/doc/oprofile.html	2014-11-03 17:55:31.511034857 +0000
-+++ oprofile-1.0.0/doc/oprofile.html	2014-11-03 17:57:26.415037988 +0000
-@@ -1563,8 +1563,8 @@
- 		<span class="emphasis"><em>must</em></span> stop it in a controlled manner in order to process
- 		the profile data it has collected.  Use <code class="code">kill -SIGINT &lt;operf-PID&gt;</code>
- 		for this purpose. It is recommended that when running <span class="command"><strong>operf</strong></span>
--		with this option, your current working directory should be <code class="filename">/root</code> or a subdirectory
--		of <code class="filename">/root</code> to avoid storing sample data files in locations accessible by regular users.
-+		with this option, your current working directory should be <code class="filename">~root</code> or a subdirectory
-+		of <code class="filename">~root</code> to avoid storing sample data files in locations accessible by regular users.
- 		</p>
-               </dd>
-               <dt>
-Index: oprofile-1.0.0/doc/oprofile.xml
-===================================================================
---- oprofile-1.0.0.orig/doc/oprofile.xml	2014-11-03 17:55:31.515034857 +0000
-+++ oprofile-1.0.0/doc/oprofile.xml	2014-11-03 17:58:03.719039005 +0000
-@@ -654,8 +654,8 @@
+--- a/doc/oprofile.xml
++++ b/doc/oprofile.xml
+@@ -647,8 +647,8 @@ Following is a description of the <comma
  		<emphasis>must</emphasis> stop it in a controlled manner in order to process
  		the profile data it has collected.  Use <code>kill -SIGINT &lt;operf-PID&gt;</code>
  		for this purpose. It is recommended that when running <command>operf</command>
@@ -42,3 +31,16 @@ Index: oprofile-1.0.0/doc/oprofile.xml
  		</para></listitem>
  	</varlistentry>
  	<varlistentry>
+--- a/doc/oprofile.html
++++ b/doc/oprofile.html
+@@ -1552,8 +1552,8 @@ Following is a description of the <span
+ 		<span class="emphasis"><em>must</em></span> stop it in a controlled manner in order to process
+ 		the profile data it has collected.  Use <code class="code">kill -SIGINT &lt;operf-PID&gt;</code>
+ 		for this purpose. It is recommended that when running <span class="command"><strong>operf</strong></span>
+-		with this option, your current working directory should be <code class="filename">/root</code> or a subdirectory
+-		of <code class="filename">/root</code> to avoid storing sample data files in locations accessible by regular users.
++		with this option, your current working directory should be <code class="filename">~root</code> or a subdirectory
++		of <code class="filename">~root</code> to avoid storing sample data files in locations accessible by regular users.
+ 		</p>
+               </dd>
+               <dt>
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile/automake-foreign.patch b/meta-oe/recipes-kernel/oprofile/oprofile/automake-foreign.patch
deleted file mode 100644
index b9bb6c5779..0000000000
--- a/meta-oe/recipes-kernel/oprofile/oprofile/automake-foreign.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-oprofile doesn't want GNU-levels of automake strictness so tell it to be "foreign".
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/configure.ac b/configure.ac
-index 5740585..cf6c316 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -16 +16 @@ AC_CONFIG_SRCDIR([libop/op_config.h])
--AM_INIT_AUTOMAKE
-+AM_INIT_AUTOMAKE([foreign])
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile/include_limits.patch b/meta-oe/recipes-kernel/oprofile/oprofile/include_limits.patch
deleted file mode 100644
index 5aabfe78eb..0000000000
--- a/meta-oe/recipes-kernel/oprofile/oprofile/include_limits.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-include linux/limits.h for MAX_INPUT
-
-Fixes
-op_pe_utils.cpp:533:19: error: 'MAX_INPUT' was not declared in this scope
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/libpe_utils/op_pe_utils.cpp
-+++ b/libpe_utils/op_pe_utils.cpp
-@@ -11,6 +11,7 @@
-  *
-  */
- 
-+#include <linux/limits.h>
- #include <linux/perf_event.h>
- #include <dirent.h>
- #include <stdio.h>
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile/musl.patch b/meta-oe/recipes-kernel/oprofile/oprofile/musl.patch
deleted file mode 100644
index 51db408454..0000000000
--- a/meta-oe/recipes-kernel/oprofile/oprofile/musl.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Fix glibc-isms so that oprofile builds with musl.
-
-Patch taken from openwrt (https://github.com/openwrt-mirror/openwrt/blob/master/package/devel/oprofile/patches/100-musl.patch)
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
---- a/pe_profiling/operf.cpp
-+++ b/pe_profiling/operf.cpp
-@@ -857,11 +857,14 @@ static int __delete_old_previous_sample_
-                                 int tflag  __attribute__((unused)),
-                                 struct FTW *ftwbuf __attribute__((unused)))
- {
-+	int err;
-+
- 	if (remove(fpath)) {
-+		err = errno;
- 		perror("sample data removal error");
--		return FTW_STOP;
-+		return err;
- 	} else {
--		return FTW_CONTINUE;
-+		return 0;
- 	}
- }
- 
-@@ -896,7 +899,7 @@ static void convert_sample_data(void)
- 		return;
- 
- 	if (!operf_options::append) {
--                int flags = FTW_DEPTH | FTW_ACTIONRETVAL;
-+                int flags = FTW_DEPTH;
- 		errno = 0;
- 		if (nftw(previous_sampledir.c_str(), __delete_old_previous_sample_data, 32, flags) !=0 &&
- 				errno != ENOENT) {
---- a/libop/op_events.c
-+++ b/libop/op_events.c
-@@ -83,7 +83,7 @@ static int parse_hex(char const * str)
- static u64 parse_long_hex(char const * str)
- {
- 	u64 value;
--	if (sscanf(str, "%Lx", &value) != 1)
-+	if (sscanf(str, "0x%llx", &value) != 1)
- 		parse_error("expected long hexadecimal value");
- 
- 	fflush(stderr);
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb b/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
deleted file mode 100644
index 8242a835f4..0000000000
--- a/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require oprofile.inc
-
-COMPATIBLE_HOST_riscv64 = "null"
-COMPATIBLE_HOST_riscv32 = "null"
-
-DEPENDS_append_powerpc64 = " libpfm4"
-DEPENDS_append_powerpc64le = " libpfm4"
-
-SRC_URI[md5sum] = "bd998df5521ebedae31e71cd3fb6200b"
-SRC_URI[sha256sum] = "95ded8bde1ec39922f0af015981a67aec63e025a501e4dc04cd65d38f73647e6"
-
-S = "${WORKDIR}/oprofile-${PV}"
-
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile.inc b/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
similarity index 67%
rename from meta-oe/recipes-kernel/oprofile/oprofile.inc
rename to meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
index 0863a8fd36..7a18446823 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile.inc
+++ b/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
@@ -11,29 +11,31 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SECTION = "devel"
 
 DEPENDS = "popt binutils"
-RDEPENDS_${PN} = "binutils-symlinks"
+DEPENDS_append_powerpc64 = " libpfm4"
+DEPENDS_append_powerpc64le = " libpfm4"
 
-FILES_${PN} = "${bindir} ${libdir}/${BPN}/lib*${SOLIBS} ${datadir}/${BPN}"
-FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/lib*.la"
-FILES_${PN}-staticdev += "${libdir}/${BPN}/lib*.a"
+COMPATIBLE_HOST_riscv64 = "null"
+COMPATIBLE_HOST_riscv32 = "null"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://acinclude.m4 \
-           file://automake-foreign.patch \
-           file://oprofile-cross-compile-tests.patch \
            file://run-ptest \
-           file://root-home-dir.patch \
-           file://0001-Add-rmb-definition-for-NIOS2-architecture.patch \
-           file://0001-replace-sym_iterator-0-with-sym_iterator.patch \
-           file://0001-Use-new-bfd-APIs-from-2.34.patch \
-           file://include_limits.patch \
+           file://0001-Fix-build-with-musl.patch \
+           file://0002-Fix-configure-when-bin-sh-is-not-bash.patch \
+           file://0003-Define-the-C-preprocessor-variable-to-improve-reprod.patch \
+           file://0004-Use-BUILD_DATE-to-improve-reproducibility.patch \
+           file://0005-Add-rmb-definition-for-NIOS2-architecture.patch \
+           file://0006-replace-sym_iterator-0-with-sym_iterator.patch \
+           file://0007-oprofile-doesn-t-want-GNU-levels-of-automake-strictn.patch \
+           file://0008-include-linux-limits.h-for-MAX_INPUT.patch \
+           file://0009-Prevent-running-check-tests-on-host-if-cross-compili.patch \
+           file://0010-oprofile-Determine-the-root-home-directory-dynamical.patch \
 "
+SRC_URI[sha256sum] = "7ba06f99d7c188389d20d1d5e53ee690c7733f87aa9af62bd664fa0ca235a412"
+
 UPSTREAM_CHECK_REGEX = "oprofile-(?P<pver>\d+(\.\d+)+)/"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/oprofile/files/oprofile/"
 
-SRC_URI_append_libc-musl = " file://musl.patch \
-"
-
 inherit autotools pkgconfig ptest
 
 EXTRA_OECONF = "--with-kernel=${STAGING_DIR_HOST}${prefix} --without-x ac_cv_prog_XSLTPROC="
@@ -65,3 +67,9 @@ do_install_ptest() {
 	cp ${S}/libutil++/tests/file_manip_tests.cpp \
 		libutil++/tests/file_manip_tests.o ${D}${PTEST_PATH}/libutil++/tests
 }
+
+RDEPENDS_${PN} = "binutils-symlinks"
+
+FILES_${PN} = "${bindir} ${libdir}/${BPN}/lib*${SOLIBS} ${datadir}/${BPN}"
+FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/lib*.la"
+FILES_${PN}-staticdev += "${libdir}/${BPN}/lib*.a"
-- 
2.31.0

