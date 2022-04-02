Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C3BFC54F3D
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:49 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.2797.1649137340887626628
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 22:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=W5Czf8f6;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649137339; i=@fujitsu.com;
	bh=P9Q30Y4XYDt5bIS+RA9+eo1wHohZXnmPo3oiPH3vvys=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=W5Czf8f6/mk7tQaQc1se2o40tSaCykCe/FsZcglGrN5GJB9nKCvkVQiQ30JT52RCW
	 iRQIh3VTWUNFJZgZudJh1mr8Y+UQqBmq7I0Sv/r+h1e+ONRVJ6sp0+YNT70xBvZYSC
	 UTM2LpPLhOZ4uJtZ2ngWRTjmPmm5UoebkhL1STpiR6HSy6edHLsyg6uVAScC/wHUsW
	 Pet52XbcJKbaDHWULwx2JpP3t78VD0uCf7fuyP7DKifqtTeC1uNHwgExfoWzYd93YF
	 k8H3IkNs+uZ5sljChMtcVKT5g8ivTqT/QOMXxob5dyxbJOYq4rMrKMBoQhvBDwGc8P
	 VsukxMavsZMTA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8ORqLvrmne
  SwbvDGhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bXhIWMBec5KuYsusnSwPiHvYuRi0NI4Amj
  xNUtz1kgnAtMEpv234ZydjNKzOiYA+RwcrAJqElMv3WDFcQWEdCXWDp7DzOIzSygIvHidw87i
  C0s4CNx+sBeMJsFKP7gVi+YzSvgJNH57BBYr4SAgsSUh+/BejkFnCVeH3wGFhcCqnn8o4MNol
  5Q4uTMJywQ8yUkDr54wQzRqygx+3IzC4RdITFrVhsThK0mcfXcJuYJjIKzkLTPQtK+gJFpFaN
  1UlFmekZJbmJmjq6hgYGuoaGprrGFrpGhkV5ilW6iXmqpbnlqcYkukFterJdaXKxXXJmbnJOi
  l5dasokRGMgpxWpXdjDuWfVT7xCjJAeTkijvGVfvJCG+pPyUyozE4oz4otKc1OJDjDIcHEoSv
  CfPAuUEi1LTUyvSMnOAUQWTluDgURLhPXIRKM1bXJCYW5yZDpE6xagoJc578wpQQgAkkVGaB9
  cGi+RLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5ra4CTeHJzCuBm/4KaDET0OJ3ZzxBFpc
  kIqSkGpi44naIOAcKXVHyzuFST32k4X2pZKNJ52RWx+1FYq0zNqprO57jF2E9vNuplOPs9Rtr
  ZjdN9U1YvLObefP06/HLjujsYeJdfnzXT3+OI25P2P4tFQg9pb6J9fcluZaHP1tXz+kV4O9wD
  DjAvzvzuIKtMd/3294rK1JjLuv+/xm4RZ/zqW3+cV7H3hIxNZ2Hmm5L+217ObROcCe8Ypx3f8
  mTW3NmPFF69Doq+09qqq0q3yHGz89XOYu+UQmoaL99+eQ6yT8Xp5dK7py118K0uM2nNe2B8bE
  V94V+zlN+UhftpsC5IWzXWoEPLFW9Rl+Kl3gZHHjhF6+0Y8O6mKgt1y4qq38J3nd15rMHsdce
  dZxVYinOSDTUYi4qTgQAeH5ZgV8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-565.messagelabs.com!1649137338!93235!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12931 invoked from network); 5 Apr 2022 05:42:18 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Apr 2022 05:42:18 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 278C31001B4
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:42:18 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E09BA10019B
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:42:17 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Apr 2022 06:42:12 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-werkzeug: upgrade 2.0.3 -> 2.1.1
Date: Sat, 2 Apr 2022 20:38:34 +0800
Message-ID: <1648903115-19946-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648903115-19946-1-git-send-email-wangmy@fujitsu.com>
References: <1648903115-19946-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96415

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-werkzeug_2.0.3.bb => python3-werkzeug_2.1.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_2.0.3.bb => python3-werkzeug_2.1.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_2.0.3.bb b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-werkzeug_2.0.3.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
index ed7a509ad3..476a3a5964 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_2.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
 PYPI_PACKAGE = "Werkzeug"
 
-SRC_URI[sha256sum] = "b863f8ff057c522164b6067c9e28b041161b4be5ba4d0daceeaa50a163822d3c"
+SRC_URI[sha256sum] = "f8e89a20aeabbe8a893c24a461d3ee5dad2123b05cc6abd73ceed01d39c3ae74"
 
 inherit pypi setuptools3
 
-- 
2.25.1


