Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8503AC05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 08:14:35 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.3833.1675844069121889771
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 00:14:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WUUA3FjA;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675844067; i=@fujitsu.com;
	bh=XyvuBVS1SpiDEFH/EJHrKQ9j72qGcZX+nz0rsm6T8e4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=WUUA3FjAjggNU6LkGoy8vuhwFKtHrVX2hlLpCyNAETiw9LVAIvrwtKZv5sIq4dE3L
	 OxlCsdHs0sb5qLcQW/1bal9pztxHkgXgOa8sXGpRArJ8fYZjSkALZE13Y56FtbjYnI
	 p9hbmN3m77qTe0JZXa8jKuzJJhRqE9i4/JfW0ds1aNw/r6JzcwJC0FwA+e8+9xW045
	 naT2HTDgDiXIe72uFRAu9v23nMzTa36xcZiO7xStf/nnp++nm5+e9NzKE3xLFpRaKT
	 3iGJx1eGcBFHgEc8ZECnwpLUKwdozVv7iNFrAqi9yhlgDYz5gFttrplL4fjYsZUJmq
	 DvuUx1FXRbEXQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSfdx5ON
  kgxXXuC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owvqy6xFBzhrPg20b+B8RVHFyMXh5DAE0aJ
  5vuNbBDODSaJG28aGCGcPYwSHx+2AGU4OdgEpCRu3P8PZosI6Essnb2HGcRmFlCRePG7hx3EF
  hbwkpiw6xsjiM0CFP925S6YzSvgJHF77mMmEFtCQEFiysP3YL2cAs4Sh0+dZgWxhYBqjvYsga
  oXlDg58wkLxHwJiYMvXjBD9CpKzL7czAJhV0q0fvgFZatJXD23iXkCo+AsJO2zkLQvYGRaxWh
  anFpUllqka6mXVJSZnlGSm5iZo5dYpZuol1qqW55aXKJrpJdYXqyXWlysV1yZm5yTopeXWrKJ
  ERi6KcVq8jsYD/f91TvEKMnBpCTK6yn2OFmILyk/pTIjsTgjvqg0J7X4EKMMB4eSBG9EOFBOs
  Cg1PbUiLTMHGEcwaQkOHiUR3khgLAnxFhck5hZnpkOkTjEqSonzHogASgiAJDJK8+DaYLF7iV
  FWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwb0AY0BSezLwSuOmvgBYzAS0OUX0IsrgkESEl1cA
  UfkJce3Zd1ZfFLfaPi1+uOGw5J+eiqs6q8IMs25rn7j3+69+ih0qfzku1X72+Ruv8bZnXNq8f
  5UbvtijdEaHEnj9H2FckdrFx94ZZBje2sJ6+Ujt5wQJ985tt1hU7PJIvVvYYsTjPbCyUuNV0d
  zl/XOzqh8JKuieuHqhYZS+31vqYvsiCPRPuO6R//HPq5IXj8zfxOdwWqFy+cZvyprgTU9O+TZ
  pw5eaMCTcULs1y/3WWhyd4v1LrxS0ZOd9/XDyw63uW3M7IA6df8Zfy71gceDlh82H3asmPn20
  WND/OYtBuDWa4Mi38ANfEWwL97QZef/mDDDdZ2xbJnMrZ7Psra+X22MAnb3l0vH9y7q5VvKLE
  UpyRaKjFXFScCABO8CTZWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-571.messagelabs.com!1675844067!175687!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17866 invoked from network); 8 Feb 2023 08:14:27 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Feb 2023 08:14:27 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id DBE741000D5
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:14:26 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C27421000D2
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:14:26 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Feb 2023 08:14:25 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pandas: upgrade 1.5.2 -> 1.5.3
Date: Wed, 8 Feb 2023 16:14:10 +0800
Message-ID: <1675844052-11401-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675844052-11401-1-git-send-email-wangmy@fujitsu.com>
References: <1675844052-11401-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 08:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100990

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://pandas.pydata.org/docs/whatsnew/v1.5.3.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pandas_1.5.2.bb => python3-pandas_1.5.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.5.2.bb => python3-pandas_1.5.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.5.2.bb b/meta-python/recipes-devtools/python/python3-pandas_1.5.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pandas_1.5.2.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.5.3.bb
index 15709b604..aa8dfe279 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.5.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c1cc9ab35a8b2aabf933cd6d245b5db3"
 
-SRC_URI[sha256sum] = "220b98d15cee0b2cd839a6358bd1f273d0356bf964c1a1aeb32d47db0215488b"
+SRC_URI[sha256sum] = "74a3fd7e5a7ec052f183273dc7b0acd3a863edf7520f5d3a1765c04ffdb3b0b1"
 
 inherit pypi setuptools3
 
-- 
2.34.1


