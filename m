Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BBCFC87FD3
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 03:46:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13535.1754624810966558706
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Aug 2025 20:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=031518fd30=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5782BEKu2978126;
	Thu, 7 Aug 2025 20:46:49 -0700
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48bpy7jm5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 07 Aug 2025 20:46:49 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 7 Aug 2025 20:46:48 -0700
Received: from pek-lpg-core1.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 7 Aug 2025 20:46:48 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <akuster808@gmail.com>
Subject: [walnascar][meta-python][PATCH] CVE-2025-53643.patch: Add CVE ID
Date: Fri, 8 Aug 2025 11:46:47 +0800
Message-ID: <20250808034647.1594755-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=G5McE8k5 c=1 sm=1 tr=0 ts=68957329 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=iVO35XYjajBOWhi6EbkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: _WfhAsMnkNghMCYOaMg6Fhao4taNbwKS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA4MDAyOSBTYWx0ZWRfX49hVVJCW44K3
 6DJOQg8WYmm6J6VLhWnHDUTsxIKOnXHPWPqs5gjrr2Pg1Psym8cJkya2NdWnB7PvCuEY8z7AT/f
 7hRwlBvfQkuuRCFtC5SF5e448VBmO3qoxOdo73viNwUYh6ou49d0v79dJqQqTtdagnVBoGLyj/F
 6DBBVFS21F0fXfsCs38QRTmOq8M4UBvjQwaxuv9tQHnD3IkjVJpHIy++xN+dwpNcCMb/+R7USg1
 JZ4oD8FY+m98VPS71V6Zwc5GTYXovIdQ6gRrG3cf/uo/tNt0QL7SKgqX8t1C4btxzntg1GN1dHz
 llEDsj5n8Z8OFG0hxqaY2mOdy8mqvCWkuk7qEZWh/gqk0Hnf+Rbos7eNrTgI4Q=
X-Proofpoint-ORIG-GUID: _WfhAsMnkNghMCYOaMg6Fhao4taNbwKS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Aug 2025 03:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118901

From: Robert Yang <liezhi.yang@windriver.com>

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../python/python3-aiohttp/CVE-2025-53643.patch                 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-53643.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-53643.patch
index fd8f83d563..e63fc8d779 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-53643.patch
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-53643.patch
@@ -7,6 +7,8 @@ Subject: [PATCH] Add trailer parsing logic (#11269) (#11287)
 
 CVE-2025-53643.patch
 
+CVE: CVE-2025-53643
+
 Upstream-Status: Backport
 [https://github.com/aio-libs/aiohttp/commit/e8d774f635dc6d1cd3174d0e38891da5de0e2b6a]
 
-- 
2.34.1


