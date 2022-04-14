Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA77CC636FF
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:56 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web12.9966.1649931557953995820
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 03:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aGcD+AYI;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649931556; i=@fujitsu.com;
	bh=07a5WPo6FE7p5rZ/vG+YsATfAOJmL6ceyDrpiTTOaO8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=aGcD+AYIzZfSdHJ/lpdCQ1rbvGJaNeCQitTw4iHLlCUzpDjIOchBp5nxUpbpUyFbc
	 HjFkUaynByjT0Aw2EobGTYxzhp+nFLKq7gbXQIla8lGl6w6FqYuOCIMaReaUu07gcE
	 oBsXNelv6OJhOAMeo1XXqGG1tbxaPeGUbQROGZHJKAED4tMoLxg4kw7uk5IKpBY8Rd
	 lDtKpD77btoJ2cPH2eclHl3Y9B9TkCyieQjYg7v2TpXyXhE5OEvnNe7OpIIUgMJ2vB
	 c9rzO4mRpvtzZzEv0GhLUFUh4A7qObcyKZ5e8KTWfvqEClFAGdmFvGu/jY0LP2qNkQ
	 kb+0WsZr/ySNQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxRVf5a3i
  SwbF9mhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bXgt2MBV85K950L2FpYPzG0cXIxSEkMJtJ
  Yu/G8+wQzh5Gid99e4AcTg42ATWJ6bdusILYIgL6Ektn72EGsZkFVCRe/O4BqxEWcJJ4eamDr
  YuRg4NFQFWi800SSJgXKPxo6gsWEFtCQEFiysP3YK2cAs4SS/ovsIHYQkA1Z1d1MUPUC0qcnP
  mEBWK8hMTBFy+YIXoVJWZfboaaUyExa1Yb0wRG/llIWmYhaVnAyLSK0TKpKDM9oyQ3MTNH19D
  AQNfQ0FTXUNfUUi+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzAgU4oZrXcw
  dvT91DvEKMnBpCTKq/kmPEmILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO+CR0A5waLU9NSKtMwcY
  HTApCU4eJREeNe8BUrzFhck5hZnpkOkTjEqSonzxnwCSgiAJDJK8+DaYBF5iVFWSpiXkYGBQY
  inILUoN7MEVf4VozgHo5IwL/8XoCk8mXklcNNfAS1mAlr8bVUoyOKSRISUVAOTTdl+8bpVOZF
  Rk0WmWRd1T5F3//3ASvboPx3xuVPqtbQK5igkbmkp31ZTecIp6QVHwXGjm9XWiXxh8Z1N4ftn
  5oYv/P5U/rXWnon+2yX71siasAWzFm1n6UzcKTOnzWHCjdOJ+elXj89NfnVQ+EHWlf93j6qaf
  NAQtOww+DCpSFF613ndYGFn0YnXd4gliDuuzJm9afPLnnlXpL5UvT7zsIczPKNgz2vOx70qwl
  /PlJm9WNqoKbdIPKajtCFyh1K3jrTZX/vWwLZdv5veLbY54Xx+Zl9D0yxms7TiBrG58R0dxqe
  9E2101viVTK+2CwlT9lTbNJ+94HTlBsVFDVffCtxiNa+pCVeex5z1RomlOCPRUIu5qDgRADoC
  MfZDAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-585.messagelabs.com!1649931555!84455!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30109 invoked from network); 14 Apr 2022 10:19:15 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-11.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Apr 2022 10:19:15 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23EAJ9c5031296
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 11:19:15 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 14 Apr 2022 11:19:10 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] tracker: upgrade 3.2.1 -> 3.3.0
Date: Thu, 14 Apr 2022 18:18:53 +0800
Message-ID: <1649931533-20183-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649931533-20183-1-git-send-email-wangmy@fujitsu.com>
References: <1649931533-20183-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96652

Changelog:
==========
  * Fix storage of subsecond information in date/time properties
  * Add more tests

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tracker/{tracker_3.2.1.bb => tracker_3.3.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.2.1.bb => tracker_3.3.0.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.2.1.bb b/meta-gnome/recipes-gnome/tracker/tracker_3.3.0.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/tracker/tracker_3.2.1.bb
rename to meta-gnome/recipes-gnome/tracker/tracker_3.3.0.bb
index f81a84cd31..bb2396af7c 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.2.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.3.0.bb
@@ -22,7 +22,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages bash-completion features_check python3native
 
-SRC_URI[archive.sha256sum] = "1847e08b39e6e61d848735aa1f97f7d96c038201653fa0d7cb9e81b37eb9c03a"
+SRC_URI[archive.sha256sum] = "0706f96fe7f95df42acec812c1de7b4593a0d648321ca83506a9d71e22417bda"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.25.1


