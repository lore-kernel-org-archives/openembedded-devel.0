Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F74CC433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 04:30:10 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.2904.1669782599827842510
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Nov 2022 20:30:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bh6nJqcm;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669782597; i=@fujitsu.com;
	bh=EU3wy+2t1mQadQTf3k2Ar9oktj9aE+eUT7XQGxvBWs4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bh6nJqcmE00ni3SEKSnVf6oqPnuJAsXi7gkt/d0uuRVuK2ONsZoPtCOcLGBIF312V
	 JaLXA7NIuXpWw7PD8JOV8zAD1PXIHe6xvQOoz3TjHYro1uVdHoAmP0mfd5oQJUINDT
	 rpZ7/nkk/lfyR4WO02EUSIfXYpmffdfpYdjLOAz6WiBrp1mULsqfTyZaI5Z0g8pVI1
	 ENFIiuLGBI9uOYIWNOcFyvG9SaYURgH8VUTlc5YrqlwrAkPXedynoAcBY2QMQZyySa
	 4kOVuC6QV1QkVim7H+tX4XvrIqOQVTElFH6D5Fa2QCIEj+4OpgHh77c04VRpW0/iVv
	 ixwBYaxCTdbog==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8ORqOtypy3
  ZYPNMU4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPpweVsBZuEKr5NuM7awPiRv4uRi0NI4Amj
  ROe3pUwQznUmiR9H57JCOAcYJTaee8zWxcjJwSagILFw6xlWEFtEQF9i6ew9zCC2sICnxJGXV
  8BqWARUJd4+38AIYvMKeEhsa2liAbElgHqnPHzPDBEXlDg58wlYnFlAQuLgixdAcQ6gGkWJ2d
  PlIcorJGbNamOCsNUkrp7bxDyBkW8Wku5ZSLoXMDKtYjQvTi0qSy3SNTTSSyrKTM8oyU3MzNF
  LrNJN1Est1c3LLyrJ0DXUSywv1kstLtYrrsxNzknRy0st2cQIDLuU4uS7Oxg7l//RO8QoycGk
  JMp79WhbshBfUn5KZUZicUZ8UWlOavEhRhkODiUJXvEbQDnBotT01Iq0zBxgDMCkJTh4lER4t
  4K08hYXJOYWZ6ZDpE4x6nLM/Np2gFmIJS8/L1VKnDfjFlCRAEhRRmke3AhYPF5ilJUS5mVkYG
  AQ4ilILcrNLEGVf8UozsGoJMw7DeQSnsy8ErhNr4COYAI6IlIM7IiSRISUVANT9tPOGy/120u
  X94kZFKV8lF64/KV48Ts+zoqbh9rmGz8T2nbswVwekTnntPvbWnwuvNjGea2eWcmp8+bc6eGv
  W9dNifFyyp9/bL7vv7lVmud3VMcVn7HxC/62OZvzRMtB1x2ftzYkTS5kP/2CKz95RfvxyYxXj
  KLK/VLPm/zvaTsvLL4tS9TC7E75jrlPbjpOmWn2bE6pcxzbxejPU/Oju/uvd7ZfzSv6c91Y4v
  4ES7t2g1sWH521ruQ3J+Xv61KTKkkXOuDm1i2WvMLr7afPf9n178yae+egYxf7jEBFgecr7Zo
  +9U0rLGSv3ytz8dab25Msbq9if+P1MpP39Ksi9f1VMW0ZiUcb+aLZ+KWVWIozEg21mIuKEwF+
  pkvPQgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-728.messagelabs.com!1669782596!202849!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11837 invoked from network); 30 Nov 2022 04:29:56 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 30 Nov 2022 04:29:56 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 50807100198
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 04:29:56 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 44B23100194
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 04:29:56 +0000 (GMT)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 30 Nov 2022 04:29:54 +0000
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-redis: upgrade 4.3.4 -> 4.3.5
Date: Wed, 30 Nov 2022 12:29:51 +0800
Message-ID: <1669782591-11870-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 04:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99852

Changelog:
=========
* New Features
--------------
    Add support for TIMESERIES 1.8 (#2296)
    Graph - add counters for removed labels and properties (#2292)
    Add support for TDIGEST.QUANTILE extensions (#2317)
    Add TDIGEST.TRIMMED_MEAN (#2300)
    Add support for async GRAPH module (#2273)
    Support TDIGEST.MERGESTORE and make compression optional on TDIGEST.CREATE (#2319)
    Adding reserve as an alias for create, so that we have BF.RESERVE and CF.RESERVE accuratenly supported (#2331)

* Bug Fixes
--------------
    Fix async connection.is_connected to return a boolean value (#2278)
    Fix: workaround asyncio bug on connection reset by peer (#2259)
    Fix crash: key expire while search (#2270)
    Async cluster: fix concurrent pipeline (#2280)
    Fix async SEARCH pipeline (#2316)
    Fix KeyError in async cluster - initialize before execute multi key commands (#2439)

* Maintenance
----------------
    Supply chain risk reduction: remove dependency on library named deprecated (#2386)
    Search test - Ignore order of the items in the response (#2322)
    Fix GRAPH.LIST & TDIGEST.QUANTILE tests (#2335)
    Fix TimeSeries range aggregation (twa) tests (#2358)
    Mark TOPK.COUNT as deprecated (#2363)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-redis_4.3.4.bb => python3-redis_4.3.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_4.3.4.bb => python3-redis_4.3.5.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_4.3.4.bb b/meta-python/recipes-devtools/python/python3-redis_4.3.5.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-redis_4.3.4.bb
rename to meta-python/recipes-devtools/python/python3-redis_4.3.5.bb
index e0f953ca4..f6dcebb16 100644
--- a/meta-python/recipes-devtools/python/python3-redis_4.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_4.3.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51d9ad56299ab60ba7be65a621004f27"
 
-SRC_URI[sha256sum] = "ddf27071df4adf3821c4f2ca59d67525c3a82e5f268bed97b813cb4fabf87880"
+SRC_URI[sha256sum] = "30c07511627a4c5c4d970e060000772f323174f75e745a26938319817ead7a12"
 
 inherit pypi setuptools3
 
-- 
2.25.1


