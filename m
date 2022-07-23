Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A430BC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 03:33:20 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.2532.1658806398367734985
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jul 2022 20:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=T0WDFvym;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658806396; i=@fujitsu.com;
	bh=k8nuSoKYmkurKUQH2q2elSKsS6muu1H3/P9AQ9rJxrQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=T0WDFvympQEL3QUzqECH7nHAnBNf4NmorYxpZY1cO3OnLMy77OoNM2CaDwKa0YO8V
	 J+y8GDH7Dnxn0G37hf5iXvbrj63ey1SfZfrWNY5cUxjvX1EMPrWFh0saJJQKP3AujH
	 KUw29VyQp5fklrS5DsHzIdnz6ABIMZyvilxuBO0rByTAiRydhhyI8ceqfjG+Rginuj
	 190JqCpak4iubBGQMr/6i2y0DB+v9QAW9Grldf8YWDqNgbL1yTmfCcGXkd9acDDwhx
	 w4a+LIr6bZ4ceIbiVrdlEvlxVRGE6Gwx5EVVgZwt07NxW94Ff2ffyqwgW0dOKPWHcO
	 sRaeuHooaEogw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSbc64X6
  Swc0phhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aZRQtZCn5wVvz/kdLA+Ieji5GLQ0jgCaPE
  xb2n2SCc60wST6d2MHcxcgI5exglZp1RALHZBNQkpt+6wQpiiwjoSyydvQeshllAReLF7x52E
  FtYwFli/4c3TCA2i4CqxLXD+8BsXgFHiU2zvoDZEgIKElMevgfr5RRwkvh4/DMbxC5HifkP26
  DqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2BUSM2ZsY4Ow1SSuntvEPIFRcBaS9llI2hcwMq1
  itEoqykzPKMlNzMzRNTQw0DU0NNU11DUyNNdLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3O
  SdHLSy3ZxAgM4ZRixps7GFv7fuodYpTkYFIS5d3SeS9JiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gTv67j7SUKCRanpqRVpmTnAeIJJS3DwKInwlsYApXmLCxJzizPTIVKnGBWlxHlXgPQJgCQySv
  Pg2mAxfIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMG9qPNAUnsy8Erjpr4AWMwEt/qR9B2R
  xSSJCSqqBac2uN1r/50+alLn0BPfnWVriq+bmXFr2uDbCSq+iU9ttrX7Ab/V5qo9CfzK+inh7
  f2GznnW+O5+84JavTVFTCnt8RFyuGih9P/Ce85Wp9E+1UncFJY5nXxXmRXO+6F217suSvEdH3
  77aePDD/f096jM01nsdOOsr035r7VFBhaKVG8+/V+U86XT5ysesb2k/T1xm+/d57cQluhvqT2
  frzKx0n8q5apKGgcmy/RdfMf2+Zt241yTYJs/m4KyHTYfecktEHxTPPVZdolr7Q1qDfZ4Zkz6
  /279tv7gqft02tCryun15e0bVVIduhW9xftv/Jclfzrd9xhTIUJr/eMmr6Uq7GR5NW/k64UN4
  6FGJlFglluKMREMt5qLiRADmd19hXAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-587.messagelabs.com!1658806395!142488!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13591 invoked from network); 26 Jul 2022 03:33:15 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Jul 2022 03:33:15 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 7029E100078
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:33:15 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 637B3100077
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:33:15 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 26 Jul 2022 04:33:13 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] zenity: upgrade 3.42.1 -> 3.43.0
Date: Sat, 23 Jul 2022 13:38:23 +0800
Message-ID: <1658554703-9317-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658554703-9317-1-git-send-email-wangmy@fujitsu.com>
References: <1658554703-9317-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Jul 2022 03:33:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97982

Changelog:
==========
    - Documentation updates
    - Bump WebkitGTK dependency to API 4.1, for GNOME 43
    - Translation updates:
        Zurab Kargareteli

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/zenity/{zenity_3.42.1.bb => zenity_3.43.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/zenity/{zenity_3.42.1.bb => zenity_3.43.0.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/zenity/zenity_3.42.1.bb b/meta-gnome/recipes-gnome/zenity/zenity_3.43.0.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/zenity/zenity_3.42.1.bb
rename to meta-gnome/recipes-gnome/zenity/zenity_3.43.0.bb
index 2bcd8cc6ba..195e139e5f 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_3.42.1.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_3.43.0.bb
@@ -14,7 +14,7 @@ DEPENDS = " \
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.sha256sum] = "a08e0c8e626615ee2c23ff74628eba6f8b486875dd54371ca7e2d7605b72a87c"
+SRC_URI[archive.sha256sum] = "b0d7ca1e0c1868fa18f05c210260d8a7be1f08ee13b7f5cfdbab9b61fa16f833"
 SRC_URI += "file://0001-Harcode-shebang-to-avoid-pointing-to-build-system-s-.patch"
 
 PACKAGECONFIG[libnotify] = "-Dlibnotify=true,-Dlibnotify=false,libnotify"
-- 
2.25.1


