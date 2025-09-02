Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD80ACA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 10:24:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.73752.1756808689432458218
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Sep 2025 03:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oSCWR9jE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13400b166d=divya.chellam@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58256RLL2297812
	for <openembedded-devel@lists.openembedded.org>; Tue, 2 Sep 2025 03:24:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=zkiuGqEDxAf1LE3g+ml0
	d5Ss0KzkYPAQPFRJxPhzVdM=; b=oSCWR9jEXdlsee1l+Uluy56LBsT/juHGCpxK
	uHgeFl3TRlKzIAsENctITsgmxbxPzUObmQSf4bM7/5XavnWc1HDQzXekraPcv9rv
	CMEFOyfiNaBxaEUfL3QgJFKyAiTelywR4aYbpkvP8510rqmDfQjY8c+iuoWTnsBa
	/YiyZ/6ANaLSFYHisZ2Vb2DSiPI/d3VpaVW7K4xK3yABDnmgrVFiEKzJwo6Vmcr0
	3+gjSqVDsWGGJEONDk3d2Hk+s0/bp479bM7YLBhU1tQg5i0E8DWBCNXXpSv9Qf0d
	QbfcJq9nRL//ZnM6K1ZXdmmcdhE1jRJaE9nvN6kOaaWR+JSN0A==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48uvjytdfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 03:24:48 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 2 Sep 2025 03:24:43 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][walnascar][PATCH 1/1] jq: upgrade 1.8.0 -> 1.8.1
Date: Tue, 2 Sep 2025 15:54:12 +0530
Message-ID: <20250902102412.1660642-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=68b6c5f1 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=yJojWOMRYYMA:10 a=hJg87lDkAAAA:8 a=NEAV23lmAAAA:8
 a=omOdbC7AAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=TJFTA64w_ypFgygPFeAA:9
 a=aQNO0PxwaYDquvvsCUJe:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: qMxf_r6v8lbJmOyBNwPUOp0CUbyICVFI
X-Proofpoint-ORIG-GUID: qMxf_r6v8lbJmOyBNwPUOp0CUbyICVFI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDEwMiBTYWx0ZWRfX0Ig0FfnCY5PS
 BJlL9OAYpQWfjXKrUbF0RAPi2YmmNYKAI/pfKWg5LhgFOvUeU4NhY1Ka77G2JSZ+WLp9Crbsxav
 7p/CuYGfUhSHz2K230NKrAeyQJ+lP3kkyl1y2nkImgtHUf1Ujz3yYdq1Rc+u+vjojbOGykMEi9b
 ikvsLpovXVnGoZulaz228X1JYWOTlSDnn6Y3+HrBp3kKMIijBcPFXyOjeV3BZBdfg0qzD1stnTe
 LPPzlEnlxt4p0hfT6vA2atKrXBxTnTmAw1+bq4OatCfp4ERWJfjbwjoXWUU8FNLu9JA1NXz5sdQ
 BGRHH1vd6+GGCCTNgWVIeacyiNGaJt2PbK3A/q61EpU1fun72542Z9FH59C7gQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 10:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119178

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Add LICENSE notice of NetBSD's strptime() to COPYING

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 meta-oe/recipes-devtools/jq/{jq_1.8.0.bb => jq_1.8.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/jq/{jq_1.8.0.bb => jq_1.8.1.bb} (90%)

diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.0.bb b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
similarity index 90%
rename from meta-oe/recipes-devtools/jq/jq_1.8.0.bb
rename to meta-oe/recipes-devtools/jq/jq_1.8.1.bb
index af35324b5f..8d92f65877 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.0.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -5,14 +5,14 @@ DESCRIPTION = "jq is like sed for JSON data, you can use it to slice and \
 HOMEPAGE = "https://jqlang.github.io/jq/"
 BUGTRACKER = "https://github.com/jqlang/jq/issues"
 SECTION = "utils"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=08ffb5ac7e7e6bfc66968b89f01f512a"
+LICENSE = "MIT & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=cf7fcb0a1def4a7ad62c028f7d0dca47"
 
 GITHUB_BASE_URI = "https://github.com/jqlang/${BPN}/releases/"
 SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://run-ptest \
     "
-SRC_URI[sha256sum] = "91811577f91d9a6195ff50c2bffec9b72c8429dc05ec3ea022fd95c06d2b319c"
+SRC_URI[sha256sum] = "2be64e7129cecb11d5906290eba10af694fb9e3e7f9fc208a311dc33ca837eb0"
 
 inherit autotools github-releases ptest
 
-- 
2.40.0


