Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.298.1597264902640188162
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 13:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Fj4SEYF7;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id j21so1627832pgi.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 13:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UAxZs4QZpnENF2la/IpznttmkOPn5u1ffi7jXFEjChM=;
        b=Fj4SEYF7ClU2oAqcrZlwEqt5OsLiIeGVGSxSvQrip0L/G36x5Ra6Lk4ty4f1e+76Qx
         2lZ5zHLSTpHFDMCGF7WGyqfV9asoVWkPBaf/x4ORAP+5iB3jjClh6JGG5orISqWWIPwE
         BjvPVFqgtWWBY02YArGRsx+SUlr4ThuneUPWvJMhwji9hl2nvDnkk5IBiTWi9O2wq2Gj
         3Ongn/ffSTfKN2uHQhjO01HgAhFgarKi3nGsuprARww61FXfnF2y2ZoCqNwtNmx713K9
         wifgc9qOQIRMsLMerrHIo7Vy9gkAh2JHIPN3oUHoua+9qtqbxytfHZvynwQSyXMVsSGr
         55Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UAxZs4QZpnENF2la/IpznttmkOPn5u1ffi7jXFEjChM=;
        b=fV1GbFu+ZtPlS1bvMDOeTQJf2xueWo5XVU6ltsNgixj0lGKcmaIEtws8gGbt/2S/qL
         KRfGJOxD+NjiNDMfE9hux8c1JKH/+qzPY6RtI4Lke56ggD1QHaSQs5T+N8dYywJW2BHl
         m+PAbMC/MVnZ/RIIEeBwg4DslCD4hRsgv36qKkS37t/o01GN+E5kMfpt12RF1iieNe0X
         ETiItQWedyPkunZUciZW5WZiKVBj4XJx7aooMqmNbG+r/FnRZoWOLSvLf7MEbTlNZ9PE
         Yvfb6nUC481WLp1yLDzEO+wZW9OTbfzqUo1VJq2YjW72c9beUAa87N7m7BaEiPVpEUTN
         lccQ==
X-Gm-Message-State: AOAM531AhDfhcHnS0FmxuaRmG1fzTUKAea/ZoXKSgDbtoCN6Rnvb3314
	/KkHlUfCfM31k1wNgZh846KVnryk/aM=
X-Google-Smtp-Source: ABdhPJyUfOtPuEQgghG5OrXpLe4f9TYehbCEEbj9+YIz5ks5hR3Ccdv9tFE2HfDzys0RMy9b+t2u0Q==
X-Received: by 2002:a63:b70c:: with SMTP id t12mr844238pgf.178.1597264901611;
        Wed, 12 Aug 2020 13:41:41 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id l22sm2984287pjy.31.2020.08.12.13.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 13:41:40 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][ 11/18] dibbler: Update to latest
Date: Wed, 12 Aug 2020 13:41:23 -0700
Message-Id: <20200812204130.1012160-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812204130.1012160-1-raj.khem@gmail.com>
References: <20200812204130.1012160-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop upstreamed patch
Fixed compatibility with g++-10

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Rename-pthread_mutex_t-variable-lock.patch | 74 -------------------
 .../dibbler/dibbler_git.bb                    |  3 +-
 2 files changed, 1 insertion(+), 76 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/dibbler/dibbler/0001-linux-port-Rename-pthread_mutex_t-variable-lock.patch

