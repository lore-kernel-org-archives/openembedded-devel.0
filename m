Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 378B3E6748D
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 09:27:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.77060.1766395630603027721
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 01:27:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bNrC6I59;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=445155024b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM7uDbr1332570
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 01:27:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=pFYIV0+mqp1XgFWWH2tx
	2Ib1w8d6lGOve0SP+ADNjZY=; b=bNrC6I59f73PFY9DyxzftcsRHPDxcXXWScRo
	N7kCBv9VfsEE4YkpXza+lJ37s9VVPGi5Q9Mgls8B4QKhZezwLPSDiBQ3MofhgxpO
	Y4RiGgR/35R6U8KZaw3Q5pKG/s6B8BBLWUqaI8TNjryBFrzSu2tVDVRbITria013
	qDzahlpv2zY1FOtygU3dQCWg10z89RJ9M5O9nptnV30ksI6wBHOJuVNIi7+/H9b4
	+Ufr/Ki3lhnhVQSddKjB610SeyPGJRLidpqrSsaxYZzlCmAAa97mLhFfjXx8UStf
	/iQTQ8qnJ+e/EMAx0wZ3QcKnJbvnrJ55SFJb6jHZcs4JT3zhmQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5qy4sdxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 01:27:10 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 22 Dec 2025 01:27:09 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 22 Dec 2025 01:27:08 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] switchtec-user: Correct SRCREV
Date: Mon, 22 Dec 2025 17:27:03 +0800
Message-ID: <20251222092703.2788851-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: tbr9QRxPzz5NnIAwZ0ISf2jBgIWKMS1f
X-Authority-Analysis: v=2.4 cv=Q+vfIo2a c=1 sm=1 tr=0 ts=69490eee cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=5qBrznAP3dz6ixwHqT4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4NSBTYWx0ZWRfXylCKgjvjeXWp
 0UJzwglKP6uot84UoZTvCgFVrUKCkGaib8XXVH921ZZLq5mavyUoMUZETvCggecTEb4iUwUw/9C
 VYKFATKM6sG4l4lJV9hwhDFuVKJ7xt6yvF/knWMQS64Q/GdoOfY3+fU5fVqQMseciU8p2qPEWFk
 2HaGOCoM4R8qszJzTaqXepqO63ewu5o+JzOLaa9EFbriuqtAOvNGLO4EdEmNNr+isabvLGruf1s
 VbNP3iMaaJ09VFDcgUEVgDIY0YlC47rQxxANxS/dkoV6pcTltSI63v0eB31CtMmzqExpF22cIQQ
 lTUsJ8zay1jmIWJdgicBd4F1idTJDRyVTGJHDfWg211QDol1d5B85lLhxqmkusj1O6RF0WXsLi6
 jlT3Lq81Y1SlmhZgFmPr5qC5P6mQ9auR/LN8ib/8UVaDT53S0graW1sxzjOpj5Wv827O1iyZEWK
 DUQA0pxgbjdhr0KPnmQ==
X-Proofpoint-ORIG-GUID: tbr9QRxPzz5NnIAwZ0ISf2jBgIWKMS1f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220085
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 09:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122785

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-support/switchtec-user/switchtec-user_4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/switchtec-user/switchtec-user_4.3.bb b/meta-oe/recipes-support/switchtec-user/switchtec-user_4.3.bb
index 17567e27bd..050c9d1c43 100644
--- a/meta-oe/recipes-support/switchtec-user/switchtec-user_4.3.bb
+++ b/meta-oe/recipes-support/switchtec-user/switchtec-user_4.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3d6b07c89629cff2990d2e8e1f4c2382"
 DEPENDS = "ncurses openssl"
 
 SRC_URI = "git://github.com/Microsemi/switchtec-user.git;protocol=https;branch=master;tag=v${PV}"
-SRC_URI[sha256sum] = "a715e46d8498418dbb8a2519318ba0714ee148151d7e4a7fa5e27770a2f6888f"
+SRCREV = "abe2a1d2367a118469a7b94bc4dd856aaf856eec"
 
 
 inherit autotools-brokensep pkgconfig
-- 
2.34.1


