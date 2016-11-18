Return-Path: <Quanyang.Wang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 903C271ACA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 01:41:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAI1fkJg019937
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2016 17:41:49 -0800 (PST)
Received: from pek-lpgbuild1.wrs.com (128.224.153.21) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 17 Nov 2016 17:41:46 -0800
From: <quanyang.wang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Nov 2016 09:41:44 +0800
Message-ID: <1479433304-10280-1-git-send-email-quanyang.wang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [meta-oe] [PATCH] mcelog: Add Kabylake client support
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
X-List-Received-Date: Fri, 18 Nov 2016 01:41:48 -0000
Content-Type: text/plain

From: wqyoung <quanyang.wang@windriver.com>

Issue: TA164086
(LOCAL REV: NOT UPSTREAM) -- will send to oe-devel on 20161117

CPU models 0x8E and 0x9E denote kabylake client processor

Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
---
 .../mcelog/0001-Add-Kabylake-client-support.patch  | 95 ++++++++++++++++++++++
 meta-oe/recipes-support/mcelog/mcelog_1.40.bb      |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 meta-oe/recipes-support/mcelog/mcelog/0001-Add-Kabylake-client-support.patch

diff --git a/meta-oe/recipes-support/mcelog/mcelog/0001-Add-Kabylake-client-support.patch b/meta-oe/recipes-support/mcelog/mcelog/0001-Add-Kabylake-client-support.patch
new file mode 100644
index 0000000..4a3545a
--- /dev/null
+++ b/meta-oe/recipes-support/mcelog/mcelog/0001-Add-Kabylake-client-support.patch
@@ -0,0 +1,96 @@
+From 11bfbb446116c8313728157148a6bb15625031e8 Mon Sep 17 00:00:00 2001
+From: Tony Luck <tony.luck@intel.com>
+Date: Tue, 30 Aug 2016 09:37:02 -0700
+Subject: [PATCH] Add Kabylake client support
+
+CPU models 0x8E and 0x9E denote kabylake client processor
+
+Upstream-Status: Backport [A little modification on context]
+https://github.com/andikleen/mcelog/commit/11bfbb446116c8313728157148a6bb15625031e8
+
+Signed-off-by: Tony Luck <tony.luck@intel.com>
+Signed-off-by: Andi Kleen <ak@linux.intel.com>
+Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
+---
+ intel.c  | 5 ++++-
+ intel.h  | 3 ++-
+ mcelog.c | 4 +++-
+ mcelog.h | 1 +
+ 4 files changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/intel.c b/intel.c
+index f4ef9f6..33a99a8 100644
+--- a/intel.c
++++ b/intel.c
+@@ -35,7 +35,8 @@ void intel_cpu_init(enum cputype cpu)
+ 	    cpu == CPU_IVY_BRIDGE || cpu == CPU_IVY_BRIDGE_EPEX ||
+ 	    cpu == CPU_HASWELL || cpu == CPU_HASWELL_EPEX || cpu == CPU_BROADWELL ||
+ 	    cpu == CPU_BROADWELL_DE || cpu == CPU_BROADWELL_EPEX ||
+-	    cpu == CPU_KNIGHTS_LANDING || cpu == CPU_SKYLAKE || cpu == CPU_SKYLAKE_XEON)
++	    cpu == CPU_KNIGHTS_LANDING || cpu == CPU_SKYLAKE || cpu == CPU_SKYLAKE_XEON ||
++	    cpu == CPU_KABYLAKE)
+ 		memory_error_support = 1;
+ }
+ 
+@@ -90,6 +91,8 @@ enum cputype select_intel_cputype(int family, int model)
+ 			return CPU_SKYLAKE;
+ 		else if (model == 0x55)
+ 			return CPU_SKYLAKE_XEON;
++		else if (model == 0x8E || model == 0x9E)
++			return CPU_KABYLAKE;
+ 		if (model > 0x1a) {
+ 			Eprintf("Family 6 Model %u CPU: only decoding architectural errors\n",
+ 				model);
+diff --git a/intel.h b/intel.h
+index d22895b..c231925 100644
+--- a/intel.h
++++ b/intel.h
+@@ -26,5 +26,6 @@ extern int memory_error_support;
+ 	case CPU_ATOM:	\
+ 	case CPU_KNIGHTS_LANDING: \
+ 	case CPU_SKYLAKE: \
+-	case CPU_SKYLAKE_XEON
++	case CPU_SKYLAKE_XEON: \
++	case CPU_KABYLAKE
+ 
+diff --git a/mcelog.c b/mcelog.c
+index 1d79fa1..7214a0d 100644
+--- a/mcelog.c
++++ b/mcelog.c
+@@ -238,6 +238,7 @@ static char *cputype_name[] = {
+ 	[CPU_ATOM] = "ATOM",
+ 	[CPU_SKYLAKE] = "Skylake",
+ 	[CPU_SKYLAKE_XEON] = "Skylake server",
++	[CPU_KABYLAKE] = "Kabylake",
+ };
+ 
+ static struct config_choice cpu_choices[] = {
+@@ -287,6 +288,7 @@ static struct config_choice cpu_choices[] = {
+ 	{ "atom", CPU_ATOM },
+ 	{ "skylake", CPU_SKYLAKE },
+ 	{ "skylake_server", CPU_SKYLAKE_XEON },
++	{ "kabylake", CPU_KABYLAKE },
+ 	{ NULL }
+ };
+ 
+@@ -451,7 +453,7 @@ static void dump_mce(struct mce *m, unsigned recordlen)
+ 	    cputype != CPU_HASWELL_EPEX && cputype != CPU_BROADWELL &&
+ 	    cputype != CPU_BROADWELL_DE && cputype != CPU_BROADWELL_EPEX &&
+ 	    cputype != CPU_KNIGHTS_LANDING && cputype != CPU_SKYLAKE &&
+-	    cputype != CPU_SKYLAKE_XEON)
++	    cputype != CPU_SKYLAKE_XEON && cputype != CPU_KABYLAKE)
+ 		resolveaddr(m->addr);
+ 	if (!ascii_mode && ismemerr && (m->status & MCI_STATUS_ADDRV)) {
+ 		diskdb_resolve_addr(m->addr);
+diff --git a/mcelog.h b/mcelog.h
+index abc8bc9..254b3a0 100644
+--- a/mcelog.h
++++ b/mcelog.h
+@@ -130,6 +130,7 @@ enum cputype {
+ 	CPU_ATOM,
+ 	CPU_SKYLAKE,
+ 	CPU_SKYLAKE_XEON,
++	CPU_KABYLAKE,
+ };
+ 
+ enum option_ranges {
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-support/mcelog/mcelog_1.40.bb b/meta-oe/recipes-support/mcelog/mcelog_1.40.bb
index 9aebbd5..0d359fc 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_1.40.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_1.40.bb
@@ -7,6 +7,7 @@ SECTION = "System Environment/Base"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http; \
     file://mcelog-debash.patch \
+    file://0001-Add-Kabylake-client-support.patch \
     file://run-ptest \
 "
 
-- 
1.9.1


