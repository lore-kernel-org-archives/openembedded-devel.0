Received: from mail-pa0-f41.google.com ([209.85.220.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrmXH-00036t-NK
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 10:28:58 +0100
Received: by mail-pa0-f41.google.com with SMTP id bj3so10084733pad.14
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=BUmD+bzZOCNr5yZSoEHWRhePGf4/hMgKVU4VkYN0IA0=;
	b=zK5oKBq5AcPmpViFsWETpPK7l8inOHylq4IynwukIPbB4pOrCV+Q6tTYSuD1qJfkFS
	LWWrN/Xss+Fu4wQxeWSdN4uxBeyW0PPQU9PyIEn5hIpkJrCLrUsuXe9jZdkP4OwjAtIl
	VF2WeMRktU8TsN1MV98fAtcIvxOZxotqX2nzBXL914N+0HNRLCl345CKh6roEIRWRc0M
	XBIDlXzdoW2Z3zihyjNJHj1QNDxoQz3/D4C1BcAo5w/1ZgGd9sr+M2tceJ6tYsAW3Z2e
	Jug2mW6iiCcgiDgqk2OtqtKQ6F2yA6heIzSeTS3sMFE/u5K56SGR36auBcx7xC8XdAmv
	ekOA==
X-Received: by 10.66.52.102 with SMTP id s6mr168523938pao.6.1357463627433;
	Sun, 06 Jan 2013 01:13:47 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qw8sm5137145pbc.39.2013.01.06.01.13.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:13:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 01:12:37 -0800
Message-Id: <1357463568-26241-14-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 14/25] tcsh: Add recipes for package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 06 Jan 2013 09:29:04 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/tcsh/files/01_build.1.patch   |   16 ++++++
 .../recipes-extended/tcsh/files/01_build.2.patch   |   13 +++++
 .../recipes-extended/tcsh/files/01_build.3.patch   |   13 +++++
 meta-oe/recipes-extended/tcsh/files/07_nls.patch   |   14 ++++++
 .../tcsh/files/12_unknown_lscolors.patch           |   24 +++++++++
 .../recipes-extended/tcsh/files/15_no-strip.patch  |   14 ++++++
 .../tcsh/files/cross-compile.patch                 |   12 +++++
 .../tcsh/files/disable-broken-test.patch           |   14 ++++++
 .../tcsh/files/disable-lexical.at-31.patch         |   30 +++++++++++
 .../tcsh/files/disable-test-nice.patch             |   23 +++++++++
 .../tcsh/files/disable-test-notty.patch            |   30 +++++++++++
 .../tcsh/files/fix-make-catalogs.patch             |   27 ++++++++++
 .../tcsh/files/tcsh-6.17.02-multibyte.patch        |   16 ++++++
 meta-oe/recipes-extended/tcsh/tcsh_6.17.02.bb      |   53 ++++++++++++++++++++
 14 files changed, 299 insertions(+)
 create mode 100644 meta-oe/recipes-extended/tcsh/files/01_build.1.patch
 create mode 100644 meta-oe/recipes-extended/tcsh/files/01_build.2.patch
 create mode 100644 meta-oe/recipes-extended/tcsh/files/01_build.3.patch
 create mode 100644 meta-oe/recipes-extended/tcsh/files/07_nls.patch
 create mode 100644 meta-oe/recipes-extended/tcsh/files/12_unknown_lscolors.patch
 create mode 100644 meta-oe/recipes-extended/tcsh/files/15_no-strip.patch
 create mode 100644 meta-oe/recipes-extended/tcsh/files/cross-compile.patch
 create mode 100644 meta-oe/recipes-extended/tcsh/files/disable-broken-test.patch
 create mode 100644 meta-oe/recipes-extended/tcsh/files/disable-lexical.at-31.patch
 create mode 100644 meta-oe/recipes-extended/tcsh/files/disable-test-nice.patch
 create mode 100644 meta-oe/recipes-extended/tcsh/files/disable-test-notty.patch
 create mode 100644 meta-oe/recipes-extended/tcsh/files/fix-make-catalogs.patch
 create mode 100644 meta-oe/recipes-extended/tcsh/files/tcsh-6.17.02-multibyte.patch
 create mode 100644 meta-oe/recipes-extended/tcsh/tcsh_6.17.02.bb

diff --git a/meta-oe/recipes-extended/tcsh/files/01_build.1.patch b/meta-oe/recipes-extended/tcsh/files/01_build.1.patch
new file mode 100644
index 0000000..b9f41ad
--- /dev/null
+++ b/meta-oe/recipes-extended/tcsh/files/01_build.1.patch
@@ -0,0 +1,16 @@
+Author: Franz Pletz <fpletz@franz-pletz.org>
+Description: Original comment: Fix build
+Not sure why we have this patch. Let's keep it for compatibility.
+--- a/pathnames.h
++++ b/pathnames.h
+@@ -92,6 +92,10 @@
+ # define _PATH_TCSHELL		"/local/bin/tcsh"	/* use ram disk */
+ #endif /* _MINIX && !_PATH_TCSHELL */
+ 
++#ifndef _PATH_TCSHELL
++# define _PATH_TCSHELL		"/bin/tcsh"		/* Debian */
++#endif /* !_PATH_TCSHELL */
++
+ #if defined(__EMX__) && !defined(_PATH_DEVNULL)
+ # define _PATH_DEVNULL		"nul"
+ #endif /* __EMX__ && !_PATH_DEVNULL */
diff --git a/meta-oe/recipes-extended/tcsh/files/01_build.2.patch b/meta-oe/recipes-extended/tcsh/files/01_build.2.patch
new file mode 100644
index 0000000..ff27531
--- /dev/null
+++ b/meta-oe/recipes-extended/tcsh/files/01_build.2.patch
@@ -0,0 +1,13 @@
+Author: Franz Pletz <fpletz@franz-pletz.org>
+Description: Update manpage.
+--- a/tcsh.man
++++ b/tcsh.man
+@@ -578,7 +578,7 @@ Repeating \fIdabbrev-expand\fR without a
+ changes to the next previous word etc., skipping identical matches
+ much like \fIhistory-search-backward\fR does.
+ .TP 8
+-.B delete-char \fR(not bound)
++.B delete-char \fR(bound to `Del' if using the standard \fI/etc/csh.cshrc\fR)
+ Deletes the character under the cursor.
+ See also \fIdelete-char-or-list-or-eof\fR.
+ .TP 8
diff --git a/meta-oe/recipes-extended/tcsh/files/01_build.3.patch b/meta-oe/recipes-extended/tcsh/files/01_build.3.patch
new file mode 100644
index 0000000..d36c177
--- /dev/null
+++ b/meta-oe/recipes-extended/tcsh/files/01_build.3.patch
@@ -0,0 +1,13 @@
+Author: Franz Pletz <fpletz@franz-pletz.org>
+Description: Enable NODOT
+--- a/config_f.h
++++ b/config_f.h
+@@ -98,7 +98,7 @@
+ /*
+  * NODOT	Don't put "." in the default path, for security reasons
+  */
+-#undef NODOT
++#define NODOT
+ 
+ /*
+  * AUTOLOGOUT	tries to determine if it should set autologout depending
diff --git a/meta-oe/recipes-extended/tcsh/files/07_nls.patch b/meta-oe/recipes-extended/tcsh/files/07_nls.patch
new file mode 100644
index 0000000..fe7845f
--- /dev/null
+++ b/meta-oe/recipes-extended/tcsh/files/07_nls.patch
@@ -0,0 +1,14 @@
+Author: Franz Pletz <fpletz@franz-pletz.org>
+Description: Fixes NLS build bug
+
+--- a/nls/Makefile.in
++++ b/nls/Makefile.in
+@@ -2,7 +2,7 @@
+ 
+ LOCALES=	C et finnish french german greek italian ja pl russian \
+ 		spanish ukrainian
+-GENCAT=		gencat
++GENCAT=		gencat --new
+ INSTALL=	ginstall
+ 
+ datarootdir=@datarootdir@
diff --git a/meta-oe/recipes-extended/tcsh/files/12_unknown_lscolors.patch b/meta-oe/recipes-extended/tcsh/files/12_unknown_lscolors.patch
new file mode 100644
index 0000000..faa59cc
--- /dev/null
+++ b/meta-oe/recipes-extended/tcsh/files/12_unknown_lscolors.patch
@@ -0,0 +1,24 @@
+Author: Franz Pletz <fpletz@franz-pletz.org>
+Description: Don't die on unknown LS_COLORS values
+Removing the patch causes a segfault when dircolors is set by coreutils' dircolors.
+Debian-Bug: #592089
+
+--- a/tw.color.c
++++ b/tw.color.c
+@@ -239,13 +239,10 @@ parseLS_COLORS(const Char *value)
+ 		    if ((Char)variables[i].variable[0] == (v[0] & CHAR) &&
+ 			(Char)variables[i].variable[1] == (v[1] & CHAR))
+ 			break;
+-		if (i < nvariables) {
+-		    v += 3;
++		v += 3;
++		if (i < nvariables)
+ 		    getstring(&c, &v, &variables[i].color, ':');
+-		    continue;
+-		}
+-		else
+-		    stderror(ERR_BADCOLORVAR, v[0], v[1]);
++		continue;
+ 	    }
+ 	    break;
+ 	}
diff --git a/meta-oe/recipes-extended/tcsh/files/15_no-strip.patch b/meta-oe/recipes-extended/tcsh/files/15_no-strip.patch
new file mode 100644
index 0000000..cbc9f65
--- /dev/null
+++ b/meta-oe/recipes-extended/tcsh/files/15_no-strip.patch
@@ -0,0 +1,14 @@
+Author: Lucas Nussbaum <lucas@debian.org>
+Description: do not strip binary
+ Stripping should be handled by dh_strip instead, so DEB_BUILD_OPTIONS=nostrip works.
+ Closes: #438109, #411607
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -596,7 +596,6 @@ install: tcsh$(EXEEXT)
+ 	-mkdir -p ${DESTBIN}
+ 	-mv -f ${DESTBIN}/tcsh$(EXEEXT)  ${DESTBIN}/tcsh.old
+ 	cp tcsh$(EXEEXT) ${DESTBIN}/tcsh$(EXEEXT)
+-	-strip ${DESTBIN}/tcsh$(EXEEXT)
+ 	chmod 755 ${DESTBIN}/tcsh$(EXEEXT)
+ 
+ install.man: tcsh.man
diff --git a/meta-oe/recipes-extended/tcsh/files/cross-compile.patch b/meta-oe/recipes-extended/tcsh/files/cross-compile.patch
new file mode 100644
index 0000000..06dcfda
--- /dev/null
+++ b/meta-oe/recipes-extended/tcsh/files/cross-compile.patch
@@ -0,0 +1,12 @@
+diff -git a/Makefile.in b/Makefile.in
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -446,7 +446,7 @@
+ 
+ gethost:  gethost.c sh.err.h tc.const.h sh.h
+ 	rm -f gethost
+-	${CC} -o gethost ${LDFLAGS} ${CFLAGS} ${CPPFLAGS} ${DFLAGS} $(srcdir)/gethost.c ${LIBES} ${EXTRALIBS}
++	${BUILD_CC} -o gethost ${BUILD_LDFLAGS} ${BUILD_CFLAGS} ${BUILD_CPPFLAGS} ${DFLAGS} $(srcdir)/gethost.c ${LIBES} ${EXTRALIBS}
+ 
+ tc.defs.c:	gethost host.defs
+ 	@rm -f $@.tmp
diff --git a/meta-oe/recipes-extended/tcsh/files/disable-broken-test.patch b/meta-oe/recipes-extended/tcsh/files/disable-broken-test.patch
new file mode 100644
index 0000000..0bda0ba
--- /dev/null
+++ b/meta-oe/recipes-extended/tcsh/files/disable-broken-test.patch
@@ -0,0 +1,14 @@
+Author: Lucas Nussbaum <lucas@debian.org>
+Description: disable syntactically incorrect test
+--- a/tests/lexical.at
++++ b/tests/lexical.at
+@@ -172,9 +172,6 @@
+ AT_DATA([nohist.csh],
+ [echo ! space !	tab != "!(" newline !
+ ])
+-AT_CHECK([tcsh -f nohist.csh], ,
+-[[! space ! tab != !( newline !
+-]])
+ 
+ AT_CLEANUP
+ 
diff --git a/meta-oe/recipes-extended/tcsh/files/disable-lexical.at-31.patch b/meta-oe/recipes-extended/tcsh/files/disable-lexical.at-31.patch
new file mode 100644
index 0000000..98a9b2e
--- /dev/null
+++ b/meta-oe/recipes-extended/tcsh/files/disable-lexical.at-31.patch
@@ -0,0 +1,30 @@
+--- a/tests/lexical.at
++++ b/tests/lexical.at
+@@ -27,27 +27,6 @@ AT_CHECK([tcsh -f oneword.csh], ,
+ 
+ AT_CLEANUP
+ 
+-
+-AT_SETUP([Comments])
+-
+-AT_CHECK([echo 'echo OK@%:@comment' | tcsh -f], , [OK
+-])
+-
+-AT_CHECK([tcsh -f -c 'echo @%:@no comment'], ,
+-[@%:@no comment
+-])
+-
+-AT_DATA([comment2.csh],
+-[[echo testing...@%:@\
+-OK
+-]])
+-AT_CHECK([tcsh -f comment2.csh], ,
+-[testing... OK
+-])
+-
+-AT_CLEANUP
+-
+-
+ AT_SETUP([Escaping special characters])
+ 
+ AT_DATA([nosplit.csh],
diff --git a/meta-oe/recipes-extended/tcsh/files/disable-test-nice.patch b/meta-oe/recipes-extended/tcsh/files/disable-test-nice.patch
new file mode 100644
index 0000000..79f918c
--- /dev/null
+++ b/meta-oe/recipes-extended/tcsh/files/disable-test-nice.patch
@@ -0,0 +1,23 @@
+Author: Lucas Nussbaum <lucas@debian.org>
+Description: disable test that fails on the buildd with
+  "setpriority: Permission denied".
+--- a/tests/commands.at
++++ b/tests/commands.at
+@@ -888,17 +888,6 @@ TCSH_UNTESTED([migrate])
+ TCSH_UNTESTED([newgrp])
+ 
+ 
+-AT_SETUP([nice])
+-
+-# Nothing really tested
+-AT_CHECK([tcsh -f -c 'nice set var=1; echo $?var'], ,
+-[0
+-])
+-
+-
+-AT_CLEANUP
+-
+-
+ AT_SETUP([nohup])
+ 
+ AT_DATA([nohup.csh],
diff --git a/meta-oe/recipes-extended/tcsh/files/disable-test-notty.patch b/meta-oe/recipes-extended/tcsh/files/disable-test-notty.patch
new file mode 100644
index 0000000..69f0564
--- /dev/null
+++ b/meta-oe/recipes-extended/tcsh/files/disable-test-notty.patch
@@ -0,0 +1,30 @@
+From: Lucas Nussbaum <lucas@debian.org>
+Description: Those tests fail when running the testsuite without a tty. Disabling them.
+
+--- a/tests/commands.at
++++ b/tests/commands.at
+@@ -1203,11 +1203,6 @@ AT_SETUP([source])
+ AT_DATA([script.csh],
+ [[set var=$1
+ ]])
+-AT_CHECK([[tcsh -f -c 'source -h script.csh foo; history' \
+-	   | sed 's/	[^	]*	/ TIME /']], ,
+-[     1 TIME source -h script.csh foo ; history
+-     2 TIME set var=$1
+-])
+ 
+ AT_CHECK([tcsh -f -c 'source -h script.csh foo; echo $var'], 1, [],
+ [var: Undefined variable.
+--- a/tests/variables.at
++++ b/tests/variables.at
+@@ -319,10 +319,6 @@ AT_CLEANUP
+ 
+ AT_SETUP([$ edit])
+ 
+-AT_CHECK([TERM=something tcsh -f -c 'echo $?edit'], ,
+-[1
+-])
+-
+ AT_CHECK([TERM=dumb tcsh -f -c 'echo $?edit'], ,
+ [0
+ ])
diff --git a/meta-oe/recipes-extended/tcsh/files/fix-make-catalogs.patch b/meta-oe/recipes-extended/tcsh/files/fix-make-catalogs.patch
new file mode 100644
index 0000000..43001f1
--- /dev/null
+++ b/meta-oe/recipes-extended/tcsh/files/fix-make-catalogs.patch
@@ -0,0 +1,27 @@
+Author: christos <christos>
+Date:   Thu May 13 18:39:02 2010 +0000
+
+    add a rule to make catalogs and propagate ${MAKE} instead of hard-coding make.
+
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -687,7 +687,7 @@ shar:
+ 	rm -rf tcsh-${VERSION}
+ 
+ catalogs:
+-	@(cd nls; make catalogs)
++	@(cd nls; ${MAKE})
+ 
+ tcsh-${VERSION}.tar.Z:
+ 	rm -rf tcsh-${VERSION} 
+--- a/nls/Makefile.in
++++ b/nls/Makefile.in
+@@ -18,7 +18,7 @@ install:	$(INSTALLED)
+ 	$(INSTALL) $< $@
+ 
+ %.cat:
+-	$(GENCAT) $@ $(@:%.cat=%)/*set*
++	cat $(@:%.cat=%)/charset $(@:%.cat=%)/set* | $(GENCAT) $@ 
+ 
+ clean:
+ 	$(RM) $(CATALOGS)
diff --git a/meta-oe/recipes-extended/tcsh/files/tcsh-6.17.02-multibyte.patch b/meta-oe/recipes-extended/tcsh/files/tcsh-6.17.02-multibyte.patch
new file mode 100644
index 0000000..7f3e926
--- /dev/null
+++ b/meta-oe/recipes-extended/tcsh/files/tcsh-6.17.02-multibyte.patch
@@ -0,0 +1,16 @@
+Author:  Jean-Luc Leger <reiga@dspnet.fr.eu.org>
+Description: fix broken globbing expansion
+Debian-Bug: #603545
+--- a/tc.str.c
++++ b/tc.str.c
+@@ -104,8 +104,9 @@ rt_mbtowc(Char *pwc, const char *s, size_t n)
+ 
+     memset (&mb, 0, sizeof mb);
+     ret = mbrtowc(&tmp, s, n, &mb);
+-    if (ret > 0) {
++    if (ret >= 0)
+ 	*pwc = tmp;
++    if (ret > 0) {
+ #ifdef UTF16_STRINGS
+ 	if (tmp >= 0xd800 && tmp <= 0xdbff) {
+ 	    /* UTF-16 surrogate pair.  Fetch second half and compute
diff --git a/meta-oe/recipes-extended/tcsh/tcsh_6.17.02.bb b/meta-oe/recipes-extended/tcsh/tcsh_6.17.02.bb
new file mode 100644
index 0000000..c4c78f4
--- /dev/null
+++ b/meta-oe/recipes-extended/tcsh/tcsh_6.17.02.bb
@@ -0,0 +1,53 @@
+DESCRIPTION = "TENEX C Shell, an enhanced version of Berkeley csh \
+ The TENEX C Shell is an enhanced version of the Berkeley Unix C shell. \
+ It includes all features of 4.4BSD C shell, plus a command-line editor, \
+ programmable word completion, spelling correction and more."
+
+HOMEPAGE = "http://www.tcsh.org/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://Copyright;md5=1cf29be62df2be1a3763118b25b4c780"
+SECTION = "base"
+
+SRC_URI = " \
+	${DEBIAN_MIRROR}/main/t/tcsh/tcsh_6.17.02.orig.tar.gz;name=tarball \
+	${DEBIAN_MIRROR}/main/t/tcsh/tcsh_6.17.02-4.diff.gz;name=diffs \
+	file://01_build.1.patch \
+	file://01_build.2.patch \
+	file://01_build.3.patch \
+	file://07_nls.patch \
+	file://15_no-strip.patch \
+	file://disable-test-notty.patch \
+	file://disable-test-nice.patch \
+	file://fix-make-catalogs.patch \
+	file://disable-lexical.at-31.patch \
+	file://12_unknown_lscolors.patch \
+	file://tcsh-6.17.02-multibyte.patch \
+	file://disable-broken-test.patch \
+	file://cross-compile.patch \
+"
+
+inherit autotools
+
+do_install_append () {
+	oe_runmake install.man DESTDIR=${D}
+
+	install -d ${D}${base_bindir}
+	ln -s /usr/bin/tcsh ${D}${base_bindir}/tcsh
+
+	install -d ${D}${sysconfdir}/csh/login.d
+	install -m 0644 ${S}/debian/csh.cshrc ${S}/debian/csh.login ${S}/debian/csh.logout ${S}/complete.tcsh ${D}${sysconfdir}
+	install -D -m 0644 ${S}/csh-mode.el ${D}${datadir}/emacs/site-lisp/csh-mode.el
+}
+
+FILES_${PN} += "${datadir}/emacs/site-lisp/csh-mode.el"
+
+
+pkg_postinst_${PN} () {
+#!/bin/sh -e
+echo /usr/bin/tcsh >> $D/etc/shells
+}
+
+SRC_URI[tarball.md5sum] = "ad6e89ddb654972b4c2a8bad06778625"
+SRC_URI[tarball.sha256sum] = "8c675729810eb49102b68e09be4f3f592dfa0be2c238f0d0a58e5c1147da7dd8"
+SRC_URI[diffs.md5sum] = "735286c36a83a043015b30871c7ab6b6"
+SRC_URI[diffs.sha256sum] = "61c0b0f7ebbc07544551f56b66c6e78def702c2197307e960898182b340ffe67"
-- 
1.7.9.5



