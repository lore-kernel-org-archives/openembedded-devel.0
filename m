Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0BCE97554F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:05 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id f15so3726445pfn.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6pHXIk9KZTiQO1hvCb4fphZG1n4TZO6UPz0ZuAOafHA=;
	b=Yd+f01THL/wVqtSYbLY7zmweon72yfiNYACnB2AHcyD7GXWzfC8gSzT5WDRKDabPrY
	iBEbrmJyaAXxEf17xIKbBTbMYV6ayDYxoTz8+2mjs2iWuLyk7zQWY8jJSEHPALEJyUrq
	rNeq135wFseV+DFlfpce5iPQ0p03p+3E5q5IddN6r5SFn1uh+/ndRL0dLy+k2jBw3XeY
	4Dh8O0UpREln57rDYCv1jfJ2pI2Fz7WBZYgN0IqCvpUxGeKU30NJqDxQsCjzvcoRu2QC
	DbGqMofNINmwbuxPm6YhpHYw1MX06TTpTKDAPTfdtquveHaU77H7EMOoM4XrsalpikZH
	k5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6pHXIk9KZTiQO1hvCb4fphZG1n4TZO6UPz0ZuAOafHA=;
	b=kfRKiUjACGDBfLeiLiFAC7wyYSPBJ2FNTbDVN1D5Eck7NREhbsqfgvBTqth28oYOAy
	zjXN4D3pQ2q3tVW+6mbR+Het6aktkbcBDNHiMk97rJE4dVuAEr5pM1b7nvL24JfhueZ2
	c+l8LmyRwXYRu8RtRBOB4qCq3J9YSwcDpi4HDTq8MMDyfBuPotBUnyiK2DX7H8FCz6M8
	M3UgMM+Iis+sva7gesiymEpLfKHixSt9Y0NDA6kuePWYWThkUlCfWGV7B7CGOtIuyqbz
	n98x72pmIRhxf+MnBp5nXSjeUGtIEutk+Pi9xqzglYQZZGxu4eiIjFSf3dH660jYn+DN
	FoMQ==
X-Gm-Message-State: AElRT7GELtktskBzyOtf9lx76hQxgYrzW5+sXu5u/mvRnXzhAce2yRkB
	t5ww97+1ZRjGdDPb+ZlLL+whlQ==
X-Google-Smtp-Source: AIpwx4/0dOAdseJ0BSF9HqB69lTrS/lJV01k8gIxjBOij/Xei8HHiPzcp9b/qc6V83Thic+aSTLD0g==
X-Received: by 10.99.96.79 with SMTP id u76mr21218693pgb.199.1523170746192;
	Sat, 07 Apr 2018 23:59:06 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:26 -0700
Message-Id: <1523170729-26321-14-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 14/37] rp-pppoe: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:59:05 -0000

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
checking file src/discovery.c
Hunk #1 succeeded at 472 with fuzz 1 (offset 96 lines)

among others

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-ppoe-Dont-include-linux-if_ether.h.patch  |  8 +++---
 ...0002-Enable-support-for-the-kernel-module.patch |  8 +++---
 .../rp-pppoe-3.12/configure.in-Error-fix.patch     | 10 +++-----
 .../rp-pppoe/rp-pppoe-3.12/configure.patch         | 16 +++++++++---
 .../rp-pppoe-3.12/configure_in_cross.patch         | 21 +++++++--------
 .../discard-use-of-dnl-in-Makefile.am.patch        | 10 +++-----
 .../rp-pppoe-3.12/dont-swallow-errors.patch        | 10 +++-----
 .../rp-pppoe-3.12/pppoe-src-restrictions.patch     | 19 +++++++++++---
 .../rp-pppoe/rp-pppoe-3.12/top-autoconf.patch      | 30 ++++++++++++++++------
 .../rp-pppoe/rp-pppoe-3.12/update-config.patch     | 21 ++++++++++-----
 10 files changed, 91 insertions(+), 62 deletions(-)

diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/0001-ppoe-Dont-include-linux-if_ether.h.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/0001-ppoe-Dont-include-linux-if_ether.h.patch
index 11356ce..7601f0d 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/0001-ppoe-Dont-include-linux-if_ether.h.patch
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/0001-ppoe-Dont-include-linux-if_ether.h.patch
@@ -1,11 +1,12 @@
-From 8d4d452d733bac8c5b55a90bddec8cc323cc9fa8 Mon Sep 17 00:00:00 2001
+From fdb64d21560bfdafeefccc7d20e105e4857faa99 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 28 Mar 2017 19:20:07 -0700
-Subject: [PATCH 1/2] ppoe: Dont include linux/if_ether.h
+Subject: [PATCH] ppoe: Dont include linux/if_ether.h
 
 Fixes build with musl
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/pppoe.h | 4 ----
  1 file changed, 4 deletions(-)
@@ -25,6 +26,3 @@ index ec067a0..281879c 100644
  #include <netinet/in.h>
  
  #ifdef HAVE_NETINET_IF_ETHER_H
--- 
-2.12.1
-
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/0002-Enable-support-for-the-kernel-module.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/0002-Enable-support-for-the-kernel-module.patch
index 139d1f0..2103b38 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/0002-Enable-support-for-the-kernel-module.patch
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/0002-Enable-support-for-the-kernel-module.patch
@@ -1,9 +1,10 @@
-From aca8473a516a8dc013866105da141fe1cd947474 Mon Sep 17 00:00:00 2001
+From 31b6eecd7e5ebfb9a37915f28823e5af9d1062b4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 28 Mar 2017 19:24:53 -0700
-Subject: [PATCH 2/2] Enable support for the kernel module
+Subject: [PATCH] Enable support for the kernel module
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/configure.in | 1 +
  1 file changed, 1 insertion(+)
@@ -20,6 +21,3 @@ index cae0976..951a042 100644
  ])
  
  dnl Checks for typedefs, structures, and compiler characteristics.
--- 
-2.12.1
-
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure.in-Error-fix.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure.in-Error-fix.patch
index 2661fd3d..bbd516f 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure.in-Error-fix.patch
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure.in-Error-fix.patch
@@ -1,4 +1,4 @@
-From 71956de46feef962dc0645af4c81ae074ca3b818 Mon Sep 17 00:00:00 2001
+From bdd20b7a584a20504dfabb409a41ee2b9ae41657 Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@cn.fujitsu.com>
 Date: Wed, 19 Aug 2015 13:52:57 +0900
 Subject: [PATCH] configure.in: Error fix.
@@ -9,15 +9,16 @@ No such file or directory #include <ac_nonexistent.h>
 Upstream-Status: pending
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+
 ---
  src/configure.in | 30 ------------------------------
  1 file changed, 30 deletions(-)
 
 diff --git a/src/configure.in b/src/configure.in
-index 0b23df5..31c7fbc 100644
+index 1714e69..cae0976 100644
 --- a/src/configure.in
 +++ b/src/configure.in
-@@ -193,36 +193,6 @@ if test "$GCC" = yes; then
+@@ -195,36 +195,6 @@ if test "$GCC" = yes; then
  	CFLAGS="$CFLAGS -fno-strict-aliasing -Wall -Wstrict-prototypes"
  fi
  
@@ -54,6 +55,3 @@ index 0b23df5..31c7fbc 100644
  if test "$rpppoe_cv_pack_bitfields" = "rev" ; then
  	AC_MSG_RESULT(reversed)
  	AC_DEFINE([PACK_BITFIELDS_REVERSED], [], [Reversed bitfields])
--- 
-1.8.4.2
-
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure.patch
index 1380ba4..be89280 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure.patch
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure.patch
@@ -1,7 +1,15 @@
-Index: rp-pppoe-3.8/configure.in
-===================================================================
---- rp-pppoe-3.8.orig/configure.in	2014-07-16 19:31:33.549991388 +0000
-+++ rp-pppoe-3.8/configure.in	2014-07-17 22:01:18.116590827 +0000
+From c96dda04ec024bdef2a15d374e5f8242e041cad4 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Fri, 18 Jul 2014 08:25:16 +0000
+
+---
+ configure.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index ac1a7e4..11b9f31 100644
+--- a/configure.in
++++ b/configure.in
 @@ -1,4 +1,4 @@
 -AC_INIT(src/pppoe.c)
 -AM_INIT_AUTOMAKE([rp-pppoe], [3.8])
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure_in_cross.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure_in_cross.patch
index 88cf7e6..3b94593 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure_in_cross.patch
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure_in_cross.patch
@@ -1,4 +1,4 @@
-From cab02076afb808a43c6ff3d7b1c64e71f5a1b397 Mon Sep 17 00:00:00 2001
+From 172907f31d64da4c3f289a439fd605d2ab51b24a Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@cn.fujitsu.com>
 Date: Wed, 19 Aug 2015 12:17:03 +0900
 Subject: [PATCH] configure in cross
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate [build system specific changes]
  1 file changed, 16 insertions(+), 50 deletions(-)
 
 diff --git a/src/configure.in b/src/configure.in
