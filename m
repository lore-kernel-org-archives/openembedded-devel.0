Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3860BC44509
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:17 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69142.1782634336730056006
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pPtIq/4X;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30e9eefa268so1602246eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634336; x=1783239136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HIxHlH6qpCqQrRkCMP1sL9iVJsbzQdcatZS6Hoy6XFs=;
        b=pPtIq/4XwnehSKD3dgNuy46D9QpDkfci0maVt32TYKaOBHSsel6mBQOd7a8l/DwwLP
         pnFVGAYZDrSnV+cqIFTY5ZmDQExDYSOPUlBWUsE/c2ModLk1lfyqaNKPtl8BwySGNEbo
         xVBb81NGm1qL+Hmt/uUwQRxLekeXV0MC11fSG5mdsaMxQOKw0+A+LxxvW704sWB+Fxnz
         tsL+k6ChnjDaey71PJiuWsM4TA6bJ1tNFrbcoPJSjc6kkovYCjW7LhmLPn4CMX5h9rA2
         IjL4dPmbdIlj/lXxX661v6aDAqz59B+rcTksakwEYnnrwvU2a0O9anCBe/+Jpb10AAic
         dKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634336; x=1783239136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HIxHlH6qpCqQrRkCMP1sL9iVJsbzQdcatZS6Hoy6XFs=;
        b=ZzF/llhctGZOVbLwFvKnxbZqbsadT1Q4JH1i541ciywbP+qNrSwzvrOSF2/CXiGk/x
         w7JhqKNQlyvvmCLdwb6Dn5H9vsLNOFtHIjDCKV9ZsvlMpq7bMz5GMACoQsrl+xJgOiv6
         hr+Px+lSEX+8vz5Lv9UIgX9maxT12ooprfH1uD87H90/nb9twmRRAaC1fdejSf9iUGW4
         /3bcA25p9JQfAO7JFftsNOiUxOJW4VDY4aFqFxGK7XZ5P8b62FRR1qIZb91UgVxhrQAo
         6fwAnqyqEw/iiqCQoJfb2ThQY9PElaiqNdnqTeCmJ4MmlQUMldJMfef2Adzh/4UN8d3u
         3ctQ==
X-Gm-Message-State: AOJu0YyzHCQYnMLQxsQG37UjrtQjBlYSTPw4JhalexdU7puD8FRLeqVs
	OPNCrveZLJ1/d7LFEbG7nYTEzOEEYgfWVeVPaTaoekRF26KidJpTTlCd0mBSesIZXAlOEw==
X-Gm-Gg: AfdE7cnB1CtpfS699XCRUjUpFCntlm7zUw4UnKA4ufd3SQcz2Yc2Q0jcz46QvJMVW8E
	mBCRFva4P2Xo1biM7MA39YV7HC1ht1mtre4/8pFeP01LqNhg9P2z1t0HEXCi8N2RhcKb2jkMwPd
	LYjphls5cLoBx8VVF7JQBEgfLcchTMqKDKx7hXChU4GxhjIBv9vNEBptdQOyx/92pUj6OpCqFax
	GBgg2We8hzsvPxn4fgyQZLeWllOditrAq6FUeMEmh5bS1EeGjJ7QVM/X2M8Zl3uCcD48+L+6WOY
	yLsvRBI2x10WGEWGKZmsj+t+j43XIFD+oSa8JAf7k9OnnX+UerbbR/UTjAAd7dA5yGv6JDJ9ymB
	rYnBFPmDFLoWUSXRwdKd4UgQLpVpeXVLL3IyHWcwl1rMht9XI6jOqMY+nGBPEN+REZiIl4plHZ+
	Qvgywfn/xYmAmuh1B1RKgP0h9maXuObPY732xVqPu6VqhyvrDbqTs21qW0T/P6rb7xszp16D+Sp
	CVmbmMM/ZMcUrhLCfOjykvp8vheF7hrK2pfqbLiazberWJEZVoHhCOPDq61f5Dt6aKj1cc3tpzy
	KjZeSnzdKdPeH4sEFos/ZfcPKfwgRw==
X-Received: by 2002:a05:7301:3d17:b0:30c:ab4d:da32 with SMTP id 5a478bee46e88-30cab4ddb8bmr5915996eec.36.1782634335695;
        Sun, 28 Jun 2026 01:12:15 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 055/128] dmalloc: upgrade 5.5.2 -> 5.6.5
Date: Sun, 28 Jun 2026 01:10:06 -0700
Message-ID: <20260628081122.178348-55-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127865

License-Update: copyright year updated 2000 -> 2020

Update the dmalloc.c license md5 for 5.6.5 and regenerate the patches so
they apply without fuzz (a fatal QA error). Regenerate 150-use_DESTDIR.patch
so DESTDIR also covers the install/installdocs targets; the dmalloc utility
was otherwise installed to the host /usr/bin and failed with permission
denied.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../dmalloc/0001-undefined-strdup-macro.patch |  12 +-
 .../dmalloc/dmalloc/02-Makefile.in.patch      | 182 ++++++++----------
 .../dmalloc/dmalloc/100-use-xtools.patch      |  24 ++-
 .../dmalloc/13-fix-ldflags-in-makefile.patch  |  13 +-
 .../dmalloc/dmalloc/130-mips.patch            |  26 ++-
 .../dmalloc/dmalloc/150-use_DESTDIR.patch     |  32 ++-
 .../dmalloc/configure-pagesize-HACK.patch     |  53 +++--
 .../{dmalloc_5.5.2.bb => dmalloc_5.6.5.bb}    |   4 +-
 8 files changed, 174 insertions(+), 172 deletions(-)
 rename meta-oe/recipes-devtools/dmalloc/{dmalloc_5.5.2.bb => dmalloc_5.6.5.bb} (91%)

diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc/0001-undefined-strdup-macro.patch b/meta-oe/recipes-devtools/dmalloc/dmalloc/0001-undefined-strdup-macro.patch
index a3a3df4a7b..1e677e19a2 100644
--- a/meta-oe/recipes-devtools/dmalloc/dmalloc/0001-undefined-strdup-macro.patch
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc/0001-undefined-strdup-macro.patch
@@ -18,14 +18,14 @@ index 8bda997..b70c07e 100644
 --- a/dmalloc.h.3
 +++ b/dmalloc.h.3
 @@ -1,5 +1,8 @@
- /* NOTE: start of $Id: dmalloc.h.4,v 1.15 2007/05/14 17:23:37 gray Exp $ */
- 
+ /* NOTE: start of dmalloc.h.3 */
+
 +#undef strndup
 +#undef strdup
 +
- /* dmalloc version defines */
- #define DMALLOC_VERSION_MAJOR	5	/* X.0.0 */
- #define DMALLOC_VERSION_MINOR	5	/* 0.X.0 */
--- 
+ /* this defines what type the standard void memory-pointer is */
+ #if (defined(__STDC__) && __STDC__ == 1) || defined(__cplusplus) || defined(STDC_HEADERS) || defined(_ISO_STDLIB_ISO_H)
+ #define DMALLOC_PNT		void *
+--
 2.10.2
 
diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc/02-Makefile.in.patch b/meta-oe/recipes-devtools/dmalloc/dmalloc/02-Makefile.in.patch
index ba65d394f0..6bb948cc25 100644
--- a/meta-oe/recipes-devtools/dmalloc/dmalloc/02-Makefile.in.patch
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc/02-Makefile.in.patch
@@ -5,11 +5,9 @@ Description: Changes for building shared libraries
  files and the correct soname and libname.
 Author: Daniel Rus Morales <danirus@tol-project.org>
 
-Index: dmalloc-5.5.2/Makefile.in
-===================================================================
---- dmalloc-5.5.2.orig/Makefile.in
-+++ dmalloc-5.5.2/Makefile.in
-@@ -41,7 +41,7 @@ LIBRARY	= lib$(MODULE).a
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -42,7 +42,7 @@
  
  # thread version of the library
  LIB_TH	= lib$(MODULE)th.a
@@ -18,7 +16,7 @@ Index: dmalloc-5.5.2/Makefile.in
  @TH_ON@BUILD_ALL_1 = threads
  @TH_ON@INSTALL_LIB_1 = installth
  @SL_ON@BUILD_THREADS_1 = $(LIB_TH_SL)
-@@ -50,8 +50,8 @@ LIB_TH_SL = lib$(MODULE)th.@shlibext@
+@@ -51,8 +51,8 @@
  @TH_ON@@SL_ON@INSTALL_LIB_2 = installthsl
  
  # C++ version of the library
@@ -29,7 +27,7 @@ Index: dmalloc-5.5.2/Makefile.in
  @CXX_ON@BUILD_ALL_3 = $(LIB_CXX)
  @CXX_ON@INSTALL_LIB_3 = installcxx
  @SL_ON@BUILD_CXX_3 = $(LIB_CXX_SL)
-@@ -61,7 +61,7 @@ LIB_CXX_SL = lib$(MODULE)xx.@shlibext@
+@@ -62,7 +62,7 @@
  
  # threads + C++
  LIB_TH_CXX = lib$(MODULE)thcxx.a
@@ -38,7 +36,7 @@ Index: dmalloc-5.5.2/Makefile.in
  @TH_ON@@CXX_ON@BUILD_ALL_5 = $(LIB_TH_CXX)
  @TH_ON@@CXX_ON@INSTALL_LIB_5 = installthcxx
  @TH_ON@BUILD_CXX_5 = $(LIB_TH_CXX)
-@@ -76,7 +76,7 @@ LIB_TH_CXX_SL = lib$(MODULE)thcxx.@shlib
+@@ -77,7 +77,7 @@
  @CXX_ON@@SL_ON@INSTALL_THREADS_6 = installthcxxsl
  
  # shared versions of the libraries
@@ -47,21 +45,21 @@ Index: dmalloc-5.5.2/Makefile.in
  @SL_ON@BUILD_ALL_7 = $(LIB_SL)
  @SL_ON@INSTALL_LIB_7 = installsl
  @SL_ON@BUILD_TH_CXX_7 = $(LIB_TH_CXX_SL)
-@@ -145,9 +145,13 @@ SHELL = /bin/sh
+@@ -150,9 +150,13 @@
  
  HFLS = dmalloc.h
- OBJS = arg_check.o compat.o dmalloc_rand.o dmalloc_tab.o env.o heap.o
-+OBJS_SL = arg_check_sl.o compat_sl.o dmalloc_rand_sl.o dmalloc_tab_sl.o env_sl.o heap_sl.o
- NORMAL_OBJS = chunk.o error.o malloc.o
-+NORMAL_OBJS_SL = chunk_sl.o error_sl.o malloc_sl.o
- THREAD_OBJS = chunk_th.o error_th.o malloc_th.o
-+THREAD_OBJS_SL = chunk_th_sl.o error_th_sl.o malloc_th_sl.o
+ OBJS = append.o arg_check.o compat.o dmalloc_rand.o dmalloc_tab.o env.o heap.o
++OBJS_SL = append_sl.o arg_check_sl.o compat_sl.o dmalloc_rand_sl.o dmalloc_tab_sl.o env_sl.o heap_sl.o
+ NORMAL_OBJS = chunk.o error.o user_malloc.o
++NORMAL_OBJS_SL = chunk_sl.o error_sl.o user_malloc_sl.o
+ THREAD_OBJS = chunk_th.o error_th.o user_malloc_th.o
++THREAD_OBJS_SL = chunk_th_sl.o error_th_sl.o user_malloc_th_sl.o
  CXX_OBJS = dmallocc.o
 +CXX_OBJS_SL = dmallocc_sl.o
  
  CFLAGS = $(CCFLAGS)
  TEST = $(MODULE)_t
