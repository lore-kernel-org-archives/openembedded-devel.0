Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.3133.1599324973194182597
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 09:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OzDtRc1g;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id g29so5937032pgl.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2020 09:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=fj/kotpaVXyVISnKt13d4StuA4+4H9LUkpRe5DdQgt8=;
        b=OzDtRc1gMs1xOpu18WRqZtmUJiO1Kx/aD4ob2hCmCs3v6GTRkuy5DXBduA0yZKkt06
         CneGMQLqv9ug83Yz7aykmYUIl6bA7/c3t8XTCcHeQGEmeFECP6Fxbx7ZGnzF8GCN7o1k
         6aEsj5t0IwL4nCsgpMNoFbjoAi00vSeD2i6P5/FWAz/Qq2TmxkOmScUg7wVubNOSwx48
         rFNMBJNjri6Pf8vK7AezdXeUlZBd4PTwt4g30qBYmvmF8r1qIHwy61cZ+qFK5vTypnMb
         S5lyylwA9Za+nNmxRicGhS1zyDNlw0SQLdkYvSQFkVrvADzwS3HStHquFcupoZI5POjj
         q9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=fj/kotpaVXyVISnKt13d4StuA4+4H9LUkpRe5DdQgt8=;
        b=KOxiv1mXksVl91T3QFh9XjFntxkWCERGvkQ/4ie68DInP/RSSVvwg0N50rCqqOeHD3
         DbdvzKwkXEwpSkvIztqXdb7XZOncfNSbDfheJtg0SNtJbBVElcZSkvkFj9eKcNXYFTCo
         fX4Th3S5O9GK43ae1HNRMzIoHh379N7NlE+uGP6r4Raaqo7InSTXnirnGXpyCc08L9Vf
         +gSq/K4QzQWcfpxOsSeSCeI/Jo0JKSgnjGJ2CzwkobAuUK7A/vO2p/XAKAdUnMZPoE0g
         5VTu/4/4HQ2NKbr5DwIKxxXbfDexKs4GXCLo/f3Q89m4Fy9SBvEV7Ce4/+qKFJS2W0Od
         bp7w==
X-Gm-Message-State: AOAM530knDA6FsBHyP5KSUgcUFl4Lw2RcFYuBmM6r/z/SoOIe7B2s/7R
	izaeD2I4Q+oZK9vidP4ouus7Pspag6A=
X-Google-Smtp-Source: ABdhPJzh39/1wSGAADGL7YwzGqHnxN88dhsI7Iaq1zfV3CO3tX6Swls9IzLy2eIP3IalN1f6cWAucw==
X-Received: by 2002:a63:2a96:: with SMTP id q144mr11763146pgq.447.1599324972510;
        Sat, 05 Sep 2020 09:56:12 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:745b:fcae:da87:5147])
        by smtp.gmail.com with ESMTPSA id lb1sm7410944pjb.26.2020.09.05.09.56.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 09:56:12 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 07/20] samba: Fix conflicts with nss.h from glibc
Date: Sat,  5 Sep 2020 09:55:50 -0700
Message-Id: <e227d95f2f8c7fde5959ee49441b23d7754b1853.1599324864.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599324864.git.akuster808@gmail.com>
References: <cover.1599324864.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

This is seen with glibc 2.32 where these names are also defined

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5cf2665446f3fdc16b484c64afffaa0ac8373a35)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ....c-Avoid-nss-function-conflicts-with.patch | 96 +++++++++++++++++++
 .../samba/samba_4.10.15.bb                    |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-nsswitch-nsstest.c-Avoid-nss-function-conflicts-with.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-nsswitch-nsstest.c-Avoid-nss-function-conflicts-with.patch b/meta-networking/recipes-connectivity/samba/samba/0001-nsswitch-nsstest.c-Avoid-nss-function-conflicts-with.patch
