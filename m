Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SwIAr-00061T-Ob
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 21:32:14 +0200
Received: by yenl13 with SMTP id l13so5823030yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2012 12:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=2uAN7SwCJBPK6/9Quyfban1vTU4LvnCwMNQi9wkqT9M=;
	b=uiJwqP2EzwJoCWvLMN8FdOddr7s9C1vemu3XWsST4KZSf4JChkCjkYG00JS8MosFGx
	kEgb1m1yIwY43oSR+NXDTbtVbApjfJ3rVJpSxrwTH3zBPc6I+LBkFHKpaIJHZofeLwMD
	M9bV43TNyvXygSFYlkUZgjioScVyj1Uq0jxfgqdQer4Hgn8SdIwU3Qyn3/3icXJmQS52
	6dPdIw0KgzZv2kZ7nq8eExHFkCkGxO2UI1RoaApKr/caU0RGenMvMiak0IqzIzsh8wgT
	kZCD8J4GTo4laLWRoHaRIW4W95xXgsn+vu3MLaef4M4cXvkx/gfgaAclR2k8H3kjphwG
	uCYw==
Received: by 10.68.228.2 with SMTP id se2mr46410277pbc.109.1343762431733;
	Tue, 31 Jul 2012 12:20:31 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id ph1sm846629pbb.45.2012.07.31.12.20.29
	(version=SSLv3 cipher=OTHER); Tue, 31 Jul 2012 12:20:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 12:20:25 -0700
Message-Id: <1343762425-3669-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-java][PATCH V2 3/3] icedtea-native: Fix build on ubuntu 12.04 release
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
X-List-Received-Date: Tue, 31 Jul 2012 19:32:15 -0000

It conflicts definitions from standard include
so backport a patch from upstream

When here also change the LICENSE field to be more compatible
to avoid warnings like

WARNING: icedtea6-native: No generic license file exists for: GPL in any
provider
WARNING: icedtea6-native: No generic license file exists for: with in
any provider
WARNING: icedtea6-native: No generic license file exists for: Classpath
in any provider
WARNING: icedtea6-native: No generic license file exists for: Exception
in any provider

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../icedtea-jdk-avoid-cdef-collision.patch         |  203 ++++++++++++++++++++
 recipes-core/icedtea/icedtea6-native.inc           |    2 +-
 recipes-core/icedtea/icedtea6-native_1.8.11.bb     |    4 +-
 recipes-core/openjdk/openjdk-6-common.inc          |    4 +-
 4 files changed, 209 insertions(+), 4 deletions(-)
 create mode 100644 recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-jdk-avoid-cdef-collision.patch