-@@ -160,9 +164,9 @@ all : $(BUILD_ALL)
+@@ -165,9 +169,9 @@
  
  clean :
  	rm -f $(A_OUT) core *.o *.t
@@ -73,7 +71,7 @@ Index: dmalloc-5.5.2/Makefile.in
  
  realclean : clean
  
-@@ -181,43 +185,43 @@ installincs : $(HFLS)
+@@ -189,43 +193,43 @@
  	$(INSTALL_DATA) $(HFLS) $(includedir)
  
  installthsl : $(LIB_TH_SL)
@@ -127,26 +125,26 @@ Index: dmalloc-5.5.2/Makefile.in
  	@RANLIB@ $(libdir)/$(LIBRARY)
  @SL_OFF@	@echo "Enter 'make installsl' to install $(LIB_SL) in $(shlibdir)"
  @CXX_OFF@	@echo "Enter 'make installcxx' to install the C++ library"
-@@ -255,10 +259,8 @@ shlib : $(BUILD_SL)
+@@ -297,10 +301,8 @@
+ 
  # NOTE: you may have to edit the configure.ac script to get this to
  # work on your operating system.  Please send feedback to the author
- # via: http://256.com/gray/email.html
 -$(LIB_SL) : $(LIBRARY)
 -	rm -f $@ $@.t
--	@shlinkargs@ $(LIBRARY) $(OBJS) $(NORMAL_OBJS)
+-	@shlinkargs@ $(LIBRARY)
 -	mv $@.t $@
 +$(LIB_SL) : $(OBJS_SL) $(NORMAL_OBJS_SL)
 +	$(CC) -shared -Wl,-soname,libdmalloc.so.5 -o $@ $(OBJS_SL) $(NORMAL_OBJS_SL)
  
  $(LIBRARY) : $(OBJS) $(NORMAL_OBJS)
  	ar cr $@ $?
-@@ -268,32 +270,26 @@ $(LIB_TH) : $(OBJS) $(THREAD_OBJS)
+@@ -310,32 +312,26 @@
  	ar cr $@ $?
  	@RANLIB@ $@
  
 -$(LIB_TH_SL) : $(LIB_TH)
 -	rm -f $@ $@.t
--	@shlinkargs@ $(LIB_TH) $(OBJS) $(THREAD_OBJS)
+-	@shlinkargs@ $(LIB_TH)
 -	mv $@.t $@
 +$(LIB_TH_SL) : $(OBJS_SL) $(THREAD_OBJS_SL)
 +	$(CC) -shared -Wl,-soname,libdmallocth.so.5 -o $@ $(OBJS_SL) $(THREAD_OBJS_SL)
@@ -157,7 +155,7 @@ Index: dmalloc-5.5.2/Makefile.in
  
 -$(LIB_CXX_SL) : $(LIB_CXX)
 -	rm -f $@ $@.t
--	@shlinkargs@ $(LIB_CXX) $(OBJS) $(NORMAL_OBJS) $(CXX_OBJS)
+-	@shlinkargs@ $(LIB_CXX)
 -	mv $@.t $@
 +$(LIB_CXX_SL) : $(OBJS_SL) $(NORMAL_OBJS_SL) $(CXX_OBJS_SL)
 +	$(CC) -shared -Wl,-soname,libdmalloccxx.so.5 -o $@ $(OBJS_SL) $(NORMAL_OBJS_SL) $(CXX_OBJS_SL)
@@ -168,7 +166,7 @@ Index: dmalloc-5.5.2/Makefile.in
  
 -$(LIB_TH_CXX_SL) : $(LIB_TH_CXX)
 -	rm -f $@ $@.t
--	@shlinkargs@ $(LIB_TH_CXX) $(OBJS) $(THREAD_OBJS) $(CXX_OBJS)
+-	@shlinkargs@ $(LIB_TH_CXX)
 -	mv $@.t $@
 +$(LIB_TH_CXX_SL) : $(OBJS_SL) $(THREAD_OBJS_SL) $(CXX_OBJS_SL)
 +	$(CC) -shared -Wl,-soname,libdmallocthcxx.so.5 -o $@ $(OBJS_SL) $(THREAD_OBJS_SL) $(CXX_OBJS_SL)
@@ -181,7 +179,7 @@ Index: dmalloc-5.5.2/Makefile.in
  
  threadscxx : $(BUILD_TH_CXX)
  @SL_OFF@	@echo "Enter 'make threadscxxsl' to build the threaded C++ shared-library"
-@@ -302,7 +298,7 @@ threads : $(BUILD_THREADS)
+@@ -344,7 +340,7 @@
  @CXX_OFF@	@echo "Enter 'make threadscxx' to build the threaded C++ library"
  @SL_OFF@	@echo "Enter 'make threadssl' to build the threaded shared library"
  
@@ -190,9 +188,9 @@ Index: dmalloc-5.5.2/Makefile.in
  
  cxx : $(BUILD_CXX)
  @SL_OFF@	@echo "Enter 'make cxxsl' to build the cxx shared library"
-@@ -371,6 +367,11 @@ dmallocc.o : $(srcdir)/dmallocc.cc
- 	$(CXX) $(CFLAGS) $(CPPFLAGS) $(DEFS) $(INCS) -c $(srcdir)/dmallocc.cc \
- 		-o ./$@
+@@ -404,6 +400,11 @@
+ 	rm -f $@
+ 	$(CC) $(CFLAGS) $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
  
 +dmallocc_sl.o : $(srcdir)/dmallocc.cc
 +	rm -f $@
