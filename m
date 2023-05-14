Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBCF8C7EE24
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 13:06:55 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.66070.1684069609968874429
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 06:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eGN+5ZBF;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1684069608; i=@fujitsu.com;
	bh=4hMfz1lFPLmpshAWBqCQULYXPvsYLfw5R8iBBzBRWAs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=eGN+5ZBFK4Fk7wUkl25IpYuefVUuVjaL5CH9Ac3TdFT+++1cca2oFcMVhEwIopEEt
	 OValxxpHwaiSeZUnyXl6qPyDacRYXSN/9t1Q0TI3SkzKAF7s8N0CKh7jIx890sAebK
	 yGmI7TqKr7cqaINJqP0L4N/QLUsHjiCeq1HeZf5tJsCuinepnLdhEb+RwmIrGXX/Du
	 +crsZP9N+YCWjon7johZszELELFE5jIewKAuEbITxYG9lz99GUqh6YUEKzjqAGyW1C
	 tlfWN/JfkpY+7c9mEMsL6v9sl8MQj1211zueTU1iFvz5TZxoP5d3C7wTdnIAr3j6bL
	 rUVZOI6AFd60g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRWlGSWpSXmKPExsViZ8ORpPv0TkK
  Kwec5xhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bX3LKCpVwVW96sYWtgPMDZxcjFISSwkVHi
  y6TNrBDONCaJK30/WboYOTnYBCQkpu89yQ5iiwjoSnz8MJcRxGYWUJGYMfkIE4gtLBAg8bd7L
  VicRUBV4sXcuWwgNq+Ak8TWFevBbAkBBYkpD98zg9icAs4SGz+8B6sXAqpZcmMNO0SNmsTVc5
  uYJzDyLGBkWMVoXpxaVJZapGtooJdUlJmeUZKbmJmjl1ilm6iXWqqbl19UkqFrqJdYXqyXWly
  sV1yZm5yTopeXWrKJERgUKcUJtjsY1+z6q3eIUZKDSUmU91pJXIoQX1J+SmVGYnFGfFFpTmrx
  IUYZDg4lCV6dmwkpQoJFqempFWmZOcAAhUlLcPAoifDGXQVK8xYXJOYWZ6ZDpE4xKkqJ8x4A6
  RMASWSU5sG1waLiEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXp4bQFN4MvNK4Ka/AlrMBL
  T41p54kMUliQgpqQamtPxt1zJ8pdbpTJi1Rcrz4dMFTKsv39OxEJq0SUWiwVch8PeTRqHb9Sq
  3nu5JKZreelh92jTeYMa/yo2B73w6d71bwxIx76vnK4epkTvS5nC8fnthvcPEzvlF6y19bne5
  CJ4L6v0u8lv0SF2txa2fjh0bPPsbgs1u/NlcrXbz+Mfn+dFxSmdUK39/Y337492s83Erg+/f5
  77WtVj9uMD3fS3BqxbblXbn9C+YZBdmyb/r7sa+VyqP+J0WNhb0/o2ZXq6SGfX3Xt7t0xUMjM
  6R+T+f3+FNPBvj8mqf2npbvlCfMokl4XIL1GP2fzL/ui5B5Lfj12+3Dh43OnVh5dWu1/8/FZu
  KRvP/fh/VKbi1WYmlOCPRUIu5qDgRALt0/kcFAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-728.messagelabs.com!1684069605!367829!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7479 invoked from network); 14 May 2023 13:06:45 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2023 13:06:45 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 4B60C1AE;
	Sun, 14 May 2023 14:06:45 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 728631AC;
	Sun, 14 May 2023 14:06:44 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pytest-xdist: upgrade 3.2.1 -> 3.3.0
Date: Sun, 14 May 2023 21:06:22 +0800
Message-Id: <1684069583-12337-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684069583-12337-1-git-send-email-wangmy@fujitsu.com>
References: <1684069583-12337-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 13:06:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102579

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 #555: Improved progress output when collecting nodes to be less verbose.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-pytest-xdist_3.2.1.bb => python3-pytest-xdist_3.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-xdist_3.2.1.bb => python3-pytest-xdist_3.3.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.2.1.bb b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.3.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pytest-xdist_3.2.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest-xdist_3.3.0.bb
index 02e5400b7b..aa3606680b 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pytest-xdist"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=772fcdaca14b378878d05c7d857e6c3e"
 
-SRC_URI[sha256sum] = "1849bd98d8b242b948e472db7478e090bf3361912a8fed87992ed94085f54727"
+SRC_URI[sha256sum] = "d42c9efb388da35480878ef4b2993704c6cea800c8bafbe85a8cdc461baf0748"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


