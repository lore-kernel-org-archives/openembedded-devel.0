Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9ECC87FD8
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:55:09 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.31489.1753869304228326273
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aBJzplC5;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753869306; x=1785405306;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vhCnE7obJ4FM+cXzxGCT/oWR18yIpPR5cRAvQhxyBCM=;
  b=aBJzplC5OAiRyuMHjWr0/1K+bI+2PiNOO7x6FtVyDjUClax1J/DI/+yg
   eexJR+ZvR4LSOpyYaqhyYCUeEegSU7CtcqaiRODS312ZbbZYjO7ez7v3w
   9mq5rLU+W3oaoeXjCt4R4+jMrtNWZGj3WrML0+ooBiFxq9eUAsWtCwVDD
   OHxGgXorrqQppXnQjVPUM49Mhs3IoBxcXXZRNzeNWYBeNZsc/pSww1vD/
   G/Ea0sqK1CSpYKgCkWKoZz5JG42elRTtvbLpM+4Wvuay20/rNQKK59v3u
   p8eZEQadFbtVvh9dz7j3wkzWDKu1TuZg9eqVzdBx2at1f9QksMIC6CZCN
   Q==;
X-CSE-ConnectionGUID: qkU78nM7RW+swiWUg/27JA==
X-CSE-MsgGUID: UJUAa2t3RB6KtbPHMjTlPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="207893417"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="207893417"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:55:05 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 1C2FE1002B8F
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:04 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id EAC5183D96A
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 067C21A0074;
	Wed, 30 Jul 2025 17:54:59 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/40] atop: upgrade 2.11.0 -> 2.12.0
Date: Wed, 30 Jul 2025 17:54:19 +0800
Message-ID: <20250730095456.695-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730095456.695-1-wangmy@fujitsu.com>
References: <20250730095456.695-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118769

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Redefine-function-prototypes-solves-issue-322.patch
removed since it's included in 2.12.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...function-prototypes-solves-issue-322.patch | 1154 -----------------
 .../atop/atop/fix-permissions.patch           |   12 +-
 .../atop/{atop_2.11.0.bb => atop_2.12.0.bb}   |    3 +-
 3 files changed, 7 insertions(+), 1162 deletions(-)
 delete mode 100644 meta-oe/recipes-support/atop/atop/0001-Redefine-function-prototypes-solves-issue-322.patch
 rename meta-oe/recipes-support/atop/{atop_2.11.0.bb => atop_2.12.0.bb} (94%)

