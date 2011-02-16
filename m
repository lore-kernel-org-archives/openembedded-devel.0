Received: from mx194.callplus.net.nz ([202.180.66.194]
	helo=mxi2.callplus.net.nz) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <roystonvasey@slingshot.co.nz>) id 1Ppotx-00009x-Ta
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 22:27:12 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AhsJAC/QW03LYgoS/2dsb2JhbACCSpU0hhiHIIFFvSgNhVEE
X-IronPort-AV: E=Sophos;i="4.60,482,1291546800"; 
	d="scan'208,217";a="172116672"
Received: from smtp.connexionz.co.nz (HELO mikepad) ([203.98.10.18])
	by ismtp02.callplus.net.nz with ESMTP; 17 Feb 2011 10:25:31 +1300
From: "R U Local" <roystonvasey@slingshot.co.nz>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Feb 2011 10:25:23 +1300
Message-ID: <003901cbce20$08538e00$18faaa00$@slingshot.co.nz>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AcvOH5mmWrAn6MTyQBqWhBP2pvAFNw==
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [PATCH] wvstreams 4.6.1 with context patch for ARM architectures
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
X-List-Received-Date: Wed, 16 Feb 2011 21:27:12 -0000
X-Groupsio-MsgNum: 29333
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_003A_01CBCE8C.FF4E3590"
Content-Language: en-nz

------=_NextPart_000_003A_01CBCE8C.FF4E3590
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dear List,

Attached is a patch which gets wvdial working on ARM devices.

Wvdial or more precisely wvstreams thows an exception on ARM devices as
get/set context isn't supported.

 

Cheers Mike.

 

 


------=_NextPart_000_003A_01CBCE8C.FF4E3590
Content-Type: application/octet-stream;
	name="wvstreams-4.6.1.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="wvstreams-4.6.1.patch"

