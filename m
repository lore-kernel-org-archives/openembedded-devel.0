Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C737C7618E
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:30:39 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web11.42908.1682307035035684879
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vha57W0r;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682307033; i=@fujitsu.com;
	bh=SgoNZK5z2NeDoTSb6T/nZGP+FoyqHqHJiayENyaNhX0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vha57W0rjlDbyvZF8w4546WBrVJxuxn//MSmypcj8/0QNyAz+2azTxxaaVTHfKVlA
	 WJ0RNIT1wlnqhqO/ucFRPucfPYqCMhjEfJsn40OPTkMthqRJEb6AcnR3KwlCgfvYkj
	 TcZFOSMLifyGBTXQuR/FIJLCSpp9vKt24hfRykWBc/5H2v5mjXs28KEJVbs8CE0hoo
	 wc41Hkgm9kmMTSqDkrqV6EwCU1Zx82Q4lIK4z3hofndKnCyCupSulTFuCHzHFSs0KM
	 Yt+RrbFNZdMe9rqSZKyQ6/BMjzHtj9CiKZd481yNNjSqRkcFV1uoUlB6SvLhs2Gyan
	 XFjANVg/0BkuQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSffGd9c
  Ug7UnlC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oz3HzYwFpzkrDg64x1zA+MXji5GLg4hgSeM
  Eo0np7BBODeYJE4tmM8E4exllOic0QOU4eRgE5CSuHH/P5gtIqAvsXT2HmYQm1lAReLF7x52E
  FtYIExi//oFYDUsAqoSt09NA6vhFXCS2HH1BiuILSGgIDHl4XuwOKeAs8Sx/YdZQGwhoJr2Lx
  9ZIOoFJU7OfMICMV9C4uCLF8wQvYoSsy83s0DYlRKtH35B2WoSV89tYp7AKDgLSfssJO0LGJl
  WMZoVpxaVpRbpGhroJRVlpmeU5CZm5uglVukm6qWW6panFpfoGuollhfrpRYX6xVX5ibnpOjl
  pZZsYgSGb0oxU8oOxlW7/uodYpTkYFIS5V2ywSVFiC8pP6UyI7E4I76oNCe1+BCjDAeHkgRv0
  SfXFCHBotT01Iq0zBxgLMGkJTh4lER4l30BSvMWFyTmFmemQ6ROMSpKifP6fwNKCIAkMkrz4N
  pg8XuJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCv5AegKTyZeSVw018BLWYCWryL2wVkcUk
  iQkqqgUnYyPKuyfayCxfLBVqW9Mntm7x48bON+jP7vgs3H53lkNqT8eBFdJNH9aoNjasvXtmv
  OyNcN3qxjcfeJGUrAY+44ncRyYcS7WftKP4YcevTQeM198PVH20qCeHaz3oin2+5l0xJSXAOi
  9RTtXz59a+vc395e5yfIeLKQn+b49ozmh/MNVadMLVzQ0Zy92NZjaV2zm+sdVI8VXpipH/PjL
  xtKqnc8H/yCa75AT3KlWwNs29MSLad0282bUva7KCQP8cvP7e+8O1Qg1DmDOlnpoYfz/UfX3R
  8fpu/tVS5hIzviuqM3XlJP3+xJRyccKig0//0vLynH1YpXlAzP6wzb5X3oVVVaxnMcgyyxdXt
  XyuxFGckGmoxFxUnAgCb5us8WgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-585.messagelabs.com!1682307032!121957!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29620 invoked from network); 24 Apr 2023 03:30:32 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:30:32 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 33890100329
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:30:32 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 27B7E1000E7
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:30:32 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:30:30 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-python-vlc: upgrade 3.0.18121 -> 3.0.18122
Date: Mon, 24 Apr 2023 11:30:09 +0800
Message-ID: <1682307012-11984-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1682307012-11984-1-git-send-email-wangmy@fujitsu.com>
References: <1682307012-11984-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102170

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-python-vlc_3.0.18121.bb => python3-python-vlc_3.0.18122.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-python-vlc_3.0.18121.bb => python3-python-vlc_3.0.18122.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.18121.bb b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.18122.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-python-vlc_3.0.18121.bb
rename to meta-python/recipes-devtools/python/python3-python-vlc_3.0.18122.bb
index 518dbb205..9dd9b1480 100644
--- a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.18121.bb
+++ b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.18122.bb
@@ -3,6 +3,6 @@ HOMEPAGE = "wiki.videolan.org/PythonBinding"
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "24550314a3e6ed55fd347b009491c98b865f9dfa05a92e889d7b0a2210e7485b"
+SRC_URI[sha256sum] = "1039bde287853b4b7b61ba22d83761832434f78506da762dfb060291bf32897d"
 
 inherit pypi setuptools3
-- 
2.34.1


