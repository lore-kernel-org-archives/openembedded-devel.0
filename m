Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 55A257847A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 23:27:02 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id t193so647859pgc.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 16:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tWvBmZlr632Z1bHtKZn2nOQEL8WzCjOp3gAoOMqEqGU=;
	b=j3m6S8l5PAKnQkkba3mQuFj1fcPJhmYTUSDbyngQu8k0Vzng5Me7XNcb78maJomS/g
	gQEwo7XMCecMd0EJZn1Zi+mi/54JJDlod1RSdpDv+653h+xCwnQIFQHLBCaE053ldI4G
	mBejkUKojafcfQV232RQaUkEbijJAmQOXFlQ3WhzypEC5wNfBJInAD/4fKWiwH7qVabf
	yaBm86070GF+laB1GhEEgyPZLq1rFcPe8Ek0Nn8sq+f0pAQpZNxcUkk4d8GfJ+cmpjEf
	NBiQK01FqeGRzCMMX+TxoeZXlEFtMTMQSnOxq0jjVhWhjg6dJ/gTJs/RUc77vzQEJjrr
	qRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tWvBmZlr632Z1bHtKZn2nOQEL8WzCjOp3gAoOMqEqGU=;
	b=pKF4V47h3nBq7EBGJBIAQgAkv3J6iQBIhY6AMOWxMrXzIZ7OyysDnKsupmCyHzp6OC
	ULFtszdkXcnCF0AhfKxngCW2NpOAfEjXApWCPYXigmZeMc2DikUlz+dLkreZDjSvj2dw
	XBCPPRklcSmd9lIDYJQ6keCOFdn+PGu+PSkqpfq8ezxYozRMXqFdApsHT5LXne54vSKV
	YdeDUTcHGt3SwWwYHr0T3XRUxxQr3oWB+BfEbW5dYVD+6R0zG6rEg1aOQRo5wAheGWhr
	xmSrG5c6iw5vXY8zVF0CKHsefT0OF+qWj8MldCK8fWEHNVpODyvd3h0EOl6tFOukCh9y
	+SiQ==
X-Gm-Message-State: AHPjjUgbTxvCelFtd/6Y8Atu7ekxG30gb2rVTY/YLT9iLcnb6qvubJmA
	NcCybhL9VW/CuNF3
X-Google-Smtp-Source: ADKCNb6mq2QKEzLu1xQVV+qnaXZBAHyunzBWuu1lGYjjPwgi9K9FTrsph/kO32i4zFiIMnr9i3g5UA==
X-Received: by 10.84.232.133 with SMTP id i5mr100443plk.239.1504222024214;
	Thu, 31 Aug 2017 16:27:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::2e06])
	by smtp.gmail.com with ESMTPSA id 16sm888569pge.33.2017.08.31.16.27.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Aug 2017 16:27:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Aug 2017 16:26:44 -0700
Message-Id: <20170831232645.6125-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170831232645.6125-1-raj.khem@gmail.com>
References: <20170831232645.6125-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH V2 3/4] netkit-rwho: Fix build with musl
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
X-List-Received-Date: Thu, 31 Aug 2017 23:27:03 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Add-missing-include-path-to-I-options.patch | 46 ++++++++++++++
 .../0002-Fix-build-issues-found-with-musl.patch    | 71 ++++++++++++++++++++++
 .../recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb |  4 +-
 3 files changed, 120 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-netkit/netkit-rwho/netkit-rwho/0001-Add-missing-include-path-to-I-options.patch
 create mode 100644 meta-networking/recipes-netkit/netkit-rwho/netkit-rwho/0002-Fix-build-issues-found-with-musl.patch

