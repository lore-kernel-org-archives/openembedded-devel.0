Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A0BEC41513
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 06:39:43 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.34587.1715927978806664276
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 May 2024 23:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m0M1+Ce/;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6f472d550cbso941861b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 May 2024 23:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715927978; x=1716532778; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NAkgbrI7WSGYBhv8Cd+ykclglmExq5tSr/hj8klpSzg=;
        b=m0M1+Ce/u2onG2nXPGwsZGZbGTxS6gutX0PfAFSgMOJKA1zSxfEuH9/sKRFMvWHBaV
         rVBUhuai9h9PeVakmSaFqZlEpv3+atCjGADzH+TiqK73RKC3Zox/8UYM8vyd9wM9I7rZ
         UIJNswRVNE+OgCR/umSg1Ehjh1vRaq9mSIfaxM4J4SnB5CPVnGp5BmLDEV+QSpUOiXwN
         pcAqQukkF1/+kUSGp3zqHAslYKg8PV1FNwM3+Ll/VY/z4t1foC0o8BT5qdcd/Mlhpzvy
         I0Avse2rQKfQBMEAbHx1tOuptWQd+f+XgjLjFPMDH5EAyTyTO00jdat0S92+MvRMChnF
         b/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715927978; x=1716532778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NAkgbrI7WSGYBhv8Cd+ykclglmExq5tSr/hj8klpSzg=;
        b=dnY8FbM8DJeBWsaeh9e7LAYCg63ptjdEXLEh7q347LGT8jqkOnBI8a3aT+M6ryqQuq
         vWbVnCdMZhZjzIr1KqfdzvpuzGleTq8JhBXYuE873qooyJJ9lmhGj+n/HuEsLXo/JOu8
         HBhQc0cav61VQGlh1DJVtcyhm7jrNpOeaSPaj1PLVSe87fl8XEQHT/q19spd+IKhuv1s
         /Al4eNQDNPdUTezTj4RO3oh1mBlBg2Lfe1EoDUge90WM0Eyf2WOPBGBo9oG5u4lBBcPi
         4K9zPRP8sacmpWJ/jwZIodu+Ii5AjNhSxWUdc+qUCtTH/mpVwt1WU2O6Quk9dkOOCWa4
         TV3g==
X-Gm-Message-State: AOJu0YwSbI4HTzAgAkIbwjCfXZGvH81i4ZKFyiS8qAMKvWXlfH/fkh9i
	FnDSSwSuLozIMn0Nrgq+V0HyIKv83JY/3BninC1pQWYE1C36QbHaxiX690O57rc=
X-Google-Smtp-Source: AGHT+IFyUW5zQVuxyAaRv1qOSaJYDvStbyyzg//gxae9MbB9V1peUJNzdqRwHpopD+vPYo4RC9CItg==
X-Received: by 2002:a05:6a20:c891:b0:1a9:7afc:591c with SMTP id adf61e73a8af0-1afde08230bmr31344088637.10.1715927977955;
        Thu, 16 May 2024 23:39:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e372])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b62886b669sm16622575a91.24.2024.05.16.23.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 23:39:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] poke: Upgrade to 4.0
Date: Thu, 16 May 2024 23:39:32 -0700
Message-ID: <20240517063934.753527-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 May 2024 06:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110420

- Drop patches not needed anymore
- Package vim and emacs files into package of their own

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ck-for-Tcl-Tk-if-disable-gui-is-spec.patch | 45 ------------------
 ...nfig.in-avoit-host-poisoning-while-c.patch | 47 -------------------
 ...P2MAN-replace-by-true-when-cross-com.patch | 11 ++---
 .../poke/{poke_1.2.bb => poke_4.0.bb}         |  9 ++--
 4 files changed, 8 insertions(+), 104 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/poke/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
 delete mode 100644 meta-oe/recipes-devtools/poke/poke/0002-jitter-jitter-config.in-avoit-host-poisoning-while-c.patch
 rename meta-oe/recipes-devtools/poke/{poke_1.2.bb => poke_4.0.bb} (79%)

