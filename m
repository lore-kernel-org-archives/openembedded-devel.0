Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 611FA7550C
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:58:55 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id c78so3718264pfj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5pNcd60WAlAkVrL4uYr3a5b+r6QhGvzojOPy2qyRzJk=;
	b=ZcEnVlrdvTTre0tQXmdWrp4JSBAzPniLK2b8pBPS6eaNlx3+y39s9biaaGR9IwyQKx
	76AHvwVCegG29y9M8m/kyCDXX2M/+k5Gz+MIqJ8bX5cZZJ+BoA/q4aYg07fL1kn6kpzh
	ra5CG5MDAjBtlIxifNF5iqKVnSjd/x6JA82sW/tP+fmyCvnVFR9CIIii2uwP0BzTmijo
	0zuPNIrGvPSEqoj6CU+M7b8joiQ7G/ElDxYhIrpieKcYKzMuHT49GWAGhce1C/YENfRL
	d5VD7Gmh2+WyXI7jcsUH8FAmtfIVqoHiF1DOS+CGHwsqJsQBILqqydjgaflhDHpCQJcp
	SB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5pNcd60WAlAkVrL4uYr3a5b+r6QhGvzojOPy2qyRzJk=;
	b=cwijRO7TO1u46B6QqblqOtO4nvf5XhIB+UlxJvFY3nMEw0rmq3HIiuqN9pF/cxDN+F
	E+BzLMiPz2M0aFtRYng7biK1mM39VfV0PY8fbq9HVP8NPDUtg+2R/9Ontyca30OCeRks
	2rYit9WFllLtoWYv9RIXpB/px/2b51k59oYa+hQU9OHsCP9zMmqr06druYGhQRVi+Xmd
	aeSSLpauGoTK7Uwgx3ujeTqbZDMdrf+n9HGvbRSEvwzvEP+2fWVEIM7rMbDDC/R6vPiC
	Na1m0b7S4BaPESQN/rqpErqhTnznTq3rXWsaRDJZPvPY8f2yK7YldEtwjhFvvwNY6QpX
	z6XQ==
X-Gm-Message-State: AElRT7Euw7Lb89KBbRo/x0ezrS0FmNR40X6wtDvs7bvQMxt1P+EhU891
	6XcU3rNDNsUeS+vXNsln7kY=
X-Google-Smtp-Source: AIpwx49+C5t3MK2tBkJHohtARH+8Ee3oFFYpUsmphTeaWUPwdrZxBIgIhGQqjcG2T/DOVNc++orZkg==
X-Received: by 10.99.129.199 with SMTP id t190mr21739642pgd.376.1523170737062; 
	Sat, 07 Apr 2018 23:58:57 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.58.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:58:56 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:17 -0700
Message-Id: <1523170729-26321-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 05/37] vsftpd: refresh patches
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Apr 2018 06:58:56 -0000

WARNING:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
checking file Makefile
Hunk #1 succeeded at 29 with fuzz 1 (offset 5 lines).

and others

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../vsftpd/files/change-secure_chroot_dir.patch    | 37 ++++++++++++---------
 ...c-Fix-with-musl-which-does-not-have-utmpx.patch |  6 ++--
 ...ftpd-allow-sysinfo-in-the-seccomp-sandbox.patch |  6 ++--
 .../vsftpd/vsftpd-3.0.3/makefile-destdir.patch     | 14 ++++++--
 .../vsftpd/vsftpd-3.0.3/makefile-libs.patch        | 19 ++++++++---
 .../vsftpd/vsftpd-3.0.3/makefile-strip.patch       | 10 +++++-
 .../vsftpd-3.0.3/nopam-with-tcp_wrappers.patch     | 17 +++++++---
 .../vsftpd/vsftpd-3.0.3/vsftpd-2.1.0-filter.patch  | 38 ++++++++++++++--------
 .../vsftpd-3.0.3/vsftpd-tcp_wrappers-support.patch | 13 ++++----
 9 files changed, 105 insertions(+), 55 deletions(-)

diff --git a/meta-networking/recipes-daemons/vsftpd/files/change-secure_chroot_dir.patch b/meta-networking/recipes-daemons/vsftpd/files/change-secure_chroot_dir.patch
index 5f2860e..b69de1d 100644
--- a/meta-networking/recipes-daemons/vsftpd/files/change-secure_chroot_dir.patch
+++ b/meta-networking/recipes-daemons/vsftpd/files/change-secure_chroot_dir.patch
@@ -1,20 +1,25 @@
-vsftpd: change default value of secure_chroot_dir
+From ce2be5d4967445828d5ae9d9462cfaa78ae03c73 Mon Sep 17 00:00:00 2001
+From: Ming Liu <ming.liu@windriver.com>
+Date: Wed, 18 Sep 2013 09:44:20 +0800
+Subject: [PATCH] vsftpd: change default value of secure_chroot_dir
 
 Upstream-Status: Pending
 
 Change secure_chroot_dir pointing to a volatile directory.
 
 Signed-off-by: Ming Liu <ming.liu@windriver.com>
