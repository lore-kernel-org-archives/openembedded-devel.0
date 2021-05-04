Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.1915.1620107851927705204
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 May 2021 22:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qUHWOP4P;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id a11so4242847plh.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 May 2021 22:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5/G09E2ouovDvf2QB3tIkFAjac9YTv5DH+OF8zzH+n0=;
        b=qUHWOP4P4b98o1fZB14qmTwATrBXaVEO7PHmdXmmKGUi8euRoEz8PGBMp8bgx2+eQ4
         cqYM1ypsctF0cOZGIUDBDh3RUrelck9halbxzP83SPw2C0PyMu4X/DX2XYlrCmGi+9ix
         iGwrq5XIuFXm5e/N4KUa2xzkC94rHTbmT+WP1/hgda9efYD3qCjTpbw3VuF1hQrZ94V0
         hVLCXoIhNfRCj0wcuJhlul5OF1OfydImlCmaF0UtRxloNuksz8FytsdvaVuMWynvp8VT
         PfWu20BbCIzR4mDTGyzCw+mut8oGhhSQAa+1kq5Kg+AjETLZYywRdUnfyZbiyvdyLwmk
         4X4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5/G09E2ouovDvf2QB3tIkFAjac9YTv5DH+OF8zzH+n0=;
        b=mlXIxHpET0YxHn4zQi75sPMHmEFqpt+bpqhZK4QPajtfFNhCiyZQUDhxYHEx7jNNRf
         xwre4HHWfrJ2r43+Zxibg5RnoZyEpSx6OmqcT5CuTxaQ+49ywcqso0en3vLfsgr4gyZ5
         wLFYZMjGmk1SPtBMS7UUiveKRcbJRS2Ho2grrbaXvQf3R6JVNr2TRvckSokHZJV30tNy
         nDI690AG8A1N9/aSKkZFksYnRCZNQ/OtKz9jN1Pq8+/2xLqGXvXrjFkgT08XJlUVi8Zc
         Wi6ecM6/D2vRgrAZMGqwtrq8U8odDXYTZ86C8k6n8872m+Uh0l3e6sYHGKNojpePDWGb
         uhsg==
X-Gm-Message-State: AOAM530LHUKZ0MlP9H6IiTgjcvEj3EJeyYnaOM3fx/96e953/MxhtTBA
	zjgdVvMK2sxawuaFfNwqqyO2TmTqxvZIUg==
X-Google-Smtp-Source: ABdhPJxufvcs/+A0ym5Am7UekBe+/rMCVYBTFojXh0iSuVCbMy57M+O/OTbIgR31ss03KU95vizsGg==
X-Received: by 2002:a17:902:7c17:b029:ec:bfde:23e2 with SMTP id x23-20020a1709027c17b02900ecbfde23e2mr24734825pll.33.1620107851143;
        Mon, 03 May 2021 22:57:31 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id a16sm8310592pfc.37.2021.05.03.22.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 22:57:30 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] emacs: Do not use SIGSTKSZ
Date: Mon,  3 May 2021 22:57:28 -0700
Message-Id: <20210504055728.1871333-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs_27.2.bb   |  5 ++-
 .../emacs/files/emacs-glibc-2.34.patch        | 40 +++++++++++++++++++
 2 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/emacs/files/emacs-glibc-2.34.patch

diff --git a/meta-oe/recipes-support/emacs/emacs_27.2.bb b/meta-oe/recipes-support/emacs/emacs_27.2.bb
index e3157ec421..01629f4166 100644
--- a/meta-oe/recipes-support/emacs/emacs_27.2.bb
+++ b/meta-oe/recipes-support/emacs/emacs_27.2.bb
@@ -4,8 +4,9 @@ HOMEPAGE = "https://www.gnu.org/software/emacs/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
-SRC_URI = "https://ftp.gnu.org/pub/gnu/emacs/emacs-${PV}.tar.xz"
-
+SRC_URI = "https://ftp.gnu.org/pub/gnu/emacs/emacs-${PV}.tar.xz \
+           file://emacs-glibc-2.34.patch \
+          "
 SRC_URI_append_class-target = " file://usemake-docfile-native.patch"
 
 SRC_URI[sha256sum] = "b4a7cc4e78e63f378624e0919215b910af5bb2a0afc819fad298272e9f40c1b9"
diff --git a/meta-oe/recipes-support/emacs/files/emacs-glibc-2.34.patch b/meta-oe/recipes-support/emacs/files/emacs-glibc-2.34.patch
new file mode 100644
index 0000000000..6d764aa266
--- /dev/null
+++ b/meta-oe/recipes-support/emacs/files/emacs-glibc-2.34.patch
@@ -0,0 +1,40 @@
+From f97e07ea807cc6d38774a3888a15091b20645ac6 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Tue, 9 Mar 2021 11:22:59 -0800
+Subject: [PATCH] Port alternate signal stack to upcoming glibc 2.34
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* src/sysdep.c (sigsegv_stack): Increase size to 64 KiB and align
+it to max_align_t.  This copies from Gnulib’s c-stack.c, and works
+around a portability bug in draft glibc 2.34, which no longer
+defines SIGSTKSZ when _GNU_SOURCE is defined.
+---
+ src/sysdep.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/src/sysdep.c b/src/sysdep.c
+index 941b4e2fa2..24d8832b2f 100644
+--- a/src/sysdep.c
++++ b/src/sysdep.c
+@@ -1785,7 +1785,15 @@ handle_arith_signal (int sig)
+ 
+ /* Alternate stack used by SIGSEGV handler below.  */
+ 
+-static unsigned char sigsegv_stack[SIGSTKSZ];
++/* Storage for the alternate signal stack.
++   64 KiB is not too large for Emacs, and is large enough
++   for all known platforms.  Smaller sizes may run into trouble.
++   For example, libsigsegv 2.6 through 2.8 have a bug where some
++   architectures use more than the Linux default of an 8 KiB alternate
++   stack when deciding if a fault was caused by stack overflow.  */
++static max_align_t sigsegv_stack[(64 * 1024
++				  + sizeof (max_align_t) - 1)
++				 / sizeof (max_align_t)];
+ 
+ 
+ /* Return true if SIGINFO indicates a stack overflow.  */
+-- 
+2.29.2
+
-- 
2.31.1

