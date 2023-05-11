Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8944DC77B7F
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 10:42:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.55859.1683801747847422342
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 May 2023 03:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=jxrnhJmT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44952012bc=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34BAg0JY025321
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 10:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=ZizKDUbiQ6+ia+iAHtos1fGrNrtRyahLKETj/gnRsOM=;
 b=jxrnhJmT4rw6lJsj9ShnfykBQtHR1zjWJz1Hxfa+qX3oSJvAokQ/S59CDy/FtSEA+h+l
 bZNpgmbazzJK52YRFVmGlChOrgOZT7STzihXS5gh+kOgOlIG7nPlj2Gs3V1rrYSIWvW3
 JpO6ax8dE++1ZE++pjuXPpK8E7tlFyFNS1f5ILHghT1jQym9rCzt+xtok91kGT/BbmD9
 XUiLazIembBbd8rqZNB8FAASdJoY1+nYLW+q7EUZwHdABSjqRZC2KxPY3vGkvwv+M918
 BCFn07pXT/t0O3VmeCOaqG4CuuQ+Pd784JZgvIgxl8VsD6S2W+0VpkLDmKyKzsZxqYw+ Hw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qf8b92j57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 10:42:26 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 03:42:25 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 03:42:24 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [mickledore][master][meta-oe][PATCH] redis: upgrade 6.2.11 -> 6.2.12
Date: Thu, 11 May 2023 18:42:23 +0800
Message-ID: <20230511104223.249742-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: sFtAAnxqx2OoJbME2NIFmGRC27JdtfGc
X-Proofpoint-ORIG-GUID: sFtAAnxqx2OoJbME2NIFmGRC27JdtfGc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_07,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=728 adultscore=0 spamscore=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305110091
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 10:42:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102539

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-extended/redis/{redis_6.2.11.bb => redis_6.2.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.11.bb => redis_6.2.12.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.11.bb b/meta-oe/recipes-extended/redis/redis_6.2.12.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.11.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.12.bb
index 5a410bf4cd..3ed6867816 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.11.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.12.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "8c75fb9cdd01849e92c23f30cb7fe205ea0032a38d11d46af191014e9acc3098"
+SRC_URI[sha256sum] = "75352eef41e97e84bfa94292cbac79e5add5345fc79787df5cbdff703353fb1b"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


