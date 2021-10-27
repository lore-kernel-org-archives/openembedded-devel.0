Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40423C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 05:32:52 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web09.7786.1635312771493207707
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 22:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bkQ11KNO;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1635312769; i=@fujitsu.com;
	bh=NudU3IksLzQoS4NWeM5MgYGCscJ6WwiKL+gwPq8KM4k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bkQ11KNOyR6r4TIeXe+PSwmYTNAofQELJSnUgg0qugXL8Xz2mXTmTItL4iTiuNVDf
	 kqJLpOXM+iAxDyfF8lYI/rnWcyNTM852FXN4S+4AizQFIHHYLWvM9GEFedifBVOqRa
	 cKgJe0m41xXXbyM0tvJL+SxHx9V3bbGEtYNl3+jYsa3P0/+eN2cQ5/AniA+kr6fbqR
	 PqI8iRqMJ7n5u0rjXtoRTAgKlRbS04drnFKvDg8TK+2bUjq4+ADoXM7FqcGSSP8WdC
	 h1Vy6d0PrV+3JbrcyqkDvkFtSpVsUtIPJmm/AmCTpLI3a9QumNPCgMmRYMo4UmJior
	 Enf+Vus60vM1w==
Received: from [100.113.7.61] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 5A/E9-30139-184E8716;
 Wed, 27 Oct 2021 05:32:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8ORqNv4pCL
  RYPUVTouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPuxkMsBbsFKj5++87ewHiSv4uRk0NI4Amj
  xJRpnF2MXED2BSaJK6teM0M4exglbv+6xAxSxSagK3Hu8Vp2EFtEQF9i6ew9QHEODmGBOIkT3
  zVBwiwCqhLXt3WBlfMKuEv8+L+FFcSWEFCQmPLwPVRcUOLkzCcsIDazgITEwRcvwMZICChKzJ
  4uD1FeIfH6MMRWCQE1iavnNjFPYOSbhaR7FpLuBYxMqxgtk4oy0zNKchMzc3QNDQx0DQ2Ndc1
  1jUyN9BKrdJP0Ukt1k1PzSooSgbJ6ieXFesWVuck5KXp5qSWbGIFhl1LI/mcH4/XXH/QOMUpy
  MCmJ8vpuq0gU4kvKT6nMSCzOiC8qzUktPsQow8GhJMGr8AgoJ1iUmp5akZaZA4wBmLQEB4+SC
  O8JkDRvcUFibnFmOkTqFKOilDjvvZtACQGQREZpHlwbLO4uMcpKCfMyMjAwCPEUpBblZpagyr
  9iFOdgVBLmvQcyniczrwRu+iugxUxAi5mVwBaXJCKkpBqYghzuxuQm+Gxk40sPChJWvb8v3bQ
  xWJPnfajorNpl9zXWycl82SPO4epc+eFjENfVeYEGS+pCVCylu1VdH7GcWnWjd2PyzNoC8/Pn
  /AIvbVqyPvZa4GXl6XduexxJnK+0ymHblNaDbTH2DQZGMmc6dSJNfLq2hv/7942rRpqZbQKD/
  6XTSX4a7+bW/lDfe0Rm2zahVxy7Fu16NXPqrNPvI75y+k082Gx1wuta08S03U/0a3JfzxL90z
  yFqyj2Fd/TR1l3Q/atmh6sdPbKBIONNhL5O6buXD9l626jiXr/pBfVBxd4Pp1mXSd0Z6N4ptO
  hHFHNB/s8BCMfchzfcOPV9tnt8couO0Xequcf3xHIocRSnJFoqMVcVJwIAC01QTg2AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-21.tower-245.messagelabs.com!1635312768!480081!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10168 invoked from network); 27 Oct 2021 05:32:49 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-21.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Oct 2021 05:32:49 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A8AE9100237
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 06:32:48 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9C699100231
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 06:32:48 +0100 (BST)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Wed, 27 Oct 2021 06:32:27 +0100
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade
 2.26.1 -> 2.27.0
Date: Wed, 27 Oct 2021 22:32:23 +0800
Message-ID: <1635345143-3581-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Oct 2021 05:32:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93623

Features
androidpublisher: update the api https://github.com/googleapis/google-api-python-client/commit/cdbabdfbdaeed465b667852cef415fdfa7d1024a
firebase: update the api https://github.com/googleapis/google-api-python-client/commit/dcab2830e6a0cf09999149e0d0d84d3a8f3d26aa
localservices: update the api https://github.com/googleapis/google-api-python-client/commit/24da1cc0aff78ef70988e6287e5e55fee20ba8ee
networkmanagement: update the api https://github.com/googleapis/google-api-python-client/commit/d0e5a726e9cb4098527bd60fe6818b7c307a865b
realtimebidding: update the api https://github.com/googleapis/google-api-python-client/commit/716ded31624c382be7ecf55ec2de87560b7592ef
retail: update the api https://github.com/googleapis/google-api-python-client/commit/2aa456adabc7c81cea0061d8538473e3b8980d66

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ent_2.26.1.bb => python3-google-api-python-client_2.27.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.26.1.bb => python3-google-api-python-client_2.27.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.26.1.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.27.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.26.1.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.27.0.bb
index ed3214f2f..41ab48c6b 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.26.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.27.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "66389e23fdd23dc7fabf3235afc4bd9bf4d1332e960aa7c058f17ea8848dae35"
+SRC_URI[sha256sum] = "659e9955f0f1e02fcce5dec85622eb5af1807572ef0f09c49d68d8426da670e7"
 
 inherit pypi setuptools3
 
-- 
2.25.1


