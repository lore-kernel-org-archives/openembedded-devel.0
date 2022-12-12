Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88AD3C10F31
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:39:18 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.37738.1670830748398984620
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:39:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=c120j9k8;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830746; i=@fujitsu.com;
	bh=xJaunCbNtdwry50nLlJMekmZoVp8/uJTzmWsK1Gm5DY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=c120j9k8o0y8LVzrMWG3y3KhEcF+oE2oczm/Y0oDhMAVwZ7fDpZayg/vi684yItBY
	 tLE85L9fsWVg7mss6Ibsef61Rn3DnOtuGvIujat2hgkyNZHFSmdpvwqjOI3d47mkpx
	 KJ4ALnF/GI77JDeZocwEFWk5AkuO7JHCo0M/VmfHHHGhCAQWOUfSU1mK26ojSip7zM
	 4bCV+g4V75pDg2G5jtdmevschQjbvM8aaUjIwR+EzO9Bk8sCe/4Wv86uPcTa7yS7qq
	 Yt/VIVjPMWC6aOJYVvvaC2N7veW+wEV4t3Se7rzKSeCAmDEv8RAWP8gOGhIRmirXdQ
	 wbO+oEQOPeeDw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8ORqDvr1rR
  kg77vghYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bPueIFzzkrds57w9zA2MrZxcjFISTwhFHi
  /bmvTBDOdSaJlTMvQzl7GCVenj0J5HBysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3DzuIL
  SzgK7GwdR1YPYuAqsS5YyfB6nkFHCUmfjzEAmJLCChITHn4nhkiLihxcuYTFog5EhIHX7xghq
  hRlJh9uRmqvkJi1qw2JghbTeLquU3MExj5ZyFpn4WkfQEj0ypGs+LUorLUIl1LvaSizPSMktz
  EzBy9xCrdRL3UUt28/KKSDF1DvcTyYr3U4mK94src5JwUvbzUkk2MwGBMKU7P3cF4adkfvUOM
  khxMSqK8lVemJQvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4D14EygnWJSanlqRlpkDjAyYtAQHj
  5IIrwowOoR4iwsSc4sz0yFSpxh1OWZ+bTvALMSSl5+XKiXOKwwyQwCkKKM0D24ELEovMcpKCf
  MyMjAwCPEUpBblZpagyr9iFOdgVBLm5QVZxZOZVwK36RXQEUxAR0S9nApyREkiQkqqgWmiSdr
  O+R/ulvt1HHZdytBnnPRB6lnY91vRtq9Yzz6KZ9GdnzEx6iGDsD2r6DUTw51vsqecVDzcnLJv
  c/kqju9iZbohv9aKeS1m0z7rzHT2XdnN/uYrCVFrC37J3DKSt+Dum5s1vdX9wsKq7exzvp+aw
  c0o0ZNWOMO52EblNmvM3606QSd/yUR3LrffqFl7lDNi4e9XFZv2RiTe2jrdqnK6uZbN3Dq2RU
  eXe3SX1DC0s7XWzl1evmh9fP/1FWkmkStqTsTN+8H+9f66xZdPz8+vtd88v5R/7ybWS4WZP5h
  SDBdcbmLZbbrhq4ctt/EbDqPsdR9Slv6rTRBYdFlbhueJW166eVbG9TU11Xum3FBiKc5INNRi
  LipOBAC0Edj5TQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-732.messagelabs.com!1670830745!223564!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22682 invoked from network); 12 Dec 2022 07:39:06 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:39:06 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B6E0B100182
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:39:05 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id AABC9100043
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:39:05 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:39:04 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-multidict: upgrade 6.0.2 -> 6.0.3
Date: Mon, 12 Dec 2022 15:38:33 +0800
Message-ID: <1670830717-3138-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100050

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Declared the official support for Python 3.11

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-multidict_6.0.2.bb => python3-multidict_6.0.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_6.0.2.bb => python3-multidict_6.0.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.0.2.bb b/meta-python/recipes-devtools/python/python3-multidict_6.0.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-multidict_6.0.2.bb
rename to meta-python/recipes-devtools/python/python3-multidict_6.0.3.bb
index b0e111d64..d54a673b4 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_6.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_6.0.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/multidict/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=84c63e2bcd84e619d249af5181e2147f"
 
-SRC_URI[sha256sum] = "5ff3bd75f38e4c43f1f470f2df7a4d430b821c4ce22be384e1459cb57d6bb013"
+SRC_URI[sha256sum] = "2523a29006c034687eccd3ee70093a697129a3ffe8732535d3b2df6a4ecc279d"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


