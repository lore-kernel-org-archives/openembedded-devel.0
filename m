Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1QJKxo-00051G-C8
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 09:33:08 +0200
Received: from [2001:638:602:1183:4da:ff61:f5c:b7b4] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1QJKv6-0007dQ-33 by authid <stefan@sostec.de> with srv_auth_cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 09:30:25 +0200
Received: from stefan by excalibur.local with local (Exim 4.75)
	(envelope-from <stefan@excalibur.local>) id 1QJKv4-00013p-T5
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 09:30:18 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 May 2011 09:30:18 +0200
Message-Id: <39968efb6968eb70ebd753e5a21f9fa9889d5be6.1304925139.git.stefan@buglabs.net>
X-Mailer: git-send-email 1.7.5.1
In-Reply-To: <cover.1304925139.git.stefan@buglabs.net>
References: <cover.1304925139.git.stefan@buglabs.net>
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: [PATCH 2011.03-maintenance 7/7] cacao-native: add fix for vm-shutdown and multiple threads are involved
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
X-List-Received-Date: Mon, 09 May 2011 07:33:08 -0000

From: Henning Heinold <h.heinold@tarent.de>

* bump PR

Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
---
 recipes/cacao/cacao-native_hg.bb              |    6 +-
 recipes/cacao/files/cacao-shutdownguard.patch |  180 +++++++++++++++++++++++++
 2 files changed, 184 insertions(+), 2 deletions(-)
 create mode 100644 recipes/cacao/files/cacao-shutdownguard.patch

diff --git a/recipes/cacao/cacao-native_hg.bb b/recipes/cacao/cacao-native_hg.bb
index 82f56eb..dc35ce8 100644
--- a/recipes/cacao/cacao-native_hg.bb
+++ b/recipes/cacao/cacao-native_hg.bb
@@ -1,9 +1,11 @@
 require cacao-native.inc
 
 PV = "1.1.0+hgr${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 SRCREV = "c7bf150bfa46"
-SRC_URI = "hg://mips.complang.tuwien.ac.at/hg/;module=cacao;rev=${SRCREV}"
+SRC_URI = "hg://mips.complang.tuwien.ac.at/hg/;module=cacao;rev=${SRCREV} \
+           file://cacao-shutdownguard.patch \
+          "
 
 S = "${WORKDIR}/cacao"
