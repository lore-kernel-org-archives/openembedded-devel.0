Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3854.1794728986822314448
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:49:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=f5I3z5/Q;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37628596783so4144427eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728986; x=1795333786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cfZtfWuKipugwWuMxF8RoUVrvj2+IlWkE7KFAjrLLQ0=;
        b=f5I3z5/QvM1JYugtByqiRHoFHcRTZd3Uu+G2hd4HdjGhBHUWa5njFinlTJ4M5Gmmfw
         xVHoWAppdDmflykdpLsgInSZ37seNs18qTEOXEh7waXl3E/X1gKNgnO/1oVIg4mOtHwL
         FXJLPfBuVR5DVn+i34vpd0se7pjPzPUy9Qawwa2D3v06xTPFJQGulVkKXlUPJGdFpphj
         pew/5EP9ezDUxAFNMFlppGkDqaNEqZfU1Q8WU9IjNnmS++ObFN5jNHRPm0yJBnspQFRB
         brsBl/O57uWNOnmNRJt/ZYVWQVOafsFEvPMrKhDxzch0EBf+AV8rc14v1tKo0kChygjn
         i49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728986; x=1795333786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cfZtfWuKipugwWuMxF8RoUVrvj2+IlWkE7KFAjrLLQ0=;
        b=rFZB7VfzbV/C9lu5K5PNjFhhxV+/7oTcA85wGnuEPN9KhCCeAwNA2VWwwx9yz8ExTH
         t7wtkHeeciTvvg8vyoQ62+RNUbFovUXTcUHwjTb9QLmbrgw+Gmp0w4EBpjWUeiikCEdT
         yzJcOY5IofVGQauM6x2Rh51ywi6AWQU1QYLnRieoVkX4u8LPLUR/QaMDhy+rc5pbv5cv
         7PufVIDDVQgEVbKJxVx16Ln4r+tIna29az44Bi7OyGeJE9M4uWC7sSi7KCvyrC9C+rMt
         kwDrWhYbk5aqEdgQewkpFtq62qzhA7T5yejyagUTITnY3zb5wYfKPmGgml13N+CZNxvQ
         iNKw==
X-Gm-Message-State: APuU4Z/00B/PTwe9vCSLGnK0oNpQUMHC8yKEZPydspmnI/x7/KGDw5gz
	3indfuvaLQKh/f/Xuaak+HX9l+tDwWLGcwClr6KsBXWfbk/+Lrn/prA+EB9jX9vj
X-Gm-Gg: AYBFou2JykBF6jSQIRJIOCkTUI305Fa1OCze9ViIZBeOuBEt/JZF9iqofZNoEsK6z59
	KqSq7qaD9IfqBO64wWaeb4PYt1iHEsGrFHoK/SlUpU92r7SRDnVuEcC5a3ZrAtTtd0kRG1Anfq9
	RC3cNlgUL37JP2VYjVduqt1f0GasrhX9/e96Ibqht2idI+68BKrpNTI+8oOfkjEpaj7LgKp11YI
	j04JgjT4Eeopk10ISsyqdbbOnaMzJazS2dyHvW3pjqeohnqsEMvXCJWmfNZLSeePj9PHzplZ4v3
	goY6hp07mbGCliMwyVj1o6vXi5IPw2JcDGxlGrysprMMRSBHBDRY1QvRsqRXGsr2Q5A3/4977Td
	EwUworBXPjr+zrKADKPnIyMajYAFc7ufP2TkxRSrBwuh+d4WhPllQyQeS84UoeoU7L+us6QzGV3
	LTs/z63hOSJqe8gA8rM9eZIphEveGBBJ3S51nfH9fBIMtFa1i+qfJBsjnr8r5fOvCutGhqlG6B3
	k8nQpf4/tCKqD0mVTdVC4cbRt2c9o2AvZv7a1NtNhTZJa1K5v36Nz+0hNYqHLKMZBzWtSma9vTO
	YHm1guUg70ODRDX9CczhSkza0A9J0UL2MAreZTHQO3hWeSJNQuCzkzVAEhYxU1qlnjZbIVY4odX
	1cyM5Ez9du/VRLgF8oGVSZfm3KSWP359NeYoM4SaXLwGj3anphFxECPvlPl6nZLfvLhnA0ES+Qm
	qnxeiBywnrkd4NogJoxO5NKVkua43B898V9sVnHUXXKmcp4X+Y8f8epN3W0IwGOxHXmCqSfWwDK
	Q4+GK7FGgDBH9Yb1T5kQiP6BM4vHGt7z3XqNWlnwLj+fADsE0T1Fh/ulxDST6I12cjtoBMEsdRq
	hfMc
