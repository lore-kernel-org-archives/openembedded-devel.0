Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C2ABCAC5BB
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 18:45:52 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.16348.1759689951040009504
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 11:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YQqv8sVB;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-637e74e92easo6535110a12.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 11:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759689949; x=1760294749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NmjZli6NAqUkSJB0LcmOystle7WTv8rzZxfUtuAQfKw=;
        b=YQqv8sVBM0dJlHKBN7HC+6XRWsOdeFRhucmoNY0kqINMX28TB1qLo/BuK8lGLEwlSY
         x1VEV3BaTVYjrIO3xiP16hsfdpR9t7DV0B2bBz7QkZBQDRj3f02gWgh+1mSQ7HCTTwtR
         iZgrKXoojdUGsdS/rvgeN+qieGSikEW2u7a4fjaAYkPpg2JIXdqbPHfCLfrBgPN+1X3J
         6eXaKUyKXw0y9zA5uNv27LsIABx0J1tuhx53x8MkHctdAr0BgZTVu0Csa+g9eKblHxD9
         RNYv5GuGHI36slCg2Yfvr5dp6XOMGZowfabJt2Ydtzdx7aeqkkL/ib8mo2uG1d00fnPB
         /ksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759689949; x=1760294749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NmjZli6NAqUkSJB0LcmOystle7WTv8rzZxfUtuAQfKw=;
        b=WUc/xAMIjN0nhT6u6ShR3WsL+gN2ZLSApCiAaTHVX4PtKvU/i0uLAfwQDvoJedoH2Y
         MBfXA5H73Ko0+rPnX3Yyqkl2Vkx1Q4HdO6EAhskciu6/l/wbcXZYtTofodROl2q4DuiP
         ChNjPe9JYRuz7aK1YxI+BKI+W9niwWgHwKLm3s3EE8z99EBAxYk6PfCiUtCNPNynwLgI
         Ikd6DddyJx6yjEJtcxsEIqb1z7APi/zWHuPOV9SYLjZuS/2DtqMmIcPeYrDPhQPl3qF1
         OrGMXDCVo0qQo4ewrH7owdW4muT6h83XwKYlrCiHfTGZ3wQiuZBPlv91QmhbhbcQQxpD
         va4g==
X-Gm-Message-State: AOJu0YxjFs07xFsg0pfKsuocqszhrb0fVZsvohnjyDHS2D1NCPk2qqie
	DeNkZ/Pv7nfaf1mBOFsv8+zntRR9tI1DEOE1dfzxQoaq3jzQFeDY20PVaONZkQ==
X-Gm-Gg: ASbGncv9D9V6DHL8H5zU+AkbXL/lGZFZB5QbmHKNYcUCWF86+0FDEunuFLOtrxk9MyF
	H0ZdGJPk9BgzkBTtSSH5iQ12jvaZWmNMU7Zf94qNpG9GmUL+q1D8eFKNRApE8OqBd88xdkABE/D
	Nfv5gA+T0oHwObg48OeyZF/v0ssacu2GZOu983ES4yFOxmXHdgHTBlWoJx2eB7MCFJ/qK6FFPyk
	G2Jvqfot5P+IuyTr+WA8+YoxClkYQnf3l5ZyCYGMZdqjgSeaHtW9u6XK49XvBwb6HmNSGtRvnrq
	US0Z4mBw31Tp0V6omlN9T/3Gw/Ay9pyfxzZUuuv5QewPY/q0xKxr6LN+OyNuXfVk2KbiyXihKKC
	AgaAeMEnQFpcSPZ0SzTETPOKzQ8/VzL3aPH0eL4iKrFsI
X-Google-Smtp-Source: AGHT+IGpmZ1qCc27UeZDwijsGvZG6QSvzRbljoW0179Av0Vam5aCjLSfpSZubgSCdscDaCEN+DYoMQ==
X-Received: by 2002:a05:6402:3585:b0:638:3f72:1258 with SMTP id 4fb4d7f45d1cf-639348e6463mr12104453a12.16.1759689948593;
        Sun, 05 Oct 2025 11:45:48 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3aa9e4sm8470183a12.7.2025.10.05.11.45.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 11:45:48 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] emacs: upgrade 29.1 -> 30.2
Date: Sun,  5 Oct 2025 20:45:47 +0200
Message-ID: <20251005184547.1851183-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 18:45:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120256

Added a new patch to avoid unexporting some environment variables that are set
by the recipe explicitly, to avoid the following build error:

| Loading env...
| 'bootstrap-emacs' -batch --no-site-file --no-site-lisp -batch -l ja-dic-cnv \
|   -f batch-skkdic-convert -dir "../../sources/emacs-29.2/leim/../lisp/leim/ja-dic" --no-reduction "../../sources/emacs-29.2/leim/SKK-DIC/SKK-JISYO.L"
<...>
| Error: <RECIP_SYSROOT_NATIVE>/usr/share/emacs/29.2/etc/charsets: No such file or directory

