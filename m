Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D986EB64DC
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 16:57:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1296.1687280242953970240
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jun 2023 09:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=o3OUamLu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=553544667c=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35K9kYYg001022
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 16:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=/Lquk7zgFAc2zF13kx7xM6rZJy5omGAreC2CtBAa6H8=;
 b=o3OUamLufXntnqrWcLZ04xxch7o1DMil+VQpwaww6xAPZalUWqRi1/HIRuf2KozoI+F7
 Y9JwQAxB75RVBRuHQT7OHwfdkbY4JKDTzz39LeD06Exf/84/4cLMQPWz+Gb36GrdQGBQ
 yZ8/TFcZ9vltbAfAbg2At8IcgSUt1Xuo7alHELh4G0c9rPgL3wg2bqRVDhnMysxSvyB5
 DU6Y4Yyo2gEXXSALoVuUMKc5veGAA4uXo8ClyOzoBIxTdxww6PzYhQ2mek+qPHrikf8v
 by54PNJpovI7fs5tu0fJ8mz2HTgOyhc4qfD3BoRSNXOP9+hynpkoSTRHt2MY7Jl4k9l1 SQ== 
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r9220juev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 16:57:21 +0000
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 09:57:19 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>
Subject: [meta-networking][kirkstone][PATCH 1/1] frr: fix for CVE-2023-31489
Date: Tue, 20 Jun 2023 16:56:41 +0000
Message-ID: <20230620165641.3705245-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: ZBWXR6oBhBV5hSlNXLrO6EqChd8kGCyo
X-Proofpoint-ORIG-GUID: ZBWXR6oBhBV5hSlNXLrO6EqChd8kGCyo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-20_12,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=995 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306200153
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 16:57:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103464

From: Narpat Mali <narpat.mali@windriver.com>

An issue found in Frrouting bgpd v.8.4.2 allows a remote attacker to
cause a denial of service via the bgp_capability_llgr() function.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-31489
https://github.com/FRRouting/frr/issues/13098

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../frr/frr/CVE-2023-31489.patch              | 52 +++++++++++++++++++
 .../recipes-protocols/frr/frr_8.2.2.bb        |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-31489.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-31489.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-31489.patch
new file mode 100644
index 0000000000..6fd6792087
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-31489.patch
@@ -0,0 +1,52 @@
+From 4e1fc50394df0b69f32a9cf8ba8e1dcee2c67563 Mon Sep 17 00:00:00 2001
+From: Narpat Mali <narpat.mali@windriver.com>
+Date: Tue, 20 Jun 2023 14:01:46 +0000
+Subject: [PATCH] bgpd: Check 7 bytes for Long-lived Graceful-Restart
+ capability
+
+It's not 4 bytes, it was assuming the same as Graceful-Restart tuples.
+LLGR has more 3 bytes (Long-lived Stale Time).
+
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+
+CVE: CVE-2023-31489
+
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/b1d33ec293e8e36fbb8766252f3b016d268e31ce]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ bgpd/bgp_open.c | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/bgpd/bgp_open.c b/bgpd/bgp_open.c
+index 6bdefd0e9..ad56149f6 100644
+--- a/bgpd/bgp_open.c
++++ b/bgpd/bgp_open.c
+@@ -578,12 +578,24 @@ static int bgp_capability_restart(struct peer *peer,
+ static int bgp_capability_llgr(struct peer *peer,
+			       struct capability_header *caphdr)
+ {
++/*
++ * +--------------------------------------------------+
++ * | Address Family Identifier (16 bits)              |
++ * +--------------------------------------------------+
++ * | Subsequent Address Family Identifier (8 bits)    |
++ * +--------------------------------------------------+
++ * | Flags for Address Family (8 bits)                |
++ * +--------------------------------------------------+
++ * | Long-lived Stale Time (24 bits)                  |
++ * +--------------------------------------------------+
++ */
++#define BGP_CAP_LLGR_MIN_PACKET_LEN 7
+	struct stream *s = BGP_INPUT(peer);
+	size_t end = stream_get_getp(s) + caphdr->length;
+
+	SET_FLAG(peer->cap, PEER_CAP_LLGR_RCV);
+
+-	while (stream_get_getp(s) + 4 <= end) {
++	while (stream_get_getp(s) + BGP_CAP_LLGR_MIN_PACKET_LEN <= end) {
+		afi_t afi;
+		safi_t safi;
+		iana_afi_t pkt_afi = stream_getw(s);
+--
+2.40.0
diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
index 80f4729e1f..800c377742 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.2 \
            file://CVE-2022-37035.patch \
            file://CVE-2022-37032.patch \
            file://CVE-2022-42917.patch \
+           file://CVE-2023-31489.patch \
            file://frr.pam \
 	      "
 
-- 
2.40.0


