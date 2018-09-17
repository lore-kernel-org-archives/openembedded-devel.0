Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EA9E77943C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 08:17:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8H8HraV023762
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 01:17:54 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Sep 2018 01:17:53 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Sep 2018 16:17:52 +0800
Message-ID: <1537172272-368817-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH][meta-oe] syslog-ng: fix segment fault during startup on arm64
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
X-List-Received-Date: Mon, 17 Sep 2018 08:17:53 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

service start failed since segment fault on arch arm64,
syslog-ng have a submodule ivykis, from ivykis V0.42,
it use pthread_atfork, but for arm64, this symbol is
not included by libpthread, so cause segment fault.

refer systemd, replace pthread_atfork with __register_atfork
to fix this problem.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...ng-fix-segment-fault-during-service-start.patch | 75 ++++++++++++++++++++++
 .../recipes-support/syslog-ng/syslog-ng_3.16.1.bb  |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/0001-syslog-ng-fix-segment-fault-during-service-start.patch

diff --git a/meta-oe/recipes-support/syslog-ng/files/0001-syslog-ng-fix-segment-fault-during-service-start.patch b/meta-oe/recipes-support/syslog-ng/files/0001-syslog-ng-fix-segment-fault-during-service-start.patch
new file mode 100644
index 0000000..0fc40be
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/0001-syslog-ng-fix-segment-fault-during-service-start.patch
@@ -0,0 +1,75 @@
+From caeccb7bec45f65bc89efa8195b3853368328361 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 17 Sep 2018 12:49:36 +0800
+Subject: [PATCH] syslog-ng: fix segment fault during service start on arm64
+
+service start failed since segment fault on arch arm64,
+syslog-ng have a submodule ivykis, from ivykis V0.42,
+it use pthread_atfork, but for arm64, this symbol is
+not included by libpthread, so cause segment fault.
+
+refer systemd, replace pthread_atfork with __register_atfork
+to fix this problem.
+
+I have create an issue, and this proposal to upstream.
+https://github.com/buytenh/ivykis/issues/15
+
+Upstream-Status: Pending
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ lib/ivykis/src/pthr.h | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/lib/ivykis/src/pthr.h b/lib/ivykis/src/pthr.h
+index a41eaf3..72c5190 100644
+--- a/lib/ivykis/src/pthr.h
++++ b/lib/ivykis/src/pthr.h
+@@ -24,6 +24,16 @@
+ #include <pthread.h>
+ #include <signal.h>
+ 
++#ifdef __GLIBC__
++/* We use glibc __register_atfork() + __dso_handle directly here, as they are not included in the glibc
++ * headers. __register_atfork() is mostly equivalent to pthread_atfork(), but doesn't require us to link against
++ * libpthread, as it is part of glibc anyway. */
++extern int __register_atfork(void (*prepare) (void), void (*parent) (void), void (*child) (void), void * __dso_handle);
++extern void* __dso_handle __attribute__ ((__weak__));
++#else
++#define __register_atfork(prepare,parent,child,dso) pthread_atfork(prepare,parent,child)
++#endif
++
+ #ifdef HAVE_PRAGMA_WEAK
+ #pragma weak pthread_create
+ #endif
+@@ -36,16 +46,7 @@ static inline int pthreads_available(void)
+ 
+ #ifdef HAVE_PRAGMA_WEAK
+ 
+-/*
+- * On Linux, pthread_atfork() is defined in libpthread_nonshared.a,
+- * a static library, and we want to avoid "#pragma weak" for that
+- * symbol because that causes it to be undefined even if you link
+- * libpthread_nonshared.a in explicitly.
+- */
+-#ifndef HAVE_LIBPTHREAD_NONSHARED
+-#pragma weak pthread_atfork
+-#endif
+-
++#pragma weak __register_atfork
+ #pragma weak pthread_create
+ #pragma weak pthread_detach
+ #pragma weak pthread_getspecific
+@@ -73,8 +74,7 @@ static inline int
+ pthr_atfork(void (*prepare)(void), void (*parent)(void), void (*child)(void))
+ {
+ 	if (pthreads_available())
+-		return pthread_atfork(prepare, parent, child);
+-
++		return __register_atfork(prepare, parent, child, __dso_handle);
+ 	return ENOSYS;
+ }
+ 
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.16.1.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.16.1.bb
index 2fd57fb..b5f42cf 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.16.1.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.16.1.bb
@@ -9,6 +9,7 @@ SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.ta
            file://fix-config-libnet.patch \
            file://fix-invalid-ownership.patch \
            file://syslog-ng.service-the-syslog-ng-service.patch \
+           file://0001-syslog-ng-fix-segment-fault-during-service-start.patch \
            "
 
 SRC_URI[md5sum] = "72d44ad02c2e9ba0748b3ecd3f15a7ff"
-- 
2.7.4


