Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75835C6FA86
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:24 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web09.11274.1662276862770052425
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X34B5Kxd;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id t3so699713ply.2
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=WnpNd1N1iaSyDrGS5+Fg7+2Uo7OJLwiC8mt3UL3HvZE=;
        b=X34B5Kxd40fi+ge33mfBQoGm3r/qrrE0RgDUsjqmpY+7QG4C+nXpv2akOe4iYwGAfG
         FCbyC/0esdZ4zsmRQs0/MuBovqHe8EhSgGemAUK1wjcJncI7wtNqKkpSayyARjAu8J2R
         XYy/9P/b0HvR+SD/1DkOMQLv8iQj4voBgqcXbhUJoYtGgIy2B+mDD4SBVhaU466MC+1b
         OAYgIImGo9rAhrZPD/peyt/vcfuBfX/E8BOuAFMyfY59D5+JCvTxqwCSA30qGwG1HQYb
         qGYHRRsEuiL+BXxmfdZqQtk3YKVz2YzA4TinQFCpCp/Hus1FENXsiXCnpMVLId2axt9x
         EfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=WnpNd1N1iaSyDrGS5+Fg7+2Uo7OJLwiC8mt3UL3HvZE=;
        b=8KjXNEhWGx17qYsoV6z+Melm1NCFgvSZRyrutU4OFwttGXFmHX6adnfNM6kU2kru5V
         qC6uXs1Td2gf5cxK9DJmXr9QUZy/C29J9lmPVV3lSMR4rPNw1HiXXRKjZobDuvCH2qy+
         LyYaDS8GZMgQUWMPa5LSSTVwyRJfk+KtGyoZ6XO7u3+prkaxt+A6AM7OvC7pUJK254X1
         9h3m4xBI/Xdbds7GvjA8B5LV5lDmSs97oOpksqw/H3YJ5J0e8LeLIWcplgKxBflEIS5r
         cjYwzNL3kR2ifhS1SMgrKrbCT77uML6AeWeYfD5tq5Xa1A7x9oMD+pF+RUwAef+tQQ1N
         RC4Q==
X-Gm-Message-State: ACgBeo39tuCJ3ZXfFi5nmFJZlKBmt1gfiaKD1I/zwv1K2uusuI1NbN9D
	KVzRW6mL7MXndlgjZj1Sv7WwXACq6QodHA==
X-Google-Smtp-Source: 
 AA6agR4W1ITzY6wAuhaSUUlkXQFoUtPxCl9rHsTHArFdA7gnj0bbAOkAVPu8UgdjlLpmn+TpJCWqTQ==
X-Received: by 2002:a17:903:2345:b0:16f:1f3:1ade with SMTP id
 c5-20020a170903234500b0016f01f31ademr44797776plh.106.1662276861828;
        Sun, 04 Sep 2022 00:34:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 01/63] libutempter: Upgrade to 1.2.2-alt1
Date: Sun,  4 Sep 2022 00:33:15 -0700
Message-Id: <20220904073417.3251865-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98595

License-Update: Whitespace removal [1]

Drop glibc assumptions patch its fixed upstream

[1] https://git.altlinux.org/people/ldv/packages/libutempter.git?p=libutempter.git;a=blobdiff;f=libutempter/COPYING;h=5522aa5f33e23eb2be04b0c1fe789b609e7961fe;hp=2d2d780e6014b850ca3b8437452e24eba5f96508;hb=10539e43e615225da8351895668e704726ffcb53;hpb=3e657409d46e0571f44970ebcd2c972b60778ec3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libutempter/0001-Fix-macro-error.patch    |  7 +-
 .../libutempter-remove-glibc-assumption.patch | 81 -------------------
 ...butempter.bb => libutempter_1.2.2-alt1.bb} |  8 +-
 3 files changed, 4 insertions(+), 92 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libutempter/libutempter/libutempter-remove-glibc-assumption.patch
 rename meta-oe/recipes-support/libutempter/{libutempter.bb => libutempter_1.2.2-alt1.bb} (83%)

diff --git a/meta-oe/recipes-support/libutempter/libutempter/0001-Fix-macro-error.patch b/meta-oe/recipes-support/libutempter/libutempter/0001-Fix-macro-error.patch
index 8140ea3438..00119af11c 100644
--- a/meta-oe/recipes-support/libutempter/libutempter/0001-Fix-macro-error.patch
+++ b/meta-oe/recipes-support/libutempter/libutempter/0001-Fix-macro-error.patch
@@ -11,15 +11,13 @@ Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
  iface.c | 9 ++++++++-
  1 file changed, 8 insertions(+), 1 deletion(-)
 
-diff --git a/iface.c b/iface.c
-index 5951d81..27793f0 100644
 --- a/iface.c
 +++ b/iface.c
 @@ -43,7 +43,14 @@
         __result; }))
  #endif
  
--#define	UTEMPTER_DEFAULT_PATHNAME	LIBEXECDIR "/utempter/utempter"
+-#define UTEMPTER_DEFAULT_PATHNAME	LIBEXECDIR "/utempter/utempter"
 +#ifdef  LIBEXECDIR
 +#  define CAT_PATH(DIR1,DIR2)           DIR1##DIR2
 +#  define RAW_UTEMPTER_PATH             CAT_PATH(LIBEXECDIR,/utempter/utempter)
