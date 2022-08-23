Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 736DAC32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 08:40:00 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.29477.1661243998536254079
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 01:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jmqfggWk;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661243996; i=@fujitsu.com;
	bh=xdMh15yy2fGsxbhWqEMj1nJ7Z2aob/+BZ2RjqnQLVes=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=jmqfggWkO9/FpEYRA9y7kbv7tZ6lGAMsKPvlxgUhUsMuzjRETfuj63IpwBa0f0gaa
	 358scgDEdw9le8O19WK+hxVMK2dzVaeq31MMDacXUFp3tp9PnkMZ5ENwCxbrLv/l2s
	 8pKoFc/8jbGD7+ck3G3DWURVpn7X80b7CrpJMypYRkAlMP4/8c4Zrfi6n9bPNc813K
	 sL085AzzoDp72hYPX5i6TR+mf3114bRpRVFzjlveiF9MmBM6QTLQCi8d1jEjpzALfT
	 QGjI+Py8IL/sQfYQwbGQnYjSvfj2XPiI8THSv7QxRyE0ukq8qYUQkifbkBbdagtduD
	 ghCwEZo+RrXWQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8ORpBsziSX
  Z4PJsKYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP5q3nMBe1cFcv70hoYGzi7GLk4hAQeMkrs
  PdjAAuFcZZK4++U0K4Szl1Hi/v/JzF2MnBxsAmoS02/dYAWxRQT0JZbO3gMWZxZQkXjxu4cdx
  BYWsJE4dWgGWA2LgKrEvy3ngeIcHLwCjhIL7mqBhCUEFCSmPHwP1sorIChxcuYTFogxEhIHX7
  xghqhRlJh9uZkFwq6U2DOrnwnCVpO4em4T8wRG/llI2mchaV/AyLSK0TqpKDM9oyQ3MTNH19D
  AQNfQ0FTX2FzX0MxIL7FKN1EvtVS3PLW4RBfILS/WSy0u1iuuzE3OSdHLSy3ZxAgMypRi1UU7
  GPev+ql3iFGSg0lJlNehniVZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgSvRz9QTrAoNT21Ii0zB
  xghMGkJDh4lEV79CUBp3uKCxNzizHSI1ClGRSlxXj2QhABIIqM0D64NFpWXGGWlhHkZGRgYhH
  gKUotyM0tQ5V8xinMwKgnzHgTZzpOZVwI3/RXQYiagxUG7mUEWlyQipKQamFr3rN2WX7b6wtI
  Yq9XO+248P54RX+r94HHaJfXn6+N17+rXG25hDdz83u56T3BMWA3zjPiKSekfubMcpuTqhYal
  zgvc2nUgqfCOyrlv/nN7r9oE1scoNJw0Ubns/3fJlTXn/rL67hU9ZjnPbPfTZ+Xfz5qEZl6X0
  m/OkXdde/sBj0fCGj3ha/yrrFQfO0/Revg5fJ7u5ntZa+5EcZwWuzrx+eHSJTprNpvmr1lk9m
  3faoaK8LTumhW3wvfw3ik65HHmzfq5SjIVpborbK2WKJS7zhaw2TL3sd/0Aqn4cxrTDOLeX1j
  RcGyiytrWSTf9uf0j303fE3XmZDDrysR5H7T/h/D+WM/fcm+zYvCRSS+VWIozEg21mIuKEwEa
  kTv+RQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-548.messagelabs.com!1661243996!51963!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14286 invoked from network); 23 Aug 2022 08:39:56 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Aug 2022 08:39:56 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 268A91A3
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:39:56 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 1916D1B1
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:39:56 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 23 Aug 2022 09:39:54 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ldns: upgrade 1.8.2 -> 1.8.3
Date: Tue, 23 Aug 2022 16:39:35 +0800
Message-ID: <1661243978-4657-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 08:40:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98381

Changelog:
==========
* bugfix #183: Assertion failure with OPT record without rdata.
	  This caused packet creation with only a DO bit (for DNSSEC OK)
	  to crash. Thanks Anand Buddhdev and others for reporting this
	  so quickly.
* Fix for syntax error in pyldns

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/ldns/{ldns_1.8.2.bb => ldns_1.8.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ldns/{ldns_1.8.2.bb => ldns_1.8.3.bb} (88%)

diff --git a/meta-oe/recipes-devtools/ldns/ldns_1.8.2.bb b/meta-oe/recipes-devtools/ldns/ldns_1.8.3.bb
similarity index 88%
rename from meta-oe/recipes-devtools/ldns/ldns_1.8.2.bb
rename to meta-oe/recipes-devtools/ldns/ldns_1.8.3.bb
index 90c369e651..16816e62d8 100644
--- a/meta-oe/recipes-devtools/ldns/ldns_1.8.2.bb
+++ b/meta-oe/recipes-devtools/ldns/ldns_1.8.3.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34330f15b2b4abbbaaa7623f79a6a019"
 
 SRC_URI = "https://www.nlnetlabs.nl/downloads/ldns/ldns-${PV}.tar.gz"
-SRC_URI[sha256sum] = "b92b001cdd382de653620a05445e42e17a827eec93d64ee587ad291a533cc1e9"
+SRC_URI[sha256sum] = "c3f72dd1036b2907e3a56e6acf9dfb2e551256b3c1bbd9787942deeeb70e7860"
 
 DEPENDS = "openssl"
 
-- 
2.25.1


