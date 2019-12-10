Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id BEFA47F944
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 23:23:45 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p17so5035119wmi.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 15:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Z9bkUMM0oYesy2PAndg9GXGJCo+dc0epEgzFAbeo2vU=;
	b=J1K0SPcQCS6BbBhfCKRNlxlunyU1LfOyvnhef24PEi0ObIXQh+cdp3AtVgCZ2OP1V1
	TMUZ9/mV7opd5/ZuiDH3ir/3BPU/aLA0dr1ZzVM40mqoIpt/Pv3kJbRlXSz1yyeCgELt
	dovxE5bmqzFG1AUnoGJVSSQ4IU/Y1dYr3K9a8VSGMK4Lp5u6o0/ysY0Hu5cWWMwm2UOD
	sVRYdEKKC51HRpUxE92ut1WJCAMoGBqLHLf9xf2OMej6km/ujMVXTeEUsMN8lcMY3lIM
	d2/40fd0CUnGXaJrtKaVF9NYwTxbNTLjwPqvdXPuzf8tVqBs9U5DJLdz65vHRPDWu/Ty
	8CXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Z9bkUMM0oYesy2PAndg9GXGJCo+dc0epEgzFAbeo2vU=;
	b=kOIRdAaDnXdKkWRk9y/a6og1HV618LQ4axeomqx7hVZWE5Oex66LuZPSAgM95fltm1
	/OnxEFAUSNB5fh4r89WzU81QDhyqvW1KOoCLyEJ3OGAI+L3FUS1r/8pSBjzrpLeVkSQM
	gUNlzNUxNmYzqK3lzoI3V12+gs6vjRV21SRAr666rcFBEHDEIn9NUOa+bgo1vHnau/9/
	stY47i+1mP5Vln4OPO+B/Zq17cbpuFe3Xh09mhRRkf3KrhtMejXOnsaq+IM2hFlVndG/
	81aCce1CNiXDhuUC/aajxZEOConhUg5pB+TmrOxGwUVCnyWWm2MZgjLse2uEAQMMm6hd
	iS6g==
X-Gm-Message-State: APjAAAULx+qT3fChiBAw0MYJXSxJi8VjSDzTsuG0FSJOBll8tcASkyfB
	hDd+V0TwGGf5bOGFFpgrm78FswXc
X-Google-Smtp-Source: APXvYqyP23k0nObph1M/RsX7cpmLwlQUOdfu4uloxMf772YvLgeXSalYAEKDvS51zGOdZxh4cOsNQQ==
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr466875wmg.95.1576020225266;
	Tue, 10 Dec 2019 15:23:45 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id u22sm79528wru.30.2019.12.10.15.23.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Dec 2019 15:23:44 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Dec 2019 23:23:34 +0000
