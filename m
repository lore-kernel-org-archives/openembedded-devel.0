Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E46C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 02:18:09 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web08.4343.1634609888042279420
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 19:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yiVsWkNn;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634609880; i=@fujitsu.com;
	bh=tpT/QkNfXYzS0+KC5wchLZX6taAGHDxhZAz4/q5gqaQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=yiVsWkNnRkJmbYa9o4YZritzzx4TxmLB0G9ZFZlitGFtq1rH+99muhl/1sm1VhYog
	 5Gj1ZObJcHjaieL2zuIpCAezUkVDw2Y1jnim18L780EMjzIxtrWk9KR9cYkM1ehE+H
	 XCHY1HmmYctATSqIO4W3VOz+SStE9e663uJ19FMGzy56iEq7uI1iqzr6F/8GsjyzV1
	 H8Be+WpnraMDFL4DvC3FYVS2Qq6AIrF5u8retTNq6jieXsGj7HucTrkKN8RgbI8J1L
	 KqFZa/lddETKfC5vZBBwxQ5q5mP2mohDNLKdh7OL/P5oc4/yHObZwnnUawGkHq6AbD
	 WHDKQ8vbfurTQ==
Received: from [100.112.195.149] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 08/1E-17143-7DA2E616;
 Tue, 19 Oct 2021 02:17:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8MxSfe6Vl6
  iwbJJXBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bc2Z8YC/5zV3w7v42tgfEHVxcjF4eQwBNG
  iYWvj7FBOBeYJJYsvMbUxcgJ5JxglPj3zxvEZhNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAUeLE2Q4wm0VAVWJz30+wGl4BZ4mnW/6wgNgSAgoSUx6+B4tzCrhIdLx7wwqxy1mi60
  oDC0S9oMTJmU9YIOZLSBx88YIZoldRYvblZqg5FRKzZrUxQdhqElfPbWKewCg4C0n7LCTtCxi
  ZVjFaJBVlpmeU5CZm5ugaGhjoGhoa6RpaArGRmV5ilW6iXmqpbnlqcYmuoV5iebFecWVuck6K
  Xl5qySZGYACnFByo28H44PUHvUOMkhxMSqK8DhdzE4X4kvJTKjMSizPii0pzUosPMcpwcChJ8
  PZp5CUKCRalpqdWpGXmAKMJJi3BwaMkwvtPBSjNW1yQmFucmQ6ROsWoKCXOmwiMQSEBkERGaR
  5cGyyCLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5jUCmcKTmVcCN/0V0GImoMVXnXNAFpc
  kIqSkGph6Dp8ry5C/ZnZDIakicfrv5FnfMjauXzW16DRXqHdDcajzLi7Rh+ISbd5ffrBlJKj/
  2Jv4UX6S5X3HD4em8GyMqJ2oGq7ovdNBbbbLrrueplstNvee3LQ+zef75bDEQNf83tdchgX3k
  lY2HT/3cPrRk092PF6QsV0/dcrCkskOldlzV+15NZH7ntsMxQyXW3E7ViWemJL/oulC1U+l5C
  37/h24xPdX5eIBoXUrb6WdEG/avzxBJ+zYgv8R51pLU8tTm+6LJ2jw2CybGxZw/tqshXI6cus
  /3Ypl6Z+aF/dgWt6BQiOh3SWFi/Z/yC7/feWh1Zy4A8aPiq/ZTpBP89UxWnwqqoVjYWjotBvm
  sbNfKrEUZyQaajEXFScCAPB8sQpbAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-265.messagelabs.com!1634609878!2371239!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5400 invoked from network); 19 Oct 2021 02:17:59 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Oct 2021 02:17:59 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B43AB100464
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 03:17:58 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A78C5100452
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 03:17:58 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Tue, 19 Oct 2021 03:17:40 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] asio: upgrade 1.18.1.bb -> 1.20.0
Date: Tue, 19 Oct 2021 10:17:24 +0800
Message-ID: <1634609846-130627-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634609846-130627-1-git-send-email-wangmy@fujitsu.com>
References: <1634609846-130627-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Oct 2021 02:18:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93447

release note:
Fixed experimental::coro compatibility with gcc.
Fixed experimental::promise compatibility with gcc.
Added documentation for per-operation cancellation.
Added documentation for parallel_group.
Added overview documentation for experimental::coro.
Added some missing C++14 examples.
Updated C++20 coroutines overview documentation.

-License-Update: Copyright year updated to 2021.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/asio/{asio_1.18.1.bb => asio_1.20.0.bb}  | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/asio/{asio_1.18.1.bb => asio_1.20.0.bb} (77%)

diff --git a/meta-oe/recipes-support/asio/asio_1.18.1.bb b/meta-oe/recipes-support/asio/asio_1.20.0.bb
similarity index 77%
rename from meta-oe/recipes-support/asio/asio_1.18.1.bb
rename to meta-oe/recipes-support/asio/asio_1.20.0.bb
index 530e061968..cedcf9fee0 100644
--- a/meta-oe/recipes-support/asio/asio_1.18.1.bb
+++ b/meta-oe/recipes-support/asio/asio_1.20.0.bb
@@ -15,10 +15,9 @@ inherit autotools
 
 ALLOW_EMPTY:${PN} = "1"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=de86c8210a433f72bd3cc98e797a6084"
+LIC_FILES_CHKSUM = "file://COPYING;md5=416f4cc4f79551b690babb14ef1a5799"
 
-SRC_URI[md5sum] = "00807b2e976f467b3cec85d1589f0825"
-SRC_URI[sha256sum] = "4af9875df5497fdd507231f4b7346e17d96fc06fe10fd30e2b3750715a329113"
+SRC_URI[sha256sum] = "204374d3cadff1b57a63f4c343cbadcee28374c072dc04b549d772dbba9f650c"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
 
-- 
2.25.1


