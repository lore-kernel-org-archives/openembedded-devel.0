Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1Lokkd-0001Gu-Ml
	for openembedded-devel@lists.linuxtogo.org;
	Tue, 31 Mar 2009 22:40:03 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id 67F71189479; Tue, 31 Mar 2009 22:40:12 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.linuxtogo.org
Date: Tue, 31 Mar 2009 22:40:12 +0200
Message-Id: <1238532012-2988-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] libgsm: update to version 1.0.12
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
X-List-Received-Date: Tue, 31 Mar 2009 20:40:04 -0000

From: woglinde <heinold@inf.fu-berlin.de>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 conf/checksums.ini                                 |    4 +
 recipes/libgsm/libgsm-1.0.12/01_makefile.patch     |   71 +++++++++
 recipes/libgsm/libgsm-1.0.12/02_cplusplus.patch    |   25 +++
 recipes/libgsm/libgsm-1.0.12/03_config.patch       |  154 ++++++++++++++++++++
 recipes/libgsm/libgsm-1.0.12/04_includes.patch     |   43 ++++++
 .../libgsm-1.0.12/05_compiler_warnings.patch       |   98 +++++++++++++
 recipes/libgsm/libgsm_1.0.12.bb                    |   45 ++++++
 7 files changed, 440 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libgsm/libgsm-1.0.12/01_makefile.patch
 create mode 100644 recipes/libgsm/libgsm-1.0.12/02_cplusplus.patch
 create mode 100644 recipes/libgsm/libgsm-1.0.12/03_config.patch
 create mode 100644 recipes/libgsm/libgsm-1.0.12/04_includes.patch
 create mode 100644 recipes/libgsm/libgsm-1.0.12/05_compiler_warnings.patch
 create mode 100644 recipes/libgsm/libgsm_1.0.12.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index cad12a0..6ce967d 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -9186,6 +9186,10 @@ sha256=850b4512fa5e4bbb964c67c215fe8ce64fe6f7e6b704180a783d8c2a04169ccb
 md5=4b148480f82e96d274248e13880ec873
 sha256=ddab700db455e13bcf9bc0592b320e61c6a7c692fb3cef7881b14b2df1a39069
 
