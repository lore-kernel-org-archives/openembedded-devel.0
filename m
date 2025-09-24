Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB8FCAC5AE
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 03:59:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by mx.groups.io with SMTP id smtpd.web10.4828.1758686369007389432
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 20:59:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Wd+Fwd50;
 spf=pass (domain: intel.com, ip: 192.198.163.13, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758686375; x=1790222375;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=jwyxlH59C5cNnU/a+MlOONbW72jxytT9Sqb2fRKdfoY=;
  b=Wd+Fwd50crhqgSxLBgFo0jkZfuWkvHUMyQ/pZJ1i302M7WxSDZCg52Ge
   zeLdFQrRtSJ6Ss/bTyweehWLU1qpWO//nn259w/ShLHauMwGoybWwZTv7
   DoU9OFbSADhEt1vecktKp+y8iT1BeIZoFu0ZnkHX3riafLpO8vpFyGePR
   tgMdiz6u2IX8XjBBseDYaQMiVdC3NApu7z46ektO1HjaQzsCEUOa6u7xK
   Fv8V56xY1ba17R/CXj1caRyOgCeEA/XS2cuC9bcl2rfQaR14sp016Dnds
   iWlB56qM1Rr7hugrE2utdDwxIQJ9vKlQr8qIIqfi37b8fouoZbm9HOOF4
   w==;
X-CSE-ConnectionGUID: wQm9cV2hShuxq92IdRALrQ==
X-CSE-MsgGUID: U38yiFMQR9qPM1fE0Wykdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="63602895"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="63602895"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 20:59:35 -0700
X-CSE-ConnectionGUID: gsBAHTncSuWj7tVtjXyq+Q==
X-CSE-MsgGUID: vck1abTjTn+4ZjCH6pcEEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="176873680"
Received: from unknown (HELO anmitta2-mobl4.png.intel.com) ([10.107.11.67])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 20:59:34 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 7/8] procmail: Fix build with GCC-14
Date: Wed, 24 Sep 2025 11:59:22 +0800
Message-ID: <20250924035923.35477-7-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924035923.35477-1-anuj.mittal@intel.com>
References: <20250924035923.35477-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 03:59:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119747

From: Khem Raj <raj.khem@gmail.com>

aids building on newer build hosts which now have moved to gcc-14
as well, so using cmdline option just for target compile is not
enough as it runs tests using host compiler as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6d13c58e386d478b8788f440b7815cb866b9d6f0)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../procmail/procmail/gcc14.patch             | 127 ++++++++++++++++++
 .../recipes-support/procmail/procmail_3.22.bb |   4 +-
 2 files changed, 130 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/procmail/procmail/gcc14.patch