+
 ---
- INSTALL       |    6 +++---
- tunables.c    |    2 +-
- vsftpd.conf.5 |    2 +-
+ INSTALL       | 6 +++---
+ tunables.c    | 2 +-
+ vsftpd.conf.5 | 2 +-
  3 files changed, 5 insertions(+), 5 deletions(-)
 
-diff -urpN a/INSTALL b/INSTALL
---- a/INSTALL	2013-09-13 10:23:57.504972397 +0800
-+++ b/INSTALL	2013-09-13 10:25:25.664971779 +0800
-@@ -27,11 +27,11 @@ user in case it does not already exist. 
+diff --git a/INSTALL b/INSTALL
+index 4f811aa..427122a 100644
+--- a/INSTALL
++++ b/INSTALL
+@@ -27,11 +27,11 @@ user in case it does not already exist. e.g.:
  [root@localhost root]# useradd nobody
  useradd: user nobody exists
  
@@ -29,9 +34,10 @@ diff -urpN a/INSTALL b/INSTALL
  
  2c) For anonymous FTP, you will need the user "ftp" to exist, and have a
  valid home directory (which is NOT owned or writable by the user "ftp").
-diff -urpN a/tunables.c b/tunables.c
---- a/tunables.c	2013-09-13 10:26:29.554972817 +0800
-+++ b/tunables.c	2013-09-13 10:27:18.104972210 +0800
+diff --git a/tunables.c b/tunables.c
+index 284a10d..8c63c3f 100644
+--- a/tunables.c
++++ b/tunables.c
 @@ -254,7 +254,7 @@ tunables_load_defaults()
    /* -rw------- */
    tunable_chown_upload_mode = 0600;
@@ -41,10 +47,11 @@ diff -urpN a/tunables.c b/tunables.c
    install_str_setting("ftp", &tunable_ftp_username);
    install_str_setting("root", &tunable_chown_username);
    install_str_setting("/var/log/xferlog", &tunable_xferlog_file);
-diff -urpN a/vsftpd.conf.5 b/vsftpd.conf.5
---- a/vsftpd.conf.5	2013-09-13 10:09:33.774972462 +0800
-+++ b/vsftpd.conf.5	2013-09-13 10:10:41.914971989 +0800
-@@ -969,7 +969,7 @@ This option should be the name of a dire
+diff --git a/vsftpd.conf.5 b/vsftpd.conf.5
+index fcc6022..e4ffdee 100644
+--- a/vsftpd.conf.5
++++ b/vsftpd.conf.5
+@@ -969,7 +969,7 @@ This option should be the name of a directory which is empty. Also, the
  directory should not be writable by the ftp user. This directory is used
  as a secure chroot() jail at times vsftpd does not require filesystem access.
  
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch
index c3919e1..d81c94a 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch
@@ -1,9 +1,10 @@
-From e55135c2a4ea7eae3cb1f4dccf69ca477ea095bf Mon Sep 17 00:00:00 2001
+From c5caf52b9ed79da8916ef5722efe6df61a856e2f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 28 Mar 2017 20:09:12 -0700
 Subject: [PATCH] sysdeputil.c: Fix with musl which does not have utmpx
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  sysdeputil.c | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
@@ -23,6 +24,3 @@ index 06f01f4..a8cff3b 100644
  
  #define __USE_GNU
  #include <utmpx.h>
--- 
-2.12.1
-
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-sysinfo-in-the-seccomp-sandbox.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-sysinfo-in-the-seccomp-sandbox.patch
index 7accbbc..c6c0f80 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-sysinfo-in-the-seccomp-sandbox.patch
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-sysinfo-in-the-seccomp-sandbox.patch
@@ -1,4 +1,4 @@
-From 37cc924363515c8c309944c455bcbba7ddcc8eda Mon Sep 17 00:00:00 2001
+From 9c4826c19f04da533886209361a2caddf582d65c Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Tue, 6 Sep 2016 17:17:44 +0800
 Subject: [PATCH] vsftpd: allow sysinfo() in the seccomp sandbox
@@ -24,6 +24,7 @@ ftp> mget small*
 OOPS: priv_sock_get_cmd
 
 Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+
 ---
  seccompsandbox.c | 1 +
  1 file changed, 1 insertion(+)
