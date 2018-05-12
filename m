Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0D7417887A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 May 2018 03:08:00 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id c10-v6so3529174pfi.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 20:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=K0H8xDBwXhUvZT5aRR5fPPT3CIldPAzbhX7fUvtuAkc=;
	b=NhQNau6/OsLgqFCYR3Quh0aJFmrhK9b8mExwRuMTMHa5aMvPdyRBNJb6n+JKEa61Cx
	Z7ub/ZxbBdUe+Zpkt1c8s+znRYRV9JZcoNNBniEYMUuu/VeCEa/iZURIqfR8hEHOOFAi
	XCfF9J2dwBJQsdHjQ3sb6FBZV6z6xniOYiS9PSHjLhile2woPVy9A1+SSgyLJYMIQ5Zq
	d0sthFUt4sL7395YFoQ71TlP1cTc7RDPczGyCgLcn7/ewEx38CPTSmJ3IBipj4H99LYp
	yrSZVnYyAJCIb/cSejn7Xbhdm1Z1a+537VC/QBxaYm1PrLM6z1VX6i6h5fwaLEpMPaU5
	j4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=K0H8xDBwXhUvZT5aRR5fPPT3CIldPAzbhX7fUvtuAkc=;
	b=MPUET7G+DDAI/0E1A1/Y5YDKaU/ps7mlwfj/vzlIivk9ONzddaQolVPYQSz4AiKAlk
	NgKISxm9W+sE0Dnc91k8HLE2vCJ5rNsTSn7PQ8GfTRL+g0MM4jAGdwpFQuQGeFBPtrps
	7j4FnYIZsKyVXd7s5PnWqieUZivqI0TwwtnmUDFoMyo8eAr0Shmt/lcVqEnfgwFHcswP
	0q6N/WfBfblkM2sBlc3UAV4BFs4aPZB7IA7QxMzlqlc1XGNGT1ZnAZh8vzjooqhUsbN8
	fx6x/aPRM4VDv+fSDSdpAOgkmUdQZ5Uy5Fi5vvcDWtOZB0MmsFF+jJFZLDEvDCE1ZAYB
	nk4A==
X-Gm-Message-State: ALKqPwcsGtJkoKTHYqJrvHAR33nCcO869+meN0OT2hDPL2UeHNlxEl3+
	N9mMpdDIFxN4WorN4TNadjltKg==
X-Google-Smtp-Source: AB8JxZpLIxGMvT6j0M0gu0bgZk5WcxytTmtx9VErItxuKRvtknI6iUhS69truZIOg6wtJ++ZVN1Vyw==
X-Received: by 2002:a62:1e02:: with SMTP id
	e2-v6mr1409223pfe.212.1526094481313; 
	Fri, 11 May 2018 20:08:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	d4-v6sm6440933pgv.73.2018.05.11.20.08.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 May 2018 20:08:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 May 2018 20:07:51 -0700
Message-Id: <20180512030758.31409-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-networking][PATCH 1/8] netkit-rusers: Fix build when libc does not have nis builtin
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
X-List-Received-Date: Sat, 12 May 2018 03:08:01 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Link-with-libtirpc.patch             | 79 +++++++++++++++++++
 .../netkit-rusers/netkit-rusers_0.17.bb       |  2 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta-networking/recipes-netkit/netkit-rusers/netkit-rusers/0001-Link-with-libtirpc.patch

diff --git a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers/0001-Link-with-libtirpc.patch b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers/0001-Link-with-libtirpc.patch
new file mode 100644
index 0000000000..55926468d9
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers/0001-Link-with-libtirpc.patch
@@ -0,0 +1,79 @@
+From 5746b68ba9dda87586b3ac88fe84031cbc0015f7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 11 May 2018 12:20:03 -0700
+Subject: [PATCH] Link with libtirpc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ configure                 | 2 +-
+ rpc.rusersd/rusers_proc.c | 7 +------
+ rpc.rusersd/rusersd.c     | 6 +-----
+ rup/rup.c                 | 2 +-
+ 4 files changed, 4 insertions(+), 13 deletions(-)
+
+diff --git a/configure b/configure
+index 85f6ca6..2d2d4b7 100755
+--- a/configure
++++ b/configure
+@@ -147,7 +147,7 @@ else
+ fi
+ 
+ LDFLAGS=
+-LIBS=
++LIBS="-ltirpc"
+ 
+ rm -f __conftest*
+ 
+diff --git a/rpc.rusersd/rusers_proc.c b/rpc.rusersd/rusers_proc.c
+index 9ae6306..f9e237c 100644
+--- a/rpc.rusersd/rusers_proc.c
++++ b/rpc.rusersd/rusers_proc.c
+@@ -57,12 +57,7 @@ char rp_rcsid[] =
+ 	#define RUT_TIME ut_time
+ #endif
+ 
+-/* Glibc strikes again */
+-#ifdef __GLIBC__
+-	#include <rpcsvc/rusers.h>
+-#else
+-	#include "rusers.h"
+-#endif 
++#include "rusers.h"
+ 
+ void rusers_service(struct svc_req *rqstp, SVCXPRT *transp);
+ 
+diff --git a/rpc.rusersd/rusersd.c b/rpc.rusersd/rusersd.c
+index 762be9b..dd355ac 100644
+--- a/rpc.rusersd/rusersd.c
++++ b/rpc.rusersd/rusersd.c
+@@ -38,11 +38,7 @@ char rusersd_rcsid[] =
+ #include <rpc/pmap_clnt.h>
+ #include <unistd.h>
+ #include <grp.h>
+-#ifdef __GLIBC__
+-	#include <rpcsvc/rusers.h>
+-#else
+-	#include "rusers.h"
+-#endif
++#include "rusers.h"
+ 
+ #include "../version.h"
+ 
+diff --git a/rup/rup.c b/rup/rup.c
+index e5669ff..887f89d 100644
+--- a/rup/rup.c
++++ b/rup/rup.c
+@@ -48,7 +48,7 @@ char rcsid[] = "$Id: rup.c,v 1.8 2000/07/22 19:51:40 dholland Exp $";
+ 
+ #undef FSHIFT			/* Use protocol's shift and scale values */
+ #undef FSCALE
+-#include <rpcsvc/rstat.h>
++#include "rstat.h"
+ 
+ #include "../version.h"
+ 
+-- 
+2.17.0
+
diff --git a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
index a7d19182cf..113f89b7f5 100644
--- a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
@@ -9,6 +9,7 @@ DEPENDS = " tcp-wrappers libtirpc rpcbind"
 SRC_URI = "http://http.debian.net/debian/pool/main/n/${BPN}/${BPN}_${PV}.orig.tar.gz;name=archive \
            http://http.debian.net/debian/pool/main/n/${BPN}/${BPN}_${PV}-8.diff.gz;name=patch8 \
            file://rpc.rusersd-Makefile-fix-parallel-build-issue.patch \
+           file://0001-Link-with-libtirpc.patch \
 "
 
 SRC_URI[archive.md5sum] = "dc99a80b9fde2ab427c874f88f1c1602"
@@ -25,6 +26,7 @@ do_configure () {
     ./configure --prefix=${prefix}
     echo "LDFLAGS=${LDFLAGS}" >> MCONFIG
     echo "USE_GLIBC=1" >> MCONFIG
+    echo "LIBS=${LIBS}" >> MCONFIG
 }
 
 do_install () {
-- 
2.17.0


