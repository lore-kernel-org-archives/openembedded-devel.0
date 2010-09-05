Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OsB57-0005IC-Fp
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Sep 2010 11:00:14 +0200
Received: by ewy7 with SMTP id 7so1788187ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Sep 2010 01:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=LX7Ep5qPMGQ6ATXzZLQdLoIl7k5FnyymDXoL2ded5nY=;
	b=T4YRDPooeXmnsaryi36sGVWYcWSpi54xkdNP62pSiAPDAmZcqpKUMxoEKVr+Jp2i4m
	lKDOmzOcIjHNwpuU99p5jWOk/3RhDrcJKOY0MHvWGYSntoMAVVmfHFpI8fSpP9rgYTen
	Fi+vLW/sI8ei7rvPenyIoQewquzvotadejZWI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=bjf6jZWKmFzyYWgqaIiLdMVTUgH8JMZE7Ernxs/RV7MJpQAFOQA1IAg7/nPamFk6n/
	MG7GsAblK7YdULfsYUa7PnjojAoH4mMdvlIqu2qMkxQTxb5+HroyYWSmxPsRYtMWcErC
	q2nL8UEa6A3sRUlY0ameaIoNzRkCnpcavyNrw=
Received: by 10.213.31.130 with SMTP id y2mr1159612ebc.47.1283677173451;
	Sun, 05 Sep 2010 01:59:33 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id a48sm5988067eei.7.2010.09.05.01.59.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 05 Sep 2010 01:59:32 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Sep 2010 10:59:21 +0200
Message-Id: <1283677162-7876-2-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1283677162-7876-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1283677162-7876-1-git-send-email-fransmeulenbroeks@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/3] js: renamed files dir to more appropriate name js
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
X-List-Received-Date: Sun, 05 Sep 2010 09:00:14 -0000

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/js/files/arm/jsautocfg.h     |   52 ----------------------------------
 recipes/js/files/host-cc.patch       |   16 ----------
 recipes/js/files/jsautocfg.h         |   52 ----------------------------------
 recipes/js/files/libtermcap.patch    |   13 --------
 recipes/js/files/powerpc/jsautocfg.h |   52 ----------------------------------
 recipes/js/js/arm/jsautocfg.h        |   52 ++++++++++++++++++++++++++++++++++
 recipes/js/js/host-cc.patch          |   16 ++++++++++
 recipes/js/js/jsautocfg.h            |   52 ++++++++++++++++++++++++++++++++++
 recipes/js/js/libtermcap.patch       |   13 ++++++++
 recipes/js/js/powerpc/jsautocfg.h    |   52 ++++++++++++++++++++++++++++++++++
 10 files changed, 185 insertions(+), 185 deletions(-)
 delete mode 100644 recipes/js/files/arm/jsautocfg.h
 delete mode 100644 recipes/js/files/host-cc.patch
 delete mode 100644 recipes/js/files/jsautocfg.h
 delete mode 100644 recipes/js/files/libtermcap.patch
 delete mode 100644 recipes/js/files/powerpc/jsautocfg.h
 create mode 100644 recipes/js/js/arm/jsautocfg.h
 create mode 100644 recipes/js/js/host-cc.patch
 create mode 100644 recipes/js/js/jsautocfg.h
 create mode 100644 recipes/js/js/libtermcap.patch
 create mode 100644 recipes/js/js/powerpc/jsautocfg.h

