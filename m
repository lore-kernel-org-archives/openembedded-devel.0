Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 44B427844C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jul 2017 16:51:04 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id g14so3202916pgu.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jul 2017 09:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=r/FUjjdB0SvRr3Hm4pepyilSL+AG1otUFlo7IQgUIeU=;
	b=ZsfOoAX3txt2CHO8A9KoqMOoAf+yc47R+XK0K7KMcCt7SaK5pSr2BvMY3wClsjS1zO
	yTEzOdHmcup1LtG8xZ8+YCw9GtD6/gd9RfFzNdkC5d1pmaLMM/LHRC/odZynU7XFGWba
	6rrXiTQvJw2RYS8S7C0JCNwj7atVC7RDHpc5Iq/8L0WV8dF0KawUs2QUd2D6DyljjVAK
	1CegRxqKgTmfVUy8TcCwRg3f0bn8ZEECQ9078WBoKn1oNQfV880QoNxnVO5kh54FLZIg
	JTFaca+ysKM8qOWGf/bOLE7LfZUs22WhOsTWuq4wfegaaaudJioiTgLSpFHbhpnpQyQI
	SfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=r/FUjjdB0SvRr3Hm4pepyilSL+AG1otUFlo7IQgUIeU=;
	b=hK2PCowcziiZpzQ/HnwMgVsC6J/D1NmrKostONoUFOiJfZQ9iZ2gqP+ETW5/PW57fU
	7oU77zPLIf6v56IyIK+uvNs0uIwyJe6lmdGNgA4gKaCbfdRyVoNH5XFBmgLumRGaPFhW
	/BIR7hqLSSsY87bPHDiK7NvjAmCZ8kXXuvQv4hF8Ss0tr6AJgU49DrxsJVmt2YE8FBpE
	BPte5zFXjYAoempjguo2daRmCTviNLhT2obJIHuN+aiezpMs7eJV/Qq6i3hBvMjuVkD1
	7BzilITo45Du88dG1sV79XCdAyYoRXeEFwfTUOARJim0NEO1lwLmGYqIvBWdfLHL8kKw
	XzYQ==
X-Gm-Message-State: AIVw1131S2rNNnRaHX8mSS03heNi+v+wY1dz3RLcdQD42AXsxvCABIpo
	/YInH154svlijQPL
X-Received: by 10.84.192.131 with SMTP id c3mr12474079pld.9.1500742265194;
	Sat, 22 Jul 2017 09:51:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	o10sm15628924pgc.81.2017.07.22.09.51.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Jul 2017 09:51:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Jul 2017 09:50:45 -0700
Message-Id: <20170722165045.44735-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170722165045.44735-1-raj.khem@gmail.com>
References: <20170722165045.44735-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] wvstreams: Fix build with musl
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
X-List-Received-Date: Sat, 22 Jul 2017 16:51:04 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Check-for-limits.h-during-configure.patch |  26 ++++
 ...sk-Dont-use-ucontext-on-non-glibc-systems.patch | 135 +++++++++++++++++++++
 ...k-for-HAVE_LIBC_STACK_END-only-on-glibc-s.patch |  27 +++++
 .../0004-wvcrash-Replace-use-of-basename-API.patch |  28 +++++
 ...05-check-for-libexecinfo-during-configure.patch |  30 +++++
 .../wvdial/wvstreams/argp.patch                    |  37 ++++++
 .../recipes-connectivity/wvdial/wvstreams_4.6.1.bb |   9 +-
 7 files changed, 291 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/0001-Check-for-limits.h-during-configure.patch
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/0002-wvtask-Dont-use-ucontext-on-non-glibc-systems.patch
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/0003-wvtask-Check-for-HAVE_LIBC_STACK_END-only-on-glibc-s.patch
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/0004-wvcrash-Replace-use-of-basename-API.patch
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/0005-check-for-libexecinfo-during-configure.patch
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/argp.patch

diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/0001-Check-for-limits.h-during-configure.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/0001-Check-for-limits.h-during-configure.patch
new file mode 100644
index 000000000..b092ba2fc
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/0001-Check-for-limits.h-during-configure.patch
@@ -0,0 +1,26 @@
+From 7deaf836d1f1b9e4426818584b4267f8c4a095aa Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 20 Jul 2017 21:04:07 -0700
+Subject: [PATCH 1/5] Check for limits.h during configure
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index fe0fa2b..188adfe 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -139,6 +139,8 @@ int main()
+ 			     [Compiler warning on deprecated functions])])
+ CPPFLAGS="$CPPFLAGS_save"
+ 
++AC_CHECK_HEADERS(limits.h)
++
+ # argp
+ USE_WVSTREAMS_ARGP=0
+ AC_CHECK_HEADERS(argp.h)
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/0002-wvtask-Dont-use-ucontext-on-non-glibc-systems.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/0002-wvtask-Dont-use-ucontext-on-non-glibc-systems.patch
new file mode 100644
index 000000000..232db9e63
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/0002-wvtask-Dont-use-ucontext-on-non-glibc-systems.patch
@@ -0,0 +1,135 @@
+From 0e054339c1422168a7f4a9dcf090268053a33b1f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 20 Jul 2017 21:05:37 -0700
+Subject: [PATCH 2/5] wvtask: Dont use ucontext on non-glibc systems
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ utils/wvtask.cc | 24 ++++++++++++++++++++++++
+ 1 file changed, 24 insertions(+)
+
+diff --git a/utils/wvtask.cc b/utils/wvtask.cc
+index cdcd544..c0bff7d 100644
+--- a/utils/wvtask.cc
++++ b/utils/wvtask.cc
+@@ -199,7 +199,9 @@ WvTaskMan::WvTaskMan()
+     stacktop = (char *)alloca(0);
+     
+     context_return = 0;
++#ifdef __GLIBC__
+     assert(getcontext(&get_stack_return) == 0);
++#endif
+     if (context_return == 0)
+     {
+ 	// initial setup - start the stackmaster() task (never returns!)
+@@ -265,13 +267,17 @@ int WvTaskMan::run(WvTask &task, int val)
+ 	state = &old_task->mystate;
+     
+     context_return = 0;
++#ifdef __GLIBC__
+     assert(getcontext(state) == 0);
++#endif
+     int newval = context_return;
+     if (newval == 0)
+     {
+ 	// saved the state, now run the task.
+         context_return = val;
++#ifdef __GLIBC__
+         setcontext(&task.mystate);
++#endif
+         return -1;
+     }
+     else
+@@ -319,13 +325,17 @@ int WvTaskMan::yield(int val)
+ #endif
+ 		
+     context_return = 0;
++#ifdef __GLIBC__
+     assert(getcontext(&current_task->mystate) == 0);
++#endif
+     int newval = context_return;
+     if (newval == 0)
+     {
+ 	// saved the task state; now yield to the toplevel.
+         context_return = val;
++#ifdef __GLIBC__
+         setcontext(&toplevel);
++#endif
+         return -1;
+     }
+     else
+@@ -341,7 +351,9 @@ int WvTaskMan::yield(int val)
+ void WvTaskMan::get_stack(WvTask &task, size_t size)
+ {
+     context_return = 0;
++#ifdef __GLIBC__
+     assert(getcontext(&get_stack_return) == 0);
++#endif
+     if (context_return == 0)
+     {
+ 	assert(magic_number == -WVTASK_MAGIC);
+@@ -371,7 +383,9 @@ void WvTaskMan::get_stack(WvTask &task, size_t size)
+ 	// initial setup
+ 	stack_target = &task;
+ 	context_return = size/1024 + (size%1024 > 0);
++#ifdef __GLIBC__
+ 	setcontext(&stackmaster_task);
++#endif
+     }
+     else
+     {
+@@ -409,7 +423,9 @@ void WvTaskMan::_stackmaster()
+ 	assert(magic_number == -WVTASK_MAGIC);
+ 	
+         context_return = 0;
++#ifdef __GLIBC__
+         assert(getcontext(&stackmaster_task) == 0);
++#endif
+         val = context_return;
+ 	if (val == 0)
+ 	{
+@@ -419,7 +435,9 @@ void WvTaskMan::_stackmaster()
+ 	    // all current stack allocations) and go back to get_stack
+ 	    // (or the constructor, if that's what called us)
+             context_return = 1;
++#ifdef __GLIBC__
+             setcontext(&get_stack_return);
++#endif
+ 	}
+ 	else
+ 	{
+@@ -474,7 +492,9 @@ void WvTaskMan::do_task()
+ 	
+     // back here from longjmp; someone wants stack space.    
+     context_return = 0;
++#ifdef __GLIBC__
+     assert(getcontext(&task->mystate) == 0);
++#endif
+     if (context_return == 0)
+     {
+ 	// done the setjmp; that means the target task now has
+@@ -510,7 +530,9 @@ void WvTaskMan::do_task()
+                 }
+                 else
+                 {
++#ifdef __GLIBC__
+                     assert(getcontext(&task->func_call) == 0);
++#endif
+                     task->func_call.uc_stack.ss_size = task->stacksize;
+                     task->func_call.uc_stack.ss_sp = task->stack;
+                     task->func_call.uc_stack.ss_flags = 0;
+@@ -521,9 +543,11 @@ void WvTaskMan::do_task()
+                             (void (*)(void))call_func, 1, task);
+ 
+                     context_return = 0;
++#ifdef __GLIBC__
+                     assert(getcontext(&task->func_return) == 0);
+                     if (context_return == 0)
+                         setcontext(&task->func_call);
++#endif
+                 }
+ 		
+ 		// the task's function terminated.
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/0003-wvtask-Check-for-HAVE_LIBC_STACK_END-only-on-glibc-s.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/0003-wvtask-Check-for-HAVE_LIBC_STACK_END-only-on-glibc-s.patch
new file mode 100644
index 000000000..f9304197a
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/0003-wvtask-Check-for-HAVE_LIBC_STACK_END-only-on-glibc-s.patch
@@ -0,0 +1,27 @@
+From f1fc9f4d523dd8b773a4535176547b0619ec05c6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 20 Jul 2017 21:08:57 -0700
+Subject: [PATCH 3/5] wvtask: Check for HAVE_LIBC_STACK_END only on glibc
+ systems
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ utils/wvtask.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/utils/wvtask.cc b/utils/wvtask.cc
+index c0bff7d..716344b 100644
+--- a/utils/wvtask.cc
++++ b/utils/wvtask.cc
+@@ -563,7 +563,7 @@ void WvTaskMan::do_task()
+ 
+ const void *WvTaskMan::current_top_of_stack()
+ {
+-#ifdef HAVE_LIBC_STACK_END
++#if defined(HAVE_LIBC_STACK_END) && defined(__GLIBC__)
+     extern const void *__libc_stack_end;
+     if (use_shared_stack() || current_task == NULL)
+         return __libc_stack_end;
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/0004-wvcrash-Replace-use-of-basename-API.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/0004-wvcrash-Replace-use-of-basename-API.patch
new file mode 100644
index 000000000..6f3fbffbd
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/0004-wvcrash-Replace-use-of-basename-API.patch
@@ -0,0 +1,28 @@
+From bfe68126693f9159f7ac66a69217e0b5f43e5781 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 20 Jul 2017 21:11:21 -0700
+Subject: [PATCH 4/5] wvcrash: Replace use of basename API
+
+musl does not have this API
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ utils/wvcrash.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/utils/wvcrash.cc b/utils/wvcrash.cc
+index 0417759..3d160b7 100644
+--- a/utils/wvcrash.cc
++++ b/utils/wvcrash.cc
+@@ -404,7 +404,7 @@ extern void __wvcrash_init_buffers(const char *program_name);
+ void wvcrash_setup(const char *_argv0, const char *_desc)
+ {
+     if (_argv0)
+-	argv0 = basename(_argv0);
++	argv0 = strrchr(_argv0, '/') ? strrchr(_argv0, '/')+1 : _argv0;
+     __wvcrash_init_buffers(argv0);
+     if (_desc)
+     {
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/0005-check-for-libexecinfo-during-configure.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/0005-check-for-libexecinfo-during-configure.patch
new file mode 100644
index 000000000..25e9ee236
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/0005-check-for-libexecinfo-during-configure.patch
@@ -0,0 +1,30 @@
+From fd9515f08dcdafea6ae03413fbe5a43a6438fe3e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 20 Jul 2017 21:25:48 -0700
+Subject: [PATCH 5/5] check for libexecinfo during configure
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 188adfe..1ab4d3c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -159,6 +159,12 @@ AC_SEARCH_LIBS([argp_parse], [argp c], [], [
+       USE_WVSTREAMS_ARGP=1
+   fi
+ ])
++
++USE_LIBEXECINFO=0
++AC_SEARCH_LIBS([backtrace], [execinfo], [], [
++USE_LIBEXECINFO=1
++])
++
+ # Function checks
+ AC_HEADER_DIRENT
+ 
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/argp.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/argp.patch
new file mode 100644
index 000000000..e85721363
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/argp.patch
@@ -0,0 +1,37 @@
+Check for argp_parse in libargp and then in libc before using internal version
+
+Index: wvstreams-4.6.1/configure.ac
+===================================================================
+--- wvstreams-4.6.1.orig/configure.ac
++++ wvstreams-4.6.1/configure.ac
+@@ -142,20 +142,21 @@ CPPFLAGS="$CPPFLAGS_save"
+ # argp
+ USE_WVSTREAMS_ARGP=0
+ AC_CHECK_HEADERS(argp.h)
+-AC_CHECK_FUNC(argp_parse)
+-if test "$ac_cv_func_argp_parse" != yes \
+-    -o "$ac_cv_header_argp_h" != yes ; then
+-    (
+-    	echo
++AC_SEARCH_LIBS([argp_parse], [argp c], [], [
++
++  if test "$ac_cv_func_argp_parse" != yes \
++      -o "$ac_cv_header_argp_h" != yes ; then
++      (
++       	echo
+     	echo 'configuring argp...'
+     	cd argp
+     	./configure --host=$host_cpu-$host_os || exit $?
+     	echo 'argp configured.'
+     	echo
+-    ) || exit $?
+-    USE_WVSTREAMS_ARGP=1
+-fi
+-
++      ) || exit $?
++      USE_WVSTREAMS_ARGP=1
++  fi
++])
+ # Function checks
+ AC_HEADER_DIRENT
+ 
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index 607a6178f..0ac175251 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -5,6 +5,7 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 DEPENDS = "zlib openssl (>= 0.9.8) dbus readline"
+DEPENDS_append_libc-musl = " argp-standalone libexecinfo"
 
 SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz \
            file://04_signed_request.diff \
@@ -12,7 +13,13 @@ SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz \
            file://06_gcc-4.7.diff \
            file://07_buildflags.diff \
            file://gcc-6.patch \
-          "
+           file://argp.patch \
+           file://0001-Check-for-limits.h-during-configure.patch \
+           file://0002-wvtask-Dont-use-ucontext-on-non-glibc-systems.patch \
+           file://0003-wvtask-Check-for-HAVE_LIBC_STACK_END-only-on-glibc-s.patch \
+           file://0004-wvcrash-Replace-use-of-basename-API.patch \
+           file://0005-check-for-libexecinfo-during-configure.patch \
+           "
 
 SRC_URI[md5sum] = "2760dac31a43d452a19a3147bfde571c"
 SRC_URI[sha256sum] = "8403f5fbf83aa9ac0c6ce15d97fd85607488152aa84e007b7d0621b8ebc07633"
-- 
2.13.3