new file mode 100644
index 0000000000..2dbabdaa47
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/0001-nsswitch-nsstest.c-Avoid-nss-function-conflicts-with.patch
@@ -0,0 +1,96 @@
+From 9aba5ac17bb822f91f6b214f5b82dd1eb8c47616 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 22 Jul 2020 22:42:09 -0700
+Subject: [PATCH] nsswitch/nsstest.c: Avoid nss function conflicts with glibc nss.h
+
+glibc 2.32 will define these varibles [1] which results in conflicts
+with these static function names, therefore prefix these function names
+with samba_ to avoid it
+
+[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=499a92df8b9fc64a054cf3b7f728f8967fc1da7d
+
+Upstream-Status: Submitted [https://gitlab.com/samba-team/samba/-/merge_requests/1477]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ nsswitch/nsstest.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/nsswitch/nsstest.c b/nsswitch/nsstest.c
+index 6d92806..46f9679 100644
+--- a/nsswitch/nsstest.c
++++ b/nsswitch/nsstest.c
+@@ -137,7 +137,7 @@ static struct passwd *nss_getpwuid(uid_t uid)
+ 	return &pwd;
+ }
+ 
+-static void nss_setpwent(void)
++static void samba_nss_setpwent(void)
+ {
+ 	NSS_STATUS (*_nss_setpwent)(void) =
+ 		(NSS_STATUS(*)(void))find_fn("setpwent");
+@@ -152,7 +152,7 @@ static void nss_setpwent(void)
+ 	}
+ }
+ 
+-static void nss_endpwent(void)
++static void samba_nss_endpwent(void)
+ {
+ 	NSS_STATUS (*_nss_endpwent)(void) =
+ 		(NSS_STATUS (*)(void))find_fn("endpwent");
+@@ -284,7 +284,7 @@ again:
+ 	return &grp;
+ }
+ 
+-static void nss_setgrent(void)
++static void samba_nss_setgrent(void)
+ {
+ 	NSS_STATUS (*_nss_setgrent)(void) =
+ 		(NSS_STATUS (*)(void))find_fn("setgrent");
+@@ -299,7 +299,7 @@ static void nss_setgrent(void)
+ 	}
+ }
+ 
+-static void nss_endgrent(void)
++static void samba_nss_endgrent(void)
+ {
+ 	NSS_STATUS (*_nss_endgrent)(void) =
+ 		(NSS_STATUS (*)(void))find_fn("endgrent");
+@@ -396,7 +396,7 @@ static void nss_test_users(void)
+ {
+ 	struct passwd *pwd;
+ 
+-	nss_setpwent();
++	samba_nss_setpwent();
+ 	/* loop over all users */
+ 	while ((pwd = nss_getpwent())) {
+ 		printf("Testing user %s\n", pwd->pw_name);
+@@ -418,14 +418,14 @@ static void nss_test_users(void)
+ 		printf("initgroups: "); nss_test_initgroups(pwd->pw_name, pwd->pw_gid);
+ 		printf("\n");
+ 	}
+-	nss_endpwent();
++	samba_nss_endpwent();
+ }
+ 
+ static void nss_test_groups(void)
+ {
+ 	struct group *grp;
+ 
+-	nss_setgrent();
++	samba_nss_setgrent();
+ 	/* loop over all groups */
+ 	while ((grp = nss_getgrent())) {
+ 		printf("Testing group %s\n", grp->gr_name);
+@@ -446,7 +446,7 @@ static void nss_test_groups(void)
+ 		printf("getgrgid: "); print_group(grp);
+ 		printf("\n");
+ 	}
+-	nss_endgrent();
++	samba_nss_endgrent();
+ }
+ 
+ static void nss_test_errors(void)
+-- 
+2.27.0
+
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.15.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.15.bb
index 2c74c27fb8..01250cb43f 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.15.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.15.bb
@@ -27,6 +27,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0001-lib-replace-wscript-Avoid-generating-nested-main-fun.patch \
            file://0002-util_sec.c-Move-__thread-variable-to-global-scope.patch \
            file://0001-Add-options-to-configure-the-use-of-libbsd.patch \
+           file://0001-nsswitch-nsstest.c-Avoid-nss-function-conflicts-with.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://samba-pam.patch \
-- 
2.17.1

