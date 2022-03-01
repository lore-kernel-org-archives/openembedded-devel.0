Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3771CC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 00:38:16 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web09.2922.1646095094950059717
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 16:38:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vbfDnW/a;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646095093; i=@fujitsu.com;
	bh=j6KRUHWJfrSN6g/v3GNeQdd8mHAgo8YM3cNvGXxk+1c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vbfDnW/aEF8GS01r7AjpRsGjRAmAgKpAsA2FRC8Mv2eWteTt/5siH+CTaZCIRcewT
	 cjePV6jgJt1BMxOCQBn53CTCf+wfXPiCWHDPNFDS4AGFSct/STnyFhoxQS4r2tag2R
	 W4YJQLTN31RjqcYeZ4HN/HLYg0YGpTi/6lokdDDQdm+ClMYwV0iQ6Gee9FKieDTtYt
	 EBb+iBCwOWKf4vK+3Id5jzJ19Sa6QQ8FWcR4BDjqNvvS/VOgakMvhA8UePAB+TrNq6
	 C408ulqgl84EaOdDlj4ew3EMlxYBwVKS5reYWR6qE6/AF2CLCPGchbQZ6btXSf80l4
	 vvafrdl0yp6Ig==
Received: from [100.115.33.107] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id 4F/F0-02429-4FA6D126;
 Tue, 01 Mar 2022 00:38:12 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8MxSfdLlmy
  SQf88eYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaN52hrGgjVcFbMfuTYw7uTsYuTiEBJ4wijx
  9tsSNgjnApNE6/+fTBDOcUaJ7aeXM3YxcnKwCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAj8f7WBKBJHBwsQPELEyxATF4BJ4mdp+1AKiQEFCSmPHwP1skp4Cyx5eplsGohoJKV+z
  xAwrwCghInZz5hgRguIXHwxQtmiFZFidmXm1kg7AqJWbPamCBsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYrZOKMtMzSnITM3N0DQ0MdA0NTXWNjXUNzS31Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WK
  K3OTc1L08lJLNjECAzilWHHzDsaJK3/qHWKU5GBSEuWd6ymbJMSXlJ9SmZFYnBFfVJqTWnyIU
  YaDQ0mCNy0DKCdYlJqeWpGWmQOMJpi0BAePkgjv5zigNG9xQWJucWY6ROoUo6KUOO/yTKCEAE
  giozQPrg0WwZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfOuA5nCk5lXAjf9FdBiJqDFf4O
  lQBaXJCKkpBqYejZt1DbXkWLayb/34brjOmFMa2ecLo/cdbU2Z9FdhbX++4KvLff9eZU7bdOJ
  iOTjrmzf6xylWJas4hOTYTq0YGZY643MmpUR2xb6an7Qa0jXSc7sabgoltZ+P6qvLCSTz7rW/
  zFrcdDD6MhLUu//hM8LWmR61vn/t8+hPAu/JH+4Zf5PWj9dwenYXE2RxdZTmcQnfiiWS12vnP
  j/p1OFV3f28qNBL8IVdGZ+kS2ISmorX3pLZ1OCxK5d733n9E84na7DFNvPofVpRsbGV61L/R9
  UPvgU/NPk1jffbTvsLi1WFti2durFu4cutKjUhs57dl9mZivD+94JVZ0zPwheue6ScePKpoCN
  t3kPrdp5QomlOCPRUIu5qDgRAA/1XmxbAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-565.messagelabs.com!1646095092!24274!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8647 invoked from network); 1 Mar 2022 00:38:12 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Mar 2022 00:38:12 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 21373100440
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Mar 2022 00:38:12 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id EF6BA100352
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Mar 2022 00:38:11 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 1 Mar 2022 00:38:00 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-socketio: upgrade 5.5.1 -> 5.5.2
Date: Tue, 1 Mar 2022 08:37:48 +0800
Message-ID: <1646095068-37552-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646095068-37552-1-git-send-email-wangmy@fujitsu.com>
References: <1646095068-37552-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 00:38:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95611

Changelog:
=========
Connect with an empty auth object instead of None
Fix indentation in the "Rooms" docs example.
Remove 3.6 and pypy-3.6 builds, add 3.10 and pypy-3.8

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-socketio_5.5.1.bb => python3-socketio_5.5.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.5.1.bb => python3-socketio_5.5.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.5.1.bb b/meta-python/recipes-devtools/python/python3-socketio_5.5.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-socketio_5.5.1.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.5.2.bb
index ebbb5c047a..4b22a73553 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.5.2.bb
@@ -9,7 +9,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "python-socketio"
 
-SRC_URI[sha256sum] = "ac8e64d59a15d1c31a4fe8434f4ff16d0f640c824ba517dce7ca99e95f0cd36a"
+SRC_URI[sha256sum] = "6213f7dfbb87e554472d11151f96bae9059854aa88e4a1e0fa6e97cca1c3fcf4"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
-- 
2.25.1


