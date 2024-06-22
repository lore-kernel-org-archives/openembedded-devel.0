Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE5FC27C53
	for <webhook@archiver.kernel.org>; Sat, 22 Jun 2024 05:27:35 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.92025.1719034053553231632
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jun 2024 22:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cL+pW9aj;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-25ce281cf3cso475969fac.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jun 2024 22:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719034052; x=1719638852; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PWynWLWA5sstCOrbQVAfyh0627VoQZqhb6h36YONsXc=;
        b=cL+pW9aj6FImIJiZz6jd+9Q7sjKHKapfTPzhJNO4Dk2RZcYLGrImuYFmK4tblyOErK
         BpsG3CVjvOJAUgBETKFosu8UZFa7pBl6fS+cnTF3lCm6OP8mccWxwLmxwyJON6MmHjXk
         sBMUrtBGLEsSvludkZo2oGADQ7hmuQFPR8SQTBqf3BBRiTcFVntNRJB1qWqtd9+8e+Tb
         KxFoOceHjmcL7PbG107FD+SeHBrPFEPQ3NmJIWojKzoXBQ5ayMfnjMkS9uDSoXhLgjnB
         nQ+43bHRTXGRjYnufSyv8JBCBt2Q+fpfxQCxOxprqwCSCxzkPXLHj/hDmg1xkdsRPsKU
         jrMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719034052; x=1719638852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWynWLWA5sstCOrbQVAfyh0627VoQZqhb6h36YONsXc=;
        b=ePmDP8eOyO0TtfUi2+W8yMup8OOSKyN+F4BC8v7BazhPaNiSZz3o/NXw+UrEF4Zm4z
         lgO4EGXu57RGClMimbXUlgPdJ+2+l3Dzpd71i1pkjiwgc5Viphi9UOqD3Pa9JsS4JjYu
         /4G/LQV12eYjh4ObvfAAp1Q5fCfNhbfL7Q4XQSHjiHpmnh2bMgwIMdLk8szgYuztZlk0
         NBJRt1cx3Mb33VRLTgWQluiOyI0PSOjlhQXxv5aT9oZy+3zEcN+SJiwX1Rr0EoCRsQ1m
         un+JawPbInn5Y6Hc+7MN+IgA04yygX/I4admUlNc5IFAb48IQcgCmpEvWHf8U6xrVKSu
         wqXw==
X-Gm-Message-State: AOJu0Yyor8Jko0zg0DeQGvaWYVDaSN3RSiwNOQk7DnCq9Ww4rGJWcxnx
	YL6Vaxb4rZwntXEKEeoh98p8ar48KAn9rgUJlzXUyOViCmG6Cnj6oOqjSw==
X-Google-Smtp-Source: AGHT+IE7d/AuYDIqZ7cExRr1OyilfyQ6OkK78GW0eytztTIGOzTBRvryNnkKpsapTNFr+lAJbs/6mQ==
X-Received: by 2002:a05:6870:c14f:b0:258:42c1:2523 with SMTP id 586e51a60fabf-25c94a67c23mr11153549fac.18.1719034052578;
        Fri, 21 Jun 2024 22:27:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7065130573esm2291554b3a.205.2024.06.21.22.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 22:27:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] rdma-core: Fix recvfrom override errors with glibc 2.40 and clang
Date: Fri, 21 Jun 2024 22:27:30 -0700
Message-ID: <20240622052730.2876661-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Jun 2024 05:27:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110995

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...erloadable-function-attribute-with-c.patch | 40 +++++++++++++++++++
 .../rdma-core/rdma-core_51.0.bb               |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-networking/recipes-support/rdma-core/rdma-core/0001-librdmacm-Use-overloadable-function-attribute-with-c.patch

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core/0001-librdmacm-Use-overloadable-function-attribute-with-c.patch b/meta-networking/recipes-support/rdma-core/rdma-core/0001-librdmacm-Use-overloadable-function-attribute-with-c.patch
new file mode 100644
index 0000000000..9cd240189e
--- /dev/null
+++ b/meta-networking/recipes-support/rdma-core/rdma-core/0001-librdmacm-Use-overloadable-function-attribute-with-c.patch
@@ -0,0 +1,40 @@
+From c7de6834f0cd92b7341ab17a5c6996f3fbd40140 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 21 Jun 2024 22:16:47 -0700
+Subject: [PATCH]  librdmacm: Use overloadable function attribute with clang
+
+ This is to fix build warnings seen with upcoming clang19 and
+ glibc 2.40, since glibc 2.40 has improved fortyfying this
+ function with clang, it ends up with build errors like below
+
+librdmacm/preload.c:796:9: error: at most one overload for a given name may lack the 'overloadable' attribute
+|   796 | ssize_t recvfrom(int socket, void *buf, size_t len, int flags,
+|       |         ^
+| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/rdma-core/51.0/recipe-sysroot/usr/include/sys/socket.h:163:16: note: previous unmarked overload of function is here
+|   163 | extern ssize_t recvfrom (int __fd, void *__restrict __buf, size_t __n,
+|       |                ^
+
+Upstream-Status: Submitted [https://github.com/linux-rdma/rdma-core/pull/1475]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ librdmacm/preload.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/librdmacm/preload.c b/librdmacm/preload.c
+index d46beb1bb..e09b2aa85 100644
+--- a/librdmacm/preload.c
++++ b/librdmacm/preload.c
+@@ -792,8 +792,11 @@ ssize_t recv(int socket, void *buf, size_t len, int flags)
+ 	return (fd_fork_get(socket, &fd) == fd_rsocket) ?
+ 		rrecv(fd, buf, len, flags) : real.recv(fd, buf, len, flags);
+ }
+-
+-ssize_t recvfrom(int socket, void *buf, size_t len, int flags,
++ssize_t
++#ifdef __clang__
++__attribute__((overloadable))
++#endif
++recvfrom(int socket, void *buf, size_t len, int flags,
+ 		 struct sockaddr *src_addr, socklen_t *addrlen)
+ {
+ 	int fd;
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_51.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_51.0.bb
index 7c26a8c436..0c204c109f 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_51.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_51.0.bb
@@ -8,6 +8,7 @@ RDEPENDS:${PN} = "bash perl"
 SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=https \
            file://0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch \
            file://0001-include-libgen.h-for-basename.patch \
+           file://0001-librdmacm-Use-overloadable-function-attribute-with-c.patch \
 "
 SRCREV = "6cd09097ad2eebde9a7fa3d3bb09a2cea6e3c2d6"
 S = "${WORKDIR}/git"

