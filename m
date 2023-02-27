Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51746C7EE2D
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:06:11 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.85451.1677485165190480423
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:06:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rABcR8qE;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485163; i=@fujitsu.com;
	bh=eM8ISiJpMEWT1x0zQKphs29Wncp9nthcwhyXqLIohD4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=rABcR8qE3P5cFD+y82UymJTywEGjbOjko7d8gkqVMUPyqwGMffdWpILH6htsvtMvI
	 d2BrchlsRyV9Nbo7yI4Sdi7scohqFOJGGFYvMC2f06K5c1idBBb3k7HL9jZkKKYfCk
	 A80kRM5bCWPOqO5tpvEHa8SZi1WLDm8E28Px6PwPRK4VOOtK8wGTJ0Nax1p5ocyorU
	 fVi6jTJenSSMH+hyoZvZKoMEFDYtuoTo3Lh7L6JsxeAbVTo+Bht0hCmU8KlT7gjsuE
	 Y+KcOeyVSWkbkRXQp/oH2JltE/mq2NxlY2haHGMsfo6ec8nBFYY77BV4Pmw+sE6PAH
	 65SiyAJ3wSnBw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORpJuV8if
  ZYOJjXYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePz3YfsBVM5K7o/XWVuYNzL0cXIxSEk8JBR
  YvnyZewQzhUmiWXvp7FBOHsZJZZ9fMPYxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAn8T6CWfA4iwCqhKfflxiArF5BZwkDvf9AZsjIaAgMeXhe2aIuKDEyZlPWCDmSEgcfP
  GCGaJGUWL25WYWCLtSovXDLyhbTeLquU3MExj5ZyFpn4WkfQEj0ypG0+LUorLUIl0zvaSizPS
  MktzEzBy9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzknBS9vNSSTYzAYEwpZrixg3FO31+9
  Q4ySHExKoryLnP4kC/El5adUZiQWZ8QXleakFh9ilOHgUJLgPZgElBMsSk1PrUjLzAFGBkxag
  oNHSYSX2QgozVtckJhbnJkOkTrFqCglzsuXCJQQAElklObBtcGi8RKjrJQwLyMDA4MQT0FqUW
  5mCar8K0ZxDkYlYd6oBKApPJl5JXDTXwEtZgJavP3hD5DFJYkIKakGpqz0e3dtP+666XVFeOM
  pnouTxZ7teb/eVc54+32RjFPTDy1dUFbyiNsx9KtNyskv1+V+6XDW/n/+bUdT5cqqXw/evxWX
  1bonY5rlN/eo326bRk+lhYWbvWfLXVQ79TLawOuWmFGrxes4Zf7V596073OwlTBY80xq5adnE
  3ZLS9fzzY7TnZ90wCfr1Xyvy03Hu98d3rDi6ISdVjvmHTn1kDfk5duJdmJMkYufvld33i0zcd
  mhg5fr1O4v6rzycN6G4n/FMw1YeCcJCdwo+fd+h6vlVB7xrYl852TZBT8fK/7x9rfgW72kA3t
  1n21gN/+01/TePg2Le8Uv2O48e/KL4dfWpl1hlzc1tMUcXJvBsrPAS4mlOCPRUIu5qDgRABFP
  ijlBAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-587.messagelabs.com!1677485162!281061!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13481 invoked from network); 27 Feb 2023 08:06:02 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:06:02 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 505691B1
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:06:02 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 43BA87B
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:06:02 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:06:00 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-autobahn: upgrade 23.1.1 -> 23.1.2
Date: Mon, 27 Feb 2023 16:05:49 +0800
Message-ID: <1677485153-11495-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101268

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-autobahn_23.1.1.bb => python3-autobahn_23.1.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_23.1.1.bb => python3-autobahn_23.1.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_23.1.1.bb b/meta-python/recipes-devtools/python/python3-autobahn_23.1.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-autobahn_23.1.1.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_23.1.2.bb
index b67e90068..26f85e2a4 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_23.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_23.1.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://crossbar.io/autobahn"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3e2c2c2cc2915edc5321b0e6b1d3f5f8"
 
-SRC_URI[sha256sum] = "a88882ab4700ee9eee46c69c38e2b625f6fda48ab1ce61cf7b58b23cf2fadcb8"
+SRC_URI[sha256sum] = "c5ef8ca7422015a1af774a883b8aef73d4954c9fcd182c9b5244e08e973f7c3a"
 
 inherit pypi setuptools3
 
-- 
2.34.1


