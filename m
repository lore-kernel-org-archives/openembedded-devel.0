Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 54E9A78957
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 03:27:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6P3Ro7e010311
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 20:27:50 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Tue, 24 Jul 2018 20:27:50 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Jul 2018 11:27:32 +0800
Message-ID: <1532489252-246963-11-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1532489252-246963-1-git-send-email-changqing.li@windriver.com>
References: <1532489252-246963-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-networking] netcat-openbsd: 1.105 -> 1.190
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
X-List-Received-Date: Wed, 25 Jul 2018 03:27:49 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

License-Update: License updated/Add copyright for
    some missing file/fix some URL 

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...bundle-own-base64-encode-decode-functions.patch | 70 ++++++++++++----------
 ...at-openbsd_1.105.bb => netcat-openbsd_1.190.bb} | 14 ++---
 2 files changed, 47 insertions(+), 37 deletions(-)
 rename meta-networking/recipes-support/netcat/{netcat-openbsd_1.105.bb => netcat-openbsd_1.190.bb} (72%)

diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd/0001-bundle-own-base64-encode-decode-functions.patch b/meta-networking/recipes-support/netcat/netcat-openbsd/0001-bundle-own-base64-encode-decode-functions.patch
index 0966b65..929f63f 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd/0001-bundle-own-base64-encode-decode-functions.patch
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd/0001-bundle-own-base64-encode-decode-functions.patch
@@ -1,40 +1,47 @@
-From ccd166b73eaae4dd1e1785c63ceb9b303568ed46 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 21 Mar 2017 11:30:49 -0700
+From 3da48ec13a44b71ca51adbc803b42c1b29a43f57 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 24 Jul 2018 14:03:51 +0800
 Subject: [PATCH] bundle own base64 encode/decode functions
 
 Not all libc implementations provide it.
 as an aside libresolv is no longer needed
 
+Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Update to version 1.190-2
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  Makefile |   4 +-
  base64.c | 313 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
- netcat.c |   2 +
+ netcat.c |   3 +
  socks.c  |   3 +
- 4 files changed, 320 insertions(+), 2 deletions(-)
+ 4 files changed, 321 insertions(+), 2 deletions(-)
  create mode 100644 base64.c
 
-Index: netcat-openbsd-1.105/Makefile
-===================================================================
---- netcat-openbsd-1.105.orig/Makefile
-+++ netcat-openbsd-1.105/Makefile
-@@ -1,9 +1,9 @@
- #       $OpenBSD: Makefile,v 1.6 2001/09/02 18:45:41 jakob Exp $
+diff --git a/Makefile b/Makefile
+index 8247cfd..b8d8547 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,10 +1,10 @@
+ #	$OpenBSD: Makefile,v 1.7 2015/09/11 21:07:01 beck Exp $
  
  PROG=	nc
 -SRCS=	netcat.c atomicio.c socks.c
 +SRCS=	netcat.c atomicio.c socks.c base64.c
  
--LIBS=  `pkg-config --libs libbsd` -lresolv
-+LIBS=  `pkg-config --libs libbsd`
+ PKG_CONFIG ?= pkg-config
+-LIBS=  `$(PKG_CONFIG) --libs libbsd` -lresolv
++LIBS=  `$(PKG_CONFIG) --libs libbsd`
  OBJS=  $(SRCS:.c=.o)
  CFLAGS=  -g -O2
  LDFLAGS=  -Wl,--no-add-needed
-Index: netcat-openbsd-1.105/base64.c
-===================================================================
+diff --git a/base64.c b/base64.c
+new file mode 100644
+index 0000000..b0ee6c2
 --- /dev/null
