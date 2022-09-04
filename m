Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA65CC6FA8C
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:24 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.11379.1662276899603879891
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jIFRSRLE;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id b196so5594454pga.7
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=wRnafYtYbrgw8eQ7OsQfDUmB/TsqCW+Xy73v8Z3DSu8=;
        b=jIFRSRLEY8B/j8hDYRDwJldd+T9kPDlWXjxdF/7QKe/NTKJtNPaJ/5njDwsHMWxy7o
         JjOPTMTZpT71hapjPzYYzBzULyx8hjog0rep7m6ZMqP2/LwT4TVpOXGqP0WoULBqcsIO
         f5Caa3hILEJfl3xitSp8g8A2xmnzZaTnpOk9nL2hC8xlPPm2HTtZbL4Bo2thbrdwyeaq
         poaP8vd0ls/eIZxmM+TQcdpvOYbxAfI2OvuxQqdCP0tG0jrzyvQoNvL1WgilHFqaE9DO
         nT0DbRbapdjypb4YaWzUcCL2GNpHR5ObR36phQdceOmC5kHdMi2D+AEsoUOeD7gJqqwq
         XBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=wRnafYtYbrgw8eQ7OsQfDUmB/TsqCW+Xy73v8Z3DSu8=;
        b=QkpKHenrjszFSCnTQggCaCs3SqIXuyRIVk0SSOA83vMR1A333RX/VDv8zZGZiXZYNf
         yTWCDf6pzIjQtwqAq7ANDax4lIPmiUpkserEcf8z1ZRfV7jPO15/KlktgE8dmmwMXM3d
         jb3Efp5+sUgnz0HGFwZPIAwdvogw1qkqX8zvibUpHYvy8XIIi65iai6fJWIcVstCpH8F
         fToKUiiYfDNSVf4WSwKpX/LhCHahEweEYPRb8z1TsCLNM4hTLNNsssf3CKNGuEHq7jnY
         zcmw1anqeCMtto8m4bncdGQBPXxjdMKX7qcGpgPxrR5PwSpCuQuQH9sv8coIAYqBh62m
         6ZYA==
X-Gm-Message-State: ACgBeo0bb29ybz4/ZzajpXSGfL8RPsg1aTvaS4EjCHD/JgU1OKMUSjCU
	ZsBZse93jYK5lg3o39PHEssq2m2x0QaAIw==
X-Google-Smtp-Source: 
 AA6agR5O4usAaMzmUdz6wouCh5YSS+0PV1XE+otX0WjR7LruP24In2Dib9DB+RjVfAt1QQi/4I6t4Q==
X-Received: by 2002:a63:6d0f:0:b0:42b:4532:aa30 with SMTP id
 i15-20020a636d0f000000b0042b4532aa30mr37631496pgc.19.1662276921542;
        Sun, 04 Sep 2022 00:35:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:35:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 60/63] autofs: Backport innetgr and strerror_r musl
 patches
Date: Sun,  4 Sep 2022 00:34:14 -0700
Message-Id: <20220904073417.3251865-60-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:35:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98654

Fixes build with musl/x86

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...dd-autofs_strerror_r-helper-for-musl.patch |  54 +++++++++
 ...8-handle-innetgr-not-present-in-musl.patch | 106 ++++++++++++++++++
 .../recipes-daemons/autofs/autofs_5.1.8.bb    |   2 +
 3 files changed, 162 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/0001-autofs-5.1.8-add-autofs_strerror_r-helper-for-musl.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/0002-autofs-5.1.8-handle-innetgr-not-present-in-musl.patch

diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-autofs-5.1.8-add-autofs_strerror_r-helper-for-musl.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-autofs-5.1.8-add-autofs_strerror_r-helper-for-musl.patch
new file mode 100644
index 0000000000..5fd9a8d129
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs/0001-autofs-5.1.8-add-autofs_strerror_r-helper-for-musl.patch
@@ -0,0 +1,54 @@
+From 88f991b0ebb6fb8fcaad3d0eb8fb51a7439d053e Mon Sep 17 00:00:00 2001
+From: Fabian Groffen <grobian@gentoo.org>
+Date: Wed, 2 Feb 2022 09:27:13 +0800
+Subject: [PATCH 1/2] autofs-5.1.8 - add autofs_strerror_r() helper for musl
+
+If using musl libc the XSI-compliant variant strerror_r() which returns
+an integer instead of a pointer so add a helper function to handle this
+case.
+
+Signed-off-by: Fabian Groffen <grobian@gentoo.org>
+Signed-off-by: Ian Kent <raven@themaw.net>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/automount.h |  5 +++++
+ lib/log.c           | 10 ++++++++++
+ 2 files changed, 15 insertions(+)
+
+diff --git a/include/automount.h b/include/automount.h
+index 8cd8b3a..f759e59 100644
+--- a/include/automount.h
++++ b/include/automount.h
+@@ -51,6 +51,11 @@
+ # endif
+ #endif
+ 
++#ifndef __GLIBC__
++# define strerror_r(N,B,S) autofs_strerror_r(N,B,S)
++char *autofs_strerror_r(int errnum, char *buf, size_t buflen);  /* GNU */
++#endif
++
+ /* We MUST have the paths to mount(8) and umount(8) */
+ #ifndef HAVE_MOUNT
+ #error Failed to locate mount(8)!
+diff --git a/lib/log.c b/lib/log.c
+index 39b1e3b..b99fa39 100644
+--- a/lib/log.c
++++ b/lib/log.c
+@@ -368,3 +368,13 @@ pid_t log_pidinfo(struct autofs_point *ap, pid_t pid, char *label) {
+ 
+ 	return ppid;
+ }
++
++#ifndef __GLIBC__
++# undef strerror_r
++char *autofs_strerror_r(int errnum, char *buf, size_t buflen) {
++	int s = strerror_r(errnum, buf, buflen);
++	if (s)
++		return NULL;
++	return buf;
++}
++#endif
+-- 
+2.37.3
+
diff --git a/meta-networking/recipes-daemons/autofs/autofs/0002-autofs-5.1.8-handle-innetgr-not-present-in-musl.patch b/meta-networking/recipes-daemons/autofs/autofs/0002-autofs-5.1.8-handle-innetgr-not-present-in-musl.patch
new file mode 100644
index 0000000000..9d0caae312
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs/0002-autofs-5.1.8-handle-innetgr-not-present-in-musl.patch
@@ -0,0 +1,106 @@
+From 1c0b0b70a276280f431d72319109a0bbc0267970 Mon Sep 17 00:00:00 2001
+From: Fabian Groffen <grobian@gentoo.org>
+Date: Wed, 2 Feb 2022 10:15:22 +0800
+Subject: [PATCH 2/2] autofs-5.1.8 - handle innetgr() not present in musl
+
+The function innetgr(3) may not be present in musl libc, add a check
+for this.
+
+Originally contributed by Fabian, modified by me.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git/commit/?id=f60e40af3c038b8955325a11b7294ad38c15c9e8]
+Signed-off-by: Fabian Groffen <grobian@gentoo.org>
+Signed-off-by: Ian Kent <raven@themaw.net>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure           | 6 ++++++
+ configure.in        | 2 +-
+ include/config.h.in | 3 +++
+ modules/parse_amd.c | 7 +++++++
+ 4 files changed, 17 insertions(+), 1 deletion(-)
+
+--- a/configure.in
++++ b/configure.in
+@@ -169,7 +169,7 @@ AF_CHECK_SSS_LIB(SSS_AUTOFS, libsss_auto
+ AC_SUBST(HAVE_SSS_AUTOFS)
+ AC_SUBST(sssldir)
+ 
+-AC_CHECK_FUNCS(pipe2)
++AC_CHECK_FUNCS(pipe2 innetgr)
+ 
+ #
+ # Newer mounts have the -s (sloppy) option to ignore unknown options,
+--- a/include/config.h.in
++++ b/include/config.h.in
+@@ -30,6 +30,9 @@
+ /* Define to 1 if you have the `getservbyname' function. */
+ #undef HAVE_GETSERVBYNAME
+ 
++/* Define to 1 if you have the `innetgr' function. */
++#undef HAVE_INNETGR
++
+ /* Define to 1 if you have the <inttypes.h> header file. */
+ #undef HAVE_INTTYPES_H
+ 
+@@ -45,9 +48,6 @@
+ /* Define if you have the Linux /proc filesystem. */
+ #undef HAVE_LINUX_PROCFS
+ 
+-/* Define to 1 if you have the <memory.h> header file. */
+-#undef HAVE_MEMORY_H
+-
+ /* define if you have MOUNT */
+ #undef HAVE_MOUNT
+ 
+@@ -69,6 +69,9 @@
+ /* Define to 1 if you have the <stdint.h> header file. */
+ #undef HAVE_STDINT_H
+ 
++/* Define to 1 if you have the <stdio.h> header file. */
++#undef HAVE_STDIO_H
++
+ /* Define to 1 if you have the <stdlib.h> header file. */
+ #undef HAVE_STDLIB_H
+ 
+@@ -141,7 +144,9 @@
+ /* define if you have YACC */
+ #undef PATH_YACC
+ 
+-/* Define to 1 if you have the ANSI C header files. */
++/* Define to 1 if all of the C90 standard headers exist (not just the ones
++   required in a freestanding environment). This macro is provided for
++   backward compatibility; new code need not use it. */
+ #undef STDC_HEADERS
+ 
+ /* Define to 1 to use the libtirpc tsd usage workaround */
+--- a/modules/parse_amd.c
++++ b/modules/parse_amd.c
+@@ -424,6 +424,7 @@ static int sel_in_network(struct autofs_
+ 	return ret;
+ }
+ 
++#ifdef HAVE_INNETGR
+ static int sel_netgrp(struct autofs_point *ap,
+ 		      struct selector *s, struct substvar *sv)
+ {
+@@ -488,6 +489,7 @@ out:
+ 
+ 	return ret;
+ }
++#endif
+ 
+ static int eval_selector(struct autofs_point *ap,
+ 			 struct amd_entry *this, struct substvar *sv)
+@@ -627,7 +629,12 @@ static int eval_selector(struct autofs_p
+ 		switch (s->sel->selector) {
+ 		case SEL_NETGRP:
+ 		case SEL_NETGRPD:
++#ifndef HAVE_INNETGR
++			error(logopt, MODPREFIX
++			      "netgroups not available, function innetgr(3) not available");
++#else
+ 			ret = sel_netgrp(ap, s, sv);
++#endif
+ 			break;
+ 
+ 		default:
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.8.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.8.bb
index cb80844586..ca11f1a170 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.8.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.8.bb
@@ -27,6 +27,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.gz \
            file://0001-Bug-fix-for-pid_t-not-found-on-musl.patch \
            file://0001-Define-__SWORD_TYPE-if-undefined.patch \
            file://mount_conflict.patch \
+           file://0001-autofs-5.1.8-add-autofs_strerror_r-helper-for-musl.patch \
+           file://0002-autofs-5.1.8-handle-innetgr-not-present-in-musl.patch \
            "
 SRC_URI[sha256sum] = "0bd401c56f0eb1ca6251344c3a3d70bface3eccf9c67117cd184422c4cace30c"
 
-- 
2.37.3


