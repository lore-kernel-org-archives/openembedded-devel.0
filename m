Return-Path: <Liwei.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3016F77E41
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Apr 2017 09:28:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3E9SIa9010813
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Apr 2017 02:28:18 -0700 (PDT)
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 14 Apr 2017 02:28:17 -0700
From: Liwei Song <liwei.song@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Apr 2017 05:28:15 -0400
Message-ID: <20170414092815.217632-1-liwei.song@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mcelog: upgrade to 1.49 to support Denverton SoC
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
X-List-Received-Date: Fri, 14 Apr 2017 09:28:17 -0000
Content-Type: text/plain

Update mcelog to 1.49 to support Denverton SoC, and delete the additional
patches which are already involved in v1.49.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 .../mcelog/0001-Add-Kabylake-client-support.patch  | 96 ----------------------
 .../mcelog/mcelog/mcelog-debash.patch              | 36 --------
 .../mcelog/{mcelog_1.40.bb => mcelog_1.49.bb}      |  6 +-
 3 files changed, 2 insertions(+), 136 deletions(-)
 delete mode 100644 meta-oe/recipes-support/mcelog/mcelog/0001-Add-Kabylake-client-support.patch
 delete mode 100644 meta-oe/recipes-support/mcelog/mcelog/mcelog-debash.patch
 rename meta-oe/recipes-support/mcelog/{mcelog_1.40.bb => mcelog_1.49.bb} (83%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog/0001-Add-Kabylake-client-support.patch b/meta-oe/recipes-support/mcelog/mcelog/0001-Add-Kabylake-client-support.patch
deleted file mode 100644
index f9dfbcab5..000000000
--- a/meta-oe/recipes-support/mcelog/mcelog/0001-Add-Kabylake-client-support.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 11bfbb446116c8313728157148a6bb15625031e8 Mon Sep 17 00:00:00 2001
-From: Tony Luck <tony.luck@intel.com>
-Date: Tue, 30 Aug 2016 09:37:02 -0700
-Subject: [PATCH] Add Kabylake client support
-
-CPU models 0x8E and 0x9E denote kabylake client processor
-
-Upstream-Status: Backport [A little modification on context]
-https://github.com/andikleen/mcelog/commit/11bfbb446116c8313728157148a6bb15625031e8
-
-Signed-off-by: Tony Luck <tony.luck@intel.com>
-Signed-off-by: Andi Kleen <ak@linux.intel.com>
-Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
----
- intel.c  | 5 ++++-
- intel.h  | 3 ++-
- mcelog.c | 4 +++-
- mcelog.h | 1 +
- 4 files changed, 10 insertions(+), 3 deletions(-)
-
-diff --git a/intel.c b/intel.c
-index f4ef9f6..33a99a8 100644
---- a/intel.c
-+++ b/intel.c
-@@ -35,7 +35,8 @@ void intel_cpu_init(enum cputype cpu)
- 	    cpu == CPU_IVY_BRIDGE || cpu == CPU_IVY_BRIDGE_EPEX ||
- 	    cpu == CPU_HASWELL || cpu == CPU_HASWELL_EPEX || cpu == CPU_BROADWELL ||
- 	    cpu == CPU_BROADWELL_DE || cpu == CPU_BROADWELL_EPEX ||
--	    cpu == CPU_KNIGHTS_LANDING || cpu == CPU_SKYLAKE || cpu == CPU_SKYLAKE_XEON)
-+	    cpu == CPU_KNIGHTS_LANDING || cpu == CPU_SKYLAKE || cpu == CPU_SKYLAKE_XEON ||
-+	    cpu == CPU_KABYLAKE)
- 		memory_error_support = 1;
- }
- 
-@@ -90,6 +91,8 @@ enum cputype select_intel_cputype(int family, int model)
- 			return CPU_SKYLAKE;
- 		else if (model == 0x55)
- 			return CPU_SKYLAKE_XEON;
-+		else if (model == 0x8E || model == 0x9E)
-+			return CPU_KABYLAKE;
- 		if (model > 0x1a) {
- 			Eprintf("Family 6 Model %u CPU: only decoding architectural errors\n",
- 				model);
-diff --git a/intel.h b/intel.h
-index d22895b..c231925 100644
---- a/intel.h
-+++ b/intel.h
-@@ -26,5 +26,6 @@ extern int memory_error_support;
- 	case CPU_ATOM:	\
- 	case CPU_KNIGHTS_LANDING: \
- 	case CPU_SKYLAKE: \
--	case CPU_SKYLAKE_XEON
-+	case CPU_SKYLAKE_XEON: \
-+	case CPU_KABYLAKE
- 
-diff --git a/mcelog.c b/mcelog.c
-index 1d79fa1..7214a0d 100644
---- a/mcelog.c
-+++ b/mcelog.c
-@@ -238,6 +238,7 @@ static char *cputype_name[] = {
- 	[CPU_ATOM] = "ATOM",
- 	[CPU_SKYLAKE] = "Skylake",
- 	[CPU_SKYLAKE_XEON] = "Skylake server",
-+	[CPU_KABYLAKE] = "Kabylake",
- };
- 
- static struct config_choice cpu_choices[] = {
-@@ -287,6 +288,7 @@ static struct config_choice cpu_choices[] = {
- 	{ "atom", CPU_ATOM },
- 	{ "skylake", CPU_SKYLAKE },
- 	{ "skylake_server", CPU_SKYLAKE_XEON },
-+	{ "kabylake", CPU_KABYLAKE },
- 	{ NULL }
- };
- 
-@@ -451,7 +453,7 @@ static void dump_mce(struct mce *m, unsigned recordlen)
- 	    cputype != CPU_HASWELL_EPEX && cputype != CPU_BROADWELL &&
- 	    cputype != CPU_BROADWELL_DE && cputype != CPU_BROADWELL_EPEX &&
- 	    cputype != CPU_KNIGHTS_LANDING && cputype != CPU_SKYLAKE &&
--	    cputype != CPU_SKYLAKE_XEON)
-+	    cputype != CPU_SKYLAKE_XEON && cputype != CPU_KABYLAKE)
- 		resolveaddr(m->addr);
- 	if (!ascii_mode && ismemerr && (m->status & MCI_STATUS_ADDRV)) {
- 		diskdb_resolve_addr(m->addr);
-diff --git a/mcelog.h b/mcelog.h
-index abc8bc9..254b3a0 100644
---- a/mcelog.h
-+++ b/mcelog.h
-@@ -130,6 +130,7 @@ enum cputype {
- 	CPU_ATOM,
- 	CPU_SKYLAKE,
- 	CPU_SKYLAKE_XEON,
-+	CPU_KABYLAKE,
- };
- 
- enum option_ranges {
diff --git a/meta-oe/recipes-support/mcelog/mcelog/mcelog-debash.patch b/meta-oe/recipes-support/mcelog/mcelog/mcelog-debash.patch
deleted file mode 100644
index bea2f6293..000000000
--- a/meta-oe/recipes-support/mcelog/mcelog/mcelog-debash.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 8f57d35747a3b3fabc33466563077373090f869c Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Tue, 2 Sep 2014 07:05:15 -0700
-Subject: [PATCH] cache-error-trigger: remove bashism
-
-Use "$(cat $F)" to instead of "$(< $F)" to debash.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- triggers/cache-error-trigger |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/triggers/cache-error-trigger b/triggers/cache-error-trigger
-index e32bfd6..785526f 100755
---- a/triggers/cache-error-trigger
-+++ b/triggers/cache-error-trigger
-@@ -1,4 +1,4 @@
--#!/bin/bash
-+#!/bin/sh
- # cache error trigger. This shell script is executed by mcelog in daemon mode
- # when a CPU reports excessive corrected cache errors. This could be a indication
- # for future uncorrected errors.
-@@ -28,7 +28,7 @@ for i in $AFFECTED_CPUS ; do
- 	logger -s -p daemon.crit -t mcelog "Offlining CPU $i due to cache error threshold"
- 	F=$(printf "/sys/devices/system/cpu/cpu%d/online" $i)
- 	echo 0 > $F
--	if [ "$(< $F)" != "0" ] ; then
-+	if [ "$(cat $F)" != "0" ] ; then
- 		logger -s -p daemon.warn -t mcelog "Offlining CPU $i failed"
- 		EXIT=1
- 	fi
--- 
-1.7.9.5
-
diff --git a/meta-oe/recipes-support/mcelog/mcelog_1.40.bb b/meta-oe/recipes-support/mcelog/mcelog_1.49.bb
similarity index 83%
rename from meta-oe/recipes-support/mcelog/mcelog_1.40.bb
rename to meta-oe/recipes-support/mcelog/mcelog_1.49.bb
index 0d359fc4b..84633a76c 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_1.40.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_1.49.bb
@@ -6,15 +6,13 @@ HOMEPAGE = "http://mcelog.org/"
 SECTION = "System Environment/Base"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http; \
-    file://mcelog-debash.patch \
-    file://0001-Add-Kabylake-client-support.patch \
     file://run-ptest \
 "
 
-SRCREV = "008c73e6de3a4bf969d1627e695d4efc807aed92"
+SRCREV = "2cfdf29b2ef98ccd5ed42cdde8bbe437e0d6412f"
 
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://README;md5=3d12dd2a10bdd22379cc4c0fc6949a88"
+LIC_FILES_CHKSUM = "file://README.md;md5=279840fabb191e6cd9150492d31b0e20"
 
 S = "${WORKDIR}/git"
 
-- 
2.11.0


