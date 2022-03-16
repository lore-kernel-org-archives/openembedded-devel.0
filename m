Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B1A9C433FE
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 08:36:55 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.22555.1647419814444859082
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 01:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=l5oYiJ3i;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647419812; i=@fujitsu.com;
	bh=cqxt2UfEU3eNu06rs1v9kQQLLByOqJlHIHnKbST4xvA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=l5oYiJ3ieypiyD9LxH2VQoUg2q9cU0f+RpaTHMVlVjdApxCQbBgX2sJIhkIsPskmy
	 OYt4veYRafhKZOTBR5eHxyJMPIajR1u0IoHTvseembPu/CEi6pmhAXCRTiDVXr47/8
	 A6QjcdRBMsVVJMBtj3DjE3q6bizmoVzxtB1GPij57MlTwkmWYgGYdc8+/HcEvLxIyX
	 uSJUUsVr9q4Mua0jCF4MF72cSvwFY1kGPl2EEWC6iL/U0aZEkqhOZPFI+Z/Go+k6JA
	 Y7RnGbzDVmfHasO/dxv0LSY5Rn/UvaO9ndKCrNsH2t5TDbnN+tu41LZ0/lvSM5FEVJ
	 0Ppm2BdQvODng==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8ORqLtkoWG
  Sway/bBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bcrzMZC5o4K96/+MDawLiBo4uRi0NI4Amj
  xI4Xx5ghnAtMEiuuzmODcE4wSlzevYSli5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBf4m5Fw+wgdgsAqoST/a3gMV5BZwkJu/+BzZHQkBBYsrD90C9HBycAs4S049XgISFgE
  oun+pnhigXlDg58wkLxHgJiYMvXjBDtCpKzL7cDDWmQmLWrDYmCFtN4uq5TcwTGAVnIWmfhaR
  9ASPTKka7pKLM9IyS3MTMHF1DAwNdQ0NTXTMLXUMTY73EKt1EvdRS3eTUvJKiRKC0XmJ5sV5q
  cbFecWVuck6KXl5qySZGYDCnFLv072C83/dT7xCjJAeTkijv+ZmGSUJ8SfkplRmJxRnxRaU5q
  cWHGGU4OJQkeG8vAMoJFqWmp1akZeYAIwsmLcHBoyTCexMkzVtckJhbnJkOkTrFqCglzsswBy
  ghAJLIKM2Da4NF8yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrw2M4Cm8GTmlcBNfwW0mAl
  o8TxpPZDFJYkIKakGpmwdt9UP/BrT9d5L7ZNk2nP75pSaJBPjZzPNzy0pLbsh1n8v5maZ7usG
  a9VK4bT1PW8FczJiTKKk71yJ6lnIspJXfFKXm7LTpb/5qZ+PJt5MSF7+uCKn11jQVXzStZyku
  a1ON8QOP5fce+UF09uQ8+lTNcpiT1d67s4LjNV+kbYvZc3qQzVV9xQbtD0+7p653MTWaJdr25
  UatTfmR5mmfb4gFV3LL9EmfKiO3zFdbeHqBTN/res/um/Zxx0bnCNTuOxYHl35WrXJeIGzxyS
  Wc/P7IjounZhz9rg1w6/exy9KnVzUknhOLZVlTVYSlLeWEom74P1yeaPs/56OeVE2qhNuzY57
  vkF3EXN6oHOMEktxRqKhFnNRcSIA/UI2OWEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-545.messagelabs.com!1647419811!11780!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9369 invoked from network); 16 Mar 2022 08:36:52 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Mar 2022 08:36:52 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 734F41001A2
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 08:36:51 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 4B0BC100194
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 08:36:51 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 16 Mar 2022 08:36:34 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-bitstruct: upgrade 8.12.1 ->
 8.13.0
Date: Wed, 16 Mar 2022 16:36:17 +0800
Message-ID: <1647419779-81651-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647419779-81651-1-git-send-email-wangmy@fujitsu.com>
References: <1647419779-81651-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Mar 2022 08:36:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96018

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-bitstruct_8.12.1.bb => python3-bitstruct_8.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitstruct_8.12.1.bb => python3-bitstruct_8.13.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstruct_8.12.1.bb b/meta-python/recipes-devtools/python/python3-bitstruct_8.13.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-bitstruct_8.12.1.bb
rename to meta-python/recipes-devtools/python/python3-bitstruct_8.13.0.bb
index f53f84f83e..954c9ab46c 100644
--- a/meta-python/recipes-devtools/python/python3-bitstruct_8.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstruct_8.13.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/bitstruct"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "45b2b932ce6681f5c6ce8cba39abdd423b579b0568c76fa48b1e09c88368ede7"
+SRC_URI[sha256sum] = "7b87d9e41ff552a8cae06ea2368c3772b6f3102bdab4b65e793be7590d69f03b"
 
 PYPI_PACKAGE = "bitstruct"
 
-- 
2.25.1


