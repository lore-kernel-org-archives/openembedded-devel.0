Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6B17E7FC3E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 06:29:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,280,1569254400"; d="scan'208";a="78051339"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Nov 2019 14:29:00 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 55E584CE1A05
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 14:20:54 +0800 (CST)
Received: from G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 8 Nov 2019 14:29:01 +0800
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 8 Nov 2019 14:29:00 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 Nov 2019 18:08:44 +0800
Message-ID: <1573207724-78917-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202)
X-yoursite-MailScanner-ID: 55E584CE1A05.A865A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] syslog-ng: upgrade 3.19.1 -> 3.24.1
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
X-List-Received-Date: Fri, 08 Nov 2019 06:29:01 -0000
Content-Type: text/plain

(1) Refresh three patches for new version.
    fix-config-libnet.patch
    syslog-ng.service-the-syslog-ng-service.patch
    0001-syslog-ng-fix-segment-fault-during-service-start.patch

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...ng-fix-segment-fault-during-service-start.patch | 27 +++++++------
 .../syslog-ng/files/fix-config-libnet.patch        | 44 +++++++++++-----------
 .../syslog-ng.service-the-syslog-ng-service.patch  | 24 ++++++------
 .../{syslog-ng_3.19.1.bb => syslog-ng_3.24.1.bb}   |  4 +-
 4 files changed, 50 insertions(+), 49 deletions(-)
 rename meta-oe/recipes-support/syslog-ng/{syslog-ng_3.19.1.bb => syslog-ng_3.24.1.bb} (74%)

diff --git a/meta-oe/recipes-support/syslog-ng/files/0001-syslog-ng-fix-segment-fault-during-service-start.patch b/meta-oe/recipes-support/syslog-ng/files/0001-syslog-ng-fix-segment-fault-during-service-start.patch
index 0fc40be..b5bfcd0 100644
--- a/meta-oe/recipes-support/syslog-ng/files/0001-syslog-ng-fix-segment-fault-during-service-start.patch
+++ b/meta-oe/recipes-support/syslog-ng/files/0001-syslog-ng-fix-segment-fault-during-service-start.patch
@@ -1,6 +1,3 @@
-From caeccb7bec45f65bc89efa8195b3853368328361 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Mon, 17 Sep 2018 12:49:36 +0800
 Subject: [PATCH] syslog-ng: fix segment fault during service start on arm64
 
 service start failed since segment fault on arch arm64,
@@ -17,12 +14,15 @@ https://github.com/buytenh/ivykis/issues/15
 Upstream-Status: Pending
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Update for 3.24.1.
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
- lib/ivykis/src/pthr.h | 24 ++++++++++++------------
- 1 file changed, 12 insertions(+), 12 deletions(-)
+ lib/ivykis/src/pthr.h | 23 ++++++++++++-----------
+ 1 file changed, 12 insertions(+), 11 deletions(-)
 
 diff --git a/lib/ivykis/src/pthr.h b/lib/ivykis/src/pthr.h
-index a41eaf3..72c5190 100644
+index 29e4be7..5d29096 100644
 --- a/lib/ivykis/src/pthr.h
 +++ b/lib/ivykis/src/pthr.h
 @@ -24,6 +24,16 @@
@@ -47,12 +47,12 @@ index a41eaf3..72c5190 100644
  #ifdef HAVE_PRAGMA_WEAK
  
 -/*
-- * On Linux, pthread_atfork() is defined in libpthread_nonshared.a,
-- * a static library, and we want to avoid "#pragma weak" for that
-- * symbol because that causes it to be undefined even if you link
-- * libpthread_nonshared.a in explicitly.
+- * On Linux, pthread_atfork() is defined in libc_nonshared.a (for
+- * glibc >= 2.28) or libpthread_nonshared.a (for glibc <= 2.27), and
+- * we want to avoid "#pragma weak" for that symbol because that causes
+- * it to be undefined even if you link lib*_nonshared.a in explicitly.
 - */
--#ifndef HAVE_LIBPTHREAD_NONSHARED
+-#if !defined(HAVE_LIBC_NONSHARED) && !defined(HAVE_LIBPTHREAD_NONSHARED)
 -#pragma weak pthread_atfork
 -#endif
 -
