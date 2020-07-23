Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web11.6617.1595485003388340625
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2020 23:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PFUOMF56;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id x8so2078342plm.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2020 23:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OgwykLfHbvv+WFwrDPKwaYKxnYtyo9jVVQ36H60V6eU=;
        b=PFUOMF561LBc3jNkLcZOWu0tVXDxpfb9dYC69NJtCeaGwzl4d3v+MietTIVT7HoLEY
         qKO56thVuQGlRerAZ/Oi//ylR6g7Lj/9z++zbFu9Q0EHNE5VqOySQLuIfytOiujpxer9
         zlU1oB0jhZ2Cibh8mr1aX9W+yTGh8LM0pcnnaJTKYpzNhYNlLtwe5BYaUR3U5WMFUOIl
         xBFdiQLktfc+55kib7/Tr2T+7OYTYMQwiYp+/ctlYQiOZAz3YsuoG5V4YJ+JKJGhJZpG
         5e0eH4xcbXk6G7oCVz2hv4HRZEnsftSQc6WpOi5XuzE88G+ezV0TdG2QUPXg4sIJ69tg
         /KxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OgwykLfHbvv+WFwrDPKwaYKxnYtyo9jVVQ36H60V6eU=;
        b=dlrpvSrJNMC1VOH4yppFyaRv5wcvJZzR8goap0dmGSSUTD9aPdTtde8xYx2g83Ydjb
         YSTdUu9HvO7gBPFUNBbqR6eyDZ30cfdL05v8IoMCnbBzylQFZd0wN7kmXUQJbWRKLgS4
         sgWuH0bJPLJXohg9faxgL71jWytpcVOzLRp5vuGfPEBINGB97uerXb1WPXj1mqw1/y4l
         66AnevDXyiJqKH4ovpgjyDgQUy8g/k1G8VldjNE7O01JYb7fA8dwJYx4hHv/qy4FJV9w
         OOClYMgvJv94Cx87s4nxLe1uKyBuA4S/LMvAf+Z3L8h2Ved1JBjRl+BHSVNXuR/UuIij
         hI0w==
X-Gm-Message-State: AOAM531S0p0ZYJEDMWsSeT2ibflgsjWgRqzDQNGgNckg24uGxRYflXzw
	czIBHuloS/JvjBt3+/nbR8xLOLkYAj4=
X-Google-Smtp-Source: ABdhPJwAjRWxDGmW4gKDhcB04CXomWEut5pFWDhc76E/60hTE01JN+fXce0H/g3IX6HH4tNqB8dRhQ==
X-Received: by 2002:a17:902:8206:: with SMTP id x6mr2646612pln.328.1595485002397;
        Wed, 22 Jul 2020 23:16:42 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6651])
        by smtp.gmail.com with ESMTPSA id x13sm1496582pfj.122.2020.07.22.23.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 23:16:41 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] samba: Fix conflicts with nss.h from glibc
Date: Wed, 22 Jul 2020 23:16:40 -0700
Message-Id: <20200723061640.1823528-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is seen with glibc 2.32 where these names are also defined

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.27.0

