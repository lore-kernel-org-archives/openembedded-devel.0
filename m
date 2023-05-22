Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57212C7EE26
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 08:28:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17322.1684744085544969725
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 01:28:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=45068e3278=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34M77TKG031781
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 08:28:04 GMT
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpn67hk7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 08:28:04 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 01:28:03 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Mon, 22 May 2023 01:28:02 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][mickledore][PATCH] php: Link with libatomic on rv64
Date: Mon, 22 May 2023 16:28:01 +0800
Message-ID: <20230522082801.293403-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: mzdB2owpbYLQ-cEEd50owFDtl7hnRC1Q
X-Proofpoint-ORIG-GUID: mzdB2owpbYLQ-cEEd50owFDtl7hnRC1Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-22_04,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 mlxlogscore=749 phishscore=0 clxscore=1015 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 08:28:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102697

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  | /usr/src/debug/php/8.2.5-r0/Zend/zend_atomic.h:105: undefined reference to `__atomic_exchange_1'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-devtools/php/php_8.2.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.5.bb b/meta-oe/recipes-devtools/php/php_8.2.5.bb
index 48a0d6b22..fc11e65af 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.5.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.5.bb
@@ -128,6 +128,7 @@ CFLAGS += " -D_GNU_SOURCE -D_LARGEFILE64_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_S
 CFLAGS += " -DHAVE_LIBDL "
 LDFLAGS += " -ldl "
 LDFLAGS:append:libc-musl = " -lucontext "
+LDFLAGS:append:riscv64 = " -latomic"
 
 EXTRA_OEMAKE = "INSTALL_ROOT=${D}"
 
-- 
2.25.1