@@ -60,16 +60,15 @@ index a41eaf3..72c5190 100644
  #pragma weak pthread_create
  #pragma weak pthread_detach
  #pragma weak pthread_getspecific
-@@ -73,8 +74,7 @@ static inline int
+@@ -73,7 +74,7 @@ static inline int
  pthr_atfork(void (*prepare)(void), void (*parent)(void), void (*child)(void))
  {
  	if (pthreads_available())
 -		return pthread_atfork(prepare, parent, child);
--
 +		return __register_atfork(prepare, parent, child, __dso_handle);
+ 
  	return ENOSYS;
  }
- 
 -- 
 2.7.4
 
diff --git a/meta-oe/recipes-support/syslog-ng/files/fix-config-libnet.patch b/meta-oe/recipes-support/syslog-ng/files/fix-config-libnet.patch
index 553f4a5..4ad0afa 100644
--- a/meta-oe/recipes-support/syslog-ng/files/fix-config-libnet.patch
+++ b/meta-oe/recipes-support/syslog-ng/files/fix-config-libnet.patch
@@ -6,25 +6,28 @@ This would avoid a implicit auto-detecting result.
 
 Signed-off-by: Ming Liu <ming.liu@windriver.com>
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
+Update for 3.24.1.
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
- configure.ac |   27 +++++++++++++++++----------
- 1 files changed, 17 insertions(+), 10 deletions(-)
+ configure.ac | 28 ++++++++++++++++------------
+ 1 file changed, 16 insertions(+), 12 deletions(-)
 
-Index: syslog-ng-3.8.1/configure.ac
-===================================================================
---- syslog-ng-3.8.1.orig/configure.ac
-+++ syslog-ng-3.8.1/configure.ac
-@@ -104,6 +104,9 @@ AC_CONFIG_HEADERS(config.h)
+diff --git a/configure.ac b/configure.ac
+index 00eb566..e7d5ac1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -143,6 +143,9 @@ AC_CONFIG_HEADERS(config.h)
  dnl ***************************************************************************
  dnl Arguments
  
