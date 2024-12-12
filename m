Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 667EBE7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 04:54:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12954.1733979256716005276
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Dec 2024 20:54:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2076d8f70c=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC4jtDr015628
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 20:54:16 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cwy1w56m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 20:54:16 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 11 Dec 2024 20:54:15 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 11 Dec 2024 20:54:14 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][PATCH 1/1] python3-virtualenv: upgrade 20.26.5 -> 20.26.6
Date: Thu, 12 Dec 2024 04:54:09 +0000
Message-ID: <20241212045409.545605-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: eTpFgy4ppR3o7qFNbML5B2VckAtt9yY0
X-Authority-Analysis: v=2.4 cv=eePHf6EH c=1 sm=1 tr=0 ts=675a6c78 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=dXvAoEkxAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=GUm3sSd9h_iLUMGCE6EA:9 a=0YYwiJrbKVEA:10
 a=iJ39DRKJB4kz2P1Iyp3E:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: eTpFgy4ppR3o7qFNbML5B2VckAtt9yY0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-12_01,2024-12-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412120033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 04:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114287

From: Soumya Sambu <soumya.sambu@windriver.com>

Changelog:
https://virtualenv.pypa.io/en/latest/changelog.html#v20-26-6-2024-09-27

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 ...hon3-virtualenv_20.26.5.bb => python3-virtualenv_20.26.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.26.5.bb => python3-virtualenv_20.26.6.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.26.5.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.26.6.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.26.5.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.26.6.bb
index 82d60aeaa..e40561e8f 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.26.5.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.26.6.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "ce489cac131aa58f4b25e321d6d186171f78e6cb13fafbf32a840cee67733ff4"
+SRC_URI[sha256sum] = "280aede09a2a5c317e409a00102e7077c6432c5a38f0ef938e643805a7ad2c48"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.40.0


