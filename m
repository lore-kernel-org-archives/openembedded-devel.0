Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D31C46CD4
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 08:24:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.76821.1703579074022753717
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Dec 2023 00:24:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nYZI6Z7L;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=07249f857e=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BQ8LDam020036
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 00:24:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=fp0YD
	6hBVlWQtPn3btmuXJWoQ8yCE95ozEVZTrSv6Ko=; b=nYZI6Z7LbIHXLP7Hc3160
	HYCirppPxvSX0xY4BOX309WhoMBlzWubckEqoovQN87DWP4wTjaPle+8SZV0z4cf
	nCDqyQ6LdnDawqig2jdZS1ed0nMlx067yjMv+k1E9B6S9/mqE9t5SAW8gsgpNms+
	IWEAE5gaZxqRNFT+UeXQScv7bj9xnb5NW6BqfHi1nl5pIxnSw1L8usbQjaqw1sc2
	E0D1rx2Hx3oKbYuqVEjUR6/K4B3Twto3eI/QgSr4Jmaumy+RNXh5HTICcZU5Ms+2
	khZ4kL2TX4hjU9FG6ABbicMLigkV1hnus+Gri7N+X0dS7EZ4E81oTnuz8V4kB5eL
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5uq4j0ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 00:24:33 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Dec 2023 00:24:35 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH 1/1] jq: upgrade 1.7. -> 1.7.1
Date: Tue, 26 Dec 2023 08:23:35 +0000
Message-ID: <20231226082335.919716-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: nfHtQPsBdgZqB50_2PHuLraWe1beUE6q
X-Proofpoint-ORIG-GUID: nfHtQPsBdgZqB50_2PHuLraWe1beUE6q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 mlxlogscore=913 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312260061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 08:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107805

From: Archana Polampalli <archana.polampalli@windriver.com>

Below list of CVEs are addressed in this relase
   CVE-2023-50268
   CVE-2023-50246
   CVE-2023-49355

https://github.com/jqlang/jq/releases/tag/jq-1.7.1

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta-oe/recipes-devtools/jq/{jq_1.7.bb => jq_1.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/jq/{jq_1.7.bb => jq_1.7.1.bb} (95%)

diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.bb b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
similarity index 95%
rename from meta-oe/recipes-devtools/jq/jq_1.7.bb
rename to meta-oe/recipes-devtools/jq/jq_1.7.1.bb
index 5c2e3aae8..6b1233551 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -12,7 +12,7 @@ GITHUB_BASE_URI = "https://github.com/jqlang/${BPN}/releases/"
 SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://run-ptest \
     "
-SRC_URI[sha256sum] = "402a0d6975d946e6f4e484d1a84320414a0ff8eb6cf49d2c11d144d4d344db62"
+SRC_URI[sha256sum] = "478c9ca129fd2e3443fe27314b455e211e0d8c60bc8ff7df703873deeee580c2"
 
 inherit autotools github-releases ptest
 
-- 
2.40.0