diff --git a/meta-networking/recipes-connectivity/dibbler/dibbler/0001-linux-port-Rename-pthread_mutex_t-variable-lock.patch b/meta-networking/recipes-connectivity/dibbler/dibbler/0001-linux-port-Rename-pthread_mutex_t-variable-lock.patch
deleted file mode 100644
index 346a56a9ad..0000000000
--- a/meta-networking/recipes-connectivity/dibbler/dibbler/0001-linux-port-Rename-pthread_mutex_t-variable-lock.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 630086cf1b3fba71822319a268d3711734cd6aa8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 31 Jan 2019 12:56:13 -0800
-Subject: [PATCH] linux-port: Rename pthread_mutex_t variable 'lock'
-
-lock is also used by libc++ in std namespace and using it here causes
-clang to fail e.g.
-
-dibbler-client.cpp:47:25: error: reference to 'lock' is ambiguous
-    pthread_mutex_lock(&lock);
-                        ^
-../../../../../../../workspace/sources/dibbler/Port-linux/dibbler-client.cpp:29:26: note: candidate found by name lookup is 'lock'
-extern ::pthread_mutex_t lock;
-                         ^
-/mnt/a/yoe/build/tmp/work/aarch64-yoe-linux/dibbler/1.0.1+1.0.2RC1+gitc4b0ed52e751da7823dd9a36e91f93a6310e5525-r0/recipe-sysroot/usr/include/c++/v1/mutex:446:1: note: candidate found by name lookup is 'std::__1::lock'
-lock(_L0& __l0, _L1& __l1, _L2& __l2, _L3& ...__l3)
-
-Upstream-Status: Submitted [https://github.com/tomaszmrugalski/dibbler/pull/37]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Port-linux/dibbler-client.cpp          | 6 +++---
- Port-linux/lowlevel-linux-link-state.c | 6 +++---
- 2 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/Port-linux/dibbler-client.cpp b/Port-linux/dibbler-client.cpp
-index 78f34241..b5ebb9f0 100644
---- a/Port-linux/dibbler-client.cpp
-+++ b/Port-linux/dibbler-client.cpp
-@@ -26,7 +26,7 @@ using namespace std;
- 
- #define IF_RECONNECTED_DETECTED -1
- 
--extern pthread_mutex_t lock;
-+extern pthread_mutex_t dibbler_lock;
- 
- TDHCPClient* ptr = 0;
- 
-@@ -44,8 +44,8 @@ void signal_handler(int n) {
- #ifdef MOD_CLNT_CONFIRM
- void signal_handler_of_linkstate_change(int n) {
-     Log(Notice) << "Network switch off event detected. initiating CONFIRM." << LogEnd;
--    pthread_mutex_lock(&lock);
--    pthread_mutex_unlock(&lock);
-+    pthread_mutex_lock(&dibbler_lock);
-+    pthread_mutex_unlock(&dibbler_lock);
- }
- #endif
- 
-diff --git a/Port-linux/lowlevel-linux-link-state.c b/Port-linux/lowlevel-linux-link-state.c
-index 76293ea1..e6b94063 100644
---- a/Port-linux/lowlevel-linux-link-state.c
-+++ b/Port-linux/lowlevel-linux-link-state.c
-@@ -34,7 +34,7 @@ volatile int * notifier = 0;
- int isDone = 0;
- pthread_t parent_id;
- pthread_t ntid;
--pthread_mutex_t lock;
-+pthread_mutex_t dibbler_lock;
- 
- struct state {
-     int id;
-@@ -86,9 +86,9 @@ void link_state_changed(int ifindex)
-     {
- 	if (changed_links->cnt<16)
- 	    changed_links->ifindex[changed_links->cnt++] = ifindex;
--	pthread_mutex_lock(&lock);
-+	pthread_mutex_lock(&dibbler_lock);
- 	*notifier = 1; /* notify that change has occured */
--	pthread_mutex_unlock(&lock);
-+	pthread_mutex_unlock(&dibbler_lock);
- 	pthread_kill(parent_id,SIGUSR1);
-     } else
-     {
diff --git a/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb b/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
index 90051a319a..c2f4827161 100644
--- a/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
+++ b/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
@@ -5,11 +5,10 @@ HOMEPAGE = "http://klub.com.pl/dhcpv6"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7236695bb6d4461c105d685a8b61c4e3"
 
-SRCREV = "c4b0ed52e751da7823dd9a36e91f93a6310e5525"
+SRCREV = "a7c6cf58a88a510cb00841351e75030ce78d36bf"
 
 SRC_URI = "git://github.com/tomaszmrugalski/dibbler \
            file://dibbler_fix_getSize_crash.patch \
-           file://0001-linux-port-Rename-pthread_mutex_t-variable-lock.patch \
            "
 PV = "1.0.1+1.0.2RC1+git${SRCREV}"
 
-- 
2.28.0

