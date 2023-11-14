Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C88CC4167D
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 13:44:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12732.1699969482818524016
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 05:44:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=S5r2OQzB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9682dff3ee=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AEC9v4h016055;
	Tue, 14 Nov 2023 13:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=v+fuP
	+wh5DRZ7w4ZuJAHw20ZYLpGZVAwR4rYmEq9CR0=; b=S5r2OQzBRz9ToVwXS0pRM
	WbwefOr3Xj51o1PHm2+YgxgBuVLzMZiiA2wwrjEbz4KD/lTFFcLPN6reBsrnPsuj
	CmW0sRGYPISNIVpEibDd7e6eg6j2+LuA32bf4P6cMnolhStoPljOyX4Hm2uFo6oh
	i3l1JqJ4eiqKJVYYzflfC9w9tFCqtnYaiheh/YvZZ9MLQMkGzYaIhtIxy1CC126j
	Eii0uL1Q0Ya3kJ0VXzeOfZ/DKYgUsWU/AMkkrWRPBhtfYRfCBC3lQUAx1MU73URt
	MNZQAPLNf+chG7P21uQKyv2MawxdcHfPzETZ0sHq/zHXqWeozqwvLCbtMQtk+VBG
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ua0k6aj5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 14 Nov 2023 13:44:40 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:44:42 -0800
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-networking][kirkstone][PATCH 1/1] traceroute: upgrade 2.1.0 -> 2.1.3
Date: Tue, 14 Nov 2023 13:43:55 +0000
Message-ID: <20231114134355.269816-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: SeJTj3ot6c9FKQQU0AW7CjisIRID_f83
X-Proofpoint-ORIG-GUID: SeJTj3ot6c9FKQQU0AW7CjisIRID_f83
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_13,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=932 spamscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2311140106
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 13:44:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106716

From: Narpat Mali <narpat.mali@windriver.com>

This upgrade incorporates the CVE-2023-46316 fix and other bug fixes.

Changelog:
----------
- Interpret ipv4-mapped ipv6 addresses (::ffff:A.B.C.D) as true ipv4.
- Return back more robast poll(2) loop handling.
- Fix unprivileged ICMP tracerouting with Linux kernel >= 6.1 (Eric Dumazet, SF bug #14)
- Fix command line parsing in wrappers.

References:
https://security-tracker.debian.org/tracker/CVE-2023-46316
https://sourceforge.net/projects/traceroute/files/traceroute/traceroute-2.1.3/

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../traceroute/{traceroute_2.1.0.bb => traceroute_2.1.3.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-support/traceroute/{traceroute_2.1.0.bb => traceroute_2.1.3.bb} (91%)

diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb b/meta-networking/recipes-support/traceroute/traceroute_2.1.3.bb
similarity index 91%
rename from meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
rename to meta-networking/recipes-support/traceroute/traceroute_2.1.3.bb
index 9cac204998..ed75ba34de 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.1.3.bb
@@ -17,8 +17,7 @@ UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/traceroute/files/tracerou
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/traceroute/traceroute/${BP}/${BP}.tar.gz \
 "
-SRC_URI[md5sum] = "84d329d67abc3fb83fc8cb12aeaddaba"
-SRC_URI[sha256sum] = "3669d22a34d3f38ed50caba18cd525ba55c5c00d5465f2d20d7472e5d81603b6"
+SRC_URI[sha256sum] = "05ebc7aba28a9100f9bbae54ceecbf75c82ccf46bdfce8b5d64806459a7e0412"
 
 EXTRA_OEMAKE = "VPATH=${STAGING_LIBDIR}"
 LTOEXTRA += "-flto-partition=none"
-- 
2.40.0


