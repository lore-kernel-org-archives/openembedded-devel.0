Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E62C4332F
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 03:15:46 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web09.265.1668309337585776930
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Nov 2022 19:15:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UV3rY7bC;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668309335; i=@fujitsu.com;
	bh=08Vq5s8W0J7rMMl7gK7WTBN5xqyA9fX+6hU/k4GSTJU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=UV3rY7bCxMKwsWpw3npsPKK1ZCxRyPgdnBdvrkw6o+tuFZGC9HgVtZGC5wrqVAkNb
	 tSV9FEGv3i++QFJjj88C6lk4yD8BeXGdC/0u8sS9fiZDPUpVjKIVz9jpNVvFv/qwJx
	 VFUioYdp2Vmmy1RfAn8Mlm1ohXshJaclXnF7aF6+34VZwGWzZtigNfGSrfqg3j1L8U
	 NXp6i5JYY99iUuRf8tAT9hMaWu8PEsZ4IO8lcIZzabJlNrUzk8FckqKpdWSQcCjfab
	 hjwVGrsy0pPDaMdaGITpwCGhiwFVsnyVgBfASZC/0HGHVQCPQMTFcWx3iaQ2nMP8AT
	 cSON8GRFubTUw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8ORpBuWWJB
  s8GeyhsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFt7W/WglaOijeXLzE3MK5i72Lk4hASeMgo
  0Xj9ChuEc4VJ4uHuWUwQzh5GiV3T/7B0MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgLLHw5lJWEJtFQFVi1s+rjCA2r4CTxM0b35hAbAkBBYkpD98zQ8QFJU7OfMICMUdC4u
  CLF8wQNYoSsy83s0DYFRKzZrVB9apJXD23iXkCI/8sJO2zkLQvYGRaxWhanFpUllqka6iXVJS
  ZnlGSm5iZo5dYpZuol1qqW55aXAKUSSwv1kstLtYrrsxNzknRy0st2cQIDMaUYnbWHYwvlvzR
  O8QoycGkJMqbdj0/WYgvKT+lMiOxOCO+qDQntfgQowwHh5IE7+/IgmQhwaLU9NSKtMwcYGTAp
  CU4eJREeCvsgNK8xQWJucWZ6RCpU4z2HJsOX9nLzDF19r/9zBzLweTMr20HmIVY8vLzUqXEeR
  /HA7UJgLRllObBDYVF8iVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrxro4Gm8GTmlcDtfgV
  0FhPQWd8j80DOKklESEk1MNWnzXPQ4WXfqOrHVfi0d6fMqdvzp+exurl9MRFTvH5QcW1SvwiL
  2bR59QU/j5ss9/w9X+28g/tDxrs8b+64Tl6iJnSnS/t4wm3l5ujkC/t7ag1vfnKc/vZycG50S
  63UmrMbDKdm3U/UYpXzrP/N43B/UbTiS+fnPt/7vLKPfEr/n2qk9pHz6vZJbK3eiycrOv9P+y
  41sSVW594+++jkeftedtZMz4tbrP72YN+fE5clbLTfrnw76YyJf/9m1lVXLKbmJWUr7P44eaE
  i5xLvipm8Sa8Utoh9uMNyIUJkA0vu2bgdl5+s3+0qcc6zb/Lym8LX9h9eJa2+yqSJ3yf2LNe9
  LvfzC3nYZtmeePCsqEuJpTgj0VCLuag4EQBNV9iUXwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-585.messagelabs.com!1668309334!855274!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8486 invoked from network); 13 Nov 2022 03:15:34 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 03:15:34 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 4C3721B2
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:15:34 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 413721B1
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:15:34 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 03:15:32 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] byacc: upgrade 20220128 -> 20221106
Date: Sun, 13 Nov 2022 11:15:12 +0800
Message-ID: <1668309316-15398-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99567

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../byacc/{byacc_20220128.bb => byacc_20221106.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/byacc/{byacc_20220128.bb => byacc_20221106.bb} (82%)

diff --git a/meta-oe/recipes-extended/byacc/byacc_20220128.bb b/meta-oe/recipes-extended/byacc/byacc_20221106.bb
similarity index 82%
rename from meta-oe/recipes-extended/byacc/byacc_20220128.bb
rename to meta-oe/recipes-extended/byacc/byacc_20221106.bb
index 8aa8767d3..3a8b5f841 100644
--- a/meta-oe/recipes-extended/byacc/byacc_20220128.bb
+++ b/meta-oe/recipes-extended/byacc/byacc_20221106.bb
@@ -7,4 +7,4 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=62c37a10a2faf90235ee64280ad72737"
 require byacc.inc
 
-SRC_URI[sha256sum] = "42c1805cc529314e6a76326fe1b33e80c70862a44b01474da362e2f7db2d749c"
+SRC_URI[sha256sum] = "a899be227bbcac9cf7700f7dbb5a8494688f1f9f0617b510762daeace47b9d12"
-- 
2.25.1


