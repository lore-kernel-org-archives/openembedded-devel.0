Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E939E7719F
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 12:22:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15798.1736770972721350634
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jan 2025 04:22:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3108b423bb=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DCGaDZ005499
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 12:22:52 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443fm89r5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 12:22:51 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 13 Jan 2025 04:22:49 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] libsass: upgrade 3.6.5 -> 3.6.6
Date: Mon, 13 Jan 2025 12:22:29 +0000
Message-ID: <20250113122229.662327-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=Mtmo63ae c=1 sm=1 tr=0 ts=6785059b cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=VdSt8ZQiCzkA:10 a=omOdbC7AAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=tSToJHe1_VnBJH02SlMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: S1LJ1Rm4U-lLocfiTnRMfnKsMkRVbjyX
X-Proofpoint-GUID: S1LJ1Rm4U-lLocfiTnRMfnKsMkRVbjyX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_04,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 phishscore=0 clxscore=1015 mlxlogscore=779 impostorscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501130104
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 12:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114829

From: Wang Mingyu <wangmy@fujitsu.com>

(master rev: 3f88224fb9c436bdd3ccd5d0268914f08625efbf)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta-oe/recipes-support/sass/libsass_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/sass/libsass_git.bb b/meta-oe/recipes-support/sass/libsass_git.bb
index 4d709fc52..f0824944b 100644
--- a/meta-oe/recipes-support/sass/libsass_git.bb
+++ b/meta-oe/recipes-support/sass/libsass_git.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8f34396ca205f5e119ee77aae91fa27d"
 inherit autotools
 
 SRC_URI = "git://github.com/sass/libsass.git;branch=master;protocol=https"
-SRCREV = "f6afdbb9288d20d1257122e71d88e53348a53af3"
-PV = "3.6.5"
+SRCREV = "7037f03fabeb2b18b5efa84403f5a6d7a990f460"
+PV = "3.6.6"
 
 S = "${WORKDIR}/git"
 
-- 
2.40.0


