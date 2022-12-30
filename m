Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ADFFC4708D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 03:44:09 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web11.3866.1672803843063405605
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 19:44:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gPEQ/DfH;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672803841; i=@fujitsu.com;
	bh=2H8ORbeqNqal4vqT+qofl85888KlXV5gtOuQnTX2X4Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=gPEQ/DfHeKHdVqAEnckXt/AJXxiBLA6ASxfIB4IIIf4DjC1jCf982mximixcKZZos
	 5y+svVes1GGGRtPpksfSPcjmEYLMTNgXbhbKWlvLNGhc55hNQSQgzMmwljcFwFNn+K
	 oc+oAZsPtx5uw41kxKvqxlPkouLQ2DddcFnYFvb8++9zG8o5P0Lq9gdU/hbEiLjEdv
	 7du4efiahxlXDR3FOk26Ftz3zkti3qUi1u5X833laaAK+K6/986NcuS7REA+RmsNfv
	 JbVkBQVH5qGkhyIzXaC3bNYmQVRnzOemAgHBoj46cs9LAxxO2xp02qvEH4ngaseIOg
	 e22hvYdaU9xvA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORqMvwbUu
  ywYXrLBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8adxcvYCt5zVszfvpC1gfEvRxcjF4eQwBNG
  ifenVrJBONeZJD7e3sUK4exmlLg28xpLFyMnB5uAlMSN+//ZQGwRAX2JpbP3MIPYzAIqEi9+9
  7CD2MICXhKvlu8Bq2ERUJU4vnMRWJxXwEli9sb9rCC2hICCxJSH78F6OQWcJSat7QKbLwRU82
  r/LmaIekGJkzOfsEDMl5A4+OIFM0SvosTsy80sEHaFxKxZbUwQtprE1XObmCcwCs5C0j4LSfs
  CRqZVjGbFqUVlqUW6hhZ6SUWZ6RkluYmZOXqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWVuck5
  KXp5qSWbGIHhm1LM8mAH445lf/QOMUpyMCmJ8pZ83pIsxJeUn1KZkVicEV9UmpNafIhRhoNDS
  YJX/RNQTrAoNT21Ii0zBxhLMGkJDh4lEd4skFbe4oLE3OLMdIjUKUZdjrsL9+5lFmLJy89LlR
  LnvfUFqEgApCijNA9uBCyuLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5l0NsoonM68EbtM
  roCOYgI5IWrMR5IiSRISUVANT9Beh4qgcn+4ZP9L/zGpkLEuqV7psMJ1Ng/Wq5GrnA9J+gifE
  S/5XrJwi4uK7y8Xnra1BU/XyPM9oY6mgz10Fzp83uegV3J/nwpx37kRI1fot2WGP42IW3WUu7
  k9V2bj85lfbdQxXT/xxuPG93uTwhwtPYtw+FivLWFW7HZ4ywYBVKPitp9/upe5y13PUrgYXMM
  vmVyqyPtnlv+B4aV30atvQJzonUvf2vnGtEF5tsVdpX960HxzChXI5L9oM7621vJKhmCsZxhU
  46YDI5kaZ3XfutWXevta3UlUl6NTa7h2d38rOBk7cZ5F07PPWDbWfD1ZeT2692eNX2Nh8bF4m
  08ujk73SZio35Cx10lBiKc5INNRiLipOBABgVd2DZgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-585.messagelabs.com!1672803839!250072!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6967 invoked from network); 4 Jan 2023 03:44:00 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Jan 2023 03:44:00 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id AC151100192
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:43:59 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A0171100188
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:43:59 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 4 Jan 2023 03:43:58 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xxhash: upgrade 3.1.0 -> 3.2.0
Date: Fri, 30 Dec 2022 13:00:23 +0800
Message-ID: <1672376423-25554-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672376423-25554-1-git-send-email-wangmy@fujitsu.com>
References: <1672376423-25554-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 03:44:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100384

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Build Python 3.11 wheels.
    Remove setup.py test_suites, call unittest directly

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-xxhash_3.1.0.bb => python3-xxhash_3.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xxhash_3.1.0.bb => python3-xxhash_3.2.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-xxhash_3.1.0.bb b/meta-python/recipes-devtools/python/python3-xxhash_3.2.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-xxhash_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-xxhash_3.2.0.bb
index bb7bdd314..c4d74306c 100644
--- a/meta-python/recipes-devtools/python/python3-xxhash_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xxhash_3.2.0.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3a9dab7f159514231249aa3e108ab26b"
 
-SRC_URI[sha256sum] = "ac21b1e21dc6fdfee9a57b53f4777539d53a84f2e1546a3f802f159f9966bdc1"
+SRC_URI[sha256sum] = "1afd47af8955c5db730f630ad53ae798cf7fae0acb64cebb3cf94d35c47dd088"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.25.1


