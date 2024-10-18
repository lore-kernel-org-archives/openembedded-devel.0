Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B33F3D3C54E
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 06:14:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16148.1729232060664765977
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Oct 2024 23:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=002138ef9d=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I5V2J9018987;
	Thu, 17 Oct 2024 23:14:18 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42a397jvdj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 17 Oct 2024 23:14:18 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 23:14:17 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.43) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 23:14:16 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
CC: <changqing.li@windriver.com>
Subject: [PATCH][meta-oe][scarthgap] xmlsec1: fix do_fetch error
Date: Fri, 18 Oct 2024 14:14:16 +0800
Message-ID: <20241018061416.2483243-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: VhZkE2n7welC20O4F0NT1OlsABwxPyQg
X-Authority-Analysis: v=2.4 cv=Fc1lx4+6 c=1 sm=1 tr=0 ts=6711fcba cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=DAUX931o1VcA:10 a=t7CeM3EgAAAA:8 a=PjL9yVGjAAAA:8 a=G-axfLThCGkl4GXj2LMA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=EO-MHUxLLT6bydkwyJ4X:22
X-Proofpoint-GUID: VhZkE2n7welC20O4F0NT1OlsABwxPyQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-18_01,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410180037
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 06:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112972

From: Jiaying Song <jiaying.song.cn@windriver.com>

Change the SRC_URI to the correct value due to the following error:

WARNING: xmlsec1-native-1.3.4-r0 do_fetch: Failed to fetch URL http://www.aleksey.com/xmlsec/download/xmlsec1-1.3.4.tar.gz, attempting MIRRORS if available

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.4.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.4.bb
index 7639209e19..a3e66c96df 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.4.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=352791d62092ea8104f085042de7f4d0"
 
 SECTION = "libs"
 
-SRC_URI = "http://www.aleksey.com/xmlsec/download/${BP}.tar.gz \
+SRC_URI = "https://www.aleksey.com/xmlsec/download/older-releases/${BP}.tar.gz \
            file://fix-ltmain.sh.patch \
            file://change-finding-path-of-nss.patch \
            file://makefile-ptest.patch \
-- 
2.25.1