-+++ netcat-openbsd-1.105/base64.c
++++ b/base64.c
 @@ -0,0 +1,313 @@
 +/*
 + * Copyright (c) 1996-1999 by Internet Software Consortium.
@@ -349,31 +356,34 @@ Index: netcat-openbsd-1.105/base64.c
 +
 +	return (tarindex);
 +}
-Index: netcat-openbsd-1.105/netcat.c
-===================================================================
---- netcat-openbsd-1.105.orig/netcat.c
-+++ netcat-openbsd-1.105/netcat.c
-@@ -169,6 +169,9 @@ static int connect_with_timeout(int fd,
-         socklen_t salen, int ctimeout);
+diff --git a/netcat.c b/netcat.c
+index a0fb51b..9c4ed23 100644
+--- a/netcat.c
++++ b/netcat.c
+@@ -240,6 +240,9 @@ static int connect_with_timeout(int fd, const struct sockaddr *sa,
+ 
  static void quit();
  
-+int	b64_ntop(u_char const *src, size_t srclength, char *target, size_t targsize);
-+int	b64_pton(char const *src, u_char *target, size_t targsize);
++int    b64_ntop(u_char const *src, size_t srclength, char *target, size_t targsize);
++int    b64_pton(char const *src, u_char *target, size_t targsize);
 +
  int
  main(int argc, char *argv[])
  {
-Index: netcat-openbsd-1.105/socks.c
-===================================================================
---- netcat-openbsd-1.105.orig/socks.c
-+++ netcat-openbsd-1.105/socks.c
+diff --git a/socks.c b/socks.c
+index 9068f39..c576f6b 100644
+--- a/socks.c
++++ b/socks.c
 @@ -53,6 +53,9 @@
  #define SOCKS_DOMAIN	3
  #define SOCKS_IPV6	4
  
-+int	b64_ntop(u_char const *src, size_t srclength, char *target, size_t targsize);
-+int	b64_pton(char const *src, u_char *target, size_t targsize);
++int    b64_ntop(u_char const *src, size_t srclength, char *target, size_t targsize);
++int    b64_pton(char const *src, u_char *target, size_t targsize);
 +
  int	remote_connect(const char *, const char *, struct addrinfo);
  int	socks_connect(const char *, const char *, struct addrinfo,
  	    const char *, const char *, struct addrinfo, int,
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.190.bb
similarity index 72%
rename from meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
rename to meta-networking/recipes-support/netcat/netcat-openbsd_1.190.bb
index 9d7420f..b4802fa 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.190.bb
@@ -1,21 +1,21 @@
 require netcat.inc
 SUMMARY = "OpenBSD Netcat"
 HOMEPAGE = "http://ftp.debian.org"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=ee6bbaacb5db5f2973818f0902c3ae6f"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=f39e60ae4ea9fdb559c833be2e59de99"
 
 DEPENDS += "glib-2.0 libbsd"
 do_patch[depends] = "quilt-native:do_populate_sysroot"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}.orig.tar.gz;name=netcat \
-           ${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}-7.debian.tar.gz;name=netcat-patch;subdir=${BP} \
+           ${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}-2.debian.tar.xz;name=netcat-patch;subdir=${BP} \
            file://0001-bundle-own-base64-encode-decode-functions.patch \
            "
 
-SRC_URI[netcat.md5sum] = "7e67b22f1ad41a1b7effbb59ff28fca1"
-SRC_URI[netcat.sha256sum] = "40653fe66c1516876b61b07e093d826e2a5463c5d994f1b7e6ce328f3edb211e"
-SRC_URI[netcat-patch.md5sum] = "e914f8eb7eda5c75c679dd77787ac76b"
-SRC_URI[netcat-patch.sha256sum] = "eee759327ffea293e81d0dde67921b7fcfcad279ffd7a2c9d037bbc8f882b363"
+SRC_URI[netcat.md5sum] = "dd32fd1d7903b541ad8709794539b959"
+SRC_URI[netcat.sha256sum] = "68ccc448392c05ec51baed0167a72b8c650454f990b895d6e6877d416a38e536"
+SRC_URI[netcat-patch.md5sum] = "78058b7af0170654b877b02c37716cdf"
+SRC_URI[netcat-patch.sha256sum] = "88088af3f520c7825e59bc133d65e70fc4a30139d451c6faabbd9f240bc78374"
 
 inherit pkgconfig
 
-- 
2.7.4


