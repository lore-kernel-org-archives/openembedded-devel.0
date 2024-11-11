Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56719D5E39A
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 08:27:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.54874.1731313668633811825
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Nov 2024 00:27:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10456d5a36=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AB7XRqh000329
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Nov 2024 00:27:47 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42t84ps9wd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Nov 2024 00:27:47 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 11 Nov 2024 00:27:46 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Mon, 11 Nov 2024 00:27:46 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [meta-oe][scarthgap][PATCH] eject: fix do_fetch error
Date: Mon, 11 Nov 2024 17:25:24 +0800
Message-ID: <20241111092524.3543219-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=IrVMc6/g c=1 sm=1 tr=0 ts=6731c003 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=lV92gj4lsP10hY3XYNkA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: -7Xvq9e1SKXzUD1jvkFXbnKhLIEmFF2O
X-Proofpoint-GUID: -7Xvq9e1SKXzUD1jvkFXbnKhLIEmFF2O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_06,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 mlxscore=0 mlxlogscore=606 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411110071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Nov 2024 08:27:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113787

From: Jiaying Song <jiaying.song.cn@windriver.com>

Change the SRC_URI to the correct value due to the following error:
WARNING: eject-2.1.5-r0.wr2401 do_fetch: Failed to fetch URL http://sources.openembedded.org/eject-2.1.5.tar.gz, attempting MIRRORS if available

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-oe/recipes-support/eject/eject_2.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recipes-support/eject/eject_2.1.5.bb
index dd5489e7db..953c2e541c 100644
--- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
+++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
 inherit autotools gettext update-alternatives
 
-SRC_URI = "http://sources.openembedded.org/${BP}.tar.gz \
+SRC_URI = "https://downloads.yoctoproject.org/mirror/sources/${BP}.tar.gz \
            file://eject-2.1.5-error-return.patch \
            file://eject-2.1.1-verbose.patch \
            file://eject-2.1.5-spaces.patch \
-- 
2.25.1


