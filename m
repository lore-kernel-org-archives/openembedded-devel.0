Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 26ACA6FFA4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Sep 2017 05:33:29 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id y29so2241774pff.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Sep 2017 22:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=M+o56uW8JU21+VsdY0hUPMDOxULgqn6BEenMpUrfIww=;
	b=nr/x5sq53X1jlIcJbEVMNQJcC5WiwPXB46iUbxL8Iuqw58w7tVpIZTHv/fe9xcXT9S
	fHTLSRYk0YoBrDYuAcSFryD8WTWg5v5OhtHivUSdoDcfxG3wQWNPjoZ/sD5/WZ9t3lay
	zNPin/PELpdxDPMxot8cD7UCEjrRMWDT09g1LtyLPpv9v642Pbq2hw/QwmUKvaPSgyqk
	yy28Q9S4HbwRDje2to1zMDP1wajKUCnah1Jb70d/TdiTLlUZZKN5wcym4pFu6zWpw77d
	FsGSlgHqsOzx0XIVo9Ik1mvjEx8Ljr48WNLRDUuKNyMkIfw3SQSzFSXJOs8aLeQ6Jp+q
	9Egw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=M+o56uW8JU21+VsdY0hUPMDOxULgqn6BEenMpUrfIww=;
	b=nLn3VLdCsPzD8JOXUhbUoTYtrHhGaXvxRz9bASpbotV4kPde3oNy5QpJtGPvsI8FqR
	i2sqdHx0kRPDvtIn5UNQ2aHi+38By7CCaNwHN6CZJqUG7OC9jtiZhXVdfzMxlyIHsKGo
	2F1R/vNwIjn4ZyhjYRN2rCxD3ui/clTcRfUcJivKzufkXsAcVexn/2ZDXjCZ0UmjLVvP
	Jkn7ulr7Ap1x7F/yAkzviv9TCX0bL3KktfSrO8Tk6Mk0I3Wlz4C1lC28Oo8itbttIrS1
	KuRrAUAa66oNLApWkSHTvR4d3Cykr5anGgpMsFINL4ODd4K2hPXydfvQHXdv8+ZHADSZ
	XPuw==
X-Gm-Message-State: AHPjjUiSFLwfQ9p9lLNzaZO8ZbGBUxNIAHIDnPHGTJ0ZQ/DxWspt3yTY
	q6bR3LJ6UkFJohBR
X-Google-Smtp-Source: ADKCNb5omHA1MkvKcFGr/u/Fl0+X/7RBMVIi5NYXY1AylYg4Xfv6Sshc5HXKUBn/f2ZPeaiha0rXKQ==
X-Received: by 10.84.233.70 with SMTP id k6mr2206100plt.38.1504848811377;
	Thu, 07 Sep 2017 22:33:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::be3d])
	by smtp.gmail.com with ESMTPSA id
	m190sm1564096pga.2.2017.09.07.22.33.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Sep 2017 22:33:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Sep 2017 22:33:20 -0700
Message-Id: <20170908053322.16130-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH 1/3] sblim-sfcc: Fix build with musl
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
X-List-Received-Date: Fri, 08 Sep 2017 05:33:30 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-cimxml-Include-sys-select.h-for-fd_set.patch | 37 ++++++++++++++++++++++
 .../sblim-sfcc/sblim-sfcc_2.2.8.bb                 |  4 ++-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc/0001-cimxml-Include-sys-select.h-for-fd_set.patch

diff --git a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc/0001-cimxml-Include-sys-select.h-for-fd_set.patch b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc/0001-cimxml-Include-sys-select.h-for-fd_set.patch
new file mode 100644
index 000000000..19e50ec79
--- /dev/null
+++ b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc/0001-cimxml-Include-sys-select.h-for-fd_set.patch
@@ -0,0 +1,37 @@
+From 9981542cb443cdaf9134500b78fe7eda9f99861f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Sep 2017 21:43:26 -0700
+Subject: [PATCH] cimxml: Include sys/select.h for fd_set
+
+define __SOCKADDR_ARG on linux when libc != glibc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+ backend/cimxml/indicationlistener.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/backend/cimxml/indicationlistener.c b/backend/cimxml/indicationlistener.c
+index 0d7d9fe..37c45ae 100755
+--- a/backend/cimxml/indicationlistener.c
++++ b/backend/cimxml/indicationlistener.c
+@@ -25,6 +25,7 @@
+ 
+ #include <pthread.h>
+ #include <sys/socket.h>
++#include <sys/select.h>
+ #include <netinet/in.h>
+ #include <fcntl.h>
+ #include <errno.h>
+@@ -36,7 +37,7 @@ static int do_listen=1;
+ #define hdrBufsize 5000
+ #define hdrLimmit 5000
+ 
+-#ifdef __APPLE__
++#if defined(__APPLE__) || (defined(__linux__) && !defined(__GLIBC__))
+ # define __SOCKADDR_ARG   struct sockaddr *__restrict
+ #endif
+ 
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
index 1ec99404a..df55a6799 100644
--- a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
+++ b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
@@ -2,7 +2,9 @@ SUMMARY = "Small Footprint CIM Client Library"
 DESCRIPTION = "Small Footprint CIM Client Library Runtime Libraries"
 HOMEPAGE = "http://www.sblim.org"
 
-SRC_URI = "http://netcologne.dl.sourceforge.net/project/sblim/${BPN}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "http://netcologne.dl.sourceforge.net/project/sblim/${BPN}/${BPN}-${PV}.tar.bz2 \
+           file://0001-cimxml-Include-sys-select.h-for-fd_set.patch \
+           "
 
 SRC_URI[md5sum] = "0bac0dec19f17ec065b6c332a56d7bae"
 SRC_URI[sha256sum] = "1b8f187583bc6c6b0a63aae0165ca37892a2a3bd4bb0682cd76b56268b42c3d6"
-- 
2.14.1


