Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE7D4CCA489
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 03:35:40 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web08.2551.1658806534803465517
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jul 2022 20:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LPcVrhRU;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658806532; i=@fujitsu.com;
	bh=DyMnJaCHEc1H4RJH7BMg6BONrWqzlFDEM3k85EtaCR4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=LPcVrhRUVgyBfgzwAXhiGRMBOHEq6+5rFwuzbvKFXj8foE9k7RFm0V+tsOjKptd8a
	 hKQLUzOf8kn+oHT5w4nMxFd7nu41gggi1SZ7hX8w6OEc8sYIuXTcwaPIRRCH3c+aPU
	 lt8LfBW6yB3H8jkL/oUsEKxq1LBhZDxObDdKmRhdAsI8TCSHI9w9oSysH9w2zmiS6f
	 fowQ3JYzXXXpXrpjWPuIy2uzlKcEzFXHbubpi+FijHzdyLRtYZre9u/4ROlNDRFaKQ
	 x7vcTDn9A8eLE5TTq8UYY7f23276lzczZGr4klB8tPSupA7WKegCxYjSQxedXPEGHs
	 c4S9qnMdzU9eA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8MxSZc58X6
  SweOzWhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b+57sZC35yVBzceZKpgXEmRxcjF4eQwBNG
  icNHXjN1MXICOdeZJFZtyINI7GGUePppERtIgk1ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBT4n5fyeB1bAIqEp0bP7KAmLzCjhKHJrQwAhiSwgoSEx5+B6sl1PASeLS7242iMWOEv
  1zF7JC1AtKnJz5hAVivoTEwRcvmCF6FSVmX25mgbArJGbM2MYGYatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWiTVJSZnlGSm5iZo2toYKBraGgKpA11jQ30Eqt0E/VSS3Xz8otKMnQN9RLLi/VSi4v1
  iitzk3NS9PJSSzYxAgM5pThVbgfjgX2/9A4xSnIwKYnybum8lyTEl5SfUpmRWJwRX1Sak1p8i
  FGGg0NJgvd13P0kIcGi1PTUirTMHGBUwaQlOHiURHhLEoDSvMUFibnFmekQqVOMilLivHUgCQ
  GQREZpHlwbLJIvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmXRAPNIUnM68EbvoroMVMQIs
  /ad8BWVySiJCSamBy6Hr3fx1/nuiBxzlfouas91lhqhG0p7eBV+yyH2e53B6PKcmHFixbbJ2a
  +5uzuP3BAsPL4nnXf7z96trDy3z5zul7/U/q0k71519a2Kjz9vbRaYqc7xfWc3pt+TPny7NLk
  3238R9ZeyqPZdshxQtzUwUl085sUD4oOvOjt6ri78C9rx4/35b8rNtuSmPQg5nV7h/37urn55
  Lo0Z152YVRXVE6ipvx1YHqy2+frVm/7nXqC7l3f79We9zkXPjZ/MGZnr7HBvMebFjwe+au074
  sP9YdWfhy/7tZ/7NluGW+7qid8P7ZtIo1yndOfVjxYNLKU3GHbUL4TjZFKxz4xn09qXqq/k2v
  dcmHjm8+vjd3mqieEktxRqKhFnNRcSIAPEm7fV8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-745.messagelabs.com!1658806531!49356!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19390 invoked from network); 26 Jul 2022 03:35:31 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Jul 2022 03:35:31 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 20D461000C1
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:35:31 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 13C84100078
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:35:31 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 26 Jul 2022 04:35:29 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] unbound: upgrade 1.16.0 -> 1.16.1
Date: Sat, 23 Jul 2022 13:40:47 +0800
Message-ID: <1658554848-9357-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658554848-9357-1-git-send-email-wangmy@fujitsu.com>
References: <1658554848-9357-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Jul 2022 03:35:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97985

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../unbound/{unbound_1.16.0.bb => unbound_1.16.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.16.0.bb => unbound_1.16.1.bb} (96%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.16.0.bb b/meta-networking/recipes-support/unbound/unbound_1.16.1.bb
similarity index 96%
rename from meta-networking/recipes-support/unbound/unbound_1.16.0.bb
rename to meta-networking/recipes-support/unbound/unbound_1.16.1.bb
index cf59d29180..5eb9ec1bfc 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.16.0.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.16.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master;protocol=https \
 	file://0001-contrib-add-yocto-compatible-init-script.patch \
 "
-SRCREV = "edc1d07718fb0ecabf9ddd3cf65503de1810834c"
+SRCREV = "903538c76e1d8eb30d0814bb55c3ef1ea28164e8"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-- 
2.25.1