Changelogs:
29.2 - 29.4: https://github.com/emacs-mirror/emacs/blob/master/etc/NEWS.29
30.1 - 30.2: https://github.com/emacs-mirror/emacs/blob/master/etc/NEWS.30

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../emacs/{emacs_29.1.bb => emacs_30.2.bb}    |  3 ++-
 ...oid-running-host-binaries-for-sanity.patch |  7 ++++---
 .../files/leim_dont-unexport-EMACSDATA.patch  | 19 +++++++++++++++++++
 ...acs-native-tools-for-cross-compiling.patch | 19 +++++++------------
 4 files changed, 32 insertions(+), 16 deletions(-)
 rename meta-oe/recipes-support/emacs/{emacs_29.1.bb => emacs_30.2.bb} (99%)
 create mode 100644 meta-oe/recipes-support/emacs/files/leim_dont-unexport-EMACSDATA.patch

diff --git a/meta-oe/recipes-support/emacs/emacs_29.1.bb b/meta-oe/recipes-support/emacs/emacs_30.2.bb
similarity index 99%
rename from meta-oe/recipes-support/emacs/emacs_29.1.bb
rename to meta-oe/recipes-support/emacs/emacs_30.2.bb
index 5cbe4551c0..6f9b8a485c 100644
--- a/meta-oe/recipes-support/emacs/emacs_29.1.bb
+++ b/meta-oe/recipes-support/emacs/emacs_30.2.bb
@@ -9,9 +9,10 @@ SRC_URI = "https://ftp.gnu.org/pub/gnu/emacs/emacs-${PV}.tar.xz \
 SRC_URI:append:class-target = " \
     file://use-emacs-native-tools-for-cross-compiling.patch \
     file://avoid-running-host-binaries-for-sanity.patch \
+    file://leim_dont-unexport-EMACSDATA.patch \
 "
 
-SRC_URI[sha256sum] = "d2f881a5cc231e2f5a03e86f4584b0438f83edd7598a09d24a21bd8d003e2e01"
+SRC_URI[sha256sum] = "b3f36f18a6dd2715713370166257de2fae01f9d38cfe878ced9b1e6ded5befd9"
 
 CVE_STATUS[CVE-2007-6109] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 
diff --git a/meta-oe/recipes-support/emacs/files/avoid-running-host-binaries-for-sanity.patch b/meta-oe/recipes-support/emacs/files/avoid-running-host-binaries-for-sanity.patch
index 719ee4bce9..bd23358f2a 100644
--- a/meta-oe/recipes-support/emacs/files/avoid-running-host-binaries-for-sanity.patch
+++ b/meta-oe/recipes-support/emacs/files/avoid-running-host-binaries-for-sanity.patch
@@ -12,14 +12,14 @@ Index: emacs-29.1/Makefile.in
 ===================================================================
 --- emacs-29.1.orig/Makefile.in
 +++ emacs-29.1/Makefile.in
-@@ -416,19 +416,10 @@ advice-on-failure:
+@@ -420,19 +420,11 @@
  	@exit ${exit-status}
  
  sanity-check:
 -	@[ -f .no-advice-on-failure ] && exit 0; true
