Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C555FC76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:33:48 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.39511.1681115626610391135
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kUroMDtr;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681115625; i=@fujitsu.com;
	bh=dOP/Qfnb+ZFKvk7Cym2f77loXU4tpDgYTGvstbX69TA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=kUroMDtr2Yr3E3FpU+j+HYS3Q5Nq+MgzGu1FDTgXb9pj322gxniIvKzZ7LJ/TBnJJ
	 RALQ8NQiKr0btGo9ogP/JqHVuZT4snk8c4oD4/5QsXV+cpRlraxOxyMR+gC3RqVcLZ
	 wgeaOswKWRBMjjNvxuI9t/iMQyjkCvfYoPdhkQdnmMnXr5/maAKz91QkrKWpCk79PR
	 tTrRjTuW5MmD1nAPUitxFRyQyapH/kayDc9LdnHDHrb3kJvD6wqPyYv5EuOAq0dqHW
	 u3evQb+NPv9ssdaneKqNGF14PWlurxQBRNH40+yZ2jSXpXpYYvf35wJGNk46xwgGN7
	 2QN2+P527x7hA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSffFSeM
  Ug8X35C0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyzFy+wF9zlqLizoJ2pgbGJo4uRi0NI4Amj
  xIE1D1kgnOtMEsu2TWWDcPYwSqxe3gKU4eRgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBDYtnz32D1LAKqEos+9YHZvAJOEtfuzQOrlxBQkJjy8D2YzSngLLHryAawmUJANYt+P2
  GEqBeUODnzCQvEfAmJgy9eQPUqSsy+3MwCYVdINE4/xARhq0lcPbeJeQKj4Cwk7bOQtC9gZFr
  FaFacWlSWWqRraKaXVJSZnlGSm5iZo5dYpZuol1qqW55aXKJrpJdYXqyXWlysV1yZm5yTopeX
  WrKJERi+KcXq7jsYj/T91TvEKMnBpCTK28VlnCLEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgnfhA
  aCcYFFqempFWmYOMJZg0hIcPEoivBXHgNK8xQWJucWZ6RCpU4yKUuK8rSeAEgIgiYzSPLg2WP
  xeYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMu+0w0BSezLwSuOmvgBYzAS3mcjEAWVySiJC
  SamCKtPz9L6qto6Dl4tmznGe2it0+ebwtqCq2x/yTW8vnuI1f33yQ4yhkq0298UUmdlUHx6vG
  MGe9R4oy77IWzGs7NP1mzpa0ZjazDvbK5Wv2rlpQKBzw1YH9SLf3B54datZsxz8l2gsIcNgZ9
  vN86S3j/BP2Ne+xaK75/k5pPd9PqQLHL7nd+xQaeZPj7p8XLuGyq9NKdI7HuKU9MuwyMfa7u3
  rr5vl94XyL3h75nlC38Fnwc0ll0Uu7jRJj/HS4SheY68wWnsMsZ8Uh+aFmmcMax21zZVrLGt6
  muRlKPJwWkCNRVBP0eCtj1p25K7ZeUdn8vFzd0pS1smC5/4SwEE5Tp9QT4awzWPbb/tYOV2Ip
  zkg01GIuKk4EAKM+jYRaAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-565.messagelabs.com!1681115624!288677!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19468 invoked from network); 10 Apr 2023 08:33:44 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-23.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:33:44 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 3CD47100329
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:33:44 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 30877100323
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:33:44 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:33:42 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-web3: upgrade 6.0.0 -> 6.1.0
Date: Mon, 10 Apr 2023 16:32:10 +0800
Message-ID: <1681115532-24518-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681115532-24518-1-git-send-email-wangmy@fujitsu.com>
References: <1681115532-24518-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 08:33:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102026

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_6.0.0.bb => python3-web3_6.1.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.0.0.bb => python3-web3_6.1.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.0.0.bb b/meta-python/recipes-devtools/python/python3-web3_6.1.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-web3_6.0.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.1.0.bb
index 060cc3ed0..b813e632b 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.1.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dc2732bdc5e50382737979791cbb3b7"
 
-SRC_URI[sha256sum] = "6b925a19e4a0001337d8b2faa72577d6b7e8f9a8a9a0b98d8834cdf698cfc045"
+SRC_URI[sha256sum] = "55e58f2b8705f0911db5a395343b158d5e4edae9973f5dcb349512ae5a349af5"
 
 inherit pypi setuptools3
 
-- 
2.34.1


