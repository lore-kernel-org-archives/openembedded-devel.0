Received: from rs69.luxsci.com ([64.49.254.154])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchiii@mtiemail.com>) id 1QfBt2-0008HP-J1
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jul 2011 16:18:54 +0200
Received: from thing2.microtoolsinc.com
	(adsl-76-255-12-150.dsl.mrdnct.sbcglobal.net [76.255.12.150])
	(authenticated bits=0)
	by rs69.luxsci.com (8.13.8/8.13.8) with ESMTP id p68EBVkj020180
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 8 Jul 2011 09:11:44 -0500
From: "George C. Huntington III" <gchiii@mtiemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jul 2011 10:11:19 -0400
Message-Id: <1310134279-13639-2-git-send-email-gchiii@mtiemail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1310134279-13639-1-git-send-email-gchiii@mtiemail.com>
References: <1310134279-13639-1-git-send-email-gchiii@mtiemail.com>
Cc: Robert Schuster <r.schuster@tarent.de>, Stefan Schmidt <stefan@buglabs.net>
Subject: [2011.03-maintenance] cacao-native_hg: Fix cacao-shutdownguard.patch
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
X-List-Received-Date: Fri, 08 Jul 2011 14:18:54 -0000

From: Robert Schuster <r.schuster@tarent.de>

The patch contained some left-over debug code which can result into problems if
other programs (like configure) relays on the output of the JVM

Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
---
 recipes/cacao/cacao-native_hg.bb              |    2 +-
 recipes/cacao/files/cacao-shutdownguard.patch |   32 +++++++++++++-----------
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/recipes/cacao/cacao-native_hg.bb b/recipes/cacao/cacao-native_hg.bb
index dc35ce8..020dee3 100644
--- a/recipes/cacao/cacao-native_hg.bb
+++ b/recipes/cacao/cacao-native_hg.bb
@@ -1,7 +1,7 @@
 require cacao-native.inc
 
 PV = "1.1.0+hgr${SRCPV}"
-PR = "r4"
+PR = "r5"
 
 SRCREV = "c7bf150bfa46"
 SRC_URI = "hg://mips.complang.tuwien.ac.at/hg/;module=cacao;rev=${SRCREV} \
diff --git a/recipes/cacao/files/cacao-shutdownguard.patch b/recipes/cacao/files/cacao-shutdownguard.patch
index b89170c..b0d9d92 100644
--- a/recipes/cacao/files/cacao-shutdownguard.patch
+++ b/recipes/cacao/files/cacao-shutdownguard.patch
@@ -1,6 +1,7 @@
-diff -r c7bf150bfa46 src/threads/posix/mutex-posix.hpp
---- a/src/threads/posix/mutex-posix.hpp	Fri Mar 11 23:35:56 2011 +0100
-+++ b/src/threads/posix/mutex-posix.hpp	Fri Apr 01 16:16:07 2011 +0200
+Index: cacao/src/threads/posix/mutex-posix.hpp
+===================================================================
+--- cacao.orig/src/threads/posix/mutex-posix.hpp	2011-03-08 13:13:00.000000000 +0100
++++ cacao/src/threads/posix/mutex-posix.hpp	2011-05-10 11:51:48.534869875 +0200
 @@ -53,6 +53,9 @@
  
  	inline void lock();
@@ -80,9 +81,10 @@ diff -r c7bf150bfa46 src/threads/posix/mutex-posix.hpp
  #else
  
  // This structure must have the same layout as the class above.
-diff -r c7bf150bfa46 src/threads/posix/thread-posix.cpp
---- a/src/threads/posix/thread-posix.cpp	Fri Mar 11 23:35:56 2011 +0100
-+++ b/src/threads/posix/thread-posix.cpp	Fri Apr 01 16:16:07 2011 +0200
+Index: cacao/src/threads/posix/thread-posix.cpp
+===================================================================
+--- cacao.orig/src/threads/posix/thread-posix.cpp	2011-03-17 10:41:29.000000000 +0100
++++ cacao/src/threads/posix/thread-posix.cpp	2011-05-10 11:51:48.534869875 +0200
 @@ -74,6 +74,23 @@
  #include "vm/string.hpp"
  #include "vm/vm.hpp"
@@ -107,9 +109,10 @@ diff -r c7bf150bfa46 src/threads/posix/thread-posix.cpp
  #if defined(ENABLE_STATISTICS)
  # include "vm/statistics.h"
  #endif
-diff -r c7bf150bfa46 src/vm/vm.cpp
---- a/src/vm/vm.cpp	Fri Mar 11 23:35:56 2011 +0100
-+++ b/src/vm/vm.cpp	Fri Apr 01 16:16:07 2011 +0200
+Index: cacao/src/vm/vm.cpp
+===================================================================
+--- cacao.orig/src/vm/vm.cpp	2011-03-17 10:41:29.000000000 +0100
++++ cacao/src/vm/vm.cpp	2011-05-10 11:56:36.564882762 +0200
 @@ -52,6 +52,7 @@
  
  #include "native/vm/nativevm.hpp"
@@ -141,12 +144,10 @@ diff -r c7bf150bfa46 src/vm/vm.cpp
  
  /* vm_run **********************************************************************
  
-@@ -1865,6 +1882,15 @@
+@@ -1865,6 +1882,13 @@
  
  void vm_shutdown(s4 status)
  {
-+	log_println("vm_shutdown");
-+
 +	if (VM::get_current()->shutdown_guard())
 +	{
 +		/* Shutdown in progress by another thread already.
@@ -157,9 +158,10 @@ diff -r c7bf150bfa46 src/vm/vm.cpp
  	if (opt_verbose 
  #if defined(ENABLE_STATISTICS)
  		|| opt_getcompilingtime || opt_stat
-diff -r c7bf150bfa46 src/vm/vm.hpp
---- a/src/vm/vm.hpp	Fri Mar 11 23:35:56 2011 +0100
-+++ b/src/vm/vm.hpp	Fri Apr 01 16:16:07 2011 +0200
+Index: cacao/src/vm/vm.hpp
+===================================================================
+--- cacao.orig/src/vm/vm.hpp	2011-03-08 13:13:00.000000000 +0100
++++ cacao/src/vm/vm.hpp	2011-05-10 11:51:48.554844342 +0200
 @@ -64,6 +64,7 @@
  	bool    _initializing;
  	bool    _created;
-- 
1.7.4.1



