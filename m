Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A866BCA100B
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 05:44:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5428.1756878292724726167
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Sep 2025 22:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NygFhWYt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1341b3f309=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5835PB4E3443228
	for <openembedded-devel@lists.openembedded.org>; Wed, 3 Sep 2025 05:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=EHb9wb3VpQUFeUmlqJ7t
	kdlDVWntp9snUzYLZDmiILE=; b=NygFhWYtFb+6XgcIUH95t3kx+Q+s6zcqYWOI
	tf2pZ9202pR5sxF82jUjPl6MRmntyj9kjdG+oiHS6cihNmD+u1P+db2W2I7t746p
	VU7Kru40xQ20nPF4a3jVASb3BkFV5Hj8rovHIrK0NEIl7ilXkDtGJB9rnk2CJ50u
	ufEpMh3EfCAQvQDG4nYrtSk8xTzZS1pKOZafDxIuyF8e1BZCNisz/GIkGEoue9Nf
	Hw8fSVqdLwSPVMK0GSnn8huPpoGe4pajl53W9d1Y35bX1slZF69iioinLkqX1jNc
	6iQdPSMi/cRUIz4MQSqDvCtGlMD8km+OmRnRgBux0znmEJBCqw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48ur99un1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 05:44:50 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 2 Sep 2025 22:45:07 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][walnascar][PATCH 1/1] jq: Add tzdata to ptest rdeps
Date: Wed, 3 Sep 2025 11:14:14 +0530
Message-ID: <20250903054414.2209593-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Authority-Analysis: v=2.4 cv=FqYF/3rq c=1 sm=1 tr=0 ts=68b7d5d3 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=_C_H16-wfUB0HmBwDIAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: fu7-ek2Op1J-NbwwlkbdmZV3LWmcCDGZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDA1NCBTYWx0ZWRfX55DIVrs5n8U7
 kZIS1KOBzamNyEOSr3A3BDDUVvazFpppjYbe1eYffKwaE3wPMvOFmBACMx58UAynV9BEChoOsGy
 3k0kDS7ojLs5ThluWY23rcW4C8uNRjHe7R1Ck2q9CKLb7N+bzn5C+BWD2OH9NMBGrm2NGkKFJs3
 FWWC5HtT3aWdTkXZjNl7AxBkV7mMaWXcE8eVnsYAMmXlvh2NlcR3jfQfWoYONcCKnoci3/7bOJE
 AOLIr8J2IDuL/brYmIPm/Vp8ipZbZmcwXXzmkShFkV1pn7oB30AN12lPf/ctrnRkIQ5dOO4JqfQ
 viD0lsv7BE+td4/418onPU2jq3JnOrs6mACmFOkcwYTBKnmfTYdnKRpk7MEDdM=
X-Proofpoint-ORIG-GUID: fu7-ek2Op1J-NbwwlkbdmZV3LWmcCDGZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 05:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119189

From: Khem Raj <raj.khem@gmail.com>

This is needed for some ptests to pass

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 meta-oe/recipes-devtools/jq/jq_1.8.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.0.bb b/meta-oe/recipes-devtools/jq/jq_1.8.0.bb
index af35324b5f..4aaf27da9a 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.0.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.0.bb
@@ -43,4 +43,6 @@ do_install_ptest() {
     sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
 }
 
+RDEPENDS:${PN}-ptest += "tzdata"
+
 BBCLASSEXTEND = "native"
-- 
2.40.0