--	@v=$$(src/emacs${EXEEXT} --batch --eval \
+-	@v=`src/emacs${EXEEXT} --batch -Q --eval \
 -	  '(progn (defun f (n) (if (= 0 n) 1 (* n (f (- n 1))))) (princ (f 10)))' \
--	  2> /dev/null); \
+-	  2> /dev/null`; \
 -	[ "X$$v" = "X3628800" ] && exit 0; \
 -	echo >&2 '***'; \
 -	echo >&2 '*** '"\"make ${make-target}\" succeeded, but Emacs is not functional."; \
@@ -33,6 +33,7 @@ Index: emacs-29.1/Makefile.in
 +# this is not going to work since it was (probably) built for a different architecture.
 +# Avoid calling target binaries from the host and simply assume our build artifacts work.
 +	exit 0
++
  
  .PHONY: all ${SUBDIR} blessmail epaths-force epaths-force-w32 epaths-force-ns-self-contained etc-emacsver
  
diff --git a/meta-oe/recipes-support/emacs/files/leim_dont-unexport-EMACSDATA.patch b/meta-oe/recipes-support/emacs/files/leim_dont-unexport-EMACSDATA.patch
new file mode 100644
index 0000000000..81dd2bde40
--- /dev/null
+++ b/meta-oe/recipes-support/emacs/files/leim_dont-unexport-EMACSDATA.patch
@@ -0,0 +1,19 @@
+Upstream unexports some environment variables to avoid contamination,
+however OE sets these variables specifically to help the build in the
+recipe, and they should not be unexported.
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+
+--- ./leim/Makefile.in.orig	2025-10-05 20:22:56.062508393 +0200
++++ ./leim/Makefile.in	2025-10-05 20:23:05.581046818 +0200
+@@ -42,7 +42,7 @@
+ -include ${top_builddir}/src/verbose.mk
+ 
+ # Prevent any settings in the user environment causing problems.
+-unexport EMACSDATA EMACSDOC EMACSLOADPATH EMACSPATH
++# unexport EMACSDATA EMACSDOC EMACSLOADPATH EMACSPATH
+ 
+ # Which Emacs to use to convert TIT files to Emacs Lisp files,
+ # and generate the file leim-list.el.
diff --git a/meta-oe/recipes-support/emacs/files/use-emacs-native-tools-for-cross-compiling.patch b/meta-oe/recipes-support/emacs/files/use-emacs-native-tools-for-cross-compiling.patch
index df5e4bd258..a1b6ea6ddf 100644
--- a/meta-oe/recipes-support/emacs/files/use-emacs-native-tools-for-cross-compiling.patch
+++ b/meta-oe/recipes-support/emacs/files/use-emacs-native-tools-for-cross-compiling.patch
@@ -18,12 +18,7 @@ Index: emacs-29.1/src/Makefile.in
 ===================================================================
 --- emacs-29.1.orig/src/Makefile.in
 +++ emacs-29.1/src/Makefile.in
-@@ -1,3 +1,4 @@
-+
- ### @configure_input@
- 
- # Copyright (C) 1985, 1987-1988, 1993-1995, 1999-2023 Free Software
-@@ -508,7 +509,7 @@ ifeq ($(CHECK_STRUCTS),true)
+@@ -542,7 +542,7 @@ ifeq ($(CHECK_STRUCTS),true)
  pdumper.o: dmpstruct.h
  endif
  dmpstruct.h: $(srcdir)/dmpstruct.awk
@@ -32,17 +27,17 @@ Index: emacs-29.1/src/Makefile.in
  	$(AM_V_GEN)POSIXLY_CORRECT=1 awk -f $(srcdir)/dmpstruct.awk \
  		$(dmpstruct_headers) > $@
  
-@@ -610,8 +611,7 @@ SYSTEM_TYPE = @SYSTEM_TYPE@
+@@ -651,8 +651,7 @@
  ## Strictly speaking, emacs does not depend directly on all of $lisp,
  ## since not all pieces are used on all platforms.  But DOC depends
  ## on all of $lisp, and emacs depends on DOC, so it is ok to use $lisp here.
 -emacs$(EXEEXT): temacs$(EXEEXT) \
--                lisp.mk $(etc)/DOC $(lisp) \
-+emacs$(EXEEXT): lisp.mk $(etc)/DOC $(lisp) \
+-                $(abs_top_builddir)/src/lisp.mk $(etc)/DOC $(lisp) \
++emacs$(EXEEXT): $(abs_top_builddir)/src/lisp.mk $(etc)/DOC $(lisp) \
                  $(lispsource)/international/charprop.el ${charsets}
  ifeq ($(SYSTEM_TYPE),cygwin)
  	find ${top_builddir} -name '*.eln' | rebase -v -O -T -
-@@ -654,7 +654,7 @@ endif
+@@ -695,7 +695,7 @@ endif
  $(etc)/DOC: $(libsrc)/make-docfile$(EXEEXT) $(doc_obj)
  	$(AM_V_GEN)$(MKDIR_P) $(etc)
  	$(AM_V_at)rm -f $(etc)/DOC
@@ -51,7 +46,7 @@ Index: emacs-29.1/src/Makefile.in
  	  $(SOME_MACHINE_OBJECTS) $(doc_obj) > $(etc)/DOC
  
  $(libsrc)/make-docfile$(EXEEXT) $(libsrc)/make-fingerprint$(EXEEXT): \
-@@ -671,7 +671,7 @@ buildobj.h: Makefile
+@@ -712,7 +712,7 @@ buildobj.h: Makefile
  GLOBAL_SOURCES = $(base_obj:.o=.c) $(NS_OBJC_OBJ:.o=.m)
  
  gl-stamp: $(libsrc)/make-docfile$(EXEEXT) $(GLOBAL_SOURCES)
@@ -60,7 +55,7 @@ Index: emacs-29.1/src/Makefile.in
  	$(AM_V_at)$(top_srcdir)/build-aux/move-if-change globals.tmp globals.h
  	$(AM_V_at)echo timestamp > $@
  
-@@ -685,7 +685,7 @@ $(LIBEGNU_ARCHIVE): $(config_h)
+@@ -726,7 +726,7 @@ $(LIBEGNU_ARCHIVE): $(config_h)
  	$(MAKE) -C $(dir $@) all
  
  ifeq ($(HAVE_PDUMPER),yes)

