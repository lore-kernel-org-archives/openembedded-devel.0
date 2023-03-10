Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 241ADC61DA4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 01:14:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8527.1678410840148460965
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 17:14:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=D+7lUHgy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=24331f10aa=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32A0aKDa006223
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Mar 2023 17:14:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=ur5x2VHqX9VZKS3uFSFWZ+C5Ug0zPTlsMCUVgsUjVXA=;
 b=D+7lUHgyjqlL1Bw5KFiEAmxzB7yYApHRQeQeeQh9xrHXe/xy02YPznnsqV3tExWJ09H2
 r0bOuUz/fodMHypc3f6LDP6Mqc4Ui2umqVRJYImapcvx76SGkxNNCWr00iai+YJ8yk6s
 RfyYtYl0ySHym7O48ngCCDe3JdzbJbkoMQQ4KRGsMvWwjv2NlXRpQnYmkuLfYSdUOlQi
 EnavL2yYTFjgmwrb9DZ916vEdqV7ABtpCaXI64Ixn7bB00vXuzRxwaFag7jTLBIQjRO3
 CT6zsGnyZPn4PcFmakDgXxQRScbUek/borv1Ry9n5pjo4I36Qll8QfkUNLrL2bZAQGBF gQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6ffd2avc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 17:13:59 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Thu, 9 Mar 2023 17:13:59 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Thu, 9 Mar 2023 17:13:58 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH V2] sg3-utils: upgrade 1.45 -> 1.47
Date: Fri, 10 Mar 2023 09:13:57 +0800
Message-ID: <20230310011357.2778627-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: A-LOIcgLJ051vRqPoW5dRgndMwfzobrM
X-Proofpoint-ORIG-GUID: A-LOIcgLJ051vRqPoW5dRgndMwfzobrM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_14,2023-03-09_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303100005
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 01:14:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101469

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../sg3-utils/{sg3-utils_1.45.bb => sg3-utils_1.47.bb}       | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/sg3-utils/{sg3-utils_1.45.bb => sg3-utils_1.47.bb} (72%)

diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.47.bb
similarity index 72%
rename from meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb
rename to meta-oe/recipes-support/sg3-utils/sg3-utils_1.47.bb
index ac12f9561..fe129b8ed 100644
--- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.47.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://sg.danny.cz/sg/sg3_utils.html"
 SECTION = "console/admin"
 
 LICENSE = "GPL-2.0-or-later & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f90da7fc52172599dbf082d7620f18ca"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f685699d3ac82f108aa880043fa3feb7"
 
 SRC_URI = "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz \
 "
@@ -14,8 +14,7 @@ MIRRORS += "http://sg.danny.cz/sg/p https://fossies.org/linux/misc"
 
 UPSTREAM_CHECK_REGEX = "sg3_utils-(?P<pver>\d+(\.\d+)+)\.tgz"
 
-SRC_URI[md5sum] = "2e71d7cd925dcc48acb24afaaaac7990"
-SRC_URI[sha256sum] = "0b87c971af52af7cebebcce343eac6bd3d73febb3c72af9ce41a4552f1605a61"
+SRC_URI[sha256sum] = "8673c7faca849b6b34764332d2aa91f72db05bff7382bb836d0688795199c3e1"
 
 inherit autotools-brokensep
 
-- 
2.25.1


