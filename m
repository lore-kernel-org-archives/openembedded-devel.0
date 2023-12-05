Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E25C46CA3
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 14:50:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.101289.1701787848735824112
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Dec 2023 06:50:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nZDOVEd2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=07030a0134=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B58N9CL012897
	for <openembedded-devel@lists.openembedded.org>; Tue, 5 Dec 2023 06:50:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=fb+EY
	IiOFz+tuH9fNbCkZ82Iaj0meYN71DEzbPCn/bU=; b=nZDOVEd2PVGJPzbAtOzFc
	oKEio/senJBHZkYVa6UkNrMWLTuca+K3g4tgkwHqfiBhw9VZCZEqh0EBbRInfZbT
	3KAMXOQOEF2vOnrur5XYtKZcwLpu00Oj4eNwXCQiRWlSeHJ9tX3WXFSr87k4byEI
	u54kVE7gPX1uf3ZK6LxMhZwr5/65Zxogwdyo4XhNsp3Em0SmzA555lefaEkr168n
	IJEvgGuQiV/AY9gA9AgaagCZBOnFpSbuVfdAjSSQNbi+Izz6ijSRlSUK2jlpRrjl
	TWqs508q0TL/lTp/qY6QyWxFqSpGE5gNR7WCw/qeOSS/eu/ZyI0N9uBbq/j6ALtW
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ur0r4jpbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 05 Dec 2023 06:50:48 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 06:50:51 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 06:50:50 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 1/2] python3-pyudev: provide native
Date: Tue, 5 Dec 2023 22:50:31 +0800
Message-ID: <20231205145032.1116030-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: jEv6csmNCBVN3ahz7SzhGxji6WqFmml0
X-Proofpoint-ORIG-GUID: jEv6csmNCBVN3ahz7SzhGxji6WqFmml0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=763 adultscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2312050117
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Dec 2023 14:50:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107225

From: Kai Kang <kai.kang@windriver.com>

Add 'native' to BBCLASSEXTEND to provides python3-pyudev-native which is
required by lvm2 when package config 'dbus' is enabled.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb
index 6fcf346bc..8bc3afdb5 100644
--- a/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb
@@ -20,3 +20,5 @@ RDEPENDS:${PN} = "\
     ${PYTHON_PN}-fcntl \
     libudev \
 "
+
+BBCLASSEXTEND = "native"
-- 
2.34.1