@@ -40,6 +41,3 @@ index 2c350a9..67d9ca5 100644
    /* Misc */
    allow_nr(__NR_umask);
  
--- 
-2.8.1
-
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-destdir.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-destdir.patch
index 1980d09..5ad5c14 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-destdir.patch
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-destdir.patch
@@ -1,14 +1,22 @@
-Use DESTDIR within install to allow installing under a prefix
+From bab3f62f1fd5b7c2ab197f4311ad191bf18816b9 Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Mon, 20 Feb 2012 13:51:49 +0000
+Subject: [PATCH] Use DESTDIR within install to allow installing under a prefix
 
 Upstream-Status: Pending
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 
+---
+ Makefile | 26 +++++++++++++-------------
+ 1 file changed, 13 insertions(+), 13 deletions(-)
+
 diff --git a/Makefile b/Makefile
+index c63ed1b..9e4f35f 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -24,21 +24,21 @@
- 	$(CC) -o vsftpd $(OBJS) $(LINK) $(LIBS)
+@@ -29,21 +29,21 @@ vsftpd: $(OBJS)
+ 	$(CC) -o vsftpd $(OBJS) $(LINK) $(LDFLAGS) $(LIBS)
  
  install:
 -	if [ -x /usr/local/sbin ]; then \
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-libs.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-libs.patch
index 9a10f72..d2e58a3 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-libs.patch
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-libs.patch
@@ -1,4 +1,8 @@
-Hardcode LIBS instead of using a script to determine available libs
+From 328799d0cd5c523ad7a814fefec16d8a84aa8010 Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Tue, 16 Apr 2013 10:53:55 +0000
+Subject: [PATCH] Hardcode LIBS instead of using a script to determine
+ available libs
 
 We want to avoid this dynamic detection so we have a deterministic
 build.
@@ -7,15 +11,20 @@ Upstream-Status: Inappropriate [config]
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
 diff --git a/Makefile b/Makefile
+index 9e4f35f..3a5535d 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -5,7 +5,7 @@
- #CFLAGS = -g
- CFLAGS	=	-O2 -Wall -W -Wshadow #-pedantic -Werror -Wconversion
+@@ -8,7 +8,7 @@ CFLAGS	=	-O2 -fPIE -fstack-protector --param=ssp-buffer-size=4 \
+ 	-D_FORTIFY_SOURCE=2 \
+ 	#-pedantic -Wconversion
  
 -LIBS	=	`./vsf_findlibs.sh`
 +LIBS	=	-lssl -lcrypto -lnsl -lresolv
  LINK	=	-Wl,-s
+ LDFLAGS	=	-fPIE -pie -Wl,-z,relro -Wl,-z,now
  
- OBJS	=	main.o utility.o prelogin.o ftpcmdio.o postlogin.o privsock.o \
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-strip.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-strip.patch
index fd31600..e596073 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-strip.patch
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-strip.patch
@@ -1,10 +1,18 @@
-Disable stripping at link time
+From 261874ea47973ea156141185082252fc92081906 Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Tue, 16 Apr 2013 10:53:55 +0000
+Subject: [PATCH] Disable stripping at link time
 
 Upstream-Status: Inappropriate [config]
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 
+---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
 diff --git a/Makefile b/Makefile
+index 3a5535d..e78019a 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -9,7 +9,6 @@ CFLAGS	=	-O2 -fPIE -fstack-protector --param=ssp-buffer-size=4 \
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam-with-tcp_wrappers.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam-with-tcp_wrappers.patch
index fdcf3a0..a4387c1 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam-with-tcp_wrappers.patch
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam-with-tcp_wrappers.patch
@@ -1,11 +1,20 @@
-Disable PAM
+From 71628ddc91b6efb9b922a3fcf8cc18522f5387be Mon Sep 17 00:00:00 2001
+From: "Roy.Li" <rongqing.li@windriver.com>
+Date: Mon, 20 Feb 2012 13:51:49 +0000
+Subject: [PATCH] Disable PAM
 
 Upstream-Status: Inappropriate [config]
 
 Signed-off-by: Roy.Li <rongqing.li@windriver.com>
