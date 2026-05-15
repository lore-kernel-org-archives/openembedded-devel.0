Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C9ECD343F
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 14:36:22 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36402.1778855781919159006
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2026 07:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=llNWplpg;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3025d725a05so4235517eec.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 07:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778855781; x=1779460581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EAdt4dny18mzSlrjAK7/uPSjmbqHUWLUlNE3sUhXWww=;
        b=llNWplpgeafG8GuBOVuTJOZBhUB/jaBDgIE22ENYBgbABFORfo2cSvdZ5232e8npSa
         vheh8qjfKPCpYYhg5VoCAwwmq0xj8yekqiV3Qse4KnsOxffAfMIYSvmZo6AhHRJAvk/o
         kNidLcMYO3sdTKvfbIxJS/cBQYk+kVgdaekZXlA+4uM/AGH2HqphSldVnzg27SX+iluj
         xFW8owjqLNysNvK7DLpxg0JeA+VlGd9HLklISy90IXUgHufS8sueREhzQDIfaDG6SUDa
         Oo/9irC0viIVPCaHwX6D3pwD1jAlGsvpwQdRVRE7JsoAjlhptK/a/wZD2ts3OlOvqq9y
         /E7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778855781; x=1779460581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAdt4dny18mzSlrjAK7/uPSjmbqHUWLUlNE3sUhXWww=;
        b=Et2w0dc+Ab6r63BbwABDyNqvqV6rH3lsdpgIYeNsCcDLbyb1giNPiyInibTAG5w/e/
         hRq2RjO8tXBYYf12ezlM/3eA4d30uAo2G2aNu1beT41PJGMHlSmxmkMZ5ayAZCI8op9/
         T1MKGOTQZEmcpsiOIp+W+pCM0YrU90/a3dtEBXfk6Bzt1TrHR2A5DwDPKATWRZNV1/kl
         n4YsFuVy14oN2vbnIblChxICyOT96ayDFSzcOSFR9ShfCcaxLL5sFpnpy/z5KX5/APgf
         BZ6WhUArIw8m6ulGwStD6xX3I8ye0I94/Kbg7jr5Z9QvK9p8OGy81G3lnqr6PlykUoD9
         xbbg==
X-Gm-Message-State: AOJu0Yy1sPDPb6B/hESKmVfJ6QYLKjRgM5Z0PoHtkgUPb57t9U/M3R7V
	Ewgu+WQaiR+qhHXnJh5Pv8K+IedI9iVLeLn0IfnJhI/7qiP5mZgpOJle0d6g+fd7Mlg=
X-Gm-Gg: Acq92OFQTPmVn54xb/BXa/ah4J+khe2thwFCgrgc0tfBvngRogZxRChNzwzjNmlxvpN
	RVCV/D7gQ88bSgv7vbtCWC7zp0Ofh3zXP934WZjbN9C38ty25dcKfN500CrZ7OpR1aojuYIABZf
	T+5IUMLnY/4aQpLD7dR+B1S/IhIW3J8WTPPguxo/kgoNTnP4NGcBy7yPpwY0LtDERoC1quwiLp2
	euSusELDTMA2cVTaSRSFchDuUk2F352LXEYrQI4UVcPdDmhVLebaOd3uzNWuaPkW+MzIekGlb9r
	jRGnmsSIKUvtIbFrj6A8JcmG/sGbU/vf4Jl2AEzxS8QFWlLoWlk6+khBLMauwB9WvYx/buWmxGm
	PStZgDU4ve7cpdk5cWlNO5XkuspEYpF+Kht6p1o8QbyiLkuu0wN4XMZfw9NYaIeat29qNYxZBog
	/lyh8LWDTFlCUvYvFCkQg4rgkO2VGAG9Odd4DUoWCnYpEzYRaBLlg/VW7OaRkjbA9a+zdhgXd6i
	numtTeg+qBGMc7eBi8dRfPKDxIFkk7R0rbygox261+Nquf4UUDGsowf/J0UNHCIcgdVBEXFBWhS
	4Ach9UmpKIDSygYNxEUS+BEsa/tGBlxQl0SgQ130
X-Received: by 2002:a05:7300:dc11:b0:2f5:2556:5acd with SMTP id 5a478bee46e88-3039815f0b3mr2089810eec.13.1778855780015;
        Fri, 15 May 2026 07:36:20 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6e9sm8316246eec.16.2026.05.15.07.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 07:36:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] procmail: Upgrade to 3.24
Date: Fri, 15 May 2026 07:36:16 -0700
Message-ID: <20260515143616.993583-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 14:36:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127009

Drop patches to support newer toolchains added overtime
Add consolidated patch to support cross compiling
Use github for SRC_URI

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-fix-too-many-arguments-issue.patch   |  88 ---
 .../procmail/0001-fix-uname-declaration.patch |  27 -
 .../procmail/procmail/CVE-2014-3618.patch     |  29 -
 .../procmail/procmail/CVE-2017-16844.patch    |  20 -
 .../from-debian-to-fix-compile-errors.patch   | 608 ------------------
 .../from-debian-to-fix-man-file.patch         |  85 ---
 .../from-debian-to-modify-parameters.patch    | 129 ----
 .../procmail/procmail/gcc14.patch             | 127 ----
 .../man-file-mailstat.1-from-debian.patch     |  62 --
 .../procmail-3.24-consolidated_fixes-1.patch  | 253 ++++++++
 .../{procmail_3.22.bb => procmail_3.24.bb}    |  30 +-
 11 files changed, 264 insertions(+), 1194 deletions(-)
 delete mode 100644 meta-oe/recipes-support/procmail/procmail/0001-fix-too-many-arguments-issue.patch
 delete mode 100644 meta-oe/recipes-support/procmail/procmail/0001-fix-uname-declaration.patch
 delete mode 100644 meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch
 delete mode 100644 meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch
 delete mode 100644 meta-oe/recipes-support/procmail/procmail/from-debian-to-fix-compile-errors.patch
 delete mode 100644 meta-oe/recipes-support/procmail/procmail/from-debian-to-fix-man-file.patch
 delete mode 100644 meta-oe/recipes-support/procmail/procmail/from-debian-to-modify-parameters.patch
 delete mode 100644 meta-oe/recipes-support/procmail/procmail/gcc14.patch
 delete mode 100644 meta-oe/recipes-support/procmail/procmail/man-file-mailstat.1-from-debian.patch
 create mode 100644 meta-oe/recipes-support/procmail/procmail/procmail-3.24-consolidated_fixes-1.patch
 rename meta-oe/recipes-support/procmail/{procmail_3.22.bb => procmail_3.24.bb} (50%)