@@ -31,6 +29,3 @@ index 5951d81..27793f0 100644
  
  static const char *utempter_pathname;
  static int saved_fd = -1;
--- 
-1.8.3.1
-
diff --git a/meta-oe/recipes-support/libutempter/libutempter/libutempter-remove-glibc-assumption.patch b/meta-oe/recipes-support/libutempter/libutempter/libutempter-remove-glibc-assumption.patch
deleted file mode 100644
index 6ed93355bb..0000000000
--- a/meta-oe/recipes-support/libutempter/libutempter/libutempter-remove-glibc-assumption.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-diff -Naur libutempter-1.1.6.orig/utempter.c libutempter-1.1.6/utempter.c
---- libutempter-1.1.6.orig/utempter.c	2010-11-04 13:14:53.000000000 -0400
-+++ libutempter-1.1.6/utempter.c	2014-06-20 16:37:09.762403323 -0400
-@@ -34,13 +34,7 @@
- #include <sys/stat.h>
- #include <utmp.h>
- 
--#ifdef __GLIBC__
- # include <pty.h>
--#elif defined(__FreeBSD__)
--# include <libutil.h>
--#else
--# error Unsupported platform
--#endif /* __GLIBC__ || __FreeBSD__ */
- 
- #define	DEV_PREFIX	"/dev/"
- #define	DEV_PREFIX_LEN	(sizeof(DEV_PREFIX)-1)
-@@ -106,17 +100,12 @@
- 
- static int
- write_uwtmp_record(const char *user, const char *term, const char *host,
--#ifdef __GLIBC__
- 		   pid_t pid,
--#endif
- 		   int add)
- {
- 	struct utmp ut;
- 	struct timeval tv;
--
--#ifdef __GLIBC__
- 	size_t offset;
--#endif
- 
- 	memset(&ut, 0, sizeof(ut));
- 
-@@ -128,8 +117,6 @@
- 	if (host)
- 		strncpy(ut.ut_host, host, sizeof(ut.ut_host));
- 
--#ifdef __GLIBC__
--
- 	offset = (strlen(term) <= sizeof(ut.ut_id)) ? 0 :
- 			strlen(term) - sizeof(ut.ut_id);
- 	strncpy(ut.ut_id, term + offset, sizeof(ut.ut_id));
-@@ -156,27 +143,6 @@
- 
- 	(void) updwtmp(_PATH_WTMP, &ut);
- 
--#elif defined(__FreeBSD__)
--
--	ut.ut_time = tv.tv_sec;
--
--	if (add)
--	{
--		login(&ut);
--	} else
--	{
--		if (logout(term) != 1)
--		{
--#ifdef	UTEMPTER_DEBUG
--			fprintf(stderr, "utempter: logout: %s\n",
--				strerror(errno));
--#endif
--			exit(EXIT_FAILURE);
--		}
--	}
--
--#endif /* __GLIBC__ || __FreeBSD__ */
--
- #ifdef	UTEMPTER_DEBUG
- 	fprintf(stderr,
- 		"utempter: DEBUG: utmp/wtmp record %s for terminal '%s'\n",
-@@ -255,8 +221,6 @@
- 	validate_device(device);
- 
- 	return write_uwtmp_record(pw->pw_name, device + DEV_PREFIX_LEN, host,
--#ifdef __GLIBC__
- 				  pid,
--#endif
- 				  add);
- }
diff --git a/meta-oe/recipes-support/libutempter/libutempter.bb b/meta-oe/recipes-support/libutempter/libutempter_1.2.2-alt1.bb
similarity index 83%
rename from meta-oe/recipes-support/libutempter/libutempter.bb
rename to meta-oe/recipes-support/libutempter/libutempter_1.2.2-alt1.bb
index 5c05271d17..0d2cd135c6 100644
--- a/meta-oe/recipes-support/libutempter/libutempter.bb
+++ b/meta-oe/recipes-support/libutempter/libutempter_1.2.2-alt1.bb
@@ -5,16 +5,14 @@ screen and xterm to record user sessions to utmp and wtmp files."
 HOMEPAGE = "ftp://ftp.altlinux.org/pub/people/ldv/utempter"
 SECTION = "System Environment/Libraries"
 LICENSE = "GPL-2.0-only & GPL-2.0-or-later & LGPL-2.0-only & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
 
-SRCREV = "3ef74fff310f09e2601e241b9f042cd39d591018"
-PV = "1.1.6-alt2+git${SRCPV}"
+SRCREV = "63825e2244629d44dae21132b1065d7ecc0491c0"
 
 SRC_URI = "git://git.altlinux.org/people/ldv/packages/libutempter.git;branch=master \
            file://0001-Fix-macro-error.patch \
            file://0002-Proper-macro-path-generation.patch \
-           file://libutempter-remove-glibc-assumption.patch \
-          "
+           "
 
 S = "${WORKDIR}/git/${BPN}"
 
-- 
2.37.3


