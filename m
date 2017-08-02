Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id D5D1178218
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Aug 2017 02:55:33 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id t86so4559128pfe.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Aug 2017 19:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=l2wYTb4Lft808JDdZbLIuAVEd5yuQ/EbeEC/B1aFQds=;
	b=llTJAxFGXcpexn6Lkk+oQJgmu8wTYAt/MrVB3Upv9B3nGk5OGZ/VrB/5anw5oG5GT0
	8uajUcig4WJeOHqN5vWcOhl3rxgV0ogEaCaF76lEIfNFo3OtibemVZ0qFWdzsYsNaVSC
	MXPpMg0nRWmEfsd//MHJ2J6bX1zt6dgEDeEzcV2ku1lgCHcXbCOc4tLgr5R/q9i+sfAE
	SSpZba9OFdMy8v2M/sZOHdNwowMsrG/UdwusMGfSeoINrTmsD0+h/mQfddQDvm8129JM
	k7kJGujTw2zn+C0weQ8eNJFIiNGXzfFc20vjREkoL8+YgqtXgCeO9/mZ4QbA5Pk+uHf7
	YiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=l2wYTb4Lft808JDdZbLIuAVEd5yuQ/EbeEC/B1aFQds=;
	b=s4OQZZKUTz9KQfkDtbGAQfQQTH8okJWoUb8dOiZOv31k8Krxl1UAy+hSO01NrF40jA
	d7QO3vhs3Y4b0GdxDVBKeMhsY+coMDoPigVUGYOCQ6csdXgRaoI3NvgEo9ZX+GDgZA8c
	hAZ2l6ITcDQg/MP3yY4SBMCyVxjV8fdbeKxepMZB1weBCE1SE43GNgOqASKoL9cZ3DN0
	aKEfp1TY3gQZ2l7E129Pi7DPhtCttZcXctjAsNJ/7Q/MDYddYlN1xD47LvA2RpWhnNEi
	Kloauh7zgXEl3ofCX6iGVT8e7wBULCUA5NSWg5hOha6XM88hkHPdoJkYwtXy5c/CQb2m
	3ORQ==
X-Gm-Message-State: AIVw112pYi/clyoYUVkN0BZg5Jz+pS0TEhxQKaDfgpRTsQbV93kmzJ1C
	Ke1pJvpF05pAJkLJ
X-Received: by 10.98.57.138 with SMTP id u10mr21015100pfj.227.1501642534482;
	Tue, 01 Aug 2017 19:55:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f6f])
	by smtp.gmail.com with ESMTPSA id
	s206sm59775669pfs.55.2017.08.01.19.55.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Aug 2017 19:55:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Aug 2017 19:55:22 -0700
Message-Id: <20170802025523.37417-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [meta-qt5][PATCH 1/2] qtbase: Use sched_yield instead of pthread_yield
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
X-List-Received-Date: Wed, 02 Aug 2017 02:55:34 -0000

Makes it portable across glibc and musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...11-Replace-pthread_yield-with-sched_yield.patch | 63 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase_git.bb                       |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase/0011-Replace-pthread_yield-with-sched_yield.patch

diff --git a/recipes-qt/qt5/qtbase/0011-Replace-pthread_yield-with-sched_yield.patch b/recipes-qt/qt5/qtbase/0011-Replace-pthread_yield-with-sched_yield.patch
new file mode 100644
index 0000000..ed0d4bc
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0011-Replace-pthread_yield-with-sched_yield.patch
@@ -0,0 +1,63 @@
+From d1d4b520e29b58e427fc7bd336d34b82d0d2b1f3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 27 Jul 2017 08:02:51 -0700
+Subject: [PATCH] Replace pthread_yield with sched_yield
+
+On Linux pthead_yield is same as sched_yield implementation wise
+and sched_yield is available on all libc
+implementations on Linux
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp   | 4 ++--
+ tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp | 5 +++--
+ 2 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp b/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp
+index 7d9f56ef38..bc115ef61d 100644
+--- a/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp
++++ b/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp
+@@ -34,7 +34,7 @@
+ #include "tst_qvariant_common.h"
+ 
+ #ifdef Q_OS_LINUX
+-# include <pthread.h>
++# include <sched.h>
+ #endif
+ 
+ #include <algorithm>
+@@ -197,7 +197,7 @@ protected:
+             const char *nm = name.constData();
+             int tp = qRegisterMetaType<Bar>(nm);
+ #if defined(Q_OS_LINUX) && !defined(Q_OS_ANDROID)
+-            pthread_yield();
++            sched_yield();
+ #endif
+             QMetaType info(tp);
+             if (!info.isValid()) {
+diff --git a/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp b/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp
+index fe1057bdde..e23e97b259 100644
+--- a/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp
++++ b/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp
+@@ -75,6 +75,7 @@
+ #include <stdlib.h>
+ #include <sys/stat.h>
+ #include <unistd.h>
++#include <sched.h>
+ #endif
+ 
+ #include "private/qhostinfo_p.h"
+@@ -2129,8 +2130,8 @@ public slots:
+ 
+ #if defined(Q_OS_MAC)
+         pthread_yield_np();
+-#elif defined Q_OS_LINUX && !defined Q_OS_ANDROID
+-        pthread_yield();
++#elif defined Q_OS_LINUX
++        sched_yield();
+ #endif
+         if (!sock->waitForConnected()) {
+             networkTimeout = true;
+-- 
+2.13.3
+
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index c26a93b..9e652c3 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -24,6 +24,7 @@ SRC_URI += "\
     file://0009-Disable-all-unknown-features-instead-of-erroring-out.patch \
     file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
     file://0010-tst_qstring-Disable-Wformat-security-with-clang-as-w.patch \
+    file://0011-Replace-pthread_yield-with-sched_yield.patch \
 "
 
 # only for target qtbase
-- 
2.13.3


