Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C90C77B60
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:04:34 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.66306.1680516266554351699
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ppAFLV34;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680516264; i=@fujitsu.com;
	bh=A+cqOVjrb/IYRshXgfbOi5eKZBs4Sh689J4DIKaIIA4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ppAFLV34ER2QGdgkYZ1+mtdxPU86eyT6FAWssgi6KYyW3qAQMIPy8/t1QxUyuMBDh
	 6I6J3VKgljvyu0Fv2gaN7ogcReiLCgZZDUgL0UpmMNDmrZEXm2z2SNA9MRayQXb1ir
	 uX7eykMJESu0ktHnjiWOpwkdEWAE8qghamGMH4eAXcQv5wVkfVFxYTRGzzOGeBEP50
	 vLvUmvDTccEfALgxak7AgQ9+HkjdhcF2dylcdrCIVKlXSJSUthWEA0dR8Ub0dqXixS
	 eT8aLy3H8m7pJO2YzRrjzLINsVFbqcEHO0R22byj1P2QP05zZJVjExuxPUlOMnfEMX
	 2OahHXUYhIkxA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8OxWXfFEq0
  UgxfdAhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0Zz/0+mgofcFX+3XGVpYDzL1cXIxSEk8IBR
  ovnTfhYI5zKTxJXbj9kgnN2MEm0TVrB3MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  1iNsECgxJznaxhBbBag+M7OTWBxXgEnifvv2sF6JQQUJKY8fA/WyyngLHF7xmkWEFsIqObH9c
  +MEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsConG6YeYIGw1iavnNjFPYBSchaR9FpL2BYx
  MqxjNilOLylKLdC30kooy0zNKchMzc/QSq3QT9VJLdfPyi0oydA31EsuL9VKLi/WKK3OTc1L0
  8lJLNjECwzelOPnHDsZdfX/1DjFKcjApifIK1mulCPEl5adUZiQWZ8QXleakFh9ilOHgUJLgn
  bcIKCdYlJqeWpGWmQOMJZi0BAePkgiv4gKgNG9xQWJucWY6ROoUo6KUOO9pkD4BkERGaR5cGy
  x+LzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5hVbDDSFJzOvBG76K6DFTECLW6M0QBaXJCK
  kpBqYrOQ9EhqnB5XO6d9TMWtW/OSTocH7oucos4YrW4dMN5nA8fP1IX+h/S9FtnV4v/2+0uL/
  DdE7TXJXqzhXSEtHqIYcX7fJnPds5Eq1E53OvC3zRUqZJ7/L/7T6xBUv6wmyDEJG23c90bnxi
  jnQ+Jdjp5KY6EqpN5mxqxP3Zmid88mQdf0Xyy4cbfNKQfJXDvuRa0u42J+fKrS790Ck+3bAgi
  sThQxFCvdzX1w3e1Ol2JrVX7++urXC643FvOWMz073L3gcuiXT4UKNQPSJvRoMOucnVH5qqr1
  kza21+vsq65AJnhumd6hOLTFKaV19TPDmxaCX7r8DH/uuCD946XNZYH12R2dW8oQpi7xPuJu0
  KbEUZyQaajEXFScCACKUyuNaAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-728.messagelabs.com!1680516263!1031915!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12377 invoked from network); 3 Apr 2023 10:04:24 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-8.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 10:04:24 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id AD3F97C
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:04:23 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id A033B7B
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:04:23 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 11:04:22 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.16.2 -> 2.17.1
Date: Mon, 3 Apr 2023 18:04:03 +0800
Message-ID: <1680516244-30936-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680516244-30936-1-git-send-email-wangmy@fujitsu.com>
References: <1680516244-30936-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:04:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101917

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Print out reauth plugin error and raise if challenge output is None (#1265) (08d22fe)
    Experimental service account iam endpoint flow for id token (#1258) (8ff0de5)
    Python: Remove aws url validation (#1254) (20a966b)
    Read both applicationId and relyingPartyId. (#1246) (e125dfe)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.16.2.bb => python3-google-auth_2.17.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.16.2.bb => python3-google-auth_2.17.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.16.2.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.17.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.16.2.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.17.1.bb
index b5f2b7e76..9f324c700 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.16.2.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.17.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "07e14f34ec288e3f33e00e2e3cc40c8942aa5d4ceac06256a28cd8e786591420"
+SRC_URI[sha256sum] = "8f379b46bad381ad2a0b989dfb0c13ad28d3c2a79f27348213f8946a1d15d55a"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1


