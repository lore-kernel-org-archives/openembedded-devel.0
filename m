Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7991.1794465764851307507
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:42:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=gFC/xffi;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso390322a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465764; x=1795070564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bgXN42Ow2imv4Q0Hx1DHSrQyLAfWQMl8hNKicrENLhw=;
        b=gFC/xffiHXk+xxczsMEs5Vj4n8xJVWpODcAxNrtRFgvafo2UOLBJqE89NktNeToAxI
         J1lpmANYSVfI8ondvIhk7YyEmI/KHoZntOuED/wx2v1tM6DFD1DkXLdyhLDS4wa/0mq4
         0AMH4xoq0CBzQ3nLqkp8Ij/Ai9nKsJQ0gH2fh5YqP5O7WsGpsS1cAfUgKhJzW9oPUYjF
         wUO6b0U3W/Ei9VZSI8HBzF6K2Ru6IopqsF8Oa6Bzairfea22eR3+LQn9O1h7ONLYZNz1
         4MryCxwxmD9NazZK1x8w+Ldr9Qp52uKfVBDXvYlrRz3UZyMbHxC0gB7d/iun4vmYhI7B
         lavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465764; x=1795070564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bgXN42Ow2imv4Q0Hx1DHSrQyLAfWQMl8hNKicrENLhw=;
        b=IyQC5MqLLXGBySUjlQvQWPzHxSdrGWi11QdPBW0e26QpvItMcA7tYFtejpsX/WsONG
         dvzUP8gZ5bXA35CvYo7FKq9Ik98Q12wyX/69yLe1dldpL6SY84T6h2JjypO7RAKcO9je
         v2KR9H9A3GejhicsPVY/MXdNN+u0HOqFnTGe4gM2A3gyPwPuNM5T4s62g+L8ydM6uAbk
         AP46YwNh/5zYZ7pAuvtBctC0qVALUdJjInFH7BCQd3s3YKQnw+Jbin/E7HBeNIed2rMd
         bbWlGEmH5vJ6cbrd9pl6Cc6ofugsoB5UI+Q2rm6yYsNqUvDllMK9SFn5TS4QT3iJgIDg
         eGvA==
X-Gm-Message-State: APuU4Z+7zTZp6qS/DMYm5Ibh5Y5MeqqpKvUuWrHd8bZedQ1SMe4V92jx
	HfqHhAdQnIFiM9aR9kbcpZLq8rLvAOy58V87XaVjIfb51yn8/UrmA1Sc/Yoi5g==
X-Gm-Gg: AYBFou1OjcykM2O1uyP91lxx7G597fiGRjuC7/6/ZNE4ueajIfnsxMEmbSmsJkC6Avi
	Z9O4/9Vn2qCKPMGYlggOjnfN1DJQWoP6iRfxeI32vJ2m0Y1FGgEqMCOmabWJ/mEjbwQgDC0bqcd
	XAQCbXW8gIYFhf5MsAF0S2FgtcMONg7BwSn/ERzbUuXVzzsKz5uszc+A8+Kkffo0Ne7Z5r4az8l
	kWvhqUIq+5oqcvo1GwcMaWQKRf8B9yhaMrX0m43EL18W9Jq8llBvMaWLVShfgW2kQk/HkJfD9V/
	nAdGELBgO1eZxECAfmEfR8A8cKCAgMkbEMNHY0oZRXZaXrR7EMjfWOI59O6FLZVCMHzYZ+NlKli
	syivS5wgVrqF5nN47sBNHufZcA/8od9Clz3U76Q+3o+ST0MBu9AcpX7Da/Q0apXGAzyf77WVBw4
	tJRF5U7cMVonA9DzNfndjQ4GBQJ35/PURQONzkvEqHRcCHE53sGIbTpizlLJZcqGBag3CuJb1WW
	d+nmp73AZnVbnrkRl2CplXE0DssWxIQ3H3MC0DZqKGH800oOBkSZyYEE6E4EPYjZzoEaJYw/guS
	g8WkSqv+wKFwBfKb/1BIGVP5sYk2fog96o7Mc2PFyMlXXtcD3TLihVQFTT8s37xFPHrSQ4H7S4i
	8zZJa9b9kpkLSBD/keAKCfDD0yC6w86McTOALWtcDVa3g4RAtYKRv7BawWP/KqF4oC32y7J0P8m
	9CrJ7PO0wK//GCALvi47PfrDc2/muyDQK5w8/Pv/bqKoYUC7xuiFdMVT/J/P45aKqH8uUCClQ3A
	Iql+NcxXORTLhnFQjnrqyEBejO3vfbd1OPWsYOSkBzUE7EM36UvswJT1aC2Mz+COZ8zjIu/DpM7
	ZRxN
X-Received: by 2002:a17:90a:ec8c:b0:3ab:330d:6e47 with SMTP id 98e67ed59e1d1-3b197c92162mr998530a91.10.1794465764064;
        Wed, 11 Nov 2026 22:42:44 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm2984715a91.11.2026.11.11.22.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:42:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 13/24] autofs: upgrade 5.1.9 -> 5.2.0
Date: Wed, 11 Nov 2026 22:42:13 -0800
Message-ID: <20261112064225.2410019-13-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
References: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132182
Content-Type: text/plain; charset="utf-8"

Drop 0010-autofs-5.1.9-Fix-incompatible-function-pointer-types.patch,
included in this release, and refresh
0006-Do-not-hardcode-path-for-pkg.m4.patch.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...0006-Do-not-hardcode-path-for-pkg.m4.patch |  7 +-
 ...-incompatible-function-pointer-types.patch | 64 -------------------
 .../{autofs_5.1.9.bb => autofs_5.2.0.bb}      |  3 +-
 3 files changed, 3 insertions(+), 71 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs/0010-autofs-5.1.9-Fix-incompatible-function-pointer-types.patch
 rename meta-networking/recipes-daemons/autofs/{autofs_5.1.9.bb => autofs_5.2.0.bb} (95%)