@@ -200,115 +198,101 @@ Index: dmalloc-5.5.2/Makefile.in
 +		-o ./$@
 +
  #
- # auto configure settings - uncomment if you are doing configure
- # development on the library
-@@ -395,38 +396,109 @@ dmallocc.o : $(srcdir)/dmallocc.cc
+ # .cc.o auto-target doesn't work on some systems.
+ # also, $? did not work on OSF for the -c, grrr
+@@ -432,12 +433,28 @@
  
+ append.o: append.c conf.h settings.h dmalloc.h append.h compat.h \
+   dmalloc_loc.h
++append_sl.o: append.c conf.h settings.h dmalloc.h append.h compat.h \
++  dmalloc_loc.h
++	rm -f $@
++	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
  arg_check.o: arg_check.c conf.h settings.h dmalloc.h chunk.h debug_tok.h \
    dmalloc_loc.h error.h arg_check.h
 +arg_check_sl.o: arg_check.c conf.h settings.h dmalloc.h chunk.h debug_tok.h \
 +  dmalloc_loc.h error.h arg_check.h
 +	rm -f $@
 +	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
- chunk.o: chunk.c conf.h settings.h dmalloc.h chunk.h chunk_loc.h \
-   dmalloc_loc.h compat.h debug_tok.h dmalloc_rand.h dmalloc_tab.h error.h \
-   error_val.h heap.h
-+chunk_sl.o: chunk.c conf.h settings.h dmalloc.h chunk.h chunk_loc.h \
-+  dmalloc_loc.h compat.h debug_tok.h dmalloc_rand.h dmalloc_tab.h error.h \
-+  error_val.h heap.h
+ chunk.o: chunk.c conf.h settings.h dmalloc.h append.h chunk.h chunk_loc.h \
+   dmalloc_loc.h compat.h debug_tok.h dmalloc_rand.h dmalloc_tab.h \
+   error.h error_val.h heap.h
++chunk_sl.o: chunk.c conf.h settings.h dmalloc.h append.h chunk.h chunk_loc.h \
++  dmalloc_loc.h compat.h debug_tok.h dmalloc_rand.h dmalloc_tab.h \
++  error.h error_val.h heap.h
 +	rm -f $@
 +	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
  compat.o: compat.c conf.h settings.h dmalloc.h compat.h dmalloc_loc.h
 +compat_sl.o: compat.c conf.h settings.h dmalloc.h compat.h dmalloc_loc.h
 +	rm -f $@
 +	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
- dmalloc.o: dmalloc.c conf.h settings.h dmalloc_argv.h dmalloc.h compat.h \
-   debug_tok.h dmalloc_loc.h env.h error_val.h version.h
-+dmalloc_sl.o: dmalloc.c conf.h settings.h dmalloc_argv.h dmalloc.h compat.h \
-+  debug_tok.h dmalloc_loc.h env.h error_val.h version.h
-+	rm -f $@
-+	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
- dmalloc_argv.o: dmalloc_argv.c conf.h settings.h dmalloc_argv.h \
-   dmalloc_argv_loc.h compat.h
-+dmalloc_argv_sl.o: dmalloc_argv.c conf.h settings.h dmalloc_argv.h \
-+  dmalloc_argv_loc.h compat.h
-+	rm -f $@
-+	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
+ dmalloc.o: dmalloc.c conf.h settings.h dmalloc_argv.h dmalloc.h append.h \
+   compat.h debug_tok.h dmalloc_loc.h env.h error_val.h version.h
+ dmalloc_argv.o: dmalloc_argv.c conf.h settings.h append.h dmalloc_argv.h \
+@@ -445,28 +462,66 @@
  dmalloc_fc_t.o: dmalloc_fc_t.c conf.h settings.h dmalloc.h dmalloc_argv.h \
    dmalloc_rand.h debug_tok.h dmalloc_loc.h error_val.h
-+dmalloc_fc_t_sl.o: dmalloc_fc_t.c conf.h settings.h dmalloc.h dmalloc_argv.h \
-+  dmalloc_rand.h debug_tok.h dmalloc_loc.h error_val.h
-+	rm -f $@
-+	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
  dmalloc_rand.o: dmalloc_rand.c dmalloc_rand.h
 +dmalloc_rand_sl.o: dmalloc_rand.c dmalloc_rand.h
 +	rm -f $@
 +	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
- dmalloc_t.o: dmalloc_t.c conf.h settings.h compat.h dmalloc.h \
+ dmalloc_t.o: dmalloc_t.c conf.h settings.h append.h compat.h dmalloc.h \
    dmalloc_argv.h dmalloc_rand.h arg_check.h debug_tok.h dmalloc_loc.h \
    error_val.h heap.h
-+dmalloc_t_sl.o: dmalloc_t.c conf.h settings.h compat.h dmalloc.h \
-+  dmalloc_argv.h dmalloc_rand.h arg_check.h debug_tok.h dmalloc_loc.h \
-+  error_val.h heap.h
-+	rm -f $@
-+	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
- dmalloc_tab.o: dmalloc_tab.c conf.h settings.h chunk.h compat.h dmalloc.h \
-   dmalloc_loc.h error.h error_val.h dmalloc_tab.h dmalloc_tab_loc.h
-+dmalloc_tab_sl.o: dmalloc_tab.c conf.h settings.h chunk.h compat.h dmalloc.h \
-+  dmalloc_loc.h error.h error_val.h dmalloc_tab.h dmalloc_tab_loc.h
+ dmalloc_tab.o: dmalloc_tab.c conf.h settings.h append.h chunk.h compat.h \
+   dmalloc.h dmalloc_loc.h dmalloc_tab.h dmalloc_tab_loc.h
++dmalloc_tab_sl.o: dmalloc_tab.c conf.h settings.h append.h chunk.h compat.h \
++  dmalloc.h dmalloc_loc.h dmalloc_tab.h dmalloc_tab_loc.h
 +	rm -f $@
 +	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
