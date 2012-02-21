Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1Rzq9S-00040t-KS
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 14:53:07 +0100
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Rzp8D-0001UD-Lw from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 04:47:46 -0800
Received: from pkl-noor-ubuntu.mgc.mentorg.com ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 21 Feb 2012 13:47:44 +0100
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Feb 2012 17:47:37 +0500
Message-Id: <1329828457-23375-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.9
X-OriginalArrivalTime: 21 Feb 2012 12:47:44.0481 (UTC)
	FILETIME=[019EBD10:01CCF097]
Subject: [meta-oe][PATCH] libedit: Adds version 20110802 (initial recipe)
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
X-List-Received-Date: Tue, 21 Feb 2012 13:53:07 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

* Imported recipe from oe-classic commit id 4e75705872fd9f289bbf4c74a912ca4710f50b93.
* Upgrade it to latest stable version.
* Tested on P4080DS.

Signed-of-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 .../libedit/files/20031222-debian-to-gentoo.patch  |  125 ++++++++++++++++++++
 .../libedit/files/libedit-add-soname.diff          |   12 ++
 .../recipes-devtools/libedit/libedit_20110802.bb   |   16 +++
 3 files changed, 153 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-devtools/libedit/files/20031222-debian-to-gentoo.patch b/meta-oe/recipes-devtools/libedit/files/20031222-debian-to-gentoo.patch
