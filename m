Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F8AC433F5
	for <webhook@archiver.kernel.org>; Sun,  9 Oct 2022 00:33:56 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.9566.1665275625652241842
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Oct 2022 17:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IJzMUUVN;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665275623; i=@fujitsu.com;
	bh=fuvdJaLzx04hVzT8yup8fFScvwbegiehZeLNohDxg0Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=IJzMUUVNcR6wWyQlKRnZ3HYzhIYjJj/eUi5f36wlNl6kfXZkIy+sf9Cyw7e5ESAjB
	 EmxEFW/0q7V79Ev4wXlATxJrvwCXn3fN6sQG3Y3YS+sKmYo8AVqYJ0xvX0sPmggktj
	 nTipH2UoSazP66XO9VTKEbWo0MHK12k9Opx8v4VRZdzqU9ksgMv3xzD8yiGm5gNoeU
	 ZRfIi5+MTk6MqrCVgJXtGOHeAVLs/EeJmy83rFBECVuYN9YN6Rbn0T0RCkbzm+Fh+a
	 uaoggQzvJs9EhKmdnRM91NZqrt1bU2shtCgX+zOgsb2V5BNjvUX4I+6mRPAoO1KZuF
	 xZjz2BbiV7gUg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8OxWfepmFO
  ywbl1FhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bC3u3MBV85Kr4+3c7SwDiZo4uRk0NI4AGj
  xMZexi5GLiD7MpPEzelrWCCc3YwST1uOMYNUsQmoSUy/dYMVxBYR0JdYOnsPWJxZQEXixe8ed
  hBbWMBZYv2U52BxFqD4ummHwWxeASeJvf+2gPVKCChITHn4HiouKHFy5hMWiDkSEgdfvGCGqF
  GUmH25mQXCrpCYNauNCcJWk7h6bhPzBEb+WUjaZyFpX8DItIrRJqkoMz2jJDcxM0fX0MBA19D
  QVNfSTNfI0EAvsUo3US+1VDcvv6gkQ9dQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMDBTihMu7WBc
  t++X3iFGSQ4mJVHep1sdkoX4kvJTKjMSizPii0pzUosPMcpwcChJ8DqxOyULCRalpqdWpGXmA
  KMEJi3BwaMkwhv2zzFZiLe4IDG3ODMdInWK0ZJj6ux/+5k5loPJmV/bDjALseTl56VKifPGCg
  PNEwBpyCjNgxsHi+RLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5PwgATeHJzCuB2/oK6CA
  moIOsHtqBHFSSiJCSamBKdJ0uZbRj800fwwXxB9Y5LM3VKg66zS13eWNA4My1fEultOt3q329
  NjHfefGqHYrzZu5au2iD0nE/yc/v50uKhDx8/V16b9o3Z6c7F5ym6osFLd8VahP2M9x23w/34
  sqO5PkLD7oqJExh+Kzon8rxZ+f7hEeuwadd3RbqJWXvOJ5jur2him1riIX9wZy3hdYb375NMH
  sW7egx18D6Rv6O3zt2ZwgWCOxYsmLxB5cO6V1C567y2WtqrVDR2dvWX3pLK0lfZeasU4/5f3B
  unB4579jF/e7T2wUK7uyesP+n1Pvyq8fnvb47sfwiW8KhenOmmtk1NX8usnaXrJgW2sO66YfF
  hTtW9cbc6x8cFrwUp8RSnJFoqMVcVJwIACHV2FpfAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-728.messagelabs.com!1665275621!211372!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3499 invoked from network); 9 Oct 2022 00:33:41 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-12.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Oct 2022 00:33:41 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 5CADA7C
	for <openembedded-devel@lists.openembedded.org>;
 Sun,  9 Oct 2022 01:33:41 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 4FB837B
	for <openembedded-devel@lists.openembedded.org>;
 Sun,  9 Oct 2022 01:33:41 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 9 Oct 2022 01:33:39 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gspell: upgrade 1.11.1 -> 1.12.0
Date: Sun, 9 Oct 2022 08:33:22 +0800
Message-ID: <1665275606-29112-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Oct 2022 00:33:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99099

Changelog:
==========
* Use G_MODULE_EXPORT instead of the custom _GSPELL_EXTERN macro.
* Small maintenance tasks, some minor simplifications.
* Translation updates.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/gspell/{gspell_1.11.1.bb => gspell_1.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gspell/{gspell_1.11.1.bb => gspell_1.12.0.bb} (76%)

diff --git a/meta-gnome/recipes-gnome/gspell/gspell_1.11.1.bb b/meta-gnome/recipes-gnome/gspell/gspell_1.12.0.bb
similarity index 76%
rename from meta-gnome/recipes-gnome/gspell/gspell_1.11.1.bb
rename to meta-gnome/recipes-gnome/gspell/gspell_1.12.0.bb
index c76a48f19a..b7e4954964 100644
--- a/meta-gnome/recipes-gnome/gspell/gspell_1.11.1.bb
+++ b/meta-gnome/recipes-gnome/gspell/gspell_1.12.0.bb
@@ -7,4 +7,4 @@ DEPENDS = "gtk+3 iso-codes enchant2"
 
 inherit gnomebase gettext gobject-introspection vala
 
-SRC_URI[archive.sha256sum] = "ef6aa4e3f711775158a7e241a5f809cf2426bc0e02c23a7d2b5c71fc3de00292"
+SRC_URI[archive.sha256sum] = "40d2850f1bb6e8775246fa1e39438b36caafbdbada1d28a19fa1ca07e1ff82ad"
-- 
2.25.1


