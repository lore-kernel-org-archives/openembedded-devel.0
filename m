Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1986B7838D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 02:04:17 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id r133so6280991pgr.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Aug 2017 19:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=azs0En5vK8137opvx5IwGSVgVpLzAsb9416Tjcuavzk=;
	b=l9tqrGKP7aLR333WwmITmOro5zz/GNHTS43Hdau1AjDLuneu6EnycKUZ8ylRRYZQY+
	7JnMuzY/M4bN2mHOqhQ3HLuU0GRorUkSbkoQUGFznG3VAsAQjW0SWXnd4+94Ma819WXt
	aMbuiOBsaBfbdlZFXwR7dFpmlWJ03IwXQhBo2XOmFMaUt0xOXfDs7TqY+JdF9o90mEj0
	rgM2xQ9mPDrWQ9kyufBPVlAEMgJ3khCGG3h1RzejZnveDqWUHRFe5kFPx6uq/OlEX+76
	8PzyVN0wMn6uqhObjwzGnUpDsbhiy7A1W25KArSzjnxKGiaK/Sqmn2Vo4a9pRlKnv0+O
	r4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=azs0En5vK8137opvx5IwGSVgVpLzAsb9416Tjcuavzk=;
	b=Bixvzn0CAjs+mHbGyc+M3D3DdeGlks+4HvAK8PObmzE5VRuwdlWYPKom3gPO27gSMT
	EN7Zokp3zTsukdOr3cs8p5jbMovtWOMn8Q3pzrzgKQlltxAIt7V242M/hwD5nA79Qi/6
	/HRjaz0zLRQVFQ/JkQIomnZXGZr3RIrCtZj06KcO17EuUtK+MpwphgKa11S9FEOxP/De
	SSf3hYdMq4etSx5rCghyJUb/s1DHHNpYnCii3GUi9qbUk38Xe9Ir/lZ7CWbDl6+PKFe/
	JXNtpSLCGYc2+u7UjOdkjCL4T4mReSXti/eQ4fgxWMI2ttkOKT0mZPl6x4NjjCypfGui
	5Cmw==
X-Gm-Message-State: AHYfb5hqAjyJOxd5EMhmS7CJx7fWaVjya8k0aEF2tpDe3KU8Otey1WRo
	JmkWjKwQ1GU/iX/p
X-Received: by 10.99.164.26 with SMTP id c26mr628517pgf.141.1504145059207;
	Wed, 30 Aug 2017 19:04:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	c10sm12347641pfk.101.2017.08.30.19.04.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 19:04:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Aug 2017 19:04:00 -0700
Message-Id: <20170831020401.6367-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170831020401.6367-1-raj.khem@gmail.com>
References: <20170831020401.6367-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/4] netkit-rwho: Fix build with musl
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
X-List-Received-Date: Thu, 31 Aug 2017 02:04:18 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Add-missing-include-path-to-I-options.patch | 44 ++++++++++++++
 .../0002-Fix-build-issues-found-with-musl.patch    | 69 ++++++++++++++++++++++
 .../recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb |  4 +-
 3 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-netkit/netkit-rwho/netkit-rwho/0001-Add-missing-include-path-to-I-options.patch
 create mode 100644 meta-networking/recipes-netkit/netkit-rwho/netkit-rwho/0002-Fix-build-issues-found-with-musl.patch

diff --git a/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho/0001-Add-missing-include-path-to-I-options.patch b/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho/0001-Add-missing-include-path-to-I-options.patch
new file mode 100644
index 000000000..9899292b0
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho/0001-Add-missing-include-path-to-I-options.patch
@@ -0,0 +1,44 @@
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
index 000000000..e149f3468
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho/0002-Fix-build-issues-found-with-musl.patch
@@ -0,0 +1,69 @@
+From 2108213242638fa355f662382f55495d91301858 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 30 Aug 2017 18:13:17 -0700
+Subject: [PATCH 2/2] Fix build issues found with musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
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


