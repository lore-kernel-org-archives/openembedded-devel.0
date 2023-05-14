Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD13C7EE24
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 13:06:45 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.66575.1684069597031781431
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 06:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AiHfHt97;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1684069595; i=@fujitsu.com;
	bh=gRZeyXc1Ny39di7Es2yMICvF64XedgEI7em7LuQwPdc=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=AiHfHt970sTOLRWt+XBHbrGW8N350vbqrN6HQ4d4k62nJwHLiDdQ2mDBMWuQwP1kS
	 QWcPYdpGVYNAtJI+ibnw+Y5lqanZVq+IIpVfPLahoFwkyXoXPswpvXndgCymjOwPtb
	 GFTBy6ak6PMRvvkVDuzMVbYtIPjVKPa1TWHvfpXOuADbPpqfacybHqu5kaLfb92npx
	 QiYe8c0SAdz3RhlC8dKBo1ob2bRjtsOFKrZUHcydGtdYH5nYM1P/hw+uLkMZbT2u5L
	 h2IaRmitKhGjL6DcT9E5KugSF7MJKFQpDS5ZLtMQ+TDTYiDaWHyVoLmUe1fwA4MajS
	 LvjgGdnN3qMAg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJLMWRWlGSWpSXmKPExsViZ8ORpHvzTkK
  KwbRma4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeN+4zumgo2cFf/+HGBqYLzG0cXIxSEksJFR
  YsqVhywQzjQmiQtdfcxdjJwcbAISEtP3nmQHsUUEdCU+fpjLCGIzC6hIzJh8hAnEFhbwk9i8/
  xJYPYuAqsSpH1vA6nkFnCQ6N28Gq5EQUJCY8vA9M4StJnH13CbmCYxcCxgZVjGaFqcWlaUW6V
  rqJRVlpmeU5CZm5uglVukm6qWW6panFpfoGuollhfrpRYX6xVX5ibnpOjlpZZsYgT6OKWYTWA
  H49xdf/UOMUpyMCmJ8l4riUsR4kvKT6nMSCzOiC8qzUktPsQow8GhJMGrczMhRUiwKDU9tSIt
  MwcYbjBpCQ4eJRHeuKtAad7igsTc4sx0iNQpRkUpcd4DIH0CIImM0jy4NliIX2KUlRLmZWRgY
  BDiKUgtys0sQZV/xSjOwagkzMtzA2gKT2ZeCdz0V0CLmYAW39oTD7K4JBEhJdXAZDit5bCDuc
  28p32zjWz/+FziVjksIRR3ReTpMm+nFVccMp6UaZYyJHrnSH3hSZuqfbH3xdvwzR9t9pfcrjD
  iMlrBsYN748zifZ++9xnfC29Ne85gIWNVfXDLZFGhhq13vnwVOnxR5B+D4vLWH7Gf0wonx59Y
  PG+vDN+34Bc7rPhlF6/3V5V0/7X/ivjEnwvM9Z99Nv+sW9kgonv5aJnzxuyvrbdulC++dWZlg
  67lpJPz9Cdf0LB5KVyXyH+boUR85vdbYQKrk5be3XIqZFOf92nm1maTWcnl7tNW3CjnijhyY/
  8km22/bn/WZ24JvsChc+XYjNlsH+R3Oi7f//nU2qL73fz7D1r6t0n+9zueLKTEUpyRaKjFXFS
  cCABVmXKr7AIAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-587.messagelabs.com!1684069593!554215!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5702 invoked from network); 14 May 2023 13:06:33 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2023 13:06:33 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 957DB1AE;
	Sun, 14 May 2023 14:06:33 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id BBEA81AC;
	Sun, 14 May 2023 14:06:32 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pulsectl: upgrade 23.5.0 -> 23.5.1
Date: Sun, 14 May 2023 21:06:19 +0800
Message-Id: <1684069583-12337-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 13:06:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102576

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pulsectl_23.5.0.bb => python3-pulsectl_23.5.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pulsectl_23.5.0.bb => python3-pulsectl_23.5.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_23.5.0.bb b/meta-python/recipes-devtools/python/python3-pulsectl_23.5.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pulsectl_23.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pulsectl_23.5.1.bb
index 465038e220..ca4cdce221 100644
--- a/meta-python/recipes-devtools/python/python3-pulsectl_23.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pulsectl_23.5.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/mk-fg/python-pulse-control"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f1d10048469ff90123263eb5e214061d"
 
-SRC_URI[sha256sum] = "8b8a487f1a63b4108e0fc84eab9177c96fb14aafa1a550f52a40c5f7fce99672"
+SRC_URI[sha256sum] = "8efc260ed7212ee4f9e50a8b856c84911265f4eac42cc6c02c7b37c851a2834b"
 
 RDEPENDS:${PN} += " \
 	libpulse \
-- 
2.34.1


