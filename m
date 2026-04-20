Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79142F36C2C
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 06:55:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13841.1776666988431827232
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Apr 2026 23:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=S46BO1CY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8570224720=haiqing.bai@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K4fjpY2060311
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 06:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=9pWSgvk7XuiHHZTJrsFI
	0OAQek7Y49leu/hLuL9pb1U=; b=S46BO1CYVttoYFOwz6BtfbpxOLYgUiCLJmeG
	Yhk4Z1pYyJ4Sr5RxOwommyPWk4rV8rJf8hH1+BTimuNe4V/nSOsTb0GY2L0dBbs1
	iLdQH44CQF27D3rm9uQmL68Pn0dHyJUpiEPurPFoyYPtfrxEOIa1QevcIXOoeiWv
	wmQ8WfGbW/mDyolPOkvkwdqH5CjQXDph7/ng2l4xfsGllxizeQEqnUpOeUOGtQLu
	bcKLVcs9iflkzNQb28sNwnU9UrRu/NNmyLBmBgbLkuFzxJvOv8oF8RMOgqEK/Xp2
	nuP8A0kVQzIgFBJljTgv7JlYCPUOsB0+fu8GWyZOvME7EyIHlw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dky5y9j4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 06:18:34 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 19 Apr 2026 23:18:33 -0700
Received: from pek-lpggp2.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 19 Apr 2026 23:18:32 -0700
From: <haiqing.bai@windriver.com>
To: <haiqing.bai@windriver.com>, <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] pytesseract: replace deprecated md5sum with sha256sum
Date: Mon, 20 Apr 2026 14:18:26 +0800
Message-ID: <20260420061826.3616894-1-haiqing.bai@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA1OSBTYWx0ZWRfX3Lr2zVvcO5GI
 Opb+L+0apf48stOj+BCmxuP7SyudaRnPjwbOOnVoi/FIwJjn7js+4sTXlpNGa6rWqEvnGAnTz/J
 vwa8TvJ9N7BRZfN1nfi5RWZClBZww5UdtRoJOH8i4acDcZyZniCWMEcSZAngVh/MCZff6baCJER
 jRPHAuM7iIKbmnxkk/qJ+cwZsR3MIOmfvK3A5sY+CDyyBS8ezax8jCCQ7sdqb0C8B+MwrXdgXQr
 UfxldFdClXCmuLybYJXuindvoGfSQbxpnzi2m6mKRfx5vWpHa4Fr77UN015sbYWAJSnATc+ZWeO
 yoaH0nXph/YahemcyiUZB7tZ+5F1zoQDmJbH1xvJ1mxE9wfecKuEaVJqfQHhx+gfa+00r/92JV3
 RlTXIgXk0JD+QK62w/cWXQJHAGBuG7AmQYuOl6i4Fj+IJC9fOluYAlnxb40L2XaRhXbRzJu3p2v
 Y0B9wI0+Kz5bthMqTXA==
X-Proofpoint-GUID: 1POKKFQ91dem30nzoCRdt-egItJ_Tfm4
X-Proofpoint-ORIG-GUID: 1POKKFQ91dem30nzoCRdt-egItJ_Tfm4
X-Authority-Analysis: v=2.4 cv=Bp+tB4X5 c=1 sm=1 tr=0 ts=69e5c53a cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=e-jsTCErEfTkBcb9L0IA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200059
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 06:55:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126482

From: Haiqing Bai <haiqing.bai@windriver.com>

SRC_URI[md5sum] has been deprecated and replace it with
SRC_URI[sha256sum] for proper integrity verification.

Signed-off-by: Haiqing Bai <haiqing.bai@windriver.com>
---
 .../recipes-extended/python-pytesseract/pytesseract_0.3.13.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-extended/python-pytesseract/pytesseract_0.3.13.bb b/meta-python/recipes-extended/python-pytesseract/pytesseract_0.3.13.bb
index 0d8cfcb408..034568251b 100644
--- a/meta-python/recipes-extended/python-pytesseract/pytesseract_0.3.13.bb
+++ b/meta-python/recipes-extended/python-pytesseract/pytesseract_0.3.13.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/madmaze/pytesseract"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[md5sum] = "73f9645e59b437f064d05882b95832ce"
+SRC_URI[sha256sum] = "4bf5f880c99406f52a3cfc2633e42d9dc67615e69d8a509d74867d3baddb5db9"
 
 RDEPENDS:${PN}:append = " python3-packaging tesseract"
 
-- 
2.43.0


