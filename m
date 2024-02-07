Return-Path: <jean-marc.bouche@foss.st.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15BA9C4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 10:21:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
 by mx.groups.io with SMTP id smtpd.web10.17489.1707301261566528316
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Feb 2024 02:21:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foss.st.com header.s=selector1 header.b=4tIBgfX2;
 spf=pass (domain: foss.st.com, ip: 185.132.182.106, mailfrom: prvs=2767c069c0=jean-marc.bouche@foss.st.com)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4177Kx10010843
	for <openembedded-devel@lists.openembedded.org>; Wed, 7 Feb 2024 11:20:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=selector1; bh=4UyBgne
	0IfZrBOBqHN6NpOveftteLjhJv4yuszuqTJM=; b=4tIBgfX21skKPvjhJAg8arY
	Kvfov8tQTHsRfiIhEYBq0GKYURYgszxAOL/9V+U+6OFAHeMT84ByyIKn3ry+y8Uy
	cqJNLRb7a47jvYGvhWjdZ4ASf5mMlsIO+GTd5NaNjD86+JwifcjmQ1EkF5bFa1ss
	gxzWHjxjQQ53aylD34SrmVBKRNG3MwFN6at0nIKQ6H/sNvNRVN3FkZN5PpDCETyX
	y29lhuF9evTxSJaqHq/VG7P9xPKz2bSGzUScETGgVPQaHD4irtKHST2yHmyyZbDl
	aC74vd+W+8RAec57NVUAH59mONswDrIAXtAy6XrtCsxUDzkFrbGYEourjVzRzpA=
	=
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w1eypfp0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 07 Feb 2024 11:20:59 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 32056100056
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Feb 2024 11:20:58 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6CE352291BD
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Feb 2024 11:20:58 +0100 (CET)
Received: from localhost (10.129.178.205) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 7 Feb
 2024 11:20:58 +0100
From: Jean-Marc BOUCHE <jean-marc.bouche@foss.st.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Jean-Marc BOUCHE <jean-marc.bouche@foss.st.com>
Subject: [oe][meta-oe][PATCHv2] rtkit: missing files/directories in package
Date: Wed, 7 Feb 2024 11:20:52 +0100
Message-ID: <20240207102052.3521132-1-jean-marc.bouche@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.129.178.205]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-07_04,2024-01-31_01,2023-05-22_02
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Feb 2024 10:21:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108651

Fix the following error when building the recipe:
  Files/directories were installed but not shipped in any package:
  /lib
  /lib/systemd
  /lib/systemd/system
  /lib/systemd/system/rtkit-daemon.service

Signed-off-by: Jean-Marc BOUCHE <jean-marc.bouche@foss.st.com>
---
 meta-oe/recipes-support/rtkit/rtkit_0.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/rtkit/rtkit_0.13.bb b/meta-oe/recipes-support/rtkit/rtkit_0.13.bb
index 7ae992503..4f06e55e8 100644
--- a/meta-oe/recipes-support/rtkit/rtkit_0.13.bb
+++ b/meta-oe/recipes-support/rtkit/rtkit_0.13.bb
@@ -19,5 +19,5 @@ PACKAGECONFIG[systemd] = ",,systemd"
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system --no-create-home --user-group --shell /bin/nologin rtkit"
 
-FILES:${PN} += "${libdir} ${datadir}"
+FILES:${PN} += "${libdir} ${datadir} ${systemd_system_unitdir}"
 
-- 
2.25.1


