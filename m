Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF29C61DB2
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 08:31:24 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.54748.1749457879428621331
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 01:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KzpK2NLa;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749457879; x=1780993879;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9hkYhw3+HhgM2u67o8VpOZL+uhUW2E4wr9TZlWzJmVs=;
  b=KzpK2NLazS4OkkAU69KfagsezYBMfMVgsrrtCzLD+vnt3ROhdOtHKy89
   E8vwYz3UhLRvKdEVFf5a6KnSLWAoYWTBX2BerdMMlW5/2qh/sosBESgWF
   fAqqC/r7vK2kYjziZsIz1Dj4tk4H1DdWNwFg1r4qGerWvj2BU5dvzU95S
   yf4Do3nLWDjZn7Jsf29SRWGciFgVjRmwu0G9RA9tQRhrc086S4nkVoWlT
   w5hS6GbuqPtTeHA0sPalioWvGX3D40IiYhWTfxfZxe5cdLrI4uSUkcV/7
   Wk/3j3JjvNO3jY/bDXgPn2clUP/9wtsSuvo9kfxEdqADJIEHzRnAa5nHN
   w==;
X-CSE-ConnectionGUID: IJj5Hqi8TZmcIWS0GA9GYw==
X-CSE-MsgGUID: SQ2+TntkTZWerhlvbiQtvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="181632953"
X-IronPort-AV: E=Sophos;i="6.16,222,1744038000"; 
   d="scan'208";a="181632953"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 17:31:16 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2EF6ED8E64
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Jun 2025 17:31:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D774294B02
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Jun 2025 17:31:13 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0BABE1A009A;
	Mon,  9 Jun 2025 16:31:12 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-oe] [PATCH] procmail: fix compile failure with gcc-15
Date: Mon,  9 Jun 2025 16:31:01 +0800
Message-ID: <20250609083102.1925-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Jun 2025 08:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117783

These failures doesn't broken compiling, but not generate files under /usr/bin
| userland@pumpkin3:/mnt/test/build_auh/tmp/work/core2-64-poky-linux/procmail/3.22/image/usr/bin$ ls
| formail  lockfile  mailstat  procmail

part of error messages:
| In file included from recommend.c:6:
| includes.h:334:12: error: conflicting types for 'uname'; have 'int(void)'
|   334 | extern int uname();                                      /* so we fix it :-) /
|       |            ^~~~~
| In file included from sublib.c:13:
| includes.h:334:12: error: conflicting types for 'uname'; have 'int(void)'
|   334 | extern int uname();                                      / so we fix it :-) /
|       |            ^~~~~
| In file included from procmail.h:3,
|                  from procmail.c:20:
| includes.h:334:12: error: conflicting types for 'uname'; have 'int(void)'
|   334 | extern int uname();                                      / so we fix it :-) */
|       |            ^~~~~
| In file included from includes.h:67:
| /datadrive/ubinux/workdir/build-dir/202506/build-ubinux-armv8/tmp/work/aarch64-ubinux-linux/procmail/3.22/recipe-sysroot/usr/include/sys/utsname.h:81:12: note: previous declaration of 'uname' with type 'int(struct utsname *)'
|    81 | extern int uname (struct utsname *__name) _THROW;
|       |            ^~~~~
| In file included from includes.h:67:
| /datadrive/ubinux/workdir/build-dir/202506/build-ubinux-armv8/tmp/work/aarch64-ubinux-linux/procmail/3.22/recipe-sysroot/usr/include/sys/utsname.h:81:12: note: previous declaration of 'uname' with type 'int(struct utsname )'
|    81 | extern int uname (struct utsname _name) THROW;
|       |            ^~~~~
| In file included from includes.h:67:
| /datadrive/ubinux/workdir/build-dir/202506/build-ubinux-armv8/tmp/work/aarch64-ubinux-linux/procmail/3.22/recipe-sysroot/usr/include/sys/utsname.h:81:12: note: previous declaration of 'uname' with type 'int(struct utsname )'
|    81 | extern int uname (struct utsname __name) __THROW;
|       |            ^~~~~
| In file included from includes.h:67:
| /datadrive/ubinux/workdir/build-dir/202506/build-ubinux-armv8/tmp/work/aarch64-ubinux-linux/procmail/3.22/recipe-sysroot/usr/include/sys/utsname.h:81:12: note: previous declaration of 'uname' with type 'int(struct utsname )'
|    81 | extern int uname (struct utsname __name) __THROW;
|       |            ^~~~~
| recommend.c: In function 'main':
| recommend.c:15:5: warning: old-style function definition [-Wold-style-definition]
|    15 | int main(argc,argv)const int argc;const charconst argv[];
|       |     ^~~~
| procmail.c: In function 'savepass':
| procmail.c:71:22: warning: old-style function definition [-Wold-style-definition]
|    71 | static auth_identitysavepass(spass,uid)auth_identityconst spass;
|       |                      ^~~~~~~~
| procmail.c:76:12: error: too many arguments to function 'auth_finduid'; expected 0, have 2
|    76 |   if(tpass=auth_finduid(uid,0))                           / save by copying */
|       |            ^~~~~~~~~~~~ ~~~
| In file included from procmail.c:36:
| authenticate.h:15:3: note: declared here
|    15 |  auth_finduid Q((const uid_t uid,const int sock));
|       |   ^~~~~~~~~~~~
| procmail.c: In function 'main':
| procmail.c:97:5: warning: old-style function definition [-Wold-style-definition]
|    97 | int main(argc,argv)int argc;const charconst argv[];
|       |     ^~~~
| procmail.c:212:9: error: too many arguments to function 'checkprivFrom'; expected 0, have 3
|   212 |         checkprivFrom(euid,passinvk?auth_username(passinvk):0,override);
|       |         ^~~~~~~~~~~~~~ ~~~~
| In file included from procmail.c:41:
| from.h:9:2: note: declared here
|     9 |  checkprivFrom Q((uid_t euid,const charlogname,int override));
|       |  ^~~~~~~~~~~~~~
| procmail.c:213:9: error: too many arguments to function 'doumask'; expected 0, have 1
|   213 |         doumask(INIT_UMASK);               / allowed to set the From line? */
|       |         ^~~~~~~

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../0001-fix-too-many-arguments-issue.patch   | 88 +++++++++++++++++++
 .../procmail/0001-fix-uname-declaration.patch | 27 ++++++
 .../recipes-support/procmail/procmail_3.22.bb |  4 +-
 3 files changed, 118 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/procmail/procmail/0001-fix-too-many-arguments-issue.patch
 create mode 100644 meta-oe/recipes-support/procmail/procmail/0001-fix-uname-declaration.patch

