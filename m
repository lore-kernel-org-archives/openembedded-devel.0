Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F3B7EED611
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:32:29 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.2209.1695108742972411823
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="132644988"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="132644988"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:32:22 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9990ECD6E0
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:32:18 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id DA97AD5E9D
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:32:17 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5D4CC20079116;
	Tue, 19 Sep 2023 16:32:17 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hwloc: upgrade 2.9.2 -> 2.9.3
Date: Tue, 19 Sep 2023 15:32:00 +0800
Message-Id: <1695108720-7072-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27884.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27884.005
X-TMASE-Result: 10--9.386000-10.000000
X-TMASE-MatchedRID: aL9W8lSYQvyjz0nOeth/yTo39wOA02LhQRlUSJjs8Z/9wRnyxuPjhFYM
	JR3dIrh2TV0yKzX+AoO0cvTTthrMuPN4L4izsa/kGqSG/c50XgODnmblFLAswhG3US/I5cDRdO/
	3aH+hF2WLOLamdcUN090nMZghwZG1HaQ9wyk4fkA8OVGJH5Uhyqi6V1fBNU+8UoXFjv/N8aILtA
	4J5CUzRSqq0O5S3DJ8Lfwz7bjtDsHc2Rqz++uLDvx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78FH
	rw7frluNIBrw7gT13Qv/zJQ0aiPJvUe3cF58v23nVTWWiNp+v/KIqAq0jIHinO+fW3rC5prNKCF
	v+lwDDIMV38Bdz1rorgXRsCLvuNr++XBDev6r0z97643XzR7l1pjn692i6cIty9mj1urE9KH62g
	sspfBEVgMBEzGHoYTZ+XDgDNcz5oR8hZMqdJm+WFb8qosrs1Qw8Jhc8Z4licPa94jf+HCb9ftCr
	F2sVs+4vM1YF6AJbbY2hczJbMEQm3U7j2vVURrxEHRux+uk8h+ICquNi0WJJHH0nZH3oM0Ah4pT
	7qoJCiYUH6LM6Zk6Cx2cvaN8WFfftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104965

From: Wang Mingyu <wangmy@fujitsu.com>

CVE-2022-47022.patch
removed since it's included in 2.9.3

Changelog:
===========
* Handle Linux glibc allocation errors in binding routines (CVE-2022-47022).
* Fix hwloc-calc when searching objects on heterogeneous memory platforms,
  thanks to Antoine Morvan for the report.
* Fix hwloc_get_next_child() when there are some memory-side caches.
* Don't crash if the topology is empty because Linux cgroups are wrong.
* Improve some hwloc-bind warnings in case of command-line parsing errors.
* Many documentation improvements all over the place, including:
  + hwloc_topology_restrict() and hwloc_topology_insert_group() may reorder
    children, causing the logical indexes of objects to change.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../hwloc/files/CVE-2022-47022.patch          | 77 -------------------
 .../hwloc/{hwloc_2.9.2.bb => hwloc_2.9.3.bb}  |  6 +-
 2 files changed, 2 insertions(+), 81 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/hwloc/files/CVE-2022-47022.patch
 rename meta-oe/recipes-extended/hwloc/{hwloc_2.9.2.bb => hwloc_2.9.3.bb} (88%)

