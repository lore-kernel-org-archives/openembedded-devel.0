Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id A03EB7550C
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:58:57 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id u86so3726565pfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=R1efOz/eSR9nZR/JmpKMaZwHEQw8FNgMIml4uPo3JYs=;
	b=b7oSPxRpf42EjRV6DxxCDhcylZNGxg9kJW+rOMc3KpbJ+5rk+DtYbEXTBSDWvVzEt2
	PpGAClBUcZSLlR0hSJ7clT0DTQJHWyaSAO87SI5HEUc2uRLDUoWGaPJ0OY3fFnNp7Jnc
	WiTpu0lyTOmKfzBtj57D9Q/awYJbRK+o/E6OnIp565RS45m8dM5DUbLDtnGndTjLAXq3
	4rIs6N6YtzRts7gwr8OXF9XY1nKZ9OB61jLsBTpMXutIqbZeD0MmCcYWEZDc7PnDUXF8
	ufPv4omagZFEh2DtG2NmpTgFu77elJ0p1GSMwPxVd9/NVuezTACn/aV8IBysGq1lvf/W
	o37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=R1efOz/eSR9nZR/JmpKMaZwHEQw8FNgMIml4uPo3JYs=;
	b=oLitytFrkVvEjv3i1ovfanjuombSb2ampBmUaIx1Cb8VseEcdfYXBBUvTpFsGjwlHU
	0Ky43jK0golCp7RaC1wMtEwJ0ztVdJAL9DAeazHOqpiI/VZaSTmgmqOo+60QvyOONQeo
	/juzMGt/z+DjlKM5yy2408YnXaR/53GFhhUNKxIteLpPdvwy2EnpqE2TGcXmLkv0xAEO
	cr0zbjmKL/wBQzcBmDNk4jGJ4zGlXCFTGBh+d0ch9n2OE12r6YmLBZaT1iqhhByggmvq
	gSnVg4/VO8XBm/1c3qsgwJMeGrzYR3EKO+4lNc75VAXqLy1D6ZmvMNkeFg2MdUFOLuzE
	hmMQ==
X-Gm-Message-State: ALQs6tA/TgKmG4tN5q1LYZr15yogHwKDDGMAQcG5DHOoXgUIh4rbVyCV
	XvmcbNv86W9s52TrbsIUvp9Emw==
X-Google-Smtp-Source: AIpwx487wi3IChVkS88RX7qs/QYSKsAvfURfN8FXmTkSHkiMRYPubDdLHSHzzj7wGPNPRvCCPZPkXA==
X-Received: by 10.99.101.66 with SMTP id z63mr12057637pgb.383.1523170738987;
	Sat, 07 Apr 2018 23:58:58 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.58.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:58:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:19 -0700
Message-Id: <1523170729-26321-7-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 07/37] uim: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:58:57 -0000

WARNING:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
checking file scm/Makefile.am
Hunk #1 succeeded at 119 with fuzz 2 (offset 61 lines).

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../uim/uim/0001-Add-support-for-aarch64.patch       |  6 ++----
 .../uim/uim/0001-fix-bug-for-cross-compile.patch     |  6 ++----
 .../recipes-support/uim/uim/uim-module-manager.patch | 20 +++++++++++++++-----
 3 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-support/uim/uim/0001-Add-support-for-aarch64.patch b/meta-oe/recipes-support/uim/uim/0001-Add-support-for-aarch64.patch
index 4b12494..391b0e6 100644
--- a/meta-oe/recipes-support/uim/uim/0001-Add-support-for-aarch64.patch
+++ b/meta-oe/recipes-support/uim/uim/0001-Add-support-for-aarch64.patch
@@ -1,9 +1,10 @@
-From 24fd52cc45f7b5ff45afe072f5fbe66485df8c8e Mon Sep 17 00:00:00 2001
+From 82f44f53b9a9766c2ec816f237506beb953eb332 Mon Sep 17 00:00:00 2001
 From: Andreas Schwab <schwab@suse.de>
 Date: Wed, 29 Oct 2014 14:18:28 +0100
 Subject: [PATCH] Add support for aarch64
 
 * include/private/gcconfig.h: Add support for aarch64.
+
 ---
  sigscheme/libgcroots/include/private/gcconfig.h | 37 +++++++++++++++++++++++++
  1 file changed, 37 insertions(+)
@@ -77,6 +78,3 @@ index 4d42b03..0f13db6 100644
  # ifdef ARM32
  #   define CPP_WORDSZ 32
  #   define MACH_TYPE "ARM32"
--- 
-2.13.2
-
diff --git a/meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch b/meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch
index df82b07..0c8f02d 100644
--- a/meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch
+++ b/meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch
@@ -1,9 +1,10 @@
-From 2918196ba782dfa4401bdca917ad4de1910505e0 Mon Sep 17 00:00:00 2001
+From 08b5e51224ed95b1e76e99873b5f9f59840b0a74 Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@cn.fujitsu.com>
 Date: Fri, 21 Aug 2015 15:58:42 +0900
 Subject: [PATCH] fix bug for cross compile
 
 Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+
 ---
  configure.ac | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -23,6 +24,3 @@ index 9be879c..9249bfd 100644
      AC_CHECK_LIB(curses, tgetent, LIBEDIT_LIBS="-lcurses",
          [AC_CHECK_LIB(ncurses, tgetent, LIBEDIT_LIBS="-lncurses",
              AC_MSG_WARN("libedit needs libcurses or libncurses. disabled...")
--- 
-1.8.4.2
-
diff --git a/meta-oe/recipes-support/uim/uim/uim-module-manager.patch b/meta-oe/recipes-support/uim/uim/uim-module-manager.patch
index 8569bf3..3078af0 100644
--- a/meta-oe/recipes-support/uim/uim/uim-module-manager.patch
+++ b/meta-oe/recipes-support/uim/uim/uim-module-manager.patch
@@ -1,11 +1,21 @@
---- uim-1.1.0/scm/Makefile.am~	2006-06-09 10:46:12.000000000 +0900
-+++ uim-1.1.0/scm/Makefile.am	2006-06-19 23:00:15.620000000 +0900
-@@ -58,7 +58,7 @@
-   module_names += "scim"
+From d61495d3fb039842b82df44184c67eb3c1256136 Mon Sep 17 00:00:00 2001
+From: Bian Naimeng <biannm@cn.fujitsu.com>
+Date: Fri, 26 Jun 2015 12:57:48 +0900
+
+---
+ scm/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scm/Makefile.am b/scm/Makefile.am
+index 14d9393..e8a1083 100644
+--- a/scm/Makefile.am
++++ b/scm/Makefile.am
+@@ -119,7 +119,7 @@ if EXPAT
+   module_names += "yahoo-jp"
  endif
  
 -UIM_MODULE_MANAGER = $(top_builddir)/uim/uim-module-manager
 +UIM_MODULE_MANAGER = uim-module-manager
  UIM_MODULE_MANAGER_ENV = \
+         LIBUIM_SYSTEM_SCM_FILES=$(abs_top_srcdir)/sigscheme/lib \
          LIBUIM_SCM_FILES=$(abs_srcdir) \
-         LIBUIM_PLUGIN_LIB_DIR=$(abs_top_builddir)/uim/.libs
-- 
2.7.4


