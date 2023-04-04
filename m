Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14DFAC6FD1D
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 20:18:24 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.113195.1680639503335015485
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Apr 2023 13:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nGLJaFjd;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id q102so31801180pjq.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Apr 2023 13:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680639502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Y6x1Lh88NMo1fQDBqIM5nXeQCnHmTvgBpRnA1s6FhI=;
        b=nGLJaFjdHFckPq6/+/m7dSvfmoMqSUaduQ9GpNKbIAaBdkJGHUxBjBPjWtU/ZvRSk9
         84Gx/KZprSy/ICES4llW39NAXrnAOzdYi+v+SslFu9Olj+ugZuDZtnpUbUPy6VPX3evq
         yzfF+FsDo49ACtgEWzhxvsLechMxXVo1qPPLkYajOlugpL3GlR/IX6/Pi2UUblQEMWKo
         natIPgKpiptzBzfKmybSmybSEFs/cosKCT53SzBnqxUxli4CD32MKm7DzWTIyT/9U/J7
         ZaWHCfqXYp6ss+D8JU2qaWJolOEgKUvSAMy7WrU7cuNu/OfoUMEcNIAx1yntnTDShyUn
         a3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680639502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Y6x1Lh88NMo1fQDBqIM5nXeQCnHmTvgBpRnA1s6FhI=;
        b=3ocOlIcRIpe5kxmcs6zlmY4th0OoguJ4649yXM2Bn+huF7geNtUFxhGxvW/Och9n+g
         3TmFPpg7juaY43yxgRAprdPtDI/rTlaDBhFodZ8ig63O8IPd7jZcWNXIzQiN95VVeVfy
         YsqrmW4lP0w3EaVfTv7xZsjH6jZd/s7VEu4R85Uwe4RIx4jcwQv1xHnKRlDOq9NCMd17
         9ltOQFN9tDID65FEwOpOkXJepLUpRT6z0lwF5XRq+q2+HFs9yv16se+rH0UPHqsUjdw2
         FBohVyFf5AHt03q5THEHviHNGfKb2ySlmAPdK109VULe7QJ4hpMS4/mIhCNupyhR11Xo
         Ri4A==
X-Gm-Message-State: AAQBX9corYrdB9O9EDXKyk79wZK7LoF8FFupL5xf3XiVybPrOikw/jwf
	z04c1V+OI3XLyrmFI55rROFPVB2sMVCCqA==
X-Google-Smtp-Source: AKy350ZTCcThgH4bh0XETn79RK1W/C+1i4k0+qk0ExVsN/NlcqYDZw606Wo+0F7gY5GFaMl+OIzfGQ==
X-Received: by 2002:a17:903:2890:b0:1a1:b65c:dea7 with SMTP id ku16-20020a170903289000b001a1b65cdea7mr3796243plb.47.1680639502261;
        Tue, 04 Apr 2023 13:18:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::26f8])
        by smtp.gmail.com with ESMTPSA id az6-20020a170902a58600b001a1deff606fsm8708751plb.125.2023.04.04.13.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 13:18:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libio-pty-perl: Fix build with musl/clang
Date: Tue,  4 Apr 2023 13:18:19 -0700
Message-Id: <20230404201819.3146413-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Apr 2023 20:18:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101950

recipe ptest results led to this issue where the tests would fail with
clang but not with gcc, the reason is that clang find more errors and
configure tests were failing. Fixes thusly, this also means that other
patch to fix musl build is no longer needed as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...hecks-more-robust-within-shared-libs.patch | 54 +++++++++++++++++++
 ...Tty.xs-Do-not-mark-strlcpy-as-static.patch | 45 ----------------
 .../perl/libio-pty-perl_1.17.bb               |  3 +-
 3 files changed, 55 insertions(+), 47 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/perl/libio-pty-perl/0001-Make-function-checks-more-robust-within-shared-libs.patch
 delete mode 100644 meta-oe/recipes-devtools/perl/libio-pty-perl/0001-Tty.xs-Do-not-mark-strlcpy-as-static.patch

