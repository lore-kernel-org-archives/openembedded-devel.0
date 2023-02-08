Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965CCC636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 08:08:55 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.3728.1675843730188265719
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 00:08:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xtfDK0p4;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675843728; i=@fujitsu.com;
	bh=+xmf+Fs2jE8eB04M4+qLFxgadegK0vDtNmvhxuQJEC4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xtfDK0p4jD3Chym1CwIqYU226J0eOvX3KjpE2WhW8+i3w4b/WGbh61aCTlu+am1o7
	 wspn5s79Qwsg0F420bcSfyWQ0l/bLqIxbbAPsz6J2f+7N7oavWgZUCaj1GgWYbOB6Z
	 cnfG3uCzNtfb4erD4v9geQ1hTCEg+yd6/2mqNLThm+OYBe16LbbyshoQGHX5tXwYsh
	 /88DjOs2LOUqJVlMXjaroWTeFNJel++HMCecSXORxF1qk+0CYtlWYGd3Mcfxo7dtVt
	 MgwBU07xzHdaAqqftHUdTUcTcvWPtt/EOLD308Gj9cCW2SUetNx6jWZPPZQbC7Qahx
	 RE6Gc9IayDzjw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8ORpNsf8Tj
  Z4PchE4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeN442e2gktcFdM+TGdqYNzD2cXIxSEk8JBR
  ouHxDHYI5yqTxMKJJ5kgnD2MEpt6FwA5nBxsAlISN+7/ZwOxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILCzhLdN16wQhiswDF2x8tAqvnFXCS+PPvFliNhICCxJSH75kh4oISJ2c+YYGYIyFx8MULZo
  gaRYnZl5tZIOxKidYPv6BsNYmr5zYxT2Dkn4WkfRaS9gWMTKsYzYpTi8pSi3SNDPSSijLTM0p
  yEzNz9BKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitzk3NS9PJSSzYxAsMxpVjt5Q7GiX1/9Q4x
  SnIwKYnyeoo9ThbiS8pPqcxILM6ILyrNSS0+xCjDwaEkwRsRDpQTLEpNT61Iy8wBxgZMWoKDR
  0mENzIUKM1bXJCYW5yZDpE6xagoJc77KAwoIQCSyCjNg2uDxeMlRlkpYV5GBgYGIZ6C1KLczB
  JU+VeM4hyMSsK8ASBTeDLzSuCmvwJazAS0OET1IcjikkSElFQDk3/u/+jCNvOlP5cXnkisYXl
  p/VZ9s5bsr2ULmZdcNvJJL7jX/fvzrPP2XNHZqit6TlkIF62aduWa/Aff6/eLw9xtZ4mtD1xg
  v2b1PH3TD13xl293LtkxOUD7/4YFd7Nm3aqP3sc1+eKn7E/tDzetuGQw42iOKNvfyXvmb4idl
  p78u/29wMujH/kzGfx+KV2/yGrEnWLK13TYPCDKS0su4XetzvPoHU2HuV6od+z+KnUp6dXjck
  1mHZe2Fba3PvKaSaoccXgpHsH3vHmySWRxXS+zjoX17ap/hwWDl8y0/37o472v7vKOd+Km7ru
  ya9aCvqeh61g6DttrLNXM/f9qvciLbZtn7UhkmxbU+O7IrFwlluKMREMt5qLiRAAJNY1yQgMA
  AA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-565.messagelabs.com!1675843727!188948!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11991 invoked from network); 8 Feb 2023 08:08:47 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-19.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Feb 2023 08:08:47 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 8F4791AE
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:08:47 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 838111AD
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:08:47 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Feb 2023 08:08:45 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] python3-apt: upgrade 2.5.0 -> 2.5.2
Date: Wed, 8 Feb 2023 16:08:32 +0800
Message-ID: <1675843716-11186-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 08:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100968

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Allow sources.list.d to not exist
* Fix Debian templates to fix FTBFS/test failure.
  We copied the URI regex from the templated section, so they had
  {{0,1}}, but these sections had a fixed codename, so there's no
  expansion, so it needs to be {0,1} here.
* Update mirror lists

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-apt_2.5.0.bb => python3-apt_2.5.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/python/{python3-apt_2.5.0.bb => python3-apt_2.5.2.bb} (90%)

diff --git a/meta-oe/recipes-devtools/python/python3-apt_2.5.0.bb b/meta-oe/recipes-devtools/python/python3-apt_2.5.2.bb
similarity index 90%
rename from meta-oe/recipes-devtools/python/python3-apt_2.5.0.bb
rename to meta-oe/recipes-devtools/python/python3-apt_2.5.2.bb
index 57da3b34d..d95c60f81 100644
--- a/meta-oe/recipes-devtools/python/python3-apt_2.5.0.bb
+++ b/meta-oe/recipes-devtools/python/python3-apt_2.5.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 SRC_URI = "git://salsa.debian.org/apt-team/python-apt.git;protocol=https;branch=main"
 
-SRCREV = "adf41e6f4088845dcb9e85de0436e25e8d32da25"
+SRCREV = "e78d37eec72fe3afd28db17d5ea7a705bb4e3ce9"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


