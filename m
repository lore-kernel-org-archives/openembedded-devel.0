Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ECE6C32793
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 01:00:19 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.5877.1661302816017109298
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 18:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=swfWqoH9;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661302814; i=@fujitsu.com;
	bh=S/pc6TiPPYj/LYBF/sSADb2TfA2hPpOUmUpShSUGgmE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=swfWqoH9NbUnxLTQttNHna+/jg1UKuwLQFczuhKRyCMy3mUusZ5Y2KtsPWJ+jF6no
	 eslRvtFJGr94cl5XW6oYqnn+hvTySksNW+qfjVRCjp8E6a7xDCg/rm+V1+k1u2WFcS
	 AoRWPbwPEy4MmIY1nkeZXem18U3xogdigP4kaUmYnXQjqyV3HcjwSXSZ7m0iBxTUe9
	 JH1LoEs3EYfoEBNdDdNAXm/+PYei9RUUb60X6Q+v97B2RrzhavElYxWz/wajeGO+4P
	 v1u/3j99A1P/ShQ6m528Z+TEKl0vBYTi7v/WEDnvfbEhE4zm7xXo/4UyBUXWaHANQ7
	 O12ygMhW2vhWQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8ORpCtbwZp
  scGO+mcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFl7x62gtMcFdt6TjE1MH5j72Lk4hASeMgo
  cXPaZkYI5yqTxIGed2wQzl5Giet7vwI5nBxsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILCwRLbF2yACzOIqAqMXXPVBYQm1fASWLn+pWMILaEgILElIfvmSHighInZz5hgZgjIXHwxQ
  tmiBpFidmXm1kg7EqJPbP6mSBsNYmr5zYxT2Dkn4WkfRaS9gWMTKsYrZOKMtMzSnITM3N0DQ0
  MdA0NTXWNjXQNLSz1Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WKK3OTc1L08lJLNjECAzOlWGHv
  DsbLK3/qHWKU5GBSEuW9JsaaLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC17YcKCdYlJqeWpGWm
  QOMEpi0BAePkgjvijSgNG9xQWJucWY6ROoUoyXH2oYDe5k5rl65AiRnfm07wCzEkpeflyolzr
  umDKhBAKQhozQPbhwski8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEua9UAI0hSczrwRu6yu
  gg5iADgrazQxyUEkiQkqqgckkZJ17q5m9jbFGAePkDpP5S1uu+9ZM2V5tdG7Cppe8ux9Y9E43
  jD/51dr4qqNzz8qq5N4DnDviHvSydFUKzY8rCpH/pvfs7WytyfJaU1Zbmz/V5n+9pVB7jfQXL
  cX6u0+mTjTR/HuW8cx+v4eXa5frbTdwfDJrFpfyS8GfqncW/zkizOAR67MnYPnLrZcW2D48V7
  qH8WObk9nUkum7JE/7ibEccO4U1rXaHjJzm3hhlvRr9vdf9u5ZdWiltLi+slzBlwrTZYWP2A8
  2PJBZeeyf6K9C4S/s8/YH2jl83LVa46DaPU2XSysD17QxOK9bcU9pq/DD/EusAk07ZYPKHTQ8
  0yaIFD6yTZxYsqR6XaASS3FGoqEWc1FxIgC5Mw33XwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-548.messagelabs.com!1661302813!16084!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12482 invoked from network); 24 Aug 2022 01:00:13 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-14.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 Aug 2022 01:00:13 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 984521AE
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 02:00:13 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 8C2DD1A3
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 02:00:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 24 Aug 2022 02:00:12 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] xfstests: upgrade 2022.07.31 ->
 2022.08.07
Date: Wed, 24 Aug 2022 08:59:50 +0800
Message-ID: <1661302793-10559-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Aug 2022 01:00:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98404

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xfstests/{xfstests_2022.07.31.bb => xfstests_2022.08.07.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfstests/{xfstests_2022.07.31.bb => xfstests_2022.08.07.bb} (97%)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2022.07.31.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2022.08.07.bb
similarity index 97%
rename from meta-filesystems/recipes-utils/xfstests/xfstests_2022.07.31.bb
rename to meta-filesystems/recipes-utils/xfstests/xfstests_2022.08.07.bb
index 647b6fcd73..ba8b1a24e0 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2022.07.31.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2022.08.07.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
 "
 
-SRCREV_xfstests = "b91889d79e1d92e22860504e40108a2e4d054c33"
+SRCREV_xfstests = "16ddbd1aee295f64695916cf3621aef57f1163ba"
 SRCREV_unionmount = "e3825b16b46f4c4574a1a69909944c059835f914"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


