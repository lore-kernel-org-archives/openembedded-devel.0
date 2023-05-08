Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F5FCC7EE2C
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:18:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.103805.1683541112849143439
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=f/YCLIzT;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541111; i=@fujitsu.com;
	bh=9OSijJpJe0EvSDyGMg1R9GLrfhY5bP+JuGmKnzYUbRg=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=f/YCLIzTBpHL3y3xXxs9JXvMytPxEwXI2UBdkmDQLniD7DGBtiiEbHPnvOHVk9uiU
	 XULm3uUcFUB5w3F97vwv0upKDWWgjg1knGws1frofAT9Ihd7+P+E3Ssu7xXuNR9kMR
	 B5Mm6oeuASt43HDh6bZvxjt+WDb9wZLnQlVwnEeB3KgbjQV+yK+jQg9VRuX7TSbWI+
	 EUYYk5beE8j4zGqSUiiLQMQHtHuy3J3kLTpOXigzOd+fSjPvRBeSzUVACjK6znggxf
	 VIdDK33tBr8lL2JrwNgmaFv8d1msh9mQvnPFwN4W/P/3+EuCB+ad/Rj/KZBdl9Ovi8
	 IWtMEu0QnyZew==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBLMWRWlGSWpSXmKPExsViZ8ORpFt2JiL
  F4Nl2UYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePsuuuMBbN4KiY2X2JsYGzi7mLk5BAS2Mgo
  cfiqWRcjF5A9jUliyeTdbCAJNgEJiel7T7KD2CICuhIfP8xlBLGZBVQkZkw+wgRiCwv4S5yaN
  xmshkVAVWLbs82sXYwcHLwCThLbv8uChCUEFCSmPHzPDGGrSVw9t4l5AiPXAkaGVYxmxalFZa
  lFumZ6SUWZ6RkluYmZOXqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBHk4
  pTrbbwfhl51+9Q4ySHExKorymB8NShPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwtm2LSBESLEpN
  T61Iy8wBBhtMWoKDR0mEV/YIUJq3uCAxtzgzHSJ1ilFRSpz33ymghABIIqM0D64NFuCXGGWlh
  HkZGRgYhHgKUotyM0tQ5V8xinMwKgnzXgaZwpOZVwI3/RXQYiagxf6Xw0EWlyQipKQamBTvrP
  R7erXe4QnvtnWnZp/xDQw4dUPzT7LQ5lbX9NzlSWuOftM2YmVNlu+ZZa6UvvjmrktvZvu+eBJ
  xvG7q3WsP1k86s/hlStyi/bEPDpRtNN5x3eD13GwJWf0p4YKmOTtYM5mv3hQ9ZRvqaHdv94Fe
  96n7ZhvoTViXKzlz8oqps18w5OTd7bQ7fGqjSZ/xukk/F8sfOsOUxHP8O8Pn69d3r7rYJJv6t
  X8vz/1fpxani4ds3agn6/Ni9jUp39blae9WJcT0zNa5Z53hcuHEnr3fWSxa4+a8OcTlUeyoza
  HiUpzxsfHqFN/bOy54xuT//3fLKKNqRmqNtPvjW3xO7y/pcDwQKLF/skHvWcQCmYZOJZbijER
  DLeai4kQAeTcxN+sCAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-24.tower-728.messagelabs.com!1683541109!496468!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15384 invoked from network); 8 May 2023 10:18:30 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-24.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:18:30 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id C85011D6;
	Mon,  8 May 2023 11:18:29 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id EF4261D2;
	Mon,  8 May 2023 11:18:28 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-argcomplete: upgrade 3.0.5 -> 3.0.8
Date: Mon,  8 May 2023 18:18:17 +0800
Message-Id: <1683541101-25407-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102406

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-  Test suite shell wrapper: Accept OSError on exit
-  Test suite: Use general regex to cut zsh reset ANSI sequences (#425)
-  Allow importlib-metadata 6.x; skip test failures on Python 3.7 (#420,
   #424)
-  Note completers can return iterables of strings, not just lists
   (#422)
-  Documentation and test improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-argcomplete_3.0.5.bb => python3-argcomplete_3.0.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_3.0.5.bb => python3-argcomplete_3.0.8.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.0.5.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.0.8.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-argcomplete_3.0.5.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.0.8.bb
index 1e884f486a..19b5131389 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.0.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "fe3ce77125f434a0dd1bffe5f4643e64126d5731ce8d173d36f62fa43d6eb6f7"
+SRC_URI[sha256sum] = "b9ca96448e14fa459d7450a4ab5a22bbf9cee4ba7adddf03e65c398b5daeea28"
 
 PYPI_PACKAGE = "argcomplete"
 
-- 
2.34.1


