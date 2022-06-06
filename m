Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB872CCA484
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:23:24 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.31167.1654518196561429644
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kCg9StsM;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654518194; i=@fujitsu.com;
	bh=PRHpEhNc2VPidbu079Z6hmH92n8Pjuhe+CEavroGT+c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=kCg9StsM0wuEIn6+S3oIzNVsuhsIJiQMxl7ULLhvrm0lxprt0bo01ggwUfg+Yw5iM
	 WJTHYaoZZdfsvjc5brsrImzOnhmkOmIKtXtiELEQq7+H7CCchb/NAZoliWer6LucSZ
	 DzbMBxxaMAecQh9lieGDDtAF0JoT4l7GyPS7J2Z8q9sh7NFJ9k7lnC6GEIHdFQyXyy
	 jOT4O0N8fTkZpLuK1mMKiZtJbCQGgWXlod3SjZ4M1AaceMGUbt6fp5nXGa1FSggP3W
	 VzLq0SXEx982sthUui76DSfQbtfXH59ZFqmyOO+2PES37ZZ7j2H63JAR9qc/LCbz0j
	 0oOn9gzzRm34A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8MxSXfTx7l
  JBhPOy1lcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBkn9+5nKZjOU7Fz1mvWBsY7XF2MnBxCAk8Y
  JSYfTO1i5AKyLzBJzJp5nRnC2c0osbznMitIFZuAmsT0WzfAbBEBfYmls/cwg9jMAioSL373s
  IPYwgJOEs+fLQOrYQGKH3x0kaWLkYODV8BR4s0xd5CwhICCxJSH78FaOYHK963/yARxhKPEqQ
  nLGUFsXgFBiZMzn7BAjJeQOPjiBTNEr6LE7MvNLBB2hcSMGdvYIGw1iavnNjFPYBSchaR9FpL
  2BYxMqxitk4oy0zNKchMzc3QNDQx0DQ1NdY2NdA2NzPQSq3QT9VJLdctTi0t0jfQSy4v1UouL
  9Yorc5NzUvTyUks2MQKDOKVYoW4H47WVP/UOMUpyMCmJ8tpfm5skxJeUn1KZkVicEV9UmpNaf
  IhRhoNDSYK37gNQTrAoNT21Ii0zBxhRMGkJDh4lEV7rd0Bp3uKCxNzizHSI1ClGXY6ZX9sOMA
  ux5OXnpUqJ8956D1QkAFKUUZoHNwIW3ZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfMuBrm
  EJzOvBG7TK6AjmICO8HkwB+SIkkSElFQD0yyOnhUfY9jOOczanLYxttP0+grD7pX35j/X725X
  LDHUZ3dM75iR63NX5LfzjP8My/jct+q9la61Yjf+5bq/4W18m3TCOi5n09nNJ59d2LRceNZd9
  yVcWdyfj0m2H+ZlZ20wO7rJMmVzLKuH39nrzwr7D1/IPLvluujBN/rmnDPfv/yhZP5Q7Pzssq
  ZfVRdm/AiurnhwszL+3W+eKTEub7kPvS7z/8FcxHOFweDiPfa1bcdETrmsMFWK1vrvWOZZqx/
  4e66l4eE0kz0X07uc2HnbZI+eT/j6/6zB08R65kMuBW8io3TW7WK2eV2o6BRRNrlRxE5ZI7A0
  2/jm7+Y4BtFZrMa3Su5qmpaHmlsrsRRnJBpqMRcVJwIA7xKBaWkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-565.messagelabs.com!1654518194!629204!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10107 invoked from network); 6 Jun 2022 12:23:14 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jun 2022 12:23:14 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D7EAE1009B8
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:23:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A4B241009C7
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:23:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 6 Jun 2022 13:23:09 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] tracker: upgrade 3.3.0 -> 3.3.1
Date: Mon, 6 Jun 2022 20:22:44 +0800
Message-ID: <1654518164-9091-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654518164-9091-1-git-send-email-wangmy@fujitsu.com>
References: <1654518164-9091-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jun 2022 12:23:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97423

Changelog:
=========
  * Fixed blank nodes to return the correct identifier in certain
    queries.
  * Fixes to FTS consistency after updates
  * Fixes to HTTP module linking
  * Fix handling of STRING_LITERAL_LONG1/2 terminals
  * Fix handling of negated property paths
  * Use .so suffix for modules on all platforms
  * Added code examples in JS/Python
  * Developer documentation improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tracker/{tracker_3.3.0.bb => tracker_3.3.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.3.0.bb => tracker_3.3.1.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.3.0.bb b/meta-gnome/recipes-gnome/tracker/tracker_3.3.1.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/tracker/tracker_3.3.0.bb
rename to meta-gnome/recipes-gnome/tracker/tracker_3.3.1.bb
index bb2396af7..42f44863b 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.3.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.3.1.bb
@@ -22,7 +22,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages bash-completion features_check python3native
 
-SRC_URI[archive.sha256sum] = "0706f96fe7f95df42acec812c1de7b4593a0d648321ca83506a9d71e22417bda"
+SRC_URI[archive.sha256sum] = "5ad6f5bc97781ebf55ecd6947cd4ae7ff4192516580d10bd8380f1dd47196ed2"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.25.1


