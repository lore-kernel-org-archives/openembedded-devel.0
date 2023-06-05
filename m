Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCDDC7EE23
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 08:54:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2860.1685955273884039384
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jun 2023 01:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=WJv7FTQr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5520839f50=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3557SfjW029784
	for <openembedded-devel@lists.openembedded.org>; Mon, 5 Jun 2023 08:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=RU5eTnD3WODfuYebeEPjSadNRWAR25rh6OHkBkWAgnk=;
 b=WJv7FTQrSzFyt4eA7JCRJnP+JfAxIQX3hgZITLaaKjvv0G1IdYGVBjsi2FlLAA0wr4V3
 +Wpz8QVpL9PcqfLX7giR29GdAmooPzFet5JDN9r6+84x/dN9U1LVXNT89jYuQtubjguE
 EJV/zGDHaaDGkdrhCA7JU0/UcnjnZJc1slJBZD/IR7iCFTH1H9OZM/8fbDaCwRjw/W8S
 3PyL0Ao3Wu8qE72rbJpFqDUl9SRfX+Oql7mAZZFtVJrhM67cMOkapIrbog2+ezHV/fVT
 1jKTuHaPrhfvFhEfxRTvAEteeX9bX67c0ALtD5bkBvFlOLhvwXF73uh6yxMRJwjmal1I CA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qytr0sd63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 08:54:32 +0000
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 01:54:29 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe][meta-networking][kirkstone][PATCH 1/1] tcpreplay: fix CVE-2023-27783
Date: Mon, 5 Jun 2023 08:54:16 +0000
Message-ID: <20230605085416.4086325-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: jYK6Mi26w97I1sx3rj4-WfOJH0rOnqAa
X-Proofpoint-ORIG-GUID: jYK6Mi26w97I1sx3rj4-WfOJH0rOnqAa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-03_08,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=539
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 mlxscore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306050080
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 08:54:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103126

An issue found in TCPreplay tcprewrite v.4.4.3 allows a remote attacker to cause a denial
of service via the tcpedit_dlt_cleanup function at plugins/dlt_plugins.c.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../tcpreplay/tcpreplay/CVE-2023-27783.patch  | 29 +++++++++++++++++++
 .../tcpreplay/tcpreplay_4.4.2.bb              |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-27783.patch

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-27783.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-27783.patch
new file mode 100644
index 000000000..59adff615
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-27783.patch
@@ -0,0 +1,29 @@
+From e831aad6d48874abab6efa37d4460da2be3ac765  Mon Sep 17 00:00:00 2001
+From: Marsman1996 <lqliuyuwei@outlook.com>
+Date: Wed Mar 1 14:48:48 2023 +0800
+Subject: [PATCH] dlt_jnpr_ether_cleanup: check subctx before cleanup
+
+CVE: CVE-2023-27783
+Upstream-Status: Backport [https://github.com/appneta/tcpreplay/commit/7aca59e4fc96fc1d0e43a3d64b2f9fc9a46b6ca8]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c b/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c
+index e282ef4..98b67e9 100644
+--- a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c
++++ b/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c
+@@ -168,7 +168,8 @@ dlt_jnpr_ether_cleanup(tcpeditdlt_t *ctx)
+         jnpr_ether_config_t *config;
+
+         config = (jnpr_ether_config_t *)ctx->encoder->config;
+-        tcpedit_dlt_cleanup(config->subctx);
++        if (config->subctx != NULL)
++            tcpedit_dlt_cleanup(config->subctx);
+         safe_free(plugin->config);
+         plugin->config = NULL;
+         plugin->config_size = 0;
+--
+2.40.0
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb
index 165a0e735..ccff19f16 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb
@@ -7,7 +7,9 @@ SECTION = "net"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=10f0474a2f0e5dccfca20f69d6598ad8"
 
-SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz"
+SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz \
+           file://CVE-2023-27783.patch \
+           "
 
 SRC_URI[sha256sum] = "5b272cd83b67d6288a234ea15f89ecd93b4fadda65eddc44e7b5fcb2f395b615"
 
-- 
2.40.0


