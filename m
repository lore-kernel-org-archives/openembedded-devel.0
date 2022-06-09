Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36DB2C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 07:59:01 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web09.7890.1654761535231637361
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 00:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jci8s7ne;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654761533; i=@fujitsu.com;
	bh=KCTlju0U02450amivaKvGJoOCE2aJLtTGv2bHejBMlo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jci8s7neSWh2Jmde8H10gIxX+2G/QdoNZdnGUM9fpkjqKq08oj9JA2UktWYu1G9f8
	 ZZ5DAT2Zai6vj8efta0ucWjlTWJSHaJlqF/CLWtpCbL8mnYiuoB3wu8vLuWx/uN0nq
	 XZWdAtdhTRPS3vZBvW4jBc6bpTWU5Icec6v/WjdW0fZ83pd7SkIwjLRpt5ngZslxeM
	 4VxBW6Q0g4gJGQiLjlNXIvpkGduxCmHF+/WDhji54GRBbUA5UKdK5sNbmP99m4gxUG
	 MzobVCpCUcXqaIcaTe0FaMV23UOzcanSCs2NWZpnlABx0mgUXIcPkeFDspxbuyVDwz
	 ICTQGvvw+6azw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqGu7YmG
  SwfsHrBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bEn5sYCxZwVXxt72NvYNzK2cXIxSEk8IRR
  4tONFkYI5wKTxK6Tx9ggnN2MEtt2NrF3MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  1iNsIC/xPIFvxhBbBag+IoHG9hAbF4BJ4nfF7rB6iUEFCSmPHwPZnMKOEvMf70HrFcIqGbFyk
  5GiHpBiZMzn7BAzJeQOPjiBVSvosTsy80sEHaFxIwZ29ggbDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGK2SijLTM0pyEzNzdA0NDHQNDU11TYAsQ73EKt1EvdRS3fLU4hJdILe8WC+1uFivuDI3OSdF
  Ly+1ZBMjMIxTillSdzD29f3UO8QoycGkJMp7cuHCJCG+pPyUyozE4oz4otKc1OJDjDIcHEoSv
  GuXA+UEi1LTUyvSMnOAMQWTluDgURLhtV0GlOYtLkjMLc5Mh0idYlSUEuedAdInAJLIKM2Da4
  PF8SVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrw8IFN4MvNK4Ka/AlrMBLT415UFIItLEhF
  SUg1MCZ8+df5+et4y3XDdEo3ib1sZKr9XuQbt3TqbhcPydQxzWoG9UkFywIS38+LK59q17tGt
  /cV821lf+fCHyLn9GwQa1vjvErdZavOl8kdI3awqH3XnZ4uei7fOvdfgbekQnnYmeJu7x691S
  o/ShJxdu5O8T3xb8/BophHj5ohkKR5uzr+3frWbftj2x1xBQvbXOYkI1dIVe/eHmj/K9drxea
  L+I0lFQ0nN+74edSfdnJqCstkPsK/N3c2n8VZyYa1j6LTCuoDXpaeqw8OY3rPzNWfWVc3vmtn
  T9GLd9j6Xy2ukyi22LTZQmyurJ3kz68TBh3/jiyPCZjf9vhyiGjyDMyr9875eRhuryaov1JRY
  ijMSDbWYi4oTAaolJFdeAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-585.messagelabs.com!1654761532!77430!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6366 invoked from network); 9 Jun 2022 07:58:53 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Jun 2022 07:58:53 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 9D5D7100183
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:58:52 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9049110018E
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:58:52 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 9 Jun 2022 08:58:45 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xmlschema: upgrade 1.11.0 ->
 1.11.1
Date: Thu, 9 Jun 2022 15:58:30 +0800
Message-ID: <1654761510-29680-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654761510-29680-1-git-send-email-wangmy@fujitsu.com>
References: <1654761510-29680-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jun 2022 07:59:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97460

Changelog:
===========
    Protect converter calls in iter_decode()/iter_encode()
    Extend XSD type matching for code generators

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-xmlschema_1.11.0.bb => python3-xmlschema_1.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_1.11.0.bb => python3-xmlschema_1.11.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_1.11.0.bb b/meta-python/recipes-devtools/python/python3-xmlschema_1.11.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-xmlschema_1.11.0.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_1.11.1.bb
index 759cf029c..9f0944a9f 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_1.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_1.11.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f"
 
-SRC_URI[sha256sum] = "319f5e3e77beb6ab3b4166f699d9dafd59141487bd1a07675fd01af6483211a4"
+SRC_URI[sha256sum] = "9232b3e3d967b956c5f96f3dcd82f1157f88aad18939d1b8f26c870bc15c5938"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.25.1


