Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6D1E271C29
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Dec 2016 03:04:28 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y68so14358220pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2016 19:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UM//R8KPKwqEkcCNWgDGD1bVq7zVNpGbjfeZRzSiIxU=;
	b=mIFIDeTU7xdy0aB1Eeh/nLD03vjxQ0V69U9XVAjBQZ/RnPPjd+29jD+mQPc7+0H9Ty
	Dz+a8mvCt7iX32EjuWit7fMEde9WT2nmZS0fMYm2rucprrC+4qAnmmffdIRlEAF8pTSO
	cCtbP2CzuFAGiOrBADL1GLgBLzags4PEYzmSHxqRYwW+k0kGEs+burBe1jZamlem4eMf
	jjwajYj3hnLqtkCj4eU5mUnctbFQTEGkyODlTaQJfhOKadf6QPIYvMg0A7M4mhxDqlm0
	A3u//EaiKB8xRV/oav2h/0KJi2n03P6GJws7mXU+TY6QuYU/Dgs9naQrcQu2AH7nxATK
	o8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UM//R8KPKwqEkcCNWgDGD1bVq7zVNpGbjfeZRzSiIxU=;
	b=MNfXWNh8+zY3S+XTqFsIxrzhRqVVFYHE8NbSXSEf9Ea2qFy2aCoE/y2DzYKm0AgTlo
	yV+o4Iflmn1xoH33O0VNl587HlQUN0C/CjKCxAO/2Vyupi1qgX95auMuEfivtPqcO6sZ
	ENjOedWHkdaFbIX5UQOtQ9fFfP9uEgmEGlPIZtsok1zQAdKDlXt5qHiyomZ7U+FKLzLJ
	MHBCRNvo05wZD6DnOoqPabJUoiBXSRDER0oqYhSz4/Gzm7aj0SCWYyVwsDzYQ+s5L6/5
	oFXqHcOHblhN0fSM98eI/GlvVacex8F5PtlEFn4vT6ArpCjG+viNgdO6wpHt7seRHo1e
	MNSg==
X-Gm-Message-State: AKaTC00XpKZts46CjCpsUoMdC6ghs1y1bkxH2I1ej1aBjXy3f9Tim+GwWZOEavarqildrA==
X-Received: by 10.99.211.21 with SMTP id b21mr39086978pgg.120.1480734269903;
	Fri, 02 Dec 2016 19:04:29 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	186sm10624342pfv.61.2016.12.02.19.04.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Dec 2016 19:04:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Dec 2016 19:04:17 -0800
Message-Id: <20161203030422.17285-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161203030422.17285-1-raj.khem@gmail.com>
References: <20161203030422.17285-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/8] dmalloc: Add recipe
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
X-List-Received-Date: Sat, 03 Dec 2016 03:04:29 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../dmalloc/0001-undefined-strdup-macro.patch      |  29 ++
 .../dmalloc/dmalloc/02-Makefile.in.patch           | 312 +++++++++++++++++++++
 .../dmalloc/dmalloc/03-threads.patch               |  18 ++
 .../dmalloc/dmalloc/100-use-xtools.patch           | 109 +++++++
 .../dmalloc/13-fix-ldflags-in-makefile.patch       |  38 +++
 .../dmalloc/dmalloc/130-mips.patch                 |  90 ++++++
 .../dmalloc/dmalloc/150-use_DESTDIR.patch          | 104 +++++++
 .../dmalloc/dmalloc/configure-pagesize-HACK.patch  |  37 +++
 meta-oe/recipes-devtools/dmalloc/dmalloc_5.5.2.bb  |  39 +++
 9 files changed, 776 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/dmalloc/dmalloc/0001-undefined-strdup-macro.patch
 create mode 100644 meta-oe/recipes-devtools/dmalloc/dmalloc/02-Makefile.in.patch
 create mode 100644 meta-oe/recipes-devtools/dmalloc/dmalloc/03-threads.patch
 create mode 100644 meta-oe/recipes-devtools/dmalloc/dmalloc/100-use-xtools.patch
 create mode 100644 meta-oe/recipes-devtools/dmalloc/dmalloc/13-fix-ldflags-in-makefile.patch
 create mode 100644 meta-oe/recipes-devtools/dmalloc/dmalloc/130-mips.patch
 create mode 100644 meta-oe/recipes-devtools/dmalloc/dmalloc/150-use_DESTDIR.patch
 create mode 100644 meta-oe/recipes-devtools/dmalloc/dmalloc/configure-pagesize-HACK.patch
 create mode 100644 meta-oe/recipes-devtools/dmalloc/dmalloc_5.5.2.bb

diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc/0001-undefined-strdup-macro.patch b/meta-oe/recipes-devtools/dmalloc/dmalloc/0001-undefined-strdup-macro.patch
new file mode 100644
index 0000000..ea940e9
--- /dev/null
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc/0001-undefined-strdup-macro.patch
@@ -0,0 +1,29 @@
+From 9c2438e85e4d7deb9422be257a25e8ab16093821 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Dec 2016 14:02:02 -0800
+Subject: [PATCH] undefined strdup macro
+
+build fails due to strdup define in string2.h
+system header.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ dmalloc.h.3 | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/dmalloc.h.3 b/dmalloc.h.3
+index 8bda997..b70c07e 100644
+--- a/dmalloc.h.3
++++ b/dmalloc.h.3
+@@ -1,5 +1,8 @@
+ /* NOTE: start of $Id: dmalloc.h.4,v 1.15 2007/05/14 17:23:37 gray Exp $ */
+ 
++#undef strndup
++#undef strdup
++
+ /* dmalloc version defines */
+ #define DMALLOC_VERSION_MAJOR	5	/* X.0.0 */
+ #define DMALLOC_VERSION_MINOR	5	/* 0.X.0 */
+-- 
+2.10.2
+
diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc/02-Makefile.in.patch b/meta-oe/recipes-devtools/dmalloc/dmalloc/02-Makefile.in.patch
new file mode 100644
index 0000000..967643b
--- /dev/null
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc/02-Makefile.in.patch
@@ -0,0 +1,312 @@
+Description: Changes for building shared libraries
+ This patch includes changes for building shared libraries with PIC object
+ files and the correct soname and libname.
+Author: Daniel Rus Morales <danirus@tol-project.org>
+
+Index: dmalloc-5.5.2/Makefile.in
+===================================================================
+--- dmalloc-5.5.2.orig/Makefile.in
++++ dmalloc-5.5.2/Makefile.in
+@@ -41,7 +41,7 @@ LIBRARY	= lib$(MODULE).a
+ 
+ # thread version of the library
+ LIB_TH	= lib$(MODULE)th.a
+-LIB_TH_SL = lib$(MODULE)th.@shlibext@
++LIB_TH_SL = lib$(MODULE)th.@shlibext@.5.5.2
+ @TH_ON@BUILD_ALL_1 = threads
+ @TH_ON@INSTALL_LIB_1 = installth
+ @SL_ON@BUILD_THREADS_1 = $(LIB_TH_SL)
+@@ -50,8 +50,8 @@ LIB_TH_SL = lib$(MODULE)th.@shlibext@
+ @TH_ON@@SL_ON@INSTALL_LIB_2 = installthsl
+ 
+ # C++ version of the library
+-LIB_CXX	= lib$(MODULE)xx.a
+-LIB_CXX_SL = lib$(MODULE)xx.@shlibext@
++LIB_CXX	= lib$(MODULE)cxx.a
++LIB_CXX_SL = lib$(MODULE)cxx.@shlibext@.5.5.2
+ @CXX_ON@BUILD_ALL_3 = $(LIB_CXX)
+ @CXX_ON@INSTALL_LIB_3 = installcxx
+ @SL_ON@BUILD_CXX_3 = $(LIB_CXX_SL)
+@@ -61,7 +61,7 @@ LIB_CXX_SL = lib$(MODULE)xx.@shlibext@
+ 
+ # threads + C++
+ LIB_TH_CXX = lib$(MODULE)thcxx.a
+-LIB_TH_CXX_SL = lib$(MODULE)thcxx.@shlibext@
++LIB_TH_CXX_SL = lib$(MODULE)thcxx.@shlibext@.5.5.2
+ @TH_ON@@CXX_ON@BUILD_ALL_5 = $(LIB_TH_CXX)
+ @TH_ON@@CXX_ON@INSTALL_LIB_5 = installthcxx
+ @TH_ON@BUILD_CXX_5 = $(LIB_TH_CXX)
+@@ -76,7 +76,7 @@ LIB_TH_CXX_SL = lib$(MODULE)thcxx.@shlib
+ @CXX_ON@@SL_ON@INSTALL_THREADS_6 = installthcxxsl
+ 
+ # shared versions of the libraries
+-LIB_SL = lib$(MODULE).@shlibext@
++LIB_SL = lib$(MODULE).@shlibext@.5.5.2
+ @SL_ON@BUILD_ALL_7 = $(LIB_SL)
+ @SL_ON@INSTALL_LIB_7 = installsl
+ @SL_ON@BUILD_TH_CXX_7 = $(LIB_TH_CXX_SL)
+@@ -145,9 +145,13 @@ SHELL = /bin/sh
+ 
+ HFLS = dmalloc.h
+ OBJS = arg_check.o compat.o dmalloc_rand.o dmalloc_tab.o env.o heap.o
++OBJS_SL = arg_check_sl.o compat_sl.o dmalloc_rand_sl.o dmalloc_tab_sl.o env_sl.o heap_sl.o
+ NORMAL_OBJS = chunk.o error.o malloc.o
++NORMAL_OBJS_SL = chunk_sl.o error_sl.o malloc_sl.o
+ THREAD_OBJS = chunk_th.o error_th.o malloc_th.o
++THREAD_OBJS_SL = chunk_th_sl.o error_th_sl.o malloc_th_sl.o
+ CXX_OBJS = dmallocc.o
++CXX_OBJS_SL = dmallocc_sl.o
+ 
+ CFLAGS = $(CCFLAGS)
+ TEST = $(MODULE)_t
+@@ -160,9 +164,9 @@ all : $(BUILD_ALL)
+ 
+ clean :
+ 	rm -f $(A_OUT) core *.o *.t
+-	rm -f $(LIBRARY) $(LIB_TH) $(LIB_CXX) $(LIB_TH_CXX) $(TEST) $(TEST_FC)
+-	rm -f $(LIB_TH_SL) $(LIB_CXX_SL) $(LIB_TH_CXX_SL) $(LIB_SL)
++	rm -f $(TEST) $(TEST_FC)
+ 	rm -f $(UTIL) dmalloc.h
++	rm -f lib$(MODULE)*.*
+ 
+ realclean : clean
+ 
+@@ -181,43 +185,43 @@ installincs : $(HFLS)
+ 	$(INSTALL_DATA) $(HFLS) $(includedir)
+ 
+ installthsl : $(LIB_TH_SL)
+-	$(srcdir)/mkinstalldirs $(libdir)
+-	$(INSTALL_PROGRAM) $(LIB_TH_SL) $(libdir)
++	$(srcdir)/mkinstalldirs $(shlibdir)
++	$(INSTALL) $(LIB_TH_SL) $(shlibdir)
+ 
+ installth : $(INSTALL_THREADS)
+ 	$(srcdir)/mkinstalldirs $(libdir)
+-	$(INSTALL_PROGRAM) $(LIB_TH) $(libdir)
++	$(INSTALL) $(LIB_TH) $(libdir)
+ @CXX_OFF@	@echo "Enter 'make installthcxx' to install the threaded C++ library"
+ @SL_OFF@	@echo "Enter 'make installthsl' to install the threaded shared-library"
+ 
+ installthcxxsl : $(LIB_TH_CXX_SL)
+ 	$(srcdir)/mkinstalldirs $(shlibdir)
+-	$(INSTALL_PROGRAM) $(LIB_TH_CXX_SL) $(shlibdir)
++	$(INSTALL) $(LIB_TH_CXX_SL) $(shlibdir)
+ 
+ installthcxx : $(INSTALL_TH_CXX)
+ 	$(srcdir)/mkinstalldirs $(libdir)
+-	$(INSTALL_PROGRAM) $(LIB_TH_CXX) $(libdir)
++	$(INSTALL) $(LIB_TH_CXX) $(libdir)
+ @SL_OFF@	@echo "Enter 'make installthcxxsl' to install the threaded C++ shared-library"
+ 
+ installcxxsl : $(LIB_CXX_SL)
+-	$(srcdir)/mkinstalldirs $(libdir)
+-	$(INSTALL_PROGRAM) $(LIB_CXX_SL) $(libdir)
++	$(srcdir)/mkinstalldirs $(shlibdir)
++	$(INSTALL) $(LIB_CXX_SL) $(shlibdir)
+ 
+ installcxx : $(INSTALL_CXX)
+ 	$(srcdir)/mkinstalldirs $(libdir)
+-	$(INSTALL_PROGRAM) $(LIB_CXX) $(libdir)
++	$(INSTALL) $(LIB_CXX) $(libdir)
+ @TH_OFF@	@echo "Enter 'make installthcxx' to install the threaded C++ library"
+ @SL_OFF@	@echo "Enter 'make installcxxsl' to install the C++ shared-library"
+ 
+ installsl : $(LIB_SL)
+ 	$(srcdir)/mkinstalldirs $(shlibdir)
+-	$(INSTALL_PROGRAM) $(LIB_SL) $(shlibdir)
++	$(INSTALL) $(LIB_SL) $(shlibdir)
+ @CXX_OFF@	@echo "Enter 'make installcxxsl' to install the C++ shared-library"
+ @TH_OFF@	@echo "Enter 'make installthsl' to install thread shared-library"
+ 
+ installlib : $(INSTALL_LIB)
+ 	$(srcdir)/mkinstalldirs $(libdir)
+-	$(INSTALL_PROGRAM) $(LIBRARY) $(libdir)
++	$(INSTALL) $(LIBRARY) $(libdir)
+ 	@RANLIB@ $(libdir)/$(LIBRARY)
+ @SL_OFF@	@echo "Enter 'make installsl' to install $(LIB_SL) in $(shlibdir)"
+ @CXX_OFF@	@echo "Enter 'make installcxx' to install the C++ library"
+@@ -255,10 +259,8 @@ shlib : $(BUILD_SL)
+ # NOTE: you may have to edit the configure.ac script to get this to
+ # work on your operating system.  Please send feedback to the author
+ # via: http://256.com/gray/email.html
+-$(LIB_SL) : $(LIBRARY)
+-	rm -f $@ $@.t
+-	@shlinkargs@ $(LIBRARY) $(OBJS) $(NORMAL_OBJS)
+-	mv $@.t $@
++$(LIB_SL) : $(OBJS_SL) $(NORMAL_OBJS_SL)
++	$(CC) -shared -Wl,-soname,libdmalloc.so.5 -o $@ $(OBJS_SL) $(NORMAL_OBJS_SL)
+ 
+ $(LIBRARY) : $(OBJS) $(NORMAL_OBJS)
+ 	ar cr $@ $?
+@@ -268,32 +270,26 @@ $(LIB_TH) : $(OBJS) $(THREAD_OBJS)
+ 	ar cr $@ $?
+ 	@RANLIB@ $@
+ 
+-$(LIB_TH_SL) : $(LIB_TH)
+-	rm -f $@ $@.t
+-	@shlinkargs@ $(LIB_TH) $(OBJS) $(THREAD_OBJS)
+-	mv $@.t $@
++$(LIB_TH_SL) : $(OBJS_SL) $(THREAD_OBJS_SL)
++	$(CC) -shared -Wl,-soname,libdmallocth.so.5 -o $@ $(OBJS_SL) $(THREAD_OBJS_SL)
+ 
+ $(LIB_CXX) : $(OBJS) $(NORMAL_OBJS) $(CXX_OBJS)
+ 	ar cr $@ $?
+ 	@RANLIB@ $@
+ 
+-$(LIB_CXX_SL) : $(LIB_CXX)
+-	rm -f $@ $@.t
+-	@shlinkargs@ $(LIB_CXX) $(OBJS) $(NORMAL_OBJS) $(CXX_OBJS)
+-	mv $@.t $@
++$(LIB_CXX_SL) : $(OBJS_SL) $(NORMAL_OBJS_SL) $(CXX_OBJS_SL)
++	$(CC) -shared -Wl,-soname,libdmalloccxx.so.5 -o $@ $(OBJS_SL) $(NORMAL_OBJS_SL) $(CXX_OBJS_SL)
+ 
+ $(LIB_TH_CXX) : $(OBJS) $(THREAD_OBJS) $(CXX_OBJS)
+ 	ar cr $@ $?
+ 	@RANLIB@ $@
+ 
+-$(LIB_TH_CXX_SL) : $(LIB_TH_CXX)
+-	rm -f $@ $@.t
+-	@shlinkargs@ $(LIB_TH_CXX) $(OBJS) $(THREAD_OBJS) $(CXX_OBJS)
+-	mv $@.t $@
++$(LIB_TH_CXX_SL) : $(OBJS_SL) $(THREAD_OBJS_SL) $(CXX_OBJS_SL)
++	$(CC) -shared -Wl,-soname,libdmallocthcxx.so.5 -o $@ $(OBJS_SL) $(THREAD_OBJS_SL) $(CXX_OBJS_SL)
+ 
+-threadssl : $(LIB_TH_SL)
++threadssl : $(LIB_TH_SL)$(ver)
+ 
+-threadscxxsl : $(LIB_TH_CXX_SL)
++threadscxxsl : $(LIB_TH_CXX_SL)$(ver)
+ 
+ threadscxx : $(BUILD_TH_CXX)
+ @SL_OFF@	@echo "Enter 'make threadscxxsl' to build the threaded C++ shared-library"
+@@ -302,7 +298,7 @@ threads : $(BUILD_THREADS)
+ @CXX_OFF@	@echo "Enter 'make threadscxx' to build the threaded C++ library"
+ @SL_OFF@	@echo "Enter 'make threadssl' to build the threaded shared library"
+ 
+-cxxsl :  $(LIB_CXX_SL)
++cxxsl :  $(LIB_CXX_SL)$(ver)
+ 
+ cxx : $(BUILD_CXX)
+ @SL_OFF@	@echo "Enter 'make cxxsl' to build the cxx shared library"
+@@ -371,6 +367,11 @@ dmallocc.o : $(srcdir)/dmallocc.cc
+ 	$(CXX) $(CFLAGS) $(CPPFLAGS) $(DEFS) $(INCS) -c $(srcdir)/dmallocc.cc \
+ 		-o ./$@
+ 
++dmallocc_sl.o : $(srcdir)/dmallocc.cc
++	rm -f $@
++	$(CXX) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $(srcdir)/dmallocc.cc \
++		-o ./$@
++
+ #
+ # auto configure settings - uncomment if you are doing configure
+ # development on the library
+@@ -395,38 +396,109 @@ dmallocc.o : $(srcdir)/dmallocc.cc
+ 
+ arg_check.o: arg_check.c conf.h settings.h dmalloc.h chunk.h debug_tok.h \
+   dmalloc_loc.h error.h arg_check.h
++arg_check_sl.o: arg_check.c conf.h settings.h dmalloc.h chunk.h debug_tok.h \
++  dmalloc_loc.h error.h arg_check.h
++	rm -f $@
++	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
+ chunk.o: chunk.c conf.h settings.h dmalloc.h chunk.h chunk_loc.h \
+   dmalloc_loc.h compat.h debug_tok.h dmalloc_rand.h dmalloc_tab.h error.h \
+   error_val.h heap.h
++chunk_sl.o: chunk.c conf.h settings.h dmalloc.h chunk.h chunk_loc.h \
++  dmalloc_loc.h compat.h debug_tok.h dmalloc_rand.h dmalloc_tab.h error.h \
++  error_val.h heap.h
++	rm -f $@
++	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
+ compat.o: compat.c conf.h settings.h dmalloc.h compat.h dmalloc_loc.h
++compat_sl.o: compat.c conf.h settings.h dmalloc.h compat.h dmalloc_loc.h
++	rm -f $@
++	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
+ dmalloc.o: dmalloc.c conf.h settings.h dmalloc_argv.h dmalloc.h compat.h \
+   debug_tok.h dmalloc_loc.h env.h error_val.h version.h
++dmalloc_sl.o: dmalloc.c conf.h settings.h dmalloc_argv.h dmalloc.h compat.h \
++  debug_tok.h dmalloc_loc.h env.h error_val.h version.h
++	rm -f $@
++	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
+ dmalloc_argv.o: dmalloc_argv.c conf.h settings.h dmalloc_argv.h \
+   dmalloc_argv_loc.h compat.h
++dmalloc_argv_sl.o: dmalloc_argv.c conf.h settings.h dmalloc_argv.h \
++  dmalloc_argv_loc.h compat.h
++	rm -f $@
++	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
+ dmalloc_fc_t.o: dmalloc_fc_t.c conf.h settings.h dmalloc.h dmalloc_argv.h \
+   dmalloc_rand.h debug_tok.h dmalloc_loc.h error_val.h
++dmalloc_fc_t_sl.o: dmalloc_fc_t.c conf.h settings.h dmalloc.h dmalloc_argv.h \
++  dmalloc_rand.h debug_tok.h dmalloc_loc.h error_val.h
++	rm -f $@
++	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
+ dmalloc_rand.o: dmalloc_rand.c dmalloc_rand.h
++dmalloc_rand_sl.o: dmalloc_rand.c dmalloc_rand.h
++	rm -f $@
++	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
+ dmalloc_t.o: dmalloc_t.c conf.h settings.h compat.h dmalloc.h \
+   dmalloc_argv.h dmalloc_rand.h arg_check.h debug_tok.h dmalloc_loc.h \
+   error_val.h heap.h
++dmalloc_t_sl.o: dmalloc_t.c conf.h settings.h compat.h dmalloc.h \
++  dmalloc_argv.h dmalloc_rand.h arg_check.h debug_tok.h dmalloc_loc.h \
++  error_val.h heap.h
++	rm -f $@
++	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
+ dmalloc_tab.o: dmalloc_tab.c conf.h settings.h chunk.h compat.h dmalloc.h \
+   dmalloc_loc.h error.h error_val.h dmalloc_tab.h dmalloc_tab_loc.h
++dmalloc_tab_sl.o: dmalloc_tab.c conf.h settings.h chunk.h compat.h dmalloc.h \
++  dmalloc_loc.h error.h error_val.h dmalloc_tab.h dmalloc_tab_loc.h
++	rm -f $@
++	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
+ env.o: env.c conf.h settings.h dmalloc.h compat.h dmalloc_loc.h \
+   debug_tok.h env.h error.h
++env_sl.o: env.c conf.h settings.h dmalloc.h compat.h dmalloc_loc.h \
++  debug_tok.h env.h error.h
++	rm -f $@
++	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
+ error.o: error.c conf.h settings.h dmalloc.h chunk.h compat.h debug_tok.h \
+   dmalloc_loc.h env.h error.h error_val.h version.h
++error_sl.o: error.c conf.h settings.h dmalloc.h chunk.h compat.h debug_tok.h \
++  dmalloc_loc.h env.h error.h error_val.h version.h
++	rm -f $@
++	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
+ heap.o: heap.c conf.h settings.h dmalloc.h chunk.h compat.h debug_tok.h \
+   dmalloc_loc.h error.h error_val.h heap.h
++heap_sl.o: heap.c conf.h settings.h dmalloc.h chunk.h compat.h debug_tok.h \
++  dmalloc_loc.h error.h error_val.h heap.h
++	rm -f $@
++	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
+ malloc.o: malloc.c conf.h settings.h dmalloc.h chunk.h compat.h \
+   debug_tok.h dmalloc_loc.h env.h error.h error_val.h heap.h \
+   malloc_funcs.h return.h
++malloc_sl.o: malloc.c conf.h settings.h dmalloc.h chunk.h compat.h \
++  debug_tok.h dmalloc_loc.h env.h error.h error_val.h heap.h \
++  malloc_funcs.h return.h
++	rm -f $@
++	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
+ protect.o: protect.c conf.h settings.h dmalloc.h dmalloc_loc.h error.h \
+   heap.h protect.h
++protect_sl.o: protect.c conf.h settings.h dmalloc.h dmalloc_loc.h error.h \
++  heap.h protect.h
++	rm -f $@
++	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
+ chunk_th.o: chunk.c conf.h settings.h dmalloc.h chunk.h chunk_loc.h \
+   dmalloc_loc.h compat.h debug_tok.h dmalloc_rand.h dmalloc_tab.h error.h \
+   error_val.h heap.h
++chunk_th_sl.o: chunk.c conf.h settings.h dmalloc.h chunk.h chunk_loc.h \
++  dmalloc_loc.h compat.h debug_tok.h dmalloc_rand.h dmalloc_tab.h error.h \
++  error_val.h heap.h
++	rm -f $@
++	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
+ error_th.o: error.c conf.h settings.h dmalloc.h chunk.h compat.h debug_tok.h \
+   dmalloc_loc.h env.h error.h error_val.h version.h
++error_th_sl.o: error.c conf.h settings.h dmalloc.h chunk.h compat.h debug_tok.h \
++  dmalloc_loc.h env.h error.h error_val.h version.h
++	rm -f $@
++	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
+ malloc_th.o: malloc.c conf.h settings.h dmalloc.h chunk.h compat.h \
+   debug_tok.h dmalloc_loc.h env.h error.h error_val.h heap.h \
+   malloc_funcs.h return.h
++malloc_th_sl.o: malloc.c conf.h settings.h dmalloc.h chunk.h compat.h \
++  debug_tok.h dmalloc_loc.h env.h error.h error_val.h heap.h \
++  malloc_funcs.h return.h
++	rm -f $@
++	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc/03-threads.patch b/meta-oe/recipes-devtools/dmalloc/dmalloc/03-threads.patch
new file mode 100644
index 0000000..be09452
--- /dev/null
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc/03-threads.patch
@@ -0,0 +1,18 @@
+Description: Fix LOCK_THREADS in settings.dist
+ This patch takes into account that if --enable-threads is used, LOCK_THREADS
+ doesn't get updated
+Author: Markus Stenberg <markus.stenberg@conformiq.com>
+Author: Daniel Rus Morales <danirus@tol-project.org>
+Bug-Debian: http://bugs.debian.org/276457
+
+--- dmalloc-5.5.1.orig/settings.dist	2007-03-25 21:16:43.000000000 +0200
++++ dmalloc-5.5.1/settings.dist	2007-04-27 20:56:49.000000000 +0200
+@@ -409,7 +409,7 @@
+  */
+ 
+ #ifndef LOCK_THREADS
+-#define LOCK_THREADS 0
++#define LOCK_THREADS 1
+ #endif
+ 
+ #if LOCK_THREADS
diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc/100-use-xtools.patch b/meta-oe/recipes-devtools/dmalloc/dmalloc/100-use-xtools.patch
new file mode 100644
index 0000000..e1db690
--- /dev/null
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc/100-use-xtools.patch
@@ -0,0 +1,109 @@
+This patch makes configure use the cross ld and ar rather than the native tools.
+
+It was build up by Yann E. MORIN <yann.morin.1998@anciens.enib.fr> from some
+bits gathered from buildroot, which is LGPL v2.1
+License for dmalloc is:
+ * Permission to use, copy, modify, and distribute this software for
+ * any purpose and without fee is hereby granted, provided that the
+ * above copyright notice and this permission notice appear in all
+ * copies, and that the name of Gray Watson not be used in advertising
+ * or publicity pertaining to distribution of the document or software
+ * without specific, written prior permission.
+ *
+ * Gray Watson makes no representations about the suitability of the
+ * software described herein for any purpose.  It is provided "as is"
+ * without express or implied warranty.
+
+I personnaly believe that the resulting code should therefore be
+LGPL v2.1, but don't believe me, ask your lawyers!
+
+Index: dmalloc-5.5.2/configure.ac
+===================================================================
+--- dmalloc-5.5.2.orig/configure.ac
++++ dmalloc-5.5.2/configure.ac
+@@ -69,6 +69,15 @@ if test "$ac_cv_prog_cc_stdc" = "no" ; t
+ fi
+ AC_PROG_INSTALL
+ AC_PROG_RANLIB
++AN_MAKEVAR([AR], [AC_PROG_AR])
++AN_PROGRAM([ar], [AC_PROG_AR])
++AC_DEFUN([AC_PROG_AR], [AC_CHECK_TOOL(AR, ar, :)])
++AC_PROG_AR
++AN_MAKEVAR([LD], [AC_PROG_LD])
++AN_PROGRAM([ld], [AC_PROG_LD])
++AC_DEFUN([AC_PROG_LD], [AC_CHECK_TOOL(LD, ld, :)])
++AC_PROG_LD
++
+ AC_C_CONST
+ 
+ # we need this for various settings
+@@ -131,14 +140,14 @@ AC_SUBST(shlibdir)
+ AC_MSG_CHECKING([shared library link args])
+ AC_COMPILE_IFELSE([ int foo(int val) { return val + 1; } ],[
+ 	# so now we try to create an archive from the compiled .o file
+-	(ar cr conftest.a conftest.o) 2>&5
++	(${ac_cv_prog_AR} cr conftest.a conftest.o) 2>&5
+ 	# see which shared-library ld commands work
+ 	#
+ 	# Darwin/Mac OS X - Terry Teague
+ 	# username terry_teague at domain users.sourceforge.net
+ 	ac_cv_shared_lib_link_objs=no
+ 	if test `uname` = "Darwin"; then
+-          if (ld -dylib -o conftest.so.t -lc conftest.a) 2>&5; then
++          if (${ac_cv_prog_LD} -dylib -o conftest.so.t -lc conftest.a) 2>&5; then
+             # By convention on some platforms
+             # libLLL.so, libLLL.X.so are symlinks to libLLL.X.Y.Z.so
+             # where X.Y.Z is version # (major.minor.increment) of the library
+@@ -156,12 +165,12 @@ AC_COMPILE_IFELSE([ int foo(int val) { r
+             ac_cv_shared_link_args='# Could not configure shlib linking'
+             enable_shlib=no
+           fi
+-       elif (ld -shared --whole-archive -soname conftest.so -o conftest.so.t conftest.a) 2>&5; then
+-		ac_cv_shared_link_args='ld -shared --whole-archive -soname $@ -o $@.t'
+-	elif (ld -shared -o conftest.so.t -all -soname conftest.so.t -none -lc -all conftest.a) 2>&5; then
+-		ac_cv_shared_link_args='ld -shared -o $@.t -all -soname $@ -none -lc -all'
+-	elif (ld -G -o conftest.so.t conftest.a) 2>&5; then
+-		ac_cv_shared_link_args='ld -G -o $@.t'
++        elif (${ac_cv_prog_LD} -shared --whole-archive -soname conftest.so -o conftest.so.t conftest.a) 2>&5; then
++		ac_cv_shared_link_args='${CC} -Wl,-shared -Wl,--whole-archive -Wl,-soname,$@ -o $@.t -Wl,--no-whole-archive'
++	elif (${ac_cv_prog_LD} -shared -o conftest.so.t -all -soname conftest.so.t -none -lc -all conftest.a) 2>&5; then
++		ac_cv_shared_link_args='${CC} -Wl,-shared -o $@.t -Wl,-all -Wl,-soname,$@ -Wl,-none -lc -Wl,-all'
++	elif (${ac_cv_prog_LD} -G -o conftest.so.t conftest.a) 2>&5; then
++		ac_cv_shared_link_args='${CC} -Wl,-G -o $@.t'
+ 	else
+ 		# oh well, toss an error
+ 		ac_cv_shared_link_args='# Could not configure shlib linking'
+Index: dmalloc-5.5.2/Makefile.in
+===================================================================
+--- dmalloc-5.5.2.orig/Makefile.in
++++ dmalloc-5.5.2/Makefile.in
+@@ -263,25 +263,25 @@ $(LIB_SL) : $(OBJS_SL) $(NORMAL_OBJS_SL)
+ 	$(CC) $(LDFLAGS) -shared -Wl,-soname,libdmalloc.so.5 -o $@ $(OBJS_SL) $(NORMAL_OBJS_SL)
+ 
+ $(LIBRARY) : $(OBJS) $(NORMAL_OBJS)
+-	ar cr $@ $?
++	@AR@ cr $@ $?
+ 	@RANLIB@ $@
+ 
+ $(LIB_TH) : $(OBJS) $(THREAD_OBJS)
+-	ar cr $@ $?
++	@AR@ cr $@ $?
+ 	@RANLIB@ $@
+ 
+ $(LIB_TH_SL) : $(OBJS_SL) $(THREAD_OBJS_SL)
+ 	$(CC) $(LDFLAGS) -shared -Wl,-soname,libdmallocth.so.5 -o $@ $(OBJS_SL) $(THREAD_OBJS_SL)
+ 
+ $(LIB_CXX) : $(OBJS) $(NORMAL_OBJS) $(CXX_OBJS)
+-	ar cr $@ $?
++	@AR@ cr $@ $?
+ 	@RANLIB@ $@
+ 
+ $(LIB_CXX_SL) : $(OBJS_SL) $(NORMAL_OBJS_SL) $(CXX_OBJS_SL)
+ 	$(CC) $(LDFLAGS) -shared -Wl,-soname,libdmalloccxx.so.5 -o $@ $(OBJS_SL) $(NORMAL_OBJS_SL) $(CXX_OBJS_SL)
+ 
+ $(LIB_TH_CXX) : $(OBJS) $(THREAD_OBJS) $(CXX_OBJS)
+-	ar cr $@ $?
++	@AR@ cr $@ $?
+ 	@RANLIB@ $@
+ 
+ $(LIB_TH_CXX_SL) : $(OBJS_SL) $(THREAD_OBJS_SL) $(CXX_OBJS_SL)
diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc/13-fix-ldflags-in-makefile.patch b/meta-oe/recipes-devtools/dmalloc/dmalloc/13-fix-ldflags-in-makefile.patch
new file mode 100644
index 0000000..2581e54
--- /dev/null
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc/13-fix-ldflags-in-makefile.patch
@@ -0,0 +1,38 @@
+Index: dmalloc-5.5.2/Makefile.in
+===================================================================
+--- dmalloc-5.5.2.orig/Makefile.in
++++ dmalloc-5.5.2/Makefile.in
+@@ -260,7 +260,7 @@ shlib : $(BUILD_SL)
+ # work on your operating system.  Please send feedback to the author
+ # via: http://256.com/gray/email.html
+ $(LIB_SL) : $(OBJS_SL) $(NORMAL_OBJS_SL)
+-	$(CC) -shared -Wl,-soname,libdmalloc.so.5 -o $@ $(OBJS_SL) $(NORMAL_OBJS_SL)
++	$(CC) $(LDFLAGS) -shared -Wl,-soname,libdmalloc.so.5 -o $@ $(OBJS_SL) $(NORMAL_OBJS_SL)
+ 
+ $(LIBRARY) : $(OBJS) $(NORMAL_OBJS)
+ 	ar cr $@ $?
+@@ -271,21 +271,21 @@ $(LIB_TH) : $(OBJS) $(THREAD_OBJS)
+ 	@RANLIB@ $@
+ 
+ $(LIB_TH_SL) : $(OBJS_SL) $(THREAD_OBJS_SL)
+-	$(CC) -shared -Wl,-soname,libdmallocth.so.5 -o $@ $(OBJS_SL) $(THREAD_OBJS_SL)
++	$(CC) $(LDFLAGS) -shared -Wl,-soname,libdmallocth.so.5 -o $@ $(OBJS_SL) $(THREAD_OBJS_SL)
+ 
+ $(LIB_CXX) : $(OBJS) $(NORMAL_OBJS) $(CXX_OBJS)
+ 	ar cr $@ $?
+ 	@RANLIB@ $@
+ 
+ $(LIB_CXX_SL) : $(OBJS_SL) $(NORMAL_OBJS_SL) $(CXX_OBJS_SL)
+-	$(CC) -shared -Wl,-soname,libdmalloccxx.so.5 -o $@ $(OBJS_SL) $(NORMAL_OBJS_SL) $(CXX_OBJS_SL)
++	$(CC) $(LDFLAGS) -shared -Wl,-soname,libdmalloccxx.so.5 -o $@ $(OBJS_SL) $(NORMAL_OBJS_SL) $(CXX_OBJS_SL)
+ 
+ $(LIB_TH_CXX) : $(OBJS) $(THREAD_OBJS) $(CXX_OBJS)
+ 	ar cr $@ $?
+ 	@RANLIB@ $@
+ 
+ $(LIB_TH_CXX_SL) : $(OBJS_SL) $(THREAD_OBJS_SL) $(CXX_OBJS_SL)
+-	$(CC) -shared -Wl,-soname,libdmallocthcxx.so.5 -o $@ $(OBJS_SL) $(THREAD_OBJS_SL) $(CXX_OBJS_SL)
++	$(CC) $(LDFLAGS) -shared -Wl,-soname,libdmallocthcxx.so.5 -o $@ $(OBJS_SL) $(THREAD_OBJS_SL) $(CXX_OBJS_SL)
+ 
+ threadssl : $(LIB_TH_SL)$(ver)
+ 
diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc/130-mips.patch b/meta-oe/recipes-devtools/dmalloc/dmalloc/130-mips.patch
new file mode 100644
index 0000000..935ac98
--- /dev/null
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc/130-mips.patch
@@ -0,0 +1,90 @@
+Patch to correctly handle the MIPS case.
+
+It was build up by Yann E. MORIN <yann.morin.1998@anciens.enib.fr> from some
+bits gathered from buildroot, which is LGPL v2.1
+License for dmalloc is:
+ * Permission to use, copy, modify, and distribute this software for
+ * any purpose and without fee is hereby granted, provided that the
+ * above copyright notice and this permission notice appear in all
+ * copies, and that the name of Gray Watson not be used in advertising
+ * or publicity pertaining to distribution of the document or software
+ * without specific, written prior permission.
+ *
+ * Gray Watson makes no representations about the suitability of the
+ * software described herein for any purpose.  It is provided "as is"
+ * without express or implied warranty.
+
+I personnaly believe that the resulting code should therefore be
+LGPL v2.1, but don't believe me, ask your lawyers!
+
+Index: dmalloc-5.5.2/return.h
+===================================================================
+--- dmalloc-5.5.2.orig/return.h
++++ dmalloc-5.5.2/return.h
+@@ -106,26 +106,16 @@
+ /*************************************/
+ 
+ /*
+- * For DEC Mips machines running Ultrix
++ * For Mips machines running Linux
+  */
+ #if __mips
+ 
+ /*
+- * I have no idea how to get inline assembly with the default cc.
+- * Anyone know how?
+- */
+-
+-#if 0
+-
+-/*
+  * NOTE: we assume here that file is global.
+  *
+- * $31 is the frame pointer.  $2 looks to be the return address but maybe
+- * not consistently.
++ * $31 is the return address.
+  */
+-#define GET_RET_ADDR(file)	asm("sw $2, file")
+-
+-#endif
++#define GET_RET_ADDR(file)	asm("sw $31, %0" : "=m" (file))
+ 
+ #endif /* __mips */
+ 
+Index: dmalloc-5.5.2/configure.ac
+===================================================================
+--- dmalloc-5.5.2.orig/configure.ac
++++ dmalloc-5.5.2/configure.ac
+@@ -585,31 +585,7 @@ int main() { return 1; }
+ # check if the return.h macros work
+ #
+ AC_MSG_CHECKING([return.h macros work])
+-AC_RUN_IFELSE([
+-
+-#define __CONF_H__
+-#define USE_RETURN_MACROS 1
+-#define RETURN_MACROS_WORK 1
+-
+-#include "return.h"
+-
+-static void foo (void)
+-{
+-  char	*ret_addr;
+-  GET_RET_ADDR(ret_addr);
+-}
+-
+-main()
+-{
+-  foo();
+-  exit(0);
+-}
+-],
+-[ AC_DEFINE(RETURN_MACROS_WORK, 1) AC_MSG_RESULT([yes]) ],
+-[ AC_DEFINE(RETURN_MACROS_WORK, 0) AC_MSG_RESULT([no]) ],
+-[ AC_DEFINE(RETURN_MACROS_WORK, 0) AC_MSG_RESULT([no]) ]
+-)
+-
++AC_DEFINE(RETURN_MACROS_WORK, 1)
+ ##############################################################################
+ 
+ #
diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc/150-use_DESTDIR.patch b/meta-oe/recipes-devtools/dmalloc/dmalloc/150-use_DESTDIR.patch
new file mode 100644
index 0000000..7edd464
--- /dev/null
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc/150-use_DESTDIR.patch
@@ -0,0 +1,104 @@
+Make install rules use DESTDIR.
+Split installation of the utilitity from the global install.
+
+Copyright 2007 Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
+Licensed to you as dmalloc-5.5.2 is.
+
+Index: dmalloc-5.5.2/Makefile.in
+===================================================================
+--- dmalloc-5.5.2.orig/Makefile.in
++++ dmalloc-5.5.2/Makefile.in
+@@ -178,66 +178,66 @@ distclean : clean
+ #	rm -f configure
+ 
+ installdirs :
+-	$(srcdir)/mkinstalldirs $(includedir) $(libdir) $(bindir)
++	$(srcdir)/mkinstalldirs $(DESTDIR)/$(includedir) $(DESTDIR)/$(libdir) $(DESTDIR)/$(bindir)
+ 
+ installincs : $(HFLS)
+-	$(srcdir)/mkinstalldirs $(includedir)
+-	$(INSTALL_DATA) $(HFLS) $(includedir)
++	$(srcdir)/mkinstalldirs $(DESTDIR)/$(includedir)
++	$(INSTALL_DATA) $(HFLS) $(DESTDIR)/$(includedir)
+ 
+ installthsl : $(LIB_TH_SL)
+-	$(srcdir)/mkinstalldirs $(shlibdir)
+-	$(INSTALL) $(LIB_TH_SL) $(shlibdir)
++	$(srcdir)/mkinstalldirs $(DESTDIR)/$(shlibdir)
++	$(INSTALL) $(LIB_TH_SL) $(DESTDIR)/$(shlibdir)
+ 
+ installth : $(INSTALL_THREADS)
+-	$(srcdir)/mkinstalldirs $(libdir)
+-	$(INSTALL) $(LIB_TH) $(libdir)
++	$(srcdir)/mkinstalldirs $(DESTDIR)/$(libdir)
++	$(INSTALL) $(LIB_TH) $(DESTDIR)/$(libdir)
+ @CXX_OFF@	@echo "Enter 'make installthcxx' to install the threaded C++ library"
+ @SL_OFF@	@echo "Enter 'make installthsl' to install the threaded shared-library"
+ 
+ installthcxxsl : $(LIB_TH_CXX_SL)
+-	$(srcdir)/mkinstalldirs $(shlibdir)
+-	$(INSTALL) $(LIB_TH_CXX_SL) $(shlibdir)
++	$(srcdir)/mkinstalldirs $(DESTDIR)/$(shlibdir)
++	$(INSTALL) $(LIB_TH_CXX_SL) $(DESTDIR)/$(shlibdir)
+ 
+ installthcxx : $(INSTALL_TH_CXX)
+-	$(srcdir)/mkinstalldirs $(libdir)
+-	$(INSTALL) $(LIB_TH_CXX) $(libdir)
++	$(srcdir)/mkinstalldirs $(DESTDIR)/$(libdir)
++	$(INSTALL) $(LIB_TH_CXX) $(DESTDIR)/$(libdir)
+ @SL_OFF@	@echo "Enter 'make installthcxxsl' to install the threaded C++ shared-library"
+ 
+ installcxxsl : $(LIB_CXX_SL)
+-	$(srcdir)/mkinstalldirs $(shlibdir)
+-	$(INSTALL) $(LIB_CXX_SL) $(shlibdir)
++	$(srcdir)/mkinstalldirs $(DESTDIR)/$(shlibdir)
++	$(INSTALL) $(LIB_CXX_SL) $(DESTDIR)/$(shlibdir)
+ 
+ installcxx : $(INSTALL_CXX)
+-	$(srcdir)/mkinstalldirs $(libdir)
+-	$(INSTALL) $(LIB_CXX) $(libdir)
++	$(srcdir)/mkinstalldirs $(DESTDIR)/$(libdir)
++	$(INSTALL) $(LIB_CXX) $(DESTDIR)/$(libdir)
+ @TH_OFF@	@echo "Enter 'make installthcxx' to install the threaded C++ library"
+ @SL_OFF@	@echo "Enter 'make installcxxsl' to install the C++ shared-library"
+ 
+ installsl : $(LIB_SL)
+-	$(srcdir)/mkinstalldirs $(shlibdir)
+-	$(INSTALL) $(LIB_SL) $(shlibdir)
++	$(srcdir)/mkinstalldirs $(DESTDIR)/$(shlibdir)
++	$(INSTALL) $(LIB_SL) $(DESTDIR)/$(shlibdir)
+ @CXX_OFF@	@echo "Enter 'make installcxxsl' to install the C++ shared-library"
+ @TH_OFF@	@echo "Enter 'make installthsl' to install thread shared-library"
+ 
+ installlib : $(INSTALL_LIB)
+-	$(srcdir)/mkinstalldirs $(libdir)
+-	$(INSTALL) $(LIBRARY) $(libdir)
+-	@RANLIB@ $(libdir)/$(LIBRARY)
++	$(srcdir)/mkinstalldirs $(DESTDIR)/$(libdir)
++	$(INSTALL) $(LIBRARY) $(DESTDIR)/$(libdir)
++	@RANLIB@ $(DESTDIR)/$(libdir)/$(LIBRARY)
+ @SL_OFF@	@echo "Enter 'make installsl' to install $(LIB_SL) in $(shlibdir)"
+ @CXX_OFF@	@echo "Enter 'make installcxx' to install the C++ library"
+ @TH_OFF@	@echo "Enter 'make installth' to install thread library"
+ 
+ installdocs : $(srcdir)/docs/$(HTMLFILE) $(srcdir)/docs/$(TEXIFILE) \
+ 		$(srcdir)/docs/$(PDFFILE)
+-	$(srcdir)/mkinstalldirs $(docdir)
+-	$(INSTALL_DATA) $(srcdir)/docs/$(HTMLFILE) $(docdir)
+-	$(INSTALL_DATA) $(srcdir)/docs/$(TEXIFILE) $(docdir)
+-	$(INSTALL_DATA) $(srcdir)/docs/$(PDFFILE) $(docdir)
++	$(srcdir)/mkinstalldirs $(DESTDIR)/$(docdir)
++	$(INSTALL_DATA) $(srcdir)/docs/$(HTMLFILE) $(DESTDIR)/$(docdir)
++	$(INSTALL_DATA) $(srcdir)/docs/$(TEXIFILE) $(DESTDIR)/$(docdir)
++	$(INSTALL_DATA) $(srcdir)/docs/$(PDFFILE) $(DESTDIR)/$(docdir)
+ 
+ install : installincs installlib $(UTIL)
+-	$(srcdir)/mkinstalldirs $(bindir)
+-	$(INSTALL_PROGRAM) $(UTIL) $(bindir)
+-	@echo "Enter 'make installdocs' to install $(DOCFILES) in $(docdir)"
++	$(srcdir)/mkinstalldirs $(DESTDIR)/$(bindir)
++	$(INSTALL_PROGRAM) $(UTIL) $(DESTDIR)/$(bindir)
++	@echo "Enter 'make installdocs' to install $(DOCFILES) in $(DESTDIR)/$(docdir)"
+ 
+ dmalloc.h.2 : $(srcdir)/configure
+ 	$(SHELL) $(srcdir)/configure
diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc/configure-pagesize-HACK.patch b/meta-oe/recipes-devtools/dmalloc/dmalloc/configure-pagesize-HACK.patch
new file mode 100644
index 0000000..a5bd736
--- /dev/null
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc/configure-pagesize-HACK.patch
@@ -0,0 +1,37 @@
+We cant run tests during cross compile therefore pin to 4k pages
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: dmalloc-5.5.2/configure.ac
+===================================================================
+--- dmalloc-5.5.2.orig/configure.ac
++++ dmalloc-5.5.2/configure.ac
+@@ -348,26 +348,8 @@ AC_MSG_RESULT([$ac_cv_use_mmap])
+ #
+ AC_CHECK_FUNCS(getpagesize)
+ AC_MSG_CHECKING([basic-block size])
+-ac_cv_page_size=0
+-if test $ac_cv_page_size = 0; then
+-   AC_RUN_IFELSE([main() { if (getpagesize()<=2048) exit(0); else exit(1); }],
+-	[ ac_cv_page_size=11 ] )
+-fi
+-if test $ac_cv_page_size = 0; then
+-   AC_RUN_IFELSE([main() { if (getpagesize()<=4096) exit(0); else exit(1); }],
+-	[ ac_cv_page_size=12 ] )
+-fi
+-if test $ac_cv_page_size = 0; then
+-   AC_RUN_IFELSE([main() { if (getpagesize()<=8192) exit(0); else exit(1); }],
+-	[ ac_cv_page_size=13 ] )
+-fi
+-if test $ac_cv_page_size = 0; then
+-   AC_RUN_IFELSE([main() { if (getpagesize()<=16384) exit(0); else exit(1); }],
+-	[ ac_cv_page_size=14 ] )
+-fi
+-if test $ac_cv_page_size = 0; then
+-    ac_cv_page_size=15
+-fi
++# fix to 4K for now
++ac_cv_page_size=12
+ AC_DEFINE_UNQUOTED([BASIC_BLOCK],[$ac_cv_page_size])
+ AC_MSG_RESULT([$ac_cv_page_size])
+ 
diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc_5.5.2.bb b/meta-oe/recipes-devtools/dmalloc/dmalloc_5.5.2.bb
new file mode 100644
index 0000000..2f0d8a3
--- /dev/null
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc_5.5.2.bb
@@ -0,0 +1,39 @@
+# Copyright (C) 2016 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Debug Malloc Library"
+
+DESCRIPTION = "The debug memory allocation or dmalloc library has been \
+designed as a drop in replacement for the system's malloc, realloc, \
+calloc, free and other memory management routines while providing \
+powerful debugging facilities configurable at runtime. These facilities \
+include such things as memory-leak tracking, fence-post write detection, \
+file/line number reporting, and general logging of statistics."
+
+HOMEPAGE = "http://dmalloc.com/"
+LICENSE = "CC-BY-SA-3.0"
+
+LIC_FILES_CHKSUM = "file://dmalloc.c;beginline=4;endline=17;md5=83d13664f87f1f1a3b6b2b6f6eba85aa"
+
+SECTION = "libs"
+
+SRC_URI = "http://dmalloc.com/releases/dmalloc-${PV}.tgz \
+           file://02-Makefile.in.patch \
+           file://03-threads.patch \
+           file://13-fix-ldflags-in-makefile.patch \
+           file://configure-pagesize-HACK.patch \
+           file://100-use-xtools.patch  \
+           file://130-mips.patch \
+           file://150-use_DESTDIR.patch \
+           file://0001-undefined-strdup-macro.patch \
+"
+
+SRC_URI[md5sum] = "f92e5606c23a8092f3d5694e8d1c932e"
+SRC_URI[sha256sum] = "d3be5c6eec24950cb3bd67dbfbcdf036f1278fae5fd78655ef8cdf9e911e428a"
+
+ARM_INSTRUCTION_SET = "arm"
+
+inherit autotools
+
+EXTRA_AUTORECONF += "--include=acinclude --exclude=autoheader"
+EXTRA_OECONF += "--enable-threads --enable-cxx --enable-shlib"
-- 
2.10.2