new file mode 100644
index 0000000..62069d5
--- /dev/null
+++ b/meta-oe/recipes-devtools/libedit/files/20031222-debian-to-gentoo.patch
@@ -0,0 +1,125 @@
+This patch is from openembedded 4e75705872fd9f289bbf4c74a912ca4710f50b93. 
+
+Upstream-Status: Inappropriate [not author]
+diff -ur netbsd-cvs/Makefile libedit-20031222/Makefile
+--- netbsd-cvs/Makefile	2003-12-22 13:44:24.798012752 -0500
++++ libedit-20031222/Makefile	2003-12-22 14:55:15.133863488 -0500
+@@ -5,6 +5,7 @@
+ 
+ WARNS=	3
+ LIB=	edit
++LIBS=-lncurses
+ 
+ OSRCS=	chared.c common.c el.c emacs.c fcns.c help.c hist.c key.c map.c \
+ 	parse.c prompt.c read.c refresh.c search.c sig.c term.c tty.c vi.c
+@@ -22,9 +23,10 @@
+ 	editline.3 tok_line.3 editline.3 tok_str.3
+ 
+ # For speed and debugging
+-#SRCS=   ${OSRCS} tokenizer.c history.c readline.c
++SRCS=   ${OSRCS} tokenizer.c history.c readline.c vis.c unvis.c fgetln.c strlcat.c strlcpy.c
+ # For protection
+-SRCS=	editline.c tokenizer.c history.c readline.c
++#SRCS=	editline.c tokenizer.c history.c readline.c
++OOBJS= $(patsubst %.c,%.o,$(SRCS))
+ 
+ LIBEDITDIR?=${.CURDIR}
+ 
+@@ -38,6 +40,7 @@
+ CPPFLAGS+=-I. -I${.CURDIR}
+ CPPFLAGS+=#-DDEBUG_TTY -DDEBUG_KEY -DDEBUG_READ -DDEBUG -DDEBUG_REFRESH
+ CPPFLAGS+=#-DDEBUG_PASTE -DDEBUG_EDIT
++CFLAGS+=-I. -include ../glibc-bsd-glue/bsdcompat.h -I../glibc-compat -I../glibc-bsd-glue
+ 
+ AHDR=vi.h emacs.h common.h 
+ ASRC=${LIBEDITDIR}/vi.c ${LIBEDITDIR}/emacs.c ${LIBEDITDIR}/common.c
+@@ -46,46 +49,56 @@
+ CLEANFILES+=	${AHDR} fcns.h help.h fcns.c help.c
+ 
+ SUBDIR=	readline
++HOST_SH=sh
++LIBEDITDIR=.
++all: .depend libedit.a libedit.so
+ 
+ vi.h: vi.c makelist
+ 	${HOST_SH} ${LIBEDITDIR}/makelist -h ${LIBEDITDIR}/vi.c \
+-	    > ${.TARGET}.tmp && \
+-	    mv ${.TARGET}.tmp ${.TARGET}
++	    > $@.tmp && \
++	    mv $@.tmp $@
+ 
+ emacs.h: emacs.c makelist
+ 	${HOST_SH} ${LIBEDITDIR}/makelist -h ${LIBEDITDIR}/emacs.c \
+-	    > ${.TARGET}.tmp && \
+-	    mv ${.TARGET}.tmp ${.TARGET}
++	    > $@.tmp && \
++	    mv $@.tmp $@
+ 
+ common.h: common.c makelist
+ 	${HOST_SH} ${LIBEDITDIR}/makelist -h ${LIBEDITDIR}/common.c \
+-	    > ${.TARGET}.tmp && \
+-	    mv ${.TARGET}.tmp ${.TARGET}
++	    > $@.tmp && \
++	    mv $@.tmp $@
+ 
+ fcns.h: ${AHDR} makelist
+-	${HOST_SH} ${LIBEDITDIR}/makelist -fh ${AHDR} > ${.TARGET}.tmp && \
+-	    mv ${.TARGET}.tmp ${.TARGET}
++	${HOST_SH} ${LIBEDITDIR}/makelist -fh ${AHDR} > $@.tmp && \
++	    mv $@.tmp $@
+ 
+ fcns.c: ${AHDR} fcns.h help.h makelist
+-	${HOST_SH} ${LIBEDITDIR}/makelist -fc ${AHDR} > ${.TARGET}.tmp && \
+-	    mv ${.TARGET}.tmp ${.TARGET}
++	${HOST_SH} ${LIBEDITDIR}/makelist -fc ${AHDR} > $@.tmp && \
++	    mv $@.tmp $@
+ 
+ help.c: ${ASRC} makelist 
+-	${HOST_SH} ${LIBEDITDIR}/makelist -bc ${ASRC} > ${.TARGET}.tmp && \
+-	    mv ${.TARGET}.tmp ${.TARGET}
++	${HOST_SH} ${LIBEDITDIR}/makelist -bc ${ASRC} > $@.tmp && \
++	    mv $@.tmp $@
+ 
+ help.h: ${ASRC} makelist
+-	${HOST_SH} ${LIBEDITDIR}/makelist -bh ${ASRC} > ${.TARGET}.tmp && \
+-	    mv ${.TARGET}.tmp ${.TARGET}
++	${HOST_SH} ${LIBEDITDIR}/makelist -bh ${ASRC} > $@.tmp && \
++	    mv $@.tmp $@
+ 
+ editline.c: ${OSRCS}
+-	${HOST_SH} ${LIBEDITDIR}/makelist -e ${.ALLSRC:T} > ${.TARGET}.tmp && \
+-	    mv ${.TARGET}.tmp ${.TARGET}
++	${HOST_SH} ${LIBEDITDIR}/makelist -e ${.ALLSRC:T} > $@.tmp && \
++	    mv $@.tmp $@
+ 
+ test.o:	${LIBEDITDIR}/TEST/test.c
+ 	
+ test:	libedit.a test.o 
+-	${CC} ${LDFLAGS} ${.ALLSRC} -o ${.TARGET} libedit.a ${LDADD} -ltermcap
++	${CC} ${LDFLAGS} ${.ALLSRC} -o $@ libedit.a ${LDADD} -ltermcap
+ 
+-.include <bsd.lib.mk>
+-.include <bsd.subdir.mk>
++.depend: vi.h emacs.h common.h fcns.h help.h help.c
++	-mkdir .a .so
++.c.o:
++	${CC} ${CFLAGS} -c $< -o .a/$*
++	${CC} ${CFLAGS} -fPIC -c $< -o .so/$*
++libedit.a: ${OOBJS}
++	ar -r $@ .a/*
++libedit.so: ${OOBJS}
++	${CC} --shared -o $@ .so/* ${LIBS}
+diff -ur netbsd-cvs/el.c libedit-20031222/el.c
+--- netbsd-cvs/el.c	2003-12-22 13:44:25.474909848 -0500
++++ libedit-20031222/el.c	2003-12-22 15:00:15.545194024 -0500
+@@ -439,8 +439,10 @@
+ 		static const char elpath[] = "/.editrc";
+ 		char path[MAXPATHLEN];
+ 
++#if 0
+ 		if (issetugid())
+ 			return (-1);
++#endif
+ 		if ((ptr = getenv("HOME")) == NULL)
+ 			return (-1);
+ 		if (strlcpy(path, ptr, sizeof(path)) >= sizeof(path))
diff --git a/meta-oe/recipes-devtools/libedit/files/libedit-add-soname.diff b/meta-oe/recipes-devtools/libedit/files/libedit-add-soname.diff
new file mode 100644
index 0000000..6b0434c
--- /dev/null
+++ b/meta-oe/recipes-devtools/libedit/files/libedit-add-soname.diff
@@ -0,0 +1,12 @@
+Add sonmae option in compiler switches. This patch is from openembedded 4e75705872fd9f289bbf4c74a912ca4710f50b93
+
+Upstream-Status: Inappropriate [not author]
+
+--- Makefile.orig	2005-04-20 18:12:45.000000000 +0200
++++ Makefile	2005-04-20 18:14:37.000000000 +0200
+@@ -101,4 +101,4 @@
+ libedit.a: ${OOBJS}
+ 	ar -r $@ .a/*
+ libedit.so: ${OOBJS}
+-	${CC} --shared -o $@ .so/* ${LIBS}
++	${CC} --shared -Wl,-soname=libedit.so.0 -o $@ .so/* ${LIBS}
diff --git a/meta-oe/recipes-devtools/libedit/libedit_20110802.bb b/meta-oe/recipes-devtools/libedit/libedit_20110802.bb
new file mode 100644
index 0000000..7410245
--- /dev/null
+++ b/meta-oe/recipes-devtools/libedit/libedit_20110802.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "BSD replacement for libreadline"
+HOMEPAGE = "http://www.thrysoee.dk/editline/"
+SECTION = "libs"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1e4228d0c5a9093b01aeaaeae6641533"
+
+DEPENDS = "ncurses"
+
+inherit autotools
+
+SRC_URI = "http://www.thrysoee.dk/editline/${PN}-${PV}-3.0.tar.gz"
+
+S = ${WORKDIR}/${PN}-${PV}-3.0
+
+SRC_URI[md5sum] = "0ea42e2c794da8ed32f6307b427f6590"
+SRC_URI[sha256sum] = "0b5ec9aa41faff761cda7819add93e9d8cb9c0bad85e65a686475e8375ac8a71"
-- 
1.7.9