- env.o: env.c conf.h settings.h dmalloc.h compat.h dmalloc_loc.h \
+ env.o: env.c conf.h settings.h dmalloc.h append.h compat.h dmalloc_loc.h \
    debug_tok.h env.h error.h
-+env_sl.o: env.c conf.h settings.h dmalloc.h compat.h dmalloc_loc.h \
++env_sl.o: env.c conf.h settings.h dmalloc.h append.h compat.h dmalloc_loc.h \
 +  debug_tok.h env.h error.h
 +	rm -f $@
 +	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
- error.o: error.c conf.h settings.h dmalloc.h chunk.h compat.h debug_tok.h \
-   dmalloc_loc.h env.h error.h error_val.h version.h
-+error_sl.o: error.c conf.h settings.h dmalloc.h chunk.h compat.h debug_tok.h \
-+  dmalloc_loc.h env.h error.h error_val.h version.h
+ error.o: error.c conf.h settings.h dmalloc.h append.h chunk.h compat.h \
+   debug_tok.h dmalloc_loc.h env.h error.h error_val.h version.h
++error_sl.o: error.c conf.h settings.h dmalloc.h append.h chunk.h compat.h \
++  debug_tok.h dmalloc_loc.h env.h error.h error_val.h version.h
 +	rm -f $@
 +	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
- heap.o: heap.c conf.h settings.h dmalloc.h chunk.h compat.h debug_tok.h \
-   dmalloc_loc.h error.h error_val.h heap.h
-+heap_sl.o: heap.c conf.h settings.h dmalloc.h chunk.h compat.h debug_tok.h \
-+  dmalloc_loc.h error.h error_val.h heap.h
-+	rm -f $@
-+	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
- malloc.o: malloc.c conf.h settings.h dmalloc.h chunk.h compat.h \
-   debug_tok.h dmalloc_loc.h env.h error.h error_val.h heap.h \
-   malloc_funcs.h return.h
-+malloc_sl.o: malloc.c conf.h settings.h dmalloc.h chunk.h compat.h \
-+  debug_tok.h dmalloc_loc.h env.h error.h error_val.h heap.h \
-+  malloc_funcs.h return.h
+ heap.o: heap.c conf.h settings.h dmalloc.h append.h chunk.h compat.h \
+   debug_tok.h dmalloc_loc.h error.h error_val.h heap.h
++heap_sl.o: heap.c conf.h settings.h dmalloc.h append.h chunk.h compat.h \
++  debug_tok.h dmalloc_loc.h error.h error_val.h heap.h
 +	rm -f $@
 +	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
  protect.o: protect.c conf.h settings.h dmalloc.h dmalloc_loc.h error.h \
    heap.h protect.h
-+protect_sl.o: protect.c conf.h settings.h dmalloc.h dmalloc_loc.h error.h \
-+  heap.h protect.h
+ user_malloc.o: user_malloc.c conf.h settings.h dmalloc.h append.h chunk.h \
+   compat.h debug_tok.h dmalloc_loc.h env.h error.h error_val.h heap.h \
+   user_malloc.h return.h
++user_malloc_sl.o: user_malloc.c conf.h settings.h dmalloc.h append.h chunk.h \
++  compat.h debug_tok.h dmalloc_loc.h env.h error.h error_val.h heap.h \
++  user_malloc.h return.h
 +	rm -f $@
 +	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
- chunk_th.o: chunk.c conf.h settings.h dmalloc.h chunk.h chunk_loc.h \
-   dmalloc_loc.h compat.h debug_tok.h dmalloc_rand.h dmalloc_tab.h error.h \
-   error_val.h heap.h
-+chunk_th_sl.o: chunk.c conf.h settings.h dmalloc.h chunk.h chunk_loc.h \
-+  dmalloc_loc.h compat.h debug_tok.h dmalloc_rand.h dmalloc_tab.h error.h \
-+  error_val.h heap.h
+ dmallocc.o: dmallocc.cc dmalloc.h return.h conf.h settings.h
+ chunk_th.o: chunk.c conf.h settings.h dmalloc.h append.h chunk.h chunk_loc.h \
+   dmalloc_loc.h compat.h debug_tok.h dmalloc_rand.h dmalloc_tab.h \
+   error.h error_val.h heap.h
++chunk_th_sl.o: chunk.c conf.h settings.h dmalloc.h append.h chunk.h chunk_loc.h \
++  dmalloc_loc.h compat.h debug_tok.h dmalloc_rand.h dmalloc_tab.h \
++  error.h error_val.h heap.h
 +	rm -f $@
 +	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
- error_th.o: error.c conf.h settings.h dmalloc.h chunk.h compat.h debug_tok.h \
-   dmalloc_loc.h env.h error.h error_val.h version.h
-+error_th_sl.o: error.c conf.h settings.h dmalloc.h chunk.h compat.h debug_tok.h \
-+  dmalloc_loc.h env.h error.h error_val.h version.h
+ error_th.o: error.c conf.h settings.h dmalloc.h append.h chunk.h compat.h \
+   debug_tok.h dmalloc_loc.h env.h error.h error_val.h version.h
++error_th_sl.o: error.c conf.h settings.h dmalloc.h append.h chunk.h compat.h \
++  debug_tok.h dmalloc_loc.h env.h error.h error_val.h version.h
 +	rm -f $@
 +	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
