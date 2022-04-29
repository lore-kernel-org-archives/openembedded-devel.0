Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9D9C433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:23:02 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.29206.1652084578931751397
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 01:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tTTEWBW+;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652084577; i=@fujitsu.com;
	bh=zoFbeCMfITkfuHjiNgHLiN4aYcMf3UmSIDm6LBh3sNA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=tTTEWBW+fgbVsJ2sa7qAFb1VdrPs7qyO95R8wCmpWWaA9axVCrBU28S9JjrKNPYHG
	 EbYq9SyDbcZ4EcDkhhrgGJkasAWA7C/IWpWkk46Co9p0zFqz3YicyKQhUPlXaQu44O
	 mzKG38hc0vMlS3CS+fVjMtXweaJs5mMGIa9X4y9y3eAdHOo2h4JEwZOSem5XtmUIVW
	 A7PqV9+frbobGnTzW+JVr6IgfktLlmnTUoeTn6aXbvjfK+JOoqLEkzv+zUJ6oDkBDV
	 7wpMeeDzbwp7ZqqyyzR7r4F/2vhovbEaPIGSiMEYtEqiZXak/9t683jeMZ6plrydsg
	 xAQeYvZiqJALQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8MxSTfhfEW
  Swe5TVhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bnL9mCX5wVuxYKNTC+5ehi5OIQEnjCKPFr
  3h92COcCk8TnLe2sEM5uRokfFycwdzFycrAJqElMv3WDFcQWEdCXWDp7D1icWUBF4sXvHnYQW
  1jAUmLi3OuMIDaLgKrEo40Hwep5BZwkjm9cAVYjIaAgMeXhe7BeTgFnifUTf7GB2EJANT9+3G
  KDqBeUODnzCQvEfAmJgy9eMEP0KkrMvtzMAmFXSMya1cYEYatJXD23iXkCo+AsJO2zkLQvYGR
  axWibVJSZnlGSm5iZo2toYKBraGiqa2apa2ysl1ilm6iXWqqbnJpXUpQIlNVLLC/WSy0u1iuu
  zE3OSdHLSy3ZxAgM5JRiV8UdjNf6fuodYpTkYFIS5a1sqkgS4kvKT6nMSCzOiC8qzUktPsQow
  8GhJMHrcAooJ1iUmp5akZaZA4wqmLQEB4+SCO/dE0Bp3uKCxNzizHSI1ClGXY67C/fuZRZiyc
  vPS5US5/1+FqhIAKQoozQPbgQswi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuatA5nCk5l
  XArfpFdARTEBHfAwoBTmiJBEhJdXAtGyW2nzzJUs1de4eeC0hfLFm/5au//PfXHQounV21x/L
  LW/8CzMfuj2fHadyJ+Z89KFP2hkN+o/VXzy+O9NO0XZjFh+35/kb7VZKc31Cniv4nGScE8R+c
  NGvV3aPLupKLPswqdKfp+GM11Kxmfwv907Yv/fp0vlrz2h+fDjZzPuTofTkax2sjY69fWv5pn
  KYM59k+qwW3N8lZOW7pWHVvkW7Np51tCl4tjo9OZytXGdFeav8/3zbtc0TOeSqH9gmq8plbRV
  3lpw6v4hxd+HJFeu/a3bp9m7NzqtZeuP2+ww9zdkSwZICT3x6v6d88gnf/6V6/iLR3Mtr5BU8
  SmJd+CwcbRumuIouFxBpOe+vpMRSnJFoqMVcVJwIAO3KIv9rAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-532.messagelabs.com!1652084576!402059!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19089 invoked from network); 9 May 2022 08:22:56 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 08:22:56 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 705CA10044A
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:22:56 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 63E7E100441
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:22:56 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 09:22:37 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] iwd: upgrade 1.26 -> 1.27
Date: Fri, 29 Apr 2022 16:03:01 +0800
Message-ID: <1651219381-27379-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651219381-27379-1-git-send-email-wangmy@fujitsu.com>
References: <1651219381-27379-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 08:23:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96996

Changelog:
==========
 Fix issue with hidden networks on connection error.
 Fix issue with directed roams if already trying to roam.
 Fix issue with checking for connected in FT frame event.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.26.bb => iwd_1.27.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.26.bb => iwd_1.27.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.26.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.27.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.26.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.27.bb
index 624885041..dc29bc3fd 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.26.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.27.bb
@@ -8,7 +8,7 @@ DEPENDS = "ell"
 SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
            "
-SRC_URI[sha256sum] = "0ff4541c2b7f14ec010c3cbd1f02350f1b58cb0c103412db22550e90d8040d6b"
+SRC_URI[sha256sum] = "013b4a0a79629c20d915954fc3b5d0620ef6e0d6065db3c342f4b3f9111f46ec"
 
 inherit autotools manpages pkgconfig python3native systemd
 
-- 
2.25.1


