Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 425827FC2E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 18:48:01 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id s64so2928745pgb.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 10:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eEbd0DLWOWf6QyJNAjAKaGM5NYFVwaxL4q8CVsNxJ+M=;
	b=lIYkHJGzmmMW94yxWR82k2TvEILB/IePpPl/iqdHV2/tq3DzI1ivzwkByxvjK8DCrc
	ynXbtWn1Zpl3AgU8UJw10/UPlZCGW6I2oBJggsQwKdSMybpf/uNDHDfEhY1Zv/U60eS8
	MuXE7tf3MwtdyqJtUwblebAa0dUg2VveI2iJdvX4v6XTRKPzjam1WcK1vx9AOT/3Z9IJ
	N8gdiFPOfpEtUM4/ZPEUNx7zPHxT/msvrO/td26zfnX89xHxAfqJc+2nFOpRRLXVCBxw
	BQnzFuAdjW3xWACUb44h6tBWEs0BEGcnikx7+GgwjFbzKvS5D16s2Rl4/BFFjqG6oVJ4
	xSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eEbd0DLWOWf6QyJNAjAKaGM5NYFVwaxL4q8CVsNxJ+M=;
	b=WITNK2zFV6v1gsVlETFs0d+KWxgOxVwfTLXxJILanRFS74bIlxRLg1Cl1SYsjkmzQT
	idV0pQOe3dJ5Yd05hVYUbh07OtmoxX82bkCKfJoibSJRyA20tFd3wArMH0fNr3JhnvqM
	bqDCIV2WVEBdXbAdQpN6myFOEGWNc/I0AK4BaaDWiUYh8hG3a3YifgcDKxjcwS1tCP4F
	BrUtWEhRnNZfgo76Xd6Lt+ELS96Q5O5qnG/tBsBY33SwZzmJxafI0vpmOYT7beIMJWXB
	FAiCSlA04WBzRVTa7sYTmmipCKC8BOMzqtb6uNAZAq1brD77dBdjmJnR4M3bUXQWMBWs
	uHXg==
X-Gm-Message-State: APjAAAVZ3NfqDk/N6wgYU5Jt4jCyxFOlDEibZw3HfySgUhRXi7itPW8S
	KL61Zg+x7e7dQRCIc+EXekHX6xoElAA=
X-Google-Smtp-Source: APXvYqxVzt2H9+ROQCnO4KXec9/o5xN1ULSqwW6bJjBCGssata9xiii81H2ioQplMbIb75Y07rRzxA==
X-Received: by 2002:a63:89c2:: with SMTP id
	v185mr10587220pgd.135.1579978081761; 
	Sat, 25 Jan 2020 10:48:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c54b])
	by smtp.gmail.com with ESMTPSA id
	m19sm10286746pjv.10.2020.01.25.10.48.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 25 Jan 2020 10:48:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Jan 2020 10:48:01 -0800
Message-Id: <20200125184801.477413-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] rdma-core: Drop overloadable attribute for recvfrom
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
X-List-Received-Date: Sat, 25 Jan 2020 18:48:01 -0000
Content-Transfer-Encoding: 8bit

glibc patch is now removed for this to be required

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...se-overloadable-attribute-with-clang.patch | 42 -------------------
 .../rdma-core/rdma-core_27.0.bb               |  1 -
 2 files changed, 43 deletions(-)
 delete mode 100644 meta-networking/recipes-support/rdma-core/rdma-core/0001-Use-overloadable-attribute-with-clang.patch

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core/0001-Use-overloadable-attribute-with-clang.patch b/meta-networking/recipes-support/rdma-core/rdma-core/0001-Use-overloadable-attribute-with-clang.patch
deleted file mode 100644
index 1ba6847d2f..0000000000
--- a/meta-networking/recipes-support/rdma-core/rdma-core/0001-Use-overloadable-attribute-with-clang.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 42976ed0a0160864b41680604ea9cdb3c175cb94 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 15 Jan 2020 17:48:28 -0800
-Subject: [PATCH] Use overloadable attribute with clang
-
-This is overriding the libc implementation
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- librdmacm/preload.c | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/librdmacm/preload.c b/librdmacm/preload.c
-index d46beb1b..b451de50 100644
---- a/librdmacm/preload.c
-+++ b/librdmacm/preload.c
-@@ -59,6 +59,12 @@
- #include "cma.h"
- #include "indexer.h"
- 
-+#ifdef __clang__
-+#define OVERLOAD  __attribute__((overloadable)) 
-+#else
-+#define OVERLOAD
-+#endif
-+
- struct socket_calls {
- 	int (*socket)(int domain, int type, int protocol);
- 	int (*bind)(int socket, const struct sockaddr *addr, socklen_t addrlen);
-@@ -793,7 +799,7 @@ ssize_t recv(int socket, void *buf, size_t len, int flags)
- 		rrecv(fd, buf, len, flags) : real.recv(fd, buf, len, flags);
- }
- 
--ssize_t recvfrom(int socket, void *buf, size_t len, int flags,
-+ssize_t OVERLOAD recvfrom(int socket, void *buf, size_t len, int flags,
- 		 struct sockaddr *src_addr, socklen_t *addrlen)
- {
- 	int fd;
--- 
-2.25.0
-
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_27.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_27.0.bb
index 417979dc33..361d69b337 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_27.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_27.0.bb
@@ -9,7 +9,6 @@ BRANCH = "stable-v${@d.getVar('PV').split('.')[0]}"
 SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=${BRANCH} \
            file://0001-Remove-man-files-which-cant-be-built.patch \
            file://0001-librdmacm-Use-sched_yield-instead-of-pthread_yield.patch \
-           file://0001-Use-overloadable-attribute-with-clang.patch \
            "
 SRCREV = "84caf035ae6123e2296b72006cd2cf698c65eb46"
 S = "${WORKDIR}/git"
-- 
2.25.0


