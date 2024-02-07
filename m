Return-Path: <jean-marc.bouche@foss.st.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D63FC4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 07:53:50 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
 by mx.groups.io with SMTP id smtpd.web10.15793.1707292419961967839
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 23:53:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foss.st.com header.s=selector1 header.b=UEIBZpTd;
 spf=pass (domain: foss.st.com, ip: 91.207.212.93, mailfrom: prvs=2767c069c0=jean-marc.bouche@foss.st.com)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4176KDaR002836
	for <openembedded-devel@lists.openembedded.org>; Wed, 7 Feb 2024 08:53:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=selector1; bh=JmzBkCC
	za34MgHam76sbRdL81kMfBKBzuNwQe8u0+9c=; b=UEIBZpTdOzoEWqgnNrwO14i
	NiQUSEBZ1j9+WQvxUAdV9eLQojMfZMiouRGvej6NYTwtQU7mjOHseHyBrOVRlsJE
	kMqU4mARUohPfk5F8hoR8p+vqIFT4dACIbG25BHq3SPCzDu5qcaaF67szbl2AuC1
	ZnChHCevkfAM3ec/TvrHA287IQWZBFZmHNRuYp0civfef2QJIHkTDIWYy8HJvT0R
	jxBZNUrB1tGcl0wJlfCehurmbp7yt1Q7PuV7PUusgU/VxCvzlIzgjLXExcAwYAI2
	X3AipNu3ouJyD+6sXqT3A+bXKKLF31WutN3pqyjfeDh8/B8gT60YNQiDH2KW6cA=
	=
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w21ap46x9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 07 Feb 2024 08:53:38 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 73110100064
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Feb 2024 08:53:36 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BF8BC217B71
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Feb 2024 08:53:36 +0100 (CET)
Received: from localhost (10.129.178.205) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 7 Feb
 2024 08:53:36 +0100
From: Jean-Marc BOUCHE <jean-marc.bouche@foss.st.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Jean-Marc BOUCHE <jean-marc.bouche@foss.st.com>
Subject: [oe][meta-oe][PATCH] rtkit: missing files/directories in package
Date: Wed, 7 Feb 2024 08:53:27 +0100
Message-ID: <20240207075327.3518669-1-jean-marc.bouche@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.129.178.205]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-07_02,2024-01-31_01,2023-05-22_02
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Feb 2024 07:53:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108649

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
index 7ae992503..684f047ed 100644
--- a/meta-oe/recipes-support/rtkit/rtkit_0.13.bb
+++ b/meta-oe/recipes-support/rtkit/rtkit_0.13.bb
@@ -19,5 +19,5 @@ PACKAGECONFIG[systemd] = ",,systemd"
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system --no-create-home --user-group --shell /bin/nologin rtkit"
 
-FILES:${PN} += "${libdir} ${datadir}"
+FILES:${PN} += "${libdir} ${datadir} ${base_libdir}"
 
-- 
2.25.1