diff --git a/meta-oe/recipes-extended/hwloc/files/CVE-2022-47022.patch b/meta-oe/recipes-extended/hwloc/files/CVE-2022-47022.patch
deleted file mode 100644
index c981b68b70..0000000000
--- a/meta-oe/recipes-extended/hwloc/files/CVE-2022-47022.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From ac1f8db9a0790d2bf153711ff4cbf6101f89aace Mon Sep 17 00:00:00 2001
-From: Brice Goglin <Brice.Goglin@inria.fr>
-Date: Thu, 31 Aug 2023 09:28:34 +0000
-Subject: [PATCH] linux: handle glibc cpuset allocation failures
-
-Closes #544
-CVE-2022-47022
-
-Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
-
-CVE: CVE-2022-47022
-
-Upstream-Status: Backport[https://github.com/open-mpi/hwloc/commit/ac1f8db9a0790d2bf153711ff4cbf6101f89aace]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
----
- hwloc/topology-linux.c | 15 ++++++++++++++-
- 1 file changed, 14 insertions(+), 1 deletion(-)
-
-diff --git a/hwloc/topology-linux.c b/hwloc/topology-linux.c
-index c7b63d2..fd6745e 100644
---- a/hwloc/topology-linux.c
-+++ b/hwloc/topology-linux.c
-@@ -870,6 +870,8 @@ hwloc_linux_set_tid_cpubind(hwloc_topology_t topology __hwloc_attribute_unused,
-
-   setsize = CPU_ALLOC_SIZE(last+1);
-   plinux_set = CPU_ALLOC(last+1);
-+  if (!plinux_set)
-+    return -1;
-
-   CPU_ZERO_S(setsize, plinux_set);
-   hwloc_bitmap_foreach_begin(cpu, hwloc_set)
-@@ -950,7 +952,10 @@ hwloc_linux_find_kernel_nr_cpus(hwloc_topology_t topology)
-   while (1) {
-     cpu_set_t *set = CPU_ALLOC(nr_cpus);
-     size_t setsize = CPU_ALLOC_SIZE(nr_cpus);
--    int err = sched_getaffinity(0, setsize, set); /* always works, unless setsize is too small */
-+    int err;
-+    if (!set)
-+      return -1; /* caller will return an error, and we'll try again later */
-+    err = sched_getaffinity(0, setsize, set); /* always works, unless setsize is too small */
-     CPU_FREE(set);
-     nr_cpus = setsize * 8; /* that's the value that was actually tested */
-     if (!err)
-@@ -978,8 +983,12 @@ hwloc_linux_get_tid_cpubind(hwloc_topology_t topology __hwloc_attribute_unused,
-
-   /* find the kernel nr_cpus so as to use a large enough cpu_set size */
-   kernel_nr_cpus = hwloc_linux_find_kernel_nr_cpus(topology);
-+  if (kernel_nr_cpus < 0)
-+    return -1;
-   setsize = CPU_ALLOC_SIZE(kernel_nr_cpus);
-   plinux_set = CPU_ALLOC(kernel_nr_cpus);
-+  if (!plinux_set)
-+    return -1;
-
-   err = sched_getaffinity(tid, setsize, plinux_set);
-
-@@ -1333,6 +1342,8 @@ hwloc_linux_set_thread_cpubind(hwloc_topology_t topology, pthread_t tid, hwloc_c
-
-      setsize = CPU_ALLOC_SIZE(last+1);
-      plinux_set = CPU_ALLOC(last+1);
-+     if (!plinux_set)
-+       return -1;
-
-      CPU_ZERO_S(setsize, plinux_set);
-      hwloc_bitmap_foreach_begin(cpu, hwloc_set)
-@@ -1424,6 +1435,8 @@ hwloc_linux_get_thread_cpubind(hwloc_topology_t topology, pthread_t tid, hwloc_b
-
-      setsize = CPU_ALLOC_SIZE(last+1);
-      plinux_set = CPU_ALLOC(last+1);
-+     if (!plinux_set)
-+       return -1;
-
-      err = pthread_getaffinity_np(tid, setsize, plinux_set);
-      if (err) {
---
-2.35.5
diff --git a/meta-oe/recipes-extended/hwloc/hwloc_2.9.2.bb b/meta-oe/recipes-extended/hwloc/hwloc_2.9.3.bb
similarity index 88%
rename from meta-oe/recipes-extended/hwloc/hwloc_2.9.2.bb
rename to meta-oe/recipes-extended/hwloc/hwloc_2.9.3.bb
index bcb615f73a..d72c5f2be5 100644
--- a/meta-oe/recipes-extended/hwloc/hwloc_2.9.2.bb
+++ b/meta-oe/recipes-extended/hwloc/hwloc_2.9.3.bb
@@ -7,10 +7,8 @@ SECTION = "base"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=79179bb373cd55cbd834463a514fb714"
 
-SRC_URI = "https://www.open-mpi.org/software/${BPN}/v2.9/downloads/${BP}.tar.bz2 \
-           file://CVE-2022-47022.patch \
-          "
-SRC_URI[sha256sum] = "0a87fdf677f8b00b567d229b6320bf6b25c693edaa43e0b85268d999d6b060cf"
+SRC_URI = "https://www.open-mpi.org/software/${BPN}/v2.9/downloads/${BP}.tar.bz2"
+SRC_URI[sha256sum] = "5c4062ce556f6d3451fc177ffb8673a2120f81df6835dea6a21a90fbdfff0dec"
 UPSTREAM_CHECK_URI = "https://www.open-mpi.org/software/hwloc/v2.9/"
 
 inherit autotools bash-completion pkgconfig
-- 
2.34.1


