Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f51.google.com (mail-pl0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id ED38078A95
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Mar 2018 20:41:41 +0000 (UTC)
Received: by mail-pl0-f51.google.com with SMTP id 9-v6so3015149ple.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Mar 2018 12:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dDQ9BbNA313EyG6XbLry4yFh6L7v+rQQAZDtQEd4k04=;
	b=CMYFqlFTgK/3Rue7YIhHWNmo64XZEMukERE0t4cxb4/3Hygce0xywukpWoCo/7YRPF
	QHHca4tOcwkZLX1hLnVz0vKMthmKmoN0n6sjBQRpnBYV4RmrCsnfU+33gXgMl8pIaQYh
	OVVyRhMWDHukNIcti7o3aobBRClXgZ/MNHEKRl2qeq9FxRKPU6VSL9ZkxKuD4vY+n+kG
	BaLSfwQyHboKcYe5R9fGZ5uVuzGpU0z/mRHFCh/L5xMhLBy8FjcQed09xNrtDM+Q4Ixc
	LzfgC8qp43XLVCvoF+ND6IvKpoh3Ya6DcZcldzcOQkFa+S5qpQS3m/k9gXknObWS/EmY
	vX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dDQ9BbNA313EyG6XbLry4yFh6L7v+rQQAZDtQEd4k04=;
	b=WgjNXG02iOQ7rIsaHTmu3+Ji0kTRIDH6BUtrXXfJG3IGRCarwSa/tPAmaMEb+2/7oB
	1hkAGI/vz8nNbBFCZyaq2JGfMJ/wXkPaISCS/gXTgrkzWqKSsgLDl1SnhSJkXlfIw2y1
	uKr7vWOoT/wAwnrFZnfpq7bZ0KYAWpeq+eF9EFNtVMkXRbPwirjLRfPxgc8+VAEEfW8q
	1FhXBa/8rJJN3SUoZ6pJ2ueuLz/kJpNcLvXCmSDYCZVGqsuwESH2dp8QklJyM79h4HqV
	bxi5ysldnXKYOhkiq3oXlcDfxgNR1eXrZnNUqjlfnL7H5Oz3sEbJM/e1uwhAoOvmCTfy
	R59w==
X-Gm-Message-State: APf1xPBRBdjlwM/DOYAe/hWOIfT0bYdPl1zxep0hfL8UxCSPIZDqPJ6g
	R/5LYyf4W6Ffgs9lnacvqy4NJQ==
X-Google-Smtp-Source: AG47ELsmH2PGV87cAFCJJmiq9g1hlrK+iaqErbuZGOQsVzuiX0//s76XBAtr19UB0m1Y6sVEG9iRLQ==
X-Received: by 2002:a17:902:506:: with SMTP id
	6-v6mr11223176plf.365.1520196102942; 
	Sun, 04 Mar 2018 12:41:42 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	u28sm22943090pfl.19.2018.03.04.12.41.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 12:41:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Mar 2018 12:41:25 -0800
Message-Id: <20180304204130.23962-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180304204130.23962-1-raj.khem@gmail.com>
References: <20180304204130.23962-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/7] openl2tp: Fix build due to duplicate net/ headers
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
X-List-Received-Date: Sun, 04 Mar 2018 20:41:42 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...api.c-include-rpc-clnt.h-for-resultproc_t.patch |  7 ++---
 ...0001-plugins-Remove-redundant-net-headers.patch | 31 ++++++++++++++++++++++
 .../openl2tp/0002-user-ipv6-structures.patch       |  7 ++---
 ...linux-kernel-headers-assumptions-on-glibc.patch |  9 ++++---
 .../recipes-protocols/openl2tp/openl2tp_1.8.bb     |  1 +
 5 files changed, 45 insertions(+), 10 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/0001-plugins-Remove-redundant-net-headers.patch

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-l2tp_api.c-include-rpc-clnt.h-for-resultproc_t.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-l2tp_api.c-include-rpc-clnt.h-for-resultproc_t.patch
index a11a97ebd..a72256f19 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-l2tp_api.c-include-rpc-clnt.h-for-resultproc_t.patch
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-l2tp_api.c-include-rpc-clnt.h-for-resultproc_t.patch
@@ -1,13 +1,14 @@
-From 8f299df4dd1ca857e34859c377a29b183c630961 Mon Sep 17 00:00:00 2001
+From b7f146caf28a80ada3d45bb9903890e6dfdd5e85 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 21 Sep 2017 13:05:03 -0700
-Subject: [PATCH] l2tp_api.c: include rpc/clnt.h for 'resultproc_t'
+Subject: [PATCH 4/4] l2tp_api.c: include rpc/clnt.h for 'resultproc_t'
 
 Fixes
 
 | /mnt/a/oe/build/tmp/work/mips32r2-bec-linux-musl/openl2tp/1.8-r0/recipe-sysroot/usr/include/tirpc/rpc/pmap_clnt.h:81:12: error: unknown type name 'resultproc_t'; did you mean 'rpcproc_t'?                                                 |             resultproc_t);                                                                                                                                                                                                                  |             ^~~~~~~~~~~~
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
 Upstream-Status: Pending
 