-index e194295..82d64d6 100644
+index 90a07df..1d30243 100644
 --- a/src/configure.in
 +++ b/src/configure.in
 @@ -5,6 +5,13 @@ AC_INIT(pppoe.c)
@@ -40,7 +40,7 @@ index e194295..82d64d6 100644
  fi
  
  dnl Check for N_HDLC line discipline
-@@ -56,7 +63,7 @@ AC_TRY_COMPILE([#include <linux/termios.h>],
+@@ -58,7 +65,7 @@ AC_TRY_COMPILE([
  	ac_cv_n_hdlc=no)
  AC_MSG_RESULT($ac_cv_n_hdlc)
  if test "$ac_cv_n_hdlc" = yes ; then
@@ -49,7 +49,7 @@ index e194295..82d64d6 100644
  fi
  
  AC_ARG_ENABLE(plugin, [  --enable-plugin=pppd_src_path   build pppd plugin], ac_cv_pluginpath=$enableval, ac_cv_pluginpath=no)
-@@ -104,7 +111,7 @@ PPPD_INCDIR=""
+@@ -106,7 +113,7 @@ PPPD_INCDIR=""
  if test "$ac_cv_header_linux_if_pppox_h" = yes ; then
  	if test "$ac_cv_pluginpath" != no ; then
  		LINUX_KERNELMODE_PLUGIN=rp-pppoe.so
@@ -58,7 +58,7 @@ index e194295..82d64d6 100644
  		PPPD_INCDIR=$ac_cv_pluginpath
  	fi
  fi
-@@ -114,7 +121,7 @@ if test "$PPPD_INCDIR" = "" ; then
+@@ -116,7 +123,7 @@ if test "$PPPD_INCDIR" = "" ; then
  fi
  
  if test "$ac_cv_debugging" = "yes" ; then
@@ -67,7 +67,7 @@ index e194295..82d64d6 100644
  fi
  
  AC_SUBST(LINUX_KERNELMODE_PLUGIN)
-@@ -140,15 +147,8 @@ AC_CHECK_SIZEOF(unsigned short)
+@@ -142,15 +149,8 @@ AC_CHECK_SIZEOF(unsigned short)
  AC_CHECK_SIZEOF(unsigned int)
  AC_CHECK_SIZEOF(unsigned long)
  
@@ -84,7 +84,7 @@ index e194295..82d64d6 100644
  
  dnl Check for Linux-specific kernel support for PPPoE
  AC_MSG_CHECKING(for Linux 2.4.X kernel-mode PPPoE support)
-@@ -193,44 +193,8 @@ if test "$GCC" = yes; then
+@@ -195,44 +195,8 @@ if test "$GCC" = yes; then
  	CFLAGS="$CFLAGS -fno-strict-aliasing -Wall -Wstrict-prototypes"
  fi
  
@@ -130,7 +130,7 @@ index e194295..82d64d6 100644
  if test "${rpppoe_cv_pack_bitfields+set}" != set ; then
  AC_TRY_RUN([
  union foo {
-@@ -257,10 +221,11 @@ main(void)
+@@ -259,10 +223,11 @@ main(void)
  }], rpppoe_cv_pack_bitfields=normal, rpppoe_cv_pack_bitfields=rev,
  $ECHO "no defaults for cross-compiling"; exit 0)
  fi
@@ -143,7 +143,7 @@ index e194295..82d64d6 100644
  else
  	AC_MSG_RESULT(normal)
  fi
-@@ -324,6 +289,7 @@ AC_SUBST(PPPOE_SERVER_DEPS)
+@@ -326,6 +291,7 @@ AC_SUBST(PPPOE_SERVER_DEPS)
  AC_SUBST(RDYNAMIC)
  AC_SUBST(LIBEVENT)
  AC_SUBST(ECHO)
@@ -151,6 +151,3 @@ index e194295..82d64d6 100644
  AC_SUBST(LDFLAGS)
  
  datadir_evaluated=`eval echo $datadir`
--- 
-1.8.4.2
-
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/discard-use-of-dnl-in-Makefile.am.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/discard-use-of-dnl-in-Makefile.am.patch
index 8b78864..9801f6e 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/discard-use-of-dnl-in-Makefile.am.patch
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/discard-use-of-dnl-in-Makefile.am.patch
@@ -1,4 +1,4 @@
-From 611c9fe719c5aa264a2ad2eb920cf4522ae2ddec Mon Sep 17 00:00:00 2001
+From f658181c58347c3e2b0ee4f0a6a3d19162921471 Mon Sep 17 00:00:00 2001
 From: Ting Liu <b28495@freescale.com>
 Date: Tue, 12 Jun 2012 14:26:16 -0400
 Subject: [PATCH] discard use of dnl in Makefile.am
@@ -7,9 +7,10 @@ Since Makefile.am is not processed by m4, but by automake, 'dnl' does
 not introduce a comment.
 
 Signed-off-by: Ting Liu <b28495@freescale.com>
+
 ---
- Makefile.am |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
 index eff6977..3091c33 100644
@@ -22,6 +23,3 @@ index eff6977..3091c33 100644
 -dnl AM_CFLAGS = -Wall -DDEBUG
 +##dnl AM_CFLAGS = -Wall -DDEBUG
  SUBDIRS = src
--- 
-1.7.6.5
-
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/dont-swallow-errors.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/dont-swallow-errors.patch
index f61337f..8a85788 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/dont-swallow-errors.patch
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/dont-swallow-errors.patch
@@ -1,4 +1,4 @@
-From bbdadb803b19f002e76e7bb5ce3faf770dd7c413 Mon Sep 17 00:00:00 2001
+From a9a7322273c51882af58c35ba288a0fae00ba841 Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@cn.fujitsu.com>
 Date: Wed, 19 Aug 2015 12:33:41 +0900
 Subject: [PATCH] don't swallow errors
@@ -6,15 +6,16 @@ Subject: [PATCH] don't swallow errors
 Further fixup to the configure scripts to not swallow errors
 
 Upstream-Status: Pending
+
 ---
  src/configure.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/configure.in b/src/configure.in
-index 82d64d6..0b23df5 100644
+index 1d30243..1714e69 100644
 --- a/src/configure.in
 +++ b/src/configure.in
-@@ -219,7 +219,7 @@ main(void)
+@@ -221,7 +221,7 @@ main(void)
  	return 2;
      }
  }], rpppoe_cv_pack_bitfields=normal, rpppoe_cv_pack_bitfields=rev,
