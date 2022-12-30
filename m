Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C20AC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 03:44:49 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.3882.1672803887787059879
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 19:44:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kA274yKT;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672803885; i=@fujitsu.com;
	bh=Zbzk5ObDY6ublQLGylNSbhl+liBayV4AE8dTurRdLaw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=kA274yKT9nfn8wSx+Nc2FfJ0WFq0LuoB/urAvGysJxj0K167qNiKcS4qZr9EoiiXP
	 pj6OzTYSPoyR3Im6+ZmednbmuTNvLVIgIEQjPJjTJPNsoIr304AtQbKEQ3T/3LwxBA
	 LFLS3R0GyWcAPgVx0I3JT6sb4fJWiZQa8kyQJBsFbAmlhyu0UInd6vyNuDcfTtqGVl
	 tb8kQTaXB2IbXSra3jR2JnjfafrGOLl52Xs4Lujy9o6iCJFqkPkLLZNd3Lz6iW09/c
	 4u21Wfy8roZaLVEkk4bQzOh9IH9uuwKrJoegGMV/Ng9xV1koj7T1irF7nL+QxEWR8J
	 tS5bhXxhLIJdw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8OxWVf325Z
  kg4Y/nBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0b/lB2sBR85Kw6fO8nWwHiGo4uRi0NI4CGj
  xL/u84wQzhUmiUPbfrBAOLsZJV4uXs/excjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  WA1wgKOEqcX/WAFsVkEVCVO77oJVsMr4CSx9/40MFtCQEFiysP3UHFBiZMzn7BAzJGQOPjiBV
  SNosTsy80sEHaFxKxZbUwQtprE1XObmCcw8s9C0j4LSfsCRqZVjObFqUVlqUW6hkZ6SUWZ6Rk
  luYmZOXqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBAZlSnHx3B2Pn8j96
  hxglOZiURHlLPm9JFuJLyk+pzEgszogvKs1JLT7EKMPBoSTBq/4JKCdYlJqeWpGWmQOMDpi0B
  AePkghvFkgrb3FBYm5xZjpE6hSjJcfdhXv3MnMceHgASF69cmUvsxBLXn5eqpQ4760vQA0CIA
  0ZpXlw42ARfIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO9qkLU8mXklcFtfAR3EBHRQ0pq
  NIAeVJCKkpBqYGCLWKnY9KZd59F55l/mktpfm27gE09eYp+zZ3/vy5+Fu57ZdFe9syvn37b5l
  q/ifScGq3zVm7/+8vf/6i62PcmRZylysc8th/Ps8cGH4ebuF9veVbh/pUjY22L83rbmGv9TqQ
  LH+p5mvrHdfdl8mq7aD+8jiXDHjYxfbs5h3qRjP5jtyOOsp53e+aaorP5gfdRX5eOrw/ugyHm
  MGdgGuxOi9Zzd0MJ4p/bZwuo6P58e4xzx3/K/5VGw4KV73YDPLE7sTj45ui6w7c3yW5O2QTUX
  Lvjd2RHVe+l0st/zjErFFj/by8vUw6azamHnhd4E0A3fPxYj/qlst5RfYnfvkKXhYZfL0W4tT
  Z9y7bs88X4mlOCPRUIu5qDgRAPwVN7RbAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-745.messagelabs.com!1672803884!477491!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31865 invoked from network); 4 Jan 2023 03:44:45 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-9.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Jan 2023 03:44:45 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id A3764153
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:44:44 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 97010151
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:44:44 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 4 Jan 2023 03:44:43 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] rsnapshot: upgrade 1.4.4 -> 1.4.5
Date: Fri, 30 Dec 2022 13:01:14 +0800
Message-ID: <1672376478-25626-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 03:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100385

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix regression (#310)
- Merge pull request #303 from rsnapshot/update-HOWTO-to-talk-about-retain-instead-of-interval
- Removing legacy Docbook files, as per discussion at https://github.com/rsnapshot/rsnapshot/pull/296
- Merge pull request #296 from hoclun-rigsep/hoclun-rigsep-patch-1
- Use @prefix@ instead of hardcoded value in rsnapshot.conf.default.in comment line (#289).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
index 2203663c1..3cbd04bd5 100644
--- a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
+++ b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
@@ -22,8 +22,8 @@ RDEPENDS:${PN} = "rsync \
                   perl-module-ipc-open3 \
                  "
 
-SRCREV = "4dc82bfe6be3f83fcfa94946dcf6accfd6a18031"
-PV = "1.4.4+git${SRCPV}"
+SRCREV = "1b943dbc7695d62fac5c0f9549ec696a538be19c"
+PV = "1.4.5"
 
 SRC_URI = "git://github.com/DrHyde/${BPN};branch=master;protocol=https \
            file://configure-fix-cmd_rsync.patch \
-- 
2.25.1


