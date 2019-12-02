Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 68B917F7AC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 19:33:56 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id b6so718454wrq.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Dec 2019 11:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CBI24tTauirbQP5/79t7L1MinBNBQnPy7VDAu04xtAo=;
	b=G4sHPYX/yuVDj1lFQ2WFFBfYly/++GsgfWWcbpx8yAK0VwjnPQA2jbURRgsnAD0q5O
	UK+U3y49sEFCFl+tmDm+efC/3HOzehqgfDORKWPzQZeT1oDvm7Jst3793hNqbuFQNLSx
	B0/q4eTYjuu81SMb8aqCv9nc568ivgYnSK/hUPOVH+BHAqLSwlq0syAmka+tvgiW6CN1
	/OFQtJHakV8zA3bbt0SLN5GM3R6/04+oT+5QXIa+CXd04ffDJ0hhFLTuwHrUY9QUe54U
	e84p++UcN5IlzA5FLq7u/Da6YwhWbxQ7ZaQedvWGZgFJTgRqp9RjbGuT6BhjMhsnl+k/
	iNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CBI24tTauirbQP5/79t7L1MinBNBQnPy7VDAu04xtAo=;
	b=SJxQ1001zn9s5JBpeFwIo5Uv8c+qqBvPMIJD1z60QishP8/XCvq2KVHFVPmSPZA/we
	0AoYBaa56WepOddw8rHLkGhzmd0xIKniPuxAdHyIw6xvD3dgyKa22lR/gtWbLIXGog8y
	AoGsmB9yhKDu81WvH+eoYMBW05ttVKaSzeQ4Avd6KXPEuenDeFJ3yJ5R68FFNNbi3HMW
	KS3tUoRtnRv38si40YAdPkj4aNSKQdgGt7FsIO690gorXrREHYe+DPiREHQSlKPGE2GN
	YhWVvpgFXhzJleFiV65KRNoSFdcghgKeS4b+Ivnd47kRAlCJWCbT3CLp3PJzh+1MElDY
	RiTA==
X-Gm-Message-State: APjAAAV2U3jEhlUnIYTcEyWHHiXdB0okOckqROADRyDDQdduNacE2/tC
	00UHqGYQ0rFtGNQshaaIEYrcTINd
X-Google-Smtp-Source: APXvYqw9v4tjuhmF/OlvuVTI80UG+6hAjUdmW73rnkVauN79OVt2qwpuYfbPJKfhgPOZIQO54WGeMA==
X-Received: by 2002:adf:fd07:: with SMTP id e7mr675096wrr.21.1575315236863;
	Mon, 02 Dec 2019 11:33:56 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	y139sm465420wmd.24.2019.12.02.11.33.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 11:33:56 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Dec 2019 19:33:43 +0000
Message-Id: <20191202193343.12298-5-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202193343.12298-1-alex.kiernan@gmail.com>
References: <20191202193343.12298-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 5/5] ostree: Backport build/test fixes from upstream
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
X-List-Received-Date: Mon, 02 Dec 2019 19:33:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Pick upstream fixes:

77b27c07df2b Avoid race condition when building outside of source tree
16bb294384bb tests/repo-finder: Run realpath() on /tmp
de8e0765a4a5 Makefile: declare ostree_boot_SCRIPTS and append values

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 ...tion-when-building-outside-of-source.patch | 33 ++++++++++
 ...-ostree_boot_SCRIPTS-and-append-valu.patch | 60 +++++++++++++++++++
 ...ests-repo-finder-Run-realpath-on-tmp.patch | 44 ++++++++++++++
 .../recipes-extended/ostree/ostree_2019.5.bb  |  3 +
 4 files changed, 140 insertions(+)
 create mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-Avoid-race-condition-when-building-outside-of-source.patch
 create mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-Makefile-declare-ostree_boot_SCRIPTS-and-append-valu.patch
 create mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-tests-repo-finder-Run-realpath-on-tmp.patch

diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-Avoid-race-condition-when-building-outside-of-source.patch b/meta-oe/recipes-extended/ostree/ostree/0001-Avoid-race-condition-when-building-outside-of-source.patch
new file mode 100644
index 000000000000..c926965de560
--- /dev/null
+++ b/meta-oe/recipes-extended/ostree/ostree/0001-Avoid-race-condition-when-building-outside-of-source.patch
@@ -0,0 +1,33 @@
+From 77b27c07df2bdff86945766a4728b6012062535c Mon Sep 17 00:00:00 2001
+From: Stefan Agner <stefan@agner.ch>
+Date: Tue, 26 Nov 2019 09:20:30 +0100
+Subject: [PATCH] Avoid race condition when building outside of source tree
+
+When building outside of source tree it can happen that src/ostree/
+does not exist (yet) when bison is called. This leads to an build
+error like so:
+  bison: src/ostree/parse-datetime.c: cannot open: No such file or directory
+
+Make sure that src/ostree/ exists when parse-datetime.c is built.
+
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+Upstream-Status: Backport
+---
+ Makefile-ostree.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile-ostree.am b/Makefile-ostree.am
+index 76f39cad4b74..f861afe42168 100644
+--- a/Makefile-ostree.am
++++ b/Makefile-ostree.am
+@@ -123,6 +123,7 @@ ostree_SOURCES += src/ostree/ot-remote-builtin-add-cookie.c \
+ endif
+ 
+ src/ostree/parse-datetime.c: src/ostree/parse-datetime.y Makefile
++	mkdir -p src/ostree/
+ 	$(AM_V_GEN) $(YACC) $< -o $@
+ 
+ EXTRA_DIST += src/ostree/parse-datetime.y
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-Makefile-declare-ostree_boot_SCRIPTS-and-append-valu.patch b/meta-oe/recipes-extended/ostree/ostree/0001-Makefile-declare-ostree_boot_SCRIPTS-and-append-valu.patch
new file mode 100644
index 000000000000..4b1c02a62e72
--- /dev/null
+++ b/meta-oe/recipes-extended/ostree/ostree/0001-Makefile-declare-ostree_boot_SCRIPTS-and-append-valu.patch
@@ -0,0 +1,60 @@
+From de8e0765a4a54f0367999f682ce4cc53bfaa60b0 Mon Sep 17 00:00:00 2001
+From: Ricardo Salveti <ricardo@foundries.io>
+Date: Tue, 5 Nov 2019 21:16:07 -0300
+Subject: [PATCH] Makefile: declare ostree_boot_SCRIPTS and append values
+
+ostree_boot_SCRIPTS was being set on both Makefile-boot.am and
+Makefile-switchroot.am, causing the first one to be replaced by the
+other at the final Makefile, so declare as empty and append on both
+places instead.
+
+Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+Upstream-Status: Backport
+---
+ Makefile-boot.am       | 2 +-
+ Makefile-decls.am      | 1 +
+ Makefile-switchroot.am | 2 +-
+ 3 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile-boot.am b/Makefile-boot.am
+index b4d4a1af670e..b51928f08d7c 100644
+--- a/Makefile-boot.am
++++ b/Makefile-boot.am
+@@ -60,7 +60,7 @@ grub2configdir = $(sysconfdir)/grub.d
+ INSTALL_DATA_HOOKS += install-grub2-config-hook
+ else
+ # We're using our internal generator
+-ostree_boot_SCRIPTS = src/boot/grub2/ostree-grub-generator
++ostree_boot_SCRIPTS += src/boot/grub2/ostree-grub-generator
+ endif
+ 
+ EXTRA_DIST += src/boot/dracut/module-setup.sh \
+diff --git a/Makefile-decls.am b/Makefile-decls.am
+index 115c19fb663f..086ee1384a0b 100644
+--- a/Makefile-decls.am
++++ b/Makefile-decls.am
+@@ -47,6 +47,7 @@ typelibdir = $(libdir)/girepository-1.0
+ typelib_DATA =
+ gsettings_SCHEMAS =
+ ostree_bootdir = $(prefix)/lib/ostree
++ostree_boot_SCRIPTS =
+ ostree_boot_PROGRAMS =
+ 
+ # This initializes some more variables
+diff --git a/Makefile-switchroot.am b/Makefile-switchroot.am
+index ff44d4bc3981..b81b843febbc 100644
+--- a/Makefile-switchroot.am
++++ b/Makefile-switchroot.am
+@@ -42,7 +42,7 @@ if BUILDOPT_USE_STATIC_COMPILER
+ # to get autotools to install this as an executable but without generating rules
+ # to make it itself which we have specified manually.  See
+ # https://lists.gnu.org/archive/html/help-gnu-utils/2007-01/msg00007.html
+-ostree_boot_SCRIPTS = ostree-prepare-root
++ostree_boot_SCRIPTS += ostree-prepare-root
+ 
+ ostree-prepare-root : $(ostree_prepare_root_SOURCES)
+ 	$(STATIC_COMPILER) -o $@ -static $(top_srcdir)/src/switchroot/ostree-prepare-root.c $(ostree_prepare_root_CPPFLAGS) $(AM_CFLAGS) $(DEFAULT_INCLUDES) -DOSTREE_PREPARE_ROOT_STATIC=1
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-tests-repo-finder-Run-realpath-on-tmp.patch b/meta-oe/recipes-extended/ostree/ostree/0001-tests-repo-finder-Run-realpath-on-tmp.patch
new file mode 100644
index 000000000000..ba116a9efebb
--- /dev/null
+++ b/meta-oe/recipes-extended/ostree/ostree/0001-tests-repo-finder-Run-realpath-on-tmp.patch
@@ -0,0 +1,44 @@
+From 16bb294384bb4ae4ba83af51fbb64fdd14d02838 Mon Sep 17 00:00:00 2001
+From: Colin Walters <walters@verbum.org>
+Date: Thu, 21 Nov 2019 18:37:48 +0000
+Subject: [PATCH] tests/repo-finder: Run realpath() on /tmp
+
+This fixes running this test case inside
+https://github.com/cgwalters/coretoolbox
+
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+Upstream-Status: Backport
+---
+ tests/test-repo-finder-mount.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/tests/test-repo-finder-mount.c b/tests/test-repo-finder-mount.c
+index 847f4becd1c6..af2f5e085f68 100644
+--- a/tests/test-repo-finder-mount.c
++++ b/tests/test-repo-finder-mount.c
+@@ -62,7 +62,9 @@ setup (Fixture       *fixture,
+     g_clear_error (&error);
+   g_assert_no_error (error);
+ 
+-  fixture->working_dir = g_file_new_for_path (fixture->tmpdir.path);
++  /* Realpath since at least coretoolbox makes /tmp a symlink to /host/tmp */
++  g_autofree char *tmpdir_real_path = realpath (fixture->tmpdir.path, NULL);
++  fixture->working_dir = g_file_new_for_path (tmpdir_real_path);
+ 
+   fixture->parent_repo = ot_test_setup_repo (NULL, &error);
+   g_assert_no_error (error);
+@@ -443,9 +445,8 @@ test_repo_finder_mount_mixed_mounts (Fixture       *fixture,
+         }
+       else
+         {
+-          g_test_message ("Unknown result ‘%s’ with keyring ‘%s’.",
+-                          result->remote->name, result->remote->keyring);
+-          g_assert_not_reached ();
++          g_error ("Unknown result ‘%s’ with keyring ‘%s’",
++                   result->remote->name, result->remote->keyring);
+         }
+     }
+ 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.5.bb b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
index 7c1ed9c6b7a2..4f437f348025 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
@@ -31,6 +31,9 @@ SRC_URI = " \
     file://0002-tests-core-Assume-C.UTF-8-if-locale-isn-t-found.patch \
     file://0003-tests-Avoid-musl-failure-with-cp-a.patch \
     file://0001-build-create-tests-directory-for-split-builds.patch \
+    file://0001-Makefile-declare-ostree_boot_SCRIPTS-and-append-valu.patch \
+    file://0001-Avoid-race-condition-when-building-outside-of-source.patch \
+    file://0001-tests-repo-finder-Run-realpath-on-tmp.patch \
 "
 SRCREV = "980ca07b03b3aa7e0012729dd6c84b0878775d93"
 
-- 
2.17.1


