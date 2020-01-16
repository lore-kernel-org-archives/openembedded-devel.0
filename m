Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id CEBEC7F94C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 04:42:25 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 4so9590531pfz.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 20:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LJWBc3ukjZzbGrLjeNfGnpSENW927/1wsdaB5ZfQyt0=;
	b=KXW+qBBLpAMy7lqsSHzaxEgMsmQDDEqPJkz/f2614+ORNN56ox4SFcqI1Ld06aGKjG
	3zCrUKMX6pj4UqqLsVQp0j6sc3FUEZUBHMhCOFFKYl6fL+bIe1KMh5FqrFOmdkjj5AMQ
	xVY4Ci4GB7+7Yr8FUaKBL4jQQK/x/cdonefMlcFjM1RG2dBTxzV92dPfF7DhYHNB0I2i
	VP4vil88Ckfb2UAUYGSR0Wttw8teat9SKc7lbuU9T1kznwOYVB0cK9RJm+CAJsXgiMM5
	ECuQUDpv55mKiXXaGE8w1A+bq2IO/mlqtvHYnELVi29Ms/Rc60qK3bqton1gIV2N5S8T
	hETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LJWBc3ukjZzbGrLjeNfGnpSENW927/1wsdaB5ZfQyt0=;
	b=r2APA+4sOmhUg+KxerDSdHXxR86JFBnvaXXHONyUzxN9nVluY811No2Hb76r4FUsRV
	7O49n5vQk8Ny/S0ji09QNt/GXoLdKI3zBPacA/fdO8bIfys5FaJrR0shXZX9hbnXaxiX
	UY1jSvJJir7aZTnv4f9ucaQRTNRC99a8ulMUW2cekO00hJ8KSxdrI/6vxpbN3YR2FXjQ
	yfmTPJp+qNCrVkEzUquDzS2PmCGn8Z1yFUpMynkHe37Ton6svv9dOyTEfN0+wsJo8Ygr
	e7UD85phcm53FVn9yggKWGOL7IPr//lbhRSHyQkJkjCuLR9ngyHfQmxLo8+WnRhjbgJJ
	sBFg==
X-Gm-Message-State: APjAAAVgT4avT+UmAHbVnOvxgKbgorDHD/awGSIGubqTvJQ80HqHWmjF
	JJVr4j5Xb7aU0ZUi110/ga0zjmlB3nc=
X-Google-Smtp-Source: APXvYqz8QyjFlPsZ6pBVVPbEMQzQkvtWb3IBYjLhRvdeUp6sxIUJUzo3sEcT2e3q0JpZhdfTWWkaAg==
X-Received: by 2002:a63:cb48:: with SMTP id m8mr38288222pgi.128.1579149746401; 
	Wed, 15 Jan 2020 20:42:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e77a])
	by smtp.gmail.com with ESMTPSA id l14sm1425742pjq.5.2020.01.15.20.42.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 15 Jan 2020 20:42:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2020 20:42:20 -0800
Message-Id: <20200116044220.3667460-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200116044220.3667460-1-raj.khem@gmail.com>
References: <20200116044220.3667460-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 5/5] rdma-core: Use overloadable attribute with clang
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
X-List-Received-Date: Thu, 16 Jan 2020 04:42:26 -0000
Content-Transfer-Encoding: 8bit

This ensures that clang is not fussy about overloading recvfrom()

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...se-overloadable-attribute-with-clang.patch | 42 +++++++++++++++++++
 .../rdma-core/rdma-core_27.0.bb               |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-networking/recipes-support/rdma-core/rdma-core/0001-Use-overloadable-attribute-with-clang.patch

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core/0001-Use-overloadable-attribute-with-clang.patch b/meta-networking/recipes-support/rdma-core/rdma-core/0001-Use-overloadable-attribute-with-clang.patch
new file mode 100644
index 0000000000..1ba6847d2f
--- /dev/null
+++ b/meta-networking/recipes-support/rdma-core/rdma-core/0001-Use-overloadable-attribute-with-clang.patch
@@ -0,0 +1,42 @@
+From 42976ed0a0160864b41680604ea9cdb3c175cb94 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 15 Jan 2020 17:48:28 -0800
+Subject: [PATCH] Use overloadable attribute with clang
+
+This is overriding the libc implementation
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ librdmacm/preload.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/librdmacm/preload.c b/librdmacm/preload.c
+index d46beb1b..b451de50 100644
+--- a/librdmacm/preload.c
++++ b/librdmacm/preload.c
+@@ -59,6 +59,12 @@
+ #include "cma.h"
+ #include "indexer.h"
+ 
++#ifdef __clang__
++#define OVERLOAD  __attribute__((overloadable)) 
++#else
++#define OVERLOAD
++#endif
++
+ struct socket_calls {
+ 	int (*socket)(int domain, int type, int protocol);
+ 	int (*bind)(int socket, const struct sockaddr *addr, socklen_t addrlen);
+@@ -793,7 +799,7 @@ ssize_t recv(int socket, void *buf, size_t len, int flags)
+ 		rrecv(fd, buf, len, flags) : real.recv(fd, buf, len, flags);
+ }
+ 
+-ssize_t recvfrom(int socket, void *buf, size_t len, int flags,
++ssize_t OVERLOAD recvfrom(int socket, void *buf, size_t len, int flags,
+ 		 struct sockaddr *src_addr, socklen_t *addrlen)
+ {
+ 	int fd;
+-- 
+2.25.0
+
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_27.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_27.0.bb
index 361d69b337..417979dc33 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_27.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_27.0.bb
@@ -9,6 +9,7 @@ BRANCH = "stable-v${@d.getVar('PV').split('.')[0]}"
 SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=${BRANCH} \
            file://0001-Remove-man-files-which-cant-be-built.patch \
            file://0001-librdmacm-Use-sched_yield-instead-of-pthread_yield.patch \
+           file://0001-Use-overloadable-attribute-with-clang.patch \
            "
 SRCREV = "84caf035ae6123e2296b72006cd2cf698c65eb46"
 S = "${WORKDIR}/git"
-- 
2.25.0


