Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE3BC77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 18:53:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.238.1684781576486072156
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 11:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=jCGZN2NS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=45061d06db=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34MFVB6k011465
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 11:52:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=b2UVYpFSX4bGa5bUdh2pQ0jrc78eCbqdhIAybOEtFy0=;
 b=jCGZN2NSHMq+B1LS7hsthwF0y1W2zDSxvc1pUKSYRmLAmRHOATxDpyrT4GvxzqsMomwH
 ZaKOAx2edCn7nOt5/sBUJOOmpDp+UOJCQZoRU+aCJLRgr1Ifd8LIyAKSHQ0NUMiMl6RN
 jVK4zrrAd2Doz+JUV7n5/I6MYrknNTr/mGZJ6Kt1gIeyxwxab3St0UUIKy6KWmEWSIeS
 k+PyIcmKbdhh4YlzcJbzzGb2v37vI1xW+Cm6/QGa3s/2HQNYFKpnGnfZd2/Ee2ExG3kM
 yKRNGGI8ayy34L6HexAv7VBQjkvSgiJV07w2ZUIeylCPZsHg5Mh5smm3F5pgPJwozuKT UA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpsg1hx26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 11:52:56 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 11:52:55 -0700
Received: from ala-jslater-lx1.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Mon, 22 May 2023 11:52:55 -0700
From: <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [mickledore][meta-oe][PATCH 1/1] bats: use baselib
Date: Mon, 22 May 2023 11:52:55 -0700
Message-ID: <20230522185255.3082635-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: bDrYzU9JocUE_qLWg-biY7lUbvKIFM_T
X-Proofpoint-ORIG-GUID: bDrYzU9JocUE_qLWg-biY7lUbvKIFM_T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_13,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 suspectscore=0 mlxlogscore=854 mlxscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220160
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 18:53:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102710

From: Joe Slater <joe.slater@windriver.com>

Use sed to change scripts to reference ${baselib}.  The
former set of scripts modified was incomplete.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1cc72c41af0c6a55a10be9158a2f856b02a56282)
---
 meta-oe/recipes-test/bats/bats_1.9.0.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-test/bats/bats_1.9.0.bb b/meta-oe/recipes-test/bats/bats_1.9.0.bb
index a642d7cf5d..015bc42f82 100644
--- a/meta-oe/recipes-test/bats/bats_1.9.0.bb
+++ b/meta-oe/recipes-test/bats/bats_1.9.0.bb
@@ -15,10 +15,12 @@ SRCREV = "6636e2c2ef5ffe361535cb45fc61682c5ef46b71"
 
 S = "${WORKDIR}/git"
 
+# Numerous scripts assume ${baselib} == lib, which is not true.
+#
 do_configure:prepend() {
-	sed -i 's:\$BATS_ROOT/lib:\$BATS_ROOT/${baselib}:g' ${S}/libexec/bats-core/bats
-	sed -i 's:\$BATS_ROOT/lib:\$BATS_ROOT/${baselib}:g' ${S}/libexec/bats-core/bats-exec-file
-	sed -i 's:\$BATS_ROOT/lib:\$BATS_ROOT/${baselib}:g' ${S}/libexec/bats-core/bats-exec-test
+	for f in ${S}/libexec/bats-core/* ${S}/lib/bats-core/* ; do
+		sed -i 's:\$BATS_ROOT/lib/:\$BATS_ROOT/${baselib}/:g' $f
+	done
 }
 
 do_install() {
-- 
2.25.1


