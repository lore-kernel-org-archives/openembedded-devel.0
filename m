Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC688D116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 09:00:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17353.1764579617328278167
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 01:00:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WbhRUjr6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4430d93b62=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B18o1Df2347630
	for <openembedded-devel@lists.openembedded.org>; Mon, 1 Dec 2025 09:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=brzsU9xMlZUqNxJVxUhbITdkzGOe2IG32YBOsT66l+c=; b=WbhRUjr6W+lL
	E58HlezNHba470fsKmSIdzzMEJUr7Wmuffbj7uvmFtCGvtO99hs/uCny3SEuYriW
	KLv4L/KNzZgtkb8tCSFVblTb+GrHAnn/LVcXAK2nnoDRkN25NZ4vd66uhU8LsDbk
	0fwYLGO1OgBrDf17Cf0R+12uUlkz+CbxsAcHxgi5yMzFgwfP9f8sycZ/OeGc3Nhw
	zdPkx03u7Lspe9/GNj+2I52q4AFXii6Huj4GhTlUxK7wyDJRrMTYd/duxCUIKVbJ
	Gq3xhmTtlKHv4OL8J5vVqDEqDpLf1AHnM4VHEGnrPUIzVNcVxz40xje9Q3MSINxS
	+gyZqsSqMg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt69kq3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 09:00:16 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 1 Dec 2025 01:00:15 -0800
Received: from pek-lpg-core1.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 1 Dec 2025 01:00:14 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 1/4] python3-reportlab: Add it
Date: Mon, 1 Dec 2025 17:00:09 +0800
Message-ID: <eb09824fabfdf21aaad3de44ec57b0dd171f2eec.1764579434.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.44.3
In-Reply-To: <cover.1764579434.git.liezhi.yang@windriver.com>
References: <cover.1764579434.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA3MSBTYWx0ZWRfX0vKPGHutCs2/
 vUp8TxEH3GhPWO7ylSq80fus9FNPMBOJ5s5e8MdoVyNfmyLmhvYSofjSsZMy+95syQ/LRZFdQGg
 jd7txb9kM1q4Bal8FvuAYMt7Uh75kocrrTMJDXQ+lxC9Nopit9Bm3VtmtXbizeIC9KiG+XbF6mh
 /gBqxdkVjOXk1Y7nbCEhdDzLXQ2GMM1kA5NWjvIEkafeWPkR0G2MVxV1PgJljgfnTluquaAaKDj
 6ichQmAoLMfsNmwNVeSID1A8pl7Uj9QRGCypb/X/4d/wQaEIyH7Y6NV0nasbEUduYWhZSoYbZTI
 XQyMC/tLc5KAAKPjqBdgrajqy9ijiyqppwq6dwvc0qLwEIz0t1QCaopaM/RBMzEGyLdCy62/oga
 dZ6jfLUcVw6GKAh5pOOgmCZJTGQ84A==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=692d5920 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=JTXmVxphDbFFQacdDgIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: njmcGhHwfBq3aCJj_w0JMMcJBS0QD8sS
X-Proofpoint-GUID: njmcGhHwfBq3aCJj_w0JMMcJBS0QD8sS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 09:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122197

From: Robert Yang <liezhi.yang@windriver.com>

Reportlab is an Open Source Python library for generating PDFs and graphics.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../python/python3-reportlab_4.4.5.bb                 | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-reportlab_4.4.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-reportlab_4.4.5.bb b/meta-python/recipes-devtools/python/python3-reportlab_4.4.5.bb
new file mode 100644
index 0000000000..4c411d5716
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-reportlab_4.4.5.bb
@@ -0,0 +1,11 @@
+SUMMARY = "The Reportlab Toolkit."
+DESCRIPTION = "An Open Source Python library for generating PDFs and graphics."
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cf24392f451ff6710fca1e96cefa0424"
+
+SRC_URI[sha256sum] = "0457d642aa76df7b36b0235349904c58d8f9c606a872456ed04436aafadc1510"
+
+inherit pypi python_setuptools_build_meta
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.44.3