diff --git a/meta-networking/recipes-daemons/autofs/autofs/0006-Do-not-hardcode-path-for-pkg.m4.patch b/meta-networking/recipes-daemons/autofs/autofs/0006-Do-not-hardcode-path-for-pkg.m4.patch
index ab99a98cf9..7c4a7de9c6 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/0006-Do-not-hardcode-path-for-pkg.m4.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/0006-Do-not-hardcode-path-for-pkg.m4.patch
@@ -14,11 +14,11 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 1bb1a52..4cebbd2 100644
+index 770c885..2af3b60 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -12,7 +12,7 @@ define([AC_CACHE_SAVE], )dnl
- AC_INIT(.autofs-5.1.9)
+ AC_INIT(.autofs-5.2.0)
  
  # for pkg-config macros
 -m4_include([/usr/share/aclocal/pkg.m4])
@@ -26,6 +26,3 @@ index 1bb1a52..4cebbd2 100644
  
  #
  # autofs installs by default in /usr
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/autofs/autofs/0010-autofs-5.1.9-Fix-incompatible-function-pointer-types.patch b/meta-networking/recipes-daemons/autofs/autofs/0010-autofs-5.1.9-Fix-incompatible-function-pointer-types.patch
deleted file mode 100644
index 0e15587340..0000000000
--- a/meta-networking/recipes-daemons/autofs/autofs/0010-autofs-5.1.9-Fix-incompatible-function-pointer-types.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From a6a79230110e998f780796cb1d4c5d3f59f20d1d Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Mon, 18 Dec 2023 13:48:18 +0100
-Subject: [PATCH] autofs-5.1.9 - Fix incompatible function pointer types in
- cyrus-sasl module
-
-Add casts to SASL callbacks to avoid incompatible-pointer-types
-errors.  Avoids a build failure with stricter compilers.
-
-Signed-off-by: Florian Weimer <fweimer@redhat.com>
-Signed-off-by: Ian Kent <raven@themaw.net>
-
-Upstream-Status: Backport
-[https://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git/commit/?id=b7ff971bb8aa3fc609bb531ddc4c2ce56226383f]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- CHANGELOG            |  2 ++
- modules/cyrus-sasl.c | 14 +++++++-------
- 2 files changed, 9 insertions(+), 7 deletions(-)
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 3e47daa..fd9d861 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -1,4 +1,6 @@
- 
-+- Fix incompatible function pointer types in cyrus-sasl module.
-+
- 02/11/2023 autofs-5.1.9
- - fix kernel mount status notification.
- - fix fedfs build flags.
-diff --git a/modules/cyrus-sasl.c b/modules/cyrus-sasl.c
-index e742eaf..78b7794 100644
---- a/modules/cyrus-sasl.c
-+++ b/modules/cyrus-sasl.c
-@@ -109,17 +109,17 @@ static int getpass_func(sasl_conn_t *, void *, int, sasl_secret_t **);
- static int getuser_func(void *, int, const char **, unsigned *);
- 
- static sasl_callback_t callbacks[] = {
--	{ SASL_CB_USER, &getuser_func, NULL },
--	{ SASL_CB_AUTHNAME, &getuser_func, NULL },
--	{ SASL_CB_PASS, &getpass_func, NULL },
-+	{ SASL_CB_USER, (int(*)(void)) &getuser_func, NULL },
-+	{ SASL_CB_AUTHNAME, (int(*)(void)) &getuser_func, NULL },
-+	{ SASL_CB_PASS, (int(*)(void)) &getpass_func, NULL },
- 	{ SASL_CB_LIST_END, NULL, NULL },
- };
- 
- static sasl_callback_t debug_callbacks[] = {
--	{ SASL_CB_LOG, &sasl_log_func, NULL },
--	{ SASL_CB_USER, &getuser_func, NULL },
--	{ SASL_CB_AUTHNAME, &getuser_func, NULL },
--	{ SASL_CB_PASS, &getpass_func, NULL },
-+	{ SASL_CB_LOG, (int(*)(void)) &sasl_log_func, NULL },
-+	{ SASL_CB_USER, (int(*)(void)) &getuser_func, NULL },
-+	{ SASL_CB_AUTHNAME, (int(*)(void)) &getuser_func, NULL },
-+	{ SASL_CB_PASS, (int(*)(void)) &getpass_func, NULL },
- 	{ SASL_CB_LIST_END, NULL, NULL },
- };
- 
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.9.bb b/meta-networking/recipes-daemons/autofs/autofs_5.2.0.bb
similarity index 95%
rename from meta-networking/recipes-daemons/autofs/autofs_5.1.9.bb
rename to meta-networking/recipes-daemons/autofs/autofs_5.2.0.bb
index bc52f40d1c..e8a00283e6 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.9.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.2.0.bb
@@ -19,9 +19,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.gz \
            file://0007-Avoid-conflicts-between-sys-mount.h-and-linux-mount..patch \
            file://0008-include-libgen.h-for-basename.patch \
            file://0009-hash.h-include-sys-reg.h-instead-of-bits-reg.h.patch \
-           file://0010-autofs-5.1.9-Fix-incompatible-function-pointer-types.patch \
            "
-SRC_URI[sha256sum] = "46c30b763ef896f4c4a6df6d62aaaef7afc410e0b7f50d52dbfc6cf728cacd4f"
+SRC_URI[sha256sum] = "966bcacb571a7000a4d2afda0db5f7af84e4ef2444f04d7fc17898f1d2409c6b"
 
 UPSTREAM_CHECK_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/"
 
