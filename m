Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02953C79FAE
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 17:14:09 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.488.1788887640683666722
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Sep 2026 10:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hRUbHM58;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d032846c95so56666915ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 10:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788887640; x=1789492440; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9kRWP7NZ80J9znu7U7vmMQ9AYSB9q3tzXfXmuXYMasY=;
        b=hRUbHM58rFypLCNGt+J/TsSbKHNfN/r+tqEEAh0+bk2HC9l7gATkXo2wqMBE36lyWK
         dhhgpZpKfpYbNuOU8LgBZ2nc9LCu5DQxyPEd4HuM0aF8Jgl7pCkmTeutIwcENbKVqsqs
         CCQF56EPRFy6WLG4WuI6Mm4/hmIa3VLEw/Q7zwvAa8QSHwB+5k7z0BIKpMk2s+iGFOsc
         eRsKy+r624xnJRyB7/74mztqRuwuAc1A1R0zrn+C06XJGu9uamOFBDkENuJLNvlEzGmZ
         cnJMsJYPHnR9/Fg8DpUh77rVMzY2Rezcj6X0vCY8jc4D0LY9APNcZiJZXwEdorXGhSKj
         LKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887640; x=1789492440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9kRWP7NZ80J9znu7U7vmMQ9AYSB9q3tzXfXmuXYMasY=;
        b=NfNksBjwy7xbYpJ5CiKB2a1hGLTpU00GbkBhW7XG55EoUxGitAaJish7YfA1kH0b7X
         bIp+8Z94yOnbGx/4vyXbciEl/JZvasfiZ3rcDQX2lEyQ1noRh9gUwRar30CQNeKM0S7w
         BfDZyF0AYNfSSH3qeJiDNeHOnQA8YStWAZVkVtFCIhg1FULdyU9jtJ7CaGY+qcQ2ct41
         jLbS82cXFUeNN92OmsPuKrTmFRJUy7ymqZ9WkKSb5inrUgVwiiJE5A1Fq6HnmTzkTbrh
         fEmlsGXEv21zl9KTuDzFjl3D+82ZUFiu7D+Dggb9+UPXZx98fiYe2sh0esulDlYrNcdF
         /F0g==
X-Gm-Message-State: AFuF++kvOBkn67dpTmnLefmRe8sKBJXRx7U67ab/ofIWTIzxJnmvQ+6y
	gAAwiHWASwU3+ZUCAc6hH9x8RN6RijuMCQyNZaZQ/mGAYlTund7+5ueLCtY/6w==
X-Gm-Gg: AYBFou3MBfXmopw4QT12OHFsiYhSYowCZQ3+GSfntgXqa2udvln7C5kT5xHLs+I32jU
	5rdt4SQ1GcEIIA5zOBJhGL6GtTAeg4RJUXR7sUk8Iy+duLRPBdkYHirU9rnPDf87O1EgJ/vuQF+
	8moNzCviBCWiZ87+sLToWhr3PqzW8NUAey3ahl3MSKpZs4C5tKNsrsmPDz1AW5O8ANyqSLRow26
	kT89vRD797QdR8T/XQZ8xWyI4bXfBctIQgIgfvT539AQe+NYwMhuQN0jk2rSZIXJbsDI6JsORj7
	/xdWykMCr1xiIxFzs8xCwldYzVjZmZGLponv8M72uLaUiub62AvrSoFgZ0MG+Vb8MjTI/Tea19a
	hJCAvaEDrk/ixkPCkfQdrDDNvhb9G1//+3zDnqACOB0ICPhQgamzunW+g+Yqjvf1eXu6p0p3mJ2
	ekFGJbtHXwk2ICUNABAUO1W/Qqp4p441qMxc2h+DOaLee3fHRWAmBbJbIiIp821oBsI//m5c4u2
	cg4qesILNw4+g38CLzfa99mW/fqoPoneCv8Yzt0azBnM+XxjcgdrNaOPkWe8/g17uGmsawSwL9s
	wzrhSNj5Bl+Ej9US59oJkzQekDTGkCWifIFQp4l6X7q9tAWsaa6DOgZjzaYYSqje8jrBj91NKd1
	6dS3vdShg+TLvGcTEYwn+OYBQPOaaAax2MtOVjMCI5iUVmQ==
