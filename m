Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DDDC6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:36:43 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.90638.1679618196221730101
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EWDsab0N;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679618194; i=@fujitsu.com;
	bh=Z62yIR/apq4g6NunEXAoeqs5/9H9x3rh0yZwhnUJFE0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=EWDsab0N4gJCxJIhqqlXpk7xrHYZ8j88lshR+JWouivqt1fmPxX5kvVpsfm8PM3h8
	 EC0zcKIzP1t2kEXZXr+3GG7u6UQeyEL3Hen2t6jl+pY/d4YuArX/AvI2DLlw+28f/9
	 6UJ+mouIC+a92TOW3byOVPOg3f6vXfzyKyOzGhsyVTnBPkuBpze5teYpeHVHpnj15y
	 pyyi6O++yfEEvUisCztCKbDx5Bx+p8pGbyxXGnVQBEYyn7KvLxUkjDebTYZsz/Y8hc
	 20auHBUnliv0VNLVQDf4WZxrzFDrfDfE+kUNFuB/UWlJRnNmiFtRu2+6+x5G07aGFa
	 VkHhgXGo44dtg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWXfiB5k
  Ug4M95hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a7tw8YC6ZyVWw+eoO1gXEqZxcjF4eQwANG
  iUmr97BBOJeZJN69XMUO4exhlPg26xhQhpODTUBK4sb9/2C2iIC+xNLZe5hBbGYBFYkXv3vYQ
  WxhAUeJlZP3gsVZBFQlGvtmsoDYvAJOEpv2PAerkRBQkJjy8D1YDaeAs8TCjdPAaoSAau43z2
  ODqBeUODnzCQvEfAmJgy9eMEP0KkrMvtzMAmFXSDROP8QEYatJXD23iXkCo+AsJO2zkLQvYGR
  axWhanFpUllqka66XVJSZnlGSm5iZo5dYpZuol1qqW55aXKJrpJdYXqyXWlysV1yZm5yTopeX
  WrKJERi8KcXKM3cwLuv7q3eIUZKDSUmUVyJUOkWILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO/nN
  zIpQoJFqempFWmZOcBIgklLcPAoifAeOguU5i0uSMwtzkyHSJ1iVJQS5/V7B5QQAElklObBtc
  Gi9xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYYgpPJl5JXDTXwEtZgJa7FwDtrgkESEl1cC
  U/XefgYJksMqlOQLf81rUA68Yrfy8P+ChUUZSxjMWSfX7q934tl4uddhRLlJxVeUBx9Zla0Ln
  TE3NXZ4vanpK5s+/HI/CJYe3af7ySd7xZa35D6bdy/j/rr3n3CkiL8B5aPnGcrXXaWrqawUZ5
  tcmRvzyjvzt3tAROVmVZ4dpzDU3Scm13FPUbpzqOpHSKi5w+VrPtU+1Hx4ITzZ4tStgznTP6b
  sjC/cc2D03WMWWu0r+2S8Vue8Np+JdP150/WN07B1LlOjq2zfunYwqeWda1nRM+eoay9KLdVK
  ujGV2XaKrT9WJzrba1D3BLW7L+w8qJxY78H1Z5OjtxvN7+aotXz8W+as5XLF7x3pjWWK+Ektx
  RqKhFnNRcSIAPJOTK1kDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-571.messagelabs.com!1679618193!848048!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28746 invoked from network); 24 Mar 2023 00:36:33 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-15.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:36:33 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 9BADD7C
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:36:33 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 8F8B073
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:36:33 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:36:31 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libpeas: upgrade 1.34.0 -> 1.36.0
Date: Fri, 24 Mar 2023 08:36:07 +0800
Message-ID: <1679618167-27390-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679618167-27390-1-git-send-email-wangmy@fujitsu.com>
References: <1679618167-27390-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:36:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101697

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* PeasExtensionSet now implements GListModel
* libpeas now requires GLib 2.44 or newer for GListModel
* Translation updates:
  - Interlingue
  - Turkish

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpeas/{libpeas_1.34.0.bb => libpeas_1.36.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/libpeas/{libpeas_1.34.0.bb => libpeas_1.36.0.bb} (88%)

diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.34.0.bb b/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
similarity index 88%
rename from meta-oe/recipes-gnome/libpeas/libpeas_1.34.0.bb
rename to meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
index 1bf6752e8..1282e9363 100644
--- a/meta-oe/recipes-gnome/libpeas/libpeas_1.34.0.bb
+++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
@@ -12,7 +12,7 @@ inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.sha256sum] = "4305f715dab4b5ad3e8007daec316625e7065a94e63e25ef55eb1efb964a7bf0"
+SRC_URI[archive.sha256sum] = "297cb9c2cccd8e8617623d1a3e8415b4530b8e5a893e3527bbfd1edd13237b4c"
 
 PACKAGECONFIG[python3] = "-Dpython3=true,-Dpython3=false,python3-pygobject"
 
-- 
2.34.1


