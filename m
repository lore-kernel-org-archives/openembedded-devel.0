Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D02EB8FA5
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 09:23:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4472.1693992200349970406
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Sep 2023 02:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AIEehNMh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76132f5a4a=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3868VaZl031106
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Sep 2023 09:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=mfXER
	pl99pv7inUbRPa951Up+ZKMqHCpGBF63loC2RU=; b=AIEehNMhNGG/7dk1GHSOE
	S7kJ2d6uORokqk9bUn4VQaOguz/H/rzKfm8cHTB+Qp1yc51WYhCPWBAxXQc//+eL
	hQavXTvePsnuhoeTiKuIk5Pzeha3GJtnk5rvclcmiPc1d4a/ioDTp3nGT4l8HNe4
	By6EFwoV+lSIlUPHEbDGN3HF+Uk1e3DT5UCn5NnRNLu13mjW5y12TElAxAlkJe9Q
	00i+I4yTIhe2zcHE34UdwKK+j9QgZXDnZp1Tcd7z1k5jlTYHMOQ0REmhwuG9fZDY
	4iKCzGBq+K0UDjf5GzFEVZ5TkMpeGTNih1juNvFO/ig5ZHi4jbhBVIPNLKq0rlE0
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3suv15ucu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 09:23:19 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 6 Sep 2023 02:23:16 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] hwloc: fix CVE-2022-47022
Date: Wed, 6 Sep 2023 09:23:01 +0000
Message-ID: <20230906092301.830299-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: MLxO6D25wBhQL1k7WWBQrffVwxgRCyX4
X-Proofpoint-GUID: MLxO6D25wBhQL1k7WWBQrffVwxgRCyX4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_03,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=575 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0 impostorscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309060079
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 09:23:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104773

From: Soumya Sambu <soumya.sambu@windriver.com>

An issue was discovered in open-mpi hwloc 2.1.0 allows attackers to cause
a denial of service or other unspecified impacts via glibc-cpuset in topology-linux.c.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-47022
https://github.com/open-mpi/hwloc/issues/544

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../hwloc/files/CVE-2022-47022.patch          | 77 +++++++++++++++++++
 .../recipes-extended/hwloc/hwloc_1.11.13.bb   |  4 +-
 2 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/hwloc/files/CVE-2022-47022.patch

diff --git a/meta-oe/recipes-extended/hwloc/files/CVE-2022-47022.patch b/meta-oe/recipes-extended/hwloc/files/CVE-2022-47022.patch
new file mode 100644
index 000000000..bfeb9b405
--- /dev/null
+++ b/meta-oe/recipes-extended/hwloc/files/CVE-2022-47022.patch
@@ -0,0 +1,77 @@
+From ac1f8db9a0790d2bf153711ff4cbf6101f89aace Mon Sep 17 00:00:00 2001
+From: Brice Goglin <Brice.Goglin@inria.fr>
+Date: Wed, 23 Aug 2023 19:52:47 +0200
+Subject: [PATCH] linux: handle glibc cpuset allocation failures
+
+Closes #544
+CVE-2022-47022
+
+Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
+
+CVE: CVE-2022-47022
+
+Upstream-Status: Backport [https://github.com/open-mpi/hwloc/commit/ac1f8db9a0790d2bf153711ff4cbf6101f89aace]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/topology-linux.c | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/src/topology-linux.c b/src/topology-linux.c
+index 62c3b44..86be150 100644
+--- a/src/topology-linux.c
++++ b/src/topology-linux.c
+@@ -623,6 +623,8 @@ hwloc_linux_set_tid_cpubind(hwloc_topology_t topology __hwloc_attribute_unused,
+
+   setsize = CPU_ALLOC_SIZE(last+1);
+   plinux_set = CPU_ALLOC(last+1);
++  if (!plinux_set)
++    return -1;
+
+   CPU_ZERO_S(setsize, plinux_set);
+   hwloc_bitmap_foreach_begin(cpu, hwloc_set)
+@@ -703,7 +705,10 @@ hwloc_linux_find_kernel_nr_cpus(hwloc_topology_t topology)
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
+@@ -732,8 +737,12 @@ hwloc_linux_get_tid_cpubind(hwloc_topology_t topology __hwloc_attribute_unused,
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
+@@ -1092,6 +1101,8 @@ hwloc_linux_set_thread_cpubind(hwloc_topology_t topology, pthread_t tid, hwloc_c
+
+      setsize = CPU_ALLOC_SIZE(last+1);
+      plinux_set = CPU_ALLOC(last+1);
++     if (!plinux_set)
++       return -1;
+
+      CPU_ZERO_S(setsize, plinux_set);
+      hwloc_bitmap_foreach_begin(cpu, hwloc_set)
+@@ -1184,6 +1195,8 @@ hwloc_linux_get_thread_cpubind(hwloc_topology_t topology, pthread_t tid, hwloc_b
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
diff --git a/meta-oe/recipes-extended/hwloc/hwloc_1.11.13.bb b/meta-oe/recipes-extended/hwloc/hwloc_1.11.13.bb
index e6fed584f..83c85dbe3 100644
--- a/meta-oe/recipes-extended/hwloc/hwloc_1.11.13.bb
+++ b/meta-oe/recipes-extended/hwloc/hwloc_1.11.13.bb
@@ -7,7 +7,9 @@ SECTION = "base"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3282e20dc3cec311deda3c6d4b1f990b"
 
-SRC_URI = "https://www.open-mpi.org/software/${BPN}/v1.11/downloads/${BP}.tar.bz2"
+SRC_URI = "https://www.open-mpi.org/software/${BPN}/v1.11/downloads/${BP}.tar.bz2 \
+           file://CVE-2022-47022.patch \
+          "
 SRC_URI[md5sum] = "3c792e23c209e9e1bafe9bdbc613d401"
 SRC_URI[sha256sum] = "a4494b7765f517c0990d1c7f09d98cb87755bb6b841e4e2cbfebca1b14bac9c8"
 
-- 
2.40.0


