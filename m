Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB69C43334
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 04:28:03 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.2913.1657859278522025089
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jul 2022 21:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aYuVU6ER;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657859276; i=@fujitsu.com;
	bh=Pv3T18ybLUJbcMSzvpqr0gExO8FkkuqGlcZMUYXpgak=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=aYuVU6ERH/nyvLdmxEo1RzlPS0JCa/Y9g9T1d3SaaMA/VanUrBLq59K2YfqzJkN+M
	 M5DHSmFjnrUVsIWYvXgSA4UbkLKx97Ez6ulMxAz7LWvToOsErNKX5ah+ZMNe4j4bXZ
	 juOTBO9vNV0xcfq/nx3hU2Cpci7XUlEyz+87HE2Cr4P9xWMAsp/P44z5AZ3SRvdibM
	 wVUlQvnQveAsqG7JHkjxy16IC66uhuAZxAJatgWefYmX3mrzsLhbLF9zEfyAwNrvct
	 iAEMnhQOYMKta8dJcVGxKSHSRucjZ35G7QOFl7HZtIoDjmodSOkc/N9juRMwUjY6uY
	 uId92U9ob3FFQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8OxWff0mwt
  JBpv+61tcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBlPpjkV7OCo6Fj5maWB8Q57FyMXh5DAQ0aJ
  z8unMkE4V5gk3k+bygrhHGCU6JtzGKiMk4NNQFfixY/FLCC2iIC+xNLZe5hBbGEBD4lbLyezg
  tgsAqoSb6/NZASxeYHim+adZgKxJQQUJKY8fM8MEReUODnzCdgcZgEJiYMvXgDFOYBqFCVmT5
  eHKK+QeH34EjOErSZx9dwm5gmMfLOQdM9C0r2AkWkVo1VSUWZ6RkluYmaOrqGBga6hoamuqa6
  RqaleYpVuol5qqW55anGJrqFeYnmxXmpxsV5xZW5yTopeXmrJJkZg6KUUs/7fwdjd91PvEKMk
  B5OSKO+h/AtJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR41V8C5QSLUtNTK9Iyc4BxAJOW4OBRE
  uFd8QoozVtckJhbnJkOkTrFqCglzlvyECghAJLIKM2Da4PF3iVGWSlhXkYGBgYhnoLUotzMEl
  T5V4ziHIxKwrypr4Gm8GTmlcBNfwW0mAlo8UNfsMUliQgpqQYmxc5HnlkLz1uldq05qO703yz
  3y8MXfNsZ9H5WFgqaz2iVm5h7onhhHK+sdYxL8JkdnZohV70zlAr+2QWzeYaftxe/HPT+LmPV
  dJmLT8SmdnKfSX4V9ptj2cRJzQUTKh6rqEUt3BUin2rU9/dYd0D2nYjGAxcTJ372/PK1K/TN6
  7LZwSvPGFvUrAx/Z/Z82ax1ZSurr7/qWZvtLN1oMc21ZJdovSafcHeM8aZt58/n2x75ufrSeu
  fNzdocXRzH1sjPPZceZpF3Xni96erIy/qtG71s2Y+9cg/nMLiutD6+5MHMIsHu2PLDM3lc+94
  ouT0xq+d/Wfqw9P3v06ESn5amtfs4+qz58u5oBs+Pb4eUWIozEg21mIuKEwG14v5dOAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-23.tower-587.messagelabs.com!1657859275!331135!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4176 invoked from network); 15 Jul 2022 04:27:55 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-23.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Jul 2022 04:27:55 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 67A9F151
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 05:27:55 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 5B3FA150
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 05:27:55 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 15 Jul 2022 05:27:53 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-ldap: upgrade 3.4.0 -> 3.4.2
Date: Fri, 15 Jul 2022 12:27:42 +0800
Message-ID: <1657859262-15147-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Jul 2022 04:28:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97836

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-ldap_3.4.0.bb => python3-ldap_3.4.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-networking/python/{python3-ldap_3.4.0.bb => python3-ldap_3.4.2.bb} (90%)

diff --git a/meta-python/recipes-networking/python/python3-ldap_3.4.0.bb b/meta-python/recipes-networking/python/python3-ldap_3.4.2.bb
similarity index 90%
rename from meta-python/recipes-networking/python/python3-ldap_3.4.0.bb
rename to meta-python/recipes-networking/python/python3-ldap_3.4.2.bb
index 429905831..44a3d00d8 100644
--- a/meta-python/recipes-networking/python/python3-ldap_3.4.0.bb
+++ b/meta-python/recipes-networking/python/python3-ldap_3.4.2.bb
@@ -13,7 +13,7 @@ PYPI_PACKAGE = "python-ldap"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "60464c8fc25e71e0fd40449a24eae482dcd0fb7fcf823e7de627a6525b3e0d12"
+SRC_URI[sha256sum] = "b16470a0983aaf09a00ffb8f40b69a2446f3d0be639a229256bce381fcb268f7"
 
 do_configure:prepend() {
     sed -i -e 's:^library_dirs =.*::' \
-- 
2.25.1