Message-Id: <20191210232334.77887-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] ostree: Upgrade 2019.5 -> 2019.6
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
X-List-Received-Date: Tue, 10 Dec 2019 23:23:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop all patches as they now exist upstream. Add tar to the dependencies
for ptest as this is required when running with libarchive enabled (and
the busybox version doesn't suffice).

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 ...tion-when-building-outside-of-source.patch | 33 ----------
 ...-ostree_boot_SCRIPTS-and-append-valu.patch | 60 -------------------
 ...ate-tests-directory-for-split-builds.patch | 43 -------------
 ...cros-Add-TEMP_FAILURE_RETRY-for-musl.patch | 40 -------------
 ...-EPIPE-failures-when-head-terminates.patch | 51 ----------------
 ...-core-Fallback-to-en_US.UTF-8-locale.patch | 42 -------------
 ...ests-repo-finder-Run-realpath-on-tmp.patch | 44 --------------
 ...Assume-C.UTF-8-if-locale-isn-t-found.patch | 40 -------------
 ...3-tests-Avoid-musl-failure-with-cp-a.patch | 52 ----------------
 .../{ostree_2019.5.bb => ostree_2019.6.bb}    | 12 +---
 10 files changed, 2 insertions(+), 415 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-Avoid-race-condition-when-building-outside-of-source.patch
 delete mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-Makefile-declare-ostree_boot_SCRIPTS-and-append-valu.patch
 delete mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-build-create-tests-directory-for-split-builds.patch
 delete mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-macros-Add-TEMP_FAILURE_RETRY-for-musl.patch
 delete mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-tests-Handle-EPIPE-failures-when-head-terminates.patch
 delete mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-tests-core-Fallback-to-en_US.UTF-8-locale.patch
 delete mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-tests-repo-finder-Run-realpath-on-tmp.patch
 delete mode 100644 meta-oe/recipes-extended/ostree/ostree/0002-tests-core-Assume-C.UTF-8-if-locale-isn-t-found.patch
 delete mode 100644 meta-oe/recipes-extended/ostree/ostree/0003-tests-Avoid-musl-failure-with-cp-a.patch
 rename meta-oe/recipes-extended/ostree/{ostree_2019.5.bb => ostree_2019.6.bb} (90%)

diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-Avoid-race-condition-when-building-outside-of-source.patch b/meta-oe/recipes-extended/ostree/ostree/0001-Avoid-race-condition-when-building-outside-of-source.patch
deleted file mode 100644
index c926965de560..000000000000
--- a/meta-oe/recipes-extended/ostree/ostree/0001-Avoid-race-condition-when-building-outside-of-source.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 77b27c07df2bdff86945766a4728b6012062535c Mon Sep 17 00:00:00 2001
-From: Stefan Agner <stefan@agner.ch>
-Date: Tue, 26 Nov 2019 09:20:30 +0100
-Subject: [PATCH] Avoid race condition when building outside of source tree
-
-When building outside of source tree it can happen that src/ostree/
-does not exist (yet) when bison is called. This leads to an build
-error like so:
-  bison: src/ostree/parse-datetime.c: cannot open: No such file or directory
-
-Make sure that src/ostree/ exists when parse-datetime.c is built.
-
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-Upstream-Status: Backport
----
- Makefile-ostree.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile-ostree.am b/Makefile-ostree.am
-index 76f39cad4b74..f861afe42168 100644
---- a/Makefile-ostree.am
-+++ b/Makefile-ostree.am
-@@ -123,6 +123,7 @@ ostree_SOURCES += src/ostree/ot-remote-builtin-add-cookie.c \
- endif
- 
- src/ostree/parse-datetime.c: src/ostree/parse-datetime.y Makefile
-+	mkdir -p src/ostree/
- 	$(AM_V_GEN) $(YACC) $< -o $@
- 
- EXTRA_DIST += src/ostree/parse-datetime.y
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-Makefile-declare-ostree_boot_SCRIPTS-and-append-valu.patch b/meta-oe/recipes-extended/ostree/ostree/0001-Makefile-declare-ostree_boot_SCRIPTS-and-append-valu.patch
deleted file mode 100644
index 4b1c02a62e72..000000000000
--- a/meta-oe/recipes-extended/ostree/ostree/0001-Makefile-declare-ostree_boot_SCRIPTS-and-append-valu.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From de8e0765a4a54f0367999f682ce4cc53bfaa60b0 Mon Sep 17 00:00:00 2001
-From: Ricardo Salveti <ricardo@foundries.io>
-Date: Tue, 5 Nov 2019 21:16:07 -0300
-Subject: [PATCH] Makefile: declare ostree_boot_SCRIPTS and append values
-
-ostree_boot_SCRIPTS was being set on both Makefile-boot.am and
-Makefile-switchroot.am, causing the first one to be replaced by the
-other at the final Makefile, so declare as empty and append on both
-places instead.
-
-Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-Upstream-Status: Backport
----
- Makefile-boot.am       | 2 +-
- Makefile-decls.am      | 1 +
- Makefile-switchroot.am | 2 +-
- 3 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile-boot.am b/Makefile-boot.am
-index b4d4a1af670e..b51928f08d7c 100644
---- a/Makefile-boot.am
-+++ b/Makefile-boot.am
-@@ -60,7 +60,7 @@ grub2configdir = $(sysconfdir)/grub.d
- INSTALL_DATA_HOOKS += install-grub2-config-hook
- else
- # We're using our internal generator
--ostree_boot_SCRIPTS = src/boot/grub2/ostree-grub-generator
-+ostree_boot_SCRIPTS += src/boot/grub2/ostree-grub-generator
- endif
- 
- EXTRA_DIST += src/boot/dracut/module-setup.sh \
-diff --git a/Makefile-decls.am b/Makefile-decls.am
-index 115c19fb663f..086ee1384a0b 100644
---- a/Makefile-decls.am
-+++ b/Makefile-decls.am
-@@ -47,6 +47,7 @@ typelibdir = $(libdir)/girepository-1.0
- typelib_DATA =
- gsettings_SCHEMAS =
- ostree_bootdir = $(prefix)/lib/ostree
-+ostree_boot_SCRIPTS =
- ostree_boot_PROGRAMS =
- 
- # This initializes some more variables
-diff --git a/Makefile-switchroot.am b/Makefile-switchroot.am
-index ff44d4bc3981..b81b843febbc 100644
---- a/Makefile-switchroot.am
-+++ b/Makefile-switchroot.am
-@@ -42,7 +42,7 @@ if BUILDOPT_USE_STATIC_COMPILER
- # to get autotools to install this as an executable but without generating rules
- # to make it itself which we have specified manually.  See
- # https://lists.gnu.org/archive/html/help-gnu-utils/2007-01/msg00007.html
--ostree_boot_SCRIPTS = ostree-prepare-root
-+ostree_boot_SCRIPTS += ostree-prepare-root
- 
- ostree-prepare-root : $(ostree_prepare_root_SOURCES)
- 	$(STATIC_COMPILER) -o $@ -static $(top_srcdir)/src/switchroot/ostree-prepare-root.c $(ostree_prepare_root_CPPFLAGS) $(AM_CFLAGS) $(DEFAULT_INCLUDES) -DOSTREE_PREPARE_ROOT_STATIC=1
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-build-create-tests-directory-for-split-builds.patch b/meta-oe/recipes-extended/ostree/ostree/0001-build-create-tests-directory-for-split-builds.patch
deleted file mode 100644
index d94b3ded9b3e..000000000000
--- a/meta-oe/recipes-extended/ostree/ostree/0001-build-create-tests-directory-for-split-builds.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 114fe5067b58a2434b44855eee48f865186fe0fa Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Tue, 5 Nov 2019 22:26:23 +0000
-Subject: [PATCH] build: create tests directory for split builds
-
-When `--disable-dependency-tracking` is in effect with separate build
-directory, the tests directory isn't created as a result of the
-dependency generation, which leads to a build race for the tests
-directory being created and failures:
-
-  Making all in .
-  make[2]: Entering directory 'TOPDIR/build/tmp/work/riscv64-yoe-linux-musl/ostree/2019.5-r0/build'
-  (echo '[Test]' > tests/test-local-pull-depth.sh.test.tmp; \
-  echo 'Type=session' >> tests/test-local-pull-depth.sh.test.tmp; \
-  echo 'Exec=env G_TEST_SRCDIR=/usr/libexec/installed-tests/libostree G_TEST_BUILDDIR=/usr/libexec/installed-tests/libostree /usr/libexec/installed-tests/libostree/test-local-pull-depth.sh' >> tests/test-local-pull-depth.sh.test.tmp; \
-  mv tests/test-local-pull-depth.sh.test.tmp tests/test-local-pull-depth.sh.test)
-  /bin/sh: tests/test-local-pull-depth.sh.test.tmp: No such file or directory
-  /bin/sh: line 1: tests/test-local-pull-depth.sh.test.tmp: No such file or directory
-  /bin/sh: line 2: tests/test-local-pull-depth.sh.test.tmp: No such file or directory
-  mv: cannot stat 'tests/test-local-pull-depth.sh.test.tmp': No such file or directory
-  make[2]: *** [Makefile:9282: tests/test-local-pull-depth.sh.test] Error 1
-
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-Upstream-Status: Pending
----
- buildutil/glib-tap.mk | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/buildutil/glib-tap.mk b/buildutil/glib-tap.mk
-index 34b8f21ea26a..9a944a0acc88 100644
---- a/buildutil/glib-tap.mk
-+++ b/buildutil/glib-tap.mk
-@@ -116,6 +116,7 @@ installed_testcases = $(test_programs) $(installed_test_programs) \
- installed_test_meta_DATA = $(installed_testcases:=.test)
- 
- %.test: %$(EXEEXT) Makefile
-+	@$(MKDIR_P) $(dir $@)
- 	$(AM_V_GEN) (echo '[Test]' > $@.tmp; \
- 	echo 'Type=session' >> $@.tmp; \
- 	echo 'Exec=env G_TEST_SRCDIR=$(installed_testdir) G_TEST_BUILDDIR=$(installed_testdir) $(installed_testdir)/$(notdir $<)' >> $@.tmp; \
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-macros-Add-TEMP_FAILURE_RETRY-for-musl.patch b/meta-oe/recipes-extended/ostree/ostree/0001-macros-Add-TEMP_FAILURE_RETRY-for-musl.patch
deleted file mode 100644
index d8c044cb9224..000000000000
--- a/meta-oe/recipes-extended/ostree/ostree/0001-macros-Add-TEMP_FAILURE_RETRY-for-musl.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 5a4f2ddb0a6c656b425a3caa41f5af766ed5f44b Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Mon, 9 Sep 2019 14:19:18 +0100
-Subject: [PATCH] macros: Add TEMP_FAILURE_RETRY for musl
-
-TEMP_FAILURE_RETRY is glibc specific, add a definition for musl.
-
-See https://github.com/ostreedev/ostree/issues/731
-
-Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-Upstream-Status: Accepted [https://gitlab.gnome.org/GNOME/libglnx/commit/15c06468804014fc49f6f340132930703f919b19]
----
- glnx-macros.h | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/libglnx.glnx-macros.h b/libglnx/glnx-macros.h
-index 6d8aca93f8a3..700fc75ceed0 100644
---- a/libglnx.glnx-macros.h
-+++ b/libglnx/glnx-macros.h
-@@ -31,6 +31,16 @@ G_BEGIN_DECLS
- /* All of these are for C only. */
- #ifndef __GI_SCANNER__
- 
-+/* fixes builds against musl, taken from glibc unistd.h */
-+#ifndef TEMP_FAILURE_RETRY
-+#define TEMP_FAILURE_RETRY(expression) \
-+  (__extension__                                                              \
-+    ({ long int __result;                                                     \
-+       do __result = (long int) (expression);                                 \
-+       while (__result == -1L && errno == EINTR);                             \
-+       __result; }))
-+#endif
-+
- /* Taken from https://github.com/systemd/systemd/src/basic/string-util.h
-  * at revision v228-666-gcf6c8c4
-  */
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-tests-Handle-EPIPE-failures-when-head-terminates.patch b/meta-oe/recipes-extended/ostree/ostree/0001-tests-Handle-EPIPE-failures-when-head-terminates.patch
deleted file mode 100644
index fdb733ebe4f2..000000000000
--- a/meta-oe/recipes-extended/ostree/ostree/0001-tests-Handle-EPIPE-failures-when-head-terminates.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From fb519f0361565cad0d340095263a1e8866ec4f89 Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Thu, 31 Oct 2019 11:30:00 +0000
-Subject: [PATCH 1/3] tests: Handle EPIPE failures when head terminates
-
-When using musl, it appears that the default is line buffered output, so
-when `head -1` reads from a pipe we have to handle the source end of the
-pipe getting EPIPE.
-
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-Upstream-Status: Accepted [v2019.6]
----
- tests/pull-test.sh            | 2 +-
- tests/test-pull-mirrorlist.sh | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/tests/pull-test.sh b/tests/pull-test.sh
-index 0a97a1195582..2cfd8e02f790 100644
---- a/tests/pull-test.sh
-+++ b/tests/pull-test.sh
-@@ -177,7 +177,7 @@ if ! skip_one_without_user_xattrs; then
-     ${CMD_PREFIX} ostree --repo=cacherepo pull-local ostree-srv/gnomerepo main
-     rev=$(ostree --repo=cacherepo rev-parse main)
-     ${CMD_PREFIX} ostree --repo=cacherepo ls -R -C main > ls.txt
--    regfile_hash=$(grep -E -e '^-0' ls.txt | head -1 | awk '{ print $5 }')
-+    regfile_hash=$((grep -E -e '^-0' ls.txt || true) | head -1 | awk '{ print $5 }')
-     ${CMD_PREFIX} ostree --repo=repo remote add --set=gpg-verify=false corruptrepo $(cat httpd-address)/ostree/corruptrepo
-     # Make this a loop so in the future we can add more object types like commit etc.
-     for object in ${regfile_hash}.file; do
-diff --git a/tests/test-pull-mirrorlist.sh b/tests/test-pull-mirrorlist.sh
-index 4e44852d3971..85ff66e99f8e 100755
---- a/tests/test-pull-mirrorlist.sh
-+++ b/tests/test-pull-mirrorlist.sh
-@@ -47,12 +47,12 @@ setup_mirror content_mirror3
- 
- # Let's delete a file from 1 so that it falls back on 2
- cd ${test_tmpdir}/content_mirror1/ostree/gnomerepo
--filez=$(find objects/ -name '*.filez' | head -n 1)
-+filez=$((find objects/ -name '*.filez' || true) | head -n 1)
- rm ${filez}
- 
- # Let's delete a file from 1 and 2 so that it falls back on 3
- cd ${test_tmpdir}/content_mirror1/ostree/gnomerepo
--filez=$(find objects/ -name '*.filez' | head -n 1)
-+filez=$((find objects/ -name '*.filez' || true) | head -n 1)
- rm ${filez}
- cd ${test_tmpdir}/content_mirror2/ostree/gnomerepo
- rm ${filez}
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-tests-core-Fallback-to-en_US.UTF-8-locale.patch b/meta-oe/recipes-extended/ostree/ostree/0001-tests-core-Fallback-to-en_US.UTF-8-locale.patch
deleted file mode 100644
index dcafb0995784..000000000000
--- a/meta-oe/recipes-extended/ostree/ostree/0001-tests-core-Fallback-to-en_US.UTF-8-locale.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 4d17cd917fe4fb67d2f9e4881b6693ac7289f423 Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Wed, 30 Oct 2019 07:55:41 +0000
-Subject: [PATCH 1/4] tests/core: Fallback to en_US.UTF-8 locale
-
-A number of tests expect explicit left/right single quotes in their
-messages, which will never happen in the C locale. Change so we pick a
-likely UTF-8 locale, or fail if we can't find one.
-
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-Upstream-Status: Accepted [v2019.6]
----
- tests/libtest-core.sh | 12 ++++--------
- 1 file changed, 4 insertions(+), 8 deletions(-)
-
-diff --git a/tests/libtest-core.sh b/tests/libtest-core.sh
-index f6f94288fc61..bc191332c916 100644
---- a/tests/libtest-core.sh
-+++ b/tests/libtest-core.sh
-@@ -35,15 +35,11 @@ assert_not_reached () {
- }
- 
- # Some tests look for specific English strings. Use a UTF-8 version
--# of the C (POSIX) locale if we have one, or fall back to POSIX
-+# of the C (POSIX) locale if we have one, or fall back to en_US.UTF-8
- # (https://sourceware.org/glibc/wiki/Proposals/C.UTF-8)
--if locale -a | grep '^C.UTF-8$' >/dev/null; then
--    export LC_ALL=C.UTF-8
--elif locale -a | grep '^C.utf8$' >/dev/null; then
--    export LC_ALL=C.utf8
--else
--    export LC_ALL=C
--fi
-+export LC_ALL=$(locale -a | grep -Ee '\.(UTF-8|utf8)' | grep -iEe '^(C|en_US)' | head -1 || true)
-+if [ -z "${LC_ALL}" ]; then fatal "Can't find suitable UTF-8 locale"; fi
-+
- # A GNU extension, used whenever LC_ALL is not C
- unset LANGUAGE
- 
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-tests-repo-finder-Run-realpath-on-tmp.patch b/meta-oe/recipes-extended/ostree/ostree/0001-tests-repo-finder-Run-realpath-on-tmp.patch
deleted file mode 100644
index ba116a9efebb..000000000000
--- a/meta-oe/recipes-extended/ostree/ostree/0001-tests-repo-finder-Run-realpath-on-tmp.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 16bb294384bb4ae4ba83af51fbb64fdd14d02838 Mon Sep 17 00:00:00 2001
-From: Colin Walters <walters@verbum.org>
-Date: Thu, 21 Nov 2019 18:37:48 +0000
-Subject: [PATCH] tests/repo-finder: Run realpath() on /tmp
-
-This fixes running this test case inside
-https://github.com/cgwalters/coretoolbox
-
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-Upstream-Status: Backport
----
- tests/test-repo-finder-mount.c | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/tests/test-repo-finder-mount.c b/tests/test-repo-finder-mount.c
-index 847f4becd1c6..af2f5e085f68 100644
---- a/tests/test-repo-finder-mount.c
-+++ b/tests/test-repo-finder-mount.c
-@@ -62,7 +62,9 @@ setup (Fixture       *fixture,
-     g_clear_error (&error);
-   g_assert_no_error (error);
- 
--  fixture->working_dir = g_file_new_for_path (fixture->tmpdir.path);
-+  /* Realpath since at least coretoolbox makes /tmp a symlink to /host/tmp */
-+  g_autofree char *tmpdir_real_path = realpath (fixture->tmpdir.path, NULL);
-+  fixture->working_dir = g_file_new_for_path (tmpdir_real_path);
- 
-   fixture->parent_repo = ot_test_setup_repo (NULL, &error);
-   g_assert_no_error (error);
-@@ -443,9 +445,8 @@ test_repo_finder_mount_mixed_mounts (Fixture       *fixture,
-         }
-       else
-         {
--          g_test_message ("Unknown result ‘%s’ with keyring ‘%s’.",
--                          result->remote->name, result->remote->keyring);
--          g_assert_not_reached ();
-+          g_error ("Unknown result ‘%s’ with keyring ‘%s’",
-+                   result->remote->name, result->remote->keyring);
-         }
-     }
- 
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/ostree/ostree/0002-tests-core-Assume-C.UTF-8-if-locale-isn-t-found.patch b/meta-oe/recipes-extended/ostree/ostree/0002-tests-core-Assume-C.UTF-8-if-locale-isn-t-found.patch
deleted file mode 100644
index 5ab9c8f6d75c..000000000000
--- a/meta-oe/recipes-extended/ostree/ostree/0002-tests-core-Assume-C.UTF-8-if-locale-isn-t-found.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 3d48021fb0892721fab8359b49470e521aaed493 Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Thu, 31 Oct 2019 11:28:07 +0000
-Subject: [PATCH 2/3] tests/core: Assume C.UTF-8 if locale isn't found
-
-When building with musl there's no locale command, also its default
-locale is C.UTF-8, so just get C.UTF-8 if we can't find locale.
-
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-Upstream-Status: Accepted [v2019.6]
----
- tests/libtest-core.sh | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/tests/libtest-core.sh b/tests/libtest-core.sh
-index bc191332c916..46aafab03cc8 100644
---- a/tests/libtest-core.sh
-+++ b/tests/libtest-core.sh
-@@ -37,9 +37,15 @@ assert_not_reached () {
- # Some tests look for specific English strings. Use a UTF-8 version
- # of the C (POSIX) locale if we have one, or fall back to en_US.UTF-8
- # (https://sourceware.org/glibc/wiki/Proposals/C.UTF-8)
--export LC_ALL=$(locale -a | grep -Ee '\.(UTF-8|utf8)' | grep -iEe '^(C|en_US)' | head -1 || true)
--if [ -z "${LC_ALL}" ]; then fatal "Can't find suitable UTF-8 locale"; fi
--
-+#
-+# If we can't find the locale command assume we have support for C.UTF-8
-+# (e.g. musl based systems)
-+if type -p locale >/dev/null; then
-+    export LC_ALL=$(locale -a | grep -Ee '\.(UTF-8|utf8)' | grep -iEe '^(C|en_US)' | head -1 || true)
-+    if [ -z "${LC_ALL}" ]; then fatal "Can't find suitable UTF-8 locale"; fi
-+else
-+    export LC_ALL=C.UTF-8
-+fi
- # A GNU extension, used whenever LC_ALL is not C
- unset LANGUAGE
- 
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/ostree/ostree/0003-tests-Avoid-musl-failure-with-cp-a.patch b/meta-oe/recipes-extended/ostree/ostree/0003-tests-Avoid-musl-failure-with-cp-a.patch
deleted file mode 100644
index 834617c12d96..000000000000
--- a/meta-oe/recipes-extended/ostree/ostree/0003-tests-Avoid-musl-failure-with-cp-a.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From abf1a7392b2fa1945286a39a35190d74fe141e52 Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Thu, 31 Oct 2019 17:09:36 +0000
-Subject: [PATCH 3/3] tests: Avoid musl failure with `cp -a`
-
-When copying the tree, using musl and GNU coreutils, something gets confused
-when setting the ownership of symlinks and the copy fails with:
-
-  cp: failed to preserve ownership for osdata-devel/bin: Not supported
-
-Rework using tar to avoid the problem.
-
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-Upstream-Status: Accepted [v2019.6]
----
- tests/libtest.sh        | 4 +++-
- tests/test-admin-gpg.sh | 4 +++-
- 2 files changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/tests/libtest.sh b/tests/libtest.sh
-index ba00073a10a7..3f5fd931bc1e 100755
---- a/tests/libtest.sh
-+++ b/tests/libtest.sh
-@@ -440,7 +440,9 @@ EOF
-     ${CMD_PREFIX} ostree --repo=${test_tmpdir}/testos-repo commit --add-metadata-string version=1.0.10 -b testos/buildmaster/x86_64-runtime -s "Build"
- 
-     cd ${test_tmpdir}
--    cp -a osdata osdata-devel
-+    rm -rf osdata-devel
-+    mkdir osdata-devel
-+    tar -C osdata -cf - . | tar -C osdata-devel -xf -
-     cd osdata-devel
-     mkdir -p usr/include
-     echo "a development header" > usr/include/foo.h
-diff --git a/tests/test-admin-gpg.sh b/tests/test-admin-gpg.sh
-index 1f50c8a9a508..dc776743776c 100755
---- a/tests/test-admin-gpg.sh
-+++ b/tests/test-admin-gpg.sh
-@@ -90,7 +90,9 @@ EOF
-     ${CMD_PREFIX} ostree --repo=${test_tmpdir}/testos-repo commit --add-metadata-string version=1.0.10 -b testos/buildmaster/x86_64-runtime -s "Build" --gpg-sign=$keyid --gpg-homedir=${test_tmpdir}/gpghome
- 
-     cd ${test_tmpdir}
--    cp -a osdata osdata-devel
-+    rm -rf osdata-devel
-+    mkdir osdata-devel
-+    tar -C osdata -cf - . | tar -C osdata-devel -xf -
-     cd osdata-devel
-     mkdir -p usr/include
-     echo "a development header" > usr/include/foo.h
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.5.bb b/meta-oe/recipes-extended/ostree/ostree_2019.6.bb
similarity index 90%
rename from meta-oe/recipes-extended/ostree/ostree_2019.5.bb
rename to meta-oe/recipes-extended/ostree/ostree_2019.6.bb
index 4f437f348025..86a7aac31c27 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2019.6.bb
@@ -24,18 +24,9 @@ PREMIRRORS = ""
 
 SRC_URI = " \
     gitsm://github.com/ostreedev/ostree \
-    file://0001-macros-Add-TEMP_FAILURE_RETRY-for-musl.patch \
     file://run-ptest \
-    file://0001-tests-core-Fallback-to-en_US.UTF-8-locale.patch \
-    file://0001-tests-Handle-EPIPE-failures-when-head-terminates.patch \
-    file://0002-tests-core-Assume-C.UTF-8-if-locale-isn-t-found.patch \
-    file://0003-tests-Avoid-musl-failure-with-cp-a.patch \
-    file://0001-build-create-tests-directory-for-split-builds.patch \
-    file://0001-Makefile-declare-ostree_boot_SCRIPTS-and-append-valu.patch \
-    file://0001-Avoid-race-condition-when-building-outside-of-source.patch \
-    file://0001-tests-repo-finder-Run-realpath-on-tmp.patch \
 "
-SRCREV = "980ca07b03b3aa7e0012729dd6c84b0878775d93"
+SRCREV = "43706202f7de2ce0c829a46caab350ae1656f6ad"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
 
@@ -176,6 +167,7 @@ RDEPENDS_${PN}-ptest += " \
     python3-core \
     python3-multiprocessing \
     python3-pyyaml \
+    tar \
     ${PN}-trivial-httpd \
 "
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils glibc-localedata-en-us"
-- 
2.17.1


