Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188ABECAAD2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 06:38:34 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web08.67847.1661755106844602271
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:38:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lQXWjNlo;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661755105; i=@fujitsu.com;
	bh=UpfoXLuJgFgJ7LfzOy35sJoeTRKHN014FABNup+Gr1Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=lQXWjNloFfHfbbyHzRIXY64uv8nDgutwoeVPuhYL6USaobp6kDMeAO7xJnFmmhTF0
	 xPbkRstPk/3/eZCzoN0aj4FK2RIqFrQnlhX8+YO+BCGkqEKePsf6ZTId2cIX8OCA2q
	 wraoHlxAhWu31b3lNLyFH3eY/Tqza2sKy73NQ6zN7lUB4Vhtvco2tm5uSCPHy/xzyl
	 AzCci1bMmnvXL2SAZ+hY+r2pZVPbKs7bMbKnIHdw9EP8QTmPjABDZH+xhq/Ayu1tVe
	 juCoYO9MlFEnA3ZIzO8snAS93pquYKjBSAd2vOilIhpDbt5UGf3Vbm/s4J8c2fo/3S
	 79dbA/VuCdTDg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8MxSfdBHE+
  ywYqPZhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bqT23MBUc5Ki5eX8TawPiavYuRi0NI4Amj
  xOy2s6wQzg0miflnp7BBOHsZJeZ+PMDcxcjJwSagJjH91g1WEFtEQF9i6ew9YHFmARWJF7972
  EFsYQEbifd9dxhBbBYBVYnpD6aC1fMKOEo8ONECZksIKEhMefgerJdTwEmifedCNhBbCKhm8a
  0P7BD1ghInZz5hgZgvIXHwxQtmiF5FidmXm1kg7EqJPbP6mSBsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYrZOKMtMzSnITM3N0DQ0MdA0NTXWNjXQNjcz0Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WK
  K3OTc1L08lJLNjECAzmlWKFuB+O1lT/1DjFKcjApifKamPMkC/El5adUZiQWZ8QXleakFh9il
  OHgUJLgdYwFygkWpaanVqRl5gCjCiYtwcGjJMJ7ASTNW1yQmFucmQ6ROsWoyzHza9sBZiGWvP
  y8VClxXnZgjAoJgBRllObBjYBF+CVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrxXQFbxZOa
  VwG16BXQEE9ARD5dwgxxRkoiQkmpg6phQz7i3ILbM9ELB3+V9c+betnEWfWDD7hwZ09xYKmtX
  /Cej4I5HvNp+5gcxXhlpbpFv6hf4GCUudpWp4zw6N96yW231c/f5PycevPjoysU9EQ7zjkTfV
  fS8KnSvuJzL10fq8uf6aB1Oc22HcPb1n051M9vHvP+Q81251LHTgzdk22MtT3mVTN35iwxz/x
  3/9DzaWJrl3/N7wRFvrc68/Fhknc5ktFk78LKZkUjjOSXHa0xVC3bFxknfeJzgE7DNqlBab2e
  W7Cv/izZOt8+VrdF1Wxb5h+W+UNgLdeZNNzbPvckULXM56vhE87b5JqcnHcubf19O9PMZjw+/
  1u5ZIJcRddTst9K1967R27SUWIozEg21mIuKEwG+YrsAawMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-548.messagelabs.com!1661755104!121809!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 584 invoked from network); 29 Aug 2022 06:38:24 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Aug 2022 06:38:24 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9A8561000CC
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:38:24 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8EAF6100078
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:38:24 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 29 Aug 2022 07:38:22 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] tree: upgrade 2.0.2 -> 2.0.3
Date: Mon, 29 Aug 2022 14:37:39 +0800
Message-ID: <1661755059-4785-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661755059-4785-1-git-send-email-wangmy@fujitsu.com>
References: <1661755059-4785-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 06:38:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98509

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/tree/{tree_2.0.2.bb => tree_2.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tree/{tree_2.0.2.bb => tree_2.0.3.bb} (87%)

diff --git a/meta-oe/recipes-support/tree/tree_2.0.2.bb b/meta-oe/recipes-support/tree/tree_2.0.3.bb
similarity index 87%
rename from meta-oe/recipes-support/tree/tree_2.0.2.bb
rename to meta-oe/recipes-support/tree/tree_2.0.3.bb
index 26b6074ed3..c5f3364a37 100644
--- a/meta-oe/recipes-support/tree/tree_2.0.2.bb
+++ b/meta-oe/recipes-support/tree/tree_2.0.3.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 SRC_URI = "http://mama.indstate.edu/users/ice/tree/src/${BP}.tgz"
-SRC_URI[sha256sum] = "7d693a1d88d3c4e70a73e03b8dbbdc12c2945d482647494f2f5bd83a479eeeaf"
+SRC_URI[sha256sum] = "ba14e77b5f9dc7f8250c3f702ec5b6be2f93cd0fa87311bab3239676866a3b1d"
 
 # tree's default CFLAGS for Linux
 CFLAGS += "-Wall -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
-- 
2.25.1


