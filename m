Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5D4EE7FE6
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 12:37:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.37709.1694176638584982579
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Sep 2023 05:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HE8e/fPo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=761562b37d=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 388ANXES024463;
	Fri, 8 Sep 2023 12:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=PiXUK
	Sgd8ksX2rRnnSRxf47oQCJiTzBJUqOT73RBkyk=; b=HE8e/fPoIgSfSS18ZIexS
	RQuWN0oTa8cF4RFlqayn8wpLmqLmps4Mzm4OIC5kwpXeGuweuCq8NnbQSNVCNdW8
	KKeDL4i6CxM9Jmy81D+nkrla143Wy/1J3Kdrg3bGxrWMpZUgFMeTdv7JJtA5jR3L
	7tCtqSgfp5vRsQHrIvlEvQNZaJeTqEgXokm7uqlfvaJIAGuDJa+qWkhh4FNm/bVt
	CnQXIRX/zghhz2eBNUHnU+FkOlAlwsW54yxpnx9FN0MqzKMjCtlnclPo+nnJugTv
	fbuZM/6OwMdCttxT4W1TwJwbIFrgBl3HshyKHtHYY+SrUtdvVa4M6cTfMaTW65pN
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sw33k4dnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 08 Sep 2023 12:37:17 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 8 Sep 2023 05:37:14 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-networking][kirkstone][PATCH 1/1] frr: Fix CVE-2023-41909
Date: Fri, 8 Sep 2023 12:36:56 +0000
Message-ID: <20230908123656.3464265-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: nTYq2C-tgI4MeTymvg7rYhQPjyRguECi
X-Proofpoint-ORIG-GUID: nTYq2C-tgI4MeTymvg7rYhQPjyRguECi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_09,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309080117
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Sep 2023 12:37:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104805

From: Narpat Mali <narpat.mali@windriver.com>

An issue was discovered in FRRouting FRR through 9.0. bgp_nlri_parse_flowspec
in bgpd/bgp_flowspec.c processes malformed requests with no attributes,
leading to a NULL pointer dereference.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-41909
https://security-tracker.debian.org/tracker/CVE-2023-41909

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../frr/frr/CVE-2023-41909.patch              | 42 +++++++++++++++++++
 .../recipes-protocols/frr/frr_8.2.2.bb        |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-41909.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-41909.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-41909.patch
new file mode 100644
index 0000000000..b27d7af166
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-41909.patch
@@ -0,0 +1,42 @@
+From 5966b6a1fc72d3698d08199922cc4f42ea7fc9eb Mon Sep 17 00:00:00 2001
+From: Donald Sharp <sharpd@nvidia.com>
+Date: Fri, 8 Sep 2023 11:46:12 +0000
+Subject: [PATCH] bgpd: Limit flowspec to no attribute means a implicit
+ withdrawal
+
+All other parsing functions done from bgp_nlri_parse() assume
+no attributes == an implicit withdrawal.  Let's move
+bgp_nlri_parse_flowspec() into the same alignment.
+
+Reported-by: Matteo Memelli <mmemelli@amazon.it>
+Signed-off-by: Donald Sharp <sharpd@nvidia.com>
+
+CVE: CVE-2023-41909
+
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/cfd04dcb3e689754a72507d086ba3b9709fc5ed8]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ bgpd/bgp_flowspec.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/bgpd/bgp_flowspec.c b/bgpd/bgp_flowspec.c
+index 341cfe9d0..3e2b1ac49 100644
+--- a/bgpd/bgp_flowspec.c
++++ b/bgpd/bgp_flowspec.c
+@@ -112,6 +112,13 @@ int bgp_nlri_parse_flowspec(struct peer *peer, struct attr *attr,
+	afi = packet->afi;
+	safi = packet->safi;
+
++	/*
++	 * All other AFI/SAFI's treat no attribute as a implicit
++	 * withdraw.  Flowspec should as well.
++	 */
++	if (!attr)
++		withdraw = 1;
++
+	if (packet->length >= FLOWSPEC_NLRI_SIZELIMIT_EXTENDED) {
+		flog_err(EC_BGP_FLOWSPEC_PACKET,
+			 "BGP flowspec nlri length maximum reached (%u)",
+--
+2.40.0
diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
index 1897eb2abd..d226d5411d 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.2 \
            file://CVE-2022-43681.patch \
            file://CVE-2023-31489.patch \
            file://CVE-2023-31490.patch \
+           file://CVE-2023-41909.patch \
            file://frr.pam \
 	      "
 
-- 
2.40.0


