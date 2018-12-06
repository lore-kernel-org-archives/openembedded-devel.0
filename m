Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0810E6C1DF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Dec 2018 09:55:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wB69t1Tn005109
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 6 Dec 2018 01:55:42 -0800
Received: from pek-lpgtest5.wrs.com (128.224.153.85) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 6 Dec 2018 01:55:03 -0800
From: Haiqing Bai <Haiqing.Bai@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <haiqing.bai@windriver.com>
Date: Thu, 6 Dec 2018 17:55:01 +0800
Message-ID: <20181206095501.2985-1-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] ptpd: fixed the issue of ptpd2 daemon takes 100% CPU
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
X-List-Received-Date: Thu, 06 Dec 2018 09:55:52 -0000
Content-Type: text/plain

The ptpd2 daemon consumes 100% CPU (of a single core) after
some amount of stable runtime. This fix added minimum POSIX
timer interval to prevent from timers firing to quickly for
the process to handle, resulting in 100% CPU and endless signal queue.

Reference: https://github.com/ptpd/ptpd/blob/master/ChangeLog

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 ...PU-using-issue-by-adding-minimum-POSIX-ti.patch | 68 ++++++++++++++++++++++
 meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/ptpd/ptpd/Fixed-100-CPU-using-issue-by-adding-minimum-POSIX-ti.patch

diff --git a/meta-networking/recipes-daemons/ptpd/ptpd/Fixed-100-CPU-using-issue-by-adding-minimum-POSIX-ti.patch b/meta-networking/recipes-daemons/ptpd/ptpd/Fixed-100-CPU-using-issue-by-adding-minimum-POSIX-ti.patch
new file mode 100644
index 000000000..1d2a5368c
--- /dev/null
+++ b/meta-networking/recipes-daemons/ptpd/ptpd/Fixed-100-CPU-using-issue-by-adding-minimum-POSIX-ti.patch
@@ -0,0 +1,68 @@
+From e00d3f52ccc6496a60992ac5a9d771b1d067eceb Mon Sep 17 00:00:00 2001
+From: Haiqing Bai <Haiqing.Bai@windriver.com>
+Date: Thu, 22 Nov 2018 08:42:48 +0000
+Subject: [PATCH] Fixed 100% CPU using issue by adding minimum POSIX timer
+ interval
+
+Added minimum POSIX timer interval to prevent from timers firing
+to quickly for the process to handle, resulting in 100% CPU and
+endless signal queue.
+
+Upstream-status: Backport
+[From commit 1f0baae98a7b23e85f2bfd8f5de64795421c270e:
+  - critical: added minimum POSIX timer interval to prevent from
+    timers firing to quickly for the process to handle,
+    resulting in 100% CPU and endless signal queue]
+
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+---
+ src/dep/eventtimer.h        | 3 ++-
+ src/dep/eventtimer_itimer.c | 2 +-
+ src/dep/eventtimer_posix.c  | 4 ++++
+ 3 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/src/dep/eventtimer.h b/src/dep/eventtimer.h
+index 64e483a..0a21318 100644
+--- a/src/dep/eventtimer.h
++++ b/src/dep/eventtimer.h
+@@ -30,7 +30,8 @@
+  * IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#define EVENTTIMER_MAX_DESC           20
++#define EVENTTIMER_MAX_DESC		20
++#define EVENTTIMER_MIN_INTERVAL_US	250 /* 4000/sec */
+ 
+ typedef struct EventTimer EventTimer;
+ 
+diff --git a/src/dep/eventtimer_itimer.c b/src/dep/eventtimer_itimer.c
+index cf3c6db..3bb7ec6 100644
+--- a/src/dep/eventtimer_itimer.c
++++ b/src/dep/eventtimer_itimer.c
+@@ -53,7 +53,7 @@
+ 
+ #include "../ptpd.h"
+ 
+-#define US_TIMER_INTERVAL (62500)
++#define US_TIMER_INTERVAL (31250)
+ 
+ static volatile unsigned int elapsed;
+ 
+diff --git a/src/dep/eventtimer_posix.c b/src/dep/eventtimer_posix.c
+index 637eef3..f4a702d 100644
+--- a/src/dep/eventtimer_posix.c
++++ b/src/dep/eventtimer_posix.c
+@@ -100,6 +100,10 @@ eventTimerStart_posix(EventTimer *timer, double interval)
+ 	ts.tv_sec = interval;
+ 	ts.tv_nsec = (interval - ts.tv_sec) * 1E9;
+ 
++	if(!ts.tv_sec && ts.tv_nsec < EVENTTIMER_MIN_INTERVAL_US * 1000) {
++	    ts.tv_nsec = EVENTTIMER_MIN_INTERVAL_US * 1000;
++	}
++
+ 	DBGV("Timer %s start requested at %d.%4d sec interval\n", timer->id, ts.tv_sec, ts.tv_nsec);
+ 
+ 	its.it_interval = ts;
+-- 
+2.11.0
+
diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
index e13619320..58625c809 100644
--- a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
+++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
@@ -23,6 +23,7 @@ def get_sub(d):
 
 SRC_URI = "http://downloads.sourceforge.net/project/ptpd/ptpd/${@get_sub(d)}/ptpd-${PV}.tar.gz \
            file://ptpd-use-pkgconfig.patch \
+           file://Fixed-100-CPU-using-issue-by-adding-minimum-POSIX-ti.patch \
            file://ptpd.service \
            file://ptpd.conf \
 "
-- 
2.14.4