- malloc_th.o: malloc.c conf.h settings.h dmalloc.h chunk.h compat.h \
-   debug_tok.h dmalloc_loc.h env.h error.h error_val.h heap.h \
-   malloc_funcs.h return.h
-+malloc_th_sl.o: malloc.c conf.h settings.h dmalloc.h chunk.h compat.h \
-+  debug_tok.h dmalloc_loc.h env.h error.h error_val.h heap.h \
-+  malloc_funcs.h return.h
+ user_malloc_th.o: user_malloc.c conf.h settings.h dmalloc.h append.h chunk.h \
+   compat.h debug_tok.h dmalloc_loc.h env.h error.h error_val.h heap.h \
+   user_malloc.h return.h
++user_malloc_th_sl.o: user_malloc.c conf.h settings.h dmalloc.h append.h chunk.h \
++  compat.h debug_tok.h dmalloc_loc.h env.h error.h error_val.h heap.h \
++  user_malloc.h return.h
 +	rm -f $@
 +	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc/100-use-xtools.patch b/meta-oe/recipes-devtools/dmalloc/dmalloc/100-use-xtools.patch
index 94ca93647f..97c7111055 100644
--- a/meta-oe/recipes-devtools/dmalloc/dmalloc/100-use-xtools.patch
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc/100-use-xtools.patch
@@ -19,11 +19,10 @@ License for dmalloc is:
 I personnaly believe that the resulting code should therefore be
 LGPL v2.1, but don't believe me, ask your lawyers!
 
-Index: dmalloc-5.5.2/configure.ac
-===================================================================
---- dmalloc-5.5.2.orig/configure.ac
-+++ dmalloc-5.5.2/configure.ac
-@@ -69,6 +69,15 @@ if test "$ac_cv_prog_cc_stdc" = "no" ; t
+diff --git a/configure.ac b/configure.ac
+--- a/configure.ac
++++ b/configure.ac
+@@ -76,6 +76,15 @@
  fi
  AC_PROG_INSTALL
  AC_PROG_RANLIB
@@ -39,9 +38,9 @@ Index: dmalloc-5.5.2/configure.ac
  AC_C_CONST
  
  # we need this for various settings
-@@ -131,14 +140,14 @@ AC_SUBST(shlibdir)
+@@ -144,14 +153,14 @@
  AC_MSG_CHECKING([shared library link args])
