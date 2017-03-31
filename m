Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0AE8077E49
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:07 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id 81so76187228pgh.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ry/r0q/InedQyIk6HiwDsG/B0qaou75vOh0QMlgI4fU=;
	b=Np29Fj/Il1ItZJYfnJmOx72DHYKy49fgS12u0TeM0uSnKi1cyW+QzqSvVzhFV8PTzz
	Eqj5J9QdPNDuzZU82QodC6V4S4ny9xMalll5kDoG7qYC6bbV0gnKPmM8EjJU69yP6SDe
	Cdj8aRWS96LqGaoXK/zC23tTwGygX+/jmqS08JR90uyxjmlatOtoTa0gNmJdhX/3SHrF
	VVHnnputf4G9iFGgGlXtqSDGY5NEbt5rbZ+RnFZRZkzgJ8eAaWFcTQvGthJDeKfX4MQJ
	3IaZQkx9KETvTMo75/mZN7ykPTnHUTNwXCprRYLnDE7ZjSz1JiILzPErsdmdgN0FcBbx
	4Vkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ry/r0q/InedQyIk6HiwDsG/B0qaou75vOh0QMlgI4fU=;
	b=OIPn4PEr6UycZoLDsdokwlZvNnBlBBq19VFfSYd9A9f5TO31d0wACkDf9GHi7iA8Lh
	ObxLclep/Y7K2nB+ZpYRsda/lSvmS62KWL3OtKGPK1zRkW/iwyn071hNqtkysTg0Azko
	7tbPFg+Z1nNNO7B32H+pj8VT45Z++mBiej6WnjgqzzT5pyqdlEImuaxotUIOH3gv+Onk
	qz3bwBbzGuLXzlYRMM1e5smWcJtyz6rrFrdUEqHifllJWEOBwfGpHjKbW6Lr1j+Xj10d
	samlE7wQtsZodT1upFFvxs1kthvf2XjIldqF5i+JV3tU2MW/kJXY3G0ijPrkkQ0cveaO
	ohxw==
X-Gm-Message-State: AFeK/H2J4XTHWRVO+SgXk4yG3+1Rdm7zvHrtJy1b75IIHP0hVrh4k3r51kwiNWGBuf1gUg==
X-Received: by 10.99.106.138 with SMTP id f132mr4155406pgc.66.1490978588801;
	Fri, 31 Mar 2017 09:43:08 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:14 -0700
Message-Id: <20170331164247.5052-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 10/43] tcsh: Update to 6.20.00 release
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:08 -0000

Fix segfaults on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/tcsh/files/01_build.1.patch   | 16 ------
 .../recipes-extended/tcsh/files/01_build.2.patch   | 13 -----
 .../recipes-extended/tcsh/files/01_build.3.patch   | 13 -----
 .../tcsh/files/12_unknown_lscolors.patch           | 24 ---------
 .../recipes-extended/tcsh/files/15_no-strip.patch  | 14 -----
 .../tcsh/files/disable-broken-test.patch           | 14 -----
 .../tcsh/files/disable-lexical.at-31.patch         | 30 -----------
 .../tcsh/files/disable-test-nice.patch             | 23 ---------
 .../tcsh/files/disable-test-notty.patch            | 30 -----------
 .../tcsh/files/fix-gcc6-wait-union.patch           | 11 ----
 .../tcsh/files/tcsh-6.17.02-multibyte.patch        | 18 -------
 .../0001-Enable-system-malloc-on-all-linux.patch   | 30 +++++++++++
 .../tcsh/tcsh/0002-Add-debian-csh-scripts.patch    | 60 ++++++++++++++++++++++
 meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb      | 55 --------------------
 meta-oe/recipes-extended/tcsh/tcsh_6.20.00.bb      | 44 ++++++++++++++++
 15 files changed, 134 insertions(+), 261 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/tcsh/files/01_build.1.patch
 delete mode 100644 meta-oe/recipes-extended/tcsh/files/01_build.2.patch
 delete mode 100644 meta-oe/recipes-extended/tcsh/files/01_build.3.patch
 delete mode 100644 meta-oe/recipes-extended/tcsh/files/12_unknown_lscolors.patch
 delete mode 100644 meta-oe/recipes-extended/tcsh/files/15_no-strip.patch
 delete mode 100644 meta-oe/recipes-extended/tcsh/files/disable-broken-test.patch
 delete mode 100644 meta-oe/recipes-extended/tcsh/files/disable-lexical.at-31.patch
 delete mode 100644 meta-oe/recipes-extended/tcsh/files/disable-test-nice.patch
 delete mode 100644 meta-oe/recipes-extended/tcsh/files/disable-test-notty.patch
 delete mode 100644 meta-oe/recipes-extended/tcsh/files/fix-gcc6-wait-union.patch
 delete mode 100644 meta-oe/recipes-extended/tcsh/files/tcsh-6.17.02-multibyte.patch
 create mode 100644 meta-oe/recipes-extended/tcsh/tcsh/0001-Enable-system-malloc-on-all-linux.patch
 create mode 100644 meta-oe/recipes-extended/tcsh/tcsh/0002-Add-debian-csh-scripts.patch
 delete mode 100644 meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb
 create mode 100644 meta-oe/recipes-extended/tcsh/tcsh_6.20.00.bb

