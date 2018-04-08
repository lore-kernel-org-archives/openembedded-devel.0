Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f51.google.com (mail-pl0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4597B7554F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:01 +0000 (UTC)
Received: by mail-pl0-f51.google.com with SMTP id 61-v6so3206310plb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=71KaNzZKuV17rHMyWR9CpATDzV3VjQFZMDJ5wtKleUY=;
	b=RvuU69kutzVS4OZOI2NPdGePXZjLHv+/eC8HBjoCD7KPHXTy4bEILgWXetWjZdGqdu
	Su+YS5g9V6V6mINkFTPtMc+9odtMxv+E4Gdk4U06kF2FBaxiS1Hg5vX4MENqiykMvr6M
	S9lwtmmS60cBviTpihf2FJg/X+j3I2/30cydME/Nef1i3xEy2epY6lIuA0mOJ3IuO+a/
	KmAoUn36Iwhv9PkFdLuVaHU2ScWwUPO1s+21noaAsZ9dX27wSWNQjgGDTbvPqvXodILE
	WG77SBW9pWCHGRrMleO8lOwqRR+rjPB2MJu9JKtj8xI5UOoynoiouNtDEZahYclqVadX
	yj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=71KaNzZKuV17rHMyWR9CpATDzV3VjQFZMDJ5wtKleUY=;
	b=p0fCz/V9BjoQ9ivGe54B+tsDI+gJkC6f6QGZr8EGdKulhTBYs0AW7G3R9WBkNTVdVJ
	2uHON2Yl/KPAVqzJCFAiKnJsKV6GaIo1/LD21h7IJOTJ0t1gG+1eFS/uXQ99K3C40/gs
	v7XULbxri7E3+Gzs5I2JPoqoVsFQOm1q4VHlArZgDX743KyREw1OYoH5WRaCdygOTMWC
	fGKvZurmQkc3ed2zSIRFnlkU7HvFkoGTlwlxOOcwNJ6TsaJ4sw2y87jylr6Ek/V9LFXc
	My73ZRdee6tJkhR9FnNOzaKzMrRylDFg5jaI1ScVFs/cLTXzhtnTarDiYBxJbxbxWVpS
	7iTw==
X-Gm-Message-State: AElRT7HQO9uxTBdxVXt8ipKw9T675AAMTIGuoZpr4vfwUgL9TSeGBTnd
	1mW2sqWqCpK6ChMHirP0S+U=
X-Google-Smtp-Source: AIpwx4+uN1xgXRvqk+dYvilnDGG4sHqh9AotyBGlQxqnviIfidlkmfGKQp6cs7Qdgk07MaSxJz5KlA==
X-Received: by 2002:a17:902:b611:: with SMTP id
	b17-v6mr33623703pls.27.1523170742350; 
	Sat, 07 Apr 2018 23:59:02 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:01 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:22 -0700
Message-Id: <1523170729-26321-10-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 10/37] vlock: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:59:01 -0000

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
checking file configure
Hunk #3 succeeded at 232 (offset -4 lines).
Hunk #4 succeeded at 356 (offset -5 lines).
checking file src/vlock-main.c
Hunk #1 succeeded at 112 with fuzz 1 (offset 1 line).
Hunk #2 succeeded at 184 (offset 1 line).
Hunk #3 succeeded at 194 (offset 1 line).
Hunk #4 succeeded at 223 (offset 1 line).

among others

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../vlock/vlock-2.2.3/disable_vlockrc.patch        | 30 ++++++++++++-------
 .../vlock/vlock-2.2.3/vlock-no_tally.patch         | 35 +++++++++++++++-------
 .../vlock/vlock-2.2.3/vlock_pam_tally2_reset.patch | 19 ++++++++----
 3 files changed, 58 insertions(+), 26 deletions(-)

