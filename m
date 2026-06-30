Return-Path: <Venkatasainath.Ravikanti@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A4D6C43602
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 20:52:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30706.1782852720442180551
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 13:52:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KW6npmE8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=16419c01d2=venkatasainath.ravikanti@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UKDT671778623;
	Tue, 30 Jun 2026 20:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=qLLSkzFbI
	KPvpRqSrYGfIQWM06FVTK3ED7If6Bro7gA=; b=KW6npmE8otASThNf9GoYp++BY
	mxZvuwEKOWuB/pMQ9bGJM+pJRw0LxnMzv3E4WcPVzmftxZ3B7WzdVlbux82+ALef
	C6OK7bHX5AnfrQ5DQBbL2/rZpLP2DyfZRUuq4DJhF4XFQ5/+EM2j1z6XLQbVgHG0
	z7spFaSiFPdUl80Zu89wpYdl06TApbVxzI2bKDfGgrfm+wy+bgsytHRs8egtlpEz
	KktukVW07YLBMqjcl042nXTvPZSpYepYWO8I3jCCYwCHPKLX9CkqCfm6UL9hoeqs
	WG4N8UNBL/5pyhSNlgvUAoQwgU5PiWP+Na/l32V/WgNIlApcykL7in6hOtUtg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f25g5mhe6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 30 Jun 2026 20:51:58 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 30 Jun 2026 13:51:57 -0700
Received: from oak-lpgbuild10.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 30 Jun 2026 13:51:57 -0700
From: <venkatasainath.ravikanti@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <anuj.mittal@oss.qualcomm.com>
Subject: [meta-oe][scarthgap][PATCH 1/2] haveged: upgrade 1.9.18 -> 1.9.20
Date: Tue, 30 Jun 2026 20:51:56 +0000
Message-ID: <20260630205157.1738428-1-venkatasainath.ravikanti@windriver.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIwMiBTYWx0ZWRfX/2jTwMUqxFz7
 WYwK7YoVKEvzioY7az19LeVIesNxFF2drwyDPaSEkM3BSnbqWk1BLTKQVJdioa+uenOMsw+bG2u
 SRFZVbV6wFnMyQMnFxxPGzfrtIDsVfwAh07eMfYMlHmsRBW2HKwX
X-Proofpoint-ORIG-GUID: DfFUtG3J8P9Mw5p5Vf0iXdi2f4fc5ewb
X-Proofpoint-GUID: DfFUtG3J8P9Mw5p5Vf0iXdi2f4fc5ewb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIwMiBTYWx0ZWRfX5nnQUURd1yho
 GUX/D8ONSYHca8LsWua3qq8F7DfP3sjw0B2nNZoGTU84uePoBVC1CUEMLrkGDfGYS23Gnbq5x1s
 4vTfcp520bj4BCpfgRfdSNQ/UV27GA2rzcVAfGq0n6+jxnKbENnr2E0QGyN0fDxv3ddbbrBxksS
 IGq0UihcJ/DYGY2rkDS17MEdqvxwqfdJJcRqHRxQaN40qpTKqr4eP1KI097GtkzNe/TZ3wyQayD
 XibSxD0fpk0q/dBhGHRV4nsc8y53EWy2M/zNZuYGW0eRzG/O9Bu4oeyjlS6VYVYnstFOmPc75tC
 BYZXJcRz48X4ERgnqEmMVBcNaxUMz7MNNGgtBbIb/h+Wo4pCtau0RKy0CURo4vYF66P42671+Ry
 ZiXFE69vXfiTPwQa2dCuB+QPFB+N0yNskuV1urQinaqMEsIAH8RZkNk3ThHu8PBjqBTlOpWlOiI
 FgCrv46FH0cKf6hueLA==
X-Authority-Analysis: v=2.4 cv=TvLWQjXh c=1 sm=1 tr=0 ts=6a442c6e cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=8nEx1NFfAAAA:20 a=kh0PQnTzAAAA:8 a=t7CeM3EgAAAA:8
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=grJprBQRE97FFd-fx9IA:9
 a=4Y7iCZ2k6v-lWCGmfGXo:22 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300202
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 20:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127983

From: Li Zhou <li.zhou@windriver.com>

Backport from wrynose (bcc1c15a3fb0). Adapted from the 1.9.19 -> 1.9.20
upgrade since scarthgap ships 1.9.18.

ChangeLog:
https://github.com/jirka-h/haveged/releases/tag/v1.9.20

(cherry picked from commit bcc1c15a3fb0ae23678a7784d5bf2ded0aa34fcd)
Signed-off-by: Li Zhou <li.zhou@windriver.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Venkatasainath Ravikanti <venkatasainath.ravikanti@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
[scarthgap: adapted for 1.9.18 base recipe]
Assisted-by: Kiro (Amazon)
Signed-off-by: Venkatasainath Ravikanti <venkatasainath.ravikanti@windriver.com>
---
 .../haveged/{haveged_1.9.18.bb => haveged_1.9.20.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.18.bb => haveged_1.9.20.bb} (93%)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.18.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
similarity index 93%
rename from meta-oe/recipes-extended/haveged/haveged_1.9.18.bb
rename to meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
index 97c354aba8..65e017a810 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.18.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
@@ -6,8 +6,7 @@ HOMEPAGE = "https://www.issihosts.com/haveged/index.html"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM="file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-# v1.9.17
-SRCREV = "80ee9289569bc13efff4e0b5db3661cb513802b2"
+SRCREV = "e2d96806273caa9ce7457e2f8669a3c40517ca27"
 SRC_URI = "git://github.com/jirka-h/haveged.git;branch=master;protocol=https \
 "
 S = "${WORKDIR}/git"
-- 
2.54.0


