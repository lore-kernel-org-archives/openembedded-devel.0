Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4F10B6078D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 20:18:07 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id my20so1307611pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 13:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BoVTkpyOQqf2Xh/8AQYwrwYxDuGi6qAa83u4j97/3yI=;
	b=F/kj/ofPdQ7LwbxMahYnpwaxYcXxGLv2U9qKpv8g0w+6IYfxrMbXo90oAsubRtyzsb
	Tdz+JOoTL6t7fYfTvxKKm5LfNYqo7wkGhBscfbvS0LuS4cQn91k2ceaODLITE4+HmWGZ
	850AKoYMH0LmNtopCbNhJIDtg91RYAh2zYIbMPiJEJ2VnNv1fZhZhsf0gSfojazz+X7Y
	87Sh1+FbVTvvsydz4IVW+3n9sZa0eAlsDx224a0W1jjYmDSbNwtqBkBM3RJVE2j/v8H+
	Net9X0n1LmdwKpLZv5rNwaJEk1t1ls3H3wc7GUrPlTq1B/esEsZhBJFGxECUbkUX8Q59
	51ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BoVTkpyOQqf2Xh/8AQYwrwYxDuGi6qAa83u4j97/3yI=;
	b=jrZlNIvTnV/aiLUbT3cCdK4yG81788NUkSa1sNo/Re/3ealY8P72SiUBJntogr/9AZ
	SSdtG2CoJq4P94dRCidVXwMXyWxqWtKFfF0TDqy5P2dO9h0jUkE+s0J+jY+NGj3fCLVw
	4RKy5/KmICy0yLjOxC+PaoFjbU3aJP4RnOCnqF0ys4yaCQ90AmAUpUS6hBtb2jYhdH63
	PcopkFqmvC3xsYM9uDdTWxLm3hciUaZVWwXwtakwMEbZkJH4fe6AplY9bugKYAwdhQ5h
	QFk0Z+ta+sOEIPKDTeYfWVDRiVlomEIqE3TqaGweAgasIqglh/mgQMY3+cDTtnj0v3Ni
	bAEw==
X-Gm-Message-State: AE9vXwP2H6Za2Myg/498noQhMk+w3nowK/d3XlIYQub5Rul01bMm1PorrMYasWoSWjV6KA==
X-Received: by 10.67.11.107 with SMTP id eh11mr29664557pad.89.1474402689111;
	Tue, 20 Sep 2016 13:18:09 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id z5sm110645pff.3.2016.09.20.13.18.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Sep 2016 13:18:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Sep 2016 13:17:59 -0700
Message-Id: <20160920201759.28409-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160920201759.28409-1-raj.khem@gmail.com>
References: <20160920201759.28409-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] lirc: Fix build with clang
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
X-List-Received-Date: Tue, 20 Sep 2016 20:18:09 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...crcd-Mark-local-inline-funtions-as-static.patch | 49 ++++++++++++++++++++++
 meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb    |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/0001-lircrcd-Mark-local-inline-funtions-as-static.patch

diff --git a/meta-oe/recipes-connectivity/lirc/lirc/0001-lircrcd-Mark-local-inline-funtions-as-static.patch b/meta-oe/recipes-connectivity/lirc/lirc/0001-lircrcd-Mark-local-inline-funtions-as-static.patch
new file mode 100644
index 0000000..e19d276
--- /dev/null
+++ b/meta-oe/recipes-connectivity/lirc/lirc/0001-lircrcd-Mark-local-inline-funtions-as-static.patch
@@ -0,0 +1,49 @@
+From c2be4543e4777c9e3d74b30326ba37b01917b0a9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 25 Aug 2016 03:02:37 +0000
+Subject: [PATCH] lircrcd: Mark local inline funtions as static
+
+These functions are not used anywhere outside
+this file, so they should be converted into static
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ daemons/lircrcd.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/daemons/lircrcd.c b/daemons/lircrcd.c
+index 55777cd..5ddc94d 100644
+--- a/daemons/lircrcd.c
++++ b/daemons/lircrcd.c
+@@ -153,7 +153,7 @@ char *s;
+ /* A safer write(), since sockets might not write all but only some of the
+    bytes requested */
+ 
+-inline int write_socket(int fd, char *buf, int len)
++static inline int write_socket(int fd, char *buf, int len)
+ {
+ 	int done, todo = len;
+ 
+@@ -167,7 +167,7 @@ inline int write_socket(int fd, char *buf, int len)
+ 	return (len);
+ }
+ 
+-inline int write_socket_len(int fd, char *buf)
++static inline int write_socket_len(int fd, char *buf)
+ {
+ 	int len;
+ 
+@@ -177,7 +177,7 @@ inline int write_socket_len(int fd, char *buf)
+ 	return (1);
+ }
+ 
+-inline int read_timeout(int fd, char *buf, int len, int timeout)
++static inline int read_timeout(int fd, char *buf, int len, int timeout)
+ {
+ 	fd_set fds;
+ 	struct timeval tv;
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb b/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
index 7162fcd..1726192 100644
--- a/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
+++ b/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
@@ -1,6 +1,7 @@
 require lirc.inc
 
 SRC_URI += " \
+    file://0001-lircrcd-Mark-local-inline-funtions-as-static.patch \
     file://lircd.service \
     file://lircd.init \
     file://lircexec.init \
-- 
2.9.3


