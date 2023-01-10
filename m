Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54038C67871
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 05:40:43 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.96893.1673329236216560502
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 21:40:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pWX56+Kv;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673329234; i=@fujitsu.com;
	bh=lxtvMpPbFBzBO6uMmTd1OPV6Qex3UkL4Vsj1PsQndhY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pWX56+KvFrUr4cRLGkrSEGtEJMvrrLbHTNy2oWB4ItiGDCTrlS+7IiyKdRnfpCslL
	 qyyz4K7U3iCsfbB4yycKWWftgycIofv8wYH3PX3Pd/6TkxGirfsVepltvGuAmBmhSJ
	 34nLyaxrpzMzECj+KaP++9TtdE7Fz2ZMsigfHcwcjV6kD7Fvm8qxwihDqTA6O764Hz
	 e7cvmDk6E6Sx7c7kM3MjOJWWewlS1HcbC2WZAPLbp066BEbE/7GupnZRhNoPUuxRYx
	 16K5MFQw/2uOeuyGyDxAyKo2hd4JlY2PrmCvBMDrxX+Owh9a6JiAuLTVA+hPz+rUmS
	 Bc2tnr4/gmFQQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORpBv4a0+
  ywcv5chYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bGdUfYCq5zVjRdns/YwHiKo4uRi0NI4CGj
  xPJpB1ggnKtMEq2nVjJCOHsZJQ5te8HWxcjJwSYgJXHj/n8wW0RAX2Lp7D3MIDazgIrEi9897
  CC2sECkxN47zWBxFgFViWUbTrKA2LwCjhL/j79lBLElBBQkpjx8D1bDKeAk0T3hKliNEFDN10
  9fGCHqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2JUSrR9+QdlqElfPbWKewCg4C0n7LCTtCxi
  ZVjGaFacWlaUW6VroJRVlpmeU5CZm5uglVukm6qWW6ublF5Vk6BrqJZYX66UWF+sVV+Ym56To
  5aWWbGIEhm9KcYr7Dsbjy/7oHWKU5GBSEuUt+rQnWYgvKT+lMiOxOCO+qDQntfgQowwHh5IEr
  84PoJxgUWp6akVaZg4wlmDSEhw8SiK8864DpXmLCxJzizPTIVKnGBWlxHkn/QRKCIAkMkrz4N
  pg8XuJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCv9VegKTyZeSVw018BLWYCWvxj6k6QxSW
  JCCmpBqZDJW5rA5/fbnrs+yeV/csxk8Y5Z7rmS0pMmB7B9KBstob6+9r1D3TdJhgxFK7Zfm6W
  0+WCu5dz3HyKJnLEH3BvlJM8Zqu6OaJVKWyb13TDdbn1knPeL8+5ay9Ws0xE081oyi5lqy3dd
  3UETnnU9aiUqhy2aREwDozMc5k83cTh68Mb128KNG5ewiPfFiIYkbDryayI+ullk/4YXRBp4z
  rP4pzQ8v7SPhHN47YiBXdnZMwrVH2ylve5t/PxL8KzHdW7YgI+bT3BX9F6S5LV+JWkwGVGR/u
  HXI8fyugJTyj78vbWwTeMZV8toptWXNCbL6Lz4IB43ZrePdvVTQQPq6wQ3cUz+ciO01obLigF
  LVBiKc5INNRiLipOBABYp6PxWgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-728.messagelabs.com!1673329233!406042!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25501 invoked from network); 10 Jan 2023 05:40:33 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jan 2023 05:40:33 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id EA3F71B0
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:40:32 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id DEB641AF
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:40:32 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 10 Jan 2023 05:40:31 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] evolution-data-server-native: upgrade 3.46.2 -> 3.46.3
Date: Tue, 10 Jan 2023 13:40:17 +0800
Message-ID: <1673329220-5227-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673329220-5227-1-git-send-email-wangmy@fujitsu.com>
References: <1673329220-5227-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100505

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Bug Fixes:
        I#442 - e_util_change_uri_component: Reset default port when changing scheme
        ews-I#208 - Prompting for password too often

Miscellaneous:
        Fix a crash under source_registry_object_added_no_owner()
        ESoupAuthBearer: Add debug prints

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../evolution-data-server/evolution-data-server.inc           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index 86f01ab377..2b74b2e605 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -9,5 +9,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.sha256sum] = "f9bd52008b7e535d816920cfcec70a0e5562bde28af71f996e203ff6a86e46e0"
-PV = "3.46.2"
+SRC_URI[archive.sha256sum] = "0938e2279e5cfbc2204766ca9d3fea570911699b07c10cbe01aca62a7e8b2bee"
+PV = "3.46.3"
-- 
2.25.1