diff --git a/recipes/cacao/files/cacao-shutdownguard.patch b/recipes/cacao/files/cacao-shutdownguard.patch
new file mode 100644
index 0000000..b89170c
--- /dev/null
+++ b/recipes/cacao/files/cacao-shutdownguard.patch
@@ -0,0 +1,180 @@
+diff -r c7bf150bfa46 src/threads/posix/mutex-posix.hpp
+--- a/src/threads/posix/mutex-posix.hpp	Fri Mar 11 23:35:56 2011 +0100
++++ b/src/threads/posix/mutex-posix.hpp	Fri Apr 01 16:16:07 2011 +0200
+@@ -53,6 +53,9 @@
+ 
+ 	inline void lock();
+ 	inline void unlock();
++
++private:
++	void abort(int, const char*);
+ };
+ 
+ #else
+@@ -66,7 +69,6 @@
+ // Includes.
+ #include "vm/os.hpp"
+ 
+-
+ #ifdef __cplusplus
+ 
+ /**
+@@ -77,19 +79,19 @@
+ 	int result = pthread_mutexattr_init(&_attr);
+ 
+ 	if (result != 0) {
+-		os::abort_errnum(result, "Mutex::Mutex(): pthread_mutexattr_init failed");
++		abort(result, "Mutex::Mutex(): pthread_mutexattr_init failed");
+ 	}
+ 
+ 	result = pthread_mutexattr_settype(&_attr, PTHREAD_MUTEX_RECURSIVE);
+ 
+ 	if (result != 0) {
+-		os::abort_errnum(result, "Mutex::Mutex(): pthread_mutexattr_settype failed");
++		abort(result, "Mutex::Mutex(): pthread_mutexattr_settype failed");
+ 	}
+ 
+ 	result = pthread_mutex_init(&_mutex, &_attr);
+ 
+ 	if (result != 0) {
+-		os::abort_errnum(result, "Mutex::Mutex(): pthread_mutex_init failed");
++		abort(result, "Mutex::Mutex(): pthread_mutex_init failed");
+ 	}
+ }
+ 
+@@ -102,13 +104,13 @@
+ 	int result = pthread_mutexattr_destroy(&_attr);
+ 
+ 	if (result != 0) {
+-		os::abort_errnum(result, "Mutex::~Mutex(): pthread_mutexattr_destroy failed");
++		abort(result, "Mutex::~Mutex(): pthread_mutexattr_destroy failed");
+ 	}
+ 
+ 	result = pthread_mutex_destroy(&_mutex);
+ 
+ 	if (result != 0) {
+-		os::abort_errnum(result, "Mutex::~Mutex(): pthread_mutex_destroy failed");
++		abort(result, "Mutex::~Mutex(): pthread_mutex_destroy failed");
+ 	}
+ }
+ 
+@@ -127,7 +129,7 @@
+ 	int result = pthread_mutex_lock(&_mutex);
+ 
+ 	if (result != 0) {
+-		os::abort_errnum(result, "Mutex::lock(): pthread_mutex_lock failed");
++		abort(result, "Mutex::lock(): pthread_mutex_lock failed");
+ 	}
+ }
+ 
+@@ -141,10 +143,11 @@
+ 	int result = pthread_mutex_unlock(&_mutex);
+ 
+ 	if (result != 0) {
+-		os::abort_errnum(result, "Mutex::unlock: pthread_mutex_unlock failed");
++		abort(result, "Mutex::unlock: pthread_mutex_unlock failed");
+ 	}
+ }
+ 
++
+ #else
+ 
+ // This structure must have the same layout as the class above.
+diff -r c7bf150bfa46 src/threads/posix/thread-posix.cpp
+--- a/src/threads/posix/thread-posix.cpp	Fri Mar 11 23:35:56 2011 +0100
++++ b/src/threads/posix/thread-posix.cpp	Fri Apr 01 16:16:07 2011 +0200
+@@ -74,6 +74,23 @@
+ #include "vm/string.hpp"
+ #include "vm/vm.hpp"
+ 
++/**
++ * Handle the case that a mutex related pthread function failed.
++ *
++ * During normal execution of the VM it will make it abort. However if the
++ * VM is in its last stages of shutting down (where nothing pthread related works
++ * anymore), it will silently end the calling thread.
++ */ 
++void Mutex::abort(int errnum, const char* text)
++{
++	if (VM::get_current()->is_shutdown())
++	{
++		pthread_exit(NULL);
++	}
++
++	os::abort_errnum(errnum, text);
++}
++
+ #if defined(ENABLE_STATISTICS)
+ # include "vm/statistics.h"
+ #endif
+diff -r c7bf150bfa46 src/vm/vm.cpp
+--- a/src/vm/vm.cpp	Fri Mar 11 23:35:56 2011 +0100
++++ b/src/vm/vm.cpp	Fri Apr 01 16:16:07 2011 +0200
+@@ -52,6 +52,7 @@
+ 
+ #include "native/vm/nativevm.hpp"
+ 
++#include "threads/atomic.hpp"
+ #include "threads/lock.hpp"
+ #include "threads/thread.hpp"
+ 
+@@ -1585,6 +1586,22 @@
+ 	return true;
+ }
+ 
++/**
++ * Checks whether a shutdown process has to be guarded.
++ *
++ * Returning true means the caller must not continue
++ * doing any shutdown operations.
++ */
++bool VM::shutdown_guard()
++{
++	return Atomic::generic_compare_and_swap(&_shuttingdown, 0, 1) == 1;
++}
++
++bool VM::is_shutdown()
++{
++	Atomic::generic_memory_barrier();
++	return _shuttingdown == 1;
++}
+ 
+ /* vm_run **********************************************************************
+ 
+@@ -1865,6 +1882,15 @@
+ 
+ void vm_shutdown(s4 status)
+ {
++	log_println("vm_shutdown");
++
++	if (VM::get_current()->shutdown_guard())
++	{
++		/* Shutdown in progress by another thread already.
++		 Silently not do it another time. */
++		return;
++	}
++
+ 	if (opt_verbose 
+ #if defined(ENABLE_STATISTICS)
+ 		|| opt_getcompilingtime || opt_stat
+diff -r c7bf150bfa46 src/vm/vm.hpp
+--- a/src/vm/vm.hpp	Fri Mar 11 23:35:56 2011 +0100
++++ b/src/vm/vm.hpp	Fri Apr 01 16:16:07 2011 +0200
+@@ -64,6 +64,7 @@
+ 	bool    _initializing;
+ 	bool    _created;
+ 	bool    _exiting;
++	uint32_t _shuttingdown;
+ 	int64_t _starttime;
+ 	int64_t _inittime;
+ 
+@@ -104,6 +105,9 @@
+ 	int64_t get_starttime()   { return _starttime; }
+ 	int64_t get_inittime()    { return _inittime; }
+ 
++	bool	shutdown_guard();
++	bool	is_shutdown();
++
+ 	Properties&      get_properties     () { return _properties; }
+ 	Recompiler&      get_recompiler     () { return _recompiler; } // REMOVEME
+ #if defined(WITH_JAVA_RUNTIME_LIBRARY_OPENJDK)
-- 
1.7.5.1



