Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4377AC433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 13:22:41 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.10476.1645449760333389904
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 05:22:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VRvJv9KJ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645449758; i=@fujitsu.com;
	bh=QfgD5lcltcI5HYRTxWNKu3sVI7KhFdHWge64oe2cvy4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=VRvJv9KJGniDhZRoU5AdXInvYKgceorMyvOZYtdJ0+zian4D/O0VlPdyxdEdvOgrv
	 sZIWmUpeh/clAYaWDHtTpnpyWbLvI3OF++KsdErIssR3Nz4wQF2oWS9kynhRFeuIQp
	 DIgKLi0TDhLw+Xxa4ZvzUoVHrJ8/K85QQfO+9JvHxV4iOTFXxljJ0INzRl1Zxh5k/P
	 UJ5adQpAryW+8VmCF9LmT6Vr/uFzcTasIHvwD6GKISQQHifMBrUDdgcCgFjt+r6ErU
	 0ugZV5mxzYhsI59Fkr6AKA7hqBKmu59JRjo0Pj9FzxgVXuOfrhplUqX6nxQEY8AH6S
	 iydwd0TJ4dAtA==
Received: from [100.115.32.10] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-2.aws.ess.symcld.net id DC/DA-12680-E1293126;
 Mon, 21 Feb 2022 13:22:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8ORqCs3STj
  J4Pt2VouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePe4waWgm7uisl7j7M0MHZwdTFycQgJPGGU
  uNH7mh3CucAk0Xe/lQnCOcEosbxrDmsXIycHm4CaxPRbN8BsEQF9iaWz9zCD2MwCKhIvfvewg
  9jCAtYSj7ZNYQSxWQRUJU5/WwoW5xVwktiy6CtYXEJAQWLKw/dgvZwCzhLnO56wgdhCQDVn2v
  ewQNQLSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gVFwFpL2WUjaFzA
  yrWK0TirKTM8oyU3MzNE1NDDQNTQ01TU21TU0sdRLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuu
  zE3OSdHLSy3ZxAgM5JRi5ak7GE+v+ql3iFGSg0lJlLe2XThJiC8pP6UyI7E4I76oNCe1+BCjD
  AeHkgSvcD9QTrAoNT21Ii0zBxhVMGkJDh4lEd7yZqA0b3FBYm5xZjpE6hSjopQ4r+BEoIQASC
  KjNA+uDRbJlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8waDTOHJzCuBm/4KaDET0OIpWUI
  gi0sSEVJSDUwCMsdnM7LLTDnS0M973tmE+0Kh1oITPZ4F60+uK7Zqs37Krmu+lFtTfAWvzky/
  57P9L6V7tzJ9lt996/WdfT+uxho/ONCjVn/qd5Hu52cO0cL/Ik4oGc9ZkhWoseSE9/4N6dWHO
  I6UVm5IuZ77ldW0TObKaYEj2xhqFevzbWUav0ZE1Ja4HuHYd3xNDOeK1etfcs9c+l/vrrXGr6
  jjLqxqNk+uCkz4lKK0/rVcvOCS9XV31Zcm1SjNs3/MWCdi7MvZO/d7V/bmY5vm9Da92n5j+YH
  Jczivu2i+81L8/avwbuhSM8XHLd3aMcUxpXy3ljYovYrqKz/16cjS/HshN9+2ms5ZFVt7/KmT
  S5znvzIlluKMREMt5qLiRAD/j749XwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-571.messagelabs.com!1645449757!8233!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10682 invoked from network); 21 Feb 2022 13:22:38 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Feb 2022 13:22:38 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A439E10019E
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:22:37 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 97C7F10019A
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:22:37 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 21 Feb 2022 13:22:25 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] iotop: upgrade 1.20 -> 1.21
Date: Mon, 21 Feb 2022 21:22:09 +0800
Message-ID: <1645449729-23271-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645449729-23271-1-git-send-email-wangmy@fujitsu.com>
References: <1645449729-23271-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 13:22:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95414

Changelog:
=========
* Update to new upstream release of 1.21
  - Better support for disabled task_delayacct sysctl
  - Add history and graph for all data
  - Restore simple inline help
* Remove filenamemangle from d/watch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/iotop/{iotop_1.20.bb => iotop_1.21.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/iotop/{iotop_1.20.bb => iotop_1.21.bb} (85%)

diff --git a/meta-oe/recipes-extended/iotop/iotop_1.20.bb b/meta-oe/recipes-extended/iotop/iotop_1.21.bb
similarity index 85%
rename from meta-oe/recipes-extended/iotop/iotop_1.20.bb
rename to meta-oe/recipes-extended/iotop/iotop_1.21.bb
index a044c9b248..dc8b59bb47 100644
--- a/meta-oe/recipes-extended/iotop/iotop_1.20.bb
+++ b/meta-oe/recipes-extended/iotop/iotop_1.21.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=48e7be78bd2671d08c9c3bad71f1cfaa"
 
 DEPENDS = "ncurses"
 
-SRC_URI = "https://github.com/Tomas-M/iotop/releases/download/v1.20/iotop-1.20.tar.xz"
-SRC_URI[sha256sum] = "e0227dd4b71ce3ffe50225b85cf9abb38a99c1d2dff69e3f1db7d059d7490d51"
+SRC_URI = "https://github.com/Tomas-M/iotop/releases/download/v1.21/iotop-1.21.tar.xz"
+SRC_URI[sha256sum] = "7b4862ebc93909a3f800193140ca2464e926291a9c873b50dc31fa77e6d9383e"
 UPSTREAM_CHECK_URI = "https://github.com/Tomas-M/iotop/releases"
 
 inherit pkgconfig
-- 
2.25.1


