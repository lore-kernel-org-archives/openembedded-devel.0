Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F01D3CCA47E
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 04:35:42 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.2393.1655181338114965392
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 21:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=D56SM0Xt;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655181336; i=@fujitsu.com;
	bh=5+pnGIxza7xGfpHo7GqPT2jeguCn7stbxB3fMp7zFYM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=D56SM0XtTfef4Ec9YlJh5lD4TAxytlPyOoCinqf5JfhBf8esqiYkIO340kmXidLV7
	 UsL2ohleWx4T2JB4hvCWfaIkL7MT1X8luj4nLM8freUSfyMdynT1MGBX0bMHTQjuzp
	 X427kxRGYx1S9VMnuP5s+MaaupjRM5f4OldNxjxWbIEyA1qSRMoSDZg7DGNS0prBnF
	 uIeH4p7UVi0ftgBxAaMv133UpoUKaPQyAgUdRt3sd8gHgPmZbC7VAMBkVD6DB8Cvkm
	 PJpvWNNv1JwH3ycUqRMVFd52lKnkVwLzNyFOOJceIgZ1FJchOgftS+zDePYhiGtoFu
	 7quz45uNTFyjQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrEIsWRWlGSWpSXmKPExsViZ8ORqCsusCL
  J4NhKCYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNXz2e2gnmcFeced7M1MM7j6GLk4hASeMIo
  ca3nHSuEc4FJYuKpBSwQzh5GiQ1v+xm7GDk52ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7h
  x3EFhawk2i49RqsnkVAVWLT3FtgcV4BJ4mLDSfAbAkBBYkpD9+D9XIKOEss23CSCcQWAqrp+g
  FTLyhxcuYTFoj5EhIHX7xghuhVlJh9uZkFwq6QmDFjGxuErSZx9dwm5gmMgrOQtM9C0r6AkWk
  Vo21SUWZ6RkluYmaOrqGBga6hoSmQNtY1MjTTS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67M
  Tc5J0ctLLdnECAzmlOL0GzsYd+37pXeIUZKDSUmU99Lu5UlCfEn5KZUZicUZ8UWlOanFhxhlO
  DiUJHhbOFckCQkWpaanVqRl5gAjCyYtwcGjJMK7+B9QK29xQWJucWY6ROoUoyvHh0NX9jJzXL
  0CIqfO/refmWM5mJz5te0AsxBLXn5eqpQ4rzo/0GwBkOaM0jy40bCkcIlRVkqYl5GBgUGIpyC
  1KDezBFX+FaM4B6OSMO93PqApPJl5JXAXvAI6jgnouI0nl4AcV5KIkJJqYMrJ9U47cNs90jH0
  itPc+Uxb7KVbk7Uvm5WuXZr6deOiL5lndM78mXJ92tZLSk/nNgeLmqWdf/Si/OGy7WdeeMs88
  Lj1iE/rx/xPKWcTbv+b/bD4afS2s8WV3aI3HNvUoxo2n2I4wXJjVv3zmfy8MvKzKsOrdjVP2l
  D087BAnuIOz7jrz05H8TGkiz0rXMsmHH1HLuFhmXRCYP5s5f67J9/ItbjtYXlnIvsx2rFMxHW
  /8QVT/wkqvU6Pu2L2uXA7WnCpX9P/1rZ+wprM/FdX9+2fck4gUULg4XGWFVOfVqTm/Fv5O4Tv
  8Aeh/U1XL4hHFFRcXOR1cVGYcJ7kw3zn6o7HTrO+3tiXYG26Yu2So71KLMUZiYZazEXFiQAnM
  UgFhQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-728.messagelabs.com!1655181335!82870!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20553 invoked from network); 14 Jun 2022 04:35:35 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Jun 2022 04:35:35 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BBAD9100190
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 05:35:34 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id AE166100187
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 05:35:34 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 14 Jun 2022 05:35:25 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] poco: upgrade 1.11.2 -> 1.11.3
Date: Tue, 14 Jun 2022 12:35:04 +0800
Message-ID: <1655181307-30868-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655181307-30868-1-git-send-email-wangmy@fujitsu.com>
References: <1655181307-30868-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jun 2022 04:35:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97497

Changelog:
===========================
- GH #3567: fix(openssl-initializer): check legacy provider existence for legacy exception
- GH #3587: MySQL UUID binding temporary string
- GH #3632: Redis - add TLS support
- updated a few copyright dates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/poco/{poco_1.11.2.bb => poco_1.11.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poco/{poco_1.11.2.bb => poco_1.11.3.bb} (98%)

diff --git a/meta-oe/recipes-support/poco/poco_1.11.2.bb b/meta-oe/recipes-support/poco/poco_1.11.3.bb
similarity index 98%
rename from meta-oe/recipes-support/poco/poco_1.11.2.bb
rename to meta-oe/recipes-support/poco/poco_1.11.3.bb
index 8694983e7..757fa8983 100644
--- a/meta-oe/recipes-support/poco/poco_1.11.2.bb
+++ b/meta-oe/recipes-support/poco/poco_1.11.3.bb
@@ -12,7 +12,7 @@ SRC_URI = " \
     git://github.com/pocoproject/poco.git;branch=master;protocol=https \
     file://run-ptest \
    "
-SRCREV = "9d1c428c861f2e5ccf09149bbe8d2149720c5896"
+SRCREV = "191cbdc97e1d9de023b8a65e0dc844911c06f6a8"
 
 UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1


