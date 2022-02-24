Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B811C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 06:00:37 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.7076.1645682435041666842
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 22:00:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iPpmxH+O;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645682431; i=@fujitsu.com;
	bh=AliLHlUFBgwoL1BGp/qoEEDWtHwgfIt8MLMX8ru21FQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=iPpmxH+O31njqrlAI2SR9pi5vZxI9+adPm/G60o2MUHvnxWNSVp1H6mKB1+nSaOyi
	 oaFQuaSYWYtQsTmZSp1qRieoeqUrE5aDTaO7enILL3rA7BhNASNEeVw1PZxdmoCMOQ
	 fUDaAmqgNnqRqDrk1gRE7oz0vw8fM1qbV4D7AGdv/TyMnLGPeCHELaBNULXZgdOQCG
	 vXes46pVbCrqLra8LuCCt+MgLGTtFZtfiXjfb5Iw1PpMPd/ADfI8kQlnF9rdYT/0It
	 IAgHG6h3D2dmtldyiVik/a5mTj3RlR7J5KrpXAXXpYV5smsaSlCUBtnyuUHOwwcnu5
	 NrdKf5hyJc69Q==
Received: from [100.115.36.74] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id D6/E4-29321-FFE17126;
 Thu, 24 Feb 2022 06:00:31 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8MRovtXTjz
  J4NNea4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP3rrssBb1cFdPurGJtYFzO2cXIxSEkMJNJ
  Ys7FbywQzklGiWf7vzB2MXJysAmoSzy++RrMFhHQl1g6ew8ziM0soCrRfXENO4gtLBApsWNqG
  wuIzQIU79l/HayGV8Bd4svW+UwgtoSAgsSUh+/B4pwCHhLPP25kA7GFgGpenV/GBlEvKHFy5h
  MWiPkSEgdfvGCG6FWSOLHiI9ScConXhy8xT2Dkn4WkZRaSlgWMTKsYrZOKMtMzSnITM3N0DQ0
  MdA0NTXWNLYBMS73EKt1EvdRS3fLU4hJdI73E8mK91OJiveLK3OScFL281JJNjMCwTClWy93B
  OGXlT71DjJIcTEqivJLM4klCfEn5KZUZicUZ8UWlOanFhxhlODiUJHhNZIBygkWp6akVaZk5w
  BiBSUtw8CiJ8D7jAUrzFhck5hZnpkOkTjEqSonz9skCJQRAEhmleXBtsLi8xCgrJczLyMDAIM
  RTkFqUm1mCKv+KUZyDUUmY9w3IFJ7MvBK46a+AFjMBLTaIFwNZXJKIkJJqYFqTUPfMv/OTwzW
  LHa8Ei+e6P/qY2r86b8/uI60r1ku1rlgkcFBeTz19cdtVW67eH/s0RV2shV5v9nbd8O9kze/0
  TouE0jPhZzMqTi2bd/s0N8Olw95bt2Usnipa/WHyQlvrw6KTdszdbVp1Y8cqFum+2y2XopYV3
  Vi01VLtv50P26KD/mzzrbJiL0UsbP7uNfnbecnlJXcnLOQP01B+9lo17GBLt9shG9bz37Ytm7
  t7yel7q2ouynzPv7lx0+bU4159h8r2Pqkqtd9TFCLIyKrmbDr36YM0d8eVwrt2CjrHNe1OZJ5
  kXbzW7nZYkWQXf9aRo0dPJKswHVNaEinO8EjuolLCiZ4L9ldljypwxIQrsRRnJBpqMRcVJwIA
  zYeCz0YDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-571.messagelabs.com!1645682429!52118!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9359 invoked from network); 24 Feb 2022 06:00:29 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-5.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 Feb 2022 06:00:29 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21O60MY1000540
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 06:00:29 GMT
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Thu, 24 Feb 2022 06:00:23 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 2/2] [oe] [meta-python] [PATCH] python3-jdatetime: upgrade
 3.8.2 -> 4.0.0
Date: Thu, 24 Feb 2022 14:00:57 +0800
Message-ID: <1645682457-31192-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645682457-31192-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1645682457-31192-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Feb 2022 06:00:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95495

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
-Add
Add fold attribute to jdatetime.datetime
-Change
Drop Python < 3.7 support

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-jdatetime_3.8.2.bb => python3-jdatetime_4.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jdatetime_3.8.2.bb => python3-jdatetime_4.0.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-jdatetime_3.8.2.bb b/meta-python/recipes-devtools/python/python3-jdatetime_4.0.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-jdatetime_3.8.2.bb
rename to meta-python/recipes-devtools/python/python3-jdatetime_4.0.0.bb
index 67a6ea1f21..f76f275036 100644
--- a/meta-python/recipes-devtools/python/python3-jdatetime_3.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-jdatetime_4.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/slashmili/python-jalali"
 LICENSE = "Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c80be45b33471b4a23cf53d06a8172be"
 
-SRC_URI[sha256sum] = "c685687e3f39e1b9a3ba9c00ed9d8e88603bc8994413e84623e6c5d43214e6f8"
+SRC_URI[sha256sum] = "d35baea2ed213e4e87bb840c61637001540bd21e8e4454bd12352b06591ec08e"
 
 PYPI_PACKAGE = "jdatetime"
 
-- 
2.25.1