diff --git a/recipes/js/files/arm/jsautocfg.h b/recipes/js/files/arm/jsautocfg.h
deleted file mode 100644
index 7e8171f..0000000
--- a/recipes/js/files/arm/jsautocfg.h
+++ /dev/null
@@ -1,52 +0,0 @@
-#ifndef js_cpucfg___
-#define js_cpucfg___
-
-/* AUTOMATICALLY GENERATED - DO NOT EDIT */
-
-#define IS_LITTLE_ENDIAN 1
-#undef  IS_BIG_ENDIAN
-
-#define JS_BYTES_PER_BYTE   1L
-#define JS_BYTES_PER_SHORT  2L
-#define JS_BYTES_PER_INT    4L
-#define JS_BYTES_PER_INT64  8L
-#define JS_BYTES_PER_LONG   4L
-#define JS_BYTES_PER_FLOAT  4L
-#define JS_BYTES_PER_DOUBLE 8L
-#define JS_BYTES_PER_WORD   4L
-#define JS_BYTES_PER_DWORD  8L
-
-#define JS_BITS_PER_BYTE    8L
-#define JS_BITS_PER_SHORT   16L
-#define JS_BITS_PER_INT     32L
-#define JS_BITS_PER_INT64   64L
-#define JS_BITS_PER_LONG    32L
-#define JS_BITS_PER_FLOAT   32L
-#define JS_BITS_PER_DOUBLE  64L
-#define JS_BITS_PER_WORD    32L
-
-#define JS_BITS_PER_BYTE_LOG2   3L
-#define JS_BITS_PER_SHORT_LOG2  4L
-#define JS_BITS_PER_INT_LOG2    5L
-#define JS_BITS_PER_INT64_LOG2  6L
-#define JS_BITS_PER_LONG_LOG2   5L
-#define JS_BITS_PER_FLOAT_LOG2  5L
-#define JS_BITS_PER_DOUBLE_LOG2 6L
-#define JS_BITS_PER_WORD_LOG2   5L
-
-#define JS_ALIGN_OF_SHORT   2L
-#define JS_ALIGN_OF_INT     4L
-#define JS_ALIGN_OF_LONG    4L
-#define JS_ALIGN_OF_INT64   8L
-#define JS_ALIGN_OF_FLOAT   4L
-#define JS_ALIGN_OF_DOUBLE  8L
-#define JS_ALIGN_OF_POINTER 4L
-#define JS_ALIGN_OF_WORD    4L
-
-#define JS_BYTES_PER_WORD_LOG2   2L
-#define JS_BYTES_PER_DWORD_LOG2  3L
-#define JS_WORDS_PER_DWORD_LOG2  1L
-
-#define JS_STACK_GROWTH_DIRECTION (-1)
-
-#endif /* js_cpucfg___ */
diff --git a/recipes/js/files/host-cc.patch b/recipes/js/files/host-cc.patch
deleted file mode 100644
index 78a1e1b..0000000
--- a/recipes/js/files/host-cc.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-diff -urNd smjs-1.5-r0/js/src/Makefile.ref smjs-1.5-r0.new/js/src/Makefile.ref
---- smjs-1.5-r0/js/src/Makefile.ref	2003-11-15 00:10:55.000000000 +0000
-+++ smjs-1.5-r0.new/js/src/Makefile.ref	2006-01-31 23:43:16.000000000 +0000
-@@ -317,8 +317,11 @@
- 	rm -f $@
- 	$(OBJDIR)/jscpucfg > $@
- 
-+$(OBJDIR)/jscpucfg.o: jscpucfg.c jscpucfg.h
-+	$(HOST_CC) -o $@ $(CFLAGS) $(LDFLAGS) jscpucfg.c
-+
- $(OBJDIR)/jscpucfg: $(OBJDIR)/jscpucfg.o
--	$(CC) -o $@ $(OBJDIR)/jscpucfg.o
-+	$(HOST_CC) -o $@ $(OBJDIR)/jscpucfg.o
- 
- # Look in OBJDIR to find jsautocfg.h
- INCLUDES   += -I$(OBJDIR)
diff --git a/recipes/js/files/jsautocfg.h b/recipes/js/files/jsautocfg.h
deleted file mode 100644
index ac786dc..0000000
--- a/recipes/js/files/jsautocfg.h
+++ /dev/null
@@ -1,52 +0,0 @@
-#ifndef js_cpucfg___
-#define js_cpucfg___
-
-/* AUTOMATICALLY GENERATED - DO NOT EDIT */
-
-#define IS_LITTLE_ENDIAN 1
-#undef  IS_BIG_ENDIAN
-
-#define JS_BYTES_PER_BYTE   1L
-#define JS_BYTES_PER_SHORT  2L
-#define JS_BYTES_PER_INT    4L
-#define JS_BYTES_PER_INT64  8L
-#define JS_BYTES_PER_LONG   8L
-#define JS_BYTES_PER_FLOAT  4L
-#define JS_BYTES_PER_DOUBLE 8L
-#define JS_BYTES_PER_WORD   4L
-#define JS_BYTES_PER_DWORD  8L
-
-#define JS_BITS_PER_BYTE    8L
-#define JS_BITS_PER_SHORT   16L
-#define JS_BITS_PER_INT     32L
-#define JS_BITS_PER_INT64   64L
-#define JS_BITS_PER_LONG    64L
-#define JS_BITS_PER_FLOAT   32L
-#define JS_BITS_PER_DOUBLE  64L
-#define JS_BITS_PER_WORD    32L
-
-#define JS_BITS_PER_BYTE_LOG2   3L
-#define JS_BITS_PER_SHORT_LOG2  4L
-#define JS_BITS_PER_INT_LOG2    5L
-#define JS_BITS_PER_INT64_LOG2  6L
-#define JS_BITS_PER_LONG_LOG2   6L
-#define JS_BITS_PER_FLOAT_LOG2  5L
-#define JS_BITS_PER_DOUBLE_LOG2 6L
-#define JS_BITS_PER_WORD_LOG2   3L
-
-#define JS_ALIGN_OF_SHORT   2L
-#define JS_ALIGN_OF_INT     4L
-#define JS_ALIGN_OF_LONG    8L
-#define JS_ALIGN_OF_INT64   8L
-#define JS_ALIGN_OF_FLOAT   4L
-#define JS_ALIGN_OF_DOUBLE  8L
-#define JS_ALIGN_OF_POINTER 8L
-#define JS_ALIGN_OF_WORD    4L
-
-#define JS_BYTES_PER_WORD_LOG2   2L
-#define JS_BYTES_PER_DWORD_LOG2  3L
-#define JS_WORDS_PER_DWORD_LOG2  0L
-
-#define JS_STACK_GROWTH_DIRECTION (-1)
-
-#endif /* js_cpucfg___ */
diff --git a/recipes/js/files/libtermcap.patch b/recipes/js/files/libtermcap.patch
deleted file mode 100644
index 045b4fb..0000000
--- a/recipes/js/files/libtermcap.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: src/Makefile.ref
-===================================================================
---- src.orig/Makefile.ref
-+++ src/Makefile.ref
-@@ -127,7 +127,7 @@ endif
- ifdef JS_READLINE
- # For those platforms with the readline library installed.
- DEFINES += -DEDITLINE
--PROG_LIBS += -lreadline -ltermcap
-+PROG_LIBS += -lreadline -lncurses
- else
- ifdef JS_EDITLINE
- # Use the editline library, built locally.
diff --git a/recipes/js/files/powerpc/jsautocfg.h b/recipes/js/files/powerpc/jsautocfg.h
deleted file mode 100644
index 93d0374..0000000
--- a/recipes/js/files/powerpc/jsautocfg.h
+++ /dev/null
@@ -1,52 +0,0 @@
-#ifndef js_cpucfg___
-#define js_cpucfg___
-
-/* AUTOMATICALLY GENERATED - DO NOT EDIT */
-
-#undef  IS_LITTLE_ENDIAN
-#define IS_BIG_ENDIAN 1
-
-#define JS_BYTES_PER_BYTE   1L
-#define JS_BYTES_PER_SHORT  2L
-#define JS_BYTES_PER_INT    4L
-#define JS_BYTES_PER_INT64  8L
-#define JS_BYTES_PER_LONG   4L
-#define JS_BYTES_PER_FLOAT  4L
-#define JS_BYTES_PER_DOUBLE 8L
-#define JS_BYTES_PER_WORD   4L
-#define JS_BYTES_PER_DWORD  8L
-
-#define JS_BITS_PER_BYTE    8L
-#define JS_BITS_PER_SHORT   16L
-#define JS_BITS_PER_INT     32L
-#define JS_BITS_PER_INT64   64L
-#define JS_BITS_PER_LONG    32L
-#define JS_BITS_PER_FLOAT   32L
-#define JS_BITS_PER_DOUBLE  64L
-#define JS_BITS_PER_WORD    32L
-
-#define JS_BITS_PER_BYTE_LOG2   3L
-#define JS_BITS_PER_SHORT_LOG2  4L
-#define JS_BITS_PER_INT_LOG2    5L
-#define JS_BITS_PER_INT64_LOG2  6L
-#define JS_BITS_PER_LONG_LOG2   5L
-#define JS_BITS_PER_FLOAT_LOG2  5L
-#define JS_BITS_PER_DOUBLE_LOG2 6L
-#define JS_BITS_PER_WORD_LOG2   5L
-
-#define JS_ALIGN_OF_SHORT   2L
-#define JS_ALIGN_OF_INT     4L
-#define JS_ALIGN_OF_LONG    4L
-#define JS_ALIGN_OF_INT64   8L
-#define JS_ALIGN_OF_FLOAT   4L
-#define JS_ALIGN_OF_DOUBLE  8L
-#define JS_ALIGN_OF_POINTER 4L
-#define JS_ALIGN_OF_WORD    4L
-
-#define JS_BYTES_PER_WORD_LOG2   2L
-#define JS_BYTES_PER_DWORD_LOG2  3L
-#define JS_WORDS_PER_DWORD_LOG2  1L
-
-#define JS_STACK_GROWTH_DIRECTION (-1)
-
-#endif /* js_cpucfg___ */
diff --git a/recipes/js/js/arm/jsautocfg.h b/recipes/js/js/arm/jsautocfg.h
new file mode 100644
index 0000000..7e8171f
--- /dev/null
+++ b/recipes/js/js/arm/jsautocfg.h
@@ -0,0 +1,52 @@
+#ifndef js_cpucfg___
+#define js_cpucfg___
+
+/* AUTOMATICALLY GENERATED - DO NOT EDIT */
+
+#define IS_LITTLE_ENDIAN 1
+#undef  IS_BIG_ENDIAN
+
+#define JS_BYTES_PER_BYTE   1L
+#define JS_BYTES_PER_SHORT  2L
+#define JS_BYTES_PER_INT    4L
+#define JS_BYTES_PER_INT64  8L
+#define JS_BYTES_PER_LONG   4L
+#define JS_BYTES_PER_FLOAT  4L
+#define JS_BYTES_PER_DOUBLE 8L
+#define JS_BYTES_PER_WORD   4L
+#define JS_BYTES_PER_DWORD  8L
+
+#define JS_BITS_PER_BYTE    8L
+#define JS_BITS_PER_SHORT   16L
+#define JS_BITS_PER_INT     32L
+#define JS_BITS_PER_INT64   64L
+#define JS_BITS_PER_LONG    32L
+#define JS_BITS_PER_FLOAT   32L
+#define JS_BITS_PER_DOUBLE  64L
+#define JS_BITS_PER_WORD    32L
+
+#define JS_BITS_PER_BYTE_LOG2   3L
+#define JS_BITS_PER_SHORT_LOG2  4L
+#define JS_BITS_PER_INT_LOG2    5L
+#define JS_BITS_PER_INT64_LOG2  6L
+#define JS_BITS_PER_LONG_LOG2   5L
+#define JS_BITS_PER_FLOAT_LOG2  5L
+#define JS_BITS_PER_DOUBLE_LOG2 6L
+#define JS_BITS_PER_WORD_LOG2   5L
+
+#define JS_ALIGN_OF_SHORT   2L
+#define JS_ALIGN_OF_INT     4L
+#define JS_ALIGN_OF_LONG    4L
+#define JS_ALIGN_OF_INT64   8L
+#define JS_ALIGN_OF_FLOAT   4L
+#define JS_ALIGN_OF_DOUBLE  8L
+#define JS_ALIGN_OF_POINTER 4L
+#define JS_ALIGN_OF_WORD    4L
+
+#define JS_BYTES_PER_WORD_LOG2   2L
+#define JS_BYTES_PER_DWORD_LOG2  3L
+#define JS_WORDS_PER_DWORD_LOG2  1L
+
+#define JS_STACK_GROWTH_DIRECTION (-1)
+
+#endif /* js_cpucfg___ */
diff --git a/recipes/js/js/host-cc.patch b/recipes/js/js/host-cc.patch
new file mode 100644
index 0000000..78a1e1b
--- /dev/null
+++ b/recipes/js/js/host-cc.patch
@@ -0,0 +1,16 @@
+diff -urNd smjs-1.5-r0/js/src/Makefile.ref smjs-1.5-r0.new/js/src/Makefile.ref
+--- smjs-1.5-r0/js/src/Makefile.ref	2003-11-15 00:10:55.000000000 +0000
++++ smjs-1.5-r0.new/js/src/Makefile.ref	2006-01-31 23:43:16.000000000 +0000
+@@ -317,8 +317,11 @@
+ 	rm -f $@
+ 	$(OBJDIR)/jscpucfg > $@
+ 
++$(OBJDIR)/jscpucfg.o: jscpucfg.c jscpucfg.h
++	$(HOST_CC) -o $@ $(CFLAGS) $(LDFLAGS) jscpucfg.c
++
+ $(OBJDIR)/jscpucfg: $(OBJDIR)/jscpucfg.o
+-	$(CC) -o $@ $(OBJDIR)/jscpucfg.o
++	$(HOST_CC) -o $@ $(OBJDIR)/jscpucfg.o
+ 
+ # Look in OBJDIR to find jsautocfg.h
+ INCLUDES   += -I$(OBJDIR)
diff --git a/recipes/js/js/jsautocfg.h b/recipes/js/js/jsautocfg.h
new file mode 100644
index 0000000..ac786dc
--- /dev/null
+++ b/recipes/js/js/jsautocfg.h
@@ -0,0 +1,52 @@
+#ifndef js_cpucfg___
+#define js_cpucfg___
+
+/* AUTOMATICALLY GENERATED - DO NOT EDIT */
+
+#define IS_LITTLE_ENDIAN 1
+#undef  IS_BIG_ENDIAN
+
+#define JS_BYTES_PER_BYTE   1L
+#define JS_BYTES_PER_SHORT  2L
+#define JS_BYTES_PER_INT    4L
+#define JS_BYTES_PER_INT64  8L
+#define JS_BYTES_PER_LONG   8L
+#define JS_BYTES_PER_FLOAT  4L
+#define JS_BYTES_PER_DOUBLE 8L
+#define JS_BYTES_PER_WORD   4L
+#define JS_BYTES_PER_DWORD  8L
+
+#define JS_BITS_PER_BYTE    8L
+#define JS_BITS_PER_SHORT   16L
+#define JS_BITS_PER_INT     32L
+#define JS_BITS_PER_INT64   64L
+#define JS_BITS_PER_LONG    64L
+#define JS_BITS_PER_FLOAT   32L
+#define JS_BITS_PER_DOUBLE  64L
+#define JS_BITS_PER_WORD    32L
+
+#define JS_BITS_PER_BYTE_LOG2   3L
+#define JS_BITS_PER_SHORT_LOG2  4L
+#define JS_BITS_PER_INT_LOG2    5L
+#define JS_BITS_PER_INT64_LOG2  6L
+#define JS_BITS_PER_LONG_LOG2   6L
+#define JS_BITS_PER_FLOAT_LOG2  5L
+#define JS_BITS_PER_DOUBLE_LOG2 6L
+#define JS_BITS_PER_WORD_LOG2   3L
+
+#define JS_ALIGN_OF_SHORT   2L
+#define JS_ALIGN_OF_INT     4L
+#define JS_ALIGN_OF_LONG    8L
+#define JS_ALIGN_OF_INT64   8L
+#define JS_ALIGN_OF_FLOAT   4L
+#define JS_ALIGN_OF_DOUBLE  8L
+#define JS_ALIGN_OF_POINTER 8L
+#define JS_ALIGN_OF_WORD    4L
+
+#define JS_BYTES_PER_WORD_LOG2   2L
+#define JS_BYTES_PER_DWORD_LOG2  3L
+#define JS_WORDS_PER_DWORD_LOG2  0L
+
+#define JS_STACK_GROWTH_DIRECTION (-1)
+
+#endif /* js_cpucfg___ */
diff --git a/recipes/js/js/libtermcap.patch b/recipes/js/js/libtermcap.patch
new file mode 100644
index 0000000..045b4fb
--- /dev/null
+++ b/recipes/js/js/libtermcap.patch
@@ -0,0 +1,13 @@
+Index: src/Makefile.ref
+===================================================================
+--- src.orig/Makefile.ref
++++ src/Makefile.ref
+@@ -127,7 +127,7 @@ endif
+ ifdef JS_READLINE
+ # For those platforms with the readline library installed.
+ DEFINES += -DEDITLINE
+-PROG_LIBS += -lreadline -ltermcap
++PROG_LIBS += -lreadline -lncurses
+ else
+ ifdef JS_EDITLINE
+ # Use the editline library, built locally.
diff --git a/recipes/js/js/powerpc/jsautocfg.h b/recipes/js/js/powerpc/jsautocfg.h
new file mode 100644
index 0000000..93d0374
--- /dev/null
+++ b/recipes/js/js/powerpc/jsautocfg.h
@@ -0,0 +1,52 @@
+#ifndef js_cpucfg___
+#define js_cpucfg___
+
+/* AUTOMATICALLY GENERATED - DO NOT EDIT */
+
+#undef  IS_LITTLE_ENDIAN
+#define IS_BIG_ENDIAN 1
+
+#define JS_BYTES_PER_BYTE   1L
+#define JS_BYTES_PER_SHORT  2L
+#define JS_BYTES_PER_INT    4L
+#define JS_BYTES_PER_INT64  8L
+#define JS_BYTES_PER_LONG   4L
+#define JS_BYTES_PER_FLOAT  4L
+#define JS_BYTES_PER_DOUBLE 8L
+#define JS_BYTES_PER_WORD   4L
+#define JS_BYTES_PER_DWORD  8L
+
+#define JS_BITS_PER_BYTE    8L
+#define JS_BITS_PER_SHORT   16L
+#define JS_BITS_PER_INT     32L
+#define JS_BITS_PER_INT64   64L
+#define JS_BITS_PER_LONG    32L
+#define JS_BITS_PER_FLOAT   32L
+#define JS_BITS_PER_DOUBLE  64L
+#define JS_BITS_PER_WORD    32L
+
+#define JS_BITS_PER_BYTE_LOG2   3L
+#define JS_BITS_PER_SHORT_LOG2  4L
+#define JS_BITS_PER_INT_LOG2    5L
+#define JS_BITS_PER_INT64_LOG2  6L
+#define JS_BITS_PER_LONG_LOG2   5L
+#define JS_BITS_PER_FLOAT_LOG2  5L
+#define JS_BITS_PER_DOUBLE_LOG2 6L
+#define JS_BITS_PER_WORD_LOG2   5L
+
+#define JS_ALIGN_OF_SHORT   2L
+#define JS_ALIGN_OF_INT     4L
+#define JS_ALIGN_OF_LONG    4L
+#define JS_ALIGN_OF_INT64   8L
+#define JS_ALIGN_OF_FLOAT   4L
+#define JS_ALIGN_OF_DOUBLE  8L
+#define JS_ALIGN_OF_POINTER 4L
+#define JS_ALIGN_OF_WORD    4L
+
+#define JS_BYTES_PER_WORD_LOG2   2L
+#define JS_BYTES_PER_DWORD_LOG2  3L
+#define JS_WORDS_PER_DWORD_LOG2  1L
+
+#define JS_STACK_GROWTH_DIRECTION (-1)
+
+#endif /* js_cpucfg___ */
-- 
1.6.4.2