@@ -23,6 +24,3 @@ index 82d64d6..0b23df5 100644
  fi
  ])
  
--- 
-1.8.4.2
-
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-src-restrictions.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-src-restrictions.patch
index bcf4d11..03697ff 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-src-restrictions.patch
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-src-restrictions.patch
@@ -1,3 +1,8 @@
+From a6a85ec5c85cbd3c86743b6e2fa391198869bff8 Mon Sep 17 00:00:00 2001
+From: Tom Rini <tom_rini@mentor.com>
+Date: Wed, 27 Jul 2011 03:46:52 +0000
+Subject: [PATCH] rp-pppoe: Port from oe.dev
+
 Relax restrictions on the PPPoE src address, as per debian bug
 293811:
 
@@ -5,9 +10,15 @@ Relax restrictions on the PPPoE src address, as per debian bug
 
 Upstream-Status: Inappropriate [Backport from Debian]
 
---- rp-pppoe-3.8.orig/src/discovery.c
-+++ rp-pppoe-3.8/src/discovery.c
-@@ -376,8 +376,8 @@
+---
+ src/discovery.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/discovery.c b/src/discovery.c
+index 7ee259d..5213a37 100644
+--- a/src/discovery.c
++++ b/src/discovery.c
+@@ -472,8 +472,8 @@ waitForPADO(PPPoEConnection *conn, int timeout)
  	if (!packetIsForMe(conn, &packet)) continue;
  
  	if (packet.code == CODE_PADO) {
@@ -17,4 +28,4 @@ Upstream-Status: Inappropriate [Backport from Debian]
 +		printErr("Ignoring broadcast PADO packet");
  		continue;
  	    }
