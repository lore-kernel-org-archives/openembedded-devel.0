Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 803687C048
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Feb 2019 14:56:45 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id u6so3314583pfh.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Feb 2019 06:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6MEvVV1cpJRIyG+m3nqqh8KYOBCH91/9B31Omgkz6Eg=;
	b=EyRzZwF7ZclclNG0T5bysT9Zk7Zi5CyHY7R2OR6mxWPk8JwvGa//Y6wnpk6EGxavW8
	8wkN1Zb6P58c7HSSxwZ9+TY2U6095tij+O+ST2BOfXYEjpFuZizXcNtQEV3Jpf525g2h
	csIh55M+ICpgoJDKFT41vVQHdJD15Ieb+COPglS1V6KNGOD0qGCCbz9ALoQ+v7DLhKiK
	6pn7Pgvilg+9K2d363H7ydF5s/pyl+f6pqD+tA3jGDA51ndFhC9LmerRp5v7xwfasXsL
	PSuiMO+8Oja8+F2pufVkcR1LwF5th8PwHIGmU9/hsWWH9uVubhyJ+xuI9r89iHEYLzsi
	5M3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6MEvVV1cpJRIyG+m3nqqh8KYOBCH91/9B31Omgkz6Eg=;
	b=lZDX9vOq/jneX6JX/ky135AfKQZ1e+LwpROp0w8dcx1QOkxa0/nkf+pWIBIk1kYxMX
	K3tkQhRrHyuKnmT7ArJjy0Q5/kSQEDRVYjpOcfhaFz7IAM2tLryqtvBmBPzyU3upRkZQ
	JChUNoOLRxMlwJRQU/Q+AwOrpm8Noen0roL4s3sbL0LQyWUqCIKK9eqLo/EJ51n3YWJf
	lIzUoFkD4yH+5fVDNvemK/IBHM4srW9PZJ2O5sN6t4lawdbtakUTOw24Nglo9Zlnf3vH
	Z7jXUzQs2TjPMOxf12llbdGRf+NmJ/ZT7BKFnSoIhLwwXqwJMSnEKZceKIjHPDmCkich
	XZUg==
X-Gm-Message-State: AHQUAuZMg59dqkX8t0Jm1fJi0gToHngeXe0ScbBD5JEErlCDxHKZlwNK
	YXRsmp8uaKDB2W33jnM3LpmkNjj0fW4=
X-Google-Smtp-Source: AHgI3Iakd1KY1w8K5NWVImu84V+EmUhLbIyerFA09xDfKEcSb6xHRLRSO/+5UxxoiBmT48jIWMz9ng==
X-Received: by 2002:a63:2f86:: with SMTP id v128mr2493303pgv.407.1549033005559;
	Fri, 01 Feb 2019 06:56:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::5276])
	by smtp.gmail.com with ESMTPSA id w3sm10155764pge.8.2019.02.01.06.56.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Feb 2019 06:56:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Feb 2019 06:56:37 -0800
Message-Id: <20190201145637.42277-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] dibbler: Fix build with clang/libc++
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
X-List-Received-Date: Fri, 01 Feb 2019 14:56:45 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Rename-pthread_mutex_t-variable-lock.patch | 74 +++++++++++++++++++
 .../dibbler/dibbler_git.bb                    |  3 +-
 2 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/dibbler/dibbler/0001-linux-port-Rename-pthread_mutex_t-variable-lock.patch

