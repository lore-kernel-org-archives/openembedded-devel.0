Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC361C5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 15:48:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15112.1748965730672067135
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jun 2025 08:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82498c4fa0=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5537qYQu027226
	for <openembedded-devel@lists.openembedded.org>; Tue, 3 Jun 2025 08:48:50 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rs48t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 03 Jun 2025 08:48:50 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 3 Jun 2025 08:48:49 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 3 Jun 2025 08:48:48 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH V2 1/1] tcpreplay: fix CVE-2024-22654
Date: Tue, 3 Jun 2025 21:18:44 +0530
Message-ID: <20250603154844.1770149-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDEzNyBTYWx0ZWRfX7Yw7fNp8wL51 h5l304G3Va4+1UpEdR1g1ulJfOo9bteyvgYGi8J5fz2vxT7PaErjxHxKZBNGPXNQWUkQ2lEgki/ 3NsWXxkZ6EioCCg1vZKngmIEaE2+b1N3kXoa5Vt7rC0hByv3Fb4enU5/NUKUUPcNoERrQpQuxlA
 7jjnHAFYYHpjby2DhyYLtYtPe1SQROjQtdM3iGKrGRJP/CmyXYjx0IBc6PEQLEfoVsXrP7usnsn vmPSUVhDEn5UCyHht1RYCBmSvV6t4JZE/vmjtuNq2kimoCTtyhq2LXgl2E9aA8osjnRyZK5+MVB zLDCp6G39AFqjsFGGdsI63DwaT2ZRxQrTv+rGz7zkcyedP/CMFWfD5KYouO/YJpNIfA0FHRKUyp
 PA/pjcZdLy0N92pWHM/v9XfY8VFsBk0pnIzzvc3xMzX/cI116VN1ac27qGMBzSkV6UqQGV6Y
X-Authority-Analysis: v=2.4 cv=PvyTbxM3 c=1 sm=1 tr=0 ts=683f1962 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=Q-fNiiVtAAAA:8 a=pGLkceISAAAA:8 a=LIUGxCksFKRzbQeI5wkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: yr8qCOdh6bkUbxnk53hTbymG1B1eS7mP
X-Proofpoint-ORIG-GUID: yr8qCOdh6bkUbxnk53hTbymG1B1eS7mP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506030137
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jun 2025 15:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117722

From: Archana Polampalli <archana.polampalli@windriver.com>

tcpreplay v4.4.4 was discovered to contain an infinite loop via the tcprewrite function at get.c.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../tcpreplay/CVE-2024-22654-0001.patch       | 90 +++++++++++++++++++
 .../tcpreplay/CVE-2024-22654-0002.patch       | 35 ++++++++
 .../tcpreplay/tcpreplay_4.4.4.bb              |  2 +
 3 files changed, 127 insertions(+)
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2024-22654-0001.patch
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2024-22654-0002.patch

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2024-22654-0001.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2024-22654-0001.patch
new file mode 100644
index 0000000000..26dedba8d4
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2024-22654-0001.patch
@@ -0,0 +1,90 @@
+From 5b5644356693f5c68dd4295e86f24f1d0a515d60 Mon Sep 17 00:00:00 2001
+From: Fred Klassen <fred.klassen@broadcom.com>
+Date: Sat, 1 Jun 2024 11:46:10 -0700
+Subject: [PATCH 1/2] Bug #827 PR# 842: add check for IPv6 extension header
+ length
+
+CVE: CVE-2024-22654
+
+Upstream-Status: Backport [https://github.com/appneta/tcpreplay/commit/5b5644356693f5c68dd4295e86f24f1d0a515d60]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/common/get.c | 29 +++++++++++++++++++++--------
+ 1 file changed, 21 insertions(+), 8 deletions(-)
+
+diff --git a/src/common/get.c b/src/common/get.c
+index 2d91116..89fe95b 100644
+--- a/src/common/get.c
++++ b/src/common/get.c
+@@ -41,8 +41,8 @@ extern const char pcap_version[];
+ static void *get_ipv6_next(struct tcpr_ipv6_ext_hdr_base *exthdr, const u_char *end_ptr);
+ 
+ /**
+- * Depending on what version of libpcap/WinPcap there are different ways to get
+- * the version of the libpcap/WinPcap library.  This presents a unified way to
++ * Depending on what version of libpcap there are different ways to get
++ * the version of the libpcap library.  This presents a unified way to
+  * get that information.
+  */
+ const char *
+@@ -196,8 +196,15 @@ parse_metadata(const u_char *pktdata,
+                uint32_t *vlan_offset)
+ {
+     bool done = false;
+-    int res = 0;
+-    while (!done && res == 0) {
++    assert(next_protocol);
++    assert(l2len);
++    assert(l2offset);
++    assert(vlan_offset);
++
++    if (!pktdata || !datalen)
++        errx(-1, "parse_metadata: invalid L2 parameters: pktdata=0x%p len=%d", pktdata, datalen);
++
++    while (!done) {
+         switch (*next_protocol) {
+         case ETHERTYPE_VLAN:
+         case ETHERTYPE_Q_IN_Q:
+@@ -205,18 +212,22 @@ parse_metadata(const u_char *pktdata,
+             if (*vlan_offset == 0)
+                 *vlan_offset = *l2len;
+ 
+-            res = parse_vlan(pktdata, datalen, next_protocol, l2len);
++            if (parse_vlan(pktdata, datalen, next_protocol, l2len))
++                return -1;
++
+             break;
+         case ETHERTYPE_MPLS:
+         case ETHERTYPE_MPLS_MULTI:
+-            res = parse_mpls(pktdata, datalen, next_protocol, l2len, l2offset);
++            if (parse_mpls(pktdata, datalen, next_protocol, l2len, l2offset))
++                return -1;
++
+             break;
+         default:
+             done = true;
+         }
+     }
+ 
+-    return res;
++    return 0;
+ }
+ 
+ /*
+@@ -605,9 +616,11 @@ get_layer4_v6(const ipv6_hdr_t *ip6_hdr, const u_char *end_ptr)
+          * no further processing, either TCP, UDP, ICMP, etc...
+          */
+         default:
+-            if (proto != ip6_hdr->ip_nh) {
++            if (proto != ip6_hdr->ip_nh && next) {
+                 dbgx(3, "Returning byte offset of this ext header: %u", IPV6_EXTLEN_TO_BYTES(next->ip_len));
+                 next = (void *)((u_char *)next + IPV6_EXTLEN_TO_BYTES(next->ip_len));
++                if ((u_char*)next > end_ptr)
++                    return NULL;
+             } else {
+                 dbgx(3, "%s", "Returning end of IPv6 Header");
+             }
+-- 
+2.40.0
+
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


