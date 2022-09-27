Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F5AC54EE9
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 09:09:02 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.8813.1664269734059736617
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 02:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UEk6LuJP;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664269732; i=@fujitsu.com;
	bh=7acVxYVmsnxP7t5m/OXv06q9IrQhJRo1BiBM5wutJPs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=UEk6LuJPtRtHtjf7Ko6KzIBXWvqlU9t24XmofVym8wurL38Xqf9AS7p/KZGe04gtZ
	 ZJxM0uQCAJVitn+RXp6WWWevMaCJXVyY13yyeld89PUjsbOijWyIctcrvJQH8Wfd+f
	 VgGtIRae9kGwFOkZa/wSkhIW1eEr1cG5HcKWQfM6SlAxQgy+og8y/QOPGD1mh3xfaW
	 UABbF7vK+56+8okO5GX5XPzB9KA0CwqG+9DyaDE0gtP6ynPWHLzAfXyo0sekZoHDVG
	 2K/74zgGOvFPXtno9q23fBWh4qk0//uCRdsJU4nrRoxaXFAFYdFoZoiJys1ciTCboF
	 sRL9jAX3ddAQQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRWlGSWpSXmKPExsViZ8OxWXfxXqN
  kg761uhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bkfQeZC7byVJyb5t7AuIC7i5GLQ0jgIaPE
  rE3nmCGcK0wSOy/dY4Fw9jBKTDzykrWLkZODTUBNYvqtG2C2iIC+xNLZe5hBbGYBFYkXv3vYQ
  WxhgUCJj9OvsYDYLAKqEk0XroPV8wo4SrzbuQEsLiGgIDHl4XuwXk4BJ4nm5SuZQGwhoJr1j+
  cyQtQLSpyc+YQFYr6ExMEXL5ghehUlZl9uhppTIdE4/RAThK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaNtUlFmekZJbmJmjq6hgYGuoaEpkDbWNTQx10us0k3USy3VzcsvKsnQNdRLLC/WSy0u1iuu
  zE3OSdHLSy3ZxAgM5ZTi9Mk7GC/t+6V3iFGSg0lJlNd+kVGyEF9SfkplRmJxRnxRaU5q8SFGG
  Q4OJQleyd1AOcGi1PTUirTMHGBcwaQlOHiURHjXLQFK8xYXJOYWZ6ZDpE4xWnJMnf1vPzPHcj
  A582vbAWYhlrz8vFQpcV7TLUANAiANGaV5cONgsX+JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAe
  jkjCv6R6gKTyZeSVwW18BHcQEdJAdnz7IQSWJCCmpBqalXxL0JW7tV89d7XV0l2H6nu97e+WF
  Yz2f39A9kimdHt0toWJVrSJ88Uj+SlH2bm52yUnMH7x7Uq0rqxdVWVgU+U7Y+kT1numD3H21e
  TFFb71sb/H947jSt+8cV2iF26+Zet5NFep7/xe4Tub6z3X95ZapkbY7vrXMOr6u98KBOTYXjR
  XXnKlyXsoyr3zfP49QmfULU3Od7ifbOXxK5xTrLWArO8JafHSl9rLwd7k+HfZPxD9Xz41Tn6o
  1QyhQ/OrfrPePD/GprHo7a5Z797k0b5PbX/aXXfm9f5nGia15XLMKYvtEZ884xCnfmJOSG9Yd
  vNVO6ynbj0lhPz9u37HL/X3iBIv7a1Q+q54J0VZiKc5INNRiLipOBADILEnMeAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-745.messagelabs.com!1664269731!382069!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32669 invoked from network); 27 Sep 2022 09:08:51 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-21.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 09:08:51 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 2F39A155
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:08:51 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 22C6B142
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:08:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 10:08:49 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.11.0 ->
 2.11.1
Date: Tue, 27 Sep 2022 17:08:05 +0800
Message-ID: <1664269685-2594-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1664269685-2594-1-git-send-email-wangmy@fujitsu.com>
References: <1664269685-2594-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 09:09:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98978

Changelog:
==========
Bug Fixes
-----------
 Fix socket leak in impersonated_credentials (#1123) (b1eb467), closes #1122
 Make pluggable auth tests work in all environments (#1114) (bb5c979)
 Skip oauth2client adapter tests if oauth2client is not installed (#1132) (d15092f)
 Update token refresh threshold from 20 seconds to 5 minutes (#1146) (261a561)

Documentation
-------------
 samples: Add auth samples and tests (#1102) (ac87520)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.11.0.bb => python3-google-auth_2.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.11.0.bb => python3-google-auth_2.11.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.11.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.11.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.11.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.11.1.bb
index d1698f5931..747a57e814 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.11.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ed65ecf9f681832298e29328e1ef0a3676e3732b2e56f41532d45f70a22de0fb"
+SRC_URI[sha256sum] = "516e6623038b81430dd062a1a25ecd24f173d7c15cdf4e48a9e78bc87e97aeec"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


