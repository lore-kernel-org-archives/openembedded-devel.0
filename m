Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TKzYu-0004jb-2u
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Oct 2012 00:43:04 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so2574108wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Oct 2012 15:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=SQbRoEIRpeGEIzLmkmucmOnZfIYtsZIsTZEB3znswII=;
	b=wWaafY41ZjHJQsXWtOxYUd+IrAk8wQ5V2FoDUO1hJ4jPHu+SFlWwh7rCNm2rfuGtuy
	SXEcNn2Pn3wN4VwNMPblpmI7pzMAsgw4MItFAj6hPX+cQCQCe95/LD0wbXZXVCRMAACf
	Tg6d9Qh05S3b66CW6Y/VtN+Tgp2DWQK96hm3qAosRbYhtaw+7zLahtCowjRyUjAUnAy0
	b73cfMz6fJyF/3IGGQ3nxdy4hE/w02ezyDDMiVUiU7ndSeso2K4E2IrUtSAsnWzPlkyE
	UEW6f4cTmOiqAjkHAme74cV8CCdS2ANaCZ93x57xg6Rd848eZzhjXGLGXqOCz2VAjx55
	3k2g==
Received: by 10.181.13.208 with SMTP id fa16mr17050884wid.11.1349648998492;
	Sun, 07 Oct 2012 15:29:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.56.68 with HTTP; Sun, 7 Oct 2012 15:29:27 -0700 (PDT)
In-Reply-To: <bfb296f1cdd2a326b3754e4d8351203a44bee262.1349466172.git.sledz@dresearch-fe.de>
References: <cover.1349466172.git.sledz@dresearch-fe.de>
	<366eb039e4231b2285f46a74effced4b4f919d51.1349466172.git.sledz@dresearch-fe.de>
	<bfb296f1cdd2a326b3754e4d8351203a44bee262.1349466172.git.sledz@dresearch-fe.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 7 Oct 2012 15:29:27 -0700
Message-ID: <CAMKF1sqp0aS+Op15TmjM1iWPkzZ_6Cvh4KBFi=-LQrtAXwAsKA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java 2/5] icedtea6-native-1.7.10: backport S7103224
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
X-List-Received-Date: Sun, 07 Oct 2012 22:43:04 -0000
Content-Type: text/plain; charset=UTF-8

I have posted some patches which covered this as well some weeks ago

see

http://patchwork.openembedded.org/patch/33463/