- AC_COMPILE_IFELSE([ int foo(int val) { return val + 1; } ],[
+ AC_COMPILE_IFELSE([AC_LANG_SOURCE([ int foo(int val) { return val + 1; } ])],[
  	# so now we try to create an archive from the compiled .o file
 -	(ar cr conftest.a conftest.o) 2>&5
 +	(${ac_cv_prog_AR} cr conftest.a conftest.o) 2>&5
@@ -56,7 +55,7 @@ Index: dmalloc-5.5.2/configure.ac
              # By convention on some platforms
              # libLLL.so, libLLL.X.so are symlinks to libLLL.X.Y.Z.so
              # where X.Y.Z is version # (major.minor.increment) of the library
-@@ -156,12 +165,12 @@ AC_COMPILE_IFELSE([ int foo(int val) { r
+@@ -169,12 +178,12 @@
              ac_cv_shared_link_args='# Could not configure shlib linking'
              enable_shlib=no
            fi
@@ -75,11 +74,10 @@ Index: dmalloc-5.5.2/configure.ac
  	else
  		# oh well, toss an error
  		ac_cv_shared_link_args='# Could not configure shlib linking'
-Index: dmalloc-5.5.2/Makefile.in
-===================================================================
---- dmalloc-5.5.2.orig/Makefile.in
-+++ dmalloc-5.5.2/Makefile.in
-@@ -263,25 +263,25 @@ $(LIB_SL) : $(OBJS_SL) $(NORMAL_OBJS_SL)
+diff --git a/Makefile.in b/Makefile.in
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -305,25 +305,25 @@
  	$(CC) $(LDFLAGS) -shared -Wl,-soname,libdmalloc.so.5 -o $@ $(OBJS_SL) $(NORMAL_OBJS_SL)
  
  $(LIBRARY) : $(OBJS) $(NORMAL_OBJS)
diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc/13-fix-ldflags-in-makefile.patch b/meta-oe/recipes-devtools/dmalloc/dmalloc/13-fix-ldflags-in-makefile.patch
index 3b7344dbf9..09a12cbea6 100644
--- a/meta-oe/recipes-devtools/dmalloc/dmalloc/13-fix-ldflags-in-makefile.patch
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc/13-fix-ldflags-in-makefile.patch
@@ -1,19 +1,18 @@
 Upstream-Status: Pending
 
-Index: dmalloc-5.5.2/Makefile.in
-===================================================================
---- dmalloc-5.5.2.orig/Makefile.in
-+++ dmalloc-5.5.2/Makefile.in
-@@ -260,7 +260,7 @@ shlib : $(BUILD_SL)
+diff --git a/Makefile.in b/Makefile.in
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -302,7 +302,7 @@
+ # NOTE: you may have to edit the configure.ac script to get this to
  # work on your operating system.  Please send feedback to the author
- # via: http://256.com/gray/email.html
  $(LIB_SL) : $(OBJS_SL) $(NORMAL_OBJS_SL)
 -	$(CC) -shared -Wl,-soname,libdmalloc.so.5 -o $@ $(OBJS_SL) $(NORMAL_OBJS_SL)
 +	$(CC) $(LDFLAGS) -shared -Wl,-soname,libdmalloc.so.5 -o $@ $(OBJS_SL) $(NORMAL_OBJS_SL)
  
  $(LIBRARY) : $(OBJS) $(NORMAL_OBJS)
  	ar cr $@ $?
-@@ -271,21 +271,21 @@ $(LIB_TH) : $(OBJS) $(THREAD_OBJS)
+@@ -313,21 +313,21 @@
  	@RANLIB@ $@
  
  $(LIB_TH_SL) : $(OBJS_SL) $(THREAD_OBJS_SL)
diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc/130-mips.patch b/meta-oe/recipes-devtools/dmalloc/dmalloc/130-mips.patch
index 18f5993e47..9151a9eeb5 100644
--- a/meta-oe/recipes-devtools/dmalloc/dmalloc/130-mips.patch
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc/130-mips.patch
@@ -19,11 +19,10 @@ License for dmalloc is:
 I personnaly believe that the resulting code should therefore be
 LGPL v2.1, but don't believe me, ask your lawyers!
 
-Index: dmalloc-5.5.2/return.h
-===================================================================
---- dmalloc-5.5.2.orig/return.h
-+++ dmalloc-5.5.2/return.h
-@@ -106,26 +106,16 @@
+diff --git a/return.h b/return.h
+--- a/return.h
++++ b/return.h
+@@ -117,26 +117,16 @@
  /*************************************/
  
  /*
@@ -53,15 +52,14 @@ Index: dmalloc-5.5.2/return.h
  
  #endif /* __mips */
  
-Index: dmalloc-5.5.2/configure.ac
-===================================================================
---- dmalloc-5.5.2.orig/configure.ac
-+++ dmalloc-5.5.2/configure.ac
-@@ -585,31 +585,7 @@ int main() { return 1; }
+diff --git a/configure.ac b/configure.ac
+--- a/configure.ac
++++ b/configure.ac
+@@ -646,31 +646,7 @@
  # check if the return.h macros work
  #
  AC_MSG_CHECKING([return.h macros work])
--AC_RUN_IFELSE([
+-AC_RUN_IFELSE([AC_LANG_SOURCE([
 -
 -#define __CONF_H__
 -#define USE_RETURN_MACROS 1
@@ -75,12 +73,12 @@ Index: dmalloc-5.5.2/configure.ac
 -  GET_RET_ADDR(ret_addr);
 -}
 -
--main()
+-int main()
 -{
 -  foo();
--  exit(0);
+-  return 0;
 -}
--],
+-])],
 -[ AC_DEFINE(RETURN_MACROS_WORK, 1) AC_MSG_RESULT([yes]) ],
 -[ AC_DEFINE(RETURN_MACROS_WORK, 0) AC_MSG_RESULT([no]) ],
 -[ AC_DEFINE(RETURN_MACROS_WORK, 0) AC_MSG_RESULT([no]) ]
diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc/150-use_DESTDIR.patch b/meta-oe/recipes-devtools/dmalloc/dmalloc/150-use_DESTDIR.patch
index 1a9b0060b9..3d963904d8 100644
--- a/meta-oe/recipes-devtools/dmalloc/dmalloc/150-use_DESTDIR.patch
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc/150-use_DESTDIR.patch
@@ -6,12 +6,10 @@ Split installation of the utilitity from the global install.
 Copyright 2007 Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
 Licensed to you as dmalloc-5.5.2 is.
 
-Index: dmalloc-5.5.2/Makefile.in
-===================================================================
---- dmalloc-5.5.2.orig/Makefile.in
-+++ dmalloc-5.5.2/Makefile.in
-@@ -178,66 +178,66 @@ distclean : clean
- #	rm -f configure
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -186,65 +186,65 @@
+ docs : $(DOCS) LICENSE.txt
  
  installdirs :
 -	$(srcdir)/mkinstalldirs $(includedir) $(libdir) $(bindir)
@@ -83,24 +81,22 @@ Index: dmalloc-5.5.2/Makefile.in
  @CXX_OFF@	@echo "Enter 'make installcxx' to install the C++ library"
  @TH_OFF@	@echo "Enter 'make installth' to install thread library"
  
- installdocs : $(srcdir)/docs/$(HTMLFILE) $(srcdir)/docs/$(TEXIFILE) \
- 		$(srcdir)/docs/$(PDFFILE)
+ # see notes about why we need the FILE2 entries below
+ installdocs : $(INSTALL_FILE2) $(HTML_FILE2) $(INFO_FILE)
 -	$(srcdir)/mkinstalldirs $(docdir)
--	$(INSTALL_DATA) $(srcdir)/docs/$(HTMLFILE) $(docdir)
--	$(INSTALL_DATA) $(srcdir)/docs/$(TEXIFILE) $(docdir)
--	$(INSTALL_DATA) $(srcdir)/docs/$(PDFFILE) $(docdir)
+-	$(INSTALL_DATA) $(INSTALL_FILE2) $(docdir)/$(INSTALL_FILE)
+-	$(INSTALL_DATA) $(HTML_FILE2) $(docdir)/$(HTML_FILE)
+-	$(INSTALL_DATA) $(INFO_FILE) $(docdir)
 +	$(srcdir)/mkinstalldirs $(DESTDIR)/$(docdir)
-+	$(INSTALL_DATA) $(srcdir)/docs/$(HTMLFILE) $(DESTDIR)/$(docdir)
-+	$(INSTALL_DATA) $(srcdir)/docs/$(TEXIFILE) $(DESTDIR)/$(docdir)
-+	$(INSTALL_DATA) $(srcdir)/docs/$(PDFFILE) $(DESTDIR)/$(docdir)
++	$(INSTALL_DATA) $(INSTALL_FILE2) $(DESTDIR)/$(docdir)/$(INSTALL_FILE)
++	$(INSTALL_DATA) $(HTML_FILE2) $(DESTDIR)/$(docdir)/$(HTML_FILE)
++	$(INSTALL_DATA) $(INFO_FILE) $(DESTDIR)/$(docdir)
  
  install : installincs installlib $(UTIL)
 -	$(srcdir)/mkinstalldirs $(bindir)
 -	$(INSTALL_PROGRAM) $(UTIL) $(bindir)
--	@echo "Enter 'make installdocs' to install $(DOCFILES) in $(docdir)"
 +	$(srcdir)/mkinstalldirs $(DESTDIR)/$(bindir)
 +	$(INSTALL_PROGRAM) $(UTIL) $(DESTDIR)/$(bindir)
-+	@echo "Enter 'make installdocs' to install $(DOCFILES) in $(DESTDIR)/$(docdir)"
+ 	@echo "Enter 'make installdocs' to install $(DOCS) in $(docdir)"
  
- dmalloc.h.2 : $(srcdir)/configure
- 	$(SHELL) $(srcdir)/configure
+ dmalloc.h.2 conf.h settings.h version.h : $(srcdir)/configure $(srcdir)/settings.dist $(srcdir)/conf.h.in
diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc/configure-pagesize-HACK.patch b/meta-oe/recipes-devtools/dmalloc/dmalloc/configure-pagesize-HACK.patch
index 9c928fc438..f7397a6c5c 100644
--- a/meta-oe/recipes-devtools/dmalloc/dmalloc/configure-pagesize-HACK.patch
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc/configure-pagesize-HACK.patch
@@ -4,30 +4,57 @@ We cant run tests during cross compile therefore pin to 4k pages
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: dmalloc-5.5.2/configure.ac
-===================================================================
---- dmalloc-5.5.2.orig/configure.ac
-+++ dmalloc-5.5.2/configure.ac
-@@ -348,26 +348,8 @@ AC_MSG_RESULT([$ac_cv_use_mmap])
+diff --git a/configure.ac b/configure.ac
+--- a/configure.ac
++++ b/configure.ac
+@@ -390,54 +390,8 @@
  #
  AC_CHECK_FUNCS(getpagesize)
  AC_MSG_CHECKING([basic-block size])
 -ac_cv_page_size=0
 -if test $ac_cv_page_size = 0; then
--   AC_RUN_IFELSE([main() { if (getpagesize()<=2048) exit(0); else exit(1); }],
--	[ ac_cv_page_size=11 ] )
+-   AC_RUN_IFELSE([AC_LANG_SOURCE([
+-#if HAVE_UNISTD_H
+-  #include <unistd.h>
+-#endif
+-int main() { if (getpagesize()<=2048) return 0; else return 1; }
+-])],
+-	[ ac_cv_page_size=11 ],
+-	[ ac_cv_page_size=0  ],
+-	[ ac_cv_page_size=0  ] )
 -fi
 -if test $ac_cv_page_size = 0; then
--   AC_RUN_IFELSE([main() { if (getpagesize()<=4096) exit(0); else exit(1); }],
--	[ ac_cv_page_size=12 ] )
+-   AC_RUN_IFELSE([AC_LANG_SOURCE([
+-#if HAVE_UNISTD_H
+-  #include <unistd.h>
+-#endif
+-int main() { if (getpagesize()<=4096) return 0; else return 1; }
+-])],
+-	[ ac_cv_page_size=12 ],
+-	[ ac_cv_page_size=0  ],
+-	[ ac_cv_page_size=0  ] )
 -fi
 -if test $ac_cv_page_size = 0; then
--   AC_RUN_IFELSE([main() { if (getpagesize()<=8192) exit(0); else exit(1); }],
--	[ ac_cv_page_size=13 ] )
+-   AC_RUN_IFELSE([AC_LANG_SOURCE([
+-#if HAVE_UNISTD_H
+-  #include <unistd.h>
+-#endif
+-int main() { if (getpagesize()<=8192) return 0; else return 1; }
+-])],
+-	[ ac_cv_page_size=13 ],
+-	[ ac_cv_page_size=0  ],
+-	[ ac_cv_page_size=0  ] )
 -fi
 -if test $ac_cv_page_size = 0; then
--   AC_RUN_IFELSE([main() { if (getpagesize()<=16384) exit(0); else exit(1); }],
--	[ ac_cv_page_size=14 ] )
+-   AC_RUN_IFELSE([AC_LANG_SOURCE([
+-#if HAVE_UNISTD_H
+-  #include <unistd.h>
+-#endif
+-int main() { if (getpagesize()<=16384) return 0; else return 1; }
+-])],
+-	[ ac_cv_page_size=14 ],
+-	[ ac_cv_page_size=0  ],
+-	[ ac_cv_page_size=0  ] )
 -fi
 -if test $ac_cv_page_size = 0; then
 -    ac_cv_page_size=15
diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc_5.5.2.bb b/meta-oe/recipes-devtools/dmalloc/dmalloc_5.6.5.bb
similarity index 91%
rename from meta-oe/recipes-devtools/dmalloc/dmalloc_5.5.2.bb
rename to meta-oe/recipes-devtools/dmalloc/dmalloc_5.6.5.bb
index 79252f94ae..7672d6e399 100644
--- a/meta-oe/recipes-devtools/dmalloc/dmalloc_5.5.2.bb
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc_5.6.5.bb
@@ -13,7 +13,7 @@ file/line number reporting, and general logging of statistics."
 HOMEPAGE = "http://dmalloc.com/"
 LICENSE = "CC-BY-SA-3.0"
 
-LIC_FILES_CHKSUM = "file://dmalloc.c;beginline=4;endline=17;md5=83d13664f87f1f1a3b6b2b6f6eba85aa"
+LIC_FILES_CHKSUM = "file://dmalloc.c;beginline=4;endline=17;md5=26436803f036fe80336e29531eca3169"
 
 SECTION = "libs"
 
@@ -28,7 +28,7 @@ SRC_URI = "http://dmalloc.com/releases/dmalloc-${PV}.tgz \
            file://0001-undefined-strdup-macro.patch \
 "
 
-SRC_URI[sha256sum] = "d3be5c6eec24950cb3bd67dbfbcdf036f1278fae5fd78655ef8cdf9e911e428a"
+SRC_URI[sha256sum] = "480e3414ab6cedca837721c756b7d64b01a84d2d0e837378d98444e2f63a7c01"
 
 ARM_INSTRUCTION_SET = "arm"
 

