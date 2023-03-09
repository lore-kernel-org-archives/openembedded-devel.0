Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB590C6FD1F
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 09:46:49 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.9490.1678355204790945370
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 01:46:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=em4l3kXf;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678355203; i=@fujitsu.com;
	bh=S4ZeQLXDOaPL5VEJ2/fHV7KqdgrQSq448Nr5kqqy9+w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=em4l3kXflQLU12kkkzkKQUOYe40uyO9E3ZGfrgADDmrGljOXRpJp3RKSQh+bNG0J1
	 wUoO9BmBULbs67ulY40g9qaH8Zxm99Chrw+Zc/D00WjUS4aXz31GJkAYuRN9INap0t
	 GLtgmR5Vup6Y0xq0U50QNBXD4AtGHLbE/vcDTeVgcsni9oCK73KwZzfFhVu1S65CR/
	 Fzced0P0Mer85k3tfT4JN81eoEnWt+o+qBloUNhuL/df3MgKZqiZBjmTskp3c/JGvN
	 /JNavii62/aFXELGROHEnsbPtoadpZ+P/O6RxjrZsLExYxn0FJqekx0yT3+y+St2FW
	 PpLkcCujZTB1Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORqMu0mjP
  FYNVHLYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPx5Rqmgn1cFZdnP2RqYDzP2cXIxSEk8IRR
  YufJJewQzg0mibkLHgE5nEDOHkaJA1vkQGw2ASmJG/f/s4HYIgL6Ektn72EGsZkFVCRe/O4Bq
  ufgEBYIlrhyMxkkzAIUnv1zAyOIzSvgJLF51ySwkRICChJTHr4Ha+UUcJaY8r2bCWKVk8SXd6
  3sEPWCEidnPmGBGC8hcfDFC2aIXkWJ2ZebWSDsSonWD7+gbDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGE2LU4vKUot0TfSSijLTM0pyEzNz9BKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitzk3NS9PJS
  SzYxAgM3pVjx2A7Gf71/9Q4xSnIwKYnydrNxpgjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4DVfB
  pQTLEpNT61Iy8wBRhFMWoKDR0mEt382UJq3uCAxtzgzHSJ1ilFRSpw3cSVQQgAkkVGaB9cGi9
  xLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5V4BM4cnMK4Gb/gpoMRPQ4l1bOEAWlyQipKQ
  amOZJ3LZev5+74I2y0EzbiefPaKxlP3zo9LM/ss9+2lecbGQU0C81OdTFwi9YvkRw7c9LOSxJ
  WxtvskQc3CwqaCgtsVRvh8mG0KSvoR8PLZXwvVUuJGnWlDPHq6/g8JENzCYiOSpXr8y5mKFq0
  /o65lIij0D9W2+L2BU7DCKnfzibF2bucPmy2mEzA8vEL77LTm3LLry6MDFx4gWm6zG37D6HRb
  8Q8Be/X/12sW6r3kL9NuUTAhsWBRzcX+x0b+8EwUMxln5ra3bpzzi6c5bH/Eovpal7SxQXeVZ
  kf7j7gcf9v4z/zOvfjxk0M7T/3Lvk2AEBo+qQ+rRda2Pqb2ok1qq8vjTT7OTiWcYTpXnO7FRi
  Kc5INNRiLipOBAAoXtGQVwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-548.messagelabs.com!1678355202!74307!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9982 invoked from network); 9 Mar 2023 09:46:42 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Mar 2023 09:46:42 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 636C0100191
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Mar 2023 09:46:42 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 563E3100043
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Mar 2023 09:46:42 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 9 Mar 2023 09:46:40 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/11] python3-xmlschema: upgrade 2.2.1 -> 2.2.2
Date: Thu, 9 Mar 2023 17:45:55 +0800
Message-ID: <1678355155-32741-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678355155-32741-1-git-send-email-wangmy@fujitsu.com>
References: <1678355155-32741-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 09:46:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101455

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Fix mixed content extension with empty content (issue #337)
 Fix lru_cache() usage on global maps caching

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-xmlschema_2.2.1.bb => python3-xmlschema_2.2.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_2.2.1.bb => python3-xmlschema_2.2.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_2.2.1.bb b/meta-python/recipes-devtools/python/python3-xmlschema_2.2.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-xmlschema_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_2.2.2.bb
index f643a140f..d2b75048c 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_2.2.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ab20f8e337bea2e6874f372edfd12c0"
 
-SRC_URI[sha256sum] = "035939104bacd0ccefcd591220cce90d160d71f17189ee332a011c3fd05c086d"
+SRC_URI[sha256sum] = "0caa96668807b4b51c42a0fe2b6610752bc59f069615df3e34dcfffb962973fd"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.34.1