diff --git a/meta-oe/recipes-extended/vlock/vlock-2.2.3/disable_vlockrc.patch b/meta-oe/recipes-extended/vlock/vlock-2.2.3/disable_vlockrc.patch
index ee0d074..2412bb8 100644
--- a/meta-oe/recipes-extended/vlock/vlock-2.2.3/disable_vlockrc.patch
+++ b/meta-oe/recipes-extended/vlock/vlock-2.2.3/disable_vlockrc.patch
@@ -1,13 +1,23 @@
+From f71cc920528c3496b0118964ebbcf5440cda4ed1 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Wed, 16 Aug 2017 13:37:40 +0800
+Subject: [PATCH] vlock: add new recipe
+
 Upstream-Status: Inappropriate [configuration]
 
 written by: Jeff Polk <jeff.polk@windriver.com>
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 
-Index: vlock-2.2.2/man/vlock.1
-===================================================================
---- vlock-2.2.2.orig/man/vlock.1	2010-07-26 14:12:42.000000000 -0400
-+++ vlock-2.2.2/man/vlock.1	2010-07-26 14:13:06.000000000 -0400
-@@ -111,11 +111,6 @@
+---
+ man/vlock.1  | 5 -----
+ src/vlock.sh | 5 -----
+ 2 files changed, 10 deletions(-)
+
+diff --git a/man/vlock.1 b/man/vlock.1
+index 0d29b49..01cb944 100644
+--- a/man/vlock.1
++++ b/man/vlock.1
+@@ -111,11 +111,6 @@ enter your password at the password prompt.  If this variable is unset or set
  to an invalid value or 0 no timeout is used.  \fBWarning\fR: If this value is
  too low, you may not be able to unlock your session.
  .PP
@@ -19,11 +29,11 @@ Index: vlock-2.2.2/man/vlock.1
  .SH SECURITY
  See the SECURITY file in the \fBvlock\fR distribution for more information.
  .PP
-Index: vlock-2.2.2/src/vlock.sh
-===================================================================
---- vlock-2.2.2.orig/src/vlock.sh	2010-07-26 14:12:32.000000000 -0400
-+++ vlock-2.2.2/src/vlock.sh	2010-07-26 14:13:33.000000000 -0400
-@@ -35,11 +35,6 @@
+diff --git a/src/vlock.sh b/src/vlock.sh
+index 75f1369..f572776 100644
+--- a/src/vlock.sh
++++ b/src/vlock.sh
+@@ -35,11 +35,6 @@ This TTY is now locked.
  
  ${VLOCK_ENTER_PROMPT}"
  
diff --git a/meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock-no_tally.patch b/meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock-no_tally.patch
index 6e8a6a9..3a344b2 100644
--- a/meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock-no_tally.patch
+++ b/meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock-no_tally.patch
@@ -1,8 +1,21 @@
+From 17e5c8d32abc214aea408f0837be41e88bce7eb2 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Wed, 16 Aug 2017 13:37:40 +0800
+Subject: [PATCH] vlock: add new recipe
+
 Upstream-Status: Pending
 
 written by: Jeff Polk <jeff.polk@windriver.com>
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 
+---
+ Makefile         | 4 ++++
+ configure        | 9 +++++++++
+ src/vlock-main.c | 8 ++++++++
+ 3 files changed, 21 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 4eeb42a..834cd2c 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -126,6 +126,10 @@ ifeq ($(AUTH_METHOD),shadow)
@@ -16,6 +29,8 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  ifeq ($(ENABLE_PLUGINS),yes)
  vlock-main: plugins.o plugin.o module.o process.o script.o tsort.o list.o
  # -rdynamic is needed so that the all plugin can access the symbols from console_switch.o
+diff --git a/configure b/configure
+index d5d84d6..1303598 100755
 --- a/configure
 +++ b/configure
 @@ -44,6 +44,7 @@ Optional Features:
@@ -36,7 +51,7 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
      pam|shadow)
        if [ "$2" = "yes" ] ; then
          if [ -n "$auth_method" ] && [ "$auth_method" != "$1" ] ; then