diff --git a/meta-oe/recipes-extended/tcsh/files/01_build.1.patch b/meta-oe/recipes-extended/tcsh/files/01_build.1.patch
deleted file mode 100644
index b9f41ade9..000000000
--- a/meta-oe/recipes-extended/tcsh/files/01_build.1.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Author: Franz Pletz <fpletz@franz-pletz.org>
-Description: Original comment: Fix build
-Not sure why we have this patch. Let's keep it for compatibility.
---- a/pathnames.h
-+++ b/pathnames.h
-@@ -92,6 +92,10 @@
- # define _PATH_TCSHELL		"/local/bin/tcsh"	/* use ram disk */
- #endif /* _MINIX && !_PATH_TCSHELL */
- 
-+#ifndef _PATH_TCSHELL
-+# define _PATH_TCSHELL		"/bin/tcsh"		/* Debian */
-+#endif /* !_PATH_TCSHELL */
-+
- #if defined(__EMX__) && !defined(_PATH_DEVNULL)
- # define _PATH_DEVNULL		"nul"
- #endif /* __EMX__ && !_PATH_DEVNULL */
diff --git a/meta-oe/recipes-extended/tcsh/files/01_build.2.patch b/meta-oe/recipes-extended/tcsh/files/01_build.2.patch
deleted file mode 100644
index ff2753154..000000000
--- a/meta-oe/recipes-extended/tcsh/files/01_build.2.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Author: Franz Pletz <fpletz@franz-pletz.org>
-Description: Update manpage.
---- a/tcsh.man
-+++ b/tcsh.man
-@@ -578,7 +578,7 @@ Repeating \fIdabbrev-expand\fR without a
- changes to the next previous word etc., skipping identical matches
- much like \fIhistory-search-backward\fR does.
- .TP 8
--.B delete-char \fR(not bound)
-+.B delete-char \fR(bound to `Del' if using the standard \fI/etc/csh.cshrc\fR)
- Deletes the character under the cursor.
- See also \fIdelete-char-or-list-or-eof\fR.
- .TP 8
diff --git a/meta-oe/recipes-extended/tcsh/files/01_build.3.patch b/meta-oe/recipes-extended/tcsh/files/01_build.3.patch
deleted file mode 100644
index d36c177af..000000000
--- a/meta-oe/recipes-extended/tcsh/files/01_build.3.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Author: Franz Pletz <fpletz@franz-pletz.org>
-Description: Enable NODOT
---- a/config_f.h
-+++ b/config_f.h
-@@ -98,7 +98,7 @@
- /*
-  * NODOT	Don't put "." in the default path, for security reasons
-  */
--#undef NODOT
-+#define NODOT
- 
- /*
-  * AUTOLOGOUT	tries to determine if it should set autologout depending
diff --git a/meta-oe/recipes-extended/tcsh/files/12_unknown_lscolors.patch b/meta-oe/recipes-extended/tcsh/files/12_unknown_lscolors.patch
deleted file mode 100644
index faa59cc80..000000000
--- a/meta-oe/recipes-extended/tcsh/files/12_unknown_lscolors.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Author: Franz Pletz <fpletz@franz-pletz.org>
-Description: Don't die on unknown LS_COLORS values
-Removing the patch causes a segfault when dircolors is set by coreutils' dircolors.
-Debian-Bug: #592089
-
---- a/tw.color.c
-+++ b/tw.color.c
-@@ -239,13 +239,10 @@ parseLS_COLORS(const Char *value)
- 		    if ((Char)variables[i].variable[0] == (v[0] & CHAR) &&
- 			(Char)variables[i].variable[1] == (v[1] & CHAR))
- 			break;
--		if (i < nvariables) {
--		    v += 3;
-+		v += 3;
-+		if (i < nvariables)
- 		    getstring(&c, &v, &variables[i].color, ':');
--		    continue;
--		}
--		else
--		    stderror(ERR_BADCOLORVAR, v[0], v[1]);
-+		continue;
- 	    }
- 	    break;
- 	}
diff --git a/meta-oe/recipes-extended/tcsh/files/15_no-strip.patch b/meta-oe/recipes-extended/tcsh/files/15_no-strip.patch
deleted file mode 100644
index cbc9f65d0..000000000
--- a/meta-oe/recipes-extended/tcsh/files/15_no-strip.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Author: Lucas Nussbaum <lucas@debian.org>
-Description: do not strip binary
- Stripping should be handled by dh_strip instead, so DEB_BUILD_OPTIONS=nostrip works.
- Closes: #438109, #411607
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -596,7 +596,6 @@ install: tcsh$(EXEEXT)
- 	-mkdir -p ${DESTBIN}
- 	-mv -f ${DESTBIN}/tcsh$(EXEEXT)  ${DESTBIN}/tcsh.old
- 	cp tcsh$(EXEEXT) ${DESTBIN}/tcsh$(EXEEXT)
--	-strip ${DESTBIN}/tcsh$(EXEEXT)
- 	chmod 755 ${DESTBIN}/tcsh$(EXEEXT)
- 
- install.man: tcsh.man
diff --git a/meta-oe/recipes-extended/tcsh/files/disable-broken-test.patch b/meta-oe/recipes-extended/tcsh/files/disable-broken-test.patch
deleted file mode 100644
index 0bda0ba10..000000000
--- a/meta-oe/recipes-extended/tcsh/files/disable-broken-test.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Author: Lucas Nussbaum <lucas@debian.org>
-Description: disable syntactically incorrect test
---- a/tests/lexical.at
-+++ b/tests/lexical.at
-@@ -172,9 +172,6 @@
- AT_DATA([nohist.csh],
- [echo ! space !	tab != "!(" newline !
- ])
--AT_CHECK([tcsh -f nohist.csh], ,
--[[! space ! tab != !( newline !
--]])
- 
- AT_CLEANUP
- 
diff --git a/meta-oe/recipes-extended/tcsh/files/disable-lexical.at-31.patch b/meta-oe/recipes-extended/tcsh/files/disable-lexical.at-31.patch
deleted file mode 100644
index 98a9b2e1d..000000000
--- a/meta-oe/recipes-extended/tcsh/files/disable-lexical.at-31.patch
+++ /dev/null
@@ -1,30 +0,0 @@
---- a/tests/lexical.at
-+++ b/tests/lexical.at
-@@ -27,27 +27,6 @@ AT_CHECK([tcsh -f oneword.csh], ,
- 
- AT_CLEANUP
- 
--
--AT_SETUP([Comments])
--
--AT_CHECK([echo 'echo OK@%:@comment' | tcsh -f], , [OK
--])
--
--AT_CHECK([tcsh -f -c 'echo @%:@no comment'], ,
--[@%:@no comment
--])
--
--AT_DATA([comment2.csh],
--[[echo testing...@%:@\
--OK
--]])
--AT_CHECK([tcsh -f comment2.csh], ,
--[testing... OK
--])
--
--AT_CLEANUP
--
--
- AT_SETUP([Escaping special characters])
- 
- AT_DATA([nosplit.csh],
diff --git a/meta-oe/recipes-extended/tcsh/files/disable-test-nice.patch b/meta-oe/recipes-extended/tcsh/files/disable-test-nice.patch
deleted file mode 100644
index 79f918c08..000000000
--- a/meta-oe/recipes-extended/tcsh/files/disable-test-nice.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Author: Lucas Nussbaum <lucas@debian.org>
-Description: disable test that fails on the buildd with
-  "setpriority: Permission denied".
---- a/tests/commands.at
-+++ b/tests/commands.at
-@@ -888,17 +888,6 @@ TCSH_UNTESTED([migrate])
- TCSH_UNTESTED([newgrp])
- 
- 
--AT_SETUP([nice])
--
--# Nothing really tested
--AT_CHECK([tcsh -f -c 'nice set var=1; echo $?var'], ,
--[0
--])
--
--
--AT_CLEANUP
--
--
- AT_SETUP([nohup])
- 
- AT_DATA([nohup.csh],
diff --git a/meta-oe/recipes-extended/tcsh/files/disable-test-notty.patch b/meta-oe/recipes-extended/tcsh/files/disable-test-notty.patch
deleted file mode 100644
index 69f0564e8..000000000
--- a/meta-oe/recipes-extended/tcsh/files/disable-test-notty.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From: Lucas Nussbaum <lucas@debian.org>
-Description: Those tests fail when running the testsuite without a tty. Disabling them.
-
---- a/tests/commands.at
-+++ b/tests/commands.at
-@@ -1203,11 +1203,6 @@ AT_SETUP([source])
- AT_DATA([script.csh],
- [[set var=$1
- ]])
--AT_CHECK([[tcsh -f -c 'source -h script.csh foo; history' \
--	   | sed 's/	[^	]*	/ TIME /']], ,
--[     1 TIME source -h script.csh foo ; history
--     2 TIME set var=$1
--])
- 
- AT_CHECK([tcsh -f -c 'source -h script.csh foo; echo $var'], 1, [],
- [var: Undefined variable.
---- a/tests/variables.at
-+++ b/tests/variables.at
-@@ -319,10 +319,6 @@ AT_CLEANUP
- 
- AT_SETUP([$ edit])
- 
--AT_CHECK([TERM=something tcsh -f -c 'echo $?edit'], ,
--[1
--])
--
- AT_CHECK([TERM=dumb tcsh -f -c 'echo $?edit'], ,
- [0
- ])
diff --git a/meta-oe/recipes-extended/tcsh/files/fix-gcc6-wait-union.patch b/meta-oe/recipes-extended/tcsh/files/fix-gcc6-wait-union.patch
deleted file mode 100644
index acc2ce93d..000000000
--- a/meta-oe/recipes-extended/tcsh/files/fix-gcc6-wait-union.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- tcsh-6.18.01/sh.proc.c.orig	2016-06-08 16:11:02.902326725 +0000
-+++ tcsh-6.18.01/sh.proc.c	2016-06-08 16:38:22.150304901 +0000
-@@ -48,7 +48,7 @@
- #endif /* aiws */
- 
- #if defined(_BSD) || (defined(IRIS4D) && __STDC__) || defined(__lucid) || defined(__linux__) || defined(__GNU__) || defined(__GLIBC__)
--# if !defined(__ANDROID__)
-+# if !defined(__ANDROID__) && !defined(__GLIBC__)
- #  define BSDWAIT
- # endif
- #endif /* _BSD || (IRIS4D && __STDC__) || __lucid || glibc */
diff --git a/meta-oe/recipes-extended/tcsh/files/tcsh-6.17.02-multibyte.patch b/meta-oe/recipes-extended/tcsh/files/tcsh-6.17.02-multibyte.patch
deleted file mode 100644
index 3dd420a0e..000000000
--- a/meta-oe/recipes-extended/tcsh/files/tcsh-6.17.02-multibyte.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Author:  Jean-Luc Leger <reiga@dspnet.fr.eu.org>
-Description: fix broken globbing expansion
-Debian-Bug: #603545
-Index: tcsh-6.18.01/tc.str.c
-===================================================================
---- tcsh-6.18.01.orig/tc.str.c	2012-01-10 13:34:31.000000000 -0800
-+++ tcsh-6.18.01/tc.str.c	2013-02-26 13:12:13.429153489 -0800
-@@ -122,8 +122,9 @@
- #else
-     ret = mbtowc(&tmp, s, n);
- #endif
--    if (ret > 0) {
-+    if (ret >= 0)
- 	*pwc = tmp;
-+    if (ret >= 0) {
- #if defined(UTF16_STRINGS) && defined(HAVE_MBRTOWC)
- 	if (tmp >= 0xd800 && tmp <= 0xdbff) {
- 	    /* UTF-16 surrogate pair.  Fetch second half and compute
diff --git a/meta-oe/recipes-extended/tcsh/tcsh/0001-Enable-system-malloc-on-all-linux.patch b/meta-oe/recipes-extended/tcsh/tcsh/0001-Enable-system-malloc-on-all-linux.patch
new file mode 100644
index 000000000..ff2f6a3b6
--- /dev/null
+++ b/meta-oe/recipes-extended/tcsh/tcsh/0001-Enable-system-malloc-on-all-linux.patch
@@ -0,0 +1,30 @@
+From 0553455813a1f717ef50cc911e4db73da3d23c32 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 22 Mar 2017 18:47:40 -0700
+Subject: [PATCH 1/2] Enable system malloc on all linux
+
+Dont trigger on being just android or glibc
+internal malloc falls flat on musl based systems
+as well. So switch to using system malloc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ config_f.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config_f.h b/config_f.h
+index 6a632a5..0a66960 100644
+--- a/config_f.h
++++ b/config_f.h
+@@ -139,7 +139,7 @@
+  *		This can be much slower and no memory statistics will be
+  *		provided.
+  */
+-#if defined(__MACHTEN__) || defined(PURIFY) || defined(MALLOC_TRACE) || defined(_OSD_POSIX) || defined(__MVS__) || defined (__CYGWIN__) || defined(__GLIBC__) || defined(__OpenBSD__) || defined(__APPLE__) || defined (__ANDROID__)
++#if defined(__MACHTEN__) || defined(PURIFY) || defined(MALLOC_TRACE) || defined(_OSD_POSIX) || defined(__MVS__) || defined (__CYGWIN__) || defined(__linux__) || defined(__OpenBSD__) || defined(__APPLE__)
+ # define SYSMALLOC
+ #else
+ # undef SYSMALLOC
+-- 
+2.12.1
+
diff --git a/meta-oe/recipes-extended/tcsh/tcsh/0002-Add-debian-csh-scripts.patch b/meta-oe/recipes-extended/tcsh/tcsh/0002-Add-debian-csh-scripts.patch
new file mode 100644
index 000000000..e4de6f7fe
--- /dev/null
+++ b/meta-oe/recipes-extended/tcsh/tcsh/0002-Add-debian-csh-scripts.patch
@@ -0,0 +1,60 @@
+From 60271713025f6b17dda29721be012a8428e77185 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 22 Mar 2017 18:56:49 -0700
+Subject: [PATCH 2/2] Add debian csh scripts
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ csh.cshrc  | 15 +++++++++++++++
+ csh.login  |  8 ++++++++
+ csh.logout |  1 +
+ 3 files changed, 24 insertions(+)
+ create mode 100644 csh.cshrc
+ create mode 100644 csh.login
+ create mode 100644 csh.logout
+
+diff --git a/csh.cshrc b/csh.cshrc
+new file mode 100644
+index 0000000..29c934a
+--- /dev/null
++++ b/csh.cshrc
+@@ -0,0 +1,15 @@
++# /etc/csh.cshrc: system-wide .cshrc file for csh(1) and tcsh(1)
++
++if ($?tcsh && $?prompt) then
++
++	bindkey "\e[1~" beginning-of-line # Home
++	bindkey "\e[7~" beginning-of-line # Home rxvt
++	bindkey "\e[2~" overwrite-mode    # Ins
++	bindkey "\e[3~" delete-char       # Delete
++	bindkey "\e[4~" end-of-line       # End
++	bindkey "\e[8~" end-of-line       # End rxvt
++
++	set autoexpand
++	set autolist
++	set prompt = "%U%m%u:%B%~%b%# "
++endif
+diff --git a/csh.login b/csh.login
+new file mode 100644
+index 0000000..2455c3c
+--- /dev/null
++++ b/csh.login
+@@ -0,0 +1,8 @@
++# /etc/csh.login: system-wide .login file for csh(1) and tcsh(1)
++
++# allow for other packages/system admins to customize the shell environment
++if (-e /etc/csh/login.d && `/bin/ls /etc/csh/login.d` != "") then
++  foreach FILE (`/bin/ls /etc/csh/login.d/*`)
++    source $FILE;
++  end;
++endif
+diff --git a/csh.logout b/csh.logout
+new file mode 100644
+index 0000000..a207eba
+--- /dev/null
++++ b/csh.logout
+@@ -0,0 +1 @@
++# /etc/csh.logout: system-wide .logout file for csh(1) and tcsh(1)
+-- 
+2.12.1
+
diff --git a/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb b/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb
deleted file mode 100644
index 1cfd96c54..000000000
--- a/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-DESCRIPTION = "TENEX C Shell, an enhanced version of Berkeley csh \
-    The TENEX C Shell is an enhanced version of the Berkeley Unix C shell. \
-    It includes all features of 4.4BSD C shell, plus a command-line editor, \
-    programmable word completion, spelling correction and more."
-
-HOMEPAGE = "http://www.tcsh.org/"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://Copyright;md5=1cf29be62df2be1a3763118b25b4c780"
-SECTION = "base"
-DEPENDS = "ncurses gettext-native"
-SRC_URI = " \
-    ${DEBIAN_MIRROR}/main/t/tcsh/tcsh_${PV}.orig.tar.gz;name=tarball \
-    ${DEBIAN_MIRROR}/main/t/tcsh/tcsh_${PV}-2.diff.gz;name=diffs2 \
-    ${DEBIAN_MIRROR}/main/t/tcsh/tcsh_${PV}-5.diff.gz;name=diffs5 \
-    file://01_build.1.patch \
-    file://01_build.2.patch \
-    file://01_build.3.patch \
-    file://15_no-strip.patch \
-    file://disable-test-notty.patch \
-    file://disable-test-nice.patch \
-    file://disable-lexical.at-31.patch \
-    file://12_unknown_lscolors.patch \
-    file://tcsh-6.17.02-multibyte.patch \
-    file://disable-broken-test.patch \
-    file://fix-gcc6-wait-union.patch \
-"
-SRC_URI[tarball.md5sum] = "6eed09dbd4223ab5b6955378450d228a"
-SRC_URI[tarball.sha256sum] = "d81ca27851f3e8545666399b4bcf25433e602a195113b3f7c73886fef84c9fa8"
-SRC_URI[diffs2.md5sum] = "ea39b818b624aca49ebf2cd2708d6ff9"
-SRC_URI[diffs2.sha256sum] = "95b0c1a339b745c47c5d2f9d02c22a71597462e2e882b51614a9d1f75bd3d16c"
-SRC_URI[diffs5.md5sum] = "d536c12a02dc48c332cc472b86927319"
-SRC_URI[diffs5.sha256sum] = "7548d64bf996548bfbc13f3e0959fd2e8455f8375381a31da67d79554aabc7af"
-
-inherit autotools
-
-do_install_append () {
-    oe_runmake install.man DESTDIR=${D}
-
-    install -d ${D}${base_bindir}
-    ln -s /usr/bin/tcsh ${D}${base_bindir}/tcsh
-
-    install -d ${D}${sysconfdir}/csh/login.d
-    install -m 0644 ${S}/debian/csh.cshrc ${S}/debian/csh.login ${S}/debian/csh.logout ${S}/complete.tcsh ${D}${sysconfdir}
-    install -D -m 0644 ${S}/csh-mode.el ${D}${datadir}/emacs/site-lisp/csh-mode.el
-}
-
-FILES_${PN} += "${datadir}/emacs/site-lisp/csh-mode.el"
-
-
-pkg_postinst_${PN} () {
-#!/bin/sh -e
-echo /usr/bin/tcsh >> $D/etc/shells
-}
-
-PNBLACKLIST[tcsh] ?= "Doesn't respect CC variable and fails with HOSTTOOLS http://errors.yoctoproject.org/Errors/Details/138244/"
diff --git a/meta-oe/recipes-extended/tcsh/tcsh_6.20.00.bb b/meta-oe/recipes-extended/tcsh/tcsh_6.20.00.bb
new file mode 100644
index 000000000..b59d88f5d
--- /dev/null
+++ b/meta-oe/recipes-extended/tcsh/tcsh_6.20.00.bb
@@ -0,0 +1,44 @@
+DESCRIPTION = "TENEX C Shell, an enhanced version of Berkeley csh \
+    The TENEX C Shell is an enhanced version of the Berkeley Unix C shell. \
+    It includes all features of 4.4BSD C shell, plus a command-line editor, \
+    programmable word completion, spelling correction and more."
+
+HOMEPAGE = "http://www.tcsh.org/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://Copyright;md5=575cf2715c3bf894e1f79aec1d4eaaf5"
+SECTION = "base"
+DEPENDS = "ncurses gettext-native"
+SRC_URI = " \
+    http://ftp.funet.fi/pub/mirrors/ftp.astron.com/pub/tcsh/${BP}.tar.gz \
+    file://0001-Enable-system-malloc-on-all-linux.patch \
+    file://0002-Add-debian-csh-scripts.patch \
+"
+SRC_URI[md5sum] = "59d40ef40a68e790d95e182069431834"
+SRC_URI[sha256sum] = "b89de7064ab54dac454a266cfe5d8bf66940cb5ed048d0c30674ea62e7ecef9d"
+
+EXTRA_OEMAKE += "CC_FOR_GETHOST='${BUILD_CC}'"
+inherit autotools
+
+do_compile_prepend() {
+    oe_runmake CC_FOR_GETHOST='${BUILD_CC}' CFLAGS='${BUILD_CFLAGS}' gethost
+}
+
+do_install_append () {
+    oe_runmake install.man DESTDIR=${D}
+
+    install -d ${D}${base_bindir}
+    ln -s /usr/bin/tcsh ${D}${base_bindir}/tcsh
+    ln -s /usr/bin/tcsh ${D}${base_bindir}/csh
+    install -d ${D}${sysconfdir}/csh/login.d
+    install -m 0644 ${S}/csh.cshrc ${S}/csh.login ${S}/csh.logout ${S}/complete.tcsh ${D}${sysconfdir}
+    install -D -m 0644 ${S}/csh-mode.el ${D}${datadir}/emacs/site-lisp/csh-mode.el
+}
+
+FILES_${PN} += "${datadir}/emacs/site-lisp/csh-mode.el"
+
+
+pkg_postinst_${PN} () {
+#!/bin/sh -e
+echo /usr/bin/tcsh >> $D/etc/shells
+echo /usr/bin/csh >> $D/etc/shells
+}
-- 
2.12.1