diff --git a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-jdk-avoid-cdef-collision.patch b/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-jdk-avoid-cdef-collision.patch
new file mode 100644
index 0000000..023ce4d
--- /dev/null
+++ b/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-jdk-avoid-cdef-collision.patch
@@ -0,0 +1,203 @@
+Fixes collisions with standard namespace
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport
+
+Index: openjdk/hotspot/src/share/vm/opto/addnode.cpp
+===================================================================
+--- openjdk/hotspot/src/share/vm/opto/addnode.cpp	2010-02-16 19:11:09.000000000 -0800
++++ openjdk/hotspot/src/share/vm/opto/addnode.cpp	2012-07-30 15:54:25.999551792 -0700
+@@ -27,8 +27,6 @@
+ #include "incls/_precompiled.incl"
+ #include "incls/_addnode.cpp.incl"
+ 
+-#define MAXFLOAT        ((float)3.40282346638528860e+38)
+-
+ // Classic Add functionality.  This covers all the usual 'add' behaviors for
+ // an algebraic ring.  Add-integer, add-float, add-double, and binary-or are
+ // all inherited from this class.  The various identity values are supplied
+Index: openjdk/hotspot/src/share/vm/prims/jniCheck.cpp
+===================================================================
+--- openjdk/hotspot/src/share/vm/prims/jniCheck.cpp	2010-02-16 19:11:10.000000000 -0800
++++ openjdk/hotspot/src/share/vm/prims/jniCheck.cpp	2012-07-30 16:05:20.779549364 -0700
+@@ -80,7 +80,7 @@
+     if (env != xenv) {                                                   \
+       NativeReportJNIFatalError(thr, warn_wrong_jnienv);                 \
+     }                                                                    \
+-    __ENTRY(result_type, header, thr)
++    VM_ENTRY_BASE(result_type, header, thr)
+ 
+ 
+ #define UNCHECKED() (unchecked_jni_NativeInterface)
+Index: openjdk/hotspot/src/share/vm/prims/jvmtiEnter.xsl
+===================================================================
+--- openjdk/hotspot/src/share/vm/prims/jvmtiEnter.xsl	2010-02-16 19:11:10.000000000 -0800
++++ openjdk/hotspot/src/share/vm/prims/jvmtiEnter.xsl	2012-07-30 16:03:50.491550815 -0700
+@@ -424,7 +424,7 @@
+     <xsl:value-of select="$space"/>
+     <xsl:text>ThreadInVMfromNative __tiv(current_thread);</xsl:text>
+     <xsl:value-of select="$space"/>
+-    <xsl:text>__ENTRY(jvmtiError, </xsl:text>
++    <xsl:text>VM_ENTRY_BASE(jvmtiError, </xsl:text>
+     <xsl:apply-templates select="." mode="functionid"/>
+     <xsl:text> , current_thread)</xsl:text>
+     <xsl:value-of select="$space"/>
+Index: openjdk/hotspot/src/share/vm/prims/jvmtiEnv.cpp
+===================================================================
+--- openjdk/hotspot/src/share/vm/prims/jvmtiEnv.cpp	2010-02-16 19:11:10.000000000 -0800
++++ openjdk/hotspot/src/share/vm/prims/jvmtiEnv.cpp	2012-07-30 16:04:03.683550594 -0700
+@@ -126,7 +126,7 @@
+     // from native so as to resolve the jthread.
+ 
+     ThreadInVMfromNative __tiv(current_thread);
+-    __ENTRY(jvmtiError, JvmtiEnv::GetThreadLocalStorage , current_thread)
++    VM_ENTRY_BASE(jvmtiError, JvmtiEnv::GetThreadLocalStorage , current_thread)
+     debug_only(VMNativeEntryWrapper __vew;)
+ 
+     oop thread_oop = JNIHandles::resolve_external_guard(thread);
+Index: openjdk/hotspot/src/share/vm/prims/jvmtiExport.cpp
+===================================================================
+--- openjdk/hotspot/src/share/vm/prims/jvmtiExport.cpp	2010-02-16 19:11:10.000000000 -0800
++++ openjdk/hotspot/src/share/vm/prims/jvmtiExport.cpp	2012-07-30 15:59:43.175550785 -0700
+@@ -345,7 +345,7 @@
+     JavaThread* current_thread = (JavaThread*) ThreadLocalStorage::thread();
+     // transition code: native to VM
+     ThreadInVMfromNative __tiv(current_thread);
+-    __ENTRY(jvmtiEnv*, JvmtiExport::get_jvmti_interface, current_thread)
++    VM_ENTRY_BASE(jvmtiEnv*, JvmtiExport::get_jvmti_interface, current_thread)
+     debug_only(VMNativeEntryWrapper __vew;)
+ 
+     JvmtiEnv *jvmti_env = JvmtiEnv::create_a_jvmti(version);
+Index: openjdk/hotspot/src/share/vm/runtime/interfaceSupport.hpp
+===================================================================
+--- openjdk/hotspot/src/share/vm/runtime/interfaceSupport.hpp	2010-02-16 19:11:10.000000000 -0800
++++ openjdk/hotspot/src/share/vm/runtime/interfaceSupport.hpp	2012-07-30 16:36:53.391544578 -0700
+@@ -46,7 +46,7 @@
+   }
+ };
+ 
+-// InterfaceSupport provides functionality used by the __LEAF and __ENTRY
++// InterfaceSupport provides functionality used by the VM_LEAF_BASE and VM_ENTRY_BASE
+ // macros. These macros are used to guard entry points into the VM and
+ // perform checks upon leave of the VM.
+ 
+@@ -391,7 +391,7 @@
+ 
+ // LEAF routines do not lock, GC or throw exceptions
+ 
+-#define __LEAF(result_type, header)                                  \
++#define VM_LEAF_BASE(result_type, header)                                  \
+   TRACE_CALL(result_type, header)                                    \
+   debug_only(NoHandleMark __hm;)                                     \
+   /* begin of body */
+@@ -399,7 +399,7 @@
+ 
+ // ENTRY routines may lock, GC and throw exceptions
+ 
+-#define __ENTRY(result_type, header, thread)                         \
++#define VM_ENTRY_BASE(result_type, header, thread)                         \
+   TRACE_CALL(result_type, header)                                    \
+   HandleMarkCleaner __hm(thread);                                    \
+   Thread* THREAD = thread;                                           \
+@@ -421,20 +421,20 @@
+ #define IRT_ENTRY(result_type, header)                               \
+   result_type header {                                               \
+     ThreadInVMfromJava __tiv(thread);                                \
+-    __ENTRY(result_type, header, thread)                             \
++    VM_ENTRY_BASE(result_type, header, thread)                             \
+     debug_only(VMEntryWrapper __vew;)
+ 
+ 
+ #define IRT_LEAF(result_type, header)                                \
+   result_type header {                                               \
+-    __LEAF(result_type, header)                                      \
++    VM_LEAF_BASE(result_type, header)                                      \
+     debug_only(No_Safepoint_Verifier __nspv(true);)
+ 
+ 
+ #define IRT_ENTRY_NO_ASYNC(result_type, header)                      \
+   result_type header {                                               \
+     ThreadInVMfromJavaNoAsyncException __tiv(thread);                \
+-    __ENTRY(result_type, header, thread)                             \
++    VM_ENTRY_BASE(result_type, header, thread)                             \
+     debug_only(VMEntryWrapper __vew;)
+ 
+ // Another special case for nmethod_entry_point so the nmethod that the
+@@ -445,7 +445,7 @@
+   result_type header {                                               \
+     nmethodLocker _nmlock(nm);                                       \
+     ThreadInVMfromJavaNoAsyncException __tiv(thread);                                \
+-    __ENTRY(result_type, header, thread)
++    VM_ENTRY_BASE(result_type, header, thread)
+ 
+ #define IRT_END }
+ 
+@@ -455,20 +455,20 @@
+ #define JRT_ENTRY(result_type, header)                               \
+   result_type header {                                               \
+     ThreadInVMfromJava __tiv(thread);                                \
+-    __ENTRY(result_type, header, thread)                             \
++    VM_ENTRY_BASE(result_type, header, thread)                             \
+     debug_only(VMEntryWrapper __vew;)
+ 
+ 
+ #define JRT_LEAF(result_type, header)                                \
+   result_type header {                                               \
+-  __LEAF(result_type, header)                                        \
++  VM_LEAF_BASE(result_type, header)                                        \
+   debug_only(JRT_Leaf_Verifier __jlv;)
+ 
+ 
+ #define JRT_ENTRY_NO_ASYNC(result_type, header)                      \
+   result_type header {                                               \
+     ThreadInVMfromJavaNoAsyncException __tiv(thread);                \
+-    __ENTRY(result_type, header, thread)                             \
++    VM_ENTRY_BASE(result_type, header, thread)                             \
+     debug_only(VMEntryWrapper __vew;)
+ 
+ // Same as JRT Entry but allows for return value after the safepoint
+@@ -501,7 +501,7 @@
+     assert( !VerifyJNIEnvThread || (thread == Thread::current()), "JNIEnv is only valid in same thread"); \
+     ThreadInVMfromNative __tiv(thread);                              \
+     debug_only(VMNativeEntryWrapper __vew;)                          \
+-    __ENTRY(result_type, header, thread)
++    VM_ENTRY_BASE(result_type, header, thread)
+ 
+ 
+ // Ensure that the VMNativeEntryWrapper constructor, which can cause
+@@ -521,7 +521,7 @@
+   result_type JNICALL header {                                \
+     JavaThread* thread=JavaThread::thread_from_jni_environment(env); \
+     assert( !VerifyJNIEnvThread || (thread == Thread::current()), "JNIEnv is only valid in same thread"); \
+-    __LEAF(result_type, header)
++    VM_LEAF_BASE(result_type, header)
+ 
+ 
+ // Close the routine and the extern "C"
+@@ -537,7 +537,7 @@
+     JavaThread* thread=JavaThread::thread_from_jni_environment(env); \
+     ThreadInVMfromNative __tiv(thread);                              \
+     debug_only(VMNativeEntryWrapper __vew;)                          \
+-    __ENTRY(result_type, header, thread)
++    VM_ENTRY_BASE(result_type, header, thread)
+ 
+ 
+ #define JVM_ENTRY_NO_ENV(result_type, header)                        \
+@@ -546,7 +546,7 @@
+     JavaThread* thread = (JavaThread*)ThreadLocalStorage::thread();  \
+     ThreadInVMfromNative __tiv(thread);                              \
+     debug_only(VMNativeEntryWrapper __vew;)                          \
+-    __ENTRY(result_type, header, thread)
++    VM_ENTRY_BASE(result_type, header, thread)
+ 
+ 
+ #define JVM_QUICK_ENTRY(result_type, header)                         \
+@@ -562,7 +562,7 @@
+ extern "C" {                                                         \
+   result_type JNICALL header {                                       \
+     VM_Exit::block_if_vm_exited();                                   \
+-    __LEAF(result_type, header)
++    VM_LEAF_BASE(result_type, header)
+ 
+ 
+ #define JVM_END } }
diff --git a/recipes-core/icedtea/icedtea6-native.inc b/recipes-core/icedtea/icedtea6-native.inc
index 700bfb0..1414ac3 100644
--- a/recipes-core/icedtea/icedtea6-native.inc
+++ b/recipes-core/icedtea/icedtea6-native.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Harness to build the source code from OpenJDK using Free Software build tools"
 HOMEPAGE = "http://icedtea.classpath.org"
-LICENSE  = "GPL with Classpath Exception"
+LICENSE  = "GPL-2.0-with-classpath-exception"
 INC_PR = "r5"
 
 DEPENDS = "virtual/javac-native virtual/java-native classpath-native \
diff --git a/recipes-core/icedtea/icedtea6-native_1.8.11.bb b/recipes-core/icedtea/icedtea6-native_1.8.11.bb
index 4e3ff27..7c2e6ea 100644
--- a/recipes-core/icedtea/icedtea6-native_1.8.11.bb
+++ b/recipes-core/icedtea/icedtea6-native_1.8.11.bb
@@ -4,7 +4,7 @@ require ${PN}.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 SRC_URI = "\
 	http://icedtea.classpath.org/download/source/icedtea6-${PV}.tar.gz;name=iced \
@@ -43,6 +43,7 @@ ICEDTEA_PATCHES = "\
         file://icedtea-hotspot-make-arch-sane-for-x86.patch;apply=no \
         file://icedtea-jdk-sane-x86-arch.patch;apply=no \
         file://icedtea-unbreak-float.patch;apply=no \
+        file://icedtea-jdk-avoid-cdef-collision.patch;apply=no \
 	"
 
 export DISTRIBUTION_PATCHES = "\
@@ -52,6 +53,7 @@ export DISTRIBUTION_PATCHES = "\
 	patches/icedtea-hotspot-make-arch-sane-for-x86.patch \
         patches/icedtea-jdk-sane-x86-arch.patch \
 	patches/icedtea-unbreak-float.patch \
+        patches/icedtea-jdk-avoid-cdef-collision.patch \
 	"
 
 EXTRA_OECONF += " --with-jaxws-drop-zip=${DL_DIR}/jdk6-jaxws-2009_10_27.zip \
diff --git a/recipes-core/openjdk/openjdk-6-common.inc b/recipes-core/openjdk/openjdk-6-common.inc
index c7693fe..a9adbc8 100644
--- a/recipes-core/openjdk/openjdk-6-common.inc
+++ b/recipes-core/openjdk/openjdk-6-common.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Java runtime based upon the OpenJDK- and Icedtea Project"
 HOMEPAGE = "http://icedtea.classpath.org"
-LICENSE  = "GPL with Classpath Exception"
+LICENSE  = "GPL-2.0-with-classpath-exception"
 PRIORITY = "optional"
 SECTION  = "libs"
 
@@ -10,7 +10,7 @@ ICEDTEA = "NEEDS TO BE SET"
 S = "${WORKDIR}/${ICEDTEA}"
 B = "${S}/build"
 
-INC_PR = "r19"
+INC_PR = "r20"
 
 SRC_URI = "\
   ${ICEDTEA_URI} \
-- 
1.7.5.4