diff --git a/meta-oe/recipes-devtools/poke/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch b/meta-oe/recipes-devtools/poke/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
deleted file mode 100644
index a41f985eb8..0000000000
--- a/meta-oe/recipes-devtools/poke/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From cef3fc90f02ef4fc49515745194bac3d81a2265b Mon Sep 17 00:00:00 2001
-From: "Jose E. Marchesi" <jose.marchesi@oracle.com>
-Date: Fri, 30 Apr 2021 13:17:05 +0200
-Subject: [PATCH] build: do not check for Tcl/Tk if --disable-gui is specified
-
-2021-04-30  Jose E. Marchesi  <jemarch@gnu.org>
-
-	* configure.ac: Do not check for tcl/tk if --disable-gui is
-	specified at configure time.
-
-(cherry picked from commit 280a5e154287e43c0a40d9530a9cc658a7367a9c)
-[Romain: remove Changelog entry]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
-Upstream-Status: Pending
-
- configure.ac | 9 ++++++---
- 1 file changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index c7205513..c2f0760a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -214,12 +214,15 @@ fi
- dnl The GUI is optional, and depends on the availability of Tcl and
- dnl Tk.
- 
--POKE_TCLTK
--
- AC_ARG_ENABLE([gui],
-               AS_HELP_STRING([--enable-gui],
-                              [Enable the GUI (default is YES)]),
--              [gui_enabled=$enableval], [gui_enabled=$has_tcltk])
-+              [gui_enabled=$enableval], [gui_enabled=yes])
-+
-+if test "x$gui_enabled" = "xyes"; then
-+ POKE_TCLTK
-+ gui_enabled=$has_tcltk
-+fi
- 
- AM_CONDITIONAL([GUI], [test "x$gui_enabled" = "xyes"])
- 
--- 
-2.30.2
-
diff --git a/meta-oe/recipes-devtools/poke/poke/0002-jitter-jitter-config.in-avoit-host-poisoning-while-c.patch b/meta-oe/recipes-devtools/poke/poke/0002-jitter-jitter-config.in-avoit-host-poisoning-while-c.patch
deleted file mode 100644
index 660b19f514..0000000000
--- a/meta-oe/recipes-devtools/poke/poke/0002-jitter-jitter-config.in-avoit-host-poisoning-while-c.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From c37419e459bd5863534719fa50755174d0912e6d Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Fri, 30 Apr 2021 14:32:21 +0200
-Subject: [PATCH] jitter: jitter-config.in: avoit host poisoning while
- cross-compiling
-
-When jitter is bundled into another project (poke), jitter-config --cppflags
-return an unsafe path "-I /usr/include".
-
-In the context of Buildroot, such configuration script woulf be "fixed"
-after installation. But jitter-config is not installed by poke since it's
-build as static library and liked to poke.
-
-For now, patch jitter-config.in instead of jitter-config.in.m4sh since
-there is an issue while converting the M4sh m4sh script ( .in.m4sh )
-into a portable shell script ( .in ) ready to be processed by aclocal
-for @-substitutions.
-
-[1] https://git.buildroot.net/buildroot/tree/package/pkg-generic.mk?h=2021.02.1#n291
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
-Upstream-Status: Pending
-
- jitter/bin/jitter-config.in | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/jitter/bin/jitter-config.in b/jitter/bin/jitter-config.in
-index 5e124f0..af0ac9d 100644
---- a/jitter/bin/jitter-config.in
-+++ b/jitter/bin/jitter-config.in
-@@ -998,11 +998,7 @@ while test "$#" != "0"; do
-             append_to_output cflags;;
-         --cppflags)
-             no_option_argument
--            append_to_output cppflags
--            # Append a -I argument.  This is defined separately from the rest,
--            # as the installation prefix can be decided very late, at Jitter
--            # installation time.
--            output="$output -I $includedir";;
-+            append_to_output cppflags;;
-         --ldadd)
-             no_option_argument
-             append_to_output ldadd;;
--- 
-2.30.2
-
diff --git a/meta-oe/recipes-devtools/poke/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch b/meta-oe/recipes-devtools/poke/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
index ad2bf764d3..67384b73d4 100644
--- a/meta-oe/recipes-devtools/poke/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
+++ b/meta-oe/recipes-devtools/poke/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
@@ -11,18 +11,16 @@ Avoid:
       ./../poke/poke -o ./poke.1
 ../run: line 51: exec: :: not found
 
+Upstream-Status: Pending
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
-Upstream-Status: Pending
 
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/configure.ac b/configure.ac
-index c2f0760a..93769ef9 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -74,7 +74,7 @@ gl_LIBTEXTSTYLE_OPTIONAL([0.20.5])
+@@ -148,7 +148,7 @@ gl_LIBTEXTSTYLE_OPTIONAL([0.20.5])
  if test $cross_compiling = no; then
    AM_MISSING_PROG(HELP2MAN, help2man)
  else
@@ -30,7 +28,4 @@ index c2f0760a..93769ef9 100644
 +  HELP2MAN=true
  fi
  
- dnl recfix is part of the GNU recutils suite, and is used in cfg.mk to
--- 
-2.30.2
-
+ dnl The following Automake conditional is used in some Makefile.am files
diff --git a/meta-oe/recipes-devtools/poke/poke_1.2.bb b/meta-oe/recipes-devtools/poke/poke_4.0.bb
similarity index 79%
rename from meta-oe/recipes-devtools/poke/poke_1.2.bb
rename to meta-oe/recipes-devtools/poke/poke_4.0.bb
index af85d21705..9e68ba4ead 100644
--- a/meta-oe/recipes-devtools/poke/poke_1.2.bb
+++ b/meta-oe/recipes-devtools/poke/poke_4.0.bb
@@ -6,14 +6,12 @@ LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${GNU_MIRROR}/poke/poke-${PV}.tar.gz \
-          file://0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch \
-          file://0002-jitter-jitter-config.in-avoit-host-poisoning-while-c.patch \
           file://0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch \
           "
 
 DEPENDS = "flex-native bison-native bdwgc readline"
 
-SRC_URI[sha256sum] = "f61cf8da5b64c01a1359373725aad1ca257f35c1c9269e4d50dd0664183ddf62"
+SRC_URI[sha256sum] = "02bab22cb1fa6153a1b6a927c8bb3cd58d508543c144842a6d7ee74f19973a77"
 
 # poke does not support using out-of-tree builds
 inherit autotools-brokensep gettext pkgconfig
@@ -29,4 +27,7 @@ EXTRA_OECONF = "--disable-gui \
 
 PACKAGECONFIG[mi] = "--enable-mi,--disable-mi,json-c"
 
-FILES:${PN} += "${datadir}/emacs/site-lisp"
+PACKAGES =+ "${PN}-emacs ${PN}-vim"
+
+FILES:${PN}-emacs += "${datadir}/emacs/site-lisp"
+FILES:${PN}-vim += "${datadir}/vim/vimfiles"
-- 
2.45.1


