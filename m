Return-Path: <rob.woolley@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E06FC4167B
	for <webhook@archiver.kernel.org>; Sat,  2 Dec 2023 03:10:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11380.1701486604434874175
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Dec 2023 19:10:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZPNvFH/c;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=070003c0e1=rob.woolley@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B234103020400;
	Sat, 2 Dec 2023 03:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=P24Jm
	fg6hbf39loAPcs8rz/Xooton9P1fbacUDI6urU=; b=ZPNvFH/cEU0rj9lyRucNW
	lmLiX/ke9E6uTqhNq4B5AH6XJdiqkx62+GYlj/2zYL5NiBNhiOv+q5hXeG/Jeror
	l/B+7nYBv7YVL5ZPPLZzf0BUZQ/JFYWaQ0DOR+b3CVRKdFhGsIiXEZ5PSpqlCAsJ
	iilpXIa5fGFVIYRbHq7IVAhHF70JKh5u8KA7fwDb4rNztcTs2GMSlFBtDeWUNw/c
	l5a+uwYlf1bx+UAtdpY4dO7oyFuBHvJ7eumUP8gYxnDGldguy+klP/tCyxjJtpR1
	3BVAOCXdNWJ2dTUil3sItLdIsUS8/IxDykjWyos2R/dNZYtUGTL4IZkyeXgazkvZ
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uquj680u5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 02 Dec 2023 03:10:02 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Dec 2023 19:09:58 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 1 Dec 2023 19:09:58 -0800
From: Rob Woolley <rob.woolley@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>, <alex.kanavin@gmail.com>
Subject: [kirkstone][PATCH 0/2] Add sipconfig.py support to sip3
Date: Fri, 1 Dec 2023 19:09:48 -0800
Message-ID: <20231202030950.3357721-1-rob.woolley@windriver.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: yMmaN-ssFH5KX02g8WC7BfATV3nlvdMQ
X-Proofpoint-ORIG-GUID: yMmaN-ssFH5KX02g8WC7BfATV3nlvdMQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=279 mlxscore=0 adultscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2312020021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 02 Dec 2023 03:10:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107194

Some packages in meta-ros, like qt-gui-cpp, need sipconfig.py to be
present in python3-sip3.  Changes are required to ensure that the
sip tools execute successfully and that paths from the host machine
don't get included in the SIP configuration file.

Rob Woolley (2):
  sip3: Add sipconfig.py
  sip3: Add py_ssize_t_clean argument

 ...ean-argument-to-the-module-directive.patch | 17679 ++++++++++++++++
 meta-oe/recipes-devtools/sip/sip3_4.19.23.bb  |    21 +-
 2 files changed, 17699 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/sip/sip3/added-the-py_ssize_t_clean-argument-to-the-module-directive.patch

-- 
2.39.0