@@ -27,5 +28,5 @@ index f0946fd..f77881c 100644
  //#include <netinet/in.h>
  
 -- 
-2.14.1
+2.16.2
 
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-plugins-Remove-redundant-net-headers.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-plugins-Remove-redundant-net-headers.patch
new file mode 100644
index 000000000..0276c6648
--- /dev/null
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-plugins-Remove-redundant-net-headers.patch
@@ -0,0 +1,31 @@
+From 343994e7f121bba7f16aa3b5e9c27b5aed7d1b99 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 3 Mar 2018 16:50:03 -0800
+Subject: [PATCH] plugins: Remove redundant net/ headers
+
+They cause errors with glibc 2.27
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ plugins/ppp_unix.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/plugins/ppp_unix.c b/plugins/ppp_unix.c
+index 869066f..6a20b1a 100644
+--- a/plugins/ppp_unix.c
++++ b/plugins/ppp_unix.c
+@@ -25,9 +25,6 @@
+ #include <fcntl.h>
+ #include <sys/types.h>
+ #include <signal.h>
+-#include <net/ethernet.h>
+-#include <net/if.h>
+-#include <netinet/in.h>
+ #include <arpa/inet.h>
+ #include <sys/stat.h>
+ #include <unistd.h>
+-- 
+2.16.2
+
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/0002-user-ipv6-structures.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/0002-user-ipv6-structures.patch
index 3f8bcaa48..abb09be8a 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp/0002-user-ipv6-structures.patch
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/0002-user-ipv6-structures.patch
@@ -1,9 +1,10 @@
-From a41cbeee3cf660663a9baac80545050a8d960898 Mon Sep 17 00:00:00 2001
+From 200b72d2dd7ff05466938c00baf055dbe7779866 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 28 Mar 2017 18:09:58 -0700
-Subject: [PATCH 2/2] user ipv6 structures
+Subject: [PATCH 3/4] user ipv6 structures
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  l2tp_api.c | 8 +++++---
  1 file changed, 5 insertions(+), 3 deletions(-)
@@ -29,5 +30,5 @@ index 9d6f60a..f0946fd 100644
  		svcerr_auth(xprt, AUTH_TOOWEAK);
  		return -EPERM;
 -- 
-2.12.1
+2.16.2
 
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/0004-Adjust-for-linux-kernel-headers-assumptions-on-glibc.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/0004-Adjust-for-linux-kernel-headers-assumptions-on-glibc.patch
index 0fcba6546..ab5b22e01 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp/0004-Adjust-for-linux-kernel-headers-assumptions-on-glibc.patch
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/0004-Adjust-for-linux-kernel-headers-assumptions-on-glibc.patch
@@ -1,7 +1,7 @@
-From ede4ae8e25f9fb746a6f4e076d0ef029938d2880 Mon Sep 17 00:00:00 2001
+From 78f774faff6bd27c378c59e6685ac9b4db68c7bb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 28 Mar 2017 11:46:56 -0700
-Subject: [PATCH 4/4] Adjust for linux-kernel headers assumptions on glibc
+Subject: [PATCH 2/4] Adjust for linux-kernel headers assumptions on glibc
 
 Fixes build issues e.g.
 
@@ -11,12 +11,13 @@ In file included from /mnt/a/build/tmp-musl/work/cortexa7hf-neon-vfpv4-oe-linux-
         ^
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  plugins/ppp_unix.c | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/plugins/ppp_unix.c b/plugins/ppp_unix.c
-index 869066f..5c1e44f 100644
+index 6a20b1a..2e1901f 100644
 --- a/plugins/ppp_unix.c
 +++ b/plugins/ppp_unix.c
 @@ -21,6 +21,11 @@
@@ -32,5 +33,5 @@ index 869066f..5c1e44f 100644
  #include <fcntl.h>
  #include <sys/types.h>
 -- 
-2.12.1
+2.16.2
 
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
index bf6850b17..83e34b70a 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -33,6 +33,7 @@ SRC_URI = "ftp://ftp.openl2tp.org/releases/${BP}/${BP}.tar.gz \
            file://openl2tpd.service \
            file://openl2tpd-enable-tests.patch \
            file://run-ptest \
+           file://0001-plugins-Remove-redundant-net-headers.patch \
            "
 
 SRC_URI_append_libc-musl = "\
-- 
2.16.2


