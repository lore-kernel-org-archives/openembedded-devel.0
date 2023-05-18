Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 920F1C7EE2A
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 15:02:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.19522.1684422167319341139
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 May 2023 08:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=TaOAZU4P;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=450282278c=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34ICeewH012575
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 15:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=+/k8PoNb21CJBaXeeec1W4ZGeJ2gc6LKhWRlUjL5Kfc=;
 b=TaOAZU4P3Yr54tLlw/gQiB+RCsOvAmYDl4657U+kvWVuOODgnnMAixWLhs2N524KEq82
 VMjnOhtX18bVct3x2Jx6S7dNz8UenRMbBViZ+fkhmZEELGBVG/txrmF+aMr3YWl4YgVn
 5NHKkYRddKav95GltrKHuTMlAl2gap4r2X4NaWS3IJVjB0y1Tjd2tRJOGlJRqafV0xHT
 ALvZM+U8J1Ze0xgDV4H7MLiI0hGD0S8URHkP8dinjCnJF5Zw1cJMuCRskPDs+Ie7r2hA
 i7K6vOXLJB0MLbc0r5YgQEhwn6JHpU6J5J7HEwGqADF5NRwhoYjPF7gkc90BzTpNQeBM GQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qhys058cq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 15:02:46 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 08:02:45 -0700
Received: from ala-jslater-lx1.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 08:02:44 -0700
From: <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-oe][PATCH 1/1] bats: use baselib
Date: Thu, 18 May 2023 08:02:44 -0700
Message-ID: <20230518150244.3036626-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: lGTMtpZrhqkBjgF18mtRvgXy5S9cVrmO
X-Proofpoint-GUID: lGTMtpZrhqkBjgF18mtRvgXy5S9cVrmO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-18_11,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 impostorscore=0 clxscore=1011
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 mlxlogscore=804 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305180121
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 15:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102658

From: Joe Slater <joe.slater@windriver.com>

Use sed to change scripts to reference ${baselib}.  The
former set of scripts modified was incomplete.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
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