-@@ -232,6 +232,7 @@ set_defaults() {
+@@ -228,6 +232,7 @@ set_defaults() {
    AUTH_METHOD="pam"
    ENABLE_ROOT_PASSWORD="yes"
    ENABLE_PLUGINS="yes"
@@ -44,9 +59,7 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
    SCRIPTS=""
  
    VLOCK_GROUP="vlock"
-@@ -356,10 +356,14 @@ ENABLE_PLUGINS = ${ENABLE_PLUGINS}
- # which plugins should be build
- MODULES = ${MODULES}
+@@ -353,6 +358,10 @@ MODULES = ${MODULES}
  # which scripts should be installed
  SCRIPTS = ${SCRIPTS}
  
@@ -57,12 +70,12 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  # root's group
  ROOT_GROUP = ${ROOT_GROUP}
  
- # group for privileged plugins
- VLOCK_GROUP = ${VLOCK_GROUP}
+diff --git a/src/vlock-main.c b/src/vlock-main.c
+index 008f6f0..108ce8b 100644
 --- a/src/vlock-main.c
 +++ b/src/vlock-main.c
-@@ -111,7 +111,9 @@ static void restore_terminal(void)
-   (void) tcsetattr(STDIN_FILENO, TCSANOW, &term);
+@@ -112,7 +112,9 @@ static void restore_terminal(void)
+   (void) tcsetattr(STDIN_FILENO, TCSANOW, &old_term);
  }
  
 +#ifdef ENABLE_FAIL_COUNT
@@ -71,7 +84,7 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  
  static void auth_loop(const char *username)
  {
-@@ -181,7 +183,9 @@ static void auth_loop(const char *userna
+@@ -182,7 +184,9 @@ static void auth_loop(const char *username)
      }
  #endif
  
@@ -81,7 +94,7 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
    }
  
    /* Free timeouts memory. */
-@@ -189,11 +193,13 @@ static void auth_loop(const char *userna
+@@ -190,11 +194,13 @@ static void auth_loop(const char *username)
    free(prompt_timeout);
  }
  
@@ -95,7 +108,7 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  
  #ifdef USE_PLUGINS
  static void call_end_hook(void)
-@@ -216,7 +222,9 @@ int main(int argc, char *const argv[])
+@@ -217,7 +223,9 @@ int main(int argc, char *const argv[])
    if (username == NULL)
      fatal_perror("vlock: could not get username");
  
diff --git a/meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock_pam_tally2_reset.patch b/meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock_pam_tally2_reset.patch
index 4ce0abc..460b292 100644
--- a/meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock_pam_tally2_reset.patch
+++ b/meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock_pam_tally2_reset.patch
@@ -1,13 +1,22 @@
+From fcec4e7fe899f8c0077b3004eeccb7292a945a67 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Wed, 16 Aug 2017 13:37:40 +0800
+Subject: [PATCH] vlock: add new recipe
+
 Upstream-Status: Pending
 
 written by: Jeff Polk <jeff.polk@windriver.com>
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 
-Index: vlock-2.2.2/src/auth-pam.c
-===================================================================
---- vlock-2.2.2.orig/src/auth-pam.c	2010-06-14 14:38:51.000000000 -0400
-+++ vlock-2.2.2/src/auth-pam.c	2010-06-14 14:39:12.000000000 -0400
-@@ -148,6 +148,9 @@
+---
+ src/auth-pam.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/auth-pam.c b/src/auth-pam.c
+index 5cf93f6..c5cc67a 100644
+--- a/src/auth-pam.c
++++ b/src/auth-pam.c
+@@ -148,6 +148,9 @@ bool auth(const char *user, struct timespec *timeout)
  
    if (pam_status != PAM_SUCCESS) {
      fprintf(stderr, "vlock: %s\n", pam_strerror(pamh, pam_status));
-- 
2.7.4


