Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4560CC83F2C
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 05:02:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.41746.1693803730141343591
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Sep 2023 22:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=s921IdJY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=761126b472=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3844lSuW016884
	for <openembedded-devel@lists.openembedded.org>; Mon, 4 Sep 2023 05:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=YTHUD
	Jc58sIDE+3wExYVigVjag8qsKV/7EK1oWnzlKs=; b=s921IdJYqakvD9hgRl4X2
	vkj4dTzLZUY7bzOww0rs6xvD6G5UowXmtW0rU8mTZz3Owmu2XFBfNQPC4Cqqbjwb
	R1dTi8LESdyIBHPK7NVa5BYtVykEUOuIVhxStG7BezcezEh0w+Qszvd4CcGn15wM
	4ShzaW3zzirlNeFP82L+bSDAMQamxJG5C8PX7Pdh0dv1rUgoqYImFv9LRNJhAT0V
	9Y2R/M/IHAdwFfBiIFCmH85A1mvRINObT8AusLy2fsoh+9UAqTcNr6fPFNiiHtyR
	UUDLFiFW2JHUS9FbJBEaIQyaUh9gaguAa2HOHUVTrokUb3JomLUPEZEHOAFEuPWJ
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sw33k05he-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 05:02:08 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 3 Sep 2023 22:02:02 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH 1/1] hwloc: fix CVE-2022-47022
Date: Mon, 4 Sep 2023 05:01:47 +0000
Message-ID: <20230904050147.3882380-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: ThK04PnM-zv4RzaNeZiF4jZU5asIg22I
X-Proofpoint-ORIG-GUID: ThK04PnM-zv4RzaNeZiF4jZU5asIg22I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-04_02,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=552
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309040044
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 05:02:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104703

From: Yogita Urade <yogita.urade@windriver.com>

An issue was discovered in open-mpi hwloc 2.1.0 allows attackers to cause
a denial of service or other unspecified impacts via glibc-cpuset in topology-linux.c.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-47022
https://github.com/open-mpi/hwloc/issues/544

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../hwloc/files/CVE-2022-47022.patch          | 77 +++++++++++++++++++
 meta-oe/recipes-extended/hwloc/hwloc_2.9.2.bb |  4 +-
 2 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/hwloc/files/CVE-2022-47022.patch

diff --git a/meta-oe/recipes-extended/hwloc/files/CVE-2022-47022.patch b/meta-oe/recipes-extended/hwloc/files/CVE-2022-47022.patch
new file mode 100644
index 0000000000..c981b68b70
--- /dev/null
+++ b/meta-oe/recipes-extended/hwloc/files/CVE-2022-47022.patch
@@ -0,0 +1,77 @@
+From ac1f8db9a0790d2bf153711ff4cbf6101f89aace Mon Sep 17 00:00:00 2001
+From: Brice Goglin <Brice.Goglin@inria.fr>
+Date: Thu, 31 Aug 2023 09:28:34 +0000
+Subject: [PATCH] linux: handle glibc cpuset allocation failures
+
+Closes #544
+CVE-2022-47022
+
+Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
+
+CVE: CVE-2022-47022
+
+Upstream-Status: Backport[https://github.com/open-mpi/hwloc/commit/ac1f8db9a0790d2bf153711ff4cbf6101f89aace]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ hwloc/topology-linux.c | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/hwloc/topology-linux.c b/hwloc/topology-linux.c
+index c7b63d2..fd6745e 100644
+--- a/hwloc/topology-linux.c
++++ b/hwloc/topology-linux.c
+@@ -870,6 +870,8 @@ hwloc_linux_set_tid_cpubind(hwloc_topology_t topology __hwloc_attribute_unused,
+
+   setsize = CPU_ALLOC_SIZE(last+1);
+   plinux_set = CPU_ALLOC(last+1);
++  if (!plinux_set)
++    return -1;
+
+   CPU_ZERO_S(setsize, plinux_set);
+   hwloc_bitmap_foreach_begin(cpu, hwloc_set)
+@@ -950,7 +952,10 @@ hwloc_linux_find_kernel_nr_cpus(hwloc_topology_t topology)
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
+@@ -978,8 +983,12 @@ hwloc_linux_get_tid_cpubind(hwloc_topology_t topology __hwloc_attribute_unused,
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
+@@ -1333,6 +1342,8 @@ hwloc_linux_set_thread_cpubind(hwloc_topology_t topology, pthread_t tid, hwloc_c
+
+      setsize = CPU_ALLOC_SIZE(last+1);
+      plinux_set = CPU_ALLOC(last+1);
++     if (!plinux_set)
++       return -1;
+
+      CPU_ZERO_S(setsize, plinux_set);
+      hwloc_bitmap_foreach_begin(cpu, hwloc_set)
+@@ -1424,6 +1435,8 @@ hwloc_linux_get_thread_cpubind(hwloc_topology_t topology, pthread_t tid, hwloc_b
+
+      setsize = CPU_ALLOC_SIZE(last+1);
+      plinux_set = CPU_ALLOC(last+1);
++     if (!plinux_set)
++       return -1;
+
+      err = pthread_getaffinity_np(tid, setsize, plinux_set);
+      if (err) {
+--
+2.35.5
diff --git a/meta-oe/recipes-extended/hwloc/hwloc_2.9.2.bb b/meta-oe/recipes-extended/hwloc/hwloc_2.9.2.bb
index 487b7da130..bcb615f73a 100644
--- a/meta-oe/recipes-extended/hwloc/hwloc_2.9.2.bb
+++ b/meta-oe/recipes-extended/hwloc/hwloc_2.9.2.bb
@@ -7,7 +7,9 @@ SECTION = "base"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=79179bb373cd55cbd834463a514fb714"
 
-SRC_URI = "https://www.open-mpi.org/software/${BPN}/v2.9/downloads/${BP}.tar.bz2"
+SRC_URI = "https://www.open-mpi.org/software/${BPN}/v2.9/downloads/${BP}.tar.bz2 \
+           file://CVE-2022-47022.patch \
+          "
 SRC_URI[sha256sum] = "0a87fdf677f8b00b567d229b6320bf6b25c693edaa43e0b85268d999d6b060cf"
 UPSTREAM_CHECK_URI = "https://www.open-mpi.org/software/hwloc/v2.9/"
 
-- 
2.35.5


