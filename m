Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1BEC433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 08:58:25 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.2693.1652864295614950554
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 01:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YU3lB1tp;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652864293; i=@fujitsu.com;
	bh=ln07pOo2Gd8iaxbWey2OScFnmw9rclzfH2eM9Q1YAMs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=YU3lB1tpbCY5YdKpTSIhSaKPxACiavg/Pr5rjjGN6aXwXCUlXFptYXKLPKUgSG8AA
	 oD9mDkgxPPB1jJR1n6zdntqnmKp/sXLRj3IZEYMaRKkHbd9BbmwyrlGxQ0rlIVza9u
	 9uMVfBR488NGSIXdVqS4whYrxtS3PQHTFBz5/PJff1C2iG/y5NZBdCJMg0jOTW6EpN
	 eyjFKJ9/HzlH39lNoGw/0EAwmf7pTNNfHVcupuBfgk5nS7dH/MG3t1FQVGTB3T2eLC
	 n3kl7zQPkOqZIZ2tO8aZoPdLMO5CnKlvPehUESByK6GZKg5b1oYWtzumoeLmxsHfTS
	 Phy/aU0beE/eQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORqKuytSX
  J4P8qK4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaNx/Q3mgvNCFUvO32BvYLzD38XIySEk8IRR
  YkuDTxcjF5B9gUnic897FghnD6PEvLZHTCBVbAJqEtNv3WAFsUUE9CWWzt7DDGIzC6hIvPjdw
  97FyMEhLOAtsWBFMkiYBSj89skDsBJeASeJ3nuTwWwJAQWJKQ/fQ8UFJU7OfMICMUZC4uCLF1
  A1ihKzLzezQNgVEjNmbGODsNUkrp7bxDyBkX8WkvZZSNoXMDKtYrROKspMzyjJTczM0TU0MNA
  1NDTVNTbRNTK00Eus0k3USy3VLU8tLtE10kssL9ZLLS7WK67MTc5J0ctLLdnECAzKlGKlWzsY
  N6z6qXeIUZKDSUmUV3l1S5IQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd6SjUA5waLU9NSKtMwcY
  ITApCU4eJREeJ+vA0rzFhck5hZnpkOkTjEac9xduHcvM8ffT3/3Mgux5OXnpUqJ8+ptBioVAC
  nNKM2DGwSL3EuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHmjtgBN4cnMK4Hb9wroFCagU0T
  0G0FOKUlESEk1MB0IcuJS/Gt02SRH3X0bd+ymfTFu/54Ez9N5GfGr3UpD06dP/4gxv73D0tiz
  vfzHu3rEpC8WL9RTnnnYbo3xGp74ydzd8zdfurl26t1cNZkr7p2Pp4lPnbD3QKLlTgeziU8ve
  p68kVPMmGkt2zJX5a1b2Ky9yW6fvCs+ZG02YZncvK/D/kjYIYsdZcbeNjsy9qkHKWQd+Hn8s7
  dsrG2/wrvtfyJ8dezjHy3qTL/fKCDpc/faWUUzObbbJl5N1ycHpDBpb9q84soMT+HTVx/5cYr
  X9jj9+m15fZKkwsSSyfzXJKddMX1X6bHh2x/exF9G697MUZq2+Mgv57j9H7SZXTTqnYw93rSe
  PD9bXf72UiWW4oxEQy3mouJEADvy/RBXAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-565.messagelabs.com!1652864292!350517!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29093 invoked from network); 18 May 2022 08:58:12 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 May 2022 08:58:12 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 6CFB1100187
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 09:58:12 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 48658100197
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 09:58:12 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 18 May 2022 09:58:06 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-aiohue: upgrade 3.0.11 -> 4.4.1
Date: Sun, 8 May 2022 16:40:20 +0800
Message-ID: <1651999221-25259-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 May 2022 08:58:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97157

add dependence: python3-awesomeversion

Changelog from 3.0.11 to 4.4.1
==============================
    Switch to limit per host on tcp connector
    Delay initializing workaround dict
    Bump black from 21.12b0 to 22.1.0
    Put back asyncio-throttle because still in use for v1 API
    Mac address got lost in translation
    Update to final models and fix parser errors
    Fix python 3.9 compatibility
    Fix typo in button events handler
    Add diagnostics feature
    Small follow up fix in event logic
    Allow motion sensor state to be null/none when sensor is disabled
    Add basic tests
    Fix float int conversion
    Fix race condition(s) while adding/removing a light/device
    Loosen up a bit on parser errors
    Fix button workaround
    Add setting effect feature on light
    Add missing parameters to the grouped_light set_state
    Fix typo in default enum member
    Add timed effects feature to light
    Add support for aggregated grouped_lights commands
    Hide dependencies in release-drafter
    Fix and cleanup of button workaround code
    Fix typo in timed effects featur

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-aiohue_3.0.11.bb => python3-aiohue_4.4.1.bb}      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohue_3.0.11.bb => python3-aiohue_4.4.1.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_3.0.11.bb b/meta-python/recipes-devtools/python/python3-aiohue_4.4.1.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-aiohue_3.0.11.bb
rename to meta-python/recipes-devtools/python/python3-aiohue_4.4.1.bb
index 47d9964b0..b3a88fb67 100644
--- a/meta-python/recipes-devtools/python/python3-aiohue_3.0.11.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohue_4.4.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab31a1d28183826937f4b152143a33f"
 
-SRC_URI[sha256sum] = "31c0b90d7dc2b62f5e1a93e78b2c0d6360ef6c0a87485c217a4f394c937fce7d"
+SRC_URI[sha256sum] = "fa3bb0cf68aefdd0710704443c896abda69ae227500ad9539ac6c3d1d6dad804"
 
 inherit pypi setuptools3
 
@@ -12,4 +12,5 @@ RDEPENDS:${PN} += " \
 	${PYTHON_PN}-aiohttp \
 	${PYTHON_PN}-asyncio-throttle \
 	${PYTHON_PN}-profile \
+        ${PYTHON_PN}-awesomeversion \
 "
-- 
2.25.1


