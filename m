Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0764C35FF6
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 21:27:04 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.38348.1742160422532896874
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Mar 2025 14:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W5GOUmrh;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-223594b3c6dso72089645ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Mar 2025 14:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742160422; x=1742765222; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rs7m+t2Cvkb1404f0dOsf5OJxL4mfV8OJU4W8yHhp6w=;
        b=W5GOUmrhHBptA3GWd9jp4hTwEAHN1LYN8bgpFwqGGZplk0P7UXZfevEWfjcXNalFHP
         aFOeneDQRj5HdRrOwAY8GFiuZReECZi4dzhiP+3xNl/rqnFSrmT+md4SKhQ3Z2wZwlMy
         UgZ3t8EXkpX7njKda9fd1rxLk94Nj6dn9OYPg1Sl4cV37ygRbDhrHVr/YJkni46cFZGN
         6MV5DcIT8XmJJpYVHV19eIJtnfkGKIsgCvATnsDrNYUsOlCqfOPaFzAx48HQ9riA5MJM
         mas653+K4znNSSPBgRSN5m9tIY8hyp4Cz2MWcyv9HmbUDtx3OutSeyzrlVJCIT+o0z3X
         atrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742160422; x=1742765222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rs7m+t2Cvkb1404f0dOsf5OJxL4mfV8OJU4W8yHhp6w=;
        b=rhGmq1CcTOJmGsz6jnWXw/djRL8NDLotlrDlo8+af+EeRP5ClzIaSl0BJVY8f+tL4f
         XXOAdqWqxVFCOXJzy6arQfULJ331k9bpqOk90aDWs2cPOeZnv9GJH08d3rC1FNTPeukt
         oRPhRb2A2eKcbd41C/X/yqWkpfKHsug4CbAy1e9kQmUxuj3GtnXGbmCtWHy6AV3VQ1l3
         TjinBjWCVBk4gi3KCM1WTJtTbYlrq53FdBb2pSFMh3DPY8ts9v/v9nyHZrJILSkMtDPf
         Hq1rYSHrGiuxW+1eK2N2HxP7OsHLAEVjcPPfUBCXIAialnbOK+IPOzFhzP0IAaITSn+g
         Qhzg==
X-Gm-Message-State: AOJu0YwQxUI8X9llnhRoFR0QW21UwFlzXtIfquGAi18fwXQXdzZvNlRx
	exYSqbHILw4AYHi3F4g8uoneah/UKwfNCqo85T6MwfZzz9iNQSMJaMc7xhzB
X-Gm-Gg: ASbGncsTlS45a2+M/F/Ni3sQfetyhNBLHh2aK50mFPktFe1rads0SMp0RtjQDndWI6c
	C166p9spQBjJ9YoX2nZ9xFUN7aygHJRtoQu1GWd2RTQo0+pOlBQMicURBTYo6s5SN7CT3o/xtgj
	2LaTW1EU1zP6Ay3kxkpVosU4Z0+6kDCTJ2+Qo5nlulTJCOxLjndM/bHR+jUxVv3WEKgxF+q5VCP
	KkJJeWogsmR3shK1a0+hTY953wfgW/aCfSR8a4ltbOtFALVWp1g9IofSO1/vM6nb3VjqaGIGgn5
	XRb5d96mJST1ctJcH+e/sXV3VzQEodVR4pxt
X-Google-Smtp-Source: AGHT+IG7VwqG+MiaW5DyD+pf2XpDgYh4x8enI0cJakjRRv94kYRbJXYiFQF8m2oLae9RslsUaktH3A==
X-Received: by 2002:a17:902:d583:b0:215:b1a3:4701 with SMTP id d9443c01a7336-225e0a3a950mr112186835ad.13.1742160421638;
        Sun, 16 Mar 2025 14:27:01 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a4063sm62071105ad.65.2025.03.16.14.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 14:27:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] procmail: Fix build with GCC-14
Date: Sun, 16 Mar 2025 14:26:56 -0700
Message-ID: <20250316212656.3179516-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250316212656.3179516-1-raj.khem@gmail.com>
References: <20250316212656.3179516-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Mar 2025 21:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116005

aids building on newer build hosts which now have moved to gcc-14
as well, so using cmdline option just for target compile is not
enough as it runs tests using host compiler as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
index 59b78c0a6a..32fc12c7da 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://www.ring.gr.jp/archives/net/mail/${BPN}/${BP}.tar.gz \
     file://man-file-mailstat.1-from-debian.patch \
     file://CVE-2014-3618.patch \
     file://CVE-2017-16844.patch \
+    file://gcc14.patch \
 "
 SRC_URI[sha256sum] = "087c75b34dd33d8b9df5afe9e42801c9395f4bf373a784d9bc97153b0062e117"
 
@@ -24,6 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a71e50e197a992c862379e576e669757 \
 
 DEPENDS = "libnet"
 inherit autotools-brokensep
+
 do_configure() {
     find examples -type f | xargs chmod 644
     export CC="${BUILD_CC}"
@@ -35,7 +37,7 @@ do_configure() {
 }
 
 do_compile() {
-    oe_runmake -i CFLAGS="$TARGET_CFLAGS -Wno-comments -Wno-implicit-int -Wno-implicit-function-declaration -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${LDFLAGS}"
+    oe_runmake -i CFLAGS="$TARGET_CFLAGS -Wno-comments -Wno-implicit-function-declaration -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${LDFLAGS}"
 }
 
 do_install() {

