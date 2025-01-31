Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F97CC02192
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 12:51:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.18099.1738327887905474173
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jan 2025 04:51:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4126352c6f=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VCiiPO004767
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 12:51:27 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44gf7d0q1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 12:51:26 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 31 Jan 2025 04:51:24 -0800
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/5] redis: fix CVE-2023-41056
Date: Fri, 31 Jan 2025 12:50:56 +0000
Message-ID: <20250131125100.3348102-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=TfBstQQh c=1 sm=1 tr=0 ts=679cc74e cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=VdSt8ZQiCzkA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=7UKGVgRVAAAA:8 a=t7CeM3EgAAAA:8 a=hR66z_WBAAAA:8
 a=yb-YmlM--txVIeazqBIA:9 a=8Ox4Rr8FuIIqx5qz5MW0:22 a=FdTzh2GWekK77mhwV6Dw:22 a=rIFd7wX85fjrbk78xK_P:22
X-Proofpoint-GUID: TMQlUFpiJZC_DJmxaMLfLUaB0TEvjpl-
X-Proofpoint-ORIG-GUID: TMQlUFpiJZC_DJmxaMLfLUaB0TEvjpl-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2501310098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 12:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115191

From: Divya Chellam <divya.chellam@windriver.com>

Redis is an in-memory database that persists on disk.
Redis incorrectly handles resizing of memory buffers
which can result in integer overflow that leads to heap
overflow and potential remote code execution. This
issue has been patched in version 7.0.15 and 7.2.4.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-41056

Upstream-patch:
https://github.com/redis/redis/commit/e351099e1119fb89496be578f5232c61ce300224

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../redis/redis-7.0.13/CVE-2023-41056.patch   | 63 +++++++++++++++++++
 .../recipes-extended/redis/redis_7.0.13.bb    |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2023-41056.patch

diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2023-41056.patch b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2023-41056.patch
new file mode 100644
index 0000000000..036e62c8f0
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2023-41056.patch
@@ -0,0 +1,63 @@
+From e351099e1119fb89496be578f5232c61ce300224 Mon Sep 17 00:00:00 2001
+From: Oran Agra <oran@redislabs.com>
+Date: Sun, 7 Jan 2024 12:32:44 +0200
+Subject: [PATCH] Fix possible corruption in sdsResize (CVE-2023-41056)
+
+#11766 introduced a bug in sdsResize where it could forget to update
+the sds type in the sds header and then cause an overflow in sdsalloc.
+it looks like the only implication of that is a possible assertion in HLL,
+but it's hard to rule out possible heap corruption issues with clientsCronResizeQueryBuffer
+
+CVE: CVE-2023-41056
+
+Upstream-Status: Backport [https://github.com/redis/redis/commit/e351099e1119fb89496be578f5232c61ce300224]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ src/sds.c | 30 ++++++++++++++++--------------
+ 1 file changed, 16 insertions(+), 14 deletions(-)
+
+diff --git a/src/sds.c b/src/sds.c
+index 8e5863a..71490d5 100644
+--- a/src/sds.c
++++ b/src/sds.c
+@@ -348,20 +348,22 @@ sds sdsResize(sds s, size_t size, int would_regrow) {
+      * type. */
+     int use_realloc = (oldtype==type || (type < oldtype && type > SDS_TYPE_8));
+     size_t newlen = use_realloc ? oldhdrlen+size+1 : hdrlen+size+1;
+-    int alloc_already_optimal = 0;
+-    #if defined(USE_JEMALLOC)
+-        /* je_nallocx returns the expected allocation size for the newlen.
+-         * We aim to avoid calling realloc() when using Jemalloc if there is no
+-         * change in the allocation size, as it incurs a cost even if the
+-         * allocation size stays the same. */
+-        alloc_already_optimal = (je_nallocx(newlen, 0) == zmalloc_size(sh));
+-    #endif
+-
+-    if (use_realloc && !alloc_already_optimal) {
+-        newsh = s_realloc(sh, newlen);
+-        if (newsh == NULL) return NULL;
+-        s = (char*)newsh+oldhdrlen;
+-    } else if (!alloc_already_optimal) {
++
++    if (use_realloc) {
++        int alloc_already_optimal = 0;
++        #if defined(USE_JEMALLOC)
++            /* je_nallocx returns the expected allocation size for the newlen.
++             * We aim to avoid calling realloc() when using Jemalloc if there is no
++             * change in the allocation size, as it incurs a cost even if the
++             * allocation size stays the same. */
++            alloc_already_optimal = (je_nallocx(newlen, 0) == zmalloc_size(sh));
++        #endif
++        if (!alloc_already_optimal) {
++            newsh = s_realloc(sh, newlen);
++            if (newsh == NULL) return NULL;
++            s = (char*)newsh+oldhdrlen;
++        }
++    } else {
+         newsh = s_malloc(newlen);
+         if (newsh == NULL) return NULL;
+         memcpy((char*)newsh+hdrlen, s, len);
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-extended/redis/redis_7.0.13.bb b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
index e88ab4ddf5..dc5f9b7a89 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.13.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
            file://GNU_SOURCE-7.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
+           file://CVE-2023-41056.patch \
            "
 SRC_URI[sha256sum] = "97065774d5fb8388eb0d8913458decfcb167d356e40d31dd01cd30c1cc391673"
 
-- 
2.40.0


