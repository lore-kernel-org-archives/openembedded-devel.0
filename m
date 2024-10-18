Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9931D3C551
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 06:59:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16895.1729234791216084352
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Oct 2024 23:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=002138ef9d=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I4sXGq025804
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 06:59:50 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42a3esjx7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 06:59:50 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 23:59:49 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.43) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 23:59:48 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Changqing.Li@windriver.com>
Subject: [PATCH][meta-oe][scarthgap][master] wireguard-tools: fix do_fetch error
Date: Fri, 18 Oct 2024 14:59:47 +0800
Message-ID: <20241018065947.2591919-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Abt-_gHy9U9sQfx5_L-chSBbXpmAGRFG
X-Proofpoint-ORIG-GUID: Abt-_gHy9U9sQfx5_L-chSBbXpmAGRFG
X-Authority-Analysis: v=2.4 cv=cPWysUeN c=1 sm=1 tr=0 ts=67120766 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=DAUX931o1VcA:10 a=t7CeM3EgAAAA:8 a=UGG5zPGqAAAA:8 a=NEAV23lmAAAA:8 a=G-axfLThCGkl4GXj2LMA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=17ibUXfGiVyGqR_YBevW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-18_02,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 mlxlogscore=866
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410180042
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 06:59:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112973

From: Jiaying Song <jiaying.song.cn@windriver.com>

Change the SRC_URI to the correct value due to the following error:

WARNING: wireguard-tools-1.0.20210914-r0 do_fetch: Failed to fetch URL git://git.zx2c4.com/wireguard-tools;branch=master, attempting MIRRORS if available

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
index 8def54ece6..c12b8abd5d 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
@@ -1,7 +1,7 @@
 require wireguard.inc
 
 SRCREV = "3ba6527130c502144e7388b900138bca6260f4e8"
-SRC_URI = "git://git.zx2c4.com/wireguard-tools;branch=master"
+SRC_URI = "git://github.com/WireGuard/wireguard-tools.git;branch=master;protocol=https"
 
 inherit bash-completion systemd pkgconfig
 
-- 
2.25.1


