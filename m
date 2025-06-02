Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1928EC54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 15:51:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.53264.1748879495304419247
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jun 2025 08:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82488074cc=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552AuMrC028586
	for <openembedded-devel@lists.openembedded.org>; Mon, 2 Jun 2025 15:51:34 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46yrr8a53r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 15:51:34 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 2 Jun 2025 08:51:10 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 2 Jun 2025 08:51:08 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH  2/2] tcpreplay: fix CVE-2024-22654
Date: Mon, 2 Jun 2025 21:21:26 +0530
Message-ID: <20250602155126.1197444-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250602155126.1197444-1-archana.polampalli@windriver.com>
References: <20250602155126.1197444-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDEyOSBTYWx0ZWRfX+C2Yc3J87IWe 7G009bCCk84WiIctuP1ZeSiFBb0F41TZFcw+YwNG2Y0UPYskJwXK3TmZ3kTi0QQ9EY6TbhCeIEa 0YqrbcezC/5FRawXxcWSwo4XGPgRBekaeFaFCFb9LKxtiFCuMoooq33sxG6wsxJoZQQqcdXzf3+
 K3OVgod28p4U1//PqkIp3uKBeG2PiitQ5eYnliSB/tRv237XQJGVdCvLysaXUCs29TvRl6qh7Sr O2YruaPtUybqwJf3d/NKSeQhGhCz98JhE4tssJWc4TAiLvDfQ1gJDdYFBraB4DzkYN8mkgaodU7 aPZcYfIw/cyfziNSFhrBJ5iXrnf/ZFhCLzxQJNoNONg2hgcXtwT84TkEpSMvwJJzltvSxQ4zpcY
 n52OmBScdDRH8pGT3GLlQATA9nyWfZDfEyjraoWo+xdihbGeMHUxsNyn4yOeZehIO/HJVuHo
X-Proofpoint-GUID: yXrkfubqnOspZyXIKvF9MG7fYIcl1x_G
X-Authority-Analysis: v=2.4 cv=b9Gy4sGx c=1 sm=1 tr=0 ts=683dc886 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=zrF71jlvRmYy0Kh3cNEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: yXrkfubqnOspZyXIKvF9MG7fYIcl1x_G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_06,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2506020129
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 15:51:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117713

From: Archana Polampalli <archana.polampalli@windriver.com>

tcpreplay v4.4.4 was discovered to contain an infinite loop via the tcprewrite function at get.c.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../tcpreplay/CVE-2024-22654-0002.patch       | 35 +++++++++++++++++++
 .../tcpreplay/tcpreplay_4.4.4.bb              |  2 ++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2024-22654-0002.patch

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2024-22654-0002.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2024-22654-0002.patch
new file mode 100644
index 0000000000..bcf560c0e5
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2024-22654-0002.patch
@@ -0,0 +1,35 @@
+From 52ed63329b37ae83cb86504db2c9deb6a91e2fe9 Mon Sep 17 00:00:00 2001
+From: Gabriel Ganne <gabriel.ganne@gmail.com>
+Date: Sun, 21 Jan 2024 08:59:10 +0100
+Subject: [PATCH 2/2] ipv6 - add check for extension header length
+
+Fixes #827
+
+Signed-off-by: Gabriel Ganne <gabriel.ganne@gmail.com>
+
+CVE: CVE-2024-22654
+
+Upstream-Status: Backport [https://github.com/appneta/tcpreplay/commit/52ed63329b37ae83cb86504db2c9deb6a91e2fe9]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/common/get.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/common/get.c b/src/common/get.c
+index 89fe95b..c31de5d 100644
+--- a/src/common/get.c
++++ b/src/common/get.c
+@@ -676,6 +676,10 @@ get_ipv6_next(struct tcpr_ipv6_ext_hdr_base *exthdr, const u_char *end_ptr)
+     case TCPR_IPV6_NH_HBH:
+     case TCPR_IPV6_NH_AH:
+         extlen = IPV6_EXTLEN_TO_BYTES(exthdr->ip_len);
++        if (extlen == 0) {
++            dbg(3, "Malformed IPv6 extension header...");
++            return NULL;
++        }
+         dbgx(3,
+              "Looks like we're an ext header (0x%hhx).  Jumping %u bytes"
+              " to the next",
+--
+2.40.0
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
index 03a6cfdba5..a784190868 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
@@ -13,6 +13,8 @@ SRC_URI = "https://github.com/appneta/${BPN}/releases/download/v${PV}/${BP}.tar.
     file://0001-configure.ac-do-not-run-conftest-in-case-of-cross-co.patch \
     file://CVE-2023-4256.patch \
     file://CVE-2023-43279.patch \
+    file://CVE-2024-22654-0001.patch \
+    file://CVE-2024-22654-0002.patch \
 "
 
 SRC_URI[sha256sum] = "44f18fb6d3470ecaf77a51b901a119dae16da5be4d4140ffbb2785e37ad6d4bf"
-- 
2.40.0


