Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FF5C433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 06:03:56 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.4340.1652940226511824450
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 23:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IPbqrYgG;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652940224; i=@fujitsu.com;
	bh=7CTczGV9cPfZTRnE4d6RzNE/3ku+JLswvh4TlC68MY4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=IPbqrYgGnQlj8XaSttn6c8GzONR/9/rXIDKvRBbfAjPPcmbnIMBwMvUvrxvvyLVg2
	 yk0wVoWRWP3pppguTQ1zHVClyBeKwJeKeBfoi1u8Ov1cJCl/HC2Yw+5mTY8TzuobJx
	 ZxpwOzdmcOK4K+YeeRI629Ut+YbZH5dXmH49z4ZA6bcWRQPl9To8MsnwIhD728wYXX
	 zhQ/SoykNl5fG5OR4S3SZt/hdWC9amSWJVzkuQ0V9Y8FXQlJNyUCleZJFk/LvkKRw/
	 EDTXdABWi7klPU1SoaRqvLrwCzqm1q8RTnMX/rzAaTgv7yplQoYVfHkNJ8an+Y1PP1
	 CA2bwF+d2bFjA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8ORqHvgbmu
  SwdI3fBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8adZ48ZC65zVbzf9IatgfEiZxcjF4eQwBNG
  iY59T9m6GDmBnAtMEn3ffCDsA4wS51dkg9hsAroSL34sZgGxRQT0JZbO3sMMYgsL+Erc+bCJC
  cRmEVCVONyxjx3E5hXwkHj0YA+YLSGgIDHl4XtmiLigxMmZT8DmMAtISBx88QIozgFUoygxe7
  o8RHmFxOvDl5ghbDWJq+c2MU9g5JuFpHsWku4FjEyrGK2TijLTM0pyEzNzdA0NDHQNDU11jS1
  1jQwM9BKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitzk3NS9PJSSzYxAkMvpVj9xA7Gpyt/6h1i
  lORgUhLldT/SmiTEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgvfzDaCcYFFqempFWmYOMA5g0hIcP
  EoivC27gNK8xQWJucWZ6RCpU4yKUuK8CXeAEgIgiYzSPLg2WOxdYpSVEuZlZGBgEOIpSC3KzS
  xBlX/FKM7BqCTMmwoyhSczrwRu+iugxUxAi28pgy0uSURISTUw2c29JrJcWjh9hsXrDb35Fzb
  /MuLVPTjrwPqN13YFVbwI8Y2rKn65rKsiwK7qsuc1xVMWlue2u05y0p8jGhi9cT9rx/EjVcnP
  nyaeZmprsKkxlTH1tSvet8WA+VjV0eBSAfdze7fbzmn6vZX7Qso3KaMvm/SucWqd+mImdEkiK
  jWy2HfttMufHALK2GJ4MmZbijc+/y6/4bv7zv+uFTPjlq08WGC48kFt+1yOCwvebxHhcjVLfM
  D5IHVRqU22O5MJZ+iFew4XVLna7D4IGnoqtSapar3TTTzSV8IziyGrj+NWxV/tlv7Z84W4tyi
  yvFeu7cu/lrWw9tKhfyurrv247WUcUf1K73Gl0aXC+fuUWIozEg21mIuKEwE02MPHOAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-548.messagelabs.com!1652940224!86710!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7962 invoked from network); 19 May 2022 06:03:44 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 May 2022 06:03:44 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id CEED610019E
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 07:03:43 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C22AC10018C
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 07:03:43 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 19 May 2022 07:03:28 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-imageio: upgrade 2.18.0 -> 2.19.1
Date: Thu, 19 May 2022 14:03:14 +0800
Message-ID: <1652940194-24928-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 06:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97174

Changelog:
=========
Fix

    Reset request when iterating over plugins (#792) (46a49c4)
    Rename format_hint to extension and prefer it over actual file extensions (#807) (4830f15)

Other

    Fix broken links in readme (#806) (52954bc)


Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-imageio_2.18.0.bb => python3-imageio_2.19.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.18.0.bb => python3-imageio_2.19.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.18.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.19.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.18.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.19.1.bb
index 2aa6b096b..1a6c078cd 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.19.1.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "090898c48532631ab11c74ae743e64c24dabda45c16db46f7e3bec9e2d8f422f"
+SRC_URI[sha256sum] = "d63600626b80ebe1ec9614c33434879c754dea328717f4e2cebe88f156fa1a9c"
 
 inherit pypi setuptools3
 
-- 
2.25.1


