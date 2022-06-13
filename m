Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46E6C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 09:01:05 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web12.3640.1655110863013412519
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 02:01:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WiN5DDg5;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655110861; i=@fujitsu.com;
	bh=O/QQqWHzI+dyK25x/tkJ2Q4YdCtTwNm2j7XXvOeebwA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=WiN5DDg5U1FdkEl06N7mCc+8z+Yz77tH9bCm1mXZ4hpB9QkFnj5RrTUijr3psfjdE
	 lgBpO7gqcn3pqrsEtMJI0TITcn5snpUoFv2eOi3nH3TXno/ZNnJnBFoTIgV79l8Vnp
	 oQGuPJFkV6jfX6Jh0YKMdJcZnuuPvp0Eibmtelx89tZRBsvDN9qzc2oHTQWZwr/2g/
	 inpE5fgeBKX9+1T5gtCv/oKpcskzdYd8M9XXVoRaR7GUairEZolXFDgA2TO/lwfVTZ
	 vmJha4RVDCd1o2dXxzxX7bYIYyV7uf4ywdR7wgqHJcs0bEqcIEDPO4Z0znPldttI8J
	 i/CRe6k7QK0ww==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORpHvmz7I
  kgwnbbCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ozTSzewFkzlrFjz9iB7A+MCji5GLg4hgYeM
  El2PHjFDOGeZJPp7tjFBOHsYJT5++AaU4eRgE1CTmH7rBiuILSKgL7F09h6wOLOAisSL3z3sI
  LawgIfEiu1vwGwWAVWJgxs/MILYvAJOEou2/QOzJQQUJKY8fA/WyyngLHF1+2o2EFsIqOb/3R
  0sEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsCokZM7axQdhqElfPbWKewCg4C0n7LCTtCxi
  ZVjFaJhVlpmeU5CZm5ugaGhjoGhqa6hrrGlroJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym
  56To5aWWbGIEBnFKMbPQDsb1fT/1DjFKcjApifLu/bIsSYgvKT+lMiOxOCO+qDQntfgQowwHh
  5IEr8MvoJxgUWp6akVaZg4womDSEhw8SiK8dsCoEuItLkjMLc5Mh0idYtTlmPm17QCzEEtefl
  6qlDjvut9ARQIgRRmleXAjYNF9iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw71WQKTyZeSV
  wm14BHcEEdMTGk0tAjihJREhJNTC5WH1J6MxN+a5VMmuZ5fz2oAUTFT45Hi00ujSro0N0kdwZ
  jQsPjzzelvvnU/Saz7snhh7ra2U1+NJaenp/iHjFKaFDZ7JSvWfv+iOWfYqjN1upSGi2y0Pnf
  KUr81iVFqgvy3poURz/oolv96SWhdwxrZydU06wudeZ7N6stNtrOd/MRUwMHYVcLa8FHH3PiJ
  R5X3sterB2Rm9LWO4STxmVJJdPi5h8715+nnXtl+bvn/bJ5l8ZT1TZpXVV6Pdazlxwunp1w5Y
  d+6ZNrXXbpDTjXP4q18XP3a8tS70srbh91pdj9x+3uHyUTGb93N4qkRcT3J+7YGKgwaLEw2EX
  zxXc1tls8Y/pjworf7r0lF9KLMUZiYZazEXFiQDVRuJSaQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-587.messagelabs.com!1655110860!280591!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13981 invoked from network); 13 Jun 2022 09:01:00 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-9.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Jun 2022 09:01:00 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 8137C1B4
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 10:01:00 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 758601A4
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 10:01:00 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 13 Jun 2022 10:00:41 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] libnftnl: upgrade 1.2.1 -> 1.2.2
Date: Mon, 13 Jun 2022 17:00:17 +0800
Message-ID: <1655110819-25250-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655110819-25250-1-git-send-email-wangmy@fujitsu.com>
References: <1655110819-25250-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jun 2022 09:01:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97486

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnftnl/{libnftnl_1.2.1.bb => libnftnl_1.2.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.2.1.bb => libnftnl_1.2.2.bb} (96%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.1.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.2.bb
similarity index 96%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.2.1.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.2.2.bb
index 44479638f..3eca92dce 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.1.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=79808397c3355f163c012616125c9e26"
 SECTION = "libs"
 DEPENDS = "libmnl"
 
-SRCREV = "09456c720e9c00eecc08e41ac6b7c291b3821ee5"
+SRCREV = "f6575131e60ab10f131ea3ff36f69af2b6c3f614"
 SRC_URI = "git://git.netfilter.org/libnftnl;branch=master \
            file://0001-avoid-naming-local-function-as-one-of-printf-family.patch \
            file://0001-configure.ac-Add-serial-tests.patch \
-- 
2.25.1


