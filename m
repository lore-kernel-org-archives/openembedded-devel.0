Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB396C19F2B
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 08:37:33 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.2518.1659602250784724284
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Aug 2022 01:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rxsjfV2O;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659602248; i=@fujitsu.com;
	bh=d4ysERIOH/0hTBZntkDeXOaFH3A1L/7XICx59t89yLQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=rxsjfV2OAjalYWeBzKgZ5EPBBXPVqHR06v5TT8cErbaevdRV4iw380rsMxFZkgLUm
	 31Mr/QGFliB/zKFsAFrKmnjf/6WJxn1UQ2bBY37zjDS6v/wVolLc+QYuvXNR8M8Ye1
	 GlC1mA23E3C4Cd9Jk2k6jOu1Fmrv9keuKBlUGn5H0cHZMv/IxBilUGIqBZjmlmzRTQ
	 dmXvVZ+N+gO44mo1cdI68QG0DfwGOyM+JmImmEtyS3UqSlNvAfLPXM97w3D9+gkHQN
	 LSftQKw1ylT8Ssdr9NRLBnRcb6QCado1EtJj03cyT2SiBxhaoZL2BCo/CATBcAwI//
	 XxtSypwN3864Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8ORqGvR+jr
  J4P8CRouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPP4ifMBZ08FfP6WtkbGN9xdTFycQgJPGGU
  uPluPUsXIyeQc51JYvkvb4jECUaJe5NPMYMk2ATUJR7ffM0IYosI6Essnb0HLM4soCrRfXENO
  4gtLOAjcXTTT7A4i4CKxPfJE8HivAJuEs+fLmEDsSUEFCSmPHzPDBEXlDg58wkLxBwJiYMvXj
  BD1ChJnFjxkQnCrpB4ffgSVFxN4uq5TcwTGPlnIWmfhaR9ASPTKkbbpKLM9IyS3MTMHF1DAwN
  dQ0NTIG2ka2hqrJdYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdcmZuck6KXl1qyiREYminFaTN3
  MG7Z90vvEKMkB5OSKG9a8+skIb6k/JTKjMTijPii0pzU4kOMMhwcShK8d+qAcoJFqempFWmZO
  cA4gUlLcPAoifCmgrTyFhck5hZnpkOkTjHqcsz82naAWYglLz8vVUqcN7UGqEgApCijNA9uBC
  xmLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5nUDWcWTmVcCt+kV0BFMQEfocL0AOaIkESE
  l1cBkdcZ0e/Kiloe35BYJLNH5WzuXu+P5qrnLf5l8922smbqT5VNG7fWs74XGO0Wsq5++8tDo
  83DwjXOofbrylUqyk/7CZ8758TFXst6E8MWKmStuvtv2XEXN63+ocMT2pWnBocnN7dq+H2Wf9
  k76Xr33y6a/dydZXTxst8XCpZ31lPqymZF7pyuqH/eJED4z64rR312yDd5T55jpRc8xOHLj4/
  OPO759r5lf/r2hXyn14A8f/S/uXC7B/Ruf/TOssEj1fJC0b9t0//PRtqbzar+aPaies6Po3hK
  jrT8Td9kUO0/kaglUfFcca5quwiHfo/n7Zt+s07N0j+1dv+Hp8S0NWq9uhQjurP67xezTd6EL
  SizFGYmGWsxFxYkAUdRTeVQDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-728.messagelabs.com!1659602231!196665!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26799 invoked from network); 4 Aug 2022 08:37:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 4 Aug 2022 08:37:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 6E446100192
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  4 Aug 2022 09:37:11 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 627E0100190
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  4 Aug 2022 09:37:11 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 4 Aug 2022 09:37:09 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-werkzeug: upgrade 2.2.0 -> 2.2.1
Date: Thu, 4 Aug 2022 16:38:24 +0800
Message-ID: <1659602304-6116-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Aug 2022 08:37:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98131

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
=========
-Fix router so that /path/ will match a rule /path if strict slashes mode is
 disabled for the rule. #2467
-Fix router so that partial part matches are not allowed i.e. /2df does not
 match /<int>. #2470
-Fix router static part weighting, so that simpler routes are matched before
 more complex ones. #2471
-Restore ValidationError to be importable from werkzeug.routing. #2465

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-werkzeug_2.2.0.bb => python3-werkzeug_2.2.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_2.2.0.bb => python3-werkzeug_2.2.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_2.2.0.bb b/meta-python/recipes-devtools/python/python3-werkzeug_2.2.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-werkzeug_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_2.2.1.bb
index c9e3b0de40..d73235d253 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_2.2.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
 PYPI_PACKAGE = "Werkzeug"
 
-SRC_URI[sha256sum] = "fe8bcdcef40275ed915fc734c2527a39d705b57a716d4f09e790296abbd16a7f"
+SRC_URI[sha256sum] = "4d7013ef96fd197d1cdeb03e066c6c5a491ccb44758a5b2b91137319383e5a5a"
 
 inherit pypi setuptools3
 
-- 
2.25.1


