Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 284E0C7618E
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:33:09 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.42934.1682307181132627505
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RVYwdaZG;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682307179; i=@fujitsu.com;
	bh=yWRR5XEfUUDggJWXGYkwY4um4S2MOz9GHBFWC9ztzP8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=RVYwdaZGtuy9XZv6AALbFKDhCkrKCrfUUvJI+oPkS/cBTrqZIVZR9wgS6pM8AqcnA
	 1hiYb5rDAlbi46pRzXVaZMEvaRqemoNbAbqLt5ycQ8s/WmsdSnG/vtKTHzcO3qaXbz
	 vvmD3cfQmOvPQg0nHWdKkaiEpsnRqY52hwJnxq+XyXhJPfdoR3NplYXN5FBpE9ES67
	 PuPOnlacPiG6SdXFThodJLp4t7MI+Mg8s8aZfc/peAMxluxewxYMLNQ4PBm7tNO+6E
	 hBAAabYtrC+wMxG48eN8OMkCURMgQOSOgJZ1kIgn//1PP48mMUUWyScw96+Ctsw4u9
	 3qpJ52JBUnraw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxSTfrh2u
  KQeM7aYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePJ0dXMBau4Kj4tes/cwLiLs4uRi0NI4Amj
  RMf+i0wQzg0miQPz97JCOHsZJZZ/7WXvYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  rAaYQFfiZsrLjCB2CwCqhJdi9eA2bwCThLbDrxnBbElBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL1
  4wQ9QoSsy+3MwCYVdKtH74BWWrSVw9t4l5AiP/LCTts5C0L2BkWsVoWpxaVJZapGuol1SUmZ5
  RkpuYmaOXWKWbqJdaqlueWlwClEksL9ZLLS7WK67MTc5J0ctLLdnECAzGlGL2nh2Mf3f81TvE
  KMnBpCTKu2SDS4oQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd6iT64pQoJFqempFWmZOcDIgElLc
  PAoifAu+wKU5i0uSMwtzkyHSJ1iVJQS57X9DpQQAElklObBtcGi8RKjrJQwLyMDA4MQT0FqUW
  5mCar8K0ZxDkYlYV7JD0BTeDLzSuCmvwJazAS0eBe3C8jikkSElFQDU/IkL9t3hldncPjvrIg
  +o2WakpbWuSti1WaZhdeYKj0K/kqcalHaxvtg3bzH8jULXy0QNO5P6004vid9U83vk9ULzJd9
  dSkz59+Rc/eEkMf2wgaBquvbQnlKd1mcrX4qpn+h/fmG/eVJK1tOLS8/uqDlEt+sSxcm76x7O
  2H+ucK5t1a5lCW+fZimfIQl781Ws7vlZz7b6YvbK05/cPr1l3v/jmkUruhK2PneWrSVJzxqm+
  q5qBlbnG73bfIIPmjy3KJj2o6WXy8ts/dLNwTdEslsSlLna3rw+2MYl/RVl4q5jrHLdK8H/nt
  gyVivZalUVf1h3bfjSkcnmDBHTO1a+PISS/zym7HHF+57/PBu/wQlluKMREMt5qLiRAAvf3Ov
  QQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-587.messagelabs.com!1682307178!1248!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4411 invoked from network); 24 Apr 2023 03:32:58 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:32:58 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 1574B10032B
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:32:58 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 096E51000E7
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:32:58 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:32:56 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xmlschema: upgrade 2.2.2 -> 2.2.3
Date: Mon, 24 Apr 2023 11:32:38 +0800
Message-ID: <1682307162-12043-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:33:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102174

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Add support for Python 3.12
    Detach content iteration methods from ModelVisitor

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-xmlschema_2.2.2.bb => python3-xmlschema_2.2.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_2.2.2.bb => python3-xmlschema_2.2.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_2.2.2.bb b/meta-python/recipes-devtools/python/python3-xmlschema_2.2.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-xmlschema_2.2.2.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_2.2.3.bb
index d2b75048c..8e48dc5b2 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_2.2.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ab20f8e337bea2e6874f372edfd12c0"
 
-SRC_URI[sha256sum] = "0caa96668807b4b51c42a0fe2b6610752bc59f069615df3e34dcfffb962973fd"
+SRC_URI[sha256sum] = "d21ba86af4432720231fb4b40f1205fa75fd718d6856ec3b8118984de31c225b"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.34.1