On Fri, Oct 5, 2012 at 12:46 PM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
> Backport the fix for 7103224.
>
> This fix allows icedtea6 to be built with (very) new glibc versions.
> It was originally suggested by Omair Majid from RedHat.
>
> For details see:
> <http://permalink.gmane.org/gmane.comp.java.openjdk.distro-packaging.devel/16103>
> <http://mail.openjdk.java.net/pipermail/hotspot-dev/2011-October/004589.html>
>
> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> ---
>  .../glibc_name_collision.patch                     |  523 ++++++++++++++++++++
>  recipes-core/icedtea/icedtea6-native_1.7.10.bb     |    3 +-
>  2 files changed, 525 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-core/icedtea/icedtea6-native-1.7.10/glibc_name_collision.patch
>
> diff --git a/recipes-core/icedtea/icedtea6-native-1.7.10/glibc_name_collision.patch b/recipes-core/icedtea/icedtea6-native-1.7.10/glibc_name_collision.patch
> new file mode 100644
> index 0000000..0702b77
> --- /dev/null
> +++ b/recipes-core/icedtea/icedtea6-native-1.7.10/glibc_name_collision.patch
> @@ -0,0 +1,523 @@
> +icedtea6-native-1.7.10: backport S7103224
> +
> +Backport the fix for 7103224.
> +
> +This fix allows icedtea6 to be built with (very) new glibc versions.
> +It was originally suggested by Omair Majid from RedHat.
> +
> +For details see:
> +<http://permalink.gmane.org/gmane.comp.java.openjdk.distro-packaging.devel/16103>
> +<http://mail.openjdk.java.net/pipermail/hotspot-dev/2011-October/004589.html>
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> +
> +diff -Nurd icedtea6-1.7.10.orig/Makefile.am icedtea6-1.7.10/Makefile.am
> +--- icedtea6-1.7.10.orig/Makefile.am   2012-05-03 14:59:31.596076283 +0200
> ++++ icedtea6-1.7.10/Makefile.am        2012-05-03 15:03:43.787566714 +0200
> +@@ -393,7 +393,8 @@
> +       patches/openjdk/6541476-png-iTXt-chunk.patch \
> +       patches/openjdk/6782079-png_metadata_oom.patch \
> +       patches/rh676659-gcc-export-dynamic.patch \
> +-      patches/latent_jaxp_bug.patch
> ++      patches/latent_jaxp_bug.patch \
> ++      patches/openjdk/7103224-glibc_name_collision.patch
> +
> + if WITH_ALT_HSBUILD
> + ICEDTEA_PATCHES += patches/hotspot/$(HSBUILD)/openjdk-6886353-ignore_deoptimizealot.patch \
> +diff -Nurd icedtea6-1.7.10.orig/patches/openjdk/7103224-glibc_name_collision.patch icedtea6-1.7.10/patches/openjdk/7103224-glibc_name_collision.patch
> +--- icedtea6-1.7.10.orig/patches/openjdk/7103224-glibc_name_collision.patch    1970-01-01 01:00:00.000000000 +0100
> ++++ icedtea6-1.7.10/patches/openjdk/7103224-glibc_name_collision.patch 2012-05-03 15:01:27.817684671 +0200
> +@@ -0,0 +1,491 @@
> ++# HG changeset patch
> ++# User never
> ++# Date 1319555835 25200
> ++# Node ID a6eef545f1a2ceca6aeadf688a965df600ffef28
> ++# Parent  2ec638646e86e455978c31a9d47fc0ec271ed926
> ++7103224: collision between __LEAF define in interfaceSupport.hpp and /usr/include/sys/cdefs.h with gcc
> ++Reviewed-by: never
> ++Contributed-by: Omair Majid <omajid@...>
> ++
> ++diff -r 2ec638646e86 -r a6eef545f1a2 src/share/vm/opto/addnode.cpp
> ++--- openjdk/hotspot/src/share/vm/opto/addnode.cpp     Tue Oct 25 04:07:20 2011 -0700
> +++++ openjdk/hotspot/src/share/vm/opto/addnode.cpp     Tue Oct 25 08:17:15 2011 -0700
> ++@@ -34,8 +34,6 @@
> ++
> ++ // Portions of code courtesy of Clifford Click
> ++
> ++-#define MAXFLOAT        ((float)3.40282346638528860e+38)
> ++-
> ++ // Classic Add functionality.  This covers all the usual 'add' behaviors for
> ++ // an algebraic ring.  Add-integer, add-float, add-double, and binary-or are
> ++ // all inherited from this class.  The various identity values are supplied
> ++diff -r 2ec638646e86 -r a6eef545f1a2 src/share/vm/prims/jniCheck.cpp
> ++--- openjdk/hotspot/src/share/vm/prims/jniCheck.cpp   Tue Oct 25 04:07:20 2011 -0700
> +++++ openjdk/hotspot/src/share/vm/prims/jniCheck.cpp   Tue Oct 25 08:17:15 2011 -0700
> ++@@ -107,7 +107,7 @@
> ++     if (env != xenv) {                                                   \
> ++       NativeReportJNIFatalError(thr, warn_wrong_jnienv);                 \
> ++     }                                                                    \
> ++-    __ENTRY(result_type, header, thr)
> +++    VM_ENTRY_BASE(result_type, header, thr)
> ++
> ++
> ++ #define UNCHECKED() (unchecked_jni_NativeInterface)
> ++diff -r 2ec638646e86 -r a6eef545f1a2 src/share/vm/prims/jvmtiEnter.xsl
> ++--- openjdk/hotspot/src/share/vm/prims/jvmtiEnter.xsl Tue Oct 25 04:07:20 2011 -0700
> +++++ openjdk/hotspot/src/share/vm/prims/jvmtiEnter.xsl Tue Oct 25 08:17:15 2011 -0700
> ++@@ -426,7 +426,7 @@
> ++     <xsl:value-of select="$space"/>
> ++     <xsl:text>ThreadInVMfromNative __tiv(current_thread);</xsl:text>
> ++     <xsl:value-of select="$space"/>
> ++-    <xsl:text>__ENTRY(jvmtiError, </xsl:text>
> +++    <xsl:text>VM_ENTRY_BASE(jvmtiError, </xsl:text>
> ++     <xsl:apply-templates select="." mode="functionid"/>
> ++     <xsl:text> , current_thread)</xsl:text>
> ++     <xsl:value-of select="$space"/>
> ++diff -r 2ec638646e86 -r a6eef545f1a2 src/share/vm/prims/jvmtiEnv.cpp
> ++--- openjdk/hotspot/src/share/vm/prims/jvmtiEnv.cpp   Tue Oct 25 04:07:20 2011 -0700
> +++++ openjdk/hotspot/src/share/vm/prims/jvmtiEnv.cpp   Tue Oct 25 08:17:15 2011 -0700
> ++@@ -173,7 +173,7 @@
> ++     // from native so as to resolve the jthread.
> ++
> ++     ThreadInVMfromNative __tiv(current_thread);
> ++-    __ENTRY(jvmtiError, JvmtiEnv::GetThreadLocalStorage , current_thread)
> +++    VM_ENTRY_BASE(jvmtiError, JvmtiEnv::GetThreadLocalStorage , current_thread)
> ++     debug_only(VMNativeEntryWrapper __vew;)
> ++
> ++     oop thread_oop = JNIHandles::resolve_external_guard(thread);
> ++diff -r 2ec638646e86 -r a6eef545f1a2 src/share/vm/prims/jvmtiExport.cpp
> ++--- openjdk/hotspot/src/share/vm/prims/jvmtiExport.cpp        Tue Oct 25 04:07:20 2011 -0700
> +++++ openjdk/hotspot/src/share/vm/prims/jvmtiExport.cpp        Tue Oct 25 08:17:15 2011 -0700
> ++@@ -373,7 +373,7 @@
> ++     JavaThread* current_thread = (JavaThread*) ThreadLocalStorage::thread();
> ++     // transition code: native to VM
> ++     ThreadInVMfromNative __tiv(current_thread);
> ++-    __ENTRY(jvmtiEnv*, JvmtiExport::get_jvmti_interface, current_thread)
> +++    VM_ENTRY_BASE(jvmtiEnv*, JvmtiExport::get_jvmti_interface, current_thread)
> ++     debug_only(VMNativeEntryWrapper __vew;)
> ++
> ++     JvmtiEnv *jvmti_env = JvmtiEnv::create_a_jvmti(version);
> ++diff -r 2ec638646e86 -r a6eef545f1a2 src/share/vm/runtime/interfaceSupport.hpp
> ++--- openjdk/hotspot/src/share/vm/runtime/interfaceSupport.hpp Tue Oct 25 04:07:20 2011 -0700
> +++++ openjdk/hotspot/src/share/vm/runtime/interfaceSupport.hpp Tue Oct 25 08:17:15 2011 -0700
> ++@@ -72,9 +72,9 @@
> ++   }
> ++ };
> ++
> ++-// InterfaceSupport provides functionality used by the __LEAF and __ENTRY
> ++-// macros. These macros are used to guard entry points into the VM and
> ++-// perform checks upon leave of the VM.
> +++// InterfaceSupport provides functionality used by the VM_LEAF_BASE and
> +++// VM_ENTRY_BASE macros. These macros are used to guard entry points into
> +++// the VM and perform checks upon leave of the VM.
> ++
> ++
> ++ class InterfaceSupport: AllStatic {
> ++@@ -433,7 +433,7 @@
> ++
> ++ // LEAF routines do not lock, GC or throw exceptions
> ++
> ++-#define __LEAF(result_type, header)                                  \
> +++#define VM_LEAF_BASE(result_type, header)                            \
> ++   TRACE_CALL(result_type, header)                                    \
> ++   debug_only(NoHandleMark __hm;)                                     \
> ++   /* begin of body */
> ++@@ -441,7 +441,7 @@
> ++
> ++ // ENTRY routines may lock, GC and throw exceptions
> ++
> ++-#define __ENTRY(result_type, header, thread)                         \
> +++#define VM_ENTRY_BASE(result_type, header, thread)                   \
> ++   TRACE_CALL(result_type, header)                                    \
> ++   HandleMarkCleaner __hm(thread);                                    \
> ++   Thread* THREAD = thread;                                           \
> ++@@ -450,7 +450,7 @@
> ++
> ++ // QUICK_ENTRY routines behave like ENTRY but without a handle mark
> ++
> ++-#define __QUICK_ENTRY(result_type, header, thread)                   \
> +++#define VM_QUICK_ENTRY_BASE(result_type, header, thread)             \
> ++   TRACE_CALL(result_type, header)                                    \
> ++   debug_only(NoHandleMark __hm;)                                     \
> ++   Thread* THREAD = thread;                                           \
> ++@@ -463,20 +463,20 @@
> ++ #define IRT_ENTRY(result_type, header)                               \
> ++   result_type header {                                               \
> ++     ThreadInVMfromJava __tiv(thread);                                \
> ++-    __ENTRY(result_type, header, thread)                             \
> +++    VM_ENTRY_BASE(result_type, header, thread)                       \
> ++     debug_only(VMEntryWrapper __vew;)
> ++
> ++
> ++ #define IRT_LEAF(result_type, header)                                \
> ++   result_type header {                                               \
> ++-    __LEAF(result_type, header)                                      \
> +++    VM_LEAF_BASE(result_type, header)                                \
> ++     debug_only(No_Safepoint_Verifier __nspv(true);)
> ++
> ++
> ++ #define IRT_ENTRY_NO_ASYNC(result_type, header)                      \
> ++   result_type header {                                               \
> ++     ThreadInVMfromJavaNoAsyncException __tiv(thread);                \
> ++-    __ENTRY(result_type, header, thread)                             \
> +++    VM_ENTRY_BASE(result_type, header, thread)                       \
> ++     debug_only(VMEntryWrapper __vew;)
> ++
> ++ // Another special case for nmethod_entry_point so the nmethod that the
> ++@@ -487,7 +487,7 @@
> ++   result_type header {                                               \
> ++     nmethodLocker _nmlock(nm);                                       \
> ++     ThreadInVMfromJavaNoAsyncException __tiv(thread);                                \
> ++-    __ENTRY(result_type, header, thread)
> +++    VM_ENTRY_BASE(result_type, header, thread)
> ++
> ++ #define IRT_END }
> ++
> ++@@ -497,20 +497,20 @@
> ++ #define JRT_ENTRY(result_type, header)                               \
> ++   result_type header {                                               \
> ++     ThreadInVMfromJava __tiv(thread);                                \
> ++-    __ENTRY(result_type, header, thread)                             \
> +++    VM_ENTRY_BASE(result_type, header, thread)                       \
> ++     debug_only(VMEntryWrapper __vew;)
> ++
> ++
> ++ #define JRT_LEAF(result_type, header)                                \
> ++   result_type header {                                               \
> ++-  __LEAF(result_type, header)                                        \
> +++  VM_LEAF_BASE(result_type, header)                                  \
> ++   debug_only(JRT_Leaf_Verifier __jlv;)
> ++
> ++
> ++ #define JRT_ENTRY_NO_ASYNC(result_type, header)                      \
> ++   result_type header {                                               \
> ++     ThreadInVMfromJavaNoAsyncException __tiv(thread);                \
> ++-    __ENTRY(result_type, header, thread)                             \
> +++    VM_ENTRY_BASE(result_type, header, thread)                       \
> ++     debug_only(VMEntryWrapper __vew;)
> ++
> ++ // Same as JRT Entry but allows for return value after the safepoint
> ++@@ -543,11 +543,11 @@
> ++     assert( !VerifyJNIEnvThread || (thread == Thread::current()), "JNIEnv is only valid in same thread"); \
> ++     ThreadInVMfromNative __tiv(thread);                              \
> ++     debug_only(VMNativeEntryWrapper __vew;)                          \
> ++-    __ENTRY(result_type, header, thread)
> +++    VM_ENTRY_BASE(result_type, header, thread)
> ++
> ++
> ++ // Ensure that the VMNativeEntryWrapper constructor, which can cause
> ++-// a GC, is called outside the NoHandleMark (set via __QUICK_ENTRY).
> +++// a GC, is called outside the NoHandleMark (set via VM_QUICK_ENTRY_BASE).
> ++ #define JNI_QUICK_ENTRY(result_type, header)                         \
> ++ extern "C" {                                                         \
> ++   result_type JNICALL header {                                \
> ++@@ -555,7 +555,7 @@
> ++     assert( !VerifyJNIEnvThread || (thread == Thread::current()), "JNIEnv is only valid in same thread"); \
> ++     ThreadInVMfromNative __tiv(thread);                              \
> ++     debug_only(VMNativeEntryWrapper __vew;)                          \
> ++-    __QUICK_ENTRY(result_type, header, thread)
> +++    VM_QUICK_ENTRY_BASE(result_type, header, thread)
> ++
> ++
> ++ #define JNI_LEAF(result_type, header)                                \
> ++@@ -563,7 +563,7 @@
> ++   result_type JNICALL header {                                \
> ++     JavaThread* thread=JavaThread::thread_from_jni_environment(env); \
> ++     assert( !VerifyJNIEnvThread || (thread == Thread::current()), "JNIEnv is only valid in same thread"); \
> ++-    __LEAF(result_type, header)
> +++    VM_LEAF_BASE(result_type, header)
> ++
> ++
> ++ // Close the routine and the extern "C"
> ++@@ -579,7 +579,7 @@
> ++     JavaThread* thread=JavaThread::thread_from_jni_environment(env); \
> ++     ThreadInVMfromNative __tiv(thread);                              \
> ++     debug_only(VMNativeEntryWrapper __vew;)                          \
> ++-    __ENTRY(result_type, header, thread)
> +++    VM_ENTRY_BASE(result_type, header, thread)
> ++
> ++
> ++ #define JVM_ENTRY_NO_ENV(result_type, header)                        \
> ++@@ -588,7 +588,7 @@
> ++     JavaThread* thread = (JavaThread*)ThreadLocalStorage::thread();  \
> ++     ThreadInVMfromNative __tiv(thread);                              \
> ++     debug_only(VMNativeEntryWrapper __vew;)                          \
> ++-    __ENTRY(result_type, header, thread)
> +++    VM_ENTRY_BASE(result_type, header, thread)
> ++
> ++
> ++ #define JVM_QUICK_ENTRY(result_type, header)                         \
> ++@@ -597,14 +597,14 @@
> ++     JavaThread* thread=JavaThread::thread_from_jni_environment(env); \
> ++     ThreadInVMfromNative __tiv(thread);                              \
> ++     debug_only(VMNativeEntryWrapper __vew;)                          \
> ++-    __QUICK_ENTRY(result_type, header, thread)
> +++    VM_QUICK_ENTRY_BASE(result_type, header, thread)
> ++
> ++
> ++ #define JVM_LEAF(result_type, header)                                \
> ++ extern "C" {                                                         \
> ++   result_type JNICALL header {                                       \
> ++     VM_Exit::block_if_vm_exited();                                   \
> ++-    __LEAF(result_type, header)
> +++    VM_LEAF_BASE(result_type, header)
> ++
> ++
> ++ #define JVM_END } }
> ++
> ++iff --git a/Makefile.am b/Makefile.am
> ++-- a/Makefile.am
> ++++ b/Makefile.am
> ++@ -362,7 +362,8 @@
> ++      patches/openjdk/7036148-npe-null-jmenu-name.patch \
> ++      patches/jtreg-bug7036148-test.patch \
> ++      patches/support_linux_3.patch \
> ++      patches/openjdk/6826104-npe_on_app_and_toolkit_modal_dialog_click.patch
> ++      patches/openjdk/6826104-npe_on_app_and_toolkit_modal_dialog_click.patch \
> ++      patches/openjdk/7103224-glibc_name_collision.patch
> ++
> ++if WITH_ALT_HSBUILD
> ++ICEDTEA_PATCHES += \
> ++iff --git a/patches/openjdk/7103224-glibc_name_collision.patch b/patches/openjdk/7103224-glibc_name_collision.patch
> ++ew file mode 100644
> ++-- /dev/null
> ++++ b/patches/openjdk/7103224-glibc_name_collision.patch
> ++@ -0,0 +1,236 @@
> ++# HG changeset patch
> ++# User never
> ++# Date 1319555835 25200
> ++# Node ID a6eef545f1a2ceca6aeadf688a965df600ffef28
> ++# Parent  2ec638646e86e455978c31a9d47fc0ec271ed926
> ++7103224: collision between __LEAF define in interfaceSupport.hpp and /usr/include/sys/cdefs.h with gcc
> ++Reviewed-by: never
> ++Contributed-by: Omair Majid <omajid@...>
> ++
> ++diff -r 2ec638646e86 -r a6eef545f1a2 src/share/vm/opto/addnode.cpp
> ++--- openjdk/hotspot/src/share/vm/opto/addnode.cpp     Tue Oct 25 04:07:20 2011 -0700
> +++++ openjdk/hotspot/src/share/vm/opto/addnode.cpp     Tue Oct 25 08:17:15 2011 -0700
> ++@@ -34,8 +34,6 @@
> ++
> ++ // Portions of code courtesy of Clifford Click
> ++
> ++-#define MAXFLOAT        ((float)3.40282346638528860e+38)
> ++-
> ++ // Classic Add functionality.  This covers all the usual 'add' behaviors for
> ++ // an algebraic ring.  Add-integer, add-float, add-double, and binary-or are
> ++ // all inherited from this class.  The various identity values are supplied
> ++diff -r 2ec638646e86 -r a6eef545f1a2 src/share/vm/prims/jniCheck.cpp
> ++--- openjdk/hotspot/src/share/vm/prims/jniCheck.cpp   Tue Oct 25 04:07:20 2011 -0700
> +++++ openjdk/hotspot/src/share/vm/prims/jniCheck.cpp   Tue Oct 25 08:17:15 2011 -0700
> ++@@ -107,7 +107,7 @@
> ++     if (env != xenv) {                                                   \
> ++       NativeReportJNIFatalError(thr, warn_wrong_jnienv);                 \
> ++     }                                                                    \
> ++-    __ENTRY(result_type, header, thr)
> +++    VM_ENTRY_BASE(result_type, header, thr)
> ++
> ++
> ++ #define UNCHECKED() (unchecked_jni_NativeInterface)
> ++diff -r 2ec638646e86 -r a6eef545f1a2 src/share/vm/prims/jvmtiEnter.xsl
> ++--- openjdk/hotspot/src/share/vm/prims/jvmtiEnter.xsl Tue Oct 25 04:07:20 2011 -0700
> +++++ openjdk/hotspot/src/share/vm/prims/jvmtiEnter.xsl Tue Oct 25 08:17:15 2011 -0700
> ++@@ -426,7 +426,7 @@
> ++     <xsl:value-of select="$space"/>
> ++     <xsl:text>ThreadInVMfromNative __tiv(current_thread);</xsl:text>
> ++     <xsl:value-of select="$space"/>
> ++-    <xsl:text>__ENTRY(jvmtiError, </xsl:text>
> +++    <xsl:text>VM_ENTRY_BASE(jvmtiError, </xsl:text>
> ++     <xsl:apply-templates select="." mode="functionid"/>
> ++     <xsl:text> , current_thread)</xsl:text>
> ++     <xsl:value-of select="$space"/>
> ++diff -r 2ec638646e86 -r a6eef545f1a2 src/share/vm/prims/jvmtiEnv.cpp
> ++--- openjdk/hotspot/src/share/vm/prims/jvmtiEnv.cpp   Tue Oct 25 04:07:20 2011 -0700
> +++++ openjdk/hotspot/src/share/vm/prims/jvmtiEnv.cpp   Tue Oct 25 08:17:15 2011 -0700
> ++@@ -173,7 +173,7 @@
> ++     // from native so as to resolve the jthread.
> ++
> ++     ThreadInVMfromNative __tiv(current_thread);
> ++-    __ENTRY(jvmtiError, JvmtiEnv::GetThreadLocalStorage , current_thread)
> +++    VM_ENTRY_BASE(jvmtiError, JvmtiEnv::GetThreadLocalStorage , current_thread)
> ++     debug_only(VMNativeEntryWrapper __vew;)
> ++
> ++     oop thread_oop = JNIHandles::resolve_external_guard(thread);
> ++diff -r 2ec638646e86 -r a6eef545f1a2 src/share/vm/prims/jvmtiExport.cpp
> ++--- openjdk/hotspot/src/share/vm/prims/jvmtiExport.cpp        Tue Oct 25 04:07:20 2011 -0700
> +++++ openjdk/hotspot/src/share/vm/prims/jvmtiExport.cpp        Tue Oct 25 08:17:15 2011 -0700
> ++@@ -373,7 +373,7 @@
> ++     JavaThread* current_thread = (JavaThread*) ThreadLocalStorage::thread();
> ++     // transition code: native to VM
> ++     ThreadInVMfromNative __tiv(current_thread);
> ++-    __ENTRY(jvmtiEnv*, JvmtiExport::get_jvmti_interface, current_thread)
> +++    VM_ENTRY_BASE(jvmtiEnv*, JvmtiExport::get_jvmti_interface, current_thread)
> ++     debug_only(VMNativeEntryWrapper __vew;)
> ++
> ++     JvmtiEnv *jvmti_env = JvmtiEnv::create_a_jvmti(version);
> ++diff -r 2ec638646e86 -r a6eef545f1a2 src/share/vm/runtime/interfaceSupport.hpp
> ++--- openjdk/hotspot/src/share/vm/runtime/interfaceSupport.hpp Tue Oct 25 04:07:20 2011 -0700
> +++++ openjdk/hotspot/src/share/vm/runtime/interfaceSupport.hpp Tue Oct 25 08:17:15 2011 -0700
> ++@@ -72,9 +72,9 @@
> ++   }
> ++ };
> ++
> ++-// InterfaceSupport provides functionality used by the __LEAF and __ENTRY
> ++-// macros. These macros are used to guard entry points into the VM and
> ++-// perform checks upon leave of the VM.
> +++// InterfaceSupport provides functionality used by the VM_LEAF_BASE and
> +++// VM_ENTRY_BASE macros. These macros are used to guard entry points into
> +++// the VM and perform checks upon leave of the VM.
> ++
> ++
> ++ class InterfaceSupport: AllStatic {
> ++@@ -433,7 +433,7 @@
> ++
> ++ // LEAF routines do not lock, GC or throw exceptions
> ++
> ++-#define __LEAF(result_type, header)                                  \
> +++#define VM_LEAF_BASE(result_type, header)                            \
> ++   TRACE_CALL(result_type, header)                                    \
> ++   debug_only(NoHandleMark __hm;)                                     \
> ++   /* begin of body */
> ++@@ -441,7 +441,7 @@
> ++
> ++ // ENTRY routines may lock, GC and throw exceptions
> ++
> ++-#define __ENTRY(result_type, header, thread)                         \
> +++#define VM_ENTRY_BASE(result_type, header, thread)                   \
> ++   TRACE_CALL(result_type, header)                                    \
> ++   HandleMarkCleaner __hm(thread);                                    \
> ++   Thread* THREAD = thread;                                           \
> ++@@ -450,7 +450,7 @@
> ++
> ++ // QUICK_ENTRY routines behave like ENTRY but without a handle mark
> ++
> ++-#define __QUICK_ENTRY(result_type, header, thread)                   \
> +++#define VM_QUICK_ENTRY_BASE(result_type, header, thread)             \
> ++   TRACE_CALL(result_type, header)                                    \
> ++   debug_only(NoHandleMark __hm;)                                     \
> ++   Thread* THREAD = thread;                                           \
> ++@@ -463,20 +463,20 @@
> ++ #define IRT_ENTRY(result_type, header)                               \
> ++   result_type header {                                               \
> ++     ThreadInVMfromJava __tiv(thread);                                \
> ++-    __ENTRY(result_type, header, thread)                             \
> +++    VM_ENTRY_BASE(result_type, header, thread)                       \
> ++     debug_only(VMEntryWrapper __vew;)
> ++
> ++
> ++ #define IRT_LEAF(result_type, header)                                \
> ++   result_type header {                                               \
> ++-    __LEAF(result_type, header)                                      \
> +++    VM_LEAF_BASE(result_type, header)                                \
> ++     debug_only(No_Safepoint_Verifier __nspv(true);)
> ++
> ++
> ++ #define IRT_ENTRY_NO_ASYNC(result_type, header)                      \
> ++   result_type header {                                               \
> ++     ThreadInVMfromJavaNoAsyncException __tiv(thread);                \
> ++-    __ENTRY(result_type, header, thread)                             \
> +++    VM_ENTRY_BASE(result_type, header, thread)                       \
> ++     debug_only(VMEntryWrapper __vew;)
> ++
> ++ // Another special case for nmethod_entry_point so the nmethod that the
> ++@@ -487,7 +487,7 @@
> ++   result_type header {                                               \
> ++     nmethodLocker _nmlock(nm);                                       \
> ++     ThreadInVMfromJavaNoAsyncException __tiv(thread);                                \
> ++-    __ENTRY(result_type, header, thread)
> +++    VM_ENTRY_BASE(result_type, header, thread)
> ++
> ++ #define IRT_END }
> ++
> ++@@ -497,20 +497,20 @@
> ++ #define JRT_ENTRY(result_type, header)                               \
> ++   result_type header {                                               \
> ++     ThreadInVMfromJava __tiv(thread);                                \
> ++-    __ENTRY(result_type, header, thread)                             \
> +++    VM_ENTRY_BASE(result_type, header, thread)                       \
> ++     debug_only(VMEntryWrapper __vew;)
> ++
> ++
> ++ #define JRT_LEAF(result_type, header)                                \
> ++   result_type header {                                               \
> ++-  __LEAF(result_type, header)                                        \
> +++  VM_LEAF_BASE(result_type, header)                                  \
> ++   debug_only(JRT_Leaf_Verifier __jlv;)
> ++
> ++
> ++ #define JRT_ENTRY_NO_ASYNC(result_type, header)                      \
> ++   result_type header {                                               \
> ++     ThreadInVMfromJavaNoAsyncException __tiv(thread);                \
> ++-    __ENTRY(result_type, header, thread)                             \
> +++    VM_ENTRY_BASE(result_type, header, thread)                       \
> ++     debug_only(VMEntryWrapper __vew;)
> ++
> ++ // Same as JRT Entry but allows for return value after the safepoint
> ++@@ -543,11 +543,11 @@
> ++     assert( !VerifyJNIEnvThread || (thread == Thread::current()), "JNIEnv is only valid in same thread"); \
> ++     ThreadInVMfromNative __tiv(thread);                              \
> ++     debug_only(VMNativeEntryWrapper __vew;)                          \
> ++-    __ENTRY(result_type, header, thread)
> +++    VM_ENTRY_BASE(result_type, header, thread)
> ++
> ++
> ++ // Ensure that the VMNativeEntryWrapper constructor, which can cause
> ++-// a GC, is called outside the NoHandleMark (set via __QUICK_ENTRY).
> +++// a GC, is called outside the NoHandleMark (set via VM_QUICK_ENTRY_BASE).
> ++ #define JNI_QUICK_ENTRY(result_type, header)                         \
> ++ extern "C" {                                                         \
> ++   result_type JNICALL header {                                \
> ++@@ -555,7 +555,7 @@
> ++     assert( !VerifyJNIEnvThread || (thread == Thread::current()), "JNIEnv is only valid in same thread"); \
> ++     ThreadInVMfromNative __tiv(thread);                              \
> ++     debug_only(VMNativeEntryWrapper __vew;)                          \
> ++-    __QUICK_ENTRY(result_type, header, thread)
> +++    VM_QUICK_ENTRY_BASE(result_type, header, thread)
> ++
> ++
> ++ #define JNI_LEAF(result_type, header)                                \
> ++@@ -563,7 +563,7 @@
> ++   result_type JNICALL header {                                \
> ++     JavaThread* thread=JavaThread::thread_from_jni_environment(env); \
> ++     assert( !VerifyJNIEnvThread || (thread == Thread::current()), "JNIEnv is only valid in same thread"); \
> ++-    __LEAF(result_type, header)
> +++    VM_LEAF_BASE(result_type, header)
> ++
> ++
> ++ // Close the routine and the extern "C"
> ++@@ -579,7 +579,7 @@
> ++     JavaThread* thread=JavaThread::thread_from_jni_environment(env); \
> ++     ThreadInVMfromNative __tiv(thread);                              \
> ++     debug_only(VMNativeEntryWrapper __vew;)                          \
> ++-    __ENTRY(result_type, header, thread)
> +++    VM_ENTRY_BASE(result_type, header, thread)
> ++
> ++
> ++ #define JVM_ENTRY_NO_ENV(result_type, header)                        \
> ++@@ -588,7 +588,7 @@
> ++     JavaThread* thread = (JavaThread*)ThreadLocalStorage::thread();  \
> ++     ThreadInVMfromNative __tiv(thread);                              \
> ++     debug_only(VMNativeEntryWrapper __vew;)                          \
> ++-    __ENTRY(result_type, header, thread)
> +++    VM_ENTRY_BASE(result_type, header, thread)
> ++
> ++
> ++ #define JVM_QUICK_ENTRY(result_type, header)                         \
> ++@@ -597,14 +597,14 @@
> ++     JavaThread* thread=JavaThread::thread_from_jni_environment(env); \
> ++     ThreadInVMfromNative __tiv(thread);                              \
> ++     debug_only(VMNativeEntryWrapper __vew;)                          \
> ++-    __QUICK_ENTRY(result_type, header, thread)
> +++    VM_QUICK_ENTRY_BASE(result_type, header, thread)
> ++
> ++
> ++ #define JVM_LEAF(result_type, header)                                \
> ++ extern "C" {                                                         \
> ++   result_type JNICALL header {                                       \
> ++     VM_Exit::block_if_vm_exited();                                   \
> ++-    __LEAF(result_type, header)
> +++    VM_LEAF_BASE(result_type, header)
> ++
> ++
> ++ #define JVM_END } }
> diff --git a/recipes-core/icedtea/icedtea6-native_1.7.10.bb b/recipes-core/icedtea/icedtea6-native_1.7.10.bb
> index 54ac87d..a3edb98 100644
> --- a/recipes-core/icedtea/icedtea6-native_1.7.10.bb
> +++ b/recipes-core/icedtea/icedtea6-native_1.7.10.bb
> @@ -2,7 +2,7 @@ require ${PN}.inc
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>
>  SRC_URI = "\
>         http://icedtea.classpath.org/download/source/icedtea6-${PV}.tar.gz;name=iced \
> @@ -12,6 +12,7 @@ SRC_URI = "\
>         file://build-hacks-native.patch \
>         file://icedtea-sane-x86-arch-name.patch \
>          file://icedtea-javac-in.patch \
> +        file://glibc_name_collision.patch \
>         ${ICEDTEA_PATCHES} \
>         "
>  SRC_URI[ojdk.md5sum] = "078fe0ab744c98694decc77f2456c560"
> --
> 1.7.10.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