diff --git a/meta-oe/recipes-support/procmail/procmail/0001-fix-too-many-arguments-issue.patch b/meta-oe/recipes-support/procmail/procmail/0001-fix-too-many-arguments-issue.patch
deleted file mode 100644
index 9b98720b2e..0000000000
--- a/meta-oe/recipes-support/procmail/procmail/0001-fix-too-many-arguments-issue.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 6f00795de8623347580c4366cb517a6653f73ca4 Mon Sep 17 00:00:00 2001
-From: Liu Yiding <liuyd.fnst@fujitsu.com>
-Date: Mon, 9 Jun 2025 08:01:39 +0000
-Subject: [PATCH] fix too many arguments issue
-
-fix issue like:
-| procmail.c:76:12: error: too many arguments to function 'auth_finduid'; expected 0, have 2
-|    76 |   if(tpass=auth_finduid(uid,0))                           /* save by copying */
-|       |            ^~~~~~~~~~~~ ~~~
-| In file included from procmail.c:36:
-| authenticate.h:15:3: note: declared here
-|    15 |  *auth_finduid Q((const uid_t uid,const int sock));
-| --
-| procmail.c:212:9: error: too many arguments to function 'checkprivFrom_'; expected 0, have 3
-|   212 |         checkprivFrom_(euid,passinvk?auth_username(passinvk):0,override);
-|       |         ^~~~~~~~~~~~~~ ~~~~
-| In file included from procmail.c:41:
-| from.h:9:2: note: declared here
-|     9 |  checkprivFrom_ Q((uid_t euid,const char*logname,int override));
-| --
-| procmail.c:213:9: error: too many arguments to function 'doumask'; expected 0, have 1
-|   213 |         doumask(INIT_UMASK);               /* allowed to set the From_ line? */
-|       |         ^~~~~~~
-| In file included from procmail.c:23:
-| robust.h:12:2: note: declared here
-|    12 |  doumask Q((const mode_t mask));
-
-Upstream-Status: Submitted [https://github.com/BuGlessRB/procmail/pull/11]
-Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
----
- src/authenticate.h | 2 +-
- src/exopen.c       | 2 +-
- src/includes.h     | 2 +-
- src/misc.h         | 1 +
- 4 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/src/authenticate.h b/src/authenticate.h
-index be9d88d..31e665a 100644
---- a/src/authenticate.h
-+++ b/src/authenticate.h
-@@ -7,7 +7,7 @@ typedef struct auth_identity auth_identity;
-
- #ifndef P
- #define P(x)	x
--#define Q(x)	()
-+#define Q(x)	x
- #endif
-
- /*const*/auth_identity
-diff --git a/src/exopen.c b/src/exopen.c
-index c7647e5..46e3467 100644
---- a/src/exopen.c
-+++ b/src/exopen.c
-@@ -51,7 +51,7 @@ static const char*safehost P((void)) /* return a hostname safe for filenames */
-   return sname;
- }
-
--int unique(full,p,len,mode,verbos,flags)char*const full;char*p;
-+int unique(full,p,len,mode,verbos,flags)const char*const full;char*p;
-  const size_t len;const mode_t mode;const int verbos,flags;
- { static const char s2c[]=".,+%";static int serial=STRLEN(s2c);
-   static time_t t;char*dot,*end,*host;struct stat filebuf;
-diff --git a/src/includes.h b/src/includes.h
-index 7d6b41f..134805b 100644
---- a/src/includes.h
-+++ b/src/includes.h
-@@ -530,7 +530,7 @@ extern void*memmove();
-  * problems caused by one of those types being shorter than int and thereby
-  * being passed differently under ANSI rules.
-  */
--#define Q(args)		()
-+#define Q(args)		args
-
- #ifdef oBRAIN_DAMAGE
- #undef oBRAIN_DAMAGE
-diff --git a/src/misc.h b/src/misc.h
-index 4f62ebc..659dfcb 100644
---- a/src/misc.h
-+++ b/src/misc.h
-@@ -1,4 +1,5 @@
- /*$Id: misc.h,v 1.56 2001/06/30 01:14:19 guenther Exp $*/
-+#include "authenticate.h"
-
- struct dyna_array{int filled,tspace;char*vals;};
- union offori{off_t o;int i;};
---
-2.43.0
-
diff --git a/meta-oe/recipes-support/procmail/procmail/0001-fix-uname-declaration.patch b/meta-oe/recipes-support/procmail/procmail/0001-fix-uname-declaration.patch
deleted file mode 100644
index adbc4f584a..0000000000
--- a/meta-oe/recipes-support/procmail/procmail/0001-fix-uname-declaration.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From a9e57d4048c94f6bc2533ccc41e6c35d4416571a Mon Sep 17 00:00:00 2001
-From: Liu Yiding <liuyd.fnst@fujitsu.com>
-Date: Mon, 9 Jun 2025 06:44:06 +0000
-Subject: [PATCH] fix uname declaration
-
-Upstream-Status: Submitted [https://github.com/BuGlessRB/procmail/pull/11]
-Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
----
- src/includes.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/includes.h b/src/includes.h
-index 4466907..7d6b41f 100644
---- a/src/includes.h
-+++ b/src/includes.h
-@@ -331,7 +331,7 @@ extern int errno;
-
- #ifndef NOuname
- #ifndef P		  /* SINIX V5.23 has the wrong prototype for uname() */
--extern int uname();					 /* so we fix it :-) */
-+extern int uname(struct utsname *);
- #define Uname(name)		((int(*)(struct utsname*))uname)(name)
- #else
- #define Uname(name)		uname(name)		    /* no fix needed */
---
-2.43.0
-
diff --git a/meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch b/meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch
deleted file mode 100644
index b041924361..0000000000
--- a/meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Description: Fix heap-overflow in formail
- CVE-2014-3618: Heap-overflow in formail when processing
- specially-crafted email headers.
-Origin: http://www.openwall.com/lists/oss-security/2014/09/03/8
-Bug-Debian: https://bugs.debian.org/704675
-Bug-Debian: https://bugs.debian.org/760443
-Forwarded: not-needed
-Last-Update: 2014-09-04
-
-CVE: CVE-2014-3618
-Upstream-Status: Inactive-Upstream [lastrelease: 2001]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
-
---- a/src/formisc.c
-+++ b/src/formisc.c
-@@ -84,12 +84,11 @@ normal:	   *target++= *start++;
- 	case '"':*target++=delim='"';start++;
-       }
-      ;{ int i;
--	do
-+	while(*start)
- 	   if((i= *target++= *start++)==delim)	 /* corresponding delimiter? */
- 	      break;
- 	   else if(i=='\\'&&*start)		    /* skip quoted character */
- 	      *target++= *start++;
--	while(*start);						/* anything? */
-       }
-      hitspc=2;
-    }
diff --git a/meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch b/meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch
deleted file mode 100644
index 6e04989c33..0000000000
--- a/meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-From: Santiago Vila <sanvila@debian.org>
-Subject: Fix heap-based buffer overflow in loadbuf()
-Bug-Debian: http://bugs.debian.org/876511
-X-Debian-version: 3.22-26
-
-CVE: CVE-2017-16844
-Upstream-Status: Inactive-Upstream [lastrelease: 2001]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
-
---- a/src/formisc.c
-+++ b/src/formisc.c
-@@ -103,7 +103,7 @@
- }
- 							    /* append to buf */
- void loadbuf(text,len)const char*const text;const size_t len;
--{ if(buffilled+len>buflen)			  /* buf can't hold the text */
-+{ while(buffilled+len>buflen)			  /* buf can't hold the text */
-      buf=realloc(buf,buflen+=Bsize);
-   tmemmove(buf+buffilled,text,len);buffilled+=len;
- }
diff --git a/meta-oe/recipes-support/procmail/procmail/from-debian-to-fix-compile-errors.patch b/meta-oe/recipes-support/procmail/procmail/from-debian-to-fix-compile-errors.patch
deleted file mode 100644
index c1f9ce7eca..0000000000
--- a/meta-oe/recipes-support/procmail/procmail/from-debian-to-fix-compile-errors.patch
+++ /dev/null
@@ -1,608 +0,0 @@
-From 898e9514bc889b4a540f667efed95a5af101c824 Mon Sep 17 00:00:00 2001
-From: Li xin <lixin.fnst@cn.fujitsu.com>
-Date: Tue, 2 Dec 2014 07:00:36 +0900
-Subject: [PATCH 1/3] From debian to fix compile errors
-
-Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
----
-Upstream-Status: Pending
-
- src/Makefile.0  |  7 +++----
- src/autoconf    | 64 +++++++++++++-------------------------------------------
- src/comsat.c    | 65 +++++++++++++++++++--------------------------------------
- src/fields.c    |  6 +++---
- src/foldinfo.h  |  2 +-
- src/formail.c   |  6 +++---
- src/formisc.c   |  2 +-
- src/formisc.h   |  2 +-
- src/mailfold.c  | 14 ++++++++++---
- src/manconf.c   |  2 +-
- src/memblk.c    | 24 ++++++++++-----------
- src/memblk.h    |  2 +-
- src/network.h   | 10 ++-------
- src/pipes.c     | 10 ++++-----
- src/procmail.c  |  3 +--
- src/recommend.c |  2 +-
- 16 files changed, 81 insertions(+), 140 deletions(-)
-
-diff --git a/src/Makefile.0 b/src/Makefile.0
-index 6eb5b51..15a2039 100644
---- a/src/Makefile.0
-+++ b/src/Makefile.0
-@@ -40,7 +40,7 @@ multigram: multigram.$(O) $(MG_OBJ) setid
- 	@cd ..; $(MAKE) config.check
-
- _autotst: _autotst.$(O) sublib.c sublib.h
--	$(CC) $(CFLAGS) $@.$(O) -o $@ $(LDFLAGS)
-+	gcc $@.$(O) -o $@ $(LDFLAGS)
-
- ../autoconf.h: autoconf Makefile ../patchlevel.h
- 	@echo No this was not make -n >make_n
-@@ -175,17 +175,16 @@ recommend: recommend.$(O) sublib.$(O)
-
- ../man/man.sed: manconf.c ../autoconf.h ../config.h includes.h procmail.h
- ../man/man.sed: ../patchlevel.h
--	@$(CC) $(CFLAGS) "-DBINDIR=\"$(VISIBLE_BINDIR)\"" -o _autotst \
-+	gcc "-DBINDIR=\"$(VISIBLE_BINDIR)\"" -o _autotst \
-  manconf.c $(LDFLAGS)
- 	@./_autotst $@
- 	@echo Housekeeping file >$@
--	@$(RM) _autotst
-
- clean:
- 	$(RM) -r _locktest
- 	$(RM) procmail.$(O) $(PM_OBJ) lockfile.$(O) $(LF_OBJ) formail.$O \
-  $(FM_OBJ) multigram.$(O) $(MG_OBJ) $(BINSS) multigram ../autoconf.h \
-- _autotst* lookfor _locktst* grepfor recommend recommend.$(O) manconf \
-+  lookfor _locktst* grepfor recommend recommend.$(O) manconf \
-  _Makefile lock.log *core* targetdir.h setid setid.$(O) gethome \
-  gethome.$(O) make_n realloc.log
-
-diff --git a/src/autoconf b/src/autoconf
-index 1cb4c42..ff78048 100755
---- a/src/autoconf
-+++ b/src/autoconf
-@@ -68,8 +68,6 @@
- #	#define NOfsync
- #Ok	#define endpwent()
- #Ok	#define endgrent()
--#Ok	#define endhostent()
--#Ok	#define endservent()
- #Ok	#define endprotoent()
- #	#define h_0addr_list h_addr
- #Ok	#define NOpw_passwd
-@@ -896,7 +894,7 @@ int main(){int i=0;
-  {uid_t vuid_t;i+=vuid_t=1;}
-  {gid_t vgid_t;i+=vgid_t=1;}
- #ifndef NO_COMSAT
-- {struct hostent vhostent;i+=!(vhostent.h_addr_list=0);}
-+ {struct addrinfo res; i+=!(res.ai_socktype=0);}
- #endif
- #ifndef NOuname
-  {struct utsname vutsname;i+=!(*vutsname.nodename='\0');}
-@@ -917,8 +915,6 @@ do
-   test -z "$i3" && grepfor mode_t 'typedef int mode_t;' && i3=I
-   test -z "$i4" && grepfor uid_t 'typedef int uid_t;' && i4=I
-   test -z "$i5" && grepfor gid_t 'typedef int gid_t;' && i5=I
--  test -z "$i6" && grepfor h_addr_list '#define h_0addr_list h_addr' && i6=I
--  test -z "$i6" && grepfor hostent '#define h_0addr_list h_addr' && i6=I
-   test -z "$i6" && grepfor member '#define h_0addr_list h_addr' && i6=I
-   test -z "$i7" && grepfor utsname "#define NOuname			      \
- /* <sys/utsname.h> is there, but empty */" && i7=I
-@@ -1048,8 +1044,12 @@ int main(){char a[2];
-  {struct utsname b;uname(&b);}
- #endif
- #ifndef NO_COMSAT
-- gethostbyname("0");getprotobyname(COMSATprotocol);endhostent();endservent();
-- endprotoent();
-+ {
-+ struct addrinfo *res, hints;
-+ memset(&hints, '\0', sizeof(hints));
-+ if(getaddrinfo(COMSAThost,BIFF_serviceport,&hints,&res))
-+ 	freeaddrinfo(res);
-+ }
- #endif
-  _exit(0);
-  return 0;}
-@@ -1103,14 +1103,9 @@ grepfor uname "\
- /* <sys/utsname.h> defines it, the libraries don't */"
- grepfor endpwent '#define endpwent()'
- grepfor endgrent '#define endgrent()'
--if grepfor gethostbyname '#define NO_COMSAT'
-+if grepfor getaddrinfo '#define NO_COMSAT'
- then
- :
--else
--  grepfor getprotobyname '#define UDP_protocolno 17'
--  grepfor endhostent '#define endhostent()'
--  grepfor endservent '#define endservent()'
--  grepfor endprotoent '#define endprotoent()'
- fi
- grepfor strstr '#define SLOWstrstr' ||
-  grepfor clock '#define SLOWstrstr'
-@@ -1239,39 +1234,9 @@ int main(argc,argv)int argc;const char*argv[];
- 	printf("/* Insufficient memory to perform the benchmark! */\n");
- #endif /* SLOWstrstr */
- #ifndef NO_COMSAT
--#ifndef UDP_protocolno
--     ;{ const struct protoent*p;
--	if(p=getprotobyname(COMSATprotocol))
--	 { printf("#define UDP_protocolno %d\n",p->p_proto);
--#else
--     ;{ if(1)
--	 {
--#endif
--	   ;{ const struct servent*serv;
--	      if(serv=getservbyname(COMSATservice,COMSATprotocol))
--		 printf("#define BIFF_serviceport \"%d\"\n",
--		  ntohs(serv->s_port));
--	    }
--#ifdef AF_INET
--	   ;{ const struct hostent*host;
--	      if(!strcmp("localhost",COMSAThost)&&
--	       (host=gethostbyname(COMSAThost))&&
--	       host->h_0addr_list&&host->h_addrtype==AF_INET&&
--	       host->h_length)
--	       { int j=host->h_length;
--		 const unsigned char*ad=(void*)host->h_0addr_list;
--		 printf("#define IP_localhost {");
--		 printf("%d",*ad++);
--		 while(--j)
--		    printf(",%d",*ad++);
--		 puts("}");
--	       }
--	    }
-+#ifndef AF_INET
-+	puts("#define NO_COMSAT");
- #endif /* AF_INET */
--	 }
--	else
--	   puts("#define NO_COMSAT");
--      }
- #endif /* NO_COMSAT */
-      ;{ unsigned long s=(size_t)~0;int bits;
- 	for(bits=1;s>>=1;bits++);
-@@ -1470,15 +1435,14 @@ cat /usr/lib/sendmail.cf /etc/sendmail.cf /etc/mail/sendmail.cf 2>$DEVNULL |
-  grep 'Mlocal.*procmail' >$DEVNULL ||
-  echo '#define CF_no_procmail_yet' >>$ACONF
-
--cat /usr/lib/sendmail.cf /etc/sendmail.cf /etc/mail/sendmail.cf 2>$DEVNULL |
-- grep '^V' >$DEVNULL ||
-- echo '#define buggy_SENDMAIL' >>$ACONF
-+# cat /usr/lib/sendmail.cf /etc/sendmail.cf /etc/mail/sendmail.cf 2>$DEVNULL |
-+#  grep '^V' >$DEVNULL ||
-+#  echo '#define buggy_SENDMAIL' >>$ACONF
-
- lpath='/bin'
- bins="/bin"
-
--for newd in /usr/bin /usr/ucb /usr/5bin $BINDIR /local/bin /usr/local/bin \
-- /global/bin /usr/bin/X11 /usr/X*/bin
-+for newd in /usr/bin $BINDIR /usr/bin/X11 /usr/X*/bin
- do
-   if test -d $newd
-   then
-diff --git a/src/comsat.c b/src/comsat.c
-index 77dba34..5082b16 100644
---- a/src/comsat.c
-+++ b/src/comsat.c
-@@ -27,7 +27,8 @@ static /*const*/char rcsid[]=
- #include "comsat.h"
-
- static int csvalid;		     /* is it turned on with a good address? */
--static struct sockaddr_in csaddr;
-+static struct addrinfo cai;
-+static struct sockaddr *csaddr;
- static char*cslastf,*cslgname;
-
- void setlfcs(folder)const char*folder;		/* set lastfolder for comsat */
-@@ -62,56 +63,32 @@ void setlgcs(name)const char*name;		   /* set logname for comsat */
- }
-
- int setcomsat(chp)const char*chp;
--{ char*chad;int newvalid; struct sockaddr_in newaddr;
-+{ char*chad;int newvalid; struct addrinfo *res, hints;
-   chad=strchr(chp,SERV_ADDRsep);			     /* @ separator? */
-   if(!chad&&!renvint(-1L,chp))
-      return csvalid=0;					/* turned off comsat */
-   newvalid=1;
-   if(chad)
-      *chad++='\0';				      /* split the specifier */
-+  if(!chad||!*chp)					       /* no service */
-+     chp=BIFF_serviceport;				/* new balls please! */
-   if(!chad||!*chad)						  /* no host */
--#ifndef IP_localhost			      /* Is "localhost" preresolved? */
-      chad=COMSAThost;					/* nope, use default */
--#else /* IP_localhost */
--   { static const unsigned char ip_localhost[]=IP_localhost;
--     newaddr.sin_family=AF_INET;
--     tmemmove(&newaddr.sin_addr,ip_localhost,sizeof ip_localhost);
--   }
--  else
--#endif /* IP_localhost */
--   { const struct hostent*host;		      /* what host?  paranoid checks */
--     if(!(host=gethostbyname(chad))||!host->h_0addr_list)
--      { bbzero(&newaddr.sin_addr,sizeof newaddr.sin_addr);
--	newvalid=0;			     /* host can't be found, too bad */
--      }
--     else
--      { newaddr.sin_family=host->h_addrtype;	     /* address number found */
--	tmemmove(&newaddr.sin_addr,host->h_0addr_list,host->h_length);
--      }
--     endhostent();
--   }
--  if(newvalid)						  /* so far, so good */
--   { int s;
--     if(!*chp)						       /* no service */
--	chp=BIFF_serviceport;				/* new balls please! */
--     s=strtol(chp,&chad,10);
--     if(chp!=chad)			       /* the service is not numeric */
--	newaddr.sin_port=htons((short)s);		    /* network order */
--     else
--      { const struct servent*serv;
--	serv=getservbyname(chp,COMSATprotocol);		   /* so get its no. */
--	if(serv)
--	   newaddr.sin_port=serv->s_port;
--	else
--	 { newaddr.sin_port=htons((short)0);		  /* no such service */
--	   newvalid=0;
--	 }
--	endservent();
--      }
--   }
-+  bzero(&hints,sizeof(hints));
-+  hints.ai_socktype=SOCK_DGRAM;
-+  hints.ai_flags=AI_ADDRCONFIG;
-+  if(getaddrinfo(chad,chp,&hints,&res))
-+     newvalid=0;
-+
-   onguard();				    /* update the address atomically */
-   if(csvalid=newvalid)
--     tmemmove(&csaddr,&newaddr,sizeof(newaddr));
-+   { if(csaddr)
-+        free(csaddr);
-+     csaddr=malloc(res->ai_addrlen);
-+     tmemmove(csaddr,res->ai_addr,res->ai_addrlen);
-+     tmemmove(&cai,res,sizeof(cai));
-+     freeaddrinfo(res);
-+   }
-   offguard();
-   return newvalid;
- }
-@@ -120,7 +97,7 @@ void sendcomsat(folder)const char*folder;
- { int s;const char*p;
-   if(!csvalid||!buf)		  /* is comat on and set to a valid address? */
-      return;
--  if(!*cslgname||strlen(cslgname)+2>linebuf)	       /* is $LOGNAME bogus? */
-+  if(!cslgname||!*cslgname||strlen(cslgname)+2>linebuf)/* is $LOGNAME bogus? */
-      return;
-   if(!(p=folder?folder:cslastf))		     /* do we have a folder? */
-      return;
-@@ -132,8 +109,8 @@ void sendcomsat(folder)const char*folder;
-    }
-   strlcat(buf,COMSATxtrsep,linebuf);			 /* custom seperator */
-   strlcat(buf,p,linebuf);			  /* where was it delivered? */
--  if((s=socket(AF_INET,SOCK_DGRAM,UDP_protocolno))>=0)
--   { sendto(s,buf,strlen(buf),0,(struct sockaddr*)&csaddr,sizeof(csaddr));
-+  if((s=socket(cai.ai_family,cai.ai_socktype,cai.ai_protocol))>=0)
-+   { sendto(s,buf,strlen(buf),0,csaddr,cai.ai_addrlen);
-      rclose(s);
-      yell("Notified comsat:",buf);
-    }
-diff --git a/src/fields.c b/src/fields.c
-index a2bd77f..37ed154 100644
---- a/src/fields.c
-+++ b/src/fields.c
-@@ -110,16 +110,16 @@ void dispfield(p)register const struct field*p;
- 		    /* try and append one valid field to rdheader from stdin */
- int readhead P((void))
- { int idlen;
--  getline();
-+  get_line();
-   if((idlen=breakfield(buf,buffilled))<=0) /* not the start of a valid field */
-      return 0;
-   if(idlen==STRLEN(FROM)&&eqFrom_(buf))			/* it's a From_ line */
-    { if(rdheader)
- 	return 0;			       /* the From_ line was a fake! */
--     for(;buflast=='>';getline());	    /* gather continued >From_ lines */
-+     for(;buflast=='>';get_line());	    /* gather continued >From_ lines */
-    }
-   else
--     for(;;getline())		      /* get the rest of the continued field */
-+     for(;;get_line())		      /* get the rest of the continued field */
-       { switch(buflast)			     /* will this line be continued? */
- 	 { case ' ':case '\t':				  /* yep, it sure is */
- 	      continue;
-diff --git a/src/foldinfo.h b/src/foldinfo.h
-index 9e4ebb6..797f9be 100644
---- a/src/foldinfo.h
-+++ b/src/foldinfo.h
-@@ -10,7 +10,7 @@
-
- #define ft_lock(type)	   ((type)>ft_MAILDIR)		   /* kernel lock fd */
- #define ft_atime(type)	   ((type)==ft_FILE)	      /* force atime < mtime */
--#define ft_dotlock(type)   ((type)==ft_FILE)		 /* dotlock $DEFAULT */
-+#define ft_dotlock(type)   ((type)>ft_MAILDIR)		 /* dotlock $DEFAULT */
- #define ft_delim(type)	   ((type)==ft_FILE)		   /* add MMDF delim */
- #define ft_checkcloser(type) ((type)>ft_MH)
- #define ft_forceblank(type) ((type)!=ft_MAILDIR)  /* force blank line at end */
-diff --git a/src/formail.c b/src/formail.c
-index fe5e6be..1f5c9dd 100644
---- a/src/formail.c
-+++ b/src/formail.c
-@@ -758,9 +758,9 @@ startover:
- 	lputssn(buf,buffilled),ctlength-=buffilled,buffilled=lnl=0;
-      ;{ int tbl=buflast,lwr='\n';
- 	while(--ctlength>=0&&tbl!=EOF)	       /* skip Content-Length: bytes */
--	   lnl=lwr==tbl&&lwr=='\n',putcs(lwr=tbl),tbl=getchar();
-+	   lnl=lwr==tbl&&lwr=='\n',lputcs(lwr=tbl),tbl=getchar();
- 	if((buflast=tbl)=='\n'&&lwr!=tbl)	/* just before a line break? */
--	   putcs('\n'),buflast=getchar();		/* wrap up loose end */
-+	   lputcs('\n'),buflast=getchar();		/* wrap up loose end */
-       }
-      if(!quiet&&ctlength>0)
-       { charNUM(num,ctlength);
-@@ -819,7 +819,7 @@ splitit:       { if(!lnl)   /* did the previous mail end with an empty line? */
-       { if(split)		       /* gobble up the next start separator */
- 	 { buffilled=0;
- #ifdef sMAILBOX_SEPARATOR
--	   getline();buffilled=0;		 /* but only if it's defined */
-+	   get_line();buffilled=0;		 /* but only if it's defined */
- #endif
- 	   if(buflast!=EOF)					   /* if any */
- 	      goto splitit;
-diff --git a/src/formisc.c b/src/formisc.c
-index d6cab90..338733b 100644
---- a/src/formisc.c
-+++ b/src/formisc.c
-@@ -115,7 +115,7 @@ void loadchar(c)const int c;		      /* append one character to buf */
-   buf[buffilled++]=c;
- }
-
--int getline P((void))			   /* read a newline-terminated line */
-+int get_line P((void))			   /* read a newline-terminated line */
- { if(buflast==EOF)			 /* at the end of our Latin already? */
-    { loadchar('\n');					  /* fake empty line */
-      return EOF;					  /* spread the word */
-diff --git a/src/formisc.h b/src/formisc.h
-index 1c4ca20..f25211c 100644
---- a/src/formisc.h
-+++ b/src/formisc.h
-@@ -17,4 +17,4 @@ void
- char*
-  skipwords P((char*start));
- int
-- getline P((void));
-+ get_line P((void));
-diff --git a/src/mailfold.c b/src/mailfold.c
-index 917b502..6c8bcf4 100644
---- a/src/mailfold.c
-+++ b/src/mailfold.c
-@@ -30,6 +30,7 @@ static /*const*/char rcsid[]=
-
- int logopened,rawnonl;
- off_t lasttell;
-+static int trunced;
- static long lastdump;
- static volatile int mailread;	/* if the mail is completely read in already */
- static struct dyna_array confield;		  /* escapes, concatenations */
-@@ -81,6 +82,7 @@ long dump(s,type,source,len)const int s,type;const char*source;
-  long len;
- { int i;long part;
-   lasttell=i= -1;SETerrno(EBADF);
-+  trunced=0;
-   if(s>=0)
-    { if(ft_lock(type)&&(lseek(s,(off_t)0,SEEK_END),fdlock(s)))
- 	nlog("Kernel-lock failed\n");
-@@ -120,13 +122,18 @@ jin:	while(part&&(i=rwrite(s,source,BLKSIZ<part?BLKSIZ:(int)part)))
-       }
- writefin:
-      i=type!=ft_PIPE&&fsync(s)&&errno!=EINVAL;	  /* EINVAL => wasn't a file */
-+     if ((i||len)&&lasttell>=0)
-+      { int serrno=errno;
-+	if(!ftruncate(s,lasttell)) trunced=1;
-+	SETerrno(serrno);
-+      }
-      if(ft_lock(type))
-       { int serrno=errno;		       /* save any error information */
- 	if(fdunlock())
- 	   nlog("Kernel-unlock failed\n");
- 	SETerrno(serrno);
-       }
--     i=rclose(s)||i;
-+     i=rclose(s)||i; /* if this fails, we should truncate, but it's too late */
-    }			   /* return an error even if nothing was to be sent */
-   return i&&!len?-1:len;
- }
-@@ -237,7 +244,7 @@ dumpf:	 { switch(errno)
- #endif
- 	      default:writeerr(buf);
- 	    }
--	   if(lasttell>=0&&!truncate(boxname,lasttell)&&(logopened||verbose))
-+	   if(lasttell>=0&&trunced&&(logopened||verbose))
- 	      nlog("Truncated file to former size\n");	    /* undo garbage */
- ret0:	   return 0;
- 	 }
-@@ -378,7 +385,8 @@ void readmail(rhead,tobesent)const long tobesent;
- 	dfilled=mailread=0;
-      else if(rhead)				/* only read in a new header */
-       { memblk new;
--	dfilled=mailread=0;makeblock(&new,0);readdyn(&new,&dfilled,0);
-+	dfilled=mailread=0;makeblock(&new,0);
-+	readdyn(&new,&dfilled,thebody-themail.p);
- 	if(tobesent>dfilled&&isprivate)		     /* put it in place here */
- 	 { tmemmove(themail.p+dfilled,thebody,filled-=tobesent);
- 	   tmemmove(themail.p,new.p,dfilled);
-diff --git a/src/manconf.c b/src/manconf.c
-index a9e9f1c..5c8ec36 100644
---- a/src/manconf.c
-+++ b/src/manconf.c
-@@ -233,7 +233,7 @@ a security violation was found (e.g. \1.B \2-@PRESERVOPT@\1or variable\
-  \2-@PRESERVOPT@\1and\1.BR \2-@FROMWHOPT@ .\1");
-   pc("LMTPOPT",LMTPOPT);
- #else
--  ps("LMTPOPTdesc","");ps("LMTPusage","");
-+  ps("LMTPOPTdesc","");ps("LMTPusage","\1");
- #endif
-   pname("INIT_UMASK",0);printf("0%lo/g\n",(unsigned long)INIT_UMASK);lines--;
-   pn("DEFlinebuf",DEFlinebuf);
-diff --git a/src/memblk.c b/src/memblk.c
-index e2f13f0..97e02d3 100644
---- a/src/memblk.c
-+++ b/src/memblk.c
-@@ -51,11 +51,11 @@ void lockblock(mb)memblk*const mb;
- {
- #ifdef USE_MMAP
-   if(mb->fd>=0)
--   { long len=mb->len+1;
--     if(munmap(mb->p,len))
--	mmapfailed(len);		      /* don't want to continue here */
--     if((mb->p=mmap(0,len,PROT_READ,MAP_PRIVATE,mb->fd,(off_t)0))==MAP_FAILED)
--	mmapfailed(len);
-+   { long mlen=mb->len+1;
-+     if(munmap(mb->p,mlen))
-+	mmapfailed(mlen);		      /* don't want to continue here */
-+     if((mb->p=mmap(0,mlen,PROT_READ,MAP_PRIVATE,mb->fd,(off_t)0))==MAP_FAILED)
-+	mmapfailed(mlen);
-      close(mb->fd);
-      mb->fd=ropen(devnull,O_RDWR,0);		/* XXX Perhaps -1 is better? */
-    }
-@@ -77,8 +77,8 @@ int resizeblock(mb,len,nonfatal)memblk*const mb;const long len;
-      strcpy(filename,MMAP_DIR);
-      if(unique(filename,strchr(filename,'\0'),MMAP_FILE_LEN,MMAP_PERM,0,0)&&
- 	(mb->fd=ropen(filename,O_RDWR,MMAP_PERM),unlink(filename),mb->fd>=0))
--      { mb->filelen=len;
--	if(lseek(mb->fd,mb->filelen-1,SEEK_SET)<0||1!=rwrite(mb->fd,empty,1))
-+      { mb->filelen=len+1;
-+	if(lseek(mb->fd,len,SEEK_SET)<0||1!=rwrite(mb->fd,empty,1))
- dropf:	 { close(mb->fd);mb->fd= -1;
- 	   if(verbose)nlog("Unable to extend or use tempfile");
- 	 }
-@@ -98,9 +98,9 @@ dropf:	 { close(mb->fd);mb->fd= -1;
-       }
-    }
-   if(mb->fd>=0)
--   { if(len>mb->filelen)				  /* need to extend? */
--      { mb->filelen=len;
--	if(lseek(mb->fd,mb->filelen-1,SEEK_SET)<0||1!=rwrite(mb->fd,empty,1))
-+   { if(len>=mb->filelen)				  /* need to extend? */
-+      { mb->filelen=len+1;
-+	if(lseek(mb->fd,len,SEEK_SET)<0||1!=rwrite(mb->fd,empty,1))
- 	 { char*p=malloc(len+1);	   /* can't extend, switch to malloc */
- 	   tmemmove(p,mb->p,mb->len);
- 	   munmap(mb->p,mb->len+1);
-@@ -124,9 +124,9 @@ mmap:	if((mb->p=mmap(0,len+1,P_RW,MAP_SHARED,mb->fd,(off_t)0))==MAP_FAILED)
-    }
-   else
-      mb->p=realloc(mb->p,len+1);
--  mb->len=len+1;
--  mb->p[len]='\0';
-+  mb->len=len;
- ret1:
-+  mb->p[len]='\0';
-   return 1;
- }
-
-diff --git a/src/memblk.h b/src/memblk.h
-index 6fd1d1d..b57f369 100644
---- a/src/memblk.h
-+++ b/src/memblk.h
-@@ -1,6 +1,6 @@
- typedef struct memblk {
-     char*p;						  /* where it starts */
--    long len;					 /* currently allocated size */
-+    long len;			 /* current size, not including trailing NUL */
- #ifdef USE_MMAP
-     off_t filelen;				     /* how long is the file */
-     int fd;					   /* file which is mmap()ed */
-diff --git a/src/network.h b/src/network.h
-index d7d08f2..b09b6c4 100644
---- a/src/network.h
-+++ b/src/network.h
-@@ -1,19 +1,13 @@
- /*$Id: network.h,v 1.7 1997/04/02 03:15:41 srb Exp $*/
-
--#include <sys/socket.h>			/* socket() sendto() AF_INET
-+#include <sys/socket.h>			/* socket() sendto() */
- 					/* SOCK_DGRAM */
--#include <netdb.h>			/* gethostbyname() getservbyname()
--					/* getprotobyname() */
--#include <netinet/in.h>			/* htons() struct sockaddr_in */
-+#include <netdb.h>			/* getaddrinfo() */
-
- #ifndef BIFF_serviceport
- #define BIFF_serviceport	COMSATservice
- #endif
-
--#ifndef h_0addr_list
--#define h_0addr_list	h_addr_list[0]		      /* POSIX struct member */
--#endif
--
- #ifndef NO_const      /* since network.h is outside the autoconf const check */
- #ifdef const		    /* loop, we need this backcheck for some systems */
- #undef const
-diff --git a/src/pipes.c b/src/pipes.c
-index 1fdb9e6..7754300 100644
---- a/src/pipes.c
-+++ b/src/pipes.c
-@@ -145,7 +145,9 @@ int pipthrough(line,source,len)char*line,*source;const long len;
-   if(Stdout)
-    { *(eq=strchr(Stdout,'\0')-1)='\0';			     /* chop the '=' */
-      if(!(backblock=getenv(Stdout)))			/* no current value? */
--	PRDB=PWRB= -1;
-+      { PRDB=PWRB= -1;
-+	backlen=0;
-+      }
-      else
-       { backlen=strlen(backblock);
- 	goto pip;
-@@ -155,9 +157,7 @@ int pipthrough(line,source,len)char*line,*source;const long len;
- pip: rpipe(pbackfd);
-   rpipe(pinfd);						 /* main pipes setup */
-   if(!(pidchild=sfork()))			/* create a sending procmail */
--   { if(Stdout&&backblock)
--	backlen=strlen(backblock);
--     else
-+   { if(!Stdout)
- 	backblock=source,backlen=len;
-      childsetup();rclose(PRDI);rclose(PRDB);
-      rpipe(poutfd);rclose(STDOUT);
-@@ -194,7 +194,7 @@ perr:	      progerr(line,excode,pwait==4);  /* I'm going to tell my mommy! */
-      makeblock(&temp,Stdfilled);
-      tmemmove(temp.p,Stdout,Stdfilled);
-      readdyn(&temp,&Stdfilled,Stdfilled+backlen+1);
--     Stdout=realloc(Stdout,&Stdfilled+1);
-+     Stdout=realloc(Stdout,Stdfilled+1);
-      tmemmove(Stdout,temp.p,Stdfilled+1);
-      freeblock(&temp);
-      retStdout(Stdout,pwait&&pipw,!backblock);
-diff --git a/src/procmail.c b/src/procmail.c
-index 4a232f2..2bb449b 100644
---- a/src/procmail.c
-+++ b/src/procmail.c
-@@ -652,8 +652,7 @@ commint:do skipspace();					  /* skip whitespace */
- 	      nrcond= -1;
- 	   if(tolock)		 /* clear temporary buffer for lockfile name */
- 	      free(tolock);
--	   for(i=maxindex(flags);i;i--)			  /* clear the flags */
--	      flags[i]=0;
-+	   bbzero(flags,sizeof(flags));		  /* clear the flags */
- 	   for(tolock=0,locknext=0;;)
- 	    { chp=skpspace(chp);
- 	      switch(i= *chp++)
-diff --git a/src/recommend.c b/src/recommend.c
-index 5d41e01..9002268 100644
---- a/src/recommend.c
-+++ b/src/recommend.c
-@@ -47,7 +47,7 @@ int main(argc,argv)const int argc;const char*const argv[];
-      printf("chmod %lo %s\n",(unsigned long)(sgid|PERMIS),argv[2]);
-   else if(chmdir==1)
-      goto nogchmod;
--  if(chmdir)
-+  if(0)
-      printf("chmod %c+w %s/.\n",chmdir==1?'g':'a',mailspooldir);
- nogchmod:
-   return EXIT_SUCCESS;
---
-1.8.4.2
-
diff --git a/meta-oe/recipes-support/procmail/procmail/from-debian-to-fix-man-file.patch b/meta-oe/recipes-support/procmail/procmail/from-debian-to-fix-man-file.patch
deleted file mode 100644
index 78ac6241d0..0000000000
--- a/meta-oe/recipes-support/procmail/procmail/from-debian-to-fix-man-file.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 3cbc5e6e624235f9ba40cfd5a2b18c11be371399 Mon Sep 17 00:00:00 2001
-From: Li xin <lixin.fnst@cn.fujitsu.com>
-Date: Tue, 2 Dec 2014 07:02:01 +0900
-Subject: [PATCH 2/3] From debian to fix man file
-
-Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
----
-Upstream-Status: Pending
-
- man/procmail.man   | 24 +++++++++++++++++-------
- man/procmailrc.man |  2 +-
- 2 files changed, 18 insertions(+), 8 deletions(-)
-
-diff --git a/man/procmail.man b/man/procmail.man
-index 175043a..1274ce8 100644
---- a/man/procmail.man
-+++ b/man/procmail.man
-@@ -44,11 +44,11 @@ at the end.
- should be invoked automatically over the
- .B @DOT_FORWARD@
- file mechanism as soon as mail arrives.  Alternatively, when installed by
--a system administrator, it can be invoked from within the mailer immediately.
--When invoked, it first sets some environment variables to default values,
--reads the mail message from stdin until an EOF, separates the body from the
--header, and then, if no command line arguments are present, it starts to look
--for a file named
-+a system administrator (and in the standard Red Hat Linux configuration), it
-+can be invoked from within the mailer immediately.  When invoked, it
-+first sets some environment variables to default values, reads the mail message from
-+stdin until an EOF, separates the body from the header, and then, if no command line
-+arguments are present, it starts to look for a file named
- .BR @PROCMAILRC@ .
- According to the processing recipes in this file,
- the mail message that just arrived gets distributed into the right folder
-@@ -166,7 +166,8 @@ must be specified on the command line.  After the rcfile, procmail will
- accept an unlimited number of arguments.@ETCRCS_desc@
- For some advanced usage of this option you should look in the
- .B EXAMPLES
--section below.@LMTPOPTdesc@.SH ARGUMENTS
-+section below.@LMTPOPTdesc@
-+.SH ARGUMENTS
- Any arguments containing an '=' are considered to be environment variable
- assignments, they will
- .I all
-@@ -723,6 +724,15 @@ path.@FW_comment@
- .fi
- .ad
- .PP
-+Some mailers (notably exim) do not currently accept the above syntax.
-+In such case use this instead:
-+.PP
-+.na
-+.nf
-+|/usr/bin/procmail
-+.fi
-+.ad
-+.PP
- Procmail can also be invoked to postprocess an already filled system
- mailbox.  This can be useful if you don't want to or can't use a
- $HOME/@DOT_FORWARD@ file (in which case the following script could
-@@ -754,7 +764,7 @@ exit 0
- .SS "A sample small @PROCMAILRC@:"
- .na
- .nf
--PATH=/bin:/usr/bin:@BINDIR@
-+PATH=/usr/local/bin:/usr/bin:/bin
- MAILDIR=$HOME/Mail      #you'd better make sure it exists
- DEFAULT=$MAILDIR/mbox   #completely optional
- LOGFILE=$MAILDIR/from   #recommended
-diff --git a/man/procmailrc.man b/man/procmailrc.man
-index 472035f..7bf08dd 100644
---- a/man/procmailrc.man
-+++ b/man/procmailrc.man
-@@ -779,7 +779,7 @@ one trailing newline will be stripped.
- .PP
- Some non-optimal and non-obvious regexps set MATCH to an incorrect
- value.  The regexp can be made to work by removing one or more unneeded
--'*', '+', or '?' operator on the left-hand side of the \e/ token.
-+\&'*', '+', or '?' operator on the left-hand side of the \e/ token.
- .SH MISCELLANEOUS
- If the regular expression contains `\fB@TO_key@\fP' it will be substituted by
- .na
---
-1.8.4.2
-
diff --git a/meta-oe/recipes-support/procmail/procmail/from-debian-to-modify-parameters.patch b/meta-oe/recipes-support/procmail/procmail/from-debian-to-modify-parameters.patch
deleted file mode 100644
index 2bebccc0b2..0000000000
--- a/meta-oe/recipes-support/procmail/procmail/from-debian-to-modify-parameters.patch
+++ /dev/null
@@ -1,129 +0,0 @@
-From 95c742242769721f963c50702e1445fb70c6a45a Mon Sep 17 00:00:00 2001
-From: Li xin <lixin.fnst@cn.fujitsu.com>
-Date: Tue, 2 Dec 2014 07:07:33 +0900
-Subject: [PATCH 3/3] From debian to modify parameters
-
-Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
----
-Upstream-Status: Pending
-
- Makefile | 16 ++++++++--------
- config.h | 13 +++++++------
- 2 files changed, 15 insertions(+), 14 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 1e9568c..9e48201 100644
---- a/Makefile
-+++ b/Makefile
-@@ -23,7 +23,7 @@ MAN5DIR		= $(MANDIR)/man$(MAN5SUFFIX)
-
- # Uncomment to install compressed man pages (possibly add extra suffix
- # to the definitions of MAN?DIR and/or MAN?SUFFIX by hand)
--#MANCOMPRESS = compress
-+# MANCOMPRESS = compress
-
- ############################*#
- # Things that can be made are:
-@@ -55,7 +55,7 @@ MAN5DIR		= $(MANDIR)/man$(MAN5SUFFIX)
-
- LOCKINGTEST=__defaults__
-
--#LOCKINGTEST=/tmp .	# Uncomment and add any directories you see fit.
-+LOCKINGTEST=/tmp .	# Uncomment and add any directories you see fit.
- #			If LOCKINGTEST is defined, autoconf will NOT
- #			prompt you to enter additional directories.
- #			See INSTALL for more information about the
-@@ -65,7 +65,7 @@ LOCKINGTEST=__defaults__
- # Only edit below this line if you *think* you know what you are doing #
- ########################################################################
-
--#LOCKINGTEST=100	# Uncomment (and change) if you think you know
-+LOCKINGTEST=100	# Uncomment (and change) if you think you know
- #			it better than the autoconf lockingtests.
- #			This will cause the lockingtests to be hotwired.
- #			100	to enable fcntl()
-@@ -74,20 +74,20 @@ LOCKINGTEST=__defaults__
- #			Or them together to get the desired combination.
-
- # Optional system libraries we search for
--SEARCHLIBS = -lm -ldir -lx -lsocket -lnet -linet -lnsl_s -lnsl_i -lnsl -lsun \
-- -lgen -lsockdns -ldl
-+SEARCHLIBS = -lm -ldir -lx -lsocket -lnet -linet -lnsl_s -lnsl_i -lsun \
-+ -lgen -lsockdns
- #			-lresolv	# not really needed, is it?
-
- # Informal list of directories where we look for the libraries in SEARCHLIBS
--LIBPATHS=/lib /usr/lib /usr/local/lib
-+LIBPATHS=/lib /usr/lib
-
- GCC_WARNINGS = -O2 -pedantic -Wreturn-type -Wunused -Wformat -Wtraditional \
-  -Wpointer-arith -Wconversion -Waggregate-return \
-  #-Wimplicit -Wshadow -Wid-clash-6 #-Wuninitialized
-
- # The place to put your favourite extra cc flag
--CFLAGS0 = -O #$(GCC_WARNINGS)
--LDFLAGS0= -s
-+CFLAGS0 = $(RPM_OPT_FLAGS) #$(GCC_WARNINGS)
-+LDFLAGS0=
- # Read my libs :-)
- LIBS=
-
-diff --git a/config.h b/config.h
-index c4135a9..a07453f 100644
---- a/config.h
-+++ b/config.h
-@@ -35,7 +35,8 @@
-  */
- /*#define DEFSPATH	"PATH=/bin:/usr/bin"			/* */
- /*#define DEFPATH	"PATH=$HOME/bin:/bin:/usr/bin"		/* */
--
-+#define DEFPATH	"PATH=$HOME/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/X11R6/bin"		/* */
-+
- /* every environment variable appearing in PRESTENV will be set or wiped
-  * out of the environment (variables without an '=' sign will be thrown
-  * out), e.g. you could define PRESTENV as follows:
-@@ -46,13 +47,13 @@
-  */
- #define PRESTENV	{"IFS","ENV","PWD",0}
-
--/*#define GROUP_PER_USER			/* uncomment this if each
-+#define GROUP_PER_USER			/* uncomment this if each
- 						   user has his or her own
- 	group and procmail can therefore trust a $HOME/.procmailrc that
- 	is group writable or contained in a group writable home directory
- 	if the group involved is the user's default group. */
-
--/*#define LMTP					/* uncomment this if you
-+#define LMTP					/* uncomment this if you
- 						   want to use procmail
- 	as an LMTP (rfc2033) server, presumably for invocation by an MTA.
- 	The file examples/local_procmail_lmtp.m4 contains info on how to
-@@ -79,7 +80,7 @@
-
- /*#define NO_fcntl_LOCK		/* uncomment any of these three if you	     */
- /*#define NO_lockf_LOCK		/* definitely do not want procmail to make   */
--/*#define NO_flock_LOCK		/* use of those kernel-locking methods	     */
-+#define NO_flock_LOCK		/* use of those kernel-locking methods	     */
- 				/* If you set LOCKINGTEST to a binary number
- 	than there's no need to set these.  These #defines are only useful
- 	if you want to disable particular locking styles but are unsure which
-@@ -91,14 +92,14 @@
- 	restriction does not apply to the /etc/procmailrc and
- 	/etc/procmailrcs files) */
-
--/*#define NO_NFS_ATIME_HACK	/* uncomment if you're definitely not using
-+#define NO_NFS_ATIME_HACK	/* uncomment if you're definitely not using
- 				   NFS mounted filesystems and can't afford
- 	procmail to sleep for 1 sec. before writing to an empty regular
- 	mailbox.  This lets programs correctly judge whether there is unread
- 	mail present.  procmail automatically suppresses this when it isn't
- 	needed or under heavy load. */
-
--/*#define DEFsendmail	"/usr/sbin/sendmail"	/* uncomment and/or change if
-+#define DEFsendmail	"/usr/sbin/sendmail"	/* uncomment and/or change if
- 						   the autoconfigured default
- 	SENDMAIL is not suitable.  This program should quack like a sendmail:
- 	it should accept the -oi flag (to tell it to _not_ treat a line
---
-1.8.4.2
-
diff --git a/meta-oe/recipes-support/procmail/procmail/gcc14.patch b/meta-oe/recipes-support/procmail/procmail/gcc14.patch
deleted file mode 100644
index 5ca56fa006..0000000000
--- a/meta-oe/recipes-support/procmail/procmail/gcc14.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-From: Santiago Vila <sanvila@debian.org>
-Subject: Fix build with gcc-14
-Bug-Debian: https://bugs.debian.org/1075398
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/initmake
-+++ b/initmake
-@@ -124,7 +124,7 @@ else
- fi
-
- cat >_autotst.c <<HERE
--main()
-+int main()
- { return 0;
- }
- HERE
-@@ -200,7 +200,7 @@ cat >_autotst.c <<HERE
- #include <sys/types.h>
- #include <stdio.h>
- #include <sys/stat.h>
--main()
-+int main()
- { struct stat buf;return!&buf;
- }
- HERE
---- a/src/autoconf
-+++ b/src/autoconf
-@@ -414,6 +414,12 @@ cat >_autotst.c <<HERE
- int dolock,child[NR_of_forks],timeout,fdcollect;
- char dirlocktest[]="_locktest";
-
-+#include <stdlib.h>
-+int killchildren();
-+int fdlock(int fd);
-+int sfdlock(int fd);
-+int fdunlock();
-+
- void stimeout()
- { timeout=1;close(fdcollect);killchildren();
- }
-@@ -435,7 +441,7 @@ unsigned sfork()
-   return pid;
- }
-
--int main(argc,argv)char*argv[];
-+int main(int argc,char*argv[])
- { int goodlock,testlock,i,pip[2],pipw[2];time_t otimet;unsigned dtimet;
-   static char filename[]="_locktst.l0";
-   close(0);goodlock=0;testlock=FIRST_lock;signal(SIGPIPE,SIG_DFL);
-@@ -585,13 +591,13 @@ int killchildren()
-   return 0;
- }
-
--int sfdlock(fd)
-+int sfdlock(int fd)
- { int i;unsigned gobble[GOBBLE>>2];
-   for(i=GOBBLE>>2;i;gobble[--i]=~(unsigned)0);		 /* SunOS crash test */
-   return fdlock(fd);
- }
-
--static oldfdlock;
-+static int oldfdlock;
- #ifdef F_SETLKW
- static struct flock flck;		/* why can't it be a local variable? */
- #endif
-@@ -599,7 +605,7 @@ static struct flock flck;		/* why can't
- static off_t oldlockoffset;
- #endif
-
--int fdlock(fd)
-+int fdlock(int fd)
- { int i;unsigned gobble[GOBBLE>>2];
-   for(i=GOBBLE>>2;i;gobble[--i]=~(unsigned)0);		 /* SunOS crash test */
-   oldfdlock=fd;fd=0;
-@@ -993,11 +999,11 @@ int main(){int i;i=1;
-  i+=WIFEXITED(i);
-  i+=WIFSTOPPED(i);
-  i+=WEXITSTATUS(i);
-- i+=WSIGTERM(i);
-+ i+=WTERMSIG(i);
-  return i;}
- HERE
-
--echo 'Testing for WIFEXITED(), WIFSTOPPED(), WEXITSTATUS() & WSIGTERM()'
-+echo 'Testing for WIFEXITED(), WIFSTOPPED(), WEXITSTATUS() & WTERMSIG()'
- if $MAKE _autotst.$O >_autotst.rrr 2>&1
- then
-    $FGREP -v include/ <_autotst.rrr >_autotst.$O
-@@ -1029,6 +1035,8 @@ cat >_autotst.c <<HERE
- #ifndef NO_COMSAT
- #include "network.h"
- #endif
-+int setrgid();
-+int setresgid();
- int main(){char a[2];
-  endpwent();endgrent();memmove(a,"0",1);bcopy("0",a,1);strcspn(a,"0");
-  strtol("0",(char**)0,10);strchr("0",'0');strpbrk(a,"0");rename(a,"0");
-@@ -1059,7 +1067,7 @@ echo 'Testing for memmove, strchr, strpb
- echo '	rename, setrgid, setegid, pow, opendir, mkdir, waitpid, fsync,'
- echo '	ftruncate, strtod, strncasecmp, strerror, strlcat,'
- echo '	memset, bzero, and _exit'
--if $MAKE _autotst.$O >$DEVNULL 2>&1
-+if $MAKE _autotst.$O >_autotst.rrr 2>&1
- then
- :
- else
-@@ -1196,7 +1204,7 @@ unsigned long dobench(strstr,iter,haysta
-   return (unsigned long)clock()-to;
- }
- #endif
--int main(argc,argv)int argc;const char*argv[];
-+int main(int argc,const char*argv[])
- { if(argc==1)
-    { char*haystack;
- #ifdef BENCHSIZE
---- a/src/mailfold.c
-+++ b/src/mailfold.c
-@@ -378,7 +378,7 @@ void concon(ch)const int ch;   /* flip b
-    }
- }
-
--void readmail(rhead,tobesent)const long tobesent;
-+void readmail(int rhead,const long tobesent)
- { char*chp,*pastend;static size_t contlengthoffset;
-   ;{ long dfilled;
-      if(rhead==2)		  /* already read, just examine what we have */
diff --git a/meta-oe/recipes-support/procmail/procmail/man-file-mailstat.1-from-debian.patch b/meta-oe/recipes-support/procmail/procmail/man-file-mailstat.1-from-debian.patch
deleted file mode 100644
index 72fa27a834..0000000000
--- a/meta-oe/recipes-support/procmail/procmail/man-file-mailstat.1-from-debian.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 8ac56108e5f0a72d1bec0fb4f1fa4763a2479331 Mon Sep 17 00:00:00 2001
-From: Li xin <lixin.fnst@cn.fujitsu.com>
-Date: Tue, 2 Dec 2014 06:56:14 +0900
-Subject: [PATCH] man file mailstat.1 from debian
-
-Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
----
-Upstream-Status: Pending
-
- debian/mailstat.1 | 40 ++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 40 insertions(+)
- create mode 100644 debian/mailstat.1
-
-diff --git a/debian/mailstat.1 b/debian/mailstat.1
-new file mode 100644
-index 0000000..f13265a
---- /dev/null
-+++ b/debian/mailstat.1
-@@ -0,0 +1,40 @@
-+.TH MAILSTAT 1
-+.SH NAME
-+mailstat \- shows mail-arrival statistics
-+.SH SYNOPSIS
-+.B mailstat
-+[\-klmots] [logfile]
-+.SH DESCRIPTION
-+.B mailstat
-+parses a procmail-generated $LOGFILE and displays
-+a summary about the messages delivered to all folders
-+(total size, average size, nr of messages).
-+The $LOGFILE is truncated to zero length, unless the
-+.B -k
-+option is used.
-+Exit code 0 if mail arrived, 1 if no mail arrived.
-+.SH OPTIONS
-+.TP
-+.I \-k
-+keep logfile intact
-+.TP
-+.I \-l
-+long display format
-+.TP
-+.I \-m
-+merge any errors into one line
-+.TP
-+.I \-o
-+use the old logfile
-+.TP
-+.I \-t
-+terse display format
-+.TP
-+.I \-s
-+silent in case of no mail
-+.SH NOTES
-+Customise to your heart's content, this program is only provided as a
-+guideline.
-+.SH AUTHOR
-+This manual page was written by Santiago Vila <sanvila@debian.org>
-+for the Debian GNU/Linux distribution (but may be used by others).
---
-1.8.4.2
-
diff --git a/meta-oe/recipes-support/procmail/procmail/procmail-3.24-consolidated_fixes-1.patch b/meta-oe/recipes-support/procmail/procmail/procmail-3.24-consolidated_fixes-1.patch
new file mode 100644
index 0000000000..79cff4ae59
--- /dev/null
+++ b/meta-oe/recipes-support/procmail/procmail/procmail-3.24-consolidated_fixes-1.patch
@@ -0,0 +1,253 @@
+Submitted By:            Douglas R. Reno <renodr at linuxfromscratch dot org>
+Date:                    2024-06-05
+Initial Package Version: 3.24
+Upstream Status:         Submitted
+Origin:                  Fedora
+Description:             Fixes building procmail-3.24 with gcc-14. This includes
+                         several C99 portability fixes.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+diff --git a/initmake b/initmake
+index b901add..703d651 100755
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
+diff --git a/src/autoconf b/src/autoconf
+index deb97c1..c3f2576 100755
+--- a/src/autoconf
++++ b/src/autoconf
+@@ -361,6 +361,7 @@ cat >_autotst.c <<HERE
+ #include <unistd.h>		/* getpid() getppid() */
+ #endif
+ #include <stdio.h>
++#include <stdlib.h>
+ #include <time.h>
+ #include <fcntl.h>
+ #include <signal.h>		/* SIGKILL */
+@@ -414,6 +415,16 @@ cat >_autotst.c <<HERE
+ int dolock,child[NR_of_forks],timeout,fdcollect;
+ char dirlocktest[]="_locktest";
+
++int killchildren()
++{ int i;
++  i=NR_of_forks;
++  do
++     if(child[--i]>0)
++	kill(child[i],SIGTERM),child[i]=0;
++  while(i);
++  return 0;
++}
++
+ void stimeout()
+ { timeout=1;close(fdcollect);killchildren();
+ }
+@@ -435,7 +446,79 @@ unsigned sfork()
+   return pid;
+ }
+
+-int main(argc,argv)char*argv[];
++static int oldfdlock;
++#ifdef F_SETLKW
++static struct flock flck;		/* why can't it be a local variable? */
++#endif
++#ifdef F_LOCK
++static off_t oldlockoffset;
++#endif
++
++int fdlock(int fd)
++{ int i;unsigned gobble[GOBBLE>>2];
++  for(i=GOBBLE>>2;i;gobble[--i]=~(unsigned)0);		 /* SunOS crash test */
++  oldfdlock=fd;fd=0;
++  if(MSK_fcntl&dolock)
++#ifdef F_SETLKW
++   { static unsigned extra;
++     flck.l_type=F_WRLCK;flck.l_whence=SEEK_SET;flck.l_start=tell(oldfdlock);
++     if(!extra--)
++	extra=MIN_locks/4,flck.l_len=2,i|=fcntl(oldfdlock,F_SETLK,&flck);
++     flck.l_len=0;fd|=fcntl(oldfdlock,F_SETLKW,&flck);
++   }
++#else
++     fd=1;
++#endif
++  if(MSK_lockf&dolock)
++#ifdef F_LOCK
++     oldlockoffset=tell(oldfdlock),fd|=lockf(oldfdlock,F_LOCK,(off_t)0);
++#else
++     fd=1;
++#endif
++  if(MSK_flock&dolock)
++#ifdef LOCK_EX
++     fd|=flock(oldfdlock,LOCK_EX);
++#else
++     fd=1;
++#endif
++  return fd;
++}
++
++int sfdlock(int fd)
++{ int i;unsigned gobble[GOBBLE>>2];
++  for(i=GOBBLE>>2;i;gobble[--i]=~(unsigned)0);		 /* SunOS crash test */
++  return fdlock(fd);
++}
++
++int fdunlock()
++{ int i;unsigned gobble[GOBBLE];
++  for(i=GOBBLE;i;gobble[--i]=~(unsigned)0);  /* some SunOS libs mess this up */
++  if(MSK_flock&dolock)
++#ifdef LOCK_EX
++     i|=flock(oldfdlock,LOCK_UN);
++#else
++     i=1;
++#endif
++  if(MSK_lockf&dolock)
++#ifdef F_LOCK
++   { lseek(oldfdlock,oldlockoffset,SEEK_SET);
++     i|=lockf(oldfdlock,F_LOCK,(off_t)2);i|=lockf(oldfdlock,F_ULOCK,(off_t)0);
++   }
++#else
++     i=1;
++#endif
++  if(MSK_fcntl&dolock)
++#ifdef F_SETLKW
++     flck.l_type=F_UNLCK,flck.l_len=0,i|=fcntl(oldfdlock,F_SETLK,&flck);
++#else
++     i=1;
++#endif
++  if(!i)
++     for(i=GOBBLE;i&&gobble[--i]==~(unsigned)0;);
++  return i;
++}
++
++int main(argc,argv)int argc;char*argv[];
+ { int goodlock,testlock,i,pip[2],pipw[2];time_t otimet;unsigned dtimet;
+   static char filename[]="_locktst.l0";
+   close(0);goodlock=0;testlock=FIRST_lock;signal(SIGPIPE,SIG_DFL);
+@@ -574,88 +657,6 @@ skip_tests:
+   puts("Kernel-locking tests completed.");fprintf(stderr,"\n");
+   return EXIT_SUCCESS;
+ }
+-
+-int killchildren()
+-{ int i;
+-  i=NR_of_forks;
+-  do
+-     if(child[--i]>0)
+-	kill(child[i],SIGTERM),child[i]=0;
+-  while(i);
+-  return 0;
+-}
+-
+-int sfdlock(fd)
+-{ int i;unsigned gobble[GOBBLE>>2];
+-  for(i=GOBBLE>>2;i;gobble[--i]=~(unsigned)0);		 /* SunOS crash test */
+-  return fdlock(fd);
+-}
+-
+-static oldfdlock;
+-#ifdef F_SETLKW
+-static struct flock flck;		/* why can't it be a local variable? */
+-#endif
+-#ifdef F_LOCK
+-static off_t oldlockoffset;
+-#endif
+-
+-int fdlock(fd)
+-{ int i;unsigned gobble[GOBBLE>>2];
+-  for(i=GOBBLE>>2;i;gobble[--i]=~(unsigned)0);		 /* SunOS crash test */
+-  oldfdlock=fd;fd=0;
+-  if(MSK_fcntl&dolock)
+-#ifdef F_SETLKW
+-   { static unsigned extra;
+-     flck.l_type=F_WRLCK;flck.l_whence=SEEK_SET;flck.l_start=tell(oldfdlock);
+-     if(!extra--)
+-	extra=MIN_locks/4,flck.l_len=2,i|=fcntl(oldfdlock,F_SETLK,&flck);
+-     flck.l_len=0;fd|=fcntl(oldfdlock,F_SETLKW,&flck);
+-   }
+-#else
+-     fd=1;
+-#endif
+-  if(MSK_lockf&dolock)
+-#ifdef F_LOCK
+-     oldlockoffset=tell(oldfdlock),fd|=lockf(oldfdlock,F_LOCK,(off_t)0);
+-#else
+-     fd=1;
+-#endif
+-  if(MSK_flock&dolock)
+-#ifdef LOCK_EX
+-     fd|=flock(oldfdlock,LOCK_EX);
+-#else
+-     fd=1;
+-#endif
+-  return fd;
+-}
+-
+-int fdunlock()
+-{ int i;unsigned gobble[GOBBLE];
+-  for(i=GOBBLE;i;gobble[--i]=~(unsigned)0);  /* some SunOS libs mess this up */
+-  if(MSK_flock&dolock)
+-#ifdef LOCK_EX
+-     i|=flock(oldfdlock,LOCK_UN);
+-#else
+-     i=1;
+-#endif
+-  if(MSK_lockf&dolock)
+-#ifdef F_LOCK
+-   { lseek(oldfdlock,oldlockoffset,SEEK_SET);
+-     i|=lockf(oldfdlock,F_LOCK,(off_t)2);i|=lockf(oldfdlock,F_ULOCK,(off_t)0);
+-   }
+-#else
+-     i=1;
+-#endif
+-  if(MSK_fcntl&dolock)
+-#ifdef F_SETLKW
+-     flck.l_type=F_UNLCK,flck.l_len=0,i|=fcntl(oldfdlock,F_SETLK,&flck);
+-#else
+-     i=1;
+-#endif
+-  if(!i)
+-     for(i=GOBBLE;i&&gobble[--i]==~(unsigned)0;);
+-  return i;
+-}
+ HERE
+
+ if $MAKE _autotst >_autotst.rrr 2>&1
+@@ -1029,6 +1030,10 @@ cat >_autotst.c <<HERE
+ #ifndef NO_COMSAT
+ #include "network.h"
+ #endif
++#include <string.h>
++#include <unistd.h>
++int setrgid();
++int setresgid();
+ int main(){char a[2];
+  endpwent();endgrent();memmove(a,"0",1);bcopy("0",a,1);strcspn(a,"0");
+  strtol("0",(char**)0,10);strchr("0",'0');strpbrk(a,"0");rename(a,"0");
+@@ -1059,7 +1064,7 @@ echo 'Testing for memmove, strchr, strpbrk, strcspn, strtol, strstr,'
+ echo '	rename, setrgid, setegid, pow, opendir, mkdir, waitpid, fsync,'
+ echo '	ftruncate, strtod, strncasecmp, strerror, strlcat,'
+ echo '	memset, bzero, and _exit'
+-if $MAKE _autotst.$O >$DEVNULL 2>&1
++if $MAKE _autotst.$O >_autotst.rrr 2>&1
+ then
+ :
+ else
+
diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb b/meta-oe/recipes-support/procmail/procmail_3.24.bb
similarity index 50%
rename from meta-oe/recipes-support/procmail/procmail_3.22.bb
rename to meta-oe/recipes-support/procmail/procmail_3.24.bb
index 47c8310eaf..cb3775ebf6 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.24.bb
@@ -8,46 +8,38 @@ forward certain incoming mail automatically to someone."
 HOMEPAGE = "http://www.procmail.org/"
 SECTION = "Applications/System"

-SRC_URI = "http://www.ring.gr.jp/archives/net/mail/${BPN}/${BP}.tar.gz \
-    file://from-debian-to-fix-compile-errors.patch \
-    file://from-debian-to-modify-parameters.patch \
-    file://from-debian-to-fix-man-file.patch \
-    file://man-file-mailstat.1-from-debian.patch \
-    file://CVE-2014-3618.patch \
-    file://CVE-2017-16844.patch \
-    file://gcc14.patch \
-    file://0001-fix-uname-declaration.patch \
-    file://0001-fix-too-many-arguments-issue.patch \
-"
-SRC_URI[sha256sum] = "087c75b34dd33d8b9df5afe9e42801c9395f4bf373a784d9bc97153b0062e117"
+SRCREV = "07e769f07102767242edf835e995db6646bba373"
+SRC_URI = "git://github.com/BuGlessRB/procmail;protocol=https;branch=master;tag=v${PV} \
+           file://procmail-3.24-consolidated_fixes-1.patch \
+          "

 LICENSE = "GPL-2.0-only & Artistic-1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a71e50e197a992c862379e576e669757 \
     file://Artistic;md5=505e00d03c3428cde21b17b2a386590e"

-DEPENDS = "libnet"
+DEPENDS = "libnet libnsl2"
+
 inherit autotools-brokensep

 do_configure() {
     find examples -type f | xargs chmod 644
-    export CC="${BUILD_CC}"
+    export CC="${BUILD_CC} -std=gnu17 -Wno-implicit-function-declaration"
     export LD="${BUILD_LD}"
     export CFLAGS="${BUILD_CFLAGS}"
     export AR="${BUILD_AR}"
     export AS="${BUILD_AS}"
-    make TARGET_CFLAGS="$TARGET_CFLAGS -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${BUILD_LDFLAGS}" autoconf.h
+    oe_runmake TARGET_CFLAGS="$TARGET_CFLAGS -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${BUILD_LDFLAGS}" LOCKINGTEST=100 autoconf.h
 }

 do_compile() {
-    oe_runmake -i CFLAGS="$TARGET_CFLAGS -Wno-comments -Wno-implicit-int -Wno-implicit-function-declaration -Wno-incompatible-pointer-types -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${LDFLAGS}"
+    oe_runmake -i CFLAGS="$TARGET_CFLAGS -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 LOCKINGTEST=/tmp" LDFLAGS0="${LDFLAGS}" LOCKINGTEST=100
 }

 do_install() {
     install -d ${D}${bindir}
     install -d ${D}${mandir}/man1
     install -d ${D}${mandir}/man5
-    oe_runmake -i BASENAME=${D}/usr MANDIR=${D}${mandir} install
-    install -m 0644 debian/mailstat.1 ${D}${mandir}/man1
+    oe_runmake -i BASENAME=${D}/usr MANDIR=${D}${mandir} LOCKINGTEST=100 LDFLAGS0="${LDFLAGS}" install
 }

-CVE_STATUS[CVE-1999-0475] = "fixed-version: No action required. The current version (3.22) is not affected by the CVE."
+CVE_STATUS[CVE-1999-0475] = "fixed-version: No action required. The current version (3.24) is not affected by the CVE."

