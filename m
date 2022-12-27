Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7074C4167B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 13:54:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.158267.1672149256756010833
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Dec 2022 05:54:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=excUgVK3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=936063681c=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BRDhmOb008170;
	Tue, 27 Dec 2022 13:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=WT58CqOFk3rl+j+PSKcQlIr7zyQ8x1WMkIOgDBi1Oe8=;
 b=excUgVK3tKC4XovKXDoh2hecUwIhQGIJtdLWp0bOO4q03MtRIdVbacuF90+RuNzYJDcx
 3soQeF8NfEzxuLhZkiP5Wz08mZ714cN2WGx0Z5ods6eGrGFco4LjG092XLwW9+PW4CPp
 BgfnKJaeDbx3UBzaBgvHr5xO3Z4+UYIXMZWJigLrVbCpcZe47B+8iiSlOTRRhFcmRGip
 pEtefRhXg8mqMBnxxmOID/GK1Znf7A398KyO2jt4j077c9nOHDQxIORfY26YmOhx0FOk
 EGyUAEgz5GSFAn+FqLdqgs02rBiX5rZVvV2bSqXBMTALkAQB43swzNtbx3tRz0viQvvv cQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnrda1r1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 27 Dec 2022 13:54:13 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 27 Dec 2022 05:54:13 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Tue, 27 Dec 2022 05:54:12 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH v2 0/2] Fixups for libxfce4ui and thunar-volman
Date: Tue, 27 Dec 2022 21:54:09 +0800
Message-ID: <20221227135411.5608-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: htYSterCTfBXN3Jka_J0jn7vPKkBK_bm
X-Proofpoint-GUID: htYSterCTfBXN3Jka_J0jn7vPKkBK_bm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-27_10,2022-12-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=827 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212270114
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 13:54:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100286

From: Kai Kang <kai.kang@windriver.com>

v2:
* fix fuzzy patch issue for libxfce4ui
* fix configure error for thunar-volman

Other update for xfce4 core recipes are as same as v1.

Kai Kang (2):
  libxfce4ui: 4.16.1 -> 4.18.0
  thunar-volman: 4.16.0 -> 4.18.0

 ...4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch | 10 +++++-----
 .../{libxfce4ui_4.16.1.bb => libxfce4ui_4.18.0.bb}     |  6 +++---
 ...thunar-volman_4.16.0.bb => thunar-volman_4.18.0.bb} |  8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.16.1.bb => libxfce4ui_4.18.0.bb} (84%)
 rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_4.16.0.bb => thunar-volman_4.18.0.bb} (56%)

-- 
2.34.1