-+AC_ARG_ENABLE(libnet, 
++AC_ARG_ENABLE(libnet,
 +              [  --enable-libnet      Enable libnet support.],, enable_libnet="no")
 +
  AC_ARG_WITH(libnet,
     [  --with-libnet=path      use path to libnet-config script],
     ,
-@@ -893,22 +896,26 @@ dnl ************************************
+@@ -1047,19 +1050,20 @@ dnl ***************************************************************************
  dnl libnet headers/libraries
  dnl ***************************************************************************
  AC_MSG_CHECKING(for LIBNET)
@@ -39,7 +42,14 @@ Index: syslog-ng-3.8.1/configure.ac
 +        else
 +                LIBNET_CONFIG="$with_libnet/libnet-config"
 +        fi
-+ 
+ 
+-if test -n "$LIBNET_CONFIG" -a -x "$LIBNET_CONFIG"; then
+-        LIBNET_CFLAGS="`$LIBNET_CONFIG --defines`"
+-        LIBNET_LIBS="`$LIBNET_CONFIG --libs`"
+-        AC_MSG_RESULT(yes)
+-dnl libnet-config does not provide the _DEFAULT_SOURCE define, that can cause warning during build
+-dnl as upstream libnet-config does uses _DEFAULT_SOURCE this is just a fix till 
+-        LIBNET_CFLAGS="$LIBNET_CFLAGS -D_DEFAULT_SOURCE"
 +        if test -n "$LIBNET_CONFIG" -a -x "$LIBNET_CONFIG"; then
 +                LIBNET_CFLAGS="`$LIBNET_CONFIG --defines`"
 +                LIBNET_LIBS="`$LIBNET_CONFIG --libs`"
@@ -48,16 +58,8 @@ Index: syslog-ng-3.8.1/configure.ac
 +                AC_MSG_ERROR([Could not find libnet, and libnet support was explicitly enabled.])
 +        fi
  
--if test -n "$LIBNET_CONFIG" -a -x "$LIBNET_CONFIG"; then
--        LIBNET_CFLAGS="`$LIBNET_CONFIG --defines`"
--        LIBNET_LIBS="`$LIBNET_CONFIG --libs`"
--        AC_MSG_RESULT(yes)
  else
          LIBNET_LIBS=
-         AC_MSG_RESULT(no)
- fi
- 
--
- if test "x$enable_spoof_source" = "xauto"; then
- 	AC_MSG_CHECKING(whether to enable spoof source support)
-         if test "x$LIBNET_LIBS" != "x"; then
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
index 39c3f59..0e1d094 100644
--- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
@@ -1,16 +1,17 @@
-From 0be9c08dd3f825e92fa02d4a08d8aff743109e61 Mon Sep 17 00:00:00 2001
-From: Li xin <lixin.fnst@cn.fujitsu.com>
-Date: Wed, 17 Jun 2015 14:46:30 +0900
-Subject: [PATCH] syslog-ng.service: the syslog-ng service can not start
+Subject: [PATCH] syslog-ng.service: the syslog-ng service can not start 
  successfully,so modify it.
 
 Upstream-Status: pending
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 Updated-by: Andrej Valek <andrej.valek@siemens.com>
+
+Update for 3.24.1
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
- contrib/systemd/syslog-ng.service | 5 ++---
- 1 file changed, 2 insertion(+), 3 deletions(-)
+ contrib/systemd/syslog-ng@.service | 4 ++--
+ contrib/systemd/syslog-ng@default  | 6 +++---
+ 2 files changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/contrib/systemd/syslog-ng@.service b/contrib/systemd/syslog-ng@.service
 index a28640e..93aec94 100644
@@ -28,19 +29,18 @@ index a28640e..93aec94 100644
  StandardError=journal
  Restart=on-failure
 diff --git a/contrib/systemd/syslog-ng@default b/contrib/systemd/syslog-ng@default
-index 02da288..3a8215d 100644
+index 0ccc2b9..7f08c0e 100644
 --- a/contrib/systemd/syslog-ng@default
 +++ b/contrib/systemd/syslog-ng@default
 @@ -1,5 +1,5 @@
--CONFIG_FILE=/etc/syslog-ng.conf
+ CONFIG_FILE=/etc/syslog-ng/syslog-ng.conf
 -PERSIST_FILE=/var/lib/syslog-ng/syslog-ng.persist
--CONTROL_FILE=/var/lib/syslog-ng/syslog-ng.ctl
+-CONTROL_FILE=/var/run/syslog-ng.ctl
 -PID_FILE=/var/run/syslog-ng.pid
-+CONFIG_FILE=/etc/syslog-ng/syslog-ng.conf
 +PERSIST_FILE=@LOCALSTATEDIR@/lib/syslog-ng/syslog-ng.persist
 +CONTROL_FILE=@LOCALSTATEDIR@/lib/syslog-ng/syslog-ng.ctl
 +PID_FILE=@LOCALSTATEDIR@/run/syslog-ng.pid
  OTHER_OPTIONS="--enable-core"
-
 -- 
-1.8.4.2
+2.7.4
+
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.19.1.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.24.1.bb
similarity index 74%
rename from meta-oe/recipes-support/syslog-ng/syslog-ng_3.19.1.bb
rename to meta-oe/recipes-support/syslog-ng/syslog-ng_3.24.1.bb
index 852343c..01ed767 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.19.1.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.24.1.bb
@@ -10,5 +10,5 @@ SRC_URI += " \
            file://syslog-ng-tmp.conf \
            "
 
-SRC_URI[md5sum] = "aa79bc13d9fd925aa5fb9516e87aacd3"
-SRC_URI[sha256sum] = "5cf931a9d7bead0e6d9a2c65eee8f6005a005878f59aa280f3c4294257ed5178"
+SRC_URI[md5sum] = "ef9de066793f7358af7312b964ac0450"
+SRC_URI[sha256sum] = "d4d0a0357b452be96b69d6f741129275530d8f0451e35adc408ad5635059fa3d"
-- 
2.7.4




