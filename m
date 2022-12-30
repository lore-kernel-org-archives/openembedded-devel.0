Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E9CC53210
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 03:41:49 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.3838.1672803701596213195
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 19:41:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gnuR6dDv;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672803700; i=@fujitsu.com;
	bh=43JR9LiX22SlTqt2lM6lHHQWy3oxgeB73nM2S1a9oII=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=gnuR6dDvNYfwEkjNJo/E61R7+IMNE1ZURLQshP+WblgIjNds+nSYW2DsoBy04UEE0
	 OAnn24n2fx95tGzl6r/N+DrKtIF7Rz+g2ntiiTxbcJfe9T7ijsc2QGg1AWlXq7DivJ
	 p7pL3MQYTc1zFtJeCjGbcFPot66lpAVEHNGgRDOTlI4cx5L9yxYGu4U8Pkn9pUIkyb
	 K/8kbLobADph8GoJNWPzKw1AXtT7VstuDcJdy01+o4qiGAp6imo3yyipwvTyNbdcK6
	 tywQWnl6vN0G22b8NwGjV4FtCu6AGcftYArPCPoWTz1NVwfF5CBX4ys6U+xHxY6kaP
	 QANeMzQri9IqQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8OxWbf465Z
  kg8PLeC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxN80+wFmzhqHhy9i5rA+M19i5GLg4hgYeM
  EgsWvmGFcK4wSazre84E4exmlJj6fQZjFyMnB5uAlMSN+//ZQGwRAX2JpbP3MIPYzAIqEi9+9
  7CD2MIC7hLbO5rB4iwCqhIdCy+ygNi8Ak4SWw7tBKuREFCQmPLwPVANBwengLNEV5sASFgIqK
  T5YzNUuaDEyZlPWCDGS0gcfPGCGaJVUWL2ZYgaCYEKiVmz2pggbDWJq+c2MU9gFJyFpH0WkvY
  FjEyrGM2KU4vKUot0Dc30kooy0zNKchMzc/QSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yorc5Nz
  UvTyUks2MQKDN6VYcesOxhvL/ugdYpTkYFIS5S35vCVZiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gSv+iegnGBRanpqRVpmDjCSYNISHDxKIrxZIK28xQWJucWZ6RCpU4y6HHcX7t3LLMSSl5+XKi
  XO6/oFqEgApCijNA9uBCyqLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5l0NsoonM68EbtM
  roCOYgI5IWrMR5IiSRISUVAOTQWTZ7m1nE47uXKcTx8Fns8TO9Rfv5hv3WFUUvyw5mVjO/mOn
  rMGES0kypjvY/S7fswv6LNvmvzTtxjUT1QfaUb05xVM9s5vWXWOq2ps0ffGEmw6GhrfPfFsZs
  XPxu/wfreY3mx4mnX5pG/MoUdxsM9e5muWi+9s9RFMe3A3R/yWU8Tmxx6fJdN/s9z/eXElRXB
  y/5kSaes3ZS8tbZH/dNzE7bWek7xh9s8vmYdiy58emhQYetFe6rimklrk6LfRp+ceNU4LMKlV
  EpkdVq/tbJrtckZ668dK29f/EXc9GXuRXWNFs5unZ8Kop/3Sq8gvP0CYztrL6zz6ev4Qep+c1
  L/tk431OaatOpcrM4jdKLMUZiYZazEXFiQBgn87sZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-571.messagelabs.com!1672803699!363348!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21220 invoked from network); 4 Jan 2023 03:41:39 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Jan 2023 03:41:39 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id EAE11153
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:41:38 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id DE11E152
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:41:38 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 4 Jan 2023 03:41:37 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-lz4: upgrade 4.0.2 -> 4.3.2
Date: Fri, 30 Dec 2022 12:58:01 +0800
Message-ID: <1672376281-25331-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672376281-25331-1-git-send-email-wangmy@fujitsu.com>
References: <1672376281-25331-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 03:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100380

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-lz4_4.0.2.bb => python3-lz4_4.3.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lz4_4.0.2.bb => python3-lz4_4.3.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-lz4_4.0.2.bb b/meta-python/recipes-devtools/python/python3-lz4_4.3.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-lz4_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-lz4_4.3.2.bb
index ad006e61b..71171513e 100644
--- a/meta-python/recipes-devtools/python/python3-lz4_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-lz4_4.3.2.bb
@@ -11,7 +11,7 @@ DEPENDS += " \
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "083b7172c2938412ae37c3a090250bfdd9e4a6e855442594f86c3608ed12729b"
+SRC_URI[sha256sum] = "e1431d84a9cfb23e6773e72078ce8e65cad6745816d4cbf9ae67da5ea419acda"
 
 inherit pkgconfig pypi python_setuptools_build_meta ptest
 
-- 
2.25.1


