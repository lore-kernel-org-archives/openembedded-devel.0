Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9B5C6FD19
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 00:48:32 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.36173.1678495710067260486
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Mar 2023 16:48:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=R8OWypS1;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678495708; i=@fujitsu.com;
	bh=Rl2WIzgsiC/5z6y53NfbTDomQaxIKRjyLTC435PIltE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=R8OWypS1oSIKcZ8yhDDDKKHgQZcMKQwgLa5f1zhzOMkVg6zHVRizbKpB2yKlM5gxr
	 rG2cRC478rFOKqHC4C6TwaSs8AW4Gd9jgUE+3t1iiR4JBiDV9zn7QysCDgJQge+xrJ
	 027r2xSzP43UrS/bDOvuAWdA7tIVT0kl+5XYsbMHE9/ChiDcXfDLCp67JrKAFHpqFW
	 BAIsORfUtatNV36EYEg8+TK1JYZ/6y/KGcK33thK15bbXUiU7v7bgp8rGtBBB/ICyf
	 uQXdHCaP/1qAtVrPX0b/2xM7VNBUDIcxNB7gDM42vr9gqbFVkpWLDa3PJ+LazKDbeC
	 41pObSObBFLYQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8ORpHv7PHe
  Kwdt2KYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPx1WnGgoUcFW1PVrE3MB5n72Lk4hASeMgo
  sbj7JTOEc4VJ4v+iR6wQzh5Gib0/twBlODnYBKQkbtz/zwZiiwjoSyydvQcsziygIvHidw87i
  C0s4CpxYkE/K4jNIqAq0b/gGwuIzSvgJLF45y5GEFtCQEFiysP3zBBxQYmTM5+wQMyRkDj44g
  UzRI2ixOzLzSwQdoVE4/RDTBC2msTVc5uYJzDyz0LSPgtJ+wJGplWMZsWpRWWpRbrGeklFmek
  ZJbmJmTl6iVW6iXqppbp5+UUlGbqGeonlxXqpxcV6xZW5yTkpenmpJZsYgeGYUpwotIPxW+9f
  vUOMkhxMSqK8vmu5U4T4kvJTKjMSizPii0pzUosPMcpwcChJ8H48CZQTLEpNT61Iy8wBxgZMW
  oKDR0mE1+wsUJq3uCAxtzgzHSJ1ilGXY23Dgb3MQix5+XmpUuK8ceeAigRAijJK8+BGwOL0Eq
  OslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXrkzQFN4MvNK4Da9AjqCCeiIXVs4QI4oSURISTU
  wVWTFWxj/dBOV2htQ90fy0ZzGTwGPkziy+3puTAw2OrCjjlsmL+l28bvsxT2fa/vdNxSUBtyc
  efkXz+GNvw9Z32Eodpz7w9k7ZJtVweSex8bNsUw1b88VHua7eeGY9NaZlTES9auNz0R8v3T0b
  ZHz9TQNx0SrGUKzd0psyvsqmCsnoXrd+v+m66tbEnoTA10CMzneLY3StCzcZ1i/hffvz4NnXR
  OZNZMWCr9fYRZw67pGor29hWrihooexn67KuHun/v6hfg8jdVPKuQr3ot/pxSz9fF5+wemQWu
  tSipPTQ7im8EX6+L14Ohl83+coTPu/DYRzuieo1HarPCvMfbPIpeowLBps2VuvXXJX63EUpyR
  aKjFXFScCACgpI4KTgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-728.messagelabs.com!1678495707!663717!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21495 invoked from network); 11 Mar 2023 00:48:27 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-20.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Mar 2023 00:48:27 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id CB4C91B1
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Mar 2023 00:48:26 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id C01EC1AD
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Mar 2023 00:48:26 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 11 Mar 2023 00:48:25 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH] xdebug: upgrade 3.1.1 -> 3.2.0
Date: Sat, 11 Mar 2023 08:48:14 +0800
Message-ID: <1678495694-14408-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Mar 2023 00:48:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101503

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-php/xdebug/{xdebug_3.1.1.bb => xdebug_3.2.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-php/xdebug/{xdebug_3.1.1.bb => xdebug_3.2.0.bb} (91%)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_3.1.1.bb b/meta-webserver/recipes-php/xdebug/xdebug_3.2.0.bb
similarity index 91%
rename from meta-webserver/recipes-php/xdebug/xdebug_3.1.1.bb
rename to meta-webserver/recipes-php/xdebug/xdebug_3.2.0.bb
index 580ae7e89..fe6fc5bf9 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_3.1.1.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_3.2.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "php re2c-native"
 
 SRC_URI = "http://xdebug.org/files/xdebug-${PV}.tgz"
 
-SRC_URI[sha256sum] = "9be3ae0fdb4dc4a4c68084626cddc56f12396487e309a8c8dd318f0f900d1a68"
+SRC_URI[sha256sum] = "7769b20eecdadf5fbe9f582512c10b394fb575b6f7a8c3a3a82db6883e0032b7"
 
 UPSTREAM_CHECK_REGEX = "xdebug-(?P<pver>\d+(\.\d+)+)\.tgz"
 
-- 
2.34.1