+[http://user.cs.tu-berlin.de/~jutta/gsm/gsm-1.0.12.tar.gz]
+md5=8909828c601e82e842e6a0ceade60a4e
+sha256=dde4e62e4ce35af29a15d26beca2fc0f98c0219553927453425cda01f16e4de4
+
 [http://pyneo.org/downloads/gsm0710muxd-1.7.tgz]
 md5=b4756f5e521dd2df552862c9766faf11
 sha256=5149991a219e8f2059350ed9d52bb110c0695da6eb9fe256e9e213e69f83929f
diff --git a/recipes/libgsm/libgsm-1.0.12/01_makefile.patch b/recipes/libgsm/libgsm-1.0.12/01_makefile.patch
new file mode 100644
index 0000000..947db37
--- /dev/null
+++ b/recipes/libgsm/libgsm-1.0.12/01_makefile.patch
@@ -0,0 +1,71 @@
+diff -urNad libgsm-1.0.12~/Makefile libgsm-1.0.12/Makefile
+--- libgsm-1.0.12~/Makefile	2007-11-01 15:37:52.000000000 +0100
++++ libgsm-1.0.12/Makefile	2007-11-01 15:43:06.000000000 +0100
+@@ -96,7 +96,7 @@
+ #  Other tools
+ 
+ SHELL		= /bin/sh
+-LN		= ln
++LN		= ln -s
+ BASENAME 	= basename
+ AR		= ar
+ ARFLAGS		= cr
+@@ -140,6 +140,7 @@
+ # Targets
+ 
+ LIBGSM	= $(LIB)/libgsm.a
++LIBGSMSO= $(LIB)/libgsm.so
+ 
+ TOAST	= $(BIN)/toast
+ UNTOAST	= $(BIN)/untoast
+@@ -279,7 +280,7 @@
+ 
+ # Target rules
+ 
+-all:		$(LIBGSM) $(TOAST) $(TCAT) $(UNTOAST)
++all:		$(LIBGSM) $(LIBGSMSO) $(TOAST) $(TCAT) $(UNTOAST)
+ 		@-echo $(ROOT): Done.
+ 
+ tst:		$(TST)/lin2cod $(TST)/cod2lin $(TOAST) $(TST)/test-result
+@@ -299,6 +300,11 @@
+ 
+ # The basic API: libgsm
+ 
++$(LIBGSMSO):	$(LIB) $(GSM_OBJECTS)
++		$(LD) -o $@.1.0.12 -shared -Xlinker -soname -Xlinker libgsm.so.1 $(GSM_OBJECTS) -lc $(LDFLAGS)
++		ln -fs libgsm.so.1.0.12 lib/libgsm.so.1
++		ln -fs libgsm.so.1.0.12 lib/libgsm.so
++
+ $(LIBGSM):	$(LIB) $(GSM_OBJECTS)
+ 		-rm $(RMFLAGS) $(LIBGSM)
+ 		$(AR) $(ARFLAGS) $(LIBGSM) $(GSM_OBJECTS)
+@@ -308,15 +314,15 @@
+ # Toast, Untoast and Tcat -- the compress-like frontends to gsm.
+ 
+ $(TOAST):	$(BIN) $(TOAST_OBJECTS) $(LIBGSM)
+-		$(LD) $(LFLAGS) -o $(TOAST) $(TOAST_OBJECTS) $(LIBGSM) $(LDLIB)
++		$(LD) $(LFLAGS) -o $(TOAST) $(TOAST_OBJECTS) $(LIBGSMSO) $(LDLIB)
+ 
+ $(UNTOAST):	$(BIN) $(TOAST)
+ 		-rm $(RMFLAGS) $(UNTOAST)
+-		$(LN) $(TOAST) $(UNTOAST)
++		$(LN) toast $(UNTOAST)
+ 
+ $(TCAT):	$(BIN) $(TOAST)
+ 		-rm $(RMFLAGS) $(TCAT)
+-		$(LN) $(TOAST) $(TCAT)
++		$(LN) toast $(TCAT)
+ 
+ 
+ # The local bin and lib directories
+@@ -426,7 +432,9 @@
+ 
+ clean:	semi-clean
+ 		-rm $(RMFLAGS) $(LIBGSM) $(ADDTST)/add		\
+-			$(TOAST) $(TCAT) $(UNTOAST)	\
++			$(LIBGSMSO) $(LIB)/libgsm.so.1.0.12	\
++			$(LIB)libgsm.so.1			\
++			$(TOAST) $(TCAT) $(UNTOAST)		\
+ 			$(ROOT)/gsm-1.0.tar.Z
+ 
+ 
diff --git a/recipes/libgsm/libgsm-1.0.12/02_cplusplus.patch b/recipes/libgsm/libgsm-1.0.12/02_cplusplus.patch
new file mode 100644
index 0000000..a4bbb40
--- /dev/null
+++ b/recipes/libgsm/libgsm-1.0.12/02_cplusplus.patch
@@ -0,0 +1,25 @@
+diff -urNad libgsm-1.0.10~/inc/gsm.h libgsm-1.0.10/inc/gsm.h
+--- libgsm-1.0.10~/inc/gsm.h	2007-11-01 15:37:52.000000000 +0100
++++ libgsm-1.0.10/inc/gsm.h	2007-11-01 15:44:52.000000000 +0100
+@@ -54,6 +54,10 @@
+ #define	GSM_OPT_FRAME_INDEX	5
+ #define	GSM_OPT_FRAME_CHAIN	6
+ 
++#ifdef __cplusplus
++extern "C" {
++#endif
++
+ extern gsm  gsm_create 	GSM_P((void));
+ extern void gsm_destroy GSM_P((gsm));	
+ 
+@@ -66,6 +70,10 @@
+ extern int  gsm_explode GSM_P((gsm, gsm_byte   *, gsm_signal *));
+ extern void gsm_implode GSM_P((gsm, gsm_signal *, gsm_byte   *));
+ 
++#ifdef __cplusplus
++}
++#endif
++
+ #undef	GSM_P
+ 
+ #endif	/* GSM_H */
diff --git a/recipes/libgsm/libgsm-1.0.12/03_config.patch b/recipes/libgsm/libgsm-1.0.12/03_config.patch
new file mode 100644
index 0000000..dad241e
--- /dev/null
+++ b/recipes/libgsm/libgsm-1.0.12/03_config.patch
@@ -0,0 +1,154 @@
+diff -urNad libgsm-1.0.10~/Makefile libgsm-1.0.10/Makefile
+--- libgsm-1.0.10~/Makefile	2007-11-01 15:37:52.000000000 +0100
++++ libgsm-1.0.10/Makefile	2007-11-01 15:48:02.000000000 +0100
+@@ -151,7 +151,7 @@
+ 
+ HEADERS	=	$(INC)/proto.h		\
+ 		$(INC)/unproto.h	\
+-		$(INC)/config.h		\
++		$(INC)/gsm_config.h	\
+ 		$(INC)/private.h	\
+ 		$(INC)/gsm.h		\
+ 		$(INC)/toast.h		\
+diff -urNad libgsm-1.0.10~/inc/config.h libgsm-1.0.10/inc/config.h
+--- libgsm-1.0.10~/inc/config.h	2007-11-01 15:37:52.000000000 +0100
++++ libgsm-1.0.10/inc/config.h	1970-01-01 01:00:00.000000000 +0100
+@@ -1,37 +0,0 @@
+-/*
+- * Copyright 1992 by Jutta Degener and Carsten Bormann, Technische
+- * Universitaet Berlin.  See the accompanying file "COPYRIGHT" for
+- * details.  THERE IS ABSOLUTELY NO WARRANTY FOR THIS SOFTWARE.
+- */
+-
+-/*$Header: /tmp_amd/presto/export/kbs/jutta/src/gsm/RCS/config.h,v 1.5 1996/07/02 11:26:20 jutta Exp $*/
+-
+-#ifndef	CONFIG_H
+-#define	CONFIG_H
+-
+-/*efine	SIGHANDLER_T	int 		/* signal handlers are void	*/
+-/*efine HAS_SYSV_SIGNAL	1		/* sigs not blocked/reset?	*/
+-
+-#define	HAS_STDLIB_H	1		/* /usr/include/stdlib.h	*/
+-#define	HAS_LIMITS_H	1		/* /usr/include/limits.h	*/
+-#define	HAS_FCNTL_H	1		/* /usr/include/fcntl.h		*/
+-#define	HAS_ERRNO_DECL	1		/* errno.h declares errno	*/
+-
+-#define	HAS_FSTAT 	1		/* fstat syscall		*/
+-#define	HAS_FCHMOD 	1		/* fchmod syscall		*/
+-#define	HAS_CHMOD 	1		/* chmod syscall		*/
+-#define	HAS_FCHOWN 	1		/* fchown syscall		*/
+-#define	HAS_CHOWN 	1		/* chown syscall		*/
+-/*efine	HAS__FSETMODE 	1		/* _fsetmode -- set file mode	*/
+-
+-#define	HAS_STRING_H 	1		/* /usr/include/string.h 	*/
+-/*efine	HAS_STRINGS_H	1		/* /usr/include/strings.h 	*/
+-
+-#define	HAS_UNISTD_H	1		/* /usr/include/unistd.h	*/
+-#define	HAS_UTIME	1		/* POSIX utime(path, times)	*/
+-/*efine	HAS_UTIMES	1		/* use utimes()	syscall instead	*/
+-#define	HAS_UTIME_H	1		/* UTIME header file		*/
+-#define	HAS_UTIMBUF	1		/* struct utimbuf		*/
+-/*efine	HAS_UTIMEUSEC   1		/* microseconds in utimbuf?	*/
+-
+-#endif	/* CONFIG_H */
+diff -urNad libgsm-1.0.10~/inc/gsm_config.h libgsm-1.0.10/inc/gsm_config.h
+--- libgsm-1.0.10~/inc/gsm_config.h	1970-01-01 01:00:00.000000000 +0100
++++ libgsm-1.0.10/inc/gsm_config.h	2007-11-01 15:46:19.000000000 +0100
+@@ -0,0 +1,37 @@
++/*
++ * Copyright 1992 by Jutta Degener and Carsten Bormann, Technische
++ * Universitaet Berlin.  See the accompanying file "COPYRIGHT" for
++ * details.  THERE IS ABSOLUTELY NO WARRANTY FOR THIS SOFTWARE.
++ */
++
++/*$Header: /tmp_amd/presto/export/kbs/jutta/src/gsm/RCS/config.h,v 1.5 1996/07/02 11:26:20 jutta Exp $*/
++
++#ifndef	CONFIG_H
++#define	CONFIG_H
++
++/*efine	SIGHANDLER_T	int 		-* signal handlers are void	*/
++/*efine HAS_SYSV_SIGNAL	1		-* sigs not blocked/reset?	*/
++
++#define	HAS_STDLIB_H	1		/* /usr/include/stdlib.h	*/
++#define	HAS_STDIO_H 	1		/* /usr/include/stdio.h 	*/
++/*efine	HAS_LIMITS_H	1		-* /usr/include/limits.h	*/
++#define	HAS_FCNTL_H	1		/* /usr/include/fcntl.h		*/
++
++#define	HAS_FSTAT 	1		/* fstat syscall		*/
++#define	HAS_FCHMOD 	1		/* fchmod syscall		*/
++#define	HAS_CHMOD 	1		/* chmod syscall		*/
++#define	HAS_FCHOWN 	1		/* fchown syscall		*/
++#define	HAS_CHOWN 	1		/* chown syscall		*/
++/*efine	HAS__FSETMODE 	1		-* _fsetmode -- set file mode	*/
++
++#define	HAS_STRING_H 	1		/* /usr/include/string.h 	*/
++/*efine	HAS_STRINGS_H	1		-* /usr/include/strings.h 	*/
++
++#define	HAS_UNISTD_H	1		/* /usr/include/unistd.h	*/
++#define	HAS_UTIME	1		/* POSIX utime(path, times)	*/
++/*efine	HAS_UTIMES	1		-* use utimes()	syscall instead	*/
++#define	HAS_UTIME_H	1		/* UTIME header file		*/
++/*efine	HAS_UTIMBUF	1		-* struct utimbuf		*/
++/*efine	HAS_UTIMEUSEC   1		-* microseconds in utimbuf?	*/
++
++#endif	/* CONFIG_H */
+diff -urNad libgsm-1.0.10~/inc/toast.h libgsm-1.0.10/inc/toast.h
+--- libgsm-1.0.10~/inc/toast.h	2007-11-01 15:37:52.000000000 +0100
++++ libgsm-1.0.10/inc/toast.h	2007-11-01 15:48:17.000000000 +0100
+@@ -9,7 +9,7 @@
+ #ifndef	TOAST_H
+ #define	TOAST_H				/* Guard against multiple includes */
+ 
+-#include "config.h"
++#include "gsm_config.h"
+ 
+ #include <sys/types.h>
+ #include <sys/stat.h>
+diff -urNad libgsm-1.0.10~/src/code.c libgsm-1.0.10/src/code.c
+--- libgsm-1.0.10~/src/code.c	2007-11-01 15:37:52.000000000 +0100
++++ libgsm-1.0.10/src/code.c	2007-11-01 15:48:34.000000000 +0100
+@@ -6,7 +6,7 @@
+ 
+ /* $Header: /tmp_amd/presto/export/kbs/jutta/src/gsm/RCS/code.c,v 1.3 1996/07/02 09:59:05 jutta Exp $ */
+ 
+-#include	"config.h"
++#include	"gsm_config.h"
+ 
+ 
+ #ifdef	HAS_STDLIB_H
+diff -urNad libgsm-1.0.10~/src/gsm_create.c libgsm-1.0.10/src/gsm_create.c
+--- libgsm-1.0.10~/src/gsm_create.c	1996-07-02 16:32:44.000000000 +0200
++++ libgsm-1.0.10/src/gsm_create.c	2007-11-01 15:48:48.000000000 +0100
+@@ -6,7 +6,7 @@
+ 
+ static char const	ident[] = "$Header: /tmp_amd/presto/export/kbs/jutta/src/gsm/RCS/gsm_create.c,v 1.4 1996/07/02 09:59:05 jutta Exp $";
+ 
+-#include	"config.h"
++#include	"gsm_config.h"
+ 
+ #ifdef	HAS_STRING_H
+ #include	<string.h>
+diff -urNad libgsm-1.0.10~/src/gsm_destroy.c libgsm-1.0.10/src/gsm_destroy.c
+--- libgsm-1.0.10~/src/gsm_destroy.c	1996-07-02 16:32:39.000000000 +0200
++++ libgsm-1.0.10/src/gsm_destroy.c	2007-11-01 15:48:57.000000000 +0100
+@@ -7,7 +7,7 @@
+ /* $Header: /tmp_amd/presto/export/kbs/jutta/src/gsm/RCS/gsm_destroy.c,v 1.3 1994/11/28 19:52:25 jutta Exp $ */
+ 
+ #include "gsm.h"
+-#include "config.h"
++#include "gsm_config.h"
+ #include "proto.h"
+ 
+ #ifdef	HAS_STDLIB_H
+diff -urNad libgsm-1.0.10~/tls/taste.c libgsm-1.0.10/tls/taste.c
+--- libgsm-1.0.10~/tls/taste.c	1996-07-02 16:33:05.000000000 +0200
++++ libgsm-1.0.10/tls/taste.c	2007-11-01 15:49:54.000000000 +0100
+@@ -10,7 +10,7 @@
+ #include	<string.h>
+ #include	<memory.h>
+ 
+-#include	"config.h"
++#include	"gsm_config.h"
+ 
+ #ifdef	HAS_STDLIB_H
+ #	include	<stdlib.h>
diff --git a/recipes/libgsm/libgsm-1.0.12/04_includes.patch b/recipes/libgsm/libgsm-1.0.12/04_includes.patch
new file mode 100644
index 0000000..2769b40
--- /dev/null
+++ b/recipes/libgsm/libgsm-1.0.12/04_includes.patch
@@ -0,0 +1,43 @@
+diff -urNad libgsm-1.0.10~/inc/toast.h libgsm-1.0.10/inc/toast.h
+--- libgsm-1.0.10~/inc/toast.h	2007-11-01 15:37:52.000000000 +0100
++++ libgsm-1.0.10/inc/toast.h	2007-11-01 15:52:33.000000000 +0100
+@@ -16,11 +16,12 @@
+ 
+ #include <stdio.h>
+ #include <ctype.h>
++#include <pthread.h>
+ #include <signal.h>
+ 
+ #include <errno.h>
+-#ifndef	HAS_ERRNO_DECL
+-	 extern int	errno;
++#ifndef errno
++ extern int	errno;
+ #endif
+ 
+ #ifdef	HAS_LIMITS_H
+@@ -37,6 +38,10 @@
+ # endif
+ #endif
+ 
++#ifdef  HAS_STDIO_H
++# include <stdio.h>
++#endif
++
+ #include "gsm.h"
+ 
+ #ifndef	S_ISREG
+diff -urNad libgsm-1.0.10~/src/code.c libgsm-1.0.10/src/code.c
+--- libgsm-1.0.10~/src/code.c	2007-11-01 15:37:52.000000000 +0100
++++ libgsm-1.0.10/src/code.c	2007-11-01 15:52:33.000000000 +0100
+@@ -9,8 +9,8 @@
+ #include	"config.h"
+ 
+ 
+-#ifdef	HAS_STDLIB_H
+-#include	<stdlib.h>
++#ifdef	HAS_STRING_H
++#include	<string.h>
+ #else
+ #	include "proto.h"
+ 	extern char	* memcpy P((char *, char *, int));
diff --git a/recipes/libgsm/libgsm-1.0.12/05_compiler_warnings.patch b/recipes/libgsm/libgsm-1.0.12/05_compiler_warnings.patch
new file mode 100644
index 0000000..c40100c
--- /dev/null
+++ b/recipes/libgsm/libgsm-1.0.12/05_compiler_warnings.patch
@@ -0,0 +1,98 @@
+diff -urNad libgsm-1.0.10~/src/debug.c libgsm-1.0.10/src/debug.c
+--- libgsm-1.0.10~/src/debug.c	2007-11-01 15:37:52.000000000 +0100
++++ libgsm-1.0.10/src/debug.c	2007-11-01 15:53:42.000000000 +0100
+@@ -49,7 +49,7 @@
+ 	fprintf( stderr, "%s [%d .. %d]: ", name, from, to );
+ 	while (from <= to) {
+ 
+-		fprintf(stderr, "%d ", ptr[ from ] );
++		fprintf(stderr, "%ld ", ptr[ from ] );
+ 		from++;
+ 		if (nprinted++ >= 7) {
+ 			nprinted = 0;
+@@ -63,14 +63,14 @@
+ 	char		* name,
+ 	longword	  value	)
+ {
+-	fprintf(stderr, "%s: %d\n", name, (long)value );
++	fprintf(stderr, "%s: %ld\n", name, (long)value );
+ }
+ 
+ void gsm_debug_word P2(  (name, value),
+ 	char	* name,
+ 	word	  value	)
+ {
+-	fprintf(stderr, "%s: %d\n", name, (long)value);
++	fprintf(stderr, "%s: %ld\n", name, (long)value);
+ }
+ 
+ #endif
+diff -urNad libgsm-1.0.10~/src/toast.c libgsm-1.0.10/src/toast.c
+--- libgsm-1.0.10~/src/toast.c	2007-11-01 15:37:52.000000000 +0100
++++ libgsm-1.0.10/src/toast.c	2007-11-01 15:53:42.000000000 +0100
+@@ -251,8 +251,8 @@
+ {
+ 	char * s;
+ 	if (!(s = malloc(len))) {
+-		fprintf(stderr, "%s: failed to malloc %d bytes -- abort\n",
+-			progname, len);
++		fprintf(stderr, "%s: failed to malloc %ld bytes -- abort\n",
++			progname, (long) len);
+ 		onintr();
+ 		exit(1);
+ 	}
+@@ -270,7 +270,7 @@
+ 	maxlen = strlen(name) + 1 + strlen(want) + strlen(cut);
+ 	p = strcpy(emalloc(maxlen), name);
+ 
+-	if (s = suffix(p, cut)) strcpy(s, want);
++	if ((s = suffix(p, cut))) strcpy(s, want);
+ 	else if (*want && !suffix(p, want)) strcat(p, want);
+ 
+ 	return p;
+@@ -386,7 +386,7 @@
+ 		ut[0] = instat.st_atime;
+ 		ut[1] = instat.st_mtime;
+ 
+-		(void) utime(outname, ut);
++		(void) utime(outname, (struct utimbuf *)ut);
+ 
+ #endif	/* UTIMBUF */
+ 	}
+@@ -416,7 +416,7 @@
+ 	}
+ 	if (st->st_nlink > 1 && !f_cat && !f_precious) {
+ 		fprintf(stderr, 
+-		      "%s: \"%s\" has %s other link%s -- unchanged.\n",
++		      "%s: \"%s\" has %d other link%s -- unchanged.\n",
+ 			progname,name,st->st_nlink - 1,"s" + (st->st_nlink<=2));
+ 		return 0;
+ 	}
+@@ -585,8 +585,8 @@
+ 
+ 		if (cc != sizeof(s)) {
+ 			if (cc >= 0) fprintf(stderr,
+-			"%s: incomplete frame (%d byte%s missing) from %s\n",
+-					progname, sizeof(s) - cc,
++			"%s: incomplete frame (%ld byte%s missing) from %s\n",
++					progname, (long) sizeof(s) - cc,
+ 					"s" + (sizeof(s) - cc == 1),
+ 					inname ? inname : "stdin" );
+ 			gsm_destroy(r);
+@@ -624,8 +624,6 @@
+ 
+ static int process P1((name), char * name)
+ {
+-	int step = 0;
+-
+ 	out     = (FILE *)0;
+ 	in      = (FILE *)0;
+ 
+@@ -779,7 +777,6 @@
+ 	case 'h': help();    exit(0);
+ 
+ 	default: 
+-	usage:
+ 		fprintf(stderr,
+ 	"Usage: %s [-fcpdhvuaslFC] [files...] (-h for help)\n",
+ 			progname);
diff --git a/recipes/libgsm/libgsm_1.0.12.bb b/recipes/libgsm/libgsm_1.0.12.bb
new file mode 100644
index 0000000..9c96f4d
--- /dev/null
+++ b/recipes/libgsm/libgsm_1.0.12.bb
@@ -0,0 +1,45 @@
+DESCRIPTION = "GSM Audio Library"
+SECTION = "libs"
+PRIORITY = "optional"
+#DEPENDS = ""
+LICENSE = "libgsm"
+
+PR = "r0"
+
+SRC_URI = "http://user.cs.tu-berlin.de/~jutta/gsm/gsm-${PV}.tar.gz \
+	   file://01_makefile.patch;patch=1 \
+           file://02_cplusplus.patch;patch=1 \
+           file://03_config.patch;patch=1 \
+           file://04_includes.patch;patch=1 \
+           file://05_compiler_warnings.patch;patch=1 \
+	  "
+
+S = "${WORKDIR}/gsm-1.0-pl12/"
+
+CFLAGS += "-c -g -fPIC -Wall -D_GNU_SOURCE -D_REENTRANT -DNeedFunctionPrototypes=1 -DWAV49 -I./inc"
+
+PARALLEL_MAKE = ""
+
+do_compile() {
+	unset LD
+	oe_runmake CCFLAGS="${CFLAGS}"
+}
+
+do_install() {
+	oe_libinstall -a -C lib libgsm ${D}${libdir}
+        oe_libinstall -so -C lib libgsm ${D}${libdir}
+        install -d ${D}/usr/include/gsm
+        install -m 0644 ${S}/inc/gsm.h ${D}/usr/include/gsm/
+	cd ${D}/usr/include/
+	ln -s gsm/gsm.h gsm.h
+}
+
+do_stage () {
+        oe_libinstall -a -C lib libgsm ${STAGING_LIBDIR}
+	oe_libinstall -so -C lib libgsm ${STAGING_LIBDIR}
+        install -d ${STAGING_INCDIR}/gsm
+        install -m 0644 ${S}/inc/gsm.h ${STAGING_INCDIR}/gsm/
+	rm -f ${STAGING_INCDIR}/gsm.h
+        ln -s ${STAGING_INCDIR}/gsm/gsm.h ${STAGING_INCDIR}/gsm.h
+}
+
-- 
1.5.6.5



