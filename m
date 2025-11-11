Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E1A1CCF9E3
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 04:31:45 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10238.1762835495469788121
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 20:31:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FU/o1jZR;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso3287550b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 20:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762835495; x=1763440295; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2S6ON5jfyk1Lz2B0D+WIiy6B/Ri578mpHXAsFfWBtP0=;
        b=FU/o1jZRMl/MOdCGkWgiXqBc9xF6GPIFTDHZC+Ee5InZvOVdZDoQL7n5PU/NI4mL2/
         G11V80Al8PYnTdod57xEOSCqC5uk/qFLSXDL4aHJMG5XP7Kkcs1j/h04LtADMmuj3tAl
         A5dac5Sm663sJiryQHrXddKpBo/PM3A6a/GpRQ19LnSsWAsd7ECbwiGhGFh7/zddwq3x
         f410BkNaFNZ6OBc7wnmMtUZ/k+U1vO8f7UI2e+7kw0uO0a1YwSViV06qz+5uM0I0EpLe
         3cqDMG4LaodgaC0kB3EVD7cY7tV3wTBKs37g7glN29IPHW6W7eUN03IL5OqWXzuB0QEH
         eZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762835495; x=1763440295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2S6ON5jfyk1Lz2B0D+WIiy6B/Ri578mpHXAsFfWBtP0=;
        b=gw3YtonMCY6CBuCjcNfvFVl45/moXmHbK3QfJXFWHyt3DyCzXNX3acETjfTw5J/4eY
         5lG4F61BgLf2pMCycBkf4b02Q4XW/yWsahiOB1222Th4xs/VhzyjwLKgJ33UTkj+aWCm
         k5kBFtrjPkImu/a8Ce7zy9iMOk76lDMKAHEqX30RnWwL1Cm/3DPIa98hVkhI2V+YHOwz
         rkl3S2Iq+MQTovs6kzTiyphHHRNSkGy3Pcs192/mFY3J4ouJxhOyJmBi7+buUbyvZkGD
         33/bqXrMp8ejZvQYaR7YSS+w7vPNYno0Kya8y2JwL/LpEg6kghNaXk73qmxZh9Ow4/Ii
         TrNQ==
X-Gm-Message-State: AOJu0Yx22N4BgU0fkYS39oM1aODWxGN13lHbxD3PINANiWu8kE7gtoUw
	Yra/AmhQS+1clplwSoHqRpDKwzJjbOJVv2cGu0R3EDfYRHuH2ufElj/bMhHSvvza1J0=
X-Gm-Gg: ASbGncvLBihHX1dfQEZ2tj60Gdy0CLW3QIVKmmDSNXSo1eqlvxEwvCoYZA+z2QZIi7Z
	PVX8gBVg4aljNr720USctRpgRUdKknDyXUUbhuz5HlUgow07U77dgvJkKhSfCHW2uuu9eFpaqM0
	vyZHMscMWKwgEXuf0mqaTvVIFpuaC3nshlTNfBueaKGWJx4dxPjOd2tt0tZTQnbuTHI+fC+B3Px
	PqE/N6s/YT1cOcbFxxOcmsnagCL7HZSJalfIzCffJliPuXH/1LrC3jhSaKIU+jKPj1aYEY+YY8z
	mEmaFLcSvHtXcMk13IYilbIy53UEHQblmcFIhyOZJSsjpv9nytvdxVBMvvLnmjEqIxmsWyx/3Se
	UCWLzB7ssUiR1cvCfSAuZoE2vI+t0IjiylOP9eYJUCBzaH9kSF0E5+uuJPsfPfCogpInoyYChAZ
	/huqn7ChRwY3x8dcd5pVVe+DSMhlgyoCmnjY9A1AXOTW++6i/Kk7MH6+OR2IHzbWGR1x6Gf72E
