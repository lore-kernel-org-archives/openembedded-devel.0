Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FF8C87FD1
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 10:05:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.18044.1754388344373699230
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Aug 2025 03:05:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=03128fa20b=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5755o3Qm4028324
	for <openembedded-devel@lists.openembedded.org>; Tue, 5 Aug 2025 10:05:43 GMT
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4899n62hfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 05 Aug 2025 10:05:43 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 5 Aug 2025 03:05:41 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 5 Aug 2025 03:05:40 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [walnascar][PATCH] yaffs2-utils: correct the SRC_URI
Date: Tue, 5 Aug 2025 18:05:39 +0800
Message-ID: <20250805100539.1760589-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=EP0G00ZC c=1 sm=1 tr=0 ts=6891d777 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=tepRJbHSAAAA:8 a=NEAV23lmAAAA:8
 a=hNcV6g8UystjTqW84I8A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=xVMtpeRVmoib_QGw4vz7:22
X-Proofpoint-ORIG-GUID: VrA2iyokyT30Ahb7FmbFDddWoaGXsw0O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA3MyBTYWx0ZWRfX3VkJVhvBEvhJ
 hKDfSLauBFcNC4OLt77wsAkJCjEE4veCcgQvoMG9ctBDhrSqIh8jd1sym7fQNPzHA0qiotJ4O1E
 /izXacSiwPd7TcxrBPPN7N4S5C3DIF7UmRi0Y1qF+NczNou5+tCfVfE4BMzScNBLcgcTMTpVf/f
 zIIlEDcuBbsf4qfH0lScubcJuipAdM1z9BefbppN228yZGvIECd2hvigxDduI1AGxctTWYXUGG7
 +85RXdh0bQnpzou5UVtoNJmKUSydgG7FkFItU/guFBO+VXaxxehmJsFo43ybbCibTbS1f762BdO
 /oKDomFM76/f2HcJnlYTbz7xsRKINzOufJwIvMtts7g/RSQxzHpXS+2SQGW+AzTwruCa0emvPA3
 Pd/E6nZH
X-Proofpoint-GUID: VrA2iyokyT30Ahb7FmbFDddWoaGXsw0O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2508020017
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Aug 2025 10:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118880

From: Jiaying Song <jiaying.song.cn@windriver.com>

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
index ca5e3302b3..c3211e95f9 100644
--- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
@@ -15,7 +15,7 @@ PV = "20221209"
 DEPENDS = "mtd-utils"
 
 # Source is the HEAD of master branch at the time of writing this recipe
-SRC_URI = "git://www.aleph1.co.uk/yaffs2;protocol=git;branch=master \
+SRC_URI = "git://github.com/Aleph-One-Ltd/yaffs2;protocol=https;branch=master \
            file://makefile-add-ldflags.patch \
            file://0001-define-loff_t-if-not-already-defined.patch \
            file://0001-yaffs_guts.h-define-YTIME_T-if-not-already-defined.patch \
-- 
2.34.1


