Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4AB4C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 07:15:04 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.7094.1651130101560173408
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 00:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=atO8xqmS;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1651130099; i=@fujitsu.com;
	bh=wZ5iK3qBegigDwlNDfyNQMIf00NXwAd1lvc8PXDT4Y8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=atO8xqmSBTEJGxqzvmLLK2SX9a9uorBR78LB02rs8mTB+x1zABpKCFDwyVGba4FmX
	 sNV+pK1LHpd3w8gYrn1MNsgKvlWPDagKZ/puUb1ByTFl7dZ9g/GsHMYK3NwcnrrqKQ
	 AWlGbgFpw7kK4ibVp5Z6q1dX8bc2MqyT3ZHpWR/YMboI4lmYqXOnNAYrisB0lAc/1f
	 lz0pgXxlSv3kj/X6Bi0UKWo+199V5Z6oF6VuATPa4D3+L7Ip1HFhtAVbHRRkcXxI05
	 egJ/soozUTyHmdwiB4MC9FMFpyDIh2/0RppAtqImV6yHfkULtxwJ6X4S3m/WyrVNRE
	 g/12uE+JJ7a0w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8ORqPvZLiv
  J4HCrqMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjF37gzWgm7OivOfb7E1MO7g6GLk4hASeMIo
  MefheVYI5wKTxP2OyWwQzgFGic2b29i7GDk52AR0JV78WMwCYosI6Essnb2HGcQWFvCTuHHsE
  BuIzSKgKrF35nUwm1fAQ+LDpT+sILaEgILElIfvmSHighInZz4Bm8MsICFx8MULoDgHUI2ixO
  zp8hDlFRKvD19ihrDVJK6e28Q8gZFvFpLuWUi6FzAyrWK0TSrKTM8oyU3MzNE1NDDQNTQ01TW
  zAFJ6iVW6iXqppbrJqXklRYlAWb3E8mK91OJiveLK3OScFL281JJNjMAQTCl24d7BeKfvp94h
  RkkOJiVRXivTrCQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErwK1kA5waLU9NSKtMwcYDzApCU4e
  JREeGWMgdK8xQWJucWZ6RCpU4y6HHcX7t3LLMSSl5+XKiXOm24LVCQAUpRRmgc3AhablxhlpY
  R5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ84aCTOHJzCuB2/QK6AgmoCNWFmWCHFGSiJCSamASYjy
  slayp/Nq44J6I3/YbCpOL+gJPqaXcZLKPEU2beHtLbrTUPM/pSzXXaC/l3f3cMk3odFBF4quo
  pdn2Xy8rCB/e3llxweNA7ke213Y9f2+/fDiNxW/iLfsHaVcPPTDSdGdPVGv+v4bnilbOUbYYP
  0app9GuonnTd05scA2z/rNsg8IbwxB3P4n+w0errU8oV3SGv3zL0V7KO+eopKX8h+tvnLPark
  /JMyye5uLz/2K2WAuXpNW2CbN2L9josDjI8sERZU3dBydtmvmXGoY2nO0u+Kh0vZBjgvUOl53
  qoadqwh935MyecTbPtiWL6+Ejge072I6YXV+04GaYe2Ph32CLhbL3p617ZvDmj5wSS3FGoqEW
  c1FxIgD1iC5uSAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-532.messagelabs.com!1651130099!52879!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10296 invoked from network); 28 Apr 2022 07:14:59 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Apr 2022 07:14:59 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A691A10019F
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:14:58 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6CAE01001A2
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:14:58 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Apr 2022 08:14:55 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-paramiko: upgrade 2.10.3 -> 2.10.4
Date: Thu, 21 Apr 2022 18:00:01 +0800
Message-ID: <1650535201-15444-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 07:15:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96835

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-paramiko_2.10.3.bb => python3-paramiko_2.10.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-paramiko_2.10.3.bb => python3-paramiko_2.10.4.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_2.10.3.bb b/meta-python/recipes-devtools/python/python3-paramiko_2.10.4.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-paramiko_2.10.3.bb
rename to meta-python/recipes-devtools/python/python3-paramiko_2.10.4.bb
index 9f7f458723..3173687725 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_2.10.3.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_2.10.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/paramiko/paramiko/"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[sha256sum] = "ddb1977853aef82804b35d72a0e597b244fa326c404c350bd00c5b01dbfee71a"
+SRC_URI[sha256sum] = "3d2e650b6812ce6d160abff701d6ef4434ec97934b13e95cf1ad3da70ffb5c58"
 
 PYPI_PACKAGE = "paramiko"
 
-- 
2.25.1