X-Google-Smtp-Source: AGHT+IEjG9mCO4a1Kh83cprKCeJRER+VgQU+eWcAt3ZD9LO+TrJJOW6o/F8vYu+RKVVlhWFVS31MyQ==
X-Received: by 2002:a17:902:e847:b0:297:db6a:a82f with SMTP id d9443c01a7336-297e5666d10mr131724245ad.24.1762835494527;
        Mon, 10 Nov 2025 20:31:34 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651ca1b8csm167771415ad.85.2025.11.10.20.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 20:31:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/4] libldb: Fix build with glibc 2.43
Date: Mon, 10 Nov 2025 20:31:27 -0800
Message-ID: <20251111043128.3063095-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111043128.3063095-1-raj.khem@gmail.com>
References: <20251111043128.3063095-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 04:31:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121477

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libldb/libldb/c23_memset_explicit.patch   | 248 ++++++++++++++++++
 .../recipes-support/libldb/libldb_2.8.2.bb    |   1 +
 2 files changed, 249 insertions(+)
 create mode 100644 meta-networking/recipes-support/libldb/libldb/c23_memset_explicit.patch

diff --git a/meta-networking/recipes-support/libldb/libldb/c23_memset_explicit.patch b/meta-networking/recipes-support/libldb/libldb/c23_memset_explicit.patch
new file mode 100644
index 0000000000..bd817d8cf5
--- /dev/null
+++ b/meta-networking/recipes-support/libldb/libldb/c23_memset_explicit.patch
@@ -0,0 +1,248 @@
+C23 introduced memset_explicit with the same parameters as
+memset (3 args). New glibc implements it, so the symbol now
+exists in the global namespace with that prototype, causing
+“too many arguments” when your code passes 4 args.
+
+Provide a compatibility macro to address the problem
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/lib/replace/replace.c
++++ b/lib/replace/replace.c
+@@ -1,4 +1,4 @@
+-/*
++/*
+    Unix SMB/CIFS implementation.
+    replacement routines for broken systems
+    Copyright (C) Andrew Tridgell 1992-1998
+@@ -8,7 +8,7 @@
+      ** NOTE! The following LGPL license applies to the replace
+      ** library. This does NOT imply that all of Samba is released
+      ** under the LGPL
+-
++
+    This library is free software; you can redistribute it and/or
+    modify it under the terms of the GNU Lesser General Public
+    License as published by the Free Software Foundation; either
+@@ -44,6 +44,18 @@
+ void replace_dummy(void);
+ void replace_dummy(void) {}
+
++#if defined(HAVE_MEMSET_EXPLICIT)
++#  define LDB_MEMSET_EXPLICIT(dest, destsz, ch, n) memset_explicit((dest),(ch),(n))
++#elif defined(HAVE_MEMSET_S)
++#  define LDB_MEMSET_EXPLICIT(dest, destsz, ch, n) memset_s((dest),(destsz),(ch),(n))
++#else
++#  define LDB_MEMSET_EXPLICIT(dest, destsz, ch, n) do { \
++        volatile unsigned char *p = (volatile unsigned char*)(dest); \
++        size_t _N = (n); unsigned char _CH = (unsigned char)(ch); \
++        for (size_t _i = 0; _i < _N; ++_i) p[_i] = _CH; \
++    } while (0)
++#endif
++
+ #ifndef HAVE_FTRUNCATE
+  /*******************************************************************
+ ftruncate for operating systems that don't have it
+@@ -91,7 +103,7 @@ size_t rep_strlcpy(char *d, const char *
+ #endif
+
+ #ifndef HAVE_STRLCAT
+-/* like strncat but does not 0 fill the buffer and always null
++/* like strncat but does not 0 fill the buffer and always null
+    terminates. bufsize is the length of the buffer, which should
+    be one more than the maximum resulting string length */
+ size_t rep_strlcat(char *d, const char *s, size_t bufsize)
+@@ -116,7 +128,7 @@ size_t rep_strlcat(char *d, const char *
+
+ #ifndef HAVE_MKTIME
+ /*******************************************************************
+-a mktime() replacement for those who don't have it - contributed by
++a mktime() replacement for those who don't have it - contributed by
+ C.A. Lademann <cal@zls.com>
+ Corrections by richard.kettlewell@kewill.com
+ ********************************************************************/
+@@ -137,7 +149,7 @@ time_t rep_mktime(struct tm *t)
+     return((time_t)-1);
+
+   n = t->tm_year + 1900 - 1;
+-  epoch = (t->tm_year - 70) * YEAR +
++  epoch = (t->tm_year - 70) * YEAR +
+     ((n / 4 - n / 100 + n / 400) - (1969 / 4 - 1969 / 100 + 1969 / 400)) * DAY;
+
+   y = t->tm_year + 1900;
+@@ -147,7 +159,7 @@ time_t rep_mktime(struct tm *t)
+     epoch += mon [m] * DAY;
+     if(m == 1 && y % 4 == 0 && (y % 100 != 0 || y % 400 == 0))
+       epoch += DAY;
+-
++
+     if(++m > 11) {
+       m = 0;
+       y++;
+@@ -156,7 +168,7 @@ time_t rep_mktime(struct tm *t)
+
+   epoch += (t->tm_mday - 1) * DAY;
+   epoch += t->tm_hour * HOUR + t->tm_min * MINUTE + t->tm_sec;
+-
++
+   if((u = localtime(&epoch)) != NULL) {
+     t->tm_sec = u->tm_sec;
+     t->tm_min = u->tm_min;
+@@ -176,7 +188,7 @@ time_t rep_mktime(struct tm *t)
+
+ #ifndef HAVE_INITGROUPS
+ /****************************************************************************
+- some systems don't have an initgroups call
++ some systems don't have an initgroups call
+ ****************************************************************************/
+ int rep_initgroups(char *name, gid_t id)
+ {
+@@ -194,7 +206,7 @@ int rep_initgroups(char *name, gid_t id)
+ 	int    i,j;
+ 	struct group *g;
+ 	char   *gr;
+-
++
+ 	if((grouplst = malloc(sizeof(gid_t) * max_gr)) == NULL) {
+ 		errno = ENOMEM;
+ 		return -1;
+@@ -250,9 +262,9 @@ void *rep_memmove(void *dest,const void
+
+ 	if (d < s) {
+ 		/* we can forward copy */
+-		if (s-d >= sizeof(int) &&
+-		    !(s%sizeof(int)) &&
+-		    !(d%sizeof(int)) &&
++		if (s-d >= sizeof(int) &&
++		    !(s%sizeof(int)) &&
++		    !(d%sizeof(int)) &&
+ 		    !(size%sizeof(int))) {
+ 			/* do it all as words */
+ 			int *idest = (int *)dest;
+@@ -267,9 +279,9 @@ void *rep_memmove(void *dest,const void
+ 		}
+ 	} else {
+ 		/* must backward copy */
+-		if (d-s >= sizeof(int) &&
+-		    !(s%sizeof(int)) &&
+-		    !(d%sizeof(int)) &&
++		if (d-s >= sizeof(int) &&
++		    !(s%sizeof(int)) &&
++		    !(d%sizeof(int)) &&
+ 		    !(size%sizeof(int))) {
+ 			/* do it all as words */
+ 			int *idest = (int *)dest;
+@@ -281,7 +293,7 @@ void *rep_memmove(void *dest,const void
+ 			char *cdest = (char *)dest;
+ 			char *csrc = (char *)src;
+ 			for (i=size-1;i>=0;i--) cdest[i] = csrc[i];
+-		}
++		}
+ 	}
+ 	return(dest);
+ }
+@@ -334,16 +346,16 @@ void rep_vsyslog (int facility_priority,
+  size_t rep_strnlen(const char *s, size_t max)
+ {
+         size_t len;
+-
++
+         for (len = 0; len < max; len++) {
+                 if (s[len] == '\0') {
+                         break;
+                 }
+         }
+-        return len;
++        return len;
+ }
+ #endif
+-
++
+ #ifndef HAVE_STRNDUP
+ /**
+  Some platforms don't have strndup.
+@@ -351,7 +363,7 @@ void rep_vsyslog (int facility_priority,
+ char *rep_strndup(const char *s, size_t n)
+ {
+ 	char *ret;
+-
++
+ 	n = strnlen(s, n);
+ 	ret = malloc(n+1);
+ 	if (!ret)
+@@ -407,7 +419,7 @@ int rep_chroot(const char *dname)
+
+ /*****************************************************************
+  Possibly replace mkstemp if it is broken.
+-*****************************************************************/
++*****************************************************************/
+
+ #ifndef HAVE_SECURE_MKSTEMP
+ int rep_mkstemp(char *template)
+@@ -425,7 +437,7 @@ int rep_mkstemp(char *template)
+ char *rep_mkdtemp(char *template)
+ {
+ 	char *dname;
+-
++
+ 	if ((dname = mktemp(template))) {
+ 		if (mkdir(dname, 0700) >= 0) {
+ 			return dname;
+@@ -532,7 +544,7 @@ long long int rep_strtoll(const char *st
+ {
+ #ifdef HAVE_STRTOQ
+ 	return strtoq(str, endptr, base);
+-#elif defined(HAVE___STRTOLL)
++#elif defined(HAVE___STRTOLL)
+ 	return __strtoll(str, endptr, base);
+ #elif SIZEOF_LONG == SIZEOF_LONG_LONG
+ 	return (long long int) strtol(str, endptr, base);
+@@ -568,7 +580,7 @@ unsigned long long int rep_strtoull(cons
+ {
+ #ifdef HAVE_STRTOUQ
+ 	return strtouq(str, endptr, base);
+-#elif defined(HAVE___STRTOULL)
++#elif defined(HAVE___STRTOULL)
+ 	return __strtoull(str, endptr, base);
+ #elif SIZEOF_LONG == SIZEOF_LONG_LONG
+ 	return (unsigned long long int) strtoul(str, endptr, base);
+@@ -599,7 +611,7 @@ unsigned long long int rep_strtoull(cons
+ #endif /* HAVE_STRTOULL */
+
+ #ifndef HAVE_SETENV
+-int rep_setenv(const char *name, const char *value, int overwrite)
++int rep_setenv(const char *name, const char *value, int overwrite)
+ {
+ 	char *p;
+ 	size_t l1, l2;
+@@ -644,10 +656,10 @@ int rep_unsetenv(const char *name)
+ 	for (i=0;environ[i];i++) /* noop */ ;
+
+ 	count=i;
+-
++
+ 	for (i=0;i<count;) {
+ 		if (strncmp(environ[i], name, len) == 0 && environ[i][len] == '=') {
+-			/* note: we do _not_ free the old variable here. It is unsafe to
++			/* note: we do _not_ free the old variable here. It is unsafe to
+ 			   do so, as the pointer may not have come from malloc */
+ 			memmove(&environ[i], &environ[i+1], (count-i)*sizeof(char *));
+ 			count--;
+@@ -688,7 +700,7 @@ int rep_utimes(const char *filename, con
+ #endif
+
+ #ifndef HAVE_DUP2
+-int rep_dup2(int oldfd, int newfd)
++int rep_dup2(int oldfd, int newfd)
+ {
+ 	errno = ENOSYS;
+ 	return -1;
+@@ -970,7 +982,7 @@ int rep_memset_s(void *dest, size_t dest
+ 	}
+
+ #if defined(HAVE_MEMSET_EXPLICIT)
+-	memset_explicit(dest, destsz, ch, count);
++	LDB_MEMSET_EXPLICIT(dest, destsz, ch, count);
+ #else /* HAVE_MEMSET_EXPLICIT */
+ 	memset(dest, ch, count);
+ # if defined(HAVE_GCC_VOLATILE_MEMORY_PROTECTION)
diff --git a/meta-networking/recipes-support/libldb/libldb_2.8.2.bb b/meta-networking/recipes-support/libldb/libldb_2.8.2.bb
index 6038066169..016b649cd9 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.8.2.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.8.2.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
            file://0001-do-not-import-target-module-while-cross-compile.patch \
            file://0002-ldb-Add-configure-options-for-packages.patch \
            file://0003-Fix-pyext_PATTERN-for-cross-compilation.patch \
+           file://c23_memset_explicit.patch \
            file://run-ptest \
           "


