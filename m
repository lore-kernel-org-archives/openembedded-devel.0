Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 77B5D77E3E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:27 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id g2so18478859pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SJLBYjI3ZxeQqOlMhLBeX8gITGfWtGAaaH+Pjuug2fM=;
	b=RuxpwJkuNbGRzF1ToMEt9Xseg4vQY9tA1HtpyOQIDX1QVV15K1ycUnRpNK+hHRxz/B
	1IAbtJLbslw13O1LKb/U4BNQyOv27sI2PISLQe/tuf98zFt+6ZdxgbiwNjY7Ld+gro/5
	CsPGWGczzKOTW0QP/kfrH4nzroEYi0Aq+Xg59skqWgXFJRscMHDgFBq7UlryOSvsKy5c
	vVSCrD+2dqn/cyVyDqTg6p6Z7lYt4fGBBO2ugtZA9nchawPyHzdQEUKrr1sKCLAZBGf4
	uQgZVV3ZfQ/GpFIgYr0yqwmuDhqdxt++m4Q4IxL/8MbnyMIqiZdmqQYHiAt0S1OdpzVC
	uTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SJLBYjI3ZxeQqOlMhLBeX8gITGfWtGAaaH+Pjuug2fM=;
	b=fAxF9NWu1rAfwCTVSp77yC2W08PVHTopTRtD+N/m45rA2N6KUSWZt7lwXN730L59Nf
	Kvd2h1VeOTGoPdMU7zo/R0/NgtTALZ78N1NOPkgXgcwYCmrORis3lebAcOdZnohGLs/L
	Y35qfhEhQ68GsTl2pPB5+J0UE30DnOPFlWdY4UaRADuWN6kMJJDl7gggidoQgoBB08jH
	FGYhfA71RWvuC8PdCwsf4beLGykEaRrJkaF0bEFdG0+wl0+hBTQTEKRPVbOGWtOOsgro
	T3q2aYI1IEPrb7+haFTLLz3ETjtzoJqX6EJN/ghCHQVBu6GWfizc2GPzbM9YcftxodBS
	pZLw==
X-Gm-Message-State: AFeK/H3nVOFPKmTh9XBb8NeaDqKails49INCShoZs62xaGTC615Xx0Hg9vUXAn5YKAOEzQ==
X-Received: by 10.98.210.133 with SMTP id c127mr3844430pfg.83.1490978608723;
	Fri, 31 Mar 2017 09:43:28 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:27 -0700
Message-Id: <20170331164247.5052-23-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 23/43] rp-pppoe: Fix build with musl
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-ppoe-Dont-include-linux-if_ether.h.patch  | 30 ++++++++++++++++++++++
 ...0002-Enable-support-for-the-kernel-module.patch | 25 ++++++++++++++++++
 .../recipes-protocols/rp-pppoe/rp-pppoe_3.12.bb    |  5 +++-
 3 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/0001-ppoe-Dont-include-linux-if_ether.h.patch
 create mode 100644 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/0002-Enable-support-for-the-kernel-module.patch

diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/0001-ppoe-Dont-include-linux-if_ether.h.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/0001-ppoe-Dont-include-linux-if_ether.h.patch
new file mode 100644
index 000000000..11356ce3f
--- /dev/null
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/0001-ppoe-Dont-include-linux-if_ether.h.patch
@@ -0,0 +1,30 @@
+From 8d4d452d733bac8c5b55a90bddec8cc323cc9fa8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Mar 2017 19:20:07 -0700
+Subject: [PATCH 1/2] ppoe: Dont include linux/if_ether.h
+
+Fixes build with musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/pppoe.h | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/src/pppoe.h b/src/pppoe.h
+index ec067a0..281879c 100644
+--- a/src/pppoe.h
++++ b/src/pppoe.h
+@@ -127,10 +127,6 @@ typedef unsigned long UINT32_t;
+ #error Could not find a 32-bit integer type
+ #endif
+ 
+-#ifdef HAVE_LINUX_IF_ETHER_H
+-#include <linux/if_ether.h>
+-#endif
+-
+ #include <netinet/in.h>
+ 
+ #ifdef HAVE_NETINET_IF_ETHER_H
+-- 
+2.12.1
+
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/0002-Enable-support-for-the-kernel-module.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/0002-Enable-support-for-the-kernel-module.patch
new file mode 100644
index 000000000..139d1f089
--- /dev/null
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/0002-Enable-support-for-the-kernel-module.patch
@@ -0,0 +1,25 @@
+From aca8473a516a8dc013866105da141fe1cd947474 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Mar 2017 19:24:53 -0700
+Subject: [PATCH 2/2] Enable support for the kernel module
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/configure.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/configure.in b/src/configure.in
+index cae0976..951a042 100644
+--- a/src/configure.in
++++ b/src/configure.in
+@@ -33,6 +33,7 @@ AC_CHECK_HEADERS(linux/if_pppox.h, [], [],
+ #include<net/ethernet.h>
+ #include<linux/if.h>
+ #include<linux/in.h>
++#include<linux/in6.h>
+ ])
+ 
+ dnl Checks for typedefs, structures, and compiler characteristics.
+-- 
+2.12.1
+
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.12.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.12.bb
index e1ca17fb3..fbe015f5e 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.12.bb
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.12.bb
@@ -17,7 +17,10 @@ SRC_URI = "http://www.roaringpenguin.com/files/download/${BP}.tar.gz \
            file://pppoe-server.default \
            file://pppoe-server.init \
            file://configure.in-Error-fix.patch \
-           file://pppoe-server.service"
+           file://pppoe-server.service \
+           file://0001-ppoe-Dont-include-linux-if_ether.h.patch \
+           file://0002-Enable-support-for-the-kernel-module.patch \
+           "
 
 SRC_URI[md5sum] = "216eb52b69062b92a64ee37fd71f4b66"
 SRC_URI[sha256sum] = "00794e04031546b0e9b8cf286f2a6d1ccfc4a621b2a3abb2d7ef2a7ab7cc86c2"
-- 
2.12.1