diff --git a/meta-networking/recipes-connectivity/dibbler/dibbler/0001-linux-port-Rename-pthread_mutex_t-variable-lock.patch b/meta-networking/recipes-connectivity/dibbler/dibbler/0001-linux-port-Rename-pthread_mutex_t-variable-lock.patch
new file mode 100644
index 0000000000..346a56a9ad
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dibbler/dibbler/0001-linux-port-Rename-pthread_mutex_t-variable-lock.patch
@@ -0,0 +1,74 @@
+From 630086cf1b3fba71822319a268d3711734cd6aa8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 31 Jan 2019 12:56:13 -0800
+Subject: [PATCH] linux-port: Rename pthread_mutex_t variable 'lock'
+
+lock is also used by libc++ in std namespace and using it here causes
+clang to fail e.g.
+
+dibbler-client.cpp:47:25: error: reference to 'lock' is ambiguous
+    pthread_mutex_lock(&lock);
+                        ^
+../../../../../../../workspace/sources/dibbler/Port-linux/dibbler-client.cpp:29:26: note: candidate found by name lookup is 'lock'
+extern ::pthread_mutex_t lock;
+                         ^
+/mnt/a/yoe/build/tmp/work/aarch64-yoe-linux/dibbler/1.0.1+1.0.2RC1+gitc4b0ed52e751da7823dd9a36e91f93a6310e5525-r0/recipe-sysroot/usr/include/c++/v1/mutex:446:1: note: candidate found by name lookup is 'std::__1::lock'
+lock(_L0& __l0, _L1& __l1, _L2& __l2, _L3& ...__l3)
+
+Upstream-Status: Submitted [https://github.com/tomaszmrugalski/dibbler/pull/37]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Port-linux/dibbler-client.cpp          | 6 +++---
+ Port-linux/lowlevel-linux-link-state.c | 6 +++---
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/Port-linux/dibbler-client.cpp b/Port-linux/dibbler-client.cpp
+index 78f34241..b5ebb9f0 100644
+--- a/Port-linux/dibbler-client.cpp
++++ b/Port-linux/dibbler-client.cpp
+@@ -26,7 +26,7 @@ using namespace std;
+ 
+ #define IF_RECONNECTED_DETECTED -1
+ 
+-extern pthread_mutex_t lock;
++extern pthread_mutex_t dibbler_lock;
+ 
+ TDHCPClient* ptr = 0;
+ 
+@@ -44,8 +44,8 @@ void signal_handler(int n) {
+ #ifdef MOD_CLNT_CONFIRM
+ void signal_handler_of_linkstate_change(int n) {
+     Log(Notice) << "Network switch off event detected. initiating CONFIRM." << LogEnd;
+-    pthread_mutex_lock(&lock);
+-    pthread_mutex_unlock(&lock);
++    pthread_mutex_lock(&dibbler_lock);
++    pthread_mutex_unlock(&dibbler_lock);
+ }
+ #endif
+ 
+diff --git a/Port-linux/lowlevel-linux-link-state.c b/Port-linux/lowlevel-linux-link-state.c
+index 76293ea1..e6b94063 100644
+--- a/Port-linux/lowlevel-linux-link-state.c
++++ b/Port-linux/lowlevel-linux-link-state.c
+@@ -34,7 +34,7 @@ volatile int * notifier = 0;
+ int isDone = 0;
+ pthread_t parent_id;
+ pthread_t ntid;
+-pthread_mutex_t lock;
++pthread_mutex_t dibbler_lock;
+ 
+ struct state {
+     int id;
+@@ -86,9 +86,9 @@ void link_state_changed(int ifindex)
+     {
+ 	if (changed_links->cnt<16)
+ 	    changed_links->ifindex[changed_links->cnt++] = ifindex;
+-	pthread_mutex_lock(&lock);
++	pthread_mutex_lock(&dibbler_lock);
+ 	*notifier = 1; /* notify that change has occured */
+-	pthread_mutex_unlock(&lock);
++	pthread_mutex_unlock(&dibbler_lock);
+ 	pthread_kill(parent_id,SIGUSR1);
+     } else
+     {
diff --git a/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb b/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
index 8890e14318..90051a319a 100644
--- a/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
+++ b/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
@@ -9,7 +9,8 @@ SRCREV = "c4b0ed52e751da7823dd9a36e91f93a6310e5525"
 
 SRC_URI = "git://github.com/tomaszmrugalski/dibbler \
            file://dibbler_fix_getSize_crash.patch \
-          "
+           file://0001-linux-port-Rename-pthread_mutex_t-variable-lock.patch \
+           "
 PV = "1.0.1+1.0.2RC1+git${SRCREV}"
 
 S = "${WORKDIR}/git"
-- 
2.20.1