X-Received: by 2002:a17:90b:4c51:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39b26204e5bmr42095203a91.13.1788887639890;
        Tue, 08 Sep 2026 10:13:59 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1433171a97esm39566297c88.12.2026.09.08.10.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:13:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 3/6] libfaketime: Upgrade to 0.9.13
Date: Tue,  8 Sep 2026 10:13:50 -0700
Message-ID: <20260908171353.701307-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908171353.701307-1-khem.raj@oss.qualcomm.com>
References: <20260908171353.701307-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 17:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129868

Release notes:
https://github.com/wolfcw/libfaketime/blob/v0.9.13/NEWS

Drop 0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch, it is
merged upstream via PR #525.

Add a patch to fix the build with clang 23, which added
-Wunused-but-set-global and turns the -Werror in src/Makefile into:

  libfaketime.c:340:23: error: variable 'real_lstat' set but not used
    [-Werror,-Wunused-but-set-global]

ftpl_init() resolves every real_* pointer up front by design, so the
ones whose wrappers are not compiled on Linux/glibc end up written and
never read. Annotate those with __attribute__((unused)) rather than
adding -Wno-error=unused-but-set-global to CFLAGS, since the Makefile
has no flag-probing and older clang rejects the unknown warning group
under the same -Werror.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...qualifiers-to-fix-build-with-ISO-C23.patch | 34 ----------
 ...-write-only-real_-pointers-as-unused.patch | 68 +++++++++++++++++++
 ...ketime_0.9.12.bb => libfaketime_0.9.13.bb} |  4 +-
 3 files changed, 70 insertions(+), 36 deletions(-)
 delete mode 100644 meta-oe/recipes-test/libfaketime/libfaketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch
 create mode 100644 meta-oe/recipes-test/libfaketime/libfaketime/0001-Mark-write-only-real_-pointers-as-unused.patch
 rename meta-oe/recipes-test/libfaketime/{libfaketime_0.9.12.bb => libfaketime_0.9.13.bb} (85%)