diff --git a/meta-oe/recipes-support/atop/atop/0001-Redefine-function-prototypes-solves-issue-322.patch b/meta-oe/recipes-support/atop/atop/0001-Redefine-function-prototypes-solves-issue-322.patch
deleted file mode 100644
index f55ad5318a..0000000000
--- a/meta-oe/recipes-support/atop/atop/0001-Redefine-function-prototypes-solves-issue-322.patch
+++ /dev/null
@@ -1,1154 +0,0 @@
-From ece93ebc7b9ebbb73f92b2238a87b78ddbd4ca98 Mon Sep 17 00:00:00 2001
-From: Gerlof Langeveld <gerlof.langeveld@atoptool.nl>
-Date: Fri, 14 Mar 2025 15:39:30 +0100
-Subject: [PATCH] Redefine function prototypes (solves issue #322)
-
-Certain function prototypes did not explicitly define the
-calling argument types, specifically the prototypes for the
-convert functions defined in the 'detail_printdef' structure.
-These incomplete definitions cause a lot of errors when using
-gcc 1.15 which is based on C23.
-
-Upstream-Status: Backport [ece93eb Redefine function prototypes (solves issue #322)]
----
- atop.c        |   5 ++
- atopacctd.c   |   5 ++
- atopcat.c     |   6 ++
- atopconvert.c |   1 +
- atophide.c    |   5 ++
- atopsar.c     |   4 ++
- cgroups.c     |   7 +-
- drawbar.c     |   4 ++
- gpucom.c      |   4 ++
- netatopif.c   |   4 ++
- photoproc.c   |   4 ++
- photosyst.c   |   5 ++
- rawlog.c      |   4 ++
- showgeneric.c |   4 ++
- showlinux.h   |  11 ++-
- showprocs.c   | 188 +++++++++++++++++++++++++-------------------------
- various.c     |   4 ++
- 17 files changed, 168 insertions(+), 97 deletions(-)
-
-diff --git a/atop.c b/atop.c
-index fe037fc..ac6aa6d 100644
---- a/atop.c
-+++ b/atop.c
-@@ -118,6 +118,10 @@
- ** can be linked with 'atop'; the one to use can eventually be chosen
- ** at runtime. 
- */
-+#define _POSIX_C_SOURCE	
-+#define _XOPEN_SOURCE
-+#define _GNU_SOURCE
-+#define _DEFAULT_SOURCE
- 
- #include <sys/types.h>
- #include <sys/param.h>
-@@ -128,6 +132,7 @@
- #include <errno.h>
- #include <fcntl.h>
- #include <unistd.h>
-+#include <getopt.h>
- #include <stdlib.h>
- #include <signal.h>
- #include <sys/utsname.h>
-diff --git a/atopacctd.c b/atopacctd.c
-index b16d6a6..c8816b6 100644
---- a/atopacctd.c
-+++ b/atopacctd.c
-@@ -36,6 +36,11 @@
- ** it under the terms of the GNU General Public License version 2 as
- ** published by the Free Software Foundation.
- */
-+#define _POSIX_C_SOURCE
-+#define _XOPEN_SOURCE
-+#define _GNU_SOURCE
-+#define _DEFAULT_SOURCE
-+
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <stdio.h>
-diff --git a/atopcat.c b/atopcat.c
-index fb014a0..099a888 100644
---- a/atopcat.c
-+++ b/atopcat.c
-@@ -28,9 +28,15 @@
- ** Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- ** --------------------------------------------------------------------------
- */
-+#define _POSIX_C_SOURCE
-+#define _XOPEN_SOURCE
-+#define _GNU_SOURCE
-+#define _DEFAULT_SOURCE
-+
- #include <sys/types.h>
- #include <sys/param.h>
- #include <sys/stat.h>
-+#include <getopt.h>
- #include <fcntl.h>
- #include <time.h>
- #include <stdio.h>
-diff --git a/atopconvert.c b/atopconvert.c
-index fd34a85..9c083a6 100644
---- a/atopconvert.c
-+++ b/atopconvert.c
-@@ -32,6 +32,7 @@
- #include <sys/param.h>
- #include <sys/mman.h>
- #include <sys/stat.h>
-+#include <getopt.h>
- #include <time.h>
- #include <stdio.h>
- #include <errno.h>
-diff --git a/atophide.c b/atophide.c
-index 0502262..313929e 100644
---- a/atophide.c
-+++ b/atophide.c
-@@ -31,6 +31,11 @@
- ** Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- ** --------------------------------------------------------------------------
- */
-+#define _POSIX_C_SOURCE
-+#define _XOPEN_SOURCE
-+#define _GNU_SOURCE
-+#define _DEFAULT_SOURCE
-+
- #include <sys/types.h>
- #include <sys/param.h>
- #include <sys/mman.h>
-diff --git a/atopsar.c b/atopsar.c
-index a3dd121..1cf13e8 100644
---- a/atopsar.c
-+++ b/atopsar.c
-@@ -28,6 +28,10 @@
- ** Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- ** --------------------------------------------------------------------------
- */
-+#define _POSIX_C_SOURCE
-+#define _XOPEN_SOURCE
-+#define _GNU_SOURCE
-+#define _DEFAULT_SOURCE
- 
- #include <sys/types.h>
- #include <sys/param.h>
-diff --git a/cgroups.c b/cgroups.c
-index d617b48..4f1247c 100644
---- a/cgroups.c
-+++ b/cgroups.c
-@@ -27,6 +27,10 @@
- ** Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- ** --------------------------------------------------------------------------
- */
-+#define _POSIX_C_SOURCE
-+#define _XOPEN_SOURCE
-+#define _GNU_SOURCE
-+#define _DEFAULT_SOURCE
- 
- #include <sys/types.h>
- #include <sys/param.h>
-@@ -1189,7 +1193,8 @@ mergecgrouplist(struct cglinesel **cgroupselp, int newdepth,
- 	//
- 	cgroupsel = malloc(sizeof(struct cglinesel) * (ncgroups+nprocs));
- 
--	ptrverify(cgroupsel, "Malloc for cglinesel structs failed (%d)\n",
-+	if (cgroupsel == NULL)
-+		ptrverify(cgroupsel, "Malloc for cglinesel structs failed (%d)\n",
- 					ncgroups + nprocs);
- 
- 	*cgroupselp = cgroupsel;
-diff --git a/drawbar.c b/drawbar.c
-index 0ab3b40..c8539bf 100644
---- a/drawbar.c
-+++ b/drawbar.c
-@@ -103,6 +103,10 @@
- // horizontally scaled by the user, atop might switch from one model to
- // the other.
- /////////////////////////////////////////////////////////////////////////////
-+#define _POSIX_C_SOURCE
-+#define _XOPEN_SOURCE
-+#define _GNU_SOURCE
-+#define _DEFAULT_SOURCE
- 
- #include <sys/types.h>
- #include <curses.h>
-diff --git a/gpucom.c b/gpucom.c
-index 1ff3818..25e7637 100644
---- a/gpucom.c
-+++ b/gpucom.c
-@@ -22,6 +22,10 @@
- ** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- ** See the GNU General Public License for more details.
- */
-+#define _POSIX_C_SOURCE
-+#define _XOPEN_SOURCE
-+#define _GNU_SOURCE
-+#define _DEFAULT_SOURCE
- 
- #include <sys/types.h>
- #include <sys/socket.h>
-diff --git a/netatopif.c b/netatopif.c
-index ea67142..d0e9c29 100644
---- a/netatopif.c
-+++ b/netatopif.c
-@@ -22,6 +22,10 @@
- ** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- ** See the GNU General Public License for more details.
- */
-+#define _POSIX_C_SOURCE
-+#define _XOPEN_SOURCE
-+#define _GNU_SOURCE
-+#define _DEFAULT_SOURCE
- 
- #include <sys/types.h>
- #include <stdio.h>
-diff --git a/photoproc.c b/photoproc.c
-index 234007b..2b8de20 100644
---- a/photoproc.c
-+++ b/photoproc.c
-@@ -30,6 +30,10 @@
- ** Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- ** --------------------------------------------------------------------------
- */
-+#define _POSIX_C_SOURCE
-+#define _XOPEN_SOURCE
-+#define _GNU_SOURCE
-+#define _DEFAULT_SOURCE
- 
- #include <sys/types.h>
- #include <sys/param.h>
-diff --git a/photosyst.c b/photosyst.c
-index 46fccd8..9012946 100644
---- a/photosyst.c
-+++ b/photosyst.c
-@@ -29,6 +29,11 @@
- ** Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- ** --------------------------------------------------------------------------
- */
-+#define _POSIX_C_SOURCE
-+#define _XOPEN_SOURCE
-+#define _GNU_SOURCE
-+#define _DEFAULT_SOURCE
-+
- #include <sys/types.h>
- #include <stdio.h>
- #include <string.h>
-diff --git a/rawlog.c b/rawlog.c
-index f46430d..541b75c 100644
---- a/rawlog.c
-+++ b/rawlog.c
-@@ -26,6 +26,10 @@
- ** Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- ** --------------------------------------------------------------------------
- */
-+#define _POSIX_C_SOURCE
-+#define _XOPEN_SOURCE
-+#define _GNU_SOURCE
-+#define _DEFAULT_SOURCE
- 
- #include <sys/types.h>
- #include <sys/param.h>
-diff --git a/showgeneric.c b/showgeneric.c
-index 0722a64..a472501 100644
---- a/showgeneric.c
-+++ b/showgeneric.c
-@@ -29,6 +29,10 @@
- ** Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- ** --------------------------------------------------------------------------
- */
-+#define _POSIX_C_SOURCE
-+#define _XOPEN_SOURCE
-+#define _GNU_SOURCE
-+#define _DEFAULT_SOURCE
- 
- #include <sys/types.h>
- #include <sys/param.h>
-diff --git a/showlinux.h b/showlinux.h
-index e082c72..72c57b9 100644
---- a/showlinux.h
-+++ b/showlinux.h
-@@ -102,9 +102,16 @@ typedef struct
- {
-         char *head;                      // column header
-         char *configname;                // name as used to config print line
--        char *(*doactiveconvert)();      // pointer to conv function
-+
-+	union {
-+        	char *(*doactiveconverts)(struct tstat *, int, int);
-+        	char *(*doactiveconvertc)(struct cgchainer *, struct tstat *,
-+                			int, int, count_t, int, int *);
-+	} ac;
-+   			                 // pointer to conv function
-                                          // for active process
--        char *(*doexitconvert)();        // pointer to conv function
-+	char *(*doexitconvert)(struct tstat *, int, int);        
-+			                 // pointer to conv function
-                                          // for exited process
- 	char sortcrit;                   // sort criterion similar to showorder
-         int  width;                      // required width
-diff --git a/showprocs.c b/showprocs.c
-index 0db1e31..020cc85 100644
---- a/showprocs.c
-+++ b/showprocs.c
-@@ -510,7 +510,7 @@ showprocline(detail_printpair* elemptr, struct tstat *curstat,
-                 }
-                 else if (curstat->gen.state != 'E')  // active process
-                 {
--                        printg("%s", curelem.pf->doactiveconvert(curstat, 
-+                        printg("%s", curelem.pf->ac.doactiveconverts(curstat, 
-                                                         avgval, nsecs));
-                 }
-                 else                                 // exited process
-@@ -622,7 +622,7 @@ procprt_TID_ae(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_TID = 
--   { "TID", "TID", procprt_TID_ae, procprt_TID_ae, ' ', 5}; //DYNAMIC WIDTH!
-+   { "TID", "TID", .ac.doactiveconverts = procprt_TID_ae, procprt_TID_ae, ' ', 5}; //DYNAMIC WIDTH!
- /***************************************************************/
- char *
- procprt_PID_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -646,7 +646,7 @@ procprt_PID_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_PID = 
--   { "PID", "PID", procprt_PID_a, procprt_PID_e, ' ', 5}; //DYNAMIC WIDTH!
-+   { "PID", "PID", .ac.doactiveconverts = procprt_PID_a, procprt_PID_e, ' ', 5}; //DYNAMIC WIDTH!
- /***************************************************************/
- char *
- procprt_PPID_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -670,7 +670,7 @@ procprt_PPID_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_PPID = 
--   { "PPID", "PPID", procprt_PPID_a, procprt_PPID_e, ' ', 5}; //DYNAMIC WIDTH!
-+   { "PPID", "PPID", .ac.doactiveconverts = procprt_PPID_a, procprt_PPID_e, ' ', 5}; //DYNAMIC WIDTH!
- /***************************************************************/
- char *
- procprt_VPID_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -691,7 +691,7 @@ procprt_VPID_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_VPID = 
--   { "VPID", "VPID", procprt_VPID_a, procprt_VPID_e, ' ', 5}; //DYNAMIC WIDTH!
-+   { "VPID", "VPID", .ac.doactiveconverts = procprt_VPID_a, procprt_VPID_e, ' ', 5}; //DYNAMIC WIDTH!
- /***************************************************************/
- char *
- procprt_CTID_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -709,7 +709,7 @@ procprt_CTID_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_CTID = 
--   { " CTID", "CTID", procprt_CTID_a, procprt_CTID_e, ' ', 5};
-+   { " CTID", "CTID", .ac.doactiveconverts = procprt_CTID_a, procprt_CTID_e, ' ', 5};
- /***************************************************************/
- char *
- procprt_CID_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -738,7 +738,7 @@ procprt_CID_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_CID = 
--   { "CID/POD        ", "CID", procprt_CID_a, procprt_CID_e, ' ', 15};
-+   { "CID/POD        ", "CID", .ac.doactiveconverts = procprt_CID_a, procprt_CID_e, ' ', 15};
- /***************************************************************/
- char *
- procprt_SYSCPU_ae(struct tstat *curstat, int avgval, int nsecs)
-@@ -750,7 +750,7 @@ procprt_SYSCPU_ae(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_SYSCPU = 
--   { "SYSCPU", "SYSCPU", procprt_SYSCPU_ae, procprt_SYSCPU_ae, ' ', 6};
-+   { "SYSCPU", "SYSCPU", .ac.doactiveconverts = procprt_SYSCPU_ae, procprt_SYSCPU_ae, ' ', 6};
- /***************************************************************/
- char *
- procprt_USRCPU_ae(struct tstat *curstat, int avgval, int nsecs)
-@@ -762,7 +762,7 @@ procprt_USRCPU_ae(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_USRCPU = 
--   { "USRCPU", "USRCPU", procprt_USRCPU_ae, procprt_USRCPU_ae, ' ', 6};
-+   { "USRCPU", "USRCPU", .ac.doactiveconverts = procprt_USRCPU_ae, procprt_USRCPU_ae, ' ', 6};
- /***************************************************************/
- char *
- procprt_VGROW_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -780,7 +780,7 @@ procprt_VGROW_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_VGROW = 
--   { " VGROW", "VGROW", procprt_VGROW_a, procprt_VGROW_e, ' ', 6};
-+   { " VGROW", "VGROW", .ac.doactiveconverts = procprt_VGROW_a, procprt_VGROW_e, ' ', 6};
- /***************************************************************/
- char *
- procprt_RGROW_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -798,7 +798,7 @@ procprt_RGROW_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_RGROW = 
--   { " RGROW", "RGROW", procprt_RGROW_a, procprt_RGROW_e, ' ', 6};
-+   { " RGROW", "RGROW", .ac.doactiveconverts = procprt_RGROW_a, procprt_RGROW_e, ' ', 6};
- /***************************************************************/
- char *
- procprt_MINFLT_ae(struct tstat *curstat, int avgval, int nsecs)
-@@ -810,7 +810,7 @@ procprt_MINFLT_ae(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_MINFLT = 
--   { "MINFLT", "MINFLT", procprt_MINFLT_ae, procprt_MINFLT_ae, ' ', 6};
-+   { "MINFLT", "MINFLT", .ac.doactiveconverts = procprt_MINFLT_ae, procprt_MINFLT_ae, ' ', 6};
- /***************************************************************/
- char *
- procprt_MAJFLT_ae(struct tstat *curstat, int avgval, int nsecs)
-@@ -822,7 +822,7 @@ procprt_MAJFLT_ae(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_MAJFLT = 
--   { "MAJFLT", "MAJFLT", procprt_MAJFLT_ae, procprt_MAJFLT_ae, ' ', 6};
-+   { "MAJFLT", "MAJFLT", .ac.doactiveconverts = procprt_MAJFLT_ae, procprt_MAJFLT_ae, ' ', 6};
- /***************************************************************/
- char *
- procprt_VSTEXT_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -840,7 +840,7 @@ procprt_VSTEXT_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_VSTEXT = 
--   { "VSTEXT", "VSTEXT", procprt_VSTEXT_a, procprt_VSTEXT_e, ' ', 6};
-+   { "VSTEXT", "VSTEXT", .ac.doactiveconverts = procprt_VSTEXT_a, procprt_VSTEXT_e, ' ', 6};
- /***************************************************************/
- char *
- procprt_VSIZE_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -858,7 +858,7 @@ procprt_VSIZE_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_VSIZE = 
--   { " VSIZE", "VSIZE", procprt_VSIZE_a, procprt_VSIZE_e, ' ', 6};
-+   { " VSIZE", "VSIZE", .ac.doactiveconverts = procprt_VSIZE_a, procprt_VSIZE_e, ' ', 6};
- /***************************************************************/
- char *
- procprt_RSIZE_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -876,7 +876,7 @@ procprt_RSIZE_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_RSIZE = 
--   { " RSIZE", "RSIZE", procprt_RSIZE_a, procprt_RSIZE_e, ' ', 6};
-+   { " RSIZE", "RSIZE", .ac.doactiveconverts = procprt_RSIZE_a, procprt_RSIZE_e, ' ', 6};
- /***************************************************************/
- char *
- procprt_PSIZE_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -897,7 +897,7 @@ procprt_PSIZE_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_PSIZE = 
--   { " PSIZE", "PSIZE", procprt_PSIZE_a, procprt_PSIZE_e, ' ', 6};
-+   { " PSIZE", "PSIZE", .ac.doactiveconverts = procprt_PSIZE_a, procprt_PSIZE_e, ' ', 6};
- /***************************************************************/
- char *
- procprt_VSLIBS_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -915,7 +915,7 @@ procprt_VSLIBS_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_VSLIBS = 
--   { "VSLIBS", "VSLIBS", procprt_VSLIBS_a, procprt_VSLIBS_e, ' ', 6};
-+   { "VSLIBS", "VSLIBS", .ac.doactiveconverts = procprt_VSLIBS_a, procprt_VSLIBS_e, ' ', 6};
- /***************************************************************/
- char *
- procprt_VDATA_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -933,7 +933,7 @@ procprt_VDATA_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_VDATA = 
--   { " VDATA", "VDATA", procprt_VDATA_a, procprt_VDATA_e, ' ', 6};
-+   { " VDATA", "VDATA", .ac.doactiveconverts = procprt_VDATA_a, procprt_VDATA_e, ' ', 6};
- /***************************************************************/
- char *
- procprt_VSTACK_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -951,7 +951,7 @@ procprt_VSTACK_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_VSTACK = 
--   { "VSTACK", "VSTACK", procprt_VSTACK_a, procprt_VSTACK_e, ' ', 6};
-+   { "VSTACK", "VSTACK", .ac.doactiveconverts = procprt_VSTACK_a, procprt_VSTACK_e, ' ', 6};
- /***************************************************************/
- char *
- procprt_SWAPSZ_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -969,7 +969,7 @@ procprt_SWAPSZ_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_SWAPSZ = 
--   { "SWAPSZ", "SWAPSZ", procprt_SWAPSZ_a, procprt_SWAPSZ_e, ' ', 6};
-+   { "SWAPSZ", "SWAPSZ", .ac.doactiveconverts = procprt_SWAPSZ_a, procprt_SWAPSZ_e, ' ', 6};
- /***************************************************************/
- char *
- procprt_LOCKSZ_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -987,7 +987,7 @@ procprt_LOCKSZ_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_LOCKSZ = 
--   { "LOCKSZ", "LOCKSZ", procprt_LOCKSZ_a, procprt_LOCKSZ_e, ' ', 6};
-+   { "LOCKSZ", "LOCKSZ", .ac.doactiveconverts = procprt_LOCKSZ_a, procprt_LOCKSZ_e, ' ', 6};
- /***************************************************************/
- char *
- procprt_CMD_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1010,7 +1010,7 @@ procprt_CMD_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_CMD = 
--   { "CMD           ", "CMD", procprt_CMD_a, procprt_CMD_e, ' ', 14};
-+   { "CMD           ", "CMD", .ac.doactiveconverts = procprt_CMD_a, procprt_CMD_e, ' ', 14};
- /***************************************************************/
- char *
- procprt_RUID_ae(struct tstat *curstat, int avgval, int nsecs)
-@@ -1023,7 +1023,7 @@ procprt_RUID_ae(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_RUID = 
--   { "RUID    ", "RUID", procprt_RUID_ae, procprt_RUID_ae, ' ', 8};
-+   { "RUID    ", "RUID", .ac.doactiveconverts = procprt_RUID_ae, procprt_RUID_ae, ' ', 8};
- /***************************************************************/
- char *
- procprt_EUID_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1042,7 +1042,7 @@ procprt_EUID_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_EUID = 
--   { "EUID    ", "EUID", procprt_EUID_a, procprt_EUID_e, ' ', 8};
-+   { "EUID    ", "EUID", .ac.doactiveconverts = procprt_EUID_a, procprt_EUID_e, ' ', 8};
- /***************************************************************/
- char *
- procprt_SUID_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1061,7 +1061,7 @@ procprt_SUID_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_SUID = 
--   { "SUID    ", "SUID", procprt_SUID_a, procprt_SUID_e, ' ', 8};
-+   { "SUID    ", "SUID", .ac.doactiveconverts = procprt_SUID_a, procprt_SUID_e, ' ', 8};
- /***************************************************************/
- char *
- procprt_FSUID_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1080,7 +1080,7 @@ procprt_FSUID_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_FSUID = 
--   { "FSUID   ", "FSUID", procprt_FSUID_a, procprt_FSUID_e, ' ', 8};
-+   { "FSUID   ", "FSUID", .ac.doactiveconverts = procprt_FSUID_a, procprt_FSUID_e, ' ', 8};
- /***************************************************************/
- char *
- procprt_RGID_ae(struct tstat *curstat, int avgval, int nsecs)
-@@ -1093,7 +1093,7 @@ procprt_RGID_ae(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_RGID = 
--   { "RGID    ", "RGID", procprt_RGID_ae, procprt_RGID_ae, ' ', 8};
-+   { "RGID    ", "RGID", .ac.doactiveconverts = procprt_RGID_ae, procprt_RGID_ae, ' ', 8};
- /***************************************************************/
- char *
- procprt_EGID_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1112,7 +1112,7 @@ procprt_EGID_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_EGID = 
--   { "EGID    ", "EGID", procprt_EGID_a, procprt_EGID_e, ' ', 8};
-+   { "EGID    ", "EGID", .ac.doactiveconverts = procprt_EGID_a, procprt_EGID_e, ' ', 8};
- /***************************************************************/
- char *
- procprt_SGID_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1131,7 +1131,7 @@ procprt_SGID_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_SGID = 
--   { "SGID    ", "SGID", procprt_SGID_a, procprt_SGID_e, ' ', 8};
-+   { "SGID    ", "SGID", .ac.doactiveconverts = procprt_SGID_a, procprt_SGID_e, ' ', 8};
- /***************************************************************/
- char *
- procprt_FSGID_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1150,7 +1150,7 @@ procprt_FSGID_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_FSGID = 
--   { "FSGID   ", "FSGID", procprt_FSGID_a, procprt_FSGID_e, ' ', 8};
-+   { "FSGID   ", "FSGID", .ac.doactiveconverts = procprt_FSGID_a, procprt_FSGID_e, ' ', 8};
- /***************************************************************/
- char *
- procprt_STDATE_ae(struct tstat *curstat, int avgval, int nsecs)
-@@ -1162,7 +1162,7 @@ procprt_STDATE_ae(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_STDATE = 
--   { "  STDATE  ", "STDATE", procprt_STDATE_ae, procprt_STDATE_ae, ' ', 10};
-+   { "  STDATE  ", "STDATE", .ac.doactiveconverts = procprt_STDATE_ae, procprt_STDATE_ae, ' ', 10};
- /***************************************************************/
- char *
- procprt_STTIME_ae(struct tstat *curstat, int avgval, int nsecs)
-@@ -1174,7 +1174,7 @@ procprt_STTIME_ae(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_STTIME = 
--   { " STTIME ", "STTIME", procprt_STTIME_ae, procprt_STTIME_ae, ' ', 8};
-+   { " STTIME ", "STTIME", .ac.doactiveconverts = procprt_STTIME_ae, procprt_STTIME_ae, ' ', 8};
- /***************************************************************/
- char *
- procprt_ENDATE_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1197,7 +1197,7 @@ procprt_ENDATE_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_ENDATE = 
--   { "  ENDATE  ", "ENDATE", procprt_ENDATE_a, procprt_ENDATE_e, ' ', 10};
-+   { "  ENDATE  ", "ENDATE", .ac.doactiveconverts = procprt_ENDATE_a, procprt_ENDATE_e, ' ', 10};
- /***************************************************************/
- char *
- procprt_ENTIME_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1220,7 +1220,7 @@ procprt_ENTIME_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_ENTIME = 
--   { " ENTIME ", "ENTIME", procprt_ENTIME_a, procprt_ENTIME_e, ' ', 8};
-+   { " ENTIME ", "ENTIME", .ac.doactiveconverts = procprt_ENTIME_a, procprt_ENTIME_e, ' ', 8};
- /***************************************************************/
- char *
- procprt_THR_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1238,7 +1238,7 @@ procprt_THR_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_THR = 
--   { " THR", "THR", procprt_THR_a, procprt_THR_e, ' ', 4};
-+   { " THR", "THR", .ac.doactiveconverts = procprt_THR_a, procprt_THR_e, ' ', 4};
- /***************************************************************/
- char *
- procprt_TRUN_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1256,7 +1256,7 @@ procprt_TRUN_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_TRUN = 
--   { "TRUN", "TRUN", procprt_TRUN_a, procprt_TRUN_e, ' ', 4};
-+   { "TRUN", "TRUN", .ac.doactiveconverts = procprt_TRUN_a, procprt_TRUN_e, ' ', 4};
- /***************************************************************/
- char *
- procprt_TSLPI_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1274,7 +1274,7 @@ procprt_TSLPI_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_TSLPI = 
--   { "TSLPI", "TSLPI", procprt_TSLPI_a, procprt_TSLPI_e, ' ', 5};
-+   { "TSLPI", "TSLPI", .ac.doactiveconverts = procprt_TSLPI_a, procprt_TSLPI_e, ' ', 5};
- /***************************************************************/
- char *
- procprt_TSLPU_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1292,7 +1292,7 @@ procprt_TSLPU_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_TSLPU = 
--   { "TSLPU", "TSLPU", procprt_TSLPU_a, procprt_TSLPU_e, ' ', 5};
-+   { "TSLPU", "TSLPU", .ac.doactiveconverts = procprt_TSLPU_a, procprt_TSLPU_e, ' ', 5};
- /***************************************************************/
- char *
- procprt_TIDLE_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1310,7 +1310,7 @@ procprt_TIDLE_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_TIDLE = 
--   { "TIDLE", "TIDLE", procprt_TIDLE_a, procprt_TIDLE_e, ' ', 5};
-+   { "TIDLE", "TIDLE", .ac.doactiveconverts = procprt_TIDLE_a, procprt_TIDLE_e, ' ', 5};
- /***************************************************************/
- #define SCHED_NORMAL	0
- #define SCHED_FIFO	1
-@@ -1357,7 +1357,7 @@ procprt_POLI_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_POLI = 
--   { "POLI", "POLI", procprt_POLI_a, procprt_POLI_e, ' ', 4};
-+   { "POLI", "POLI", .ac.doactiveconverts = procprt_POLI_a, procprt_POLI_e, ' ', 4};
- /***************************************************************/
- char *
- procprt_NICE_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1375,7 +1375,7 @@ procprt_NICE_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_NICE = 
--   { "NICE", "NICE", procprt_NICE_a, procprt_NICE_e, ' ', 4};
-+   { "NICE", "NICE", .ac.doactiveconverts = procprt_NICE_a, procprt_NICE_e, ' ', 4};
- /***************************************************************/
- char *
- procprt_PRI_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1393,7 +1393,7 @@ procprt_PRI_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_PRI = 
--   { "PRI", "PRI", procprt_PRI_a, procprt_PRI_e, ' ', 3};
-+   { "PRI", "PRI", .ac.doactiveconverts = procprt_PRI_a, procprt_PRI_e, ' ', 3};
- /***************************************************************/
- char *
- procprt_RTPR_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1411,7 +1411,7 @@ procprt_RTPR_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_RTPR = 
--   { "RTPR", "RTPR", procprt_RTPR_a, procprt_RTPR_e, ' ', 4};
-+   { "RTPR", "RTPR", .ac.doactiveconverts = procprt_RTPR_a, procprt_RTPR_e, ' ', 4};
- /***************************************************************/
- char *
- procprt_CURCPU_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1429,7 +1429,7 @@ procprt_CURCPU_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_CURCPU = 
--   { "CPUNR", "CPUNR", procprt_CURCPU_a, procprt_CURCPU_e, ' ', 5};
-+   { "CPUNR", "CPUNR", .ac.doactiveconverts = procprt_CURCPU_a, procprt_CURCPU_e, ' ', 5};
- /***************************************************************/
- char *
- procprt_ST_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1473,7 +1473,7 @@ procprt_ST_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_ST = 
--   { "ST", "ST", procprt_ST_a, procprt_ST_e, ' ', 2};
-+   { "ST", "ST", .ac.doactiveconverts = procprt_ST_a, procprt_ST_e, ' ', 2};
- /***************************************************************/
- char *
- procprt_EXC_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1496,7 +1496,7 @@ procprt_EXC_e(struct tstat *curstat, int avgval, int nsecs)
- 
- 
- detail_printdef procprt_EXC = 
--   { "EXC", "EXC", procprt_EXC_a, procprt_EXC_e, ' ', 3};
-+   { "EXC", "EXC", .ac.doactiveconverts = procprt_EXC_a, procprt_EXC_e, ' ', 3};
- /***************************************************************/
- char *
- procprt_S_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1515,7 +1515,7 @@ procprt_S_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_S = 
--   { "S", "S", procprt_S_a, procprt_S_e, ' ', 1};
-+   { "S", "S", .ac.doactiveconverts = procprt_S_a, procprt_S_e, ' ', 1};
- 
- /***************************************************************/
- char *
-@@ -1546,7 +1546,7 @@ procprt_COMMAND_LINE_ae(struct tstat *curstat, int avgval, int nsecs)
- detail_printdef procprt_COMMAND_LINE = 
-        { "COMMAND-LINE (horizontal scroll with <- and -> keys)",
- 	"COMMAND-LINE", 
--        procprt_COMMAND_LINE_ae, procprt_COMMAND_LINE_ae, ' ', 0, 1};
-+        .ac.doactiveconverts = procprt_COMMAND_LINE_ae, procprt_COMMAND_LINE_ae, ' ', 0, 1};
- /***************************************************************/
- char *
- procprt_NPROCS_ae(struct tstat *curstat, int avgval, int nsecs)
-@@ -1558,7 +1558,7 @@ procprt_NPROCS_ae(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_NPROCS = 
--   { "NPROCS", "NPROCS", procprt_NPROCS_ae, procprt_NPROCS_ae, ' ', 6};
-+   { "NPROCS", "NPROCS", .ac.doactiveconverts = procprt_NPROCS_ae, procprt_NPROCS_ae, ' ', 6};
- /***************************************************************/
- char *
- procprt_RDDSK_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1580,7 +1580,7 @@ procprt_RDDSK_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_RDDSK = 
--   { " RDDSK", "RDDSK", procprt_RDDSK_a, procprt_RDDSK_e, ' ', 6};
-+   { " RDDSK", "RDDSK", .ac.doactiveconverts = procprt_RDDSK_a, procprt_RDDSK_e, ' ', 6};
- /***************************************************************/
- char *
- procprt_WRDSK_a(struct tstat *curstat, int avgval, int nsecs) 
-@@ -1602,7 +1602,7 @@ procprt_WRDSK_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_WRDSK = 
--   { " WRDSK", "WRDSK", procprt_WRDSK_a, procprt_WRDSK_e, ' ', 6};
-+   { " WRDSK", "WRDSK", .ac.doactiveconverts = procprt_WRDSK_a, procprt_WRDSK_e, ' ', 6};
- /***************************************************************/
- char *
- procprt_CWRDSK_a(struct tstat *curstat, int avgval, int nsecs) 
-@@ -1621,7 +1621,7 @@ procprt_CWRDSK_a(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_CWRDSK = 
--   {" WRDSK", "CWRDSK", procprt_CWRDSK_a, procprt_WRDSK_e, ' ', 6};
-+   {" WRDSK", "CWRDSK", .ac.doactiveconverts = procprt_CWRDSK_a, procprt_WRDSK_e, ' ', 6};
- /***************************************************************/
- char *
- procprt_WCANCEL_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1643,7 +1643,7 @@ procprt_WCANCEL_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_WCANCEL = 
--   {"WCANCL", "WCANCL", procprt_WCANCEL_a, procprt_WCANCEL_e, ' ', 6};
-+   {"WCANCL", "WCANCL", .ac.doactiveconverts = procprt_WCANCEL_a, procprt_WCANCEL_e, ' ', 6};
- /***************************************************************/
- char *
- procprt_TCPRCV_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1672,7 +1672,7 @@ procprt_TCPRCV_e(struct tstat *curstat, int avgval, int nsecs)
- 
- 
- detail_printdef procprt_TCPRCV = 
--   { "TCPRCV", "TCPRCV", procprt_TCPRCV_a, procprt_TCPRCV_e, ' ', 6};
-+   { "TCPRCV", "TCPRCV", .ac.doactiveconverts = procprt_TCPRCV_a, procprt_TCPRCV_e, ' ', 6};
- /***************************************************************/
- char *
- procprt_TCPRASZ_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1704,7 +1704,7 @@ procprt_TCPRASZ_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_TCPRASZ = 
--   { "TCPRASZ", "TCPRASZ", procprt_TCPRASZ_a, procprt_TCPRASZ_e, ' ', 7};
-+   { "TCPRASZ", "TCPRASZ", .ac.doactiveconverts = procprt_TCPRASZ_a, procprt_TCPRASZ_e, ' ', 7};
- /***************************************************************/
- char *
- procprt_TCPSND_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1732,7 +1732,7 @@ procprt_TCPSND_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_TCPSND = 
--   { "TCPSND", "TCPSND", procprt_TCPSND_a, procprt_TCPSND_e, ' ', 6};
-+   { "TCPSND", "TCPSND", .ac.doactiveconverts = procprt_TCPSND_a, procprt_TCPSND_e, ' ', 6};
- /***************************************************************/
- char *
- procprt_TCPSASZ_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1764,7 +1764,7 @@ procprt_TCPSASZ_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_TCPSASZ = 
--   { "TCPSASZ", "TCPSASZ", procprt_TCPSASZ_a, procprt_TCPSASZ_e, ' ', 7};
-+   { "TCPSASZ", "TCPSASZ", .ac.doactiveconverts = procprt_TCPSASZ_a, procprt_TCPSASZ_e, ' ', 7};
- /***************************************************************/
- char *
- procprt_UDPRCV_a(struct tstat *curstat, int avgval, int nsecs)        
-@@ -1793,7 +1793,7 @@ procprt_UDPRCV_e(struct tstat *curstat, int avgval, int nsecs)
- 
- 
- detail_printdef procprt_UDPRCV = 
--   { "UDPRCV", "UDPRCV", procprt_UDPRCV_a, procprt_UDPRCV_e, ' ', 6};
-+   { "UDPRCV", "UDPRCV", .ac.doactiveconverts = procprt_UDPRCV_a, procprt_UDPRCV_e, ' ', 6};
- /***************************************************************/
- char *
- procprt_UDPRASZ_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1826,7 +1826,7 @@ procprt_UDPRASZ_e(struct tstat *curstat, int avgval, int nsecs)
- 
- 
- detail_printdef procprt_UDPRASZ = 
--   { "UDPRASZ", "UDPRASZ", procprt_UDPRASZ_a, procprt_UDPRASZ_e, ' ', 7};
-+   { "UDPRASZ", "UDPRASZ", .ac.doactiveconverts = procprt_UDPRASZ_a, procprt_UDPRASZ_e, ' ', 7};
- /***************************************************************/
- char *
- procprt_UDPSND_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1854,7 +1854,7 @@ procprt_UDPSND_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_UDPSND = 
--   { "UDPSND", "UDPSND", procprt_UDPSND_a, procprt_UDPSND_e, ' ', 6};
-+   { "UDPSND", "UDPSND", .ac.doactiveconverts = procprt_UDPSND_a, procprt_UDPSND_e, ' ', 6};
- /***************************************************************/
- char *
- procprt_UDPSASZ_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1887,7 +1887,7 @@ procprt_UDPSASZ_e(struct tstat *curstat, int avgval, int nsecs)
- 
- 
- detail_printdef procprt_UDPSASZ = 
--   { "UDPSASZ", "UDPSASZ", procprt_UDPSASZ_a, procprt_UDPSASZ_e, ' ', 7};
-+   { "UDPSASZ", "UDPSASZ", .ac.doactiveconverts = procprt_UDPSASZ_a, procprt_UDPSASZ_e, ' ', 7};
- /***************************************************************/
- char *
- procprt_RNET_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1917,7 +1917,7 @@ procprt_RNET_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_RNET = 
--   { " RNET", "RNET", procprt_RNET_a, procprt_RNET_e, ' ', 5};
-+   { " RNET", "RNET", .ac.doactiveconverts = procprt_RNET_a, procprt_RNET_e, ' ', 5};
- /***************************************************************/
- char *
- procprt_SNET_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1945,7 +1945,7 @@ procprt_SNET_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_SNET = 
--   { " SNET", "SNET", procprt_SNET_a, procprt_SNET_e, ' ', 5};
-+   { " SNET", "SNET", .ac.doactiveconverts = procprt_SNET_a, procprt_SNET_e, ' ', 5};
- /***************************************************************/
- char *
- procprt_BANDWI_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -1974,7 +1974,7 @@ procprt_BANDWI_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_BANDWI = 
--   { "   BANDWI", "BANDWI", procprt_BANDWI_a, procprt_BANDWI_e, ' ', 9};
-+   { "   BANDWI", "BANDWI", .ac.doactiveconverts = procprt_BANDWI_a, procprt_BANDWI_e, ' ', 9};
- /***************************************************************/
- char *
- procprt_BANDWO_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -2003,7 +2003,7 @@ procprt_BANDWO_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_BANDWO = 
--   { "   BANDWO", "BANDWO", procprt_BANDWO_a, procprt_BANDWO_e, ' ', 9};
-+   { "   BANDWO", "BANDWO", .ac.doactiveconverts = procprt_BANDWO_a, procprt_BANDWO_e, ' ', 9};
- /***************************************************************/
- static void
- format_bandw(char *buf, count_t kbps)
-@@ -2069,7 +2069,7 @@ procprt_GPULIST_ae(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_GPULIST = 
--   { " GPUNUMS", "GPULIST", procprt_GPULIST_ae, procprt_GPULIST_ae, ' ', 8};
-+   { " GPUNUMS", "GPULIST", .ac.doactiveconverts = procprt_GPULIST_ae, procprt_GPULIST_ae, ' ', 8};
- /***************************************************************/
- char *
- procprt_GPUMEMNOW_ae(struct tstat *curstat, int avgval, int nsecs)
-@@ -2084,7 +2084,7 @@ procprt_GPUMEMNOW_ae(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_GPUMEMNOW = 
--   { "MEMNOW", "GPUMEM", procprt_GPUMEMNOW_ae, procprt_GPUMEMNOW_ae, ' ', 6};
-+   { "MEMNOW", "GPUMEM", .ac.doactiveconverts = procprt_GPUMEMNOW_ae, procprt_GPUMEMNOW_ae, ' ', 6};
- /***************************************************************/
- char *
- procprt_GPUMEMAVG_ae(struct tstat *curstat, int avgval, int nsecs)
-@@ -2103,7 +2103,7 @@ procprt_GPUMEMAVG_ae(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_GPUMEMAVG = 
--   { "MEMAVG", "GPUMEMAVG", procprt_GPUMEMAVG_ae, procprt_GPUMEMAVG_ae, ' ', 6};
-+   { "MEMAVG", "GPUMEMAVG", .ac.doactiveconverts = procprt_GPUMEMAVG_ae, procprt_GPUMEMAVG_ae, ' ', 6};
- /***************************************************************/
- char *
- procprt_GPUGPUBUSY_ae(struct tstat *curstat, int avgval, int nsecs)
-@@ -2121,7 +2121,7 @@ procprt_GPUGPUBUSY_ae(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_GPUGPUBUSY = 
--   { "GPUBUSY", "GPUGPUBUSY", procprt_GPUGPUBUSY_ae, procprt_GPUGPUBUSY_ae, ' ', 7};
-+   { "GPUBUSY", "GPUGPUBUSY", .ac.doactiveconverts = procprt_GPUGPUBUSY_ae, procprt_GPUGPUBUSY_ae, ' ', 7};
- /***************************************************************/
- char *
- procprt_GPUMEMBUSY_ae(struct tstat *curstat, int avgval, int nsecs)
-@@ -2139,7 +2139,7 @@ procprt_GPUMEMBUSY_ae(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_GPUMEMBUSY = 
--   { "MEMBUSY", "GPUMEMBUSY", procprt_GPUMEMBUSY_ae, procprt_GPUMEMBUSY_ae, ' ', 7};
-+   { "MEMBUSY", "GPUMEMBUSY", .ac.doactiveconverts = procprt_GPUMEMBUSY_ae, procprt_GPUMEMBUSY_ae, ' ', 7};
- /***************************************************************/
- char *
- procprt_WCHAN_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -2164,7 +2164,7 @@ procprt_WCHAN_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_WCHAN =
--   { "WCHAN          ", "WCHAN", procprt_WCHAN_a, procprt_WCHAN_e, ' ', 15};
-+   { "WCHAN          ", "WCHAN", .ac.doactiveconverts = procprt_WCHAN_a, procprt_WCHAN_e, ' ', 15};
- /***************************************************************/
- char *
- procprt_RUNDELAY_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -2185,7 +2185,7 @@ procprt_RUNDELAY_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_RUNDELAY =
--   { "RDELAY", "RDELAY", procprt_RUNDELAY_a, procprt_RUNDELAY_e, ' ', 6};
-+   { "RDELAY", "RDELAY", .ac.doactiveconverts = procprt_RUNDELAY_a, procprt_RUNDELAY_e, ' ', 6};
- /***************************************************************/
- char *
- procprt_BLKDELAY_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -2206,7 +2206,7 @@ procprt_BLKDELAY_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_BLKDELAY =
--   { "BDELAY", "BDELAY", procprt_BLKDELAY_a, procprt_BLKDELAY_e, ' ', 6};
-+   { "BDELAY", "BDELAY", .ac.doactiveconverts = procprt_BLKDELAY_a, procprt_BLKDELAY_e, ' ', 6};
- /***************************************************************/
- char *
- procprt_NVCSW_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -2224,7 +2224,7 @@ procprt_NVCSW_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_NVCSW =
--   { " NVCSW", "NVCSW", procprt_NVCSW_a, procprt_NVCSW_e, ' ', 6};
-+   { " NVCSW", "NVCSW", .ac.doactiveconverts = procprt_NVCSW_a, procprt_NVCSW_e, ' ', 6};
- /***************************************************************/
- char *
- procprt_NIVCSW_a(struct tstat *curstat, int avgval, int nsecs)
-@@ -2242,7 +2242,7 @@ procprt_NIVCSW_e(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_NIVCSW =
--   { "NIVCSW", "NIVCSW", procprt_NIVCSW_a, procprt_NIVCSW_e, ' ', 6};
-+   { "NIVCSW", "NIVCSW", .ac.doactiveconverts = procprt_NIVCSW_a, procprt_NIVCSW_e, ' ', 6};
- /***************************************************************/
- char *
- procprt_SORTITEM_ae(struct tstat *curstat, int avgval, int nsecs)
-@@ -2251,7 +2251,7 @@ procprt_SORTITEM_ae(struct tstat *curstat, int avgval, int nsecs)
- }
- 
- detail_printdef procprt_SORTITEM =   // width is dynamically defined!
--   { 0, "SORTITEM", procprt_SORTITEM_ae, procprt_SORTITEM_ae, ' ', 4};
-+   { 0, "SORTITEM", .ac.doactiveconverts = procprt_SORTITEM_ae, procprt_SORTITEM_ae, ' ', 4};
- 
- 
- /***************************************************************/
-@@ -2382,7 +2382,7 @@ showcgroupline(detail_printpair* elemptr,
- 
- 		color = 0;
- 
--		buf = curelem.pf->doactiveconvert(cgchain, tstat,
-+		buf = curelem.pf->ac.doactiveconvertc(cgchain, tstat,
- 				avgval, nsecs, cputicks, nrcpu, &color);
- 
-                 if (screen)
-@@ -2513,7 +2513,7 @@ cgroup_CGROUP_PATH(struct cgchainer *cgchain, struct tstat *tstat,
- 
- detail_printdef cgroupprt_CGROUP_PATH = 
-        {"CGROUP (scroll: <- ->)    ", "CGRPATH", 
--        cgroup_CGROUP_PATH, NULL, ' ', 26, 0};
-+	.ac.doactiveconvertc = cgroup_CGROUP_PATH, NULL, ' ', 26, 0};
- /***************************************************************/
- char *
- cgroup_CGRNPROCS(struct cgchainer *cgchain, struct tstat *tstat,
-@@ -2530,7 +2530,7 @@ cgroup_CGRNPROCS(struct cgchainer *cgchain, struct tstat *tstat,
- }
- 
- detail_printdef cgroupprt_CGRNPROCS = 
--   { "NPROCS", "CGRNPROCS", cgroup_CGRNPROCS, NULL, ' ', 6};
-+   { "NPROCS", "CGRNPROCS", .ac.doactiveconvertc = cgroup_CGRNPROCS, NULL, ' ', 6};
- /***************************************************************/
- char *
- cgroup_CGRNPROCSB(struct cgchainer *cgchain, struct tstat *tstat,
-@@ -2547,7 +2547,7 @@ cgroup_CGRNPROCSB(struct cgchainer *cgchain, struct tstat *tstat,
- }
- 
- detail_printdef cgroupprt_CGRNPROCSB = 
--   { "PBELOW", "CGRNPROCSB", cgroup_CGRNPROCSB, NULL, ' ', 6};
-+   { "PBELOW", "CGRNPROCSB", .ac.doactiveconvertc = cgroup_CGRNPROCSB, NULL, ' ', 6};
- /***************************************************************/
- char *
- cgroup_CGRCPUBUSY(struct cgchainer *cgchain, struct tstat *tstat,
-@@ -2599,7 +2599,7 @@ cgroup_CGRCPUBUSY(struct cgchainer *cgchain, struct tstat *tstat,
- }
- 
- detail_printdef cgroupprt_CGRCPUBUSY =
--   { "CPUBUSY", "CGRCPUBUSY", cgroup_CGRCPUBUSY, NULL, 'C', 7};
-+   { "CPUBUSY", "CGRCPUBUSY", .ac.doactiveconvertc = cgroup_CGRCPUBUSY, NULL, 'C', 7};
- /***************************************************************/
- char *
- cgroup_CGRCPUPSI(struct cgchainer *cgchain, struct tstat *tstat,
-@@ -2629,7 +2629,7 @@ cgroup_CGRCPUPSI(struct cgchainer *cgchain, struct tstat *tstat,
- }
- 
- detail_printdef cgroupprt_CGRCPUPSI =
--   { "CPUPS", "CGRCPUPSI", cgroup_CGRCPUPSI, NULL, ' ', 5};
-+   { "CPUPS", "CGRCPUPSI", .ac.doactiveconvertc = cgroup_CGRCPUPSI, NULL, ' ', 5};
- /***************************************************************/
- char *
- cgroup_CGRCPUMAX(struct cgchainer *cgchain, struct tstat *tstat,
-@@ -2672,7 +2672,7 @@ cgroup_CGRCPUMAX(struct cgchainer *cgchain, struct tstat *tstat,
- }
- 
- detail_printdef cgroupprt_CGRCPUMAX =
--   { "CPUMAX", "CGRCPUMAX", cgroup_CGRCPUMAX, NULL, ' ', 6};
-+   { "CPUMAX", "CGRCPUMAX", .ac.doactiveconvertc = cgroup_CGRCPUMAX, NULL, ' ', 6};
- /***************************************************************/
- char *
- cgroup_CGRCPUWGT(struct cgchainer *cgchain, struct tstat *tstat,
-@@ -2695,7 +2695,7 @@ cgroup_CGRCPUWGT(struct cgchainer *cgchain, struct tstat *tstat,
- }
- 
- detail_printdef cgroupprt_CGRCPUWGT =
--   { "CPUWGT", "CGRCPUWGT", cgroup_CGRCPUWGT, NULL, ' ', 6};
-+   { "CPUWGT", "CGRCPUWGT", .ac.doactiveconvertc = cgroup_CGRCPUWGT, NULL, ' ', 6};
- /***************************************************************/
- char *
- cgroup_CGRMEMORY(struct cgchainer *cgchain, struct tstat *tstat,
-@@ -2740,7 +2740,7 @@ cgroup_CGRMEMORY(struct cgchainer *cgchain, struct tstat *tstat,
- }
- 
- detail_printdef cgroupprt_CGRMEMORY =
--   { "MEMORY", "CGRMEMORY", cgroup_CGRMEMORY, NULL, 'M', 6};
-+   { "MEMORY", "CGRMEMORY", .ac.doactiveconvertc = cgroup_CGRMEMORY, NULL, 'M', 6};
- /***************************************************************/
- char *
- cgroup_CGRMEMPSI(struct cgchainer *cgchain, struct tstat *tstat,
-@@ -2770,7 +2770,7 @@ cgroup_CGRMEMPSI(struct cgchainer *cgchain, struct tstat *tstat,
- }
- 
- detail_printdef cgroupprt_CGRMEMPSI =
--   { "MEMPS", "CGRMEMPSI", cgroup_CGRMEMPSI, NULL, ' ', 5};
-+   { "MEMPS", "CGRMEMPSI", .ac.doactiveconvertc = cgroup_CGRMEMPSI, NULL, ' ', 5};
- /***************************************************************/
- char *
- cgroup_CGRMEMMAX(struct cgchainer *cgchain, struct tstat *tstat,
-@@ -2810,7 +2810,7 @@ cgroup_CGRMEMMAX(struct cgchainer *cgchain, struct tstat *tstat,
- }
- 
- detail_printdef cgroupprt_CGRMEMMAX =
--   { "MEMMAX", "CGRMEMMAX", cgroup_CGRMEMMAX, NULL, ' ', 6};
-+   { "MEMMAX", "CGRMEMMAX", .ac.doactiveconvertc = cgroup_CGRMEMMAX, NULL, ' ', 6};
- /***************************************************************/
- char *
- cgroup_CGRSWPMAX(struct cgchainer *cgchain, struct tstat *tstat,
-@@ -2835,7 +2835,7 @@ cgroup_CGRSWPMAX(struct cgchainer *cgchain, struct tstat *tstat,
- }
- 
- detail_printdef cgroupprt_CGRSWPMAX =
--   { "SWPMAX", "CGRSWPMAX", cgroup_CGRSWPMAX, NULL, ' ', 6};
-+   { "SWPMAX", "CGRSWPMAX", .ac.doactiveconvertc = cgroup_CGRSWPMAX, NULL, ' ', 6};
- /***************************************************************/
- char *
- cgroup_CGRDISKIO(struct cgchainer *cgchain, struct tstat *tstat,
-@@ -2864,7 +2864,7 @@ cgroup_CGRDISKIO(struct cgchainer *cgchain, struct tstat *tstat,
- }
- 
- detail_printdef cgroupprt_CGRDISKIO =
--   { "DISKIO", "CGRDISKIO", cgroup_CGRDISKIO, NULL, 'D', 6};
-+   { "DISKIO", "CGRDISKIO", .ac.doactiveconvertc = cgroup_CGRDISKIO, NULL, 'D', 6};
- /***************************************************************/
- char *
- cgroup_CGRDSKPSI(struct cgchainer *cgchain, struct tstat *tstat,
-@@ -2894,7 +2894,7 @@ cgroup_CGRDSKPSI(struct cgchainer *cgchain, struct tstat *tstat,
- }
- 
- detail_printdef cgroupprt_CGRDSKPSI =
--   { "DSKPS", "CGRDSKPSI", cgroup_CGRDSKPSI, NULL, ' ', 5};
-+   { "DSKPS", "CGRDSKPSI", .ac.doactiveconvertc = cgroup_CGRDSKPSI, NULL, ' ', 5};
- /***************************************************************/
- char *
- cgroup_CGRDSKWGT(struct cgchainer *cgchain, struct tstat *tstat,
-@@ -2917,7 +2917,7 @@ cgroup_CGRDSKWGT(struct cgchainer *cgchain, struct tstat *tstat,
- }
- 
- detail_printdef cgroupprt_CGRDSKWGT =
--   { "IOWGT", "CGRDSKWGT", cgroup_CGRDSKWGT, NULL, ' ', 5};
-+   { "IOWGT", "CGRDSKWGT", .ac.doactiveconvertc = cgroup_CGRDSKWGT, NULL, ' ', 5};
- /***************************************************************/
- char *
- cgroup_CGRPID(struct cgchainer *cgchain, struct tstat *tstat,
-@@ -2934,7 +2934,7 @@ cgroup_CGRPID(struct cgchainer *cgchain, struct tstat *tstat,
- }
- 
- detail_printdef cgroupprt_CGRPID = 
--   { "PID", "CGRPID", cgroup_CGRPID, NULL, ' ', 5}; //DYNAMIC WIDTH!
-+   { "PID", "CGRPID", .ac.doactiveconvertc = cgroup_CGRPID, NULL, ' ', 5}; //DYNAMIC WIDTH!
- /***************************************************************/
- char *
- cgroup_CGRCMD(struct cgchainer *cgchain, struct tstat *tstat,
-@@ -2963,5 +2963,5 @@ cgroup_CGRCMD(struct cgchainer *cgchain, struct tstat *tstat,
- }
- 
- detail_printdef cgroupprt_CGRCMD = 
--   { "CMD           ", "CGRCMD", cgroup_CGRCMD, NULL, ' ', 14};
-+   { "CMD           ", "CGRCMD", .ac.doactiveconvertc = cgroup_CGRCMD, NULL, ' ', 14};
- /***************************************************************/
-diff --git a/various.c b/various.c
-index c175c10..906a529 100644
---- a/various.c
-+++ b/various.c
-@@ -29,6 +29,10 @@
- ** Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- ** --------------------------------------------------------------------------
- */
-+#define _POSIX_C_SOURCE
-+#define _XOPEN_SOURCE
-+#define _GNU_SOURCE
-+#define _DEFAULT_SOURCE
- 
- #include <sys/types.h>
- #include <sys/param.h>
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/atop/atop/fix-permissions.patch b/meta-oe/recipes-support/atop/atop/fix-permissions.patch
index 10f504b472..afd37aca85 100644
--- a/meta-oe/recipes-support/atop/atop/fix-permissions.patch
+++ b/meta-oe/recipes-support/atop/atop/fix-permissions.patch
@@ -1,4 +1,4 @@
-From d9498d10d0e8241749835dbc9fa229465d4fdfd7 Mon Sep 17 00:00:00 2001
+From 3684fcf7679d5d5f7adc5a4a7e53f498aa0c45c2 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Wed, 6 Feb 2019 13:58:04 +0000
 Subject: [PATCH] Fix permissions
@@ -14,10 +14,10 @@ Signed-off-by: Tho Dat Nguyen <tho3.nguyen@lge.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index a6f196b..7786f93 100644
+index 3a73bd2..1388b65 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -77,7 +77,7 @@ install:	genericinstall
+@@ -86,7 +86,7 @@ install:	genericinstall
  		cp atopacct.service    $(DESTDIR)$(SYSDPATH)
  		chmod 0644             $(DESTDIR)$(SYSDPATH)/atopacct.service
  		cp atop-pm.sh          $(DESTDIR)$(PMPATHD)
@@ -26,7 +26,7 @@ index a6f196b..7786f93 100644
  		#
  		# only when making on target system:
  		#
-@@ -107,17 +107,17 @@ sysvinstall:	genericinstall
+@@ -116,17 +116,17 @@ sysvinstall:	genericinstall
  		cp atopacct.init  $(DESTDIR)$(INIPATH)/atopacct
  		cp atop.cronsysv  $(DESTDIR)$(CRNPATH)/atop
  		cp atop.daily     $(DESTDIR)$(SCRPATH)
@@ -47,7 +47,7 @@ index a6f196b..7786f93 100644
  		fi
  		#
  		#
-@@ -160,7 +160,7 @@ genericinstall:	atop atopacctd atopconvert atopcat atophide
+@@ -169,7 +169,7 @@ genericinstall:	atop atopacctd atopconvert atopcat atophide
  		chmod 644      		$(DESTDIR)$(DEFPATH)/atop
  		#
  		cp atop   		$(DESTDIR)$(BINPATH)/atop
@@ -56,7 +56,7 @@ index a6f196b..7786f93 100644
  		ln -sf atop             $(DESTDIR)$(BINPATH)/atopsar
  		cp atopacctd  		$(DESTDIR)$(SBINPATH)/atopacctd
  		chmod 0700 		$(DESTDIR)$(SBINPATH)/atopacctd
-@@ -169,11 +169,11 @@ genericinstall:	atop atopacctd atopconvert atopcat atophide
+@@ -178,11 +178,11 @@ genericinstall:	atop atopacctd atopconvert atopcat atophide
  		cp atop   		$(DESTDIR)$(BINPATH)/atop-$(VERS)
  		ln -sf atop-$(VERS)     $(DESTDIR)$(BINPATH)/atopsar-$(VERS)
  		cp atopconvert 		$(DESTDIR)$(BINPATH)/atopconvert
diff --git a/meta-oe/recipes-support/atop/atop_2.11.0.bb b/meta-oe/recipes-support/atop/atop_2.12.0.bb
similarity index 94%
rename from meta-oe/recipes-support/atop/atop_2.11.0.bb
rename to meta-oe/recipes-support/atop/atop_2.12.0.bb
index 8eb8cd6b06..348493245b 100644
--- a/meta-oe/recipes-support/atop/atop_2.11.0.bb
+++ b/meta-oe/recipes-support/atop/atop_2.12.0.bb
@@ -21,9 +21,8 @@ SRC_URI = "http://www.atoptool.nl/download/${BP}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'file://volatiles.atop.conf', 'file://volatiles.99_atop', d)} \
            file://fix-permissions.patch \
            file://sysvinit-implement-status.patch \
-           file://0001-Redefine-function-prototypes-solves-issue-322.patch \
            "
-SRC_URI[sha256sum] = "9b94c666602efff7bf402ecce706c347f38c39cb63498f9d39626861e5646e20"
+SRC_URI[sha256sum] = "0d09ecc90c14e6ef41c22e3c57c142c3e4fb9cf3c94379077a33c961d5343086"
 
 UPSTREAM_CHECK_URI = "https://atoptool.nl/downloadatop.php"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+).tar"
-- 
2.43.0


