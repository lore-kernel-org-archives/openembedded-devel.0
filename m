Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD6CEC76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 09:00:43 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.65408.1680512435287722336
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 02:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TKUjZjO5;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680512433; i=@fujitsu.com;
	bh=lMBEkAcLCOt8L45qMWJhWFoeGncson1cMFuXsHr9RpU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=TKUjZjO5zl0RlMf4byjQZRXmOp5xgo7+izLDUw6zCkNlWDWy8dsfUfHNjlz92sqGC
	 2PsgYi7Fsy+5CoXJ4PvpIQYeyLouzC3Zfgj4NNR60452H5w2pVOtJ1EJg+QN3kM5Tx
	 IP8F5upEJZsUx0G7FK6n7Ny4f8wznBf0JeWWnQVJA6Q9wOBdB2eTbBCm5eCzvKZMs6
	 tCqyfulmonYTwSGB8pJAkD8EMDSbLBepj5SMcflfQsjlgKU65eAc/julnqhmzC/4Np
	 P18RIcmyA5Lnx/Wh687gIW6cNtYvhXc5zpZlWX/MWTTDIkYKXQkNo7tqA/pi9R0Xr2
	 DprIeJMewJQMQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqLtxqla
  KwYJLghYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a8C2dYC1pFK6ZOa2FuYGwR6mLk4hASeMIo
  sfXQYVYI5zqTxL1dn1kgnN2MEiem7GDuYuTkYBOQkrhx/z8biC0ioC+xdPYesDizgIrEi9897
  CC2sICbxNwpx1lBbBageM/FR2D1vAJOEk9OzWUEsSUEFCSmPHwP1MvBwSngLDF/iy5IWAio5M
  eue0wQ5YISJ2c+YYEYLyFx8MULZohWRYnZl5tZIOwKicbph5ggbDWJq+c2MU9gFJyFpH0WkvY
  FjEyrGM2KU4vKUot0Dc31kooy0zNKchMzc/QSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yorc5Nz
  UvTyUks2MQKDN6VY+cgOxh19f/UOMUpyMCmJ8grWa6UI8SXlp1RmJBZnxBeV5qQWH2KU4eBQk
  uA9OAEoJ1iUmp5akZaZA4wkmLQEB4+SCG9wL1Cat7ggMbc4Mx0idYpRUUqc128KUEIAJJFRmg
  fXBoveS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeV9NBJrCk5lXAjf9FdBiJqDFrVEaIIt
  LEhFSUg1MFc6/nCY81TdW2ihgfXHD9y/rIg/w6eVLBM+SNWuYPGnjhDVZBt3RYRNvTOlMemYV
  457FtGH9jP+OopMnf+jNPp3jG+zcEiKzWmZ5bcmX4wU7Dj2ce8nhyK3QCVc59zgtW3lEb9f0w
  G/Gj9+K/vhb+eOi8cNdB+NnCby0tb86+ZKM7zKdY4mtG/ptL7fqBOy9cD0owWNNwaPpr4sWtf
  Moqf5kaOK38D0iOFnl8veS/dK3TGYaa5/pjHFfXcV34sGeVfZhQQll2/o2B7xbmvXOfI9NcN0
  SiVWCrYstljk+OqLQW9AW8sKGNTDd64Aoi8FnH4X6U0wKv7iU+fN3Lwv8dtVWyatlhUJ/v6TA
  Rs1HSizFGYmGWsxFxYkA8Zt9w1kDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-548.messagelabs.com!1680512433!189569!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9740 invoked from network); 3 Apr 2023 09:00:33 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-21.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 09:00:33 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id EB9151001B6
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 10:00:32 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DF3481001B5
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 10:00:32 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 10:00:31 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH] nginx: upgrade 1.23.3 -> 1.23.4
Date: Mon, 3 Apr 2023 17:00:08 +0800
Message-ID: <1680512408-30384-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680512408-30384-1-git-send-email-wangmy@fujitsu.com>
References: <1680512408-30384-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 09:00:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101901

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
*) Change: now TLSv1.3 protocol is enabled by default.
*) Change: now nginx issues a warning if protocol parameters of a
   listening socket are redefined.
*) Change: now nginx closes connections with lingering if pipelining was
   used by the client.
*) Feature: byte ranges support in the ngx_http_gzip_static_module.
*) Bugfix: port ranges in the "listen" directive did not work; the bug
   had appeared in 1.23.3.
*) Bugfix: incorrect location might be chosen to process a request if a
   prefix location longer than 255 characters was used in the
   configuration.
*) Bugfix: non-ASCII characters in file names on Windows were not
   supported by the ngx_http_autoindex_module, the ngx_http_dav_module,
   and the "include" directive.
*) Change: the logging level of the "data length too long", "length too
   short", "bad legacy version", "no shared signature algorithms", "bad
   digest length", "missing sigalgs extension", "encrypted length too
   long", "bad length", "bad key update", "mixed handshake and non
   handshake data", "ccs received early", "data between ccs and
   finished", "packet length too long", "too many warn alerts", "record
   too small", and "got a fin before a ccs" SSL errors has been lowered
   from "crit" to "info".
*) Bugfix: a socket leak might occur when using HTTP/2 and the
   "error_page" directive to redirect errors with code 400.
*) Bugfix: messages about logging to syslog errors did not contain
   information that the errors happened while logging to syslog.
*) Workaround: "gzip filter failed to use preallocated memory" alerts
   appeared in logs when using zlib-ng.
*) Bugfix: in the mail proxy server.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-httpd/nginx/{nginx_1.23.3.bb => nginx_1.23.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.23.3.bb => nginx_1.23.4.bb} (51%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.23.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.23.4.bb
similarity index 51%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.23.3.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.23.4.bb
index a8ffd9b93..422b6f390 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.23.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.23.4.bb
@@ -2,5 +2,5 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=175abb631c799f54573dc481454c8632"
 
-SRC_URI[sha256sum] = "75cb5787dbb9fae18b14810f91cc4343f64ce4c24e27302136fb52498042ba54"
+SRC_URI[sha256sum] = "d43300e36bb249a7e6edc60bca1b0fc372a0bafce2f346d76acfb677a8790fc0"
 
-- 
2.34.1


