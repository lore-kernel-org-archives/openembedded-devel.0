Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12590C433EF
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 15:04:20 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.7556.1637593458536150441
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 07:04:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KgRAM9mN;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637593456; i=@fujitsu.com;
	bh=00d0LbHQ6pGhqJsZoFi2JU9YzBAZePFKuOUEJKRbkys=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=KgRAM9mNNYci7f9gGuInwPOwDFoI3qxf8T0HOLZjr1zywOcuOt4iZj4k+W5710NA6
	 prJJIUgG/xNKzv0qVGS9abMJ/9w0LLwHBezNF3DCQAb+vRIQ2kzJQfYHYz197pX8Pq
	 mhMgyWzN8G0C2YfmgVRaC6BFig2Y0g7uPIFEmkimugOyNJyTvA+qs6QUCMJmOgFld9
	 mIHzW2gCdsPg5YDq81PNO8shH9v6ukgC7BMpGeYd2cqsv+g/iEmZzAlRKRLavpNzi7
	 awxmHeUvEj88eFeThd1QjoyotxXQSbYrJNt13Yl0217HtBu2dmt4uWklICEfl1Bf8D
	 LkKeVGG9Ogftg==
Received: from [100.112.195.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 52/8F-02128-F61BB916;
 Mon, 22 Nov 2021 15:04:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8ORqJu/cXa
  iwaYLkhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a535/YCp7xVFzses3cwLiXu4uRi0NI4Amj
  xNmnSxkhnAtMEoc/P2aHcE4wSpy5uIO5i5GTg01ATWL6rRusILaIgL7E0tl7wOLMAioSL373A
  DVwcAgL2Eq8O8UPYrIIqErM3MMEUsEr4CTxYsIHMFtCQEFiysP3zBBxQYmTM5+wQEyRkDj44g
  UzRI2ixOzLzSwQdoXErFltUL1qElfPbWKewMg/C0n7LCTtCxiZVjFaJBVlpmeU5CZm5ugaGhj
  oGhoa6RpaGusaGZvoJVbpJuqlluqWpxaX6BrqJZYX6xVX5ibnpOjlpZZsYgSGY0rBwVc7GFe+
  +aB3iFGSg0lJlNdo9uxEIb6k/JTKjMTijPii0pzU4kOMMhwcShK8j9cB5QSLUtNTK9Iyc4CxA
  ZOW4OBREuF1AEnzFhck5hZnpkOkTjHqcrxu+bmDWYglLz8vVUqc9+AGoCIBkKKM0jy4EbA4vc
  QoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmHcVyBSezLwSuE2vgI5gAjri9PHpIEeUJCKkpBq
  YnLNLkuYn188OeVd6x+VSg7LhhER2kycnkpbutfwc+PaG96HgJ8X6Lj0LjOf/vHg0sWyf7LSt
  xkubXW5UTJ+um9+2Mb3swkrOt/nzjB99Dr5R8y2rWe5gubXp/vBNYszffwQ88FdNvHM3iY9ns
  Thzg2jq4vkM3Ac/RZwIm3tts+WDOz3u9yxznHzbvlwUasmcxP3tmRqzb94apVPla5xuJ6mL31
  E4+WfF0g01jWFxF+7u/JJy0rB5884E5ft2vot0U/ZVX6oMmj8x59i6SzaXXlyVi0mOf297ZNr
  ZWLbTQYrnPi2YPtHeufbP+3kb6iLt32w/p7zfwsLkpWfahjkHfE9uSnp44qXyr5hVKwyWSyqx
  FGckGmoxFxUnAgByxN/fTgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-271.messagelabs.com!1637593455!424967!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20901 invoked from network); 22 Nov 2021 15:04:15 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Nov 2021 15:04:15 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E73DE100244
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 15:04:14 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D9224100231
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 15:04:14 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 22 Nov 2021 15:03:59 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libqb: upgrade 2.0.3 -> 2.0.4
Date: Mon, 22 Nov 2021 23:03:48 +0800
Message-ID: <1637593430-99394-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Nov 2021 15:04:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94099

The most important fix in this release is that we no longer log errors inside
the signal handler in loop_poll.c
This could cause an application hang in some circumstances.

Changelog is as follows:
doxygen2man: print structure descriptions
(https://github.com/ClusterLabs/libqb/pull/443)

Fix pthread returns
(https://github.com/ClusterLabs/libqb/pull/444)

poll: Don't log in a signal handler
(https://github.com/ClusterLabs/libqb/pull/447)

Bump library version for v2.0.4

Implement heap based timer list
(https://github.com/ClusterLabs/libqb/pull/439)

build: Fix undefined pthread reference.
(https://github.com/ClusterLabs/libqb/pull/440)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/libqb/{libqb_2.0.3.bb => libqb_2.0.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libqb/{libqb_2.0.3.bb => libqb_2.0.4.bb} (93%)

diff --git a/meta-oe/recipes-extended/libqb/libqb_2.0.3.bb b/meta-oe/recipes-extended/libqb/libqb_2.0.4.bb
similarity index 93%
rename from meta-oe/recipes-extended/libqb/libqb_2.0.3.bb
rename to meta-oe/recipes-extended/libqb/libqb_2.0.4.bb
index 23c3e92dfa..f3472b481a 100644
--- a/meta-oe/recipes-extended/libqb/libqb_2.0.3.bb
+++ b/meta-oe/recipes-extended/libqb/libqb_2.0.4.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=321bf41f280cf805086dd5a720b37785"
 
 inherit autotools pkgconfig
 
-SRCREV = "404adbcd998ec83643e47d92b3ea8d9c3970e68b"
+SRCREV = "a2691b96188033b5ad5c08871982048ae1f4f4e8"
 SRC_URI = "git://github.com/ClusterLabs/${BPN}.git;branch=master;protocol=https \
           "
 S = "${WORKDIR}/git"
-- 
2.25.1


