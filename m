Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D164C742A7
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 13:21:11 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.6726.1678281663739712297
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Mar 2023 05:21:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vuFuaY/z;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678281662; i=@fujitsu.com;
	bh=HG11lrYpFzrT/3fsekOoyVq+NV++dOlCnUk58RB7Qn8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vuFuaY/zo8Fq+nBeJQyiOexMuqsQFy/mJ3waZOeQTzL5I2Q5qekU/wx4qJ2MYNQ4j
	 fNMDdU5hWnKC6GaAjMIqgtcLyVdDZ7AUqwIaVlRK80JI6QehjlE6PucPf5Df7mlZ4x
	 zOkbK7QQjs5pm3V+B8tWau7PupoGap4JEhGGAqHwU5I2OFSVruUliKae0jkCfiw8z9
	 yl4eiYLl0akreEb1OckvTWDcrpe6wGViqSSziJMRClHRMU0bLy0RzxdpDyi1CHReMA
	 KhyUzHfpTWFNXStZ2uKqedUH5pArv6t1IJi8q9YvLQleZLVrnBP5LzdF4nHYBQVPtc
	 qVwBfu+nCbjVw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORpLu3myP
  FYOsfJYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPuxuvMBUs5Kj7taWdtYDzF3sXIxSEk8JBR
  4v3pC2wQzhUmiUdrdzBCOHsYJd7+mAuU4eRgE5CSuHH/P5gtIqAvsXT2HmYQm1lAReLF7x52E
  FtYwE5i85G5YDYLUPz7558sIDavgJPEtd4njCC2hICCxJSH78F6OQWcJS6uX8vUxcgBtMxJ4l
  iDF0S5oMTJmU9YIMZLSBx88YIZolVRYvblZhYIu1Ki9cMvKFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKkaz4tSistQiXUMDvaSizPSMktzEzBy9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3iytzknBS9
  vNSSTYzA4E0pVmTdwXip76/eIUZJDiYlUV7WGI4UIb6k/JTKjMTijPii0pzU4kOMMhwcShK8n
  7qAcoJFqempFWmZOcBIgklLcPAoifDerQdK8xYXJOYWZ6ZDpE4x6nJcvXJlL7MQS15+XqqUOO
  8GkBkCIEUZpXlwI2BRfYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO92kCk8mXklcJteAR3
  BBHTEhf0sIEeUJCKkpBqYwtTVPU7Py0+xDL3L/bihRvBTnpLrjtZPy3Qz/SfeOOt59E05z1FZ
  /fINVb5OaSpTG4Pzv7/3t92R03csqeZDZsfLjtqFwvfC7GXfxu9ZkegRr2Jc79Wh5XPk+Nnj4
  YIJ20JOud77VJkxo3mpSMayo5E77Z58/THx0fy4tLj6KRWm8X5hh70KctL5fK9NkdkUzGn2o+
  JIy9qaCpHne/90q8qf2P9Py1IqwSTh1ao5VpOP6218kXRHbrehSU0iq6iqb4Obrvvsec3nJ6j
  JWrq+fHv2XHSHhBLzvX3Hv0376RjJNXuB//NluWFTp5QXd8vNesa37vQ85/rfN7Z/SUl2mnLf
  xNJ4oZtbsfYNfjMlluKMREMt5qLiRADbMuy5ZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-565.messagelabs.com!1678281661!97728!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5442 invoked from network); 8 Mar 2023 13:21:01 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-14.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Mar 2023 13:21:01 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 45CF51AD
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Mar 2023 13:21:01 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 39DFF7B
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Mar 2023 13:21:01 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Mar 2023 13:20:59 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hwdata: upgrade 0.367 -> 0.368
Date: Wed, 8 Mar 2023 21:20:41 +0800
Message-ID: <1678281642-25317-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678281642-25317-1-git-send-email-wangmy@fujitsu.com>
References: <1678281642-25317-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 13:21:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101414

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.367.bb => hwdata_0.368.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.367.bb => hwdata_0.368.bb} (91%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.367.bb b/meta-oe/recipes-support/hwdata/hwdata_0.368.bb
similarity index 91%
rename from meta-oe/recipes-support/hwdata/hwdata_0.367.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.368.bb
index 9d2783363..786cc00e9 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.367.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.368.bb
@@ -5,7 +5,7 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "15c9d3bc939848e5f8b86cf9496f991de48c861f"
+SRCREV = "0e25d93ac6433791edbb9d28b3f8eae0cf5e46ff"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


