Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F057AC87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 06:35:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16036.1754375710144869563
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 23:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03128fa20b=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 575615RY174069
	for <openembedded-devel@lists.openembedded.org>; Mon, 4 Aug 2025 23:35:09 -0700
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 489j6gt6cn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 23:35:09 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 4 Aug 2025 23:35:09 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Mon, 4 Aug 2025 23:35:08 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [walnascar][PATCH] debootstrap: correct the SRC_URI
Date: Tue, 5 Aug 2025 14:35:07 +0800
Message-ID: <20250805063507.688338-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=d5n1yQjE c=1 sm=1 tr=0 ts=6891a61d cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=2OwXVqhp2XgA:10 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=MWyxpO4tu7TAtteWhkgA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: dy7GXL6DNNmSiJExpjnRsAdgwFRdfNko
X-Proofpoint-ORIG-GUID: dy7GXL6DNNmSiJExpjnRsAdgwFRdfNko
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA0NiBTYWx0ZWRfX4k9/LQOKPWyB
 Dp7npHTa/ZJ1/ycPmMBxsMRnFf8CHLEa0lcWIvevDsdKAYWdTf5nCvz1CCta5lgEMistWTRdVpI
 P2Qi7h+zbLksc+8ADRyHO1RpyXrYld0IMPHQMGpqd5XmY9xFqVIf543DBzh/s1Ep2Oscmq+CxzG
 fXP5T9uHMO/4RlSZS8GuaWlkGX8HchMs24QRP2mog1jFIgpcjhBzh5BSvUYvEC1QDAzbNPTKXXt
 k9+oCMB8Mu4ejgbYoDmd5vMWMDqOzPccpHDpLnx3AyG33/S0H/xhO2HvsYNLBfV3fyvphjudetZ
 v9URzdoNqUiTBbQtqaNxrH/zpd6mgxn8FFbKp6hBzJ1nDXKc0AaVyUs2PF/EwI6xQoBlO2RiOvl
 Zn6Yd67A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2508020100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Aug 2025 06:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118875

From: Jiaying Song <jiaying.song.cn@windriver.com>

The original tarball URL is no longer valid, as it has been moved to an
archive location. This update points to the new location.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.140.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.140.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.140.bb
index 468a6c13b6..cc1ec63d73 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.140.bb
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.140.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=e7b45429ef05610abf91ac199fdb3a6e"
 
 SRC_URI  = "\
-    ${DEBIAN_MIRROR}/main/d/debootstrap/debootstrap_${PV}.tar.gz \
+    https://snapshot.debian.org/archive/debian/20250101T203853Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.gz \
     file://0001-support-to-override-usr-sbin-and-usr-share.patch \
     file://0002-support-to-override-usr-bin-arch-test.patch \
     file://0003-do-not-hardcode-the-full-path-of-dpkg.patch \
-- 
2.34.1


