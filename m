Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD2CCFB5195
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 05:46:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73467.1775533828603277283
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 20:50:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Dz9C5/uu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8557271aef=haiqing.bai@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6371NwDg2477736
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Apr 2026 03:20:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Dcj1TyC6KO+Nfnp33bTTHC6JucGV1bzQq8acAOp/3mw=; b=Dz9C5/uuidd7
	nI7hx51YOo0Dt6LDXT3fKJndegbGxJ4pp36f3OkUaA03x1vT3Q3TFySvWBvNkg/u
	7aHGpoF4hYbaPL+pGAcAYox4xrYORGnuO/UQH4W9Xo30GFBiIrUjIoEYRqXAPIzs
	nc1TNVxRhqU9OKldedQZYHkWzxa18FDvhBCh1aSRtTb/intnzBeElzCWvxJ8hBM8
	LNfr8IRF6pxdHrCOnqr11L1N0ltP1HIdf6m6VmL7AKPpcc5s2McfB5eT5+FklSBN
	uroAjX+XxesF5rhtDDvFRflsUHZzIOzgfXyc7UTwG0x7Z1p3M9yPUh7SaxsfQ7Eh
	OE8Z4IQXgA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrqg72u-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 03:20:40 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 6 Apr 2026 20:20:38 -0700
Received: from ala-lpd-susbld.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 6 Apr 2026 20:20:38 -0700
From: <haiqing.bai@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <haiqing.bai@windriver.com>
Subject: [meta-python][PATCH v2 2/2] Revert "python3-stopit: add missing run-time dependencies"
Date: Tue, 7 Apr 2026 03:20:38 +0000
Message-ID: <20260407032038.1474520-2-haiqing.bai@windriver.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407032038.1474520-1-haiqing.bai@windriver.com>
References: <20260407032038.1474520-1-haiqing.bai@windriver.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=RPCD2Yi+ c=1 sm=1 tr=0 ts=69d47808 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8 a=PvzDHI2NW1FHjX33bo4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: FlOVrG4-HgGpO144mj9ObdF_W9tFc2nK
X-Proofpoint-GUID: FlOVrG4-HgGpO144mj9ObdF_W9tFc2nK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAyOSBTYWx0ZWRfXwPUtR5GUS67a
 PcLf3cUEWw2nrgpEs/Or0moHPuGfivkI54dCVPGnsU+nUvbs3MSwkEPUX142nk9DKmWPiLYrwBf
 /k99Jue4PApzJxYql2F5g6RA6/ylFFpVEygpXbMGZNhGUkaNGuAIutIXDFKBa3n8d6pJ2H9y2yf
 G7UZQ9ux+6Gg54/6odyjfB3qOXZqsX0x/IHBpzqFzRcwD/ycnTM9EbEZvnevT6mvxia5JAOASHB
 CywDa7zk64wTu9Gt6SiUS+daCTXPYRTtFcyaIYKKAMap2K8dr/KWDFaBsuOtH5d1y3a2JTsMaoR
 APfOdWSLXBBRBFdCN9brLydPD06guRfuF5VBMqdg+ilgzEfImCOgbbrV9Onm4QAGwD4LTBzD8OZ
 P1k/B9YDPfTLuT5pUhASlHxT4E6qvKopjLcb+vcli42jQaAw64jYha3v65GTfwDdEqSfhyPPBRn
 fwwBFeZJRcJtx/Acyjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070029
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 05:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126072

From: "Bai, Haiqing" <Haiqing.Bai@windriver.com>

This reverts commit 812f091414b34dbebe4a3990c9039cbaadc4dd71.

The runtime dependency on python3-setuptools is no longer needed
since the patch 0001-Drop-the-deprecated-pkg_resources.patch
replaced the pkg_resources usage with importlib.metadata, which
is part of the Python 3.8+ standard library. Keeping this RDEPENDS
pulls in an unnecessary dependency on the target system.
---
 meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb b/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb
index a83adffcd2..2cf7742a90 100644
--- a/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb
@@ -14,8 +14,4 @@ SRC_URI += "\
     file://0001-Drop-the-deprecated-pkg_resources.patch \
 "
 
-RDEPENDS:${PN} += "\
-    python3-setuptools \
-    "
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.53.0


