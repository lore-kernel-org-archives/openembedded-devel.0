Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC27C678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 13:24:01 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.6807.1678281836163786582
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Mar 2023 05:23:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=utYTsNsJ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678281834; i=@fujitsu.com;
	bh=FKliRM07FQ1pCOFaIRGpXcu96NYnZmSsYmnyQ1Ie6dA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=utYTsNsJB2PMkmbS66biYSLsk29YqZcU/djy+RkhWdQswlRfW/sLmkLjB3R1RNSyx
	 nHMPfoTkklmjRfKaHSV8WbiloGV+tCM642+e7e9f64IBDng1REpmO2v4WMso09AnKo
	 t0jit26/Lj3bGxLRxjLLz+Fk1OL6ddjfCNKJm7S8/OkfrIXEuNC55re+pAHxy4xOcv
	 28QTcw5glOuNSjFgxue+e2hG1bEEPmHX7SeICpsbXZizlNgS5pydcppZRKEXkTzmOO
	 DJKGVRed0BH5jrtT4WlhIQf/IndqaskuXAvxJSTH2vbZp+04XtmQPf2PKDXEJ3rDxs
	 Z0SEC72xNBViA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORqJvZw5F
  isPOvlcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrF08272go0cFZ/mnmRsYDzH3sXIxSEk8IRR
  Ys/vFkYI5waTxJnnfUwQzh5GifVzjwNlODnYBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48buHH
  cQWFnCQWLL8H1icBSjevP85UC8HB6+Ak8TOmfwgYQkBBYkpD9+DlXAKOEvMXHqaBcQWAiq52X
  SSFcTmFRCUODnzCQvEeAmJgy9eMEP0KkrMvtzMAmFXSrR++AVlq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaF6cWlSWWqRraKmXVJSZnlGSm5iZo5dYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdcmZuc
  k6KXl1qyiREYvinFaV93MM7u+6t3iFGSg0lJlJc1hiNFiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gTvpy6gnGBRanpqRVpmDjCWYNISHDxKIrx364HSvMUFibnFmekQqVOMilLivBtA+gRAEhmleX
  BtsPi9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYdzvIFJ7MvBK46a+AFjMBLb6wnwVkcUk
  iQkqqgUliTSHDjfJte8KOHZjjccS0Y1+FiFd5eVqTop5zqOXRrvurp2x6utFEa/V82bvZ56v1
  vmVecg6YPEOa48Hm5VkycwWSdHnvK7xcdTv/L6OkuD+TX5Qyu8is/2H3Jp0M0/l5mdn390zDH
  3kdzS/2/EqOYGC23Pfcbj4/g5itc9+/wGnayasurF444Y3pxK1beTVuzUuvb9pne/S8lBq3ec
  HfqXyMC/tue2i9U7ht1MnY0Kcn8paHTzbh2ZY7h9OzmQ7erilUS+Z/Zt15ZMcdv7/cktcYpU3
  6tr8xdD42VVZ0p/WHuzxihgYV5vXvY+KDjyTwcFRcLDnMuOFB8tPj/MvC9u6Wn3iOp1Jxp2Vj
  gxJLcUaioRZzUXEiABmfewJaAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-732.messagelabs.com!1678281833!977273!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21471 invoked from network); 8 Mar 2023 13:23:53 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Mar 2023 13:23:53 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 5AF9F1001A3
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Mar 2023 13:23:53 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 4E89C100198
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Mar 2023 13:23:53 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Mar 2023 13:23:51 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] librsync: upgrade 2.3.2 -> 2.3.4
Date: Wed, 8 Mar 2023 21:23:37 +0800
Message-ID: <1678281820-25489-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678281820-25489-1-git-send-email-wangmy@fujitsu.com>
References: <1678281820-25489-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 13:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101417

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../librsync/{librsync_2.3.2.bb => librsync_2.3.4.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/librsync/{librsync_2.3.2.bb => librsync_2.3.4.bb} (89%)

diff --git a/meta-oe/recipes-support/librsync/librsync_2.3.2.bb b/meta-oe/recipes-support/librsync/librsync_2.3.4.bb
similarity index 89%
rename from meta-oe/recipes-support/librsync/librsync_2.3.2.bb
rename to meta-oe/recipes-support/librsync/librsync_2.3.4.bb
index ccc68967b..cb30f4c31 100644
--- a/meta-oe/recipes-support/librsync/librsync_2.3.2.bb
+++ b/meta-oe/recipes-support/librsync/librsync_2.3.4.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
 SRC_URI = "git://github.com/librsync/librsync.git;branch=master;protocol=https"
-SRCREV = "42b636d2a65ab6914ea7cac50886da28192aaf9b"
+SRCREV = "e364852674780e43d578e4239128ff7014190ed3"
 S = "${WORKDIR}/git"
 
 DEPENDS = "popt"
-- 
2.34.1


