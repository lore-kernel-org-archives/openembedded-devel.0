Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908B8E77188
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:47:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5445.1735811219452374958
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jan 2025 01:46:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3097652356=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5028b2ET019835
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Jan 2025 09:46:58 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43t8a83wrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 02 Jan 2025 09:46:58 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 2 Jan 2025 01:46:57 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 2 Jan 2025 01:46:56 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [meta-networking][scarthgap][PATCH] chrony: fix do_fetch error
Date: Thu, 2 Jan 2025 17:46:55 +0800
Message-ID: <20250102094655.3226061-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: kx634oqT_4vz2XyzNkABR8tR_mQQZma1
X-Proofpoint-ORIG-GUID: kx634oqT_4vz2XyzNkABR8tR_mQQZma1
X-Authority-Analysis: v=2.4 cv=f8qyBPyM c=1 sm=1 tr=0 ts=67766092 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VdSt8ZQiCzkA:10 a=dIu3SnmMAAAA:8 a=wxZTIvLhAAAA:8 a=t7CeM3EgAAAA:8 a=G-axfLThCGkl4GXj2LMA:9 a=Ua9G7VpiFza3u12uuhVB:22
 a=pEOY4cZjM94Q10G0-i-k:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxlogscore=760 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501020083
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jan 2025 09:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114617

From: Jiaying Song <jiaying.song.cn@windriver.com>

Change the SRC_URI to the correct value due to the following error:
WARNING: chrony-4.5-r0.wr2401 do_fetch: Failed to fetch URL https://download.tuxfamily.org/chrony/chrony-4.5.tar.gz, attempting MIRRORS if available

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-networking/recipes-support/chrony/chrony_4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.5.bb b/meta-networking/recipes-support/chrony/chrony_4.5.bb
index ed26e5987..ae46ef1fd 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.5.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.5.bb
@@ -30,7 +30,7 @@ SECTION = "net"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "https://download.tuxfamily.org/chrony/chrony-${PV}.tar.gz \
+SRC_URI = "https://chrony-project.org/releases/chrony-${PV}.tar.gz \
     file://chrony.conf \
     file://chronyd \
     file://arm_eabi.patch \
-- 
2.25.1


