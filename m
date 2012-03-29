Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1SDDpS-0006Z5-1t
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 13:47:46 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1SDDgh-0004EQ-Cu from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 04:38:43 -0700
Received: from pkl-noor-ubuntu.mgc.mentorg.com ([137.202.157.70]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 29 Mar 2012 13:38:41 +0200
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Mar 2012 16:38:28 +0500
Message-Id: <1333021108-27962-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.9
X-OriginalArrivalTime: 29 Mar 2012 11:38:42.0148 (UTC)
	FILETIME=[7DE1A240:01CD0DA0]
Subject: [PATCH] libedit: Remove files folder as no patch was being used
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
X-List-Received-Date: Thu, 29 Mar 2012 11:47:46 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

* No patch file was being used in the recipe so removed the folder to make it bit clean.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 .../libedit/files/20031222-debian-to-gentoo.patch  |  125 --------------------
 .../libedit/files/libedit-add-soname.diff          |   12 --
 2 files changed, 0 insertions(+), 137 deletions(-)

diff --git a/meta-oe/recipes-devtools/libedit/files/20031222-debian-to-gentoo.patch b/meta-oe/recipes-devtools/libedit/files/20031222-debian-to-gentoo.patch
deleted file mode 100644
index 62069d5..0000000
--- a/meta-oe/recipes-devtools/libedit/files/20031222-debian-to-gentoo.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-This patch is from openembedded 4e75705872fd9f289bbf4c74a912ca4710f50b93. 
-
-Upstream-Status: Inappropriate [not author]
-diff -ur netbsd-cvs/Makefile libedit-20031222/Makefile
---- netbsd-cvs/Makefile	2003-12-22 13:44:24.798012752 -0500
-+++ libedit-20031222/Makefile	2003-12-22 14:55:15.133863488 -0500
-@@ -5,6 +5,7 @@
- 
- WARNS=	3
- LIB=	edit
-+LIBS=-lncurses
- 
- OSRCS=	chared.c common.c el.c emacs.c fcns.c help.c hist.c key.c map.c \
- 	parse.c prompt.c read.c refresh.c search.c sig.c term.c tty.c vi.c
-@@ -22,9 +23,10 @@
- 	editline.3 tok_line.3 editline.3 tok_str.3
- 
- # For speed and debugging
--#SRCS=   ${OSRCS} tokenizer.c history.c readline.c
-+SRCS=   ${OSRCS} tokenizer.c history.c readline.c vis.c unvis.c fgetln.c strlcat.c strlcpy.c
- # For protection
--SRCS=	editline.c tokenizer.c history.c readline.c
-+#SRCS=	editline.c tokenizer.c history.c readline.c
-+OOBJS= $(patsubst %.c,%.o,$(SRCS))
- 
- LIBEDITDIR?=${.CURDIR}
- 
-@@ -38,6 +40,7 @@
- CPPFLAGS+=-I. -I${.CURDIR}
- CPPFLAGS+=#-DDEBUG_TTY -DDEBUG_KEY -DDEBUG_READ -DDEBUG -DDEBUG_REFRESH
- CPPFLAGS+=#-DDEBUG_PASTE -DDEBUG_EDIT
-+CFLAGS+=-I. -include ../glibc-bsd-glue/bsdcompat.h -I../glibc-compat -I../glibc-bsd-glue
- 
- AHDR=vi.h emacs.h common.h 
- ASRC=${LIBEDITDIR}/vi.c ${LIBEDITDIR}/emacs.c ${LIBEDITDIR}/common.c
-@@ -46,46 +49,56 @@
- CLEANFILES+=	${AHDR} fcns.h help.h fcns.c help.c
- 
- SUBDIR=	readline
-+HOST_SH=sh
-+LIBEDITDIR=.
-+all: .depend libedit.a libedit.so
- 
- vi.h: vi.c makelist
- 	${HOST_SH} ${LIBEDITDIR}/makelist -h ${LIBEDITDIR}/vi.c \
--	    > ${.TARGET}.tmp && \
--	    mv ${.TARGET}.tmp ${.TARGET}
-+	    > $@.tmp && \
-+	    mv $@.tmp $@
- 
- emacs.h: emacs.c makelist
- 	${HOST_SH} ${LIBEDITDIR}/makelist -h ${LIBEDITDIR}/emacs.c \
--	    > ${.TARGET}.tmp && \
--	    mv ${.TARGET}.tmp ${.TARGET}
-+	    > $@.tmp && \
-+	    mv $@.tmp $@
- 
- common.h: common.c makelist
- 	${HOST_SH} ${LIBEDITDIR}/makelist -h ${LIBEDITDIR}/common.c \
--	    > ${.TARGET}.tmp && \
--	    mv ${.TARGET}.tmp ${.TARGET}
-+	    > $@.tmp && \
-+	    mv $@.tmp $@
- 
- fcns.h: ${AHDR} makelist
--	${HOST_SH} ${LIBEDITDIR}/makelist -fh ${AHDR} > ${.TARGET}.tmp && \
--	    mv ${.TARGET}.tmp ${.TARGET}
-+	${HOST_SH} ${LIBEDITDIR}/makelist -fh ${AHDR} > $@.tmp && \
-+	    mv $@.tmp $@
- 
- fcns.c: ${AHDR} fcns.h help.h makelist
--	${HOST_SH} ${LIBEDITDIR}/makelist -fc ${AHDR} > ${.TARGET}.tmp && \
--	    mv ${.TARGET}.tmp ${.TARGET}
-+	${HOST_SH} ${LIBEDITDIR}/makelist -fc ${AHDR} > $@.tmp && \
-+	    mv $@.tmp $@
- 
- help.c: ${ASRC} makelist 
--	${HOST_SH} ${LIBEDITDIR}/makelist -bc ${ASRC} > ${.TARGET}.tmp && \
--	    mv ${.TARGET}.tmp ${.TARGET}
-+	${HOST_SH} ${LIBEDITDIR}/makelist -bc ${ASRC} > $@.tmp && \
-+	    mv $@.tmp $@
- 
- help.h: ${ASRC} makelist
--	${HOST_SH} ${LIBEDITDIR}/makelist -bh ${ASRC} > ${.TARGET}.tmp && \
--	    mv ${.TARGET}.tmp ${.TARGET}
-+	${HOST_SH} ${LIBEDITDIR}/makelist -bh ${ASRC} > $@.tmp && \
-+	    mv $@.tmp $@
- 
- editline.c: ${OSRCS}
--	${HOST_SH} ${LIBEDITDIR}/makelist -e ${.ALLSRC:T} > ${.TARGET}.tmp && \
--	    mv ${.TARGET}.tmp ${.TARGET}
-+	${HOST_SH} ${LIBEDITDIR}/makelist -e ${.ALLSRC:T} > $@.tmp && \
-+	    mv $@.tmp $@
- 
- test.o:	${LIBEDITDIR}/TEST/test.c
- 	
- test:	libedit.a test.o 
--	${CC} ${LDFLAGS} ${.ALLSRC} -o ${.TARGET} libedit.a ${LDADD} -ltermcap
-+	${CC} ${LDFLAGS} ${.ALLSRC} -o $@ libedit.a ${LDADD} -ltermcap
- 
--.include <bsd.lib.mk>
--.include <bsd.subdir.mk>
-+.depend: vi.h emacs.h common.h fcns.h help.h help.c
-+	-mkdir .a .so
-+.c.o:
-+	${CC} ${CFLAGS} -c $< -o .a/$*
-+	${CC} ${CFLAGS} -fPIC -c $< -o .so/$*
-+libedit.a: ${OOBJS}
-+	ar -r $@ .a/*
-+libedit.so: ${OOBJS}
-+	${CC} --shared -o $@ .so/* ${LIBS}
-diff -ur netbsd-cvs/el.c libedit-20031222/el.c
---- netbsd-cvs/el.c	2003-12-22 13:44:25.474909848 -0500
-+++ libedit-20031222/el.c	2003-12-22 15:00:15.545194024 -0500
-@@ -439,8 +439,10 @@
- 		static const char elpath[] = "/.editrc";
- 		char path[MAXPATHLEN];
- 
-+#if 0
- 		if (issetugid())
- 			return (-1);
-+#endif
- 		if ((ptr = getenv("HOME")) == NULL)
- 			return (-1);
- 		if (strlcpy(path, ptr, sizeof(path)) >= sizeof(path))
diff --git a/meta-oe/recipes-devtools/libedit/files/libedit-add-soname.diff b/meta-oe/recipes-devtools/libedit/files/libedit-add-soname.diff
deleted file mode 100644
index 6b0434c..0000000
--- a/meta-oe/recipes-devtools/libedit/files/libedit-add-soname.diff
+++ /dev/null
@@ -1,12 +0,0 @@
-Add sonmae option in compiler switches. This patch is from openembedded 4e75705872fd9f289bbf4c74a912ca4710f50b93
-
-Upstream-Status: Inappropriate [not author]
-
---- Makefile.orig	2005-04-20 18:12:45.000000000 +0200
-+++ Makefile	2005-04-20 18:14:37.000000000 +0200
-@@ -101,4 +101,4 @@
- libedit.a: ${OOBJS}
- 	ar -r $@ .a/*
- libedit.so: ${OOBJS}
--	${CC} --shared -o $@ .so/* ${LIBS}
-+	${CC} --shared -Wl,-soname=libedit.so.0 -o $@ .so/* ${LIBS}
-- 
1.7.9