diff --git a/recipes/wvstreams/files/wvstreams-4.6.1-arm_replace_getcontext=
-1.patch b/recipes/wvstreams/files/wvstreams-4.6.1-arm_replace_getcontext-1=
.patch
new file mode 100755
index 0000000..ebb6b10
--- /dev/null
+++ b/recipes/wvstreams/files/wvstreams-4.6.1-arm_replace_getcontext-1.patc=
h
@@ -0,0 +1,336 @@
+diff -Nru wvstreams-4.6.1.orig//include/wvtask.h wvstreams-4.6.1/include/w=
vtask.h
+--- wvstreams-4.6.1.orig//include/wvtask.h	2008-07-14 21:11:35.000000000 +=
0200
++++ wvstreams-4.6.1/include/wvtask.h	2010-05-16 17:48:03.024289308 +0200
+@@ -54,8 +54,7 @@
+     bool running, recycled;
+    =20
+     WvTaskMan &man;
+-    ucontext_t mystate;	// used for resuming the task
+-    ucontext_t func_call, func_return;
++    jmp_buf mystate;
+    =20
+     TaskFunc *func;
+     void *userdata;
+@@ -91,16 +90,15 @@
+     static void stackmaster();
+     static void _stackmaster();
+     static void do_task();
+-    static void call_func(WvTask *task);
+=20
+     static char *stacktop;
+-    static ucontext_t stackmaster_task;
++    static jmp_buf stackmaster_task;
+    =20
+     static WvTask *stack_target;
+-    static ucontext_t get_stack_return;
++    static jmp_buf get_stack_return;
+    =20
+     static WvTask *current_task;
+-    static ucontext_t toplevel;
++    static jmp_buf toplevel;
+    =20
+     WvTaskMan();
+     virtual ~WvTaskMan();
+diff -Nru wvstreams-4.6.1.orig//uniconf/unifastregetgen.cc wvstreams-4.6.1=
/uniconf/unifastregetgen.cc
+--- wvstreams-4.6.1.orig//uniconf/unifastregetgen.cc	2008-07-14 21:11:35.0=
00000000 +0200
++++ wvstreams-4.6.1/uniconf/unifastregetgen.cc	2010-05-16 17:56:41.3874151=
61 +0200
+@@ -54,7 +54,7 @@
+ {
+     if (!tree)
+     {
+-	wvassert(tree, "key: '%s'", key);
++//	wvassert(tree, "key: '%s'", key);
+ 	abort();
+     }
+=20
+@@ -93,7 +93,7 @@
+ {
+     if (!tree)
+     {
+-	wvassert(tree, "key: '%s'", key);
++//	wvassert(tree, "key: '%s'", key);
+ 	abort();
+     }
+=20
+diff -Nru wvstreams-4.6.1.orig//utils/wvcrash.cc wvstreams-4.6.1/utils/wvc=
rash.cc
+--- wvstreams-4.6.1.orig//utils/wvcrash.cc	2008-12-17 13:24:20.000000000 +=
0100
++++ wvstreams-4.6.1/utils/wvcrash.cc	2010-05-16 17:57:33.726539546 +0200
+@@ -28,7 +28,7 @@
+ // FIXME: this file mostly only works in Linux
+ #ifdef __linux
+=20
+-# include <execinfo.h>
++//#include <execinfo.h>
+ #include <unistd.h>
+=20
+ #ifdef __USE_GNU
+@@ -268,8 +268,8 @@
+     }
+=20
+     wr(fd, "\nBacktrace:\n");
+-    backtrace_symbols_fd(trace,
+-		 backtrace(trace, sizeof(trace)/sizeof(trace[0])), fd);
++//    backtrace_symbols_fd(trace,
++//		 backtrace(trace, sizeof(trace)/sizeof(trace[0])), fd);
+    =20
+     if (pid > 0)
+     {
+diff -Nru wvstreams-4.6.1.orig//utils/wvtask.cc wvstreams-4.6.1/utils/wvta=
sk.cc
+--- wvstreams-4.6.1.orig//utils/wvtask.cc	2009-05-13 23:42:52.000000000 +0=
200
++++ wvstreams-4.6.1/utils/wvtask.cc	2010-05-16 17:56:04.072295922 +0200
+@@ -32,10 +32,6 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <assert.h>
+-#include <sys/mman.h>
+-#include <signal.h>
+-#include <unistd.h>
+-#include <sys/resource.h>
+=20
+ #ifdef HAVE_VALGRIND_MEMCHECK_H
+ #include <valgrind/memcheck.h>
+@@ -60,7 +56,7 @@
+ WvTaskMan *WvTaskMan::singleton;
+ int WvTaskMan::links, WvTaskMan::magic_number;
+ WvTaskList WvTaskMan::all_tasks, WvTaskMan::free_tasks;
+-ucontext_t WvTaskMan::stackmaster_task, WvTaskMan::get_stack_return,
++jmp_buf WvTaskMan::stackmaster_task, WvTaskMan::get_stack_return,
+     WvTaskMan::toplevel;
+ WvTask *WvTaskMan::current_task, *WvTaskMan::stack_target;
+ char *WvTaskMan::stacktop;
+@@ -198,9 +194,7 @@
+    =20
+     stacktop =3D (char *)alloca(0);
+    =20
+-    context_return =3D 0;
+-    assert(getcontext(&get_stack_return) =3D=3D 0);
+-    if (context_return =3D=3D 0)
++    if (setjmp(get_stack_return) =3D=3D 0)
+     {
+ 	// initial setup - start the stackmaster() task (never returns!)
+ 	stackmaster();
+@@ -257,22 +251,18 @@
+        =20
+     WvTask *old_task =3D current_task;
+     current_task =3D &task;
+-    ucontext_t *state;
++    jmp_buf *state;
+    =20
+     if (!old_task)
+ 	state =3D &toplevel; // top-level call (not in an actual task yet)
+     else
+ 	state =3D &old_task->mystate;
+    =20
+-    context_return =3D 0;
+-    assert(getcontext(state) =3D=3D 0);
+-    int newval =3D context_return;
++    int newval =3D setjmp(*state);
+     if (newval =3D=3D 0)
+     {
+ 	// saved the state, now run the task.
+-        context_return =3D val;
+-        setcontext(&task.mystate);
+-        return -1;
++        longjmp(task.mystate, val);
+     }
+     else
+     {
+@@ -303,8 +293,6 @@
+     assert(*current_task->stack_magic =3D=3D WVTASK_MAGIC);
+=20
+ #if TASK_DEBUG
+-    if (use_shared_stack())
+-    {
+         size_t stackleft;
+         char *stackbottom =3D (char *)(current_task->stack_magic + 1);
+         for (stackleft =3D 0; stackleft < current_task->stacksize; stackl=
eft++)
+@@ -315,18 +303,13 @@
+         Dprintf("WvTaskMan: remaining stack after #%d (%s): %ld/%ld\n",
+                 current_task->tid, current_task->name.cstr(), (long)stack=
left,
+                 (long)current_task->stacksize);
+-    }
+ #endif
+ 	=09
+-    context_return =3D 0;
+-    assert(getcontext(&current_task->mystate) =3D=3D 0);
+-    int newval =3D context_return;
++    int newval =3D setjmp(current_task->mystate);
+     if (newval =3D=3D 0)
+     {
+ 	// saved the task state; now yield to the toplevel.
+-        context_return =3D val;
+-        setcontext(&toplevel);
+-        return -1;
++        longjmp(toplevel, val);
+     }
+     else
+     {
+@@ -340,38 +323,14 @@
+=20
+ void WvTaskMan::get_stack(WvTask &task, size_t size)
+ {
+-    context_return =3D 0;
+-    assert(getcontext(&get_stack_return) =3D=3D 0);
+-    if (context_return =3D=3D 0)
++    if (setjmp(get_stack_return) =3D=3D 0)
+     {
+ 	assert(magic_number =3D=3D -WVTASK_MAGIC);
+ 	assert(task.magic_number =3D=3D WVTASK_MAGIC);
+=20
+-        if (!use_shared_stack())
+-        {
+-#if defined(__linux__) && (defined(__386__) || defined(__i386) || defined=
(__i386__))
+-            static char *next_stack_addr =3D (char *)0xB0000000;
+-            static const size_t stack_shift =3D 0x00100000;
+-
+-            next_stack_addr -=3D stack_shift;
+-#else
+-            static char *next_stack_addr =3D NULL;
+-#endif
+-       =20
+-            task.stack =3D mmap(next_stack_addr, task.stacksize,
+-                PROT_READ | PROT_WRITE,
+-#ifndef MACOS=20
+-                MAP_PRIVATE | MAP_ANONYMOUS,
+-#else
+-                MAP_PRIVATE,
+-#endif
+-                -1, 0);
+-        }
+-=09
+ 	// initial setup
+ 	stack_target =3D &task;
+-	context_return =3D size/1024 + (size%1024 > 0);
+-	setcontext(&stackmaster_task);
++	longjmp(stackmaster_task, size/1024 + (size%1024 > 0));
+     }
+     else
+     {
+@@ -408,9 +367,7 @@
+     {
+ 	assert(magic_number =3D=3D -WVTASK_MAGIC);
+ =09
+-        context_return =3D 0;
+-        assert(getcontext(&stackmaster_task) =3D=3D 0);
+-        val =3D context_return;
++        val =3D setjmp(stackmaster_task);
+ 	if (val =3D=3D 0)
+ 	{
+ 	    assert(magic_number =3D=3D -WVTASK_MAGIC);
+@@ -418,19 +375,13 @@
+ 	    // just did setjmp; save stackmaster's current state (with
+ 	    // all current stack allocations) and go back to get_stack
+ 	    // (or the constructor, if that's what called us)
+-            context_return =3D 1;
+-            setcontext(&get_stack_return);
++            longjmp(get_stack_return, 1);
+ 	}
+ 	else
+ 	{
+ 	    valgrind_fix(stacktop);
+ 	    assert(magic_number =3D=3D -WVTASK_MAGIC);
+ 	   =20
+-	    total =3D (val+1) * (size_t)1024;
+-	   =20
+-            if (!use_shared_stack())
+-                total =3D 1024; // enough to save the do_task stack frame
+-
+ 	    // set up a stack frame for the new task.  This runs once
+ 	    // per get_stack.
+             //alloc_stack_and_switch(total);
+@@ -439,6 +390,7 @@
+ 	    assert(magic_number =3D=3D -WVTASK_MAGIC);
+=20
+             // allocate the stack area so we never use it again
++            total =3D (val+1) * (size_t)1024;
+             alloca(total);
+=20
+             // a little sentinel so we can detect stack overflows
+@@ -455,17 +407,6 @@
+ }
+=20
+=20
+-void WvTaskMan::call_func(WvTask *task)
+-{
+-    Dprintf("WvTaskMan: calling task #%d (%s)\n",
+-	    task->tid, (const char *)task->name);
+-    task->func(task->userdata);
+-    Dprintf("WvTaskMan: returning from task #%d (%s)\n",
+-	    task->tid, (const char *)task->name);
+-    context_return =3D 1;
+-}
+-
+-
+ void WvTaskMan::do_task()
+ {
+     assert(magic_number =3D=3D -WVTASK_MAGIC);
+@@ -473,9 +414,7 @@
+     assert(task->magic_number =3D=3D WVTASK_MAGIC);
+ =09
+     // back here from longjmp; someone wants stack space.   =20
+-    context_return =3D 0;
+-    assert(getcontext(&task->mystate) =3D=3D 0);
+-    if (context_return =3D=3D 0)
++    if (setjmp(task->mystate) =3D=3D 0)
+     {
+ 	// done the setjmp; that means the target task now has
+ 	// a working jmp_buf all set up.  Leave space on the stack
+@@ -501,30 +440,10 @@
+ 	   =20
+ 	    if (task->func && task->running)
+ 	    {
+-                if (use_shared_stack())
+-                {
+                     // this is the task's main function.  It can call yie=
ld()
+                     // to give up its timeslice if it wants.  Either way,=
 it
+                     // only returns to *us* if the function actually fini=
shes.
+                     task->func(task->userdata);
+-                }
+-                else
+-                {
+-                    assert(getcontext(&task->func_call) =3D=3D 0);
+-                    task->func_call.uc_stack.ss_size =3D task->stacksize;
+-                    task->func_call.uc_stack.ss_sp =3D task->stack;
+-                    task->func_call.uc_stack.ss_flags =3D 0;
+-                    task->func_call.uc_link =3D &task->func_return;
+-                    Dprintf("WvTaskMan: makecontext #%d (%s)\n",
+-                            task->tid, (const char *)task->name);
+-                    makecontext(&task->func_call,
+-                            (void (*)(void))call_func, 1, task);
+-
+-                    context_return =3D 0;
+-                    assert(getcontext(&task->func_return) =3D=3D 0);
+-                    if (context_return =3D=3D 0)
+-                        setcontext(&task->func_call);
+-                }
+ 	=09
+ 		// the task's function terminated.
+ 		task->name =3D "DEAD";
+@@ -541,10 +460,7 @@
+ {
+ #ifdef HAVE_LIBC_STACK_END
+     extern const void *__libc_stack_end;
+-    if (use_shared_stack() || current_task =3D=3D NULL)
+         return __libc_stack_end;
+-    else
+-        return (const char *)current_task->stack + current_task->stacksiz=
e;
+ #else
+     return 0;
+ #endif
+@@ -553,16 +469,6 @@
+=20
+ size_t WvTaskMan::current_stacksize_limit()
+ {
+-    if (use_shared_stack() || current_task =3D=3D NULL)
+-    {
+-        struct rlimit rl;
+-        if (getrlimit(RLIMIT_STACK, &rl) =3D=3D 0)
+-            return size_t(rl.rlim_cur);
+-        else
+-            return 0;
+-    }
+-    else
+-        return size_t(current_task->stacksize);
+ }
+=20
+    =20
diff --git a/recipes/wvstreams/wvstreams_4.6.1.bb b/recipes/wvstreams/wvstr=
eams_4.6.1.bb
new file mode 100755
index 0000000..5874dcd
--- /dev/null
+++ b/recipes/wvstreams/wvstreams_4.6.1.bb
@@ -0,0 +1,47 @@
+HOMEPAGE =3D "http://alumnit.ca/wiki/index.php?page=3DWvStreams"
+LICENSE =3D "LGPL"
+DESCRIPTION =3D "WvStreams is a network programming library in C++"
+DEPENDS =3D "zlib openssl (>=3D 0.9.8)"
+
+PR =3D "r1"
+
+SRC_URI =3D "http://wvstreams.googlecode.com/files/${PN}-${PV}.tar.gz \
+	file://wvstreams-4.6.1-arm_replace_getcontext-1.patch \
+	"
+#	file://wvstreams-4.6.1-arm_replace_getcontext.patch \
+#	file://wvstreams.patch \
+
+inherit autotools pkgconfig
+
+LDFLAGS_append =3D " -Wl,-rpath-link,${TOOLCHAIN_PATH}/${TARGET_SYS}/lib"
+
+# dbus detection currently broken in configure.ac; remember to add "dbus (=
>=3D 1.2.14)" to DEPENDS  when fixed
+EXTRA_OECONF =3D " --without-tcl --without-qt --without-pam --without-dbus=
"
+
+PACKAGES_prepend =3D "libuniconf libuniconf-dbg "
+PACKAGES_prepend =3D "uniconfd uniconfd-dbg "
+PACKAGES_prepend =3D "libwvstreams-base libwvstreams-base-dbg "
+PACKAGES_prepend =3D "libwvstreams-extras libwvstreams-extras-dbg "
+
+FILES_libuniconf     =3D "${libdir}/libuniconf.so.*"
+FILES_libuniconf-dbg =3D "${libdir}/.debug/libuniconf.so.*"
+
+FILES_uniconfd     =3D "${sbindir}/uniconfd ${sysconfdir}/uniconf.conf ${l=
ocalstatedir}/uniconf"
+FILES_uniconfd-dbg =3D "${sbindir}/.debug/uniconfd"
+
+FILES_libwvstreams-base     =3D "${libdir}/libwvutils.so.*"
+FILES_libwvstreams-base-dbg =3D "${libdir}/.debug/libwvutils.so.*"
+
+FILES_libwvstreams-extras     =3D "${libdir}/libwvbase.so.* ${libdir}/libw=
vstreams.so.*"
+FILES_libwvstreams-extras-dbg =3D "${libdir}/.debug/libwvbase.so.* ${libdi=
r}/.debug/libwvstreams.so.*"
+
+PARALLEL_MAKE =3D ""
+
+do_configure() {
+        autoreconf
+        oe_runconf
+}
+
+SRC_URI[md5sum] =3D "2760dac31a43d452a19a3147bfde571c"
+SRC_URI[sha256sum] =3D "8403f5fbf83aa9ac0c6ce15d97fd85607488152aa84e007b7d=
0621b8ebc07633"
+

------=_NextPart_000_003A_01CBCE8C.FF4E3590--