diff --git a/meta-oe/recipes-test/libfaketime/libfaketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch b/meta-oe/recipes-test/libfaketime/libfaketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch
deleted file mode 100644
index 1696e7146e..0000000000
--- a/meta-oe/recipes-test/libfaketime/libfaketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From dbe865dfdba0145d993d70b7fd4ec88b2f47554b Mon Sep 17 00:00:00 2001
-From: Tomas Korbar <tkorbar@redhat.com>
-Date: Mon, 15 Dec 2025 11:03:21 +0100
-Subject: [PATCH] Add const qualifiers to fix build with ISO C23
-
-Fix https://github.com/wolfcw/libfaketime/issues/524
-
-Upstream-Status: Backport [https://github.com/wolfcw/libfaketime/pull/525]
----
- src/libfaketime.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/libfaketime.c b/src/libfaketime.c
-index ef1dca9..02839c8 100644
---- a/src/libfaketime.c
-+++ b/src/libfaketime.c
-@@ -2666,7 +2666,7 @@ int timespec_get(struct timespec *ts, int base)
- static void parse_ft_string(const char *user_faked_time)
- {
-   struct tm user_faked_time_tm;
--  char * tmp_time_fmt;
-+  const char * tmp_time_fmt;
-   char * nstime_str;
-
-   if (!strncmp(user_faked_time, user_faked_time_saved, BUFFERLEN))
-@@ -3338,7 +3338,7 @@ static void prepare_config_contents(char *contents)
- bool str_array_contains(const char *haystack, const char *needle)
- {
-   size_t needle_len = strlen(needle);
--  char *pos = strstr(haystack, needle);
-+  const char *pos = strstr(haystack, needle);
-   while (pos) {
-     if (pos == haystack || *(pos - 1) == ',') {
-       char nextc = *(pos + needle_len);
diff --git a/meta-oe/recipes-test/libfaketime/libfaketime/0001-Mark-write-only-real_-pointers-as-unused.patch b/meta-oe/recipes-test/libfaketime/libfaketime/0001-Mark-write-only-real_-pointers-as-unused.patch
new file mode 100644
index 0000000000..c7a854a196
--- /dev/null
+++ b/meta-oe/recipes-test/libfaketime/libfaketime/0001-Mark-write-only-real_-pointers-as-unused.patch
@@ -0,0 +1,68 @@
+From d0fd7b4be89feb6a8809216b0dc1d84299bbad96 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Mon, 7 Sep 2026 19:27:57 -0700
+Subject: [PATCH] Mark write-only real_* pointers as unused
+
+clang 23 added -Wunused-but-set-global, which together with the -Werror
+in src/Makefile breaks the build:
+
+  libfaketime.c:340:23: error: variable 'real_lstat' set but not used
+    [-Werror,-Wunused-but-set-global]
+
+ftpl_init() deliberately resolves every real_* pointer up front ('Look
+up all real_* functions. NULL will mark missing ones.'), but several of
+them are only consumed on other platforms or under build options that
+are off by default, so on Linux/glibc they are written and never read.
+
+Annotate exactly those with __attribute__((unused)). This is understood
+by every gcc and clang that can build libfaketime, unlike a
+-Wno-error=unused-but-set-global flag, which older compilers reject.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/libfaketime.c | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/src/libfaketime.c b/src/libfaketime.c
+index e674883..2addaab 100644
+--- a/src/libfaketime.c
++++ b/src/libfaketime.c
+@@ -337,26 +337,26 @@ static __thread bool dont_fake = false;
+ /* pointers to real (not faked) functions */
+ static int          (*real_stat)            (const char *, struct stat *);
+ static int          (*real_fstat)           (int, struct stat *);
+-static int          (*real_lstat)           (const char *, struct stat *);
++static int          (*real_lstat)           (const char *, struct stat *) __attribute__((unused));
+ #ifndef __ANDROID__
+ static int          (*real_xstat)           (int, const char *, struct stat *);
+ static int          (*real_fxstat)          (int, int, struct stat *);
+-static int          (*real_fxstatat)        (int, int, const char *, struct stat *, int);
+-static int          (*real_lxstat)          (int, const char *, struct stat *);
++static int          (*real_fxstatat)        (int, int, const char *, struct stat *, int) __attribute__((unused));
++static int          (*real_lxstat)          (int, const char *, struct stat *) __attribute__((unused));
+ #endif
+ #if !defined(__APPLE__) || !__DARWIN_ONLY_64_BIT_INO_T
+ #ifndef __ANDROID__
+-static int          (*real_stat64)          (const char *, struct stat64 *);
+-static int          (*real_xstat64)         (int, const char *, struct stat64 *);
+-static int          (*real_fxstat64)        (int, int , struct stat64 *);
+-static int          (*real_fxstatat64)      (int, int , const char *, struct stat64 *, int);
+-static int          (*real_lxstat64)        (int, const char *, struct stat64 *);
++static int          (*real_stat64)          (const char *, struct stat64 *) __attribute__((unused));
++static int          (*real_xstat64)         (int, const char *, struct stat64 *) __attribute__((unused));
++static int          (*real_fxstat64)        (int, int , struct stat64 *) __attribute__((unused));
++static int          (*real_fxstatat64)      (int, int , const char *, struct stat64 *, int) __attribute__((unused));
++static int          (*real_lxstat64)        (int, const char *, struct stat64 *) __attribute__((unused));
+ #endif
+ #endif
+ #ifdef STATX_TYPE
+-static int          (*real_statx)           (int dirfd, const char *pathname, int flags, unsigned int mask, struct statx *statxbuf);
++static int          (*real_statx)           (int dirfd, const char *pathname, int flags, unsigned int mask, struct statx *statxbuf) __attribute__((unused));
+ #endif
+-static time_t       (*real_time)            (time_t *);
++static time_t       (*real_time)            (time_t *) __attribute__((unused));
+ #ifndef __ANDROID__
+ static int          (*real_ftime)           (struct timeb *);
+ #endif
diff --git a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.12.bb b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.13.bb
similarity index 85%
rename from meta-oe/recipes-test/libfaketime/libfaketime_0.9.12.bb
rename to meta-oe/recipes-test/libfaketime/libfaketime_0.9.13.bb
index a434584c47..22c908f335 100644
--- a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.12.bb
+++ b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.13.bb
@@ -3,10 +3,10 @@ SECTION = "libs"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "3ccdd344aadf1e317156fa5fb7c881f2c4404778"
+SRCREV = "86b37fde2fed7336ea2d0c17928e3015a55d9b4a"
 
 SRC_URI = "git://github.com/wolfcw/libfaketime.git;branch=master;tag=v${PV};protocol=https \
-           file://0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch \
+           file://0001-Mark-write-only-real_-pointers-as-unused.patch \
 "
 
 CFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"