-diff -ur vsftpd-2.0.1_org/builddefs.h vsftpd-2.0.1_patch/builddefs.h
---- vsftpd-2.0.1_org/builddefs.h	2004-07-02 16:36:59.000000000 +0200
-+++ vsftpd-2.0.1_patch/builddefs.h	2004-07-21 09:34:49.044900488 +0200
+
+---
+ builddefs.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/builddefs.h b/builddefs.h
+index 0106d1a..f48a568 100644
+--- a/builddefs.h
++++ b/builddefs.h
 @@ -2,7 +2,7 @@
  #define VSF_BUILDDEFS_H
  
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-2.1.0-filter.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-2.1.0-filter.patch
index 32f7e82..590eb58 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-2.1.0-filter.patch
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-2.1.0-filter.patch
@@ -1,4 +1,7 @@
-Fix the CVE-2015-1419
+From b756444854c5ab3b1284fd7113043fe8860e99ec Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Fri, 24 Apr 2015 09:36:48 +0800
+Subject: [PATCH] Fix the CVE-2015-1419
 
 Upstream-Status: Pending
 
@@ -9,10 +12,17 @@ ftp://195.220.108.108/linux/fedora/linux/development/rawhide/source/SRPMS/v/vsft
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 
-diff -up vsftpd-2.1.0/ls.c.filter vsftpd-2.1.0/ls.c
---- vsftpd-2.1.0/ls.c.filter	2008-02-02 02:30:41.000000000 +0100
-+++ vsftpd-2.1.0/ls.c	2009-01-08 19:31:15.000000000 +0100
-@@ -239,9 +239,31 @@ vsf_filename_passes_filter(const struct 
+---
+ ls.c  | 26 ++++++++++++++++++++++++--
+ str.c | 11 +++++++++++
+ str.h |  1 +
+ 3 files changed, 36 insertions(+), 2 deletions(-)
+
+diff --git a/ls.c b/ls.c
+index 7e1376d..e9302dd 100644
+--- a/ls.c
++++ b/ls.c
+@@ -246,9 +246,31 @@ vsf_filename_passes_filter(const struct mystr* p_filename_str,
    int ret = 0;
    char last_token = 0;
    int must_match_at_current_pos = 1;
@@ -46,10 +56,11 @@ diff -up vsftpd-2.1.0/ls.c.filter vsftpd-2.1.0/ls.c
    while (!str_isempty(&filter_remain_str) && *iters < VSFTP_MATCHITERS_MAX)
    {
      static struct mystr s_match_needed_str;
-diff -up vsftpd-2.1.0/str.c.filter vsftpd-2.1.0/str.c
---- vsftpd-2.1.0/str.c.filter	2008-12-17 06:54:16.000000000 +0100
-+++ vsftpd-2.1.0/str.c	2009-01-08 19:31:15.000000000 +0100
-@@ -680,3 +680,14 @@ str_replace_unprintable(struct mystr* p_
+diff --git a/str.c b/str.c
+index 6596204..ba4b92a 100644
+--- a/str.c
++++ b/str.c
+@@ -711,3 +711,14 @@ str_replace_unprintable(struct mystr* p_str, char new_char)
    }
  }
  
@@ -64,10 +75,11 @@ diff -up vsftpd-2.1.0/str.c.filter vsftpd-2.1.0/str.c
 +  if (str_isempty(d_str))
 +   str_copy (d_str, path);
 +}
-diff -up vsftpd-2.1.0/str.h.filter vsftpd-2.1.0/str.h
---- vsftpd-2.1.0/str.h.filter	2008-12-17 06:53:23.000000000 +0100
-+++ vsftpd-2.1.0/str.h	2009-01-08 19:32:14.000000000 +0100
-@@ -100,6 +100,7 @@ void str_replace_unprintable(struct myst
+diff --git a/str.h b/str.h
+index ab0a9a4..3a21b50 100644
+--- a/str.h
++++ b/str.h
+@@ -100,6 +100,7 @@ void str_replace_unprintable(struct mystr* p_str, char new_char);
  int str_atoi(const struct mystr* p_str);
  filesize_t str_a_to_filesize_t(const struct mystr* p_str);
  unsigned int str_octal_to_uint(const struct mystr* p_str);
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-tcp_wrappers-support.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-tcp_wrappers-support.patch
index 69745b3..c558aee 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-tcp_wrappers-support.patch
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-tcp_wrappers-support.patch
@@ -1,11 +1,15 @@
-Enable tcp_wrapper.
+From c026b0c0de4eebb189bc77b2d4c3b9528454ac04 Mon Sep 17 00:00:00 2001
+From: "Roy.Li" <rongqing.li@windriver.com>
+Date: Fri, 19 Jul 2013 10:19:25 +0800
+Subject: [PATCH] Enable tcp_wrapper.
 
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+
 ---
- builddefs.h |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ builddefs.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/builddefs.h b/builddefs.h
 index e908352..0106d1a 100644
@@ -20,6 +24,3 @@ index e908352..0106d1a 100644
  #define VSF_BUILD_PAM
  #undef VSF_BUILD_SSL
  
--- 
-1.7.1
-
-- 
2.7.4