diff --git a/meta-oe/recipes-devtools/perl/libio-pty-perl/0001-Make-function-checks-more-robust-within-shared-libs.patch b/meta-oe/recipes-devtools/perl/libio-pty-perl/0001-Make-function-checks-more-robust-within-shared-libs.patch
new file mode 100644
index 0000000000..13a9e3b884
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libio-pty-perl/0001-Make-function-checks-more-robust-within-shared-libs.patch
@@ -0,0 +1,54 @@
+From 1735a78561dbe139fd138caef2d44d81f5494fe7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 4 Apr 2023 12:28:11 -0700
+Subject: [PATCH] Make function checks more robust within shared libs
+
+Previous attempt to error at link like was with
+
+https://github.com/toddr/IO-Tty/commit/1747cdf9f98cfd3aada9bf6c09f9d46297e18a5e
+
+this however causes issues with newer clang where it detects
+the assignment as -Wint-conversion warning which is treated at error
+and builds with clang fail. So this is an attempt to instruct
+linker explicitly to error out if the symbol is not found during link
+time when building a shared library, this fixes both the problems
+as reported in
+
+https://github.com/toddr/IO-Tty/issues/23
+
+as well as
+
+https://github.com/toddr/IO-Tty/pull/33#issuecomment-1260147256
+
+Upstream-Status: Submitted [https://github.com/toddr/IO-Tty/pull/33]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.PL | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.PL b/Makefile.PL
+index eaf47e0..2e8338d 100644
+--- a/Makefile.PL
++++ b/Makefile.PL
+@@ -163,7 +163,8 @@ main ()
+ #if defined (__stub_$f) || defined (__stub___$f)
+ choke me
+ #else
+-f = $f ();
++f = $f;
++f();
+ #endif
+ 
+   ;
+@@ -173,7 +174,7 @@ ESQ
+ 
+   close(TST);
+   print "Looking for $f()" . "." x (13-length($f)) . " ";
+-  if (system("$cfg{'cc'} $flags $funcs{$f} functest_$f.c > functest_$f.log 2>&1")) {
++  if (system("$cfg{'cc'} $flags -Wl,--no-undefined $funcs{$f} functest_$f.c > functest_$f.log 2>&1")) {
+     print "not found.\n";
+   } else {
+     $define{"-DHAVE_\U$f"} = undef;
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-devtools/perl/libio-pty-perl/0001-Tty.xs-Do-not-mark-strlcpy-as-static.patch b/meta-oe/recipes-devtools/perl/libio-pty-perl/0001-Tty.xs-Do-not-mark-strlcpy-as-static.patch
deleted file mode 100644
index 07c7690fb8..0000000000
--- a/meta-oe/recipes-devtools/perl/libio-pty-perl/0001-Tty.xs-Do-not-mark-strlcpy-as-static.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From fae771aefc593a0ef798bc0c1e21b0524eb85e2d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 31 Aug 2022 20:32:35 -0700
-Subject: [PATCH] Tty.xs: Do not mark strlcpy as static
-
-Some libcs e.g. musl do not provide implementation of strlcpy but they
-do provide the signature in string.h, if we mark it static here then it
-conflicts with the libc define and compiler may warn/error
-
-Fixes
-Tty.xs:190:1: error: static declaration of 'strlcpy' follows non-static declaration
-strlcpy(                                                                                                                 ^
-/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libio-pty-perl/1.16-r0/recipe-sysroot/usr/include/string.h:86:8: note: previous declaration is here
-size_t strlcpy (char *, const char *, size_t);                                                                                  ^
-
-Upstream-Status: Submitted [https://github.com/toddr/IO-Tty/pull/33]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Tty.xs | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/Tty.xs b/Tty.xs
-index aa638f4..4bab39d 100644
---- a/Tty.xs
-+++ b/Tty.xs
-@@ -186,11 +186,11 @@ mysignal(int sig, mysig_t act)
-  * will be copied.  Always NUL terminates (unless siz == 0).
-  * Returns strlen(src); if retval >= siz, truncation occurred.
-  */
--static size_t
--strlcpy(dst, src, siz)
--        char *dst;
--        const char *src;
--        size_t siz;
-+size_t
-+strlcpy(
-+        char *dst,
-+        const char *src,
-+        size_t siz)
- {
-         register char *d = dst;
-         register const char *s = src;
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.17.bb b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.17.bb
index 684788f199..e5c1ec1c82 100644
--- a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.17.bb
+++ b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.17.bb
@@ -4,9 +4,8 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=12;md5=b2562f94907eeb42e8ce9d45f628e587"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/IO/IO-Tty-${PV}.tar.gz \
-           file://0001-Tty.xs-Do-not-mark-strlcpy-as-static.patch \
+           file://0001-Make-function-checks-more-robust-within-shared-libs.patch \
            "
-
 SRC_URI[sha256sum] = "a5f1a83020bc5b5dd6c1b570f48c7546e0a8f7fac10a068740b03925ad9e14e8"
 
 S = "${WORKDIR}/IO-Tty-${PV}"
-- 
2.40.0