diff --git a/meta-oe/recipes-support/procmail/procmail/0001-fix-too-many-arguments-issue.patch b/meta-oe/recipes-support/procmail/procmail/0001-fix-too-many-arguments-issue.patch
new file mode 100644
index 0000000000..e7eafecbfe
--- /dev/null
+++ b/meta-oe/recipes-support/procmail/procmail/0001-fix-too-many-arguments-issue.patch
@@ -0,0 +1,88 @@
+From 6f00795de8623347580c4366cb517a6653f73ca4 Mon Sep 17 00:00:00 2001
+From: Liu Yiding <liuyd.fnst@fujitsu.com>
+Date: Mon, 9 Jun 2025 08:01:39 +0000
+Subject: [PATCH] fix too many arguments issue
+
+fix issue like:
+| procmail.c:76:12: error: too many arguments to function 'auth_finduid'; expected 0, have 2
+|    76 |   if(tpass=auth_finduid(uid,0))                           /* save by copying */
+|       |            ^~~~~~~~~~~~ ~~~
+| In file included from procmail.c:36:
+| authenticate.h:15:3: note: declared here
+|    15 |  *auth_finduid Q((const uid_t uid,const int sock));
+| --
+| procmail.c:212:9: error: too many arguments to function 'checkprivFrom_'; expected 0, have 3
+|   212 |         checkprivFrom_(euid,passinvk?auth_username(passinvk):0,override);
+|       |         ^~~~~~~~~~~~~~ ~~~~
+| In file included from procmail.c:41:
+| from.h:9:2: note: declared here
+|     9 |  checkprivFrom_ Q((uid_t euid,const char*logname,int override));
+| --
+| procmail.c:213:9: error: too many arguments to function 'doumask'; expected 0, have 1
+|   213 |         doumask(INIT_UMASK);               /* allowed to set the From_ line? */
+|       |         ^~~~~~~
+| In file included from procmail.c:23:
+| robust.h:12:2: note: declared here
+|    12 |  doumask Q((const mode_t mask));
+
+Upstream-Status: Pending
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+---
+ src/authenticate.h | 2 +-
+ src/exopen.c       | 2 +-
+ src/includes.h     | 2 +-
+ src/misc.h         | 1 +
+ 4 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/src/authenticate.h b/src/authenticate.h
+index be9d88d..31e665a 100644
+--- a/src/authenticate.h
++++ b/src/authenticate.h
+@@ -7,7 +7,7 @@ typedef struct auth_identity auth_identity;
+ 
+ #ifndef P
+ #define P(x)	x
+-#define Q(x)	()
++#define Q(x)	x
+ #endif
+ 
+ /*const*/auth_identity
+diff --git a/src/exopen.c b/src/exopen.c
+index c7647e5..46e3467 100644
+--- a/src/exopen.c
++++ b/src/exopen.c
+@@ -51,7 +51,7 @@ static const char*safehost P((void)) /* return a hostname safe for filenames */
+   return sname;
+ }
+ 
+-int unique(full,p,len,mode,verbos,flags)char*const full;char*p;
++int unique(full,p,len,mode,verbos,flags)const char*const full;char*p;
+  const size_t len;const mode_t mode;const int verbos,flags;
+ { static const char s2c[]=".,+%";static int serial=STRLEN(s2c);
+   static time_t t;char*dot,*end,*host;struct stat filebuf;
+diff --git a/src/includes.h b/src/includes.h
+index 7d6b41f..134805b 100644
+--- a/src/includes.h
++++ b/src/includes.h
+@@ -530,7 +530,7 @@ extern void*memmove();
+  * problems caused by one of those types being shorter than int and thereby
+  * being passed differently under ANSI rules.
+  */
+-#define Q(args)		()
++#define Q(args)		args
+ 
+ #ifdef oBRAIN_DAMAGE
+ #undef oBRAIN_DAMAGE
+diff --git a/src/misc.h b/src/misc.h
+index 4f62ebc..659dfcb 100644
+--- a/src/misc.h
++++ b/src/misc.h
+@@ -1,4 +1,5 @@
+ /*$Id: misc.h,v 1.56 2001/06/30 01:14:19 guenther Exp $*/
++#include "authenticate.h"
+ 
+ struct dyna_array{int filled,tspace;char*vals;};
+ union offori{off_t o;int i;};
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-support/procmail/procmail/0001-fix-uname-declaration.patch b/meta-oe/recipes-support/procmail/procmail/0001-fix-uname-declaration.patch
new file mode 100644
index 0000000000..cb517fb93c
--- /dev/null
+++ b/meta-oe/recipes-support/procmail/procmail/0001-fix-uname-declaration.patch
@@ -0,0 +1,27 @@
+From a9e57d4048c94f6bc2533ccc41e6c35d4416571a Mon Sep 17 00:00:00 2001
+From: Liu Yiding <liuyd.fnst@fujitsu.com>
+Date: Mon, 9 Jun 2025 06:44:06 +0000
+Subject: [PATCH] fix uname declaration
+
+Upstream-Status: Pending
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+---
+ src/includes.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/includes.h b/src/includes.h
+index 4466907..7d6b41f 100644
+--- a/src/includes.h
++++ b/src/includes.h
+@@ -331,7 +331,7 @@ extern int errno;
+ 
+ #ifndef NOuname
+ #ifndef P		  /* SINIX V5.23 has the wrong prototype for uname() */
+-extern int uname();					 /* so we fix it :-) */
++extern int uname(struct utsname *);
+ #define Uname(name)		((int(*)(struct utsname*))uname)(name)
+ #else
+ #define Uname(name)		uname(name)		    /* no fix needed */
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb b/meta-oe/recipes-support/procmail/procmail_3.22.bb
index 86d75e8c7c..47c8310eaf 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
@@ -16,6 +16,8 @@ SRC_URI = "http://www.ring.gr.jp/archives/net/mail/${BPN}/${BP}.tar.gz \
     file://CVE-2014-3618.patch \
     file://CVE-2017-16844.patch \
     file://gcc14.patch \
+    file://0001-fix-uname-declaration.patch \
+    file://0001-fix-too-many-arguments-issue.patch \
 "
 SRC_URI[sha256sum] = "087c75b34dd33d8b9df5afe9e42801c9395f4bf373a784d9bc97153b0062e117"
 
@@ -37,7 +39,7 @@ do_configure() {
 }
 
 do_compile() {
-    oe_runmake -i CFLAGS="$TARGET_CFLAGS -Wno-comments -Wno-implicit-int -Wno-implicit-function-declaration -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${LDFLAGS}"
+    oe_runmake -i CFLAGS="$TARGET_CFLAGS -Wno-comments -Wno-implicit-int -Wno-implicit-function-declaration -Wno-incompatible-pointer-types -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${LDFLAGS}"
 }
 
 do_install() {
-- 
2.43.0