- 	    parsePacket(&packet, parsePADOTags, &pc);
+ #ifdef PLUGIN
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/top-autoconf.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/top-autoconf.patch
index 4fe73d0..f64da4f 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/top-autoconf.patch
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/top-autoconf.patch
@@ -1,3 +1,8 @@
+From 0b62f71eb5d44d4a57103566ba58022b6304fa4f Mon Sep 17 00:00:00 2001
+From: Tom Rini <tom_rini@mentor.com>
+Date: Wed, 27 Jul 2011 03:46:52 +0000
+Subject: [PATCH] rp-pppoe: Port from oe.dev
+
 The autoconf stuff is all in a subdirectory, which is rather annoying
 as OE expects patches to be applied and autoconf stuff to be done in
 S. This adds enough autoconf at the top level to allow it to be
@@ -6,20 +11,29 @@ directory.
 
 Upstream-Status: Inappropriate [build system specific change]
 
-Index: rp-pppoe-3.8/Makefile.am
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ rp-pppoe-3.8/Makefile.am	2007-06-08 15:58:16.000000000 +1000
+---
+ Makefile.am  | 5 +++++
+ configure.in | 4 ++++
+ 2 files changed, 9 insertions(+)
+ create mode 100644 Makefile.am
+ create mode 100644 configure.in
+
+diff --git a/Makefile.am b/Makefile.am
+new file mode 100644
+index 0000000..eff6977
+--- /dev/null
++++ b/Makefile.am
 @@ -0,0 +1,5 @@
 +PACKAGE = rp-pppoe
 +VERSION = 3.8
 +
 +dnl AM_CFLAGS = -Wall -DDEBUG
 +SUBDIRS = src
-Index: rp-pppoe-3.8/configure.in
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ rp-pppoe-3.8/configure.in	2007-06-08 15:58:16.000000000 +1000
+diff --git a/configure.in b/configure.in
+new file mode 100644
+index 0000000..ac1a7e4
+--- /dev/null
++++ b/configure.in
 @@ -0,0 +1,4 @@
 +AC_INIT(src/pppoe.c)
 +AM_INIT_AUTOMAKE([rp-pppoe], [3.8])
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/update-config.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/update-config.patch
index 42a3bc6..c759e09 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/update-config.patch
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/update-config.patch
@@ -1,3 +1,8 @@
+From 4d34e0d7d790ec41b0afb731c7dc1b1ee90dd377 Mon Sep 17 00:00:00 2001
+From: Tom Rini <tom_rini@mentor.com>
+Date: Wed, 27 Jul 2011 03:46:52 +0000
+Subject: [PATCH] rp-pppoe: Port from oe.dev
+
 Set the timeout to 0 since we don't want pppoe to try reconnecting,
 we want whatever is calling it to reconnect. Lots of odd things
 happen when you have pppoe retrying itself.
@@ -8,11 +13,15 @@ ppp looks, so that's what we do here.
 
 Upstream-Status: Inappropriate [configuration]
 
-Index: rp-pppoe-3.8/configs/pppoe.conf
-===================================================================
---- rp-pppoe-3.8.orig/configs/pppoe.conf	2006-04-03 00:29:41.000000000 +1000
-+++ rp-pppoe-3.8/configs/pppoe.conf	2007-06-08 16:02:47.000000000 +1000
-@@ -66,7 +66,7 @@
+---
+ configs/pppoe.conf | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configs/pppoe.conf b/configs/pppoe.conf
+index c222b2f..65618a5 100644
+--- a/configs/pppoe.conf
++++ b/configs/pppoe.conf
+@@ -66,7 +66,7 @@ DEFAULTROUTE=yes
  # to connect forever after pppoe-start is called.  Otherwise, it will
  # give out after CONNECT_TIMEOUT seconds and will not attempt to
  # connect again, making it impossible to reach.
@@ -21,7 +30,7 @@ Index: rp-pppoe-3.8/configs/pppoe.conf
  
  # How often in seconds pppoe-start polls to check if link is up
  CONNECT_POLL=2
-@@ -115,7 +115,7 @@
+@@ -115,7 +115,7 @@ PPPOE_TIMEOUT=80
  FIREWALL=NONE
  
  # Linux kernel-mode plugin for pppd.  If you want to try the kernel-mode
-- 
2.7.4


