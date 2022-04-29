Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03083C433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:19:43 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web09.29490.1652084375899306306
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 01:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LrIL7CGn;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652084374; i=@fujitsu.com;
	bh=/RsbJSf9QjZwUpkcIQ2ZJctmFGnxO+IWQ5aVBPrwlg4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=LrIL7CGn74AZZ6fErIQAlpa5hDzvUStVhHSAEbjDhu82DZ6EUD12+cEhwOjgeGPYP
	 oy022ZtmJgzSRiTctpMpWPcFr6XKwKJa1xolMOZQ1MBE2ZV9DZXNNktyZieefNwlfO
	 MPFHRNchChVwRKP6LUCUZm4TZE850CglXVjk//Bjw2N0cIYMQHnWkI3PLTp6RyKjo/
	 44uQhivtdxgSS+H5SURg0DqewmLbrxUZJl4pcv8KSu3sIqKzoFgLhJGJJqlLawT11u
	 nIha43owr1XNGfynwfvGyHhoYkXwG0SN/gs6i8wNBxkLsu6SPex1jw7OIj8rCQXF/x
	 TNcvmy7E3VxiA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8MxSXfquYo
  kg7MztC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozGw3eZCu5zVixtfMrSwPieo4uRi0NI4Amj
  xMfP15khnAtMEq8OfGKBcHYzSjzbtYyxi5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBD4kpq5axdTFycLAIqEqc35gNYvIKOEm86BMEqZAQUJCY8vA9WCengLPE5XubwaYLAZ
  U8n3ySCcTmFRCUODnzCQvEdAmJgy9eMEP0KkrMvtzMAmFXSMya1cYEYatJXD23iXkCo+AsJO2
  zkLQvYGRaxWiZVJSZnlGSm5iZo2toYKBraGiqa6hraqmXWKWbqJdaqlueWlyia6iXWF6sl1pc
  rFdcmZuck6KXl1qyiREYwCnFjNY7GDv6fuodYpTkYFIS5a1sqkgS4kvKT6nMSCzOiC8qzUktP
  sQow8GhJMHrcAooJ1iUmp5akZaZA4wmmLQEB4+SCO/dE0Bp3uKCxNzizHSI1ClGXY67C/fuZR
  ZiycvPS5US5+U+C1QkAFKUUZoHNwIW2ZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfM6gkz
  hycwrgdv0CugIJqAjPgaUghxRkoiQkmpgisuV5yr105r2wVf8dKGc0jyeJO0AucjrTwIkZdT4
  J+qx7ZW6Mbdx7apVC46ssr3APuOP3I1V3ycd0GzQ/fzANeXXNPUopzqTGzI1h95MmTlpUkt17
  p2zbXzL5Zk4zs0U/uduaOEovfreBzenL3UtibNueWTW2kf8nql+bRKv9afzAQGsm7ZJflk670
  mQ0LLNmUm5fkuSZ7w5amlz3PZs5soFM3uunXn5wPRF/uf+o609zzbutVV22HRCoavOMTRP+Ux
  k1Wl3iz2GGh3HbJb+eP+kZIPA3fqgqZYLqg8In3/4bvK99gbzErNnG59L5wdf9JRcz6F+IeLR
  p1D2c7VrjNh0/gZ1WM1bF/4+oUP0lRJLcUaioRZzUXEiABOBW/pnAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-591.messagelabs.com!1652084373!316287!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28183 invoked from network); 9 May 2022 08:19:33 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 08:19:33 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 3FB4D100353
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:19:33 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 330FC10032A
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:19:33 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 09:19:11 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] fuse3: upgrade 3.10.5 -> 3.11.0
Date: Fri, 29 Apr 2022 16:01:13 +0800
Message-ID: <1651219273-27341-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651219273-27341-1-git-send-email-wangmy@fujitsu.com>
References: <1651219273-27341-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 08:19:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96991

Changelog:
=========
    Add support for flag FOPEN_NOFLUSH for avoiding flush on close.
    Fixed returning an error condition to ioctl(2)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/fuse/{fuse3_3.10.5.bb => fuse3_3.11.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-support/fuse/{fuse3_3.10.5.bb => fuse3_3.11.0.bb} (95%)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.10.5.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.11.0.bb
similarity index 95%
rename from meta-filesystems/recipes-support/fuse/fuse3_3.10.5.bb
rename to meta-filesystems/recipes-support/fuse/fuse3_3.11.0.bb
index e0cf2092a..0b9164fd7 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.10.5.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.11.0.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://GPL2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV}.tar.xz \
 "
-SRC_URI[sha256sum] = "b2e283485d47404ac896dd0bb7f7ba81e1470838e677e45f659804c3a3b69666"
+SRC_URI[sha256sum] = "8982c4c521daf3974dda8a5d55d575c988da13a571970f00aea149eb54fdf14c"
 
 S = "${WORKDIR}/fuse-${PV}"
 
-- 
2.25.1


