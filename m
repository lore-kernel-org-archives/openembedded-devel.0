Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2269C19F29
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 10:17:29 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web08.18242.1658917044389063018
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 03:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Y0PEQo+y;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658917042; i=@fujitsu.com;
	bh=RA02uI25U32pRsWSgyYJrMtwEhNY36skRWjckySprhA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Y0PEQo+yMRjD0jd/Wm9h9vlnPVLxHOEQGh3ruZZ/pDOCNtiZGKOfmz/yzoilfszFa
	 r/d7ibW/xBabpxOQxdW7TKa/uXFNEeNkNl6wz8LpXOE7S9kXpXr4NS0/5CVVv5Ax9k
	 TqpUN1eMQoa7He+eepb57zrr9EpLWsfhL9qoTUoEMTQIuliFAocbQs2k5whRmu/7n2
	 1kNykYIeQV5lX9sgO/1BMnGKBvH1kbIjPKWE2jW66iETAVHCanzfzfiQBvEIWxueb7
	 RGypmIoIUlMuFpFLocqjth6FLTp+s62C7iTr/0iPWA+Y4lHv+ymKCp4M6h/Scns19O
	 M9UdnoiCWihRg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MxSXeTwMM
  kg8VfmC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozz+w8zF8zgqjiw5DhTA+Mxzi5GLg4hgSeM
  EvPufWaFcK4zSVy5cYEFwjnAKLF2xxb2LkZODjYBXYkXPxazgNgiAvoSS2fvYQaxhQXiJKbfX
  AFmswioSnRsWwtWwyvgIfHm0T8wW0JAQWLKw/fMEHFBiZMzn4DFmQUkJA6+eAEU5wCqUZSYPV
  0eorxC4vXhS8wQtprE1XObmCcw8s1C0j0LSfcCRqZVjDZJRZnpGSW5iZk5uoYGBrqGhqa6lma
  6hpbGeolVuol6qaW6eflFJRm6hnqJ5cV6qcXFesWVuck5KXp5qSWbGIEBmFKccHAH44p9v/QO
  MUpyMCmJ8rq/fZAkxJeUn1KZkVicEV9UmpNafIhRhoNDSYJ3L8fDJCHBotT01Iq0zBxgNMCkJ
  Th4lER4k3mB0rzFBYm5xZnpEKlTjMYcdxfu3cvMMfNr2wFmIZa8/LxUKXHeGD6gUgGQ0ozSPL
  hBsCi9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYdzY/0BSezLwSuH2vgE5hAjpli8IDkFN
  KEhFSUg1MtQ8nJfxte/DX/+ORhNd9S7StP/wKt3npqHJrscI+p3dvqlcLMdrNuHCFSe99lKOY
  lpbDI7H3TL+Wp8hUJl5bxm2t7n660fXbfSfhlKDF04yX7pbi+HAuOqv8XW7b+SOW/hlvJP3N/
  xjO31ukGOG24smHDWcTgzgOB15cE3bQSmv28xOb3WRZeNyOHZzy+P2vc3tT/yYFLd0YbxP/4P
  W7SsVTSvP2f3dWmxc/uz1rdf2JlEfn9P763DjetPz8S6+Dr7jXrxRg2PnGdqHIH7OIUz/3r77
  RKsZxwj7s03fVrAm2JwqmJE3ijdmd+1xZ83yQUpIe5/TAGzx35hSdOBByo6j8is6e5KMLVngt
  V11nvUOJpTgj0VCLuag4EQBDLmUaTQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-732.messagelabs.com!1658917041!221875!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30322 invoked from network); 27 Jul 2022 10:17:22 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jul 2022 10:17:22 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 75B391000C0
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 11:17:21 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 69273100077
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 11:17:21 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 27 Jul 2022 11:17:20 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade
 2.51.0 -> 2.54.0
Date: Fri, 22 Jul 2022 12:03:48 +0800
Message-ID: <1658462628-26163-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Jul 2022 10:17:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98011

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ent_2.51.0.bb => python3-google-api-python-client_2.54.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.51.0.bb => python3-google-api-python-client_2.54.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.51.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.54.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.51.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.54.0.bb
index d52b34ade8..af1b934c96 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.51.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.54.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "a573373041b3f6ccbd04877b70e7425c52daec5b4fe5f440e8f5895c87d1a69c"
+SRC_URI[sha256sum] = "90ebbae53025545b45962c0bc9874640511f35e929df773d034f40d9464c86af"
 
 inherit pypi setuptools3
 
-- 
2.25.1


