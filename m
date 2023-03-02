Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D371C7EE30
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 00:24:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2627.1677716670151578675
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Mar 2023 16:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Hl3sCn4u;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=24254468ab=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3220LRdC023222
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Mar 2023 00:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=f03GPSvWuJmSUoqRNYu4g1uvdKUBXycVVrxQKaVsa2g=;
 b=Hl3sCn4uabxIj0DZAkA2WRWzFGNdYI3aaNulEBFbiQ6UryWJ8LIByjZVFWGFdLPYLOG7
 7+S7sEMQPgefCVPJSTpNRxiKhBiQiVAcZ76BZuGzTqaiKtt6d09idure/gTzi1qfF2Kv
 SMub7UGF6Gpll4av3F4bTBID7jSrhPMkZmyup0jFl8MGowno2VBNfcxUrbwzz+p2vALy
 EGe7YSqJXpd5ZO0FOYn8n2nzlADuuUk2HF8t3GNij9t0VlshovFfHnRK7PPxj3qnX9F7
 pWVaulXy+g6SsYP4pwkblL2OCNMQS1hblXvZWL2gBOyGcev0DaL+kiPiRkakEFRAIywq dw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybmkcvhc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 00:24:29 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 1 Mar 2023 16:24:27 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Wed, 1 Mar 2023 16:24:27 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 3/3] librelp: make inline errors be warnings in debug build
Date: Wed, 1 Mar 2023 16:24:27 -0800
Message-ID: <20230302002427.1935420-3-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230302002427.1935420-1-Randy.MacLeod@windriver.com>
References: <20230302002427.1935420-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: St-rW-qk3ikZZdDf6JzyB0xOEWu3fFkj
X-Proofpoint-ORIG-GUID: St-rW-qk3ikZZdDf6JzyB0xOEWu3fFkj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_16,2023-03-01_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=884 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303010194
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 00:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101319

With DEBUG_BUILD = "1", the following error occurs:

   src/relpsess.c:95:1: error:
      inlining failed in call to 'relpSessFreePermittedPeers': function not considered for inlining [-Werror=inline]

so use the compiler flag '-Wno-error=inline' for DEBUG_OPTIMIZATION only.

Tracked by upstream bug: https://github.com/rsyslog/librelp/issues/256
but it's looking like a toolchain bug.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
index da3e9a137..e7b79ad03 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
@@ -14,3 +14,7 @@ SRCREV = "b421f56d9ee31a966058d23bd23c966221c91396"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
+
+DEBUG_OPTIMIZATION:append = " -Wno-error=inline"
+
+
-- 
2.39.0


