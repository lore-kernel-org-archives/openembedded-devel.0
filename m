Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15417C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 06:49:46 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web08.4537.1645598983974506722
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 22:49:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sdo2lQSa;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645598982; i=@fujitsu.com;
	bh=iyLEHysS/YkdzVVyCj8hZSofLwGZlX+G4GF9w8970QE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=sdo2lQSan9pdUBTZ3h4D/HEp3J9Stg9wGUYV8rU8BPnAyd/a7ZptdK687ZueUT4lh
	 mCE2fGsG6YB9cGCc5/Qgb/o2SkpSwJKKQjE0PvXr9d6G/QoVJOVPS5tuKr2Q+NrjKj
	 N842KkaATtJxXJ0hBfUIqWbZYKA8q62aTnKTWXNfMEgTPIYw+01UdOPnaWcfZZRV/q
	 eLzoYA+WMULcsF2uK8IagrWGcPYdw4GqQg77jZ8FMegNS4IpRIGWkiyv+6rZ2ORtzM
	 BFLeBw8Y29l8rvDogZo4Pf3wGXs5EsFBnC882S6VSvlakDscM8xoJIUhe/OdcGtqHv
	 162TtvfYADlRA==
Received: from [100.115.7.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id BB/E9-12986-509D5126;
 Wed, 23 Feb 2022 06:49:41 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSZf1pmi
  SwdSdChYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aiuftYCi7xVUyetZu5gXEWbxcjF4eQwBNG
  iUOrjzJBOBeYJO6/Pc7WxcgJ5JxklJg3mwvEZhNQl3h88zUjiC0ioC+xdPYeZhCbWUBVovviG
  nYQW1ggVGLD05NgNSxA8ZkLroLZvALuEh39e8FqJAQUJKY8fA/WyyngIbHp2l6oXe4Sx+4sYY
  OoF5Q4OfMJC8R8CYmDL14wQ/QqSZxY8ZEJwq6QeH34ElRcTeLquU3MExgFZyFpn4WkfQEj0yp
  Gq6SizPSMktzEzBxdQwMDXUNDU10TIMtQL7FKN1EvtVS3PLW4RBfILS/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM4pRiltQdjH19P/UOMUpyMCmJ8hYeEU0S4kvKT6nMSCzOiC8qzUktPsQow8GhJMEbf
  g0oJ1iUmp5akZaZA4womLQEB4+SCG/adaA0b3FBYm5xZjpE6hSjopQ477KzQAkBkERGaR5cGy
  yKLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5s27ATSFJzOvBG76K6DFTECLp2QJgSwuSUR
  ISTUwTVBhOHpo08ut3OqnlvxNlfv22G5X9Q7uuTOX8djXiJ5epfBHkLfthW/g7BdGqwqPNCaY
  FFnaXRL2KWG/cF7usuvqM0+5HG/tO+i879HZmap8BTELhBJ8Gxnd1wa+fSzMWPGh715PmeRtt
  47cPc8q/ixZP6Pb+9iNWbs6ElIj1967GdQWzPXJ6u3pm1IGX6c/jTdcPkXu6cK23PxpqnFnrJ
  9cKv5xsuvW+3mX5Iw13qte0s9Qe1J2dFXr178szNI9zlldGjoaZqzvH4W4zBdZ8nm2DP+G2sY
  Z3yUDVlwVyNYok8/8/PuV1Ekx7RmLlVidQur2tpyU6thzw1MxOvsmG/N7s56EvOllPA2si0SZ
  lViKMxINtZiLihMBqgdnHl0DAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-587.messagelabs.com!1645598981!26623!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5123 invoked from network); 23 Feb 2022 06:49:41 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 06:49:41 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 18192100457
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 06:49:41 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 0B66F100359
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 06:49:41 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 06:49:21 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 2/2] [oe] [meta-python] [PATCH] python3-flask: upgrade 2.0.2
 -> 2.0.3
Date: Wed, 23 Feb 2022 14:49:56 +0800
Message-ID: <1645598996-15716-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645598996-15716-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1645598996-15716-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 06:49:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95467

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
===============================================================================
-The test client's as_tuple parameter is deprecated and will be removed in
Werkzeug 2.1. It is now also deprecated in Flask, to be removed in Flask 2.1,
while remaining compatible with both in 2.0.x. Use response.request.environ
instead.
-Fix type annotation for errorhandler decorator.
-Revert a change to the CLI that caused it to hide ImportError tracebacks when
importing the application.
-app.json_encoder and json_decoder are only passed to dumps and loads if they
have custom behavior. This improves performance, mainly on PyPy.
-Clearer error message when after_this_request is used outside a request
context.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-flask_2.0.2.bb => python3-flask_2.0.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask_2.0.2.bb => python3-flask_2.0.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-flask_2.0.2.bb b/meta-python/recipes-devtools/python/python3-flask_2.0.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-flask_2.0.2.bb
rename to meta-python/recipes-devtools/python/python3-flask_2.0.3.bb
index e3f1df3562..4070fc0128 100644
--- a/meta-python/recipes-devtools/python/python3-flask_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_2.0.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/mitsuhiko/flask/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "7b2fb8e934ddd50731893bdcdb00fc8c0315916f9fcd50d22c7cc1a95ab634e2"
+SRC_URI[sha256sum] = "e1120c228ca2f553b470df4a5fa927ab66258467526069981b3eb0a91902687d"
 
 PYPI_PACKAGE = "Flask"
 
-- 
2.25.1


