Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D31E77197
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 02:45:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.23196.1735872338111673400
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jan 2025 18:45:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3098baa6a4=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50328MWB015533
	for <openembedded-devel@lists.openembedded.org>; Fri, 3 Jan 2025 02:45:37 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43t8a84q0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 03 Jan 2025 02:45:37 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 2 Jan 2025 18:45:35 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 2 Jan 2025 18:45:34 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Changqing.Li@windriver.com>
Subject: [meta-python][scarthgap][PATCH] python3-pylint: fix do_fetch error
Date: Fri, 3 Jan 2025 10:45:34 +0800
Message-ID: <20250103024534.3465552-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: _0rjF93HqGpOo69Kd_V4ROzmz2jqGnEG
X-Proofpoint-ORIG-GUID: _0rjF93HqGpOo69Kd_V4ROzmz2jqGnEG
X-Authority-Analysis: v=2.4 cv=f8qyBPyM c=1 sm=1 tr=0 ts=67774f51 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VdSt8ZQiCzkA:10 a=XHfBerL2AAAA:8 a=bLZqKDXHAAAA:8 a=NEAV23lmAAAA:8 a=hfkZIEdAkf5ywNToyOsA:9 a=qb9JOAHM4hE5jB-puYrx:22
 a=SM0NOtVXJcAQk9PFKD3C:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxlogscore=947 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501030022
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jan 2025 02:45:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114622

From: Jiaying Song <jsong-cn@ala-lpggp7.wrs.com>

Change the SRC_URI to the correct value due to the following error:
WARNING: python3-pylint-3.1.0-r0 do_fetch: Failed to fetch URL git://github.com/pylint-dev/pylint;branch=maintenance/3.1.x;protocol=https, attempting MIRRORS if available

Signed-off-by: Jiaying Song <jsong-cn@ala-lpggp7.wrs.com>
---
 meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb b/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
index 12f4f908a..4c49acaf1 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE= "http://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRC_URI += "git://github.com/pylint-dev/pylint;branch=maintenance/3.1.x;protocol=https \
+SRC_URI += "git://github.com/pylint-dev/pylint;branch=main;protocol=https \
            file://0001-Adjust-test-expectations-for-ptest.patch \
            file://run-ptest \
            "
-- 
2.25.1


