Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B22AC433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 03:42:04 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.6468.1648784522613052273
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 20:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mPvvDml5;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648784520; i=@fujitsu.com;
	bh=/pEvmuVZ5bDAMcwQYZevAnH2kqmEdi2xZe40xVkdOfA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=mPvvDml57kOVV1AVTFUeW12wDzI5gnLT+/AE4V/nBbMRD0jPfdrJnY+BQmHpClPlS
	 38z66A9BoTCJ7FK9VrSetTOED5AHuzcDVjb5nbPBk7+JMp1xQSlL+6ykmsHDN5Jy54
	 33V7hD4P127LUB2R3BIxbep2QbYJQYTC4/fxVqcx9/J+/zv+sV5AoV8pJ95hkojkgi
	 Ua8EvyfbvouKiu8fQW+yTP1JzKmDXDTJmS8Zk2S+b3twqazbKhkiFz0m8WYOYHuPtU
	 wWm0Emtt29yJP9NKN2gtUW/w58480On0lzdzJbzGNiPLFNqQ2MEIb6Wkpm/I2om6te
	 2ejwkzgR9LkIw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRWlGSWpSXmKPExsViZ8ORqNte4pZ
  kMLXP0uLi4aXMDowe5zauYAxgjGLNzEvKr0hgzbjz5jl7wWyuit9ntrA0MG7l7GLk4hASeMIo
  cejxGiYI5wKTxIUDZxghnP2MEu27r7N2MXJysAnoSrz4sZgFxBYR0JdYOnsPM4gtLOArsWLaS
  bA4i4CKxJul09hBbF4BD4mbfdPBeiUEFCSmPHzPDBEXlDg58wlYPbOAhMTBFy+A4hxANYoSs6
  fLQ5RXSLw+fIkZwlaTuHpuE/MERr5ZSLpnIelewMi0itEqqSgzPaMkNzEzR9fQwEDX0NBU11D
  XyMBYL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMPhSihlP72Dc1PdT7xCj
  JAeTkiivwyHXJCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvB05bklCgkWp6akVaZk5wEiASUtw8
  CiJ8AYXA6V5iwsSc4sz0yFSpxgVpcR5JUESAiCJjNI8uDZY9F1ilJUS5mVkYGAQ4ilILcrNLE
  GVf8UozsGoJMxbCjKFJzOvBG76K6DFTECL9W+4giwuSURISTUwKT30nbSyeoVn8EObkIdf5sd
  /mZFcEbedr+JSxtVbR4xvz1FjmJrNsal6Zxhnjvz9xgxrdyfZSXYTp52ZdXKyuvxM7dcMGo/z
  7tffDV60tcawuNld/Kms2/L9L66d25Mt4WS9wXCOgNX+1FfvjO6E92/hWezEEVg8PSGFw2by2
  a9ni6+8WXUw/bpUb6pPR43v36oCjnf3/wooWUyunPRivdC5kp5tbU+q/iRKyN32C+4+mrGtp2
  ax7l+1qZOXseT72Gct4vlUp+jafre6TXNOzZyzGpWNO+ekhb6axfP+5RmxBzMlFvKe0mfolNr
  55Pn984HKIrxPv2yWyTvAMHf1i/3dU8QyFjoxeVa78mfOUWIpzkg01GIuKk4EAORbKjo5AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-587.messagelabs.com!1648784519!209221!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28045 invoked from network); 1 Apr 2022 03:41:59 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Apr 2022 03:41:59 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 7C8BA1001A0
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  1 Apr 2022 04:41:59 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 70865100180
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  1 Apr 2022 04:41:59 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 1 Apr 2022 04:41:23 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-jdatetime: upgrade 4.0.0 -> 4.1.0
Date: Fri, 1 Apr 2022 11:41:14 +0800
Message-ID: <1648784474-10200-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Apr 2022 03:42:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96314

Changelog:
===========
 feat(strptime):handle %b and %B directive.
 Improve README.
 ZWNJ Replacement.
 feat(strptime):handle %z directive.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-jdatetime_4.0.0.bb => python3-jdatetime_4.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jdatetime_4.0.0.bb => python3-jdatetime_4.1.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-jdatetime_4.0.0.bb b/meta-python/recipes-devtools/python/python3-jdatetime_4.1.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-jdatetime_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-jdatetime_4.1.0.bb
index f76f275036..c96e5c39ed 100644
--- a/meta-python/recipes-devtools/python/python3-jdatetime_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jdatetime_4.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/slashmili/python-jalali"
 LICENSE = "Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c80be45b33471b4a23cf53d06a8172be"
 
-SRC_URI[sha256sum] = "d35baea2ed213e4e87bb840c61637001540bd21e8e4454bd12352b06591ec08e"
+SRC_URI[sha256sum] = "4a67a82ee57e35b5f6f9f7fbe6a0eda63f56ce1dd8af409b4c2a26a3340457db"
 
 PYPI_PACKAGE = "jdatetime"
 
-- 
2.25.1


