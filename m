Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16DAFC32793
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 01:00:29 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.5879.1661302824478798780
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 18:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=puJZhGdJ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661302822; i=@fujitsu.com;
	bh=qPgQtxORfe0RFz5FgfF2njiY7F8xtYLp/P31aCfASHc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=puJZhGdJWI8MBQXGlTuyiYfnlLV62B5mLNjYqWEiO3FYZ0SypjeC80Gd/iU2+S4D2
	 kjtXbPjp03bsVwOgs8waooMnSz/QpL0EH8M0UNrBHOxN4oLIEYS8t5/MyPWP2miWyO
	 nmWyQg08irLEnVXyGdhfQ9UuuMx486xfb+ntP0OfmeKjHUxYgFNGr47VnT36DgL4AF
	 mvVXwkU+FVAumdqEcuvNDEKzeoDlFfXBjaCkYWngXNWMBaUT3aDPseu1lOBkNlX6N3
	 S6drSjrwXhTy7WktVpAkU6I0/dd3XOsZLwKSRljcSj0uBJTCpFLkgFYGRQXrJ0zB4c
	 KlwJ4rJHv6egA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8OxWVetgjX
  ZYPdpKYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP3h+msBTc5Ko4fv83SwPiLvYuRi0NI4CGj
  xO47LUwQzlUmie8rVrBCOHsZJRpfL2fsYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAXaLv+CEwm0VAVWLu3pNg9bwCThK7+2eA1UsIKEhMefgezOYUcJZ49uAISxcjB9AyJ4
  krv7UhygUlTs58wgIxXkLi4IsXUK2KErMvN7NA2JUSe2b1M0HYahJXz21insAoOAtJ+ywk7Qs
  YmVYxWicVZaZnlOQmZuboGhoY6BoamuoaW+oaGRjoJVbpJuqlluqWpxaX6BrpJZYX66UWF+sV
  V+Ym56To5aWWbGIEhnFKsfqJHYxPV/7UO8QoycGkJMp7TYw1WYgvKT+lMiOxOCO+qDQntfgQo
  wwHh5IEr205UE6wKDU9tSItMwcYUzBpCQ4eJRHeFWlAad7igsTc4sx0iNQpRmOOq1eu7GXmmP
  m17QCzEEtefl6qlDjvmjKgUgGQ0ozSPLhBsFi/xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUm
  Y90IJ0BSezLwSuH2vgE5hAjolaDczyCkliQgpqQamUs6cnwI/p8/hnZSjJjVr4itXjhx2/WMX
  QiaJ/ym8v24tp+amvTbGkZY2s3n+vZV9seNSYVX2q3teFzkkDSZsdpq9eO19ThuNR2tKZCSeT
  wvQ5xK8d+dD+4eaxg9b6tvurf3bIPClLfT5y2PXf1n9OvHi14+/QeHfIrYe+/BA+E6+Rp3E6e
  zmywKWV1km75r18Irv44LrOZ4Wv5YHtLu5VkwQezYp6+Ufzxs/1L8Zn0nq/6cefcYhX8nbacP
  8yFtKS5czWb7wum5YluyvuUSm6j3buZdSLHHvGb69/SzDksjByD5zbZXNd6Zux6Wv5lZbf9O/
  4vRaaZJT6LPWqoAl1yfM5FrFE3TQSmtyueOzQ0osxRmJhlrMRcWJAB0XfjVwAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-571.messagelabs.com!1661302822!304618!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19766 invoked from network); 24 Aug 2022 01:00:22 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-14.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 Aug 2022 01:00:22 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 277AB150
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 02:00:22 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 1B69414C
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 02:00:22 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 24 Aug 2022 02:00:20 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] rdma-core: upgrade 41.0 -> 42.0
Date: Wed, 24 Aug 2022 08:59:52 +0800
Message-ID: <1661302793-10559-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661302793-10559-1-git-send-email-wangmy@fujitsu.com>
References: <1661302793-10559-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Aug 2022 01:00:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98406

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rdma-core/{rdma-core_41.0.bb => rdma-core_42.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/rdma-core/{rdma-core_41.0.bb => rdma-core_42.0.bb} (95%)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_41.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_42.0.bb
similarity index 95%
rename from meta-networking/recipes-support/rdma-core/rdma-core_41.0.bb
rename to meta-networking/recipes-support/rdma-core/rdma-core_42.0.bb
index e5ecc5cd62..e1123dcc14 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_41.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_42.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "libnl"
 RDEPENDS:${PN} = "bash perl"
 
 SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=https"
-SRCREV = "467363efbc0fea706752c1ba7a21c313823017e7"
+SRCREV = "196bad56ed060612e22674b668b5ec3d8659ade3"
 S = "${WORKDIR}/git"
 
 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
-- 
2.25.1