diff --git a/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho/0001-Add-missing-include-path-to-I-options.patch b/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho/0001-Add-missing-include-path-to-I-options.patch
new file mode 100644
index 000000000..b1325b317
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho/0001-Add-missing-include-path-to-I-options.patch
@@ -0,0 +1,46 @@
+From 55ab6f1389261edff5f4c942bc3b0d8e695856d7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 30 Aug 2017 18:11:33 -0700
+Subject: [PATCH 1/2] Add missing include path to -I options
+
+Fixes errors like
+| rwho.c:52:10: fatal error: 'protocols/rwhod.h' file not found
+| #include <protocols/rwhod.h>
+|          ^~~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ rwho/Makefile  | 1 +
+ rwhod/Makefile | 2 ++
+ 2 files changed, 3 insertions(+)
+
+diff --git a/rwho/Makefile b/rwho/Makefile
+index 6f86388..67b28d4 100644
+--- a/rwho/Makefile
++++ b/rwho/Makefile
+@@ -6,6 +6,7 @@ include ../MRULES
+ rwho: rwho.o
+ 	$(CC) $(LDFLAGS) $^ $(LIBS) -o $@
+ 
++CFLAGS += -I../include
+ rwho.o: ../version.h
+ 
+ install: rwho
+diff --git a/rwhod/Makefile b/rwhod/Makefile
+index 772b641..9034218 100644
+--- a/rwhod/Makefile
++++ b/rwhod/Makefile
+@@ -7,6 +7,8 @@ ifneq ($(USE_GLIBC),1)
+ CFLAGS += -D_GNU_SOURCE
+ endif
+ 
++CFLAGS += -I../include
++
+ OBJS = rwhod.o
+ 
+ rwhod: $(OBJS)
+-- 
+2.14.1
+
diff --git a/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho/0002-Fix-build-issues-found-with-musl.patch b/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho/0002-Fix-build-issues-found-with-musl.patch
new file mode 100644
index 000000000..717b4d73f
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho/0002-Fix-build-issues-found-with-musl.patch
@@ -0,0 +1,71 @@
+From 2108213242638fa355f662382f55495d91301858 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 30 Aug 2017 18:13:17 -0700
+Subject: [PATCH 2/2] Fix build issues found with musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ ruptime/ruptime.c | 1 +
+ rwho/rwho.c       | 1 +
+ rwhod/rwhod.c     | 5 +++--
+ 3 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/ruptime/ruptime.c b/ruptime/ruptime.c
+index 1d4f7b6..f1f043c 100644
+--- a/ruptime/ruptime.c
++++ b/ruptime/ruptime.c
+@@ -53,6 +53,7 @@ char ruptime_rcsid[] =
+ #include <string.h>
+ #include <errno.h>
+ #include <time.h>
++#include <fcntl.h>
+ 
+ struct hs {
+ 	char	hs_hostname[MAXHOSTNAMELEN];
+diff --git a/rwho/rwho.c b/rwho/rwho.c
+index 63919ac..71aec9e 100644
+--- a/rwho/rwho.c
++++ b/rwho/rwho.c
+@@ -49,6 +49,7 @@ char rcsid[] = "$Id: rwho.c,v 1.7 1999/08/01 20:44:18 dholland Exp $";
+ #include <assert.h>
+ #include <stdio.h>
+ #include <time.h>
++#include <fcntl.h>
+ #include <protocols/rwhod.h>
+ 
+ #include "../version.h"
+diff --git a/rwhod/rwhod.c b/rwhod/rwhod.c
+index 54498d0..40cabcf 100644
+--- a/rwhod/rwhod.c
++++ b/rwhod/rwhod.c
+@@ -76,6 +76,7 @@ char rcsid[] =
+ #include <grp.h>
+ #include <time.h>
+ #include <stdint.h>
++#include <fcntl.h>
+ 
+ #include "../version.h"
+ 
+@@ -102,7 +103,7 @@ struct	nlist nl[] = {
+ static void	broadcaster(void);
+ static int	configure(int s);
+ static int	verify(const char *name);
+-#if __GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ < 2)
++#if defined(__GLIBC__) &&  (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ < 2))
+ static int	getloadavg(double ptr[3], int n);
+ #endif
+ 
+@@ -549,7 +550,7 @@ sendpacket(struct whod *wd)
+ 	}
+ }
+ 
+-#if __GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ < 2)
++#if defined(__GLIBC__) && (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ < 2))
+ /*
+  * Taken from:
+  *
+-- 
+2.14.1
+
diff --git a/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb b/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb
index 04baa4286..5685f03d6 100644
--- a/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb
@@ -8,7 +8,9 @@ SRC_URI = "${DEBIAN_MIRROR}/main/n/netkit-rwho/netkit-rwho_${PV}.orig.tar.gz;nam
            ${DEBIAN_MIRROR}/main/n/netkit-rwho/netkit-rwho_${PV}-13.debian.tar.gz;name=patch13 \
            file://rwhod \
            file://rwhod.default \
-"
+           file://0001-Add-missing-include-path-to-I-options.patch \
+           file://0002-Fix-build-issues-found-with-musl.patch \
+           "
 SRC_URI[archive.md5sum] = "0f71620d45d472f89134ba0d74242e75"
 SRC_URI[archive.sha256sum] = "0409e2ce4bfdb2dacb2c193d0fedfc49bb975cb057c5c6b0ffcca603a1188da7"
 SRC_URI[patch13.md5sum] = "82ed5a3c6b0bbf00b36508b9787963b9"
-- 
2.14.1