diff --git a/meta-oe/recipes-support/procmail/procmail/gcc14.patch b/meta-oe/recipes-support/procmail/procmail/gcc14.patch
new file mode 100644
index 0000000000..5ca56fa006
--- /dev/null
+++ b/meta-oe/recipes-support/procmail/procmail/gcc14.patch
@@ -0,0 +1,127 @@
+From: Santiago Vila <sanvila@debian.org>
+Subject: Fix build with gcc-14
+Bug-Debian: https://bugs.debian.org/1075398
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/initmake
++++ b/initmake
+@@ -124,7 +124,7 @@ else
+ fi
+ 
+ cat >_autotst.c <<HERE
+-main()
++int main()
+ { return 0;
+ }
+ HERE
+@@ -200,7 +200,7 @@ cat >_autotst.c <<HERE
+ #include <sys/types.h>
+ #include <stdio.h>
+ #include <sys/stat.h>
+-main()
++int main()
+ { struct stat buf;return!&buf;
+ }
+ HERE
+--- a/src/autoconf
++++ b/src/autoconf
+@@ -414,6 +414,12 @@ cat >_autotst.c <<HERE
+ int dolock,child[NR_of_forks],timeout,fdcollect;
+ char dirlocktest[]="_locktest";
+ 
++#include <stdlib.h>
++int killchildren();
++int fdlock(int fd);
++int sfdlock(int fd);
++int fdunlock();
++
+ void stimeout()
+ { timeout=1;close(fdcollect);killchildren();
+ }
+@@ -435,7 +441,7 @@ unsigned sfork()
+   return pid;
+ }
+ 
+-int main(argc,argv)char*argv[];
++int main(int argc,char*argv[])
+ { int goodlock,testlock,i,pip[2],pipw[2];time_t otimet;unsigned dtimet;
+   static char filename[]="_locktst.l0";
+   close(0);goodlock=0;testlock=FIRST_lock;signal(SIGPIPE,SIG_DFL);
+@@ -585,13 +591,13 @@ int killchildren()
+   return 0;
+ }
+ 
+-int sfdlock(fd)
++int sfdlock(int fd)
+ { int i;unsigned gobble[GOBBLE>>2];
+   for(i=GOBBLE>>2;i;gobble[--i]=~(unsigned)0);		 /* SunOS crash test */
+   return fdlock(fd);
+ }
+ 
+-static oldfdlock;
++static int oldfdlock;
+ #ifdef F_SETLKW
+ static struct flock flck;		/* why can't it be a local variable? */
+ #endif
+@@ -599,7 +605,7 @@ static struct flock flck;		/* why can't
+ static off_t oldlockoffset;
+ #endif
+ 
+-int fdlock(fd)
++int fdlock(int fd)
+ { int i;unsigned gobble[GOBBLE>>2];
+   for(i=GOBBLE>>2;i;gobble[--i]=~(unsigned)0);		 /* SunOS crash test */
+   oldfdlock=fd;fd=0;
+@@ -993,11 +999,11 @@ int main(){int i;i=1;
+  i+=WIFEXITED(i);
+  i+=WIFSTOPPED(i);
+  i+=WEXITSTATUS(i);
+- i+=WSIGTERM(i);
++ i+=WTERMSIG(i);
+  return i;}
+ HERE
+ 
+-echo 'Testing for WIFEXITED(), WIFSTOPPED(), WEXITSTATUS() & WSIGTERM()'
++echo 'Testing for WIFEXITED(), WIFSTOPPED(), WEXITSTATUS() & WTERMSIG()'
+ if $MAKE _autotst.$O >_autotst.rrr 2>&1
+ then
+    $FGREP -v include/ <_autotst.rrr >_autotst.$O
+@@ -1029,6 +1035,8 @@ cat >_autotst.c <<HERE
+ #ifndef NO_COMSAT
+ #include "network.h"
+ #endif
++int setrgid();
++int setresgid();
+ int main(){char a[2];
+  endpwent();endgrent();memmove(a,"0",1);bcopy("0",a,1);strcspn(a,"0");
+  strtol("0",(char**)0,10);strchr("0",'0');strpbrk(a,"0");rename(a,"0");
+@@ -1059,7 +1067,7 @@ echo 'Testing for memmove, strchr, strpb
+ echo '	rename, setrgid, setegid, pow, opendir, mkdir, waitpid, fsync,'
+ echo '	ftruncate, strtod, strncasecmp, strerror, strlcat,'
+ echo '	memset, bzero, and _exit'
+-if $MAKE _autotst.$O >$DEVNULL 2>&1
++if $MAKE _autotst.$O >_autotst.rrr 2>&1
+ then
+ :
+ else
+@@ -1196,7 +1204,7 @@ unsigned long dobench(strstr,iter,haysta
+   return (unsigned long)clock()-to;
+ }
+ #endif
+-int main(argc,argv)int argc;const char*argv[];
++int main(int argc,const char*argv[])
+ { if(argc==1)
+    { char*haystack;
+ #ifdef BENCHSIZE
+--- a/src/mailfold.c
++++ b/src/mailfold.c
+@@ -378,7 +378,7 @@ void concon(ch)const int ch;   /* flip b
+    }
+ }
+ 
+-void readmail(rhead,tobesent)const long tobesent;
++void readmail(int rhead,const long tobesent)
+ { char*chp,*pastend;static size_t contlengthoffset;
+   ;{ long dfilled;
+      if(rhead==2)		  /* already read, just examine what we have */
diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb b/meta-oe/recipes-support/procmail/procmail_3.22.bb
index 16fcf84dad..604dd285e8 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://www.ring.gr.jp/archives/net/mail/${BPN}/${BP}.tar.gz \
     file://man-file-mailstat.1-from-debian.patch \
     file://CVE-2014-3618.patch \
     file://CVE-2017-16844.patch \
+    file://gcc14.patch \
 "
 SRC_URI[md5sum] = "1678ea99b973eb77eda4ecf6acae53f1"
 SRC_URI[sha256sum] = "087c75b34dd33d8b9df5afe9e42801c9395f4bf373a784d9bc97153b0062e117"
@@ -25,6 +26,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a71e50e197a992c862379e576e669757 \
 
 DEPENDS = "libnet"
 inherit autotools-brokensep
+
 do_configure() {
     find examples -type f | xargs chmod 644
     export CC="${BUILD_CC}"
@@ -36,7 +38,7 @@ do_configure() {
 }
 
 do_compile() {
-    oe_runmake -i CFLAGS="$TARGET_CFLAGS -Wno-comments -Wno-implicit-int -Wno-implicit-function-declaration -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${LDFLAGS}"
+    oe_runmake -i CFLAGS="$TARGET_CFLAGS -Wno-comments -Wno-implicit-function-declaration -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${LDFLAGS}"
 }
 
 do_install() {

