Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117E8E7718B
	for <webhook@archiver.kernel.org>; Wed, 25 Dec 2024 06:47:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3779.1735109255669883783
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 22:47:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=208984bcf2=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BP6N1do005343
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Dec 2024 06:47:34 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nmn8bngb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Dec 2024 06:47:34 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 24 Dec 2024 22:47:33 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 24 Dec 2024 22:47:32 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][scarthgap][PATCH 1/1] python3-tornado: Upgrade 6.4 -> 6.4.2
Date: Wed, 25 Dec 2024 06:47:28 +0000
Message-ID: <20241225064728.2610448-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: qxykfvnL2NSzC-33aLlTZ8ZfG2rJLqYF
X-Proofpoint-ORIG-GUID: qxykfvnL2NSzC-33aLlTZ8ZfG2rJLqYF
X-Authority-Analysis: v=2.4 cv=CeHy5Krl c=1 sm=1 tr=0 ts=676baa86 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=q7AoBUq9l0gA:10 a=RZcAm9yDv7YA:10 a=NEAV23lmAAAA:8 a=3gC6es9CAAAA:8 a=t7CeM3EgAAAA:8 a=uybToYfnUFCugM6UJvAA:9
 a=xP6Dwlo2m8u-hmdSfxCq:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-25_02,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412250058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Dec 2024 06:47:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114549

From: Soumya Sambu <soumya.sambu@windriver.com>

Changelog:
==========
https://github.com/tornadoweb/tornado/releases/tag/v6.4.2
https://github.com/tornadoweb/tornado/releases/tag/v6.4.1

Switch to python_setuptools_build_meta -
https://github.com/tornadoweb/tornado/commit/e71fb6e616e08838df55dddb494c96a80454f812

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../{python3-tornado_6.4.bb => python3-tornado_6.4.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.4.bb => python3-tornado_6.4.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.4.bb b/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-tornado_6.4.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
index b01c1cec2..751f32913 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.4.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
@@ -6,9 +6,9 @@ HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "72291fa6e6bc84e626589f1c29d90a5a6d593ef5ae68052ee2ef000dfd273dee"
+SRC_URI[sha256sum] = "92bad5b4746e9879fd7bf1eb21dce4e3fc5128d71601f80005afa39237ad620b"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 # Requires _compression which is currently located in misc
 RDEPENDS:${PN} += " \
-- 
2.40.0


