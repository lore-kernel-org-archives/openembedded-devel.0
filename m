Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8A1C83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 09:22:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10030.1693387334698957556
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 02:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VMfMz8x3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=76062be1f5=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37U9LoYh031102
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 02:22:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=iqmCt
	gMYKOWypkzmn9kEv7xigojXcZeyfqoGyNp+W3E=; b=VMfMz8x3VFAKFzo8MRlwE
	gCBOKzcI5VviuE+z6h6lwuM13QjoB5RfJNDtCkrjeB/unwWYMGQAOwXb3+NocbQa
	npGR13Q1slFm6Y//cpr6J9twoZ8bHV7AuMXYvIw35sbVTtRKkzr10q9yQT6Nf3cK
	ysgzTnk8JCgKo/hhqWVIOgs6w315kXZHPkPzOJJkEPC1WE06MnVn6EculXTQuan4
	obzAf4yIB1T29Pbke5H/SpyQtJIKJEvZ/3i20AAi1+Ltx5HUNLE44Duh1awch/ps
	beWLq/aRfgTuxT/OaWy8u2iTiFE/iEJe6vwLiIoEOBtAIw96UiYhkS8KN7aX9C7I
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sqgwfk9cf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 02:22:14 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 02:22:11 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe][meta-oe][mickledore][PATCH 1/1] hwloc: fix CVE-2022-47022
Date: Wed, 30 Aug 2023 09:21:58 +0000
Message-ID: <20230830092158.2903545-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: ogw8FKhQgUGE8gy0__WIhK4dbYKvGbbI
X-Proofpoint-ORIG-GUID: ogw8FKhQgUGE8gy0__WIhK4dbYKvGbbI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=567
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2308100000
 definitions=main-2308300087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 09:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104665

An issue was discovered in open-mpi hwloc 2.1.0 allows attackers to cause
a denial of service or other unspecified impacts via glibc-cpuset in topology-linux.c.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-47022
https://github.com/open-mpi/hwloc/issues/544

Upstream patches:
https://github.com/open-mpi/hwloc/commit/ac1f8db9a0790d2bf153711ff4cbf6101f89aace

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../hwloc/files/CVE-2022-47022.patch          | 76 +++++++++++++++++++
 meta-oe/recipes-extended/hwloc/hwloc_2.9.0.bb |  4 +-
 2 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/hwloc/files/CVE-2022-47022.patch

diff --git a/meta-oe/recipes-extended/hwloc/files/CVE-2022-47022.patch b/meta-oe/recipes-extended/hwloc/files/CVE-2022-47022.patch
new file mode 100644
index 000000000..1925e2605
--- /dev/null
+++ b/meta-oe/recipes-extended/hwloc/files/CVE-2022-47022.patch
@@ -0,0 +1,76 @@
+From ac1f8db9a0790d2bf153711ff4cbf6101f89aace Mon Sep 17 00:00:00 2001
+From: Brice Goglin <Brice.Goglin@inria.fr>
+Date: Wed, 23 Aug 2023 19:52:47 +0200
+Subject: [PATCH] linux: handle glibc cpuset allocation failures
+
+Closes #544
+CVE-2022-47022
+
+CVE: CVE-2022-47022
+
+Upstream-Status: Backport [https://github.com/open-mpi/hwloc/commit/ac1f8db9a0790d2bf153711ff4cbf6101f89aace]
+
+Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ hwloc/topology-linux.c | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/hwloc/topology-linux.c b/hwloc/topology-linux.c
+index 3f059465d..030076e7f 100644
+--- a/hwloc/topology-linux.c
++++ b/hwloc/topology-linux.c
+@@ -878,6 +878,8 @@ hwloc_linux_set_tid_cpubind(hwloc_topology_t topology __hwloc_attribute_unused,
+
+   setsize = CPU_ALLOC_SIZE(last+1);
+   plinux_set = CPU_ALLOC(last+1);
++  if (!plinux_set)
++    return -1;
+
+   CPU_ZERO_S(setsize, plinux_set);
+   hwloc_bitmap_foreach_begin(cpu, hwloc_set)
+@@ -958,7 +960,10 @@ hwloc_linux_find_kernel_nr_cpus(hwloc_topology_t topology)
+   while (1) {
+     cpu_set_t *set = CPU_ALLOC(nr_cpus);
+     size_t setsize = CPU_ALLOC_SIZE(nr_cpus);
+-    int err = sched_getaffinity(0, setsize, set); /* always works, unless setsize is too small */
++    int err;
++    if (!set)
++      return -1; /* caller will return an error, and we'll try again later */
++    err = sched_getaffinity(0, setsize, set); /* always works, unless setsize is too small */
+     CPU_FREE(set);
+     nr_cpus = setsize * 8; /* that's the value that was actually tested */
+     if (!err)
+@@ -986,8 +991,12 @@ hwloc_linux_get_tid_cpubind(hwloc_topology_t topology __hwloc_attribute_unused,
+
+   /* find the kernel nr_cpus so as to use a large enough cpu_set size */
+   kernel_nr_cpus = hwloc_linux_find_kernel_nr_cpus(topology);
++  if (kernel_nr_cpus < 0)
++    return -1;
+   setsize = CPU_ALLOC_SIZE(kernel_nr_cpus);
+   plinux_set = CPU_ALLOC(kernel_nr_cpus);
++  if (!plinux_set)
++    return -1;
+
+   err = sched_getaffinity(tid, setsize, plinux_set);
+
+@@ -1341,6 +1350,8 @@ hwloc_linux_set_thread_cpubind(hwloc_topology_t topology, pthread_t tid, hwloc_c
+
+      setsize = CPU_ALLOC_SIZE(last+1);
+      plinux_set = CPU_ALLOC(last+1);
++     if (!plinux_set)
++       return -1;
+
+      CPU_ZERO_S(setsize, plinux_set);
+      hwloc_bitmap_foreach_begin(cpu, hwloc_set)
+@@ -1432,6 +1443,8 @@ hwloc_linux_get_thread_cpubind(hwloc_topology_t topology, pthread_t tid, hwloc_b
+
+      setsize = CPU_ALLOC_SIZE(last+1);
+      plinux_set = CPU_ALLOC(last+1);
++     if (!plinux_set)
++       return -1;
+
+      err = pthread_getaffinity_np(tid, setsize, plinux_set);
+      if (err) {
+--
+2.40.0
diff --git a/meta-oe/recipes-extended/hwloc/hwloc_2.9.0.bb b/meta-oe/recipes-extended/hwloc/hwloc_2.9.0.bb
index 51ceb4c26..ee766c839 100644
--- a/meta-oe/recipes-extended/hwloc/hwloc_2.9.0.bb
+++ b/meta-oe/recipes-extended/hwloc/hwloc_2.9.0.bb
@@ -7,7 +7,9 @@ SECTION = "base"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=79179bb373cd55cbd834463a514fb714"
 
-SRC_URI = "https://www.open-mpi.org/software/${BPN}/v2.9/downloads/${BP}.tar.bz2"
+SRC_URI = "https://www.open-mpi.org/software/${BPN}/v2.9/downloads/${BP}.tar.bz2 \
+           file://CVE-2022-47022.patch \
+          "
 SRC_URI[sha256sum] = "2070e963596a2421b9af8eca43bdec113ee1107aaf7ccb475d4d3767a8856887"
 UPSTREAM_CHECK_URI = "https://www.open-mpi.org/software/hwloc/v2.9/"
 
-- 
2.40.0


