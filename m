Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B79BE7718B
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 11:45:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11980.1734954328437795529
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Dec 2024 03:45:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=208778e7b9=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNBNcXg016589
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Dec 2024 11:45:27 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43njw0ssfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Dec 2024 11:45:27 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 23 Dec 2024 03:45:26 -0800
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 23 Dec 2024 03:45:25 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][PATCH] asio: upgrade 1.20.0 -> 1.22.2
Date: Mon, 23 Dec 2024 19:45:24 +0800
Message-ID: <20241223114524.2164089-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Yc5H5xRf c=1 sm=1 tr=0 ts=67694d57 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=KT7-5jTpAAAA:8 a=t7CeM3EgAAAA:8 a=Dq3ul54nqOVuA3GNjaQA:9 a=htEcQftnFDIA:10 a=Vhek2GFPlKMEkTkA0ebB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: k7lqUpTIyb9wbJ_-qW9bwYcaD_e9zy5S
X-Proofpoint-GUID: k7lqUpTIyb9wbJ_-qW9bwYcaD_e9zy5S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-23_05,2024-12-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412230105
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Dec 2024 11:45:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114468

From: Changqing Li <changqing.li@windriver.com>

License-Update:  License Year Update

Release Note:
https://think-async.com/asio/asio-1.22.2/doc/asio/history.html

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-support/asio/{asio_1.20.0.bb => asio_1.22.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/asio/{asio_1.20.0.bb => asio_1.22.2.bb} (87%)

diff --git a/meta-oe/recipes-support/asio/asio_1.20.0.bb b/meta-oe/recipes-support/asio/asio_1.22.2.bb
similarity index 87%
rename from meta-oe/recipes-support/asio/asio_1.20.0.bb
rename to meta-oe/recipes-support/asio/asio_1.22.2.bb
index 5e7a6e2495..92c43eb990 100644
--- a/meta-oe/recipes-support/asio/asio_1.20.0.bb
+++ b/meta-oe/recipes-support/asio/asio_1.22.2.bb
@@ -18,9 +18,9 @@ inherit autotools ptest
 
 ALLOW_EMPTY:${PN} = "1"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=416f4cc4f79551b690babb14ef1a5799"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6f4e83eac87b54ce7fe05f0bddd9cca6"
 
-SRC_URI[sha256sum] = "204374d3cadff1b57a63f4c343cbadcee28374c072dc04b549d772dbba9f650c"
+SRC_URI[sha256sum] = "776bb781eee8022a3eed71de28f05bf8ba09741db2e57ad8cc420aa0884cbc6c"
 
 PACKAGECONFIG ??= "boost"
 
-- 
2.25.1


