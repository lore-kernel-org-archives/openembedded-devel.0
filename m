Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408B6C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 08:33:13 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.22333.1647419592012384552
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 01:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gRYxxYzo;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647419590; i=@fujitsu.com;
	bh=TnEhGFqhMvf1c6pLybQ/M0OIkWA9cr5pcBKNgSJywqI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=gRYxxYzo6Y73OP1SUXy272xBTy0HzeFI5V/yBSxeQFLZFKwWHkUqgo0aAefAqCnoa
	 /2JE76O1IxmnxsoGj+dT/BY3M5HzaIILsdfOje9ukzCs49NO/KvAAvzrCJBHiJe7Pu
	 fKVxzWmT5NFj5fW1UoTj6eju7TBqgwdMJInj+VDCWzn6p9fVREssNj50lpRljahJmT
	 xXtkLevqYnFtjLIZ7dR88xfLcpe/FWD9YePaHfindrYuTtWYdVL+jzsG0xj6aS0TU8
	 3vSqpFbazihEu/XxF5/SCtSAaRA9WbdmzhV3jcfPY3AT8N66gCUeM3HpTObpkboqOR
	 ywvnmnmXxsqsA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqHt0gWG
  SwfRNZhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a9zR9ZCp5wVPw8eou9gfE3excjF4eQwBNG
  ib9n/0M5F5gkLj7fwgjhnGCUuN30mK2LkZODTUBNYvqtG6wgtoiAvsTS2XuYQWxmARWJF7972
  EFsYQF7iba/F8DiLAKqEj37O8HqeQWcJI7tmAZWIyGgIDHl4XuwGk4BZ4lJU/YwgthCQDVTL3
  9lhqgXlDg58wkLxHwJiYMvXjBD9CpKzL7czAJhV0jMmtXGBGGrSVw9t4l5AqPgLCTts5C0L2B
  kWsVolVSUmZ5RkpuYmaNraGCga2hoqmtsqWthpJdYpZuol1qqW55aXKIL5JYX66UWF+sVV+Ym
  56To5aWWbGIEhnFKsXrQDsZvK37qHWKU5GBSEuU9P9MwSYgvKT+lMiOxOCO+qDQntfgQowwHh
  5IE7+45QDnBotT01Iq0zBxgTMGkJTh4lER4XecBpXmLCxJzizPTIVKnGBWlxHkZQPoEQBIZpX
  lwbbA4vsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmNdmBtAUnsy8Erjpr4AWMwEtnietB7K
  4JBEhJdXApJ2RpDTD9hOLYNTLj26rV4ZLRkTc1emVsMq6mvf1tf8ssXNSP707lnB4B7FPnqH5
  cL3b08ybrt+TM3qzPPwsr7u+sVX6OfuLa2XaJ4+NW5T6D+i4zsprvfvfw2VvYjGf1JU5ipOSW
  XJzpqWl6DDcysq9tfXg3GiRLUrn7uSs/3r7tuiW/5/4D/X8ijos9iZb/mVu6D5mcxvOr6V/7v
  rslN6Qmd94x/5v+90Yg0ypmMZFK9zm8Jpfl3nnHWh+7br17qNRsRvjt0b2LHc8xS3TXr/ctKC
  6P1ZO8VS3lLLwnhPdHw1SduassL0oGv/ld8TGqSKClff1hcXMiz0sdqpmtO542Vj723faffbK
  DzeUWIozEg21mIuKEwG4n577XgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-548.messagelabs.com!1647419589!30604!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 325 invoked from network); 16 Mar 2022 08:33:09 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Mar 2022 08:33:09 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 6AA201001AB
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 08:33:09 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3A489100197
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 08:33:09 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 16 Mar 2022 08:32:57 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] evince: upgrade 41.3 -> 41.4
Date: Wed, 16 Mar 2022 16:32:39 +0800
Message-ID: <1647419561-81555-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647419561-81555-1-git-send-email-wangmy@fujitsu.com>
References: <1647419561-81555-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Mar 2022 08:33:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96007

Changelog:
=========
shell:
  * Fix crash when thumbnail extraction takes too long

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/evince/{evince_41.3.bb => evince_41.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/evince/{evince_41.3.bb => evince_41.4.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_41.3.bb b/meta-gnome/recipes-gnome/evince/evince_41.4.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/evince/evince_41.3.bb
rename to meta-gnome/recipes-gnome/evince/evince_41.4.bb
index 2dc0aeaa82..6b3479c264 100644
--- a/meta-gnome/recipes-gnome/evince/evince_41.3.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_41.4.bb
@@ -25,7 +25,7 @@ def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
 SRC_URI += " file://0001-Remove-incorrect-args-for-i18n.merge_file.patch"
-SRC_URI[archive.sha256sum] = "3346b01f9bdc8f2d5ffea92f110a090c64a3624942b5b543aad4592a9de33bb0"
+SRC_URI[archive.sha256sum] = "ff245240f230922bec32a4d7b0a1d91b247a83d13484f99b74035d51eb232130"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.25.1


