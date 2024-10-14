Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CBFCFC522
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:14 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.50341.1728896172565027575
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X0TEcnOm;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896173; x=1760432173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=CS6oXbG+uKbo6FrAZsRbuxf8wGwzj0dK2M8l+vW1soI=;
  b=X0TEcnOm6zsynbI+eS8Hwk2Y3bkPqiH6EahnCuvEGgyhrMx+G/HEpws/
   X60XDOnZcolPhDtFlE0rtxbbnHZHFMbeyIraHu0PFeR29LL24GT5grevy
   AP4eTTVbX3rv+kgZlMPrpnt6M0O9SVFTWQ0Yb34ZlRBE0B33RY2kRDhJ9
   TAOg/eQnFrXAS399TxmXY3yk/Xp64CMBpHFdusAV2B/Qt1gD8819zaQVz
   PiOxUE5vOfITwxXlxNGiAJqekP5pYJKv+3FGgePOc8j40GLE1BtLNkIv1
   AWn6RVM3gE9bj2H4CTqR1aMN22/ZidNy0FxBwjXS80YcSbM6cZemSsrp/
   Q==;
X-CSE-ConnectionGUID: 5ISRr0L1QkaTNh1b0PvQjA==
X-CSE-MsgGUID: jhBCy9DPSvSIAkifF1daGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="176874699"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="176874699"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:10 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A2819CD6DC
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:08 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id EA6A9D5006
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7FB826B4D4
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 292C11A01E9;
	Mon, 14 Oct 2024 16:56:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/54] python3-httpcore: upgrade 1.0.5 -> 1.0.6
Date: Mon, 14 Oct 2024 16:54:48 +0800
Message-Id: <1728896115-2944-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--1.185600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrGeIujupKDm/A94h1Svy2K76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3FCedixYXzOr/wa
	50HJmOITi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFEPWgYXzuZxjo2elhL1iu3W9Zc
	SVk/jT8h/p2TuosEZaBs+ZkT8aCn89r/oOObzM/n22CIwvLjGDE7l5eY2XegQLe66T6Ko3P+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112879

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Relax trio dependency pinning.
- Handle trio raising NotImplementedError on unsupported platforms.
- Handle mapping ssl.SSLError to httpcore.ConnectError.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-httpcore_1.0.5.bb => python3-httpcore_1.0.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httpcore_1.0.5.bb => python3-httpcore_1.0.6.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-httpcore_1.0.5.bb b/meta-python/recipes-devtools/python/python3-httpcore_1.0.6.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-httpcore_1.0.5.bb
rename to meta-python/recipes-devtools/python/python3-httpcore_1.0.6.bb
index 6b0f8af4d..43c5629a2 100644
--- a/meta-python/recipes-devtools/python/python3-httpcore_1.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-httpcore_1.0.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1c1f23b073da202e1f4f9e426490210c"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "34a38e2f9291467ee3b44e89dd52615370e152954ba21721378a87b2960f7a61"
+SRC_URI[sha256sum] = "73f6dbd6eb8c21bbf7ef8efad555481853f5f6acdeaff1edb0694289269ee17f"
 
 DEPENDS += "\
     python3-hatch-fancy-pypi-readme-native \
-- 
2.34.1


