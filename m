Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF559D111A8
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 09:00:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17352.1764579616852116794
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 01:00:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MMEATzm5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4430d93b62=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B18o1De2347630
	for <openembedded-devel@lists.openembedded.org>; Mon, 1 Dec 2025 09:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=xTz3SRlosInd7fF+XHk8
	IpQxzJNfC1wSDHilzOfFfFk=; b=MMEATzm5WN+KmUdGON4SzXQNuGvODhmETnsl
	Ll/S2PDkqNJOyoMQyoiDwpAkMJpJcYPOcgv1bjPLegsazt/NfA8UKo7nfwLlZNPL
	1PsM0fEX6KwJpt8COx6dUngBUHXiVqvM7z/gYzdD+/zp3/9fOOg0g0lF1Ku0Vl2o
	8yx7YjBrIIFXPAkZk21Lh2zE52aMjKFUsN+fKoiEFT+bwTGY68j1QUzy7+/qANav
	TulEwn3+aAvi9zEk0Dn+p9P4Jnqf59uF5ubqHlfBryRk6xV3CJ4oeZYCxXHRGUkB
	HoHGTVBvlTAkKITQuJhtDEsiGkodMlsO5o2ZBwhGFcNmVlAVvQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt69kq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 09:00:15 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 1 Dec 2025 01:00:14 -0800
Received: from pek-lpg-core1.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 1 Dec 2025 01:00:13 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 0/4][meta-python] Add 4 recipes
Date: Mon, 1 Dec 2025 17:00:08 +0800
Message-ID: <cover.1764579434.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.44.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA3MSBTYWx0ZWRfX/hCAa1xOPvKc
 su6G57wfYybBuYeqt1kBrjohH7jJBICiVtNtwGeOvyLLr9sR4lD7lcq12wFmTaxHPNe8qe91fkL
 n30jnDrhGMxRpzf/K4a4eRHc/8Ojt1dtc7CGrmgQyUGeVUv+st40lT7dR0oGUZazrOSf8xXeLKg
 dmDFTk24anEdB8Xx1peqd4d7H8oib8xPwifVwJw71bsg5PDgVgTHzvvGFX8d5dWZAQU2/qhFlpN
 JzJp9mPw+f4MgODZkQiFQCYEA6DNmLy9GQMIQNvSUcKcdX2C3EPy60qVn3QDcI6PllUXx5jwm13
 P5h7aRXim1ZWKGd2byxQvrHVrpswo/nxLPrs/o+HTTAZILLHEeTgiWcaEsREHpRFvM1fsXSqwMQ
 HhTqoJ2qY783VYYdgWdj6oy/aJ8FtQ==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=692d591f cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=Uslx_AZgY_B7M936HosA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: AXQVx-6LA4wDn4KiUdh65ghPWnIRSaJ7
X-Proofpoint-GUID: AXQVx-6LA4wDn4KiUdh65ghPWnIRSaJ7
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122195

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit e3257c3360a732914ae02a07a7c0fe8c845a492f:

  fuse3: Fix build with clang on riscv32 (2025-11-30 20:21:12 -0800)

are available in the Git repository at:

  https://github.com/robertlinux/meta-openembedded rbt/addrecipes
  https://github.com/robertlinux/meta-openembedded/tree/rbt/addrecipes

Robert Yang (4):
  python3-reportlab: Add it
  python3-tinycss2: Add it for python3-cssselect2
  python3-cssselect2: Add it for python3-svglib
  python3-svglib: Add it

 .../python/python3-cssselect2_0.8.0.bb           | 15 +++++++++++++++
 .../python/python3-reportlab_4.4.5.bb            | 11 +++++++++++
 .../python/python3-svglib_1.6.0.bb               | 16 ++++++++++++++++
 .../python/python3-tinycss2_1.5.1.bb             | 13 +++++++++++++
 4 files changed, 55 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cssselect2_0.8.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-reportlab_4.4.5.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-svglib_1.6.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-tinycss2_1.5.1.bb

-- 
2.44.3


