Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64411C77B75
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:08:08 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.103654.1683540482954145705
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:08:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kC6OhX60;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683540481; i=@fujitsu.com;
	bh=1dLIv1CGlI/jPMhEhq292IPHpTbh37+EA/t6T0Snskw=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=kC6OhX60gvotEt5bYQonxAQTyi5vf4Lx4+e3N37urn8BX2DG8EfSkoHVEYkXdgUTm
	 RQXMwAg70q37Hvd+OM0yk00PuG8/6Pu1qqHrYOGyCux47eLAZqQsdma3EIUvrOrNsv
	 7KfG79p0Wc4Ao6uBPV7/ZM5knh5T2ReOH9Q/K7lNJ3S6ZdzTZrsKlxTPxP4ZRKRTeq
	 Ip9SPSyLgM+2HQtaM6CnfQejdUtgbySxk1QAdiLmodEqAr2zCk34I1bhgMEOupZYCK
	 RJ96prgHvz5ZOmkNIA7mGK9q00usOLKZGS96HzbfITmoEgu30j/V8expRsnfyN7xhD
	 Owz/KoL/qKqrQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJLMWRWlGSWpSXmKPExsViZ8ORpMtwKiL
  F4MUyFYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP7pfeMBU84K/q+XmZsYGzl7GLk5BAS2Mgo
  ceWmJYQ9jUlix7N0EJtNQEJi+t6T7CC2iICuxMcPcxlBbGYBFYkZk48wgdjCAt4SM7rngNWwC
  KhK7OzdCFbDK+AksWjJMRYQW0JAQWLKw/fMELaaxNVzm5gnMHItYGRYxWhenFpUllqka2iil1
  SUmZ5RkpuYmaOXWKWbqJdaqpuXX1SSoWuol1herJdaXKxXXJmbnJOil5dasokR6OOU4pS0HYw
  7d/3VO8QoycGkJMprejAsRYgvKT+lMiOxOCO+qDQntfgQowwHh5IEb9u2iBQhwaLU9NSKtMwc
  YLjBpCU4eJREeGWPAKV5iwsSc4sz0yFSpxgVpcR5RU4AJQRAEhmleXBtsBC/xCgrJczLyMDAI
  MRTkFqUm1mCKv+KUZyDUUmYdzPIFJ7MvBK46a+AFjMBLfa/HA6yuCQRISXVwDTh3weWkFOlj2
  8wdS2oTnvO/bi2QPaGtZ+Pc5bJ4X95xcuL3O6xL0wQPNq2venFnG8yt7i+3Wswndlqaswk+J9
  vS6Bwrt+dsg9h8xT1l7ZwigkqrN+/2EEodKORMMN1r7IFMmHHm+cKrXvAp+bjsu+o5o5lT+bK
  /5Ivrrz6oOXA0UXma1i22cQxVwVyXu70b8jbpdXrcPey086EV4f2JimtKQ9T9ZyS/zC7QCzLd
  9L5hh0rj93YOFlgtue18n49zm7OI0aaWmtdCmZcd3/tdjhhN+9DQa4XsWxTzvw5dIynUCihhZ
  Nr4nLpnw1Hug7XW4kfLM9hM4mMZvxo3Op9eQ/PH9upnIZymp2MHBzblFiKMxINtZiLihMBkiP
  qbuwCAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-728.messagelabs.com!1683540480!494972!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20346 invoked from network); 8 May 2023 10:08:00 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-22.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:08:00 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 0D1711D2;
	Mon,  8 May 2023 11:08:00 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 344611C2;
	Mon,  8 May 2023 11:07:58 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libjs-jquery-cookie: upgrade 3.0.1 -> 3.0.5
Date: Mon,  8 May 2023 18:07:47 +0800
Message-Id: <1683540471-25268-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102395

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...js-jquery-cookie_3.0.1.bb => libjs-jquery-cookie_3.0.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libjs/{libjs-jquery-cookie_3.0.1.bb => libjs-jquery-cookie_3.0.5.bb} (92%)

diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb b/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb
similarity index 92%
rename from meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb
rename to meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb
index 53882b2f34..38ffd032ab 100644
--- a/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb
+++ b/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://github.com/js-cookie/js-cookie"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e16cf0e247d84f8999bf55865a9c98cf"
 
-SRC_URI = "git://github.com/js-cookie/js-cookie.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/js-cookie/js-cookie.git;protocol=https;branch=main"
 
-SRCREV = "0ba77141dd215782cc7770347a457906908c66ff"
+SRCREV = "ab3f67fc4fad88cdf07b258c08e4164e06bf7506"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