X-Received: by 2002:a05:693c:829b:10b0:366:703c:5ef8 with SMTP id 5a478bee46e88-379659c6845mr8631706eec.7.1794728986093;
        Sat, 14 Nov 2026 23:49:46 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:49:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 15/96] gengetopt: upgrade 2.23 -> 2.23.1
Date: Sat, 14 Nov 2026 23:47:53 -0800
Message-ID: <20261115074918.2932593-15-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132285
Content-Type: text/plain; charset="utf-8"

The bundled gnulib redeclares bsearch, memchr and other functions that
glibc 2.43+ defines as C23 qualifier-generic macros, which breaks the
native build with GCC 15. Backport the gnulib fix.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...d-glibc-C23-qualifier-generic-macros.patch | 121 ++++++++++++++++++
 ...{gengetopt_2.23.bb => gengetopt_2.23.1.bb} |   6 +-
 2 files changed, 125 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/gengetopt/gengetopt/0001-gnulib-Do-not-expand-glibc-C23-qualifier-generic-macros.patch
 rename meta-oe/recipes-support/gengetopt/{gengetopt_2.23.bb => gengetopt_2.23.1.bb} (74%)

diff --git a/meta-oe/recipes-support/gengetopt/gengetopt/0001-gnulib-Do-not-expand-glibc-C23-qualifier-generic-macros.patch b/meta-oe/recipes-support/gengetopt/gengetopt/0001-gnulib-Do-not-expand-glibc-C23-qualifier-generic-macros.patch
new file mode 100644
index 0000000000..2c3ab09006
--- /dev/null
+++ b/meta-oe/recipes-support/gengetopt/gengetopt/0001-gnulib-Do-not-expand-glibc-C23-qualifier-generic-macros.patch
@@ -0,0 +1,121 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 12 Nov 2026 00:00:00 -0800
+Subject: [PATCH] gnulib: Do not expand glibc C23 qualifier-generic macros
+
+glibc 2.43+ defines bsearch(), memchr() and friends as C23
+qualifier-generic macros, which breaks the ISO C N3322 redeclarations
+in the bundled gnulib stdlib.h and string.h when building with GCC 15:
+
+  ./stdlib.h:820:20: error: expected identifier or '(' before '_Generic'
+  ../gl/string.h:801:20: error: expected identifier or '(' before '_Generic'
+
+Parenthesize the function names so the macros are not expanded, as
+gnulib does with _GL_FUNCDECL_SYS_NAME.
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=df17f4f37ed3]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ gl/stdlib.in.h |  4 ++--
+ gl/string.in.h | 24 ++++++++++++------------
+ 2 files changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/gl/stdlib.in.h b/gl/stdlib.in.h
+index 1342db4..c973f9b 100644
+--- a/gl/stdlib.in.h
++++ b/gl/stdlib.in.h
+@@ -237,11 +237,11 @@ _GL_INLINE_HEADER_BEGIN
+ 
+ /* Declarations for ISO C N3322.  */
+ #if defined __GNUC__ && __GNUC__ >= 15 && !defined __clang__
+-_GL_EXTERN_C void *bsearch (const void *__key,
++_GL_EXTERN_C void *(bsearch) (const void *__key,
+                             const void *__base, size_t __nmemb, size_t __size,
+                             int (*__compare) (const void *, const void *))
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3) _GL_ARG_NONNULL ((5));
+-_GL_EXTERN_C void qsort (void *__base, size_t __nmemb, size_t __size,
++_GL_EXTERN_C void (qsort) (void *__base, size_t __nmemb, size_t __size,
+                          int (*__compare) (const void *, const void *))
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 2) _GL_ARG_NONNULL ((4));
+ #endif
+diff --git a/gl/string.in.h b/gl/string.in.h
+index e3d94b7..b87f1e0 100644
+--- a/gl/string.in.h
++++ b/gl/string.in.h
+@@ -214,64 +214,64 @@ _GL_EXTERN_C void free (void *);
+ 
+ /* Declarations for ISO C N3322.  */
+ #if defined __GNUC__ && __GNUC__ >= 15 && !defined __clang__
+-_GL_EXTERN_C void *memcpy (void *__dest, const void *__src, size_t __n)
++_GL_EXTERN_C void *(memcpy) (void *__dest, const void *__src, size_t __n)
+ # if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
+   _GL_ATTRIBUTE_NOTHROW
+ # endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
+-_GL_EXTERN_C void *memccpy (void *__dest, const void *__src, int __c, size_t __n)
++_GL_EXTERN_C void *(memccpy) (void *__dest, const void *__src, int __c, size_t __n)
+ # if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
+   _GL_ATTRIBUTE_NOTHROW
+ # endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 4)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 4);
+-_GL_EXTERN_C void *memmove (void *__dest, const void *__src, size_t __n)
++_GL_EXTERN_C void *(memmove) (void *__dest, const void *__src, size_t __n)
+ # if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
+   _GL_ATTRIBUTE_NOTHROW
+ # endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
+-_GL_EXTERN_C char *strncpy (char *__dest, const char *__src, size_t __n)
++_GL_EXTERN_C char *(strncpy) (char *__dest, const char *__src, size_t __n)
+ # if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
+   _GL_ATTRIBUTE_NOTHROW
+ # endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
+-_GL_EXTERN_C char *strndup (const char *__s, size_t __n)
++_GL_EXTERN_C char *(strndup) (const char *__s, size_t __n)
+ # if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
+   _GL_ATTRIBUTE_NOTHROW
+ # endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 2);
+-_GL_EXTERN_C char *strncat (char *__dest, const char *__src, size_t __n)
++_GL_EXTERN_C char *(strncat) (char *__dest, const char *__src, size_t __n)
+ # if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
+   _GL_ATTRIBUTE_NOTHROW
+ # endif
+   _GL_ARG_NONNULL ((1)) _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
+-_GL_EXTERN_C int memcmp (const void *__s1, const void *__s2, size_t __n)
++_GL_EXTERN_C int (memcmp) (const void *__s1, const void *__s2, size_t __n)
+ # if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
+   _GL_ATTRIBUTE_NOTHROW
+ # endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
+-_GL_EXTERN_C int strncmp (const char *__s1, const char *__s2, size_t __n)
++_GL_EXTERN_C int (strncmp) (const char *__s1, const char *__s2, size_t __n)
+ # if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
+   _GL_ATTRIBUTE_NOTHROW
+ # endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (2, 3);
+ # ifndef __cplusplus
+-_GL_EXTERN_C void *memchr (const void *__s, int __c, size_t __n)
++_GL_EXTERN_C void *(memchr) (const void *__s, int __c, size_t __n)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3);
+-_GL_EXTERN_C void *memrchr (const void *__s, int __c, size_t __n)
++_GL_EXTERN_C void *(memrchr) (const void *__s, int __c, size_t __n)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3);
+ # endif
+-_GL_EXTERN_C void *memset (void *__s, int __c, size_t __n)
++_GL_EXTERN_C void *(memset) (void *__s, int __c, size_t __n)
+ # if __GLIBC__ + (__GLIBC_MINOR__ >= 2) > 2
+   _GL_ATTRIBUTE_NOTHROW
+ # endif
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3);
+-_GL_EXTERN_C void *memset_explicit (void *__s, int __c, size_t __n)
++_GL_EXTERN_C void *(memset_explicit) (void *__s, int __c, size_t __n)
+   _GL_ATTRIBUTE_NONNULL_IF_NONZERO (1, 3);
+ #endif
+ 
diff --git a/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb b/meta-oe/recipes-support/gengetopt/gengetopt_2.23.1.bb
similarity index 74%
rename from meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb
rename to meta-oe/recipes-support/gengetopt/gengetopt_2.23.1.bb
index 01d85eb2d6..84dd1d5e14 100644
--- a/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb
+++ b/meta-oe/recipes-support/gengetopt/gengetopt_2.23.1.bb
@@ -6,9 +6,11 @@ HOMEPAGE = "https://www.gnu.org/software/gengetopt/gengetopt.html"
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ff95bfe019feaf92f524b73dd79e76eb"
 
-SRC_URI = "${GNU_MIRROR}/gengetopt/${BPN}-${PV}.tar.xz"
+SRC_URI = "${GNU_MIRROR}/gengetopt/${BPN}-${PV}.tar.xz \
+           file://0001-gnulib-Do-not-expand-glibc-C23-qualifier-generic-macros.patch \
+           "
 
-SRC_URI[sha256sum] = "b941aec9011864978dd7fdeb052b1943535824169d2aa2b0e7eae9ab807584ac"
+SRC_URI[sha256sum] = "3b9def48422bd45f78af95936200b7f9287369a3db76c4907c42fe10f4922ab6"
 
 # ftpmirror.gnu.org redirects to a random mirror, several of which serve a
 # non-Apache index the auto-derived regex cannot parse. Pin the check to the
