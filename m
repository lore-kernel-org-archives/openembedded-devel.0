Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F143C433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 08:13:17 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.4605.1648714396230540460
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 01:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hzw2yPMP;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648714394; i=@fujitsu.com;
	bh=hU395VkltBmxCaw+Y+qBQWrJm2g2b8LtyJExkZmDqZo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hzw2yPMPCV/p1e9zL2WASCM8EPoatsgPPU7LpC+v/0lBaoRYje5Yv8UxuUj3CevKU
	 YNtbA3gAkXXbb4ftw2NmwdcCYOe6kBmhF0+6U61C8PhjUhZvFt97Tx9Q8SI0KTAYj1
	 Rf1EL7SYjzxa/0yb6DlzariJSjeBOZvj5gt5vnHQYKo8gdWJomL6okO2TBBF0wLP1M
	 BhIdYfXnO11YCpdpFa6afsJLidrrffZGGWxH3e6wmEuvA0CGSAM9KtgJsZDG2a3BGD
	 JSqWENITNDsDU7z5M+iO+aMFgEupftI0ZTPhq2Zmgx0busJ89+hwrFu7E6jshu2P6M
	 H3SdHYlysQXOQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSXdmkmu
  Swa9uTYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaN/yVOmgp08FUfOtbI3MK7j7mLk4hASeMIo
  setQOxuEc4FJYtPFj+wQzklGiZM/JzB3MXJysAmoSzy++ZoRxBYR0JdYOnsPWJxZQFWi++Iad
  hBbWCBUoufOFqA4BwcLUHzNGm6QMK+Au0TjqnWsILaEgILElIfvwUo4BTwktrQ4g4SFgEqm/d
  nGDFEuKHFy5hMWiOkSEgdfvGCGaFWSOLHiIxOEXSHx+vAlqLiaxNVzm5gnMArOQtI+C0n7Aka
  mVYxWSUWZ6RkluYmZObqGBga6hoamuqa6RkameolVuol6qaW65anFJbqGeonlxXqpxcV6xZW5
  yTkpenmpJZsYgSGcUsz6cAfj4r6feocYJTmYlER5nQJck4T4kvJTKjMSizPii0pzUosPMcpwc
  ChJ8GbEAeUEi1LTUyvSMnOA8QSTluDgURLhnRcDlOYtLkjMLc5Mh0idYlSUEuednACUEABJZJ
  TmwbXBYvgSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeIyBTeDLzSuCmvwJazAS0uO6xI8j
  ikkSElFQDk2XGo2Dv/XIFEx5ePGD/zsPw+MrE7XL7u/z4tp1seF12UsPF5dTjU+/0Pn3redxu
  Xrhfirm0yZtB4PO1hcUezKErcnL+RAVOfLA6qdmv/nyMH2dsyBmGwh/X5RjYeswKLEX/n3/FW
  X2zeErtuieM/RqTzAI685OXqjR2HJxVI6Jpd3GB2u5dvoUs06/WGBSfVZ8dtY3zaByPfu4jW5
  13uhNu5jPKr7wt5WRsHrzWeZ9LC9+Wa4sPMv5evSZU5urKjZ/tq2OSNoRE8+/UvqP9YdktmVM
  TJIvn/X1gYzat6eP/cPFIBv1NM3xKRGdbfGS2P7l6i1fB77duvMeiV67deazkha+30XbjlNNf
  7gm/UGIpzkg01GIuKk4EAIXvaJNcAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-587.messagelabs.com!1648714393!126056!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31404 invoked from network); 31 Mar 2022 08:13:13 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 31 Mar 2022 08:13:13 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 3DA9D100451
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 09:13:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 3148A100354
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 09:13:13 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 31 Mar 2022 09:12:58 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 2/5] [oe] [meta-python] [PATCH] python3-evdev: upgrade 1.4.0
 -> 1.5.0
Date: Thu, 31 Mar 2022 16:13:25 +0800
Message-ID: <1648714408-12048-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648714408-12048-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1648714408-12048-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 08:13:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96287

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
===============================================================================
-Fix documentation.
-Re-enable TTY echo at evtest exit.
-Fix ImportError: sys.meta_path is None, Python is likely shutting down.
-Closing the input device file descriptor in InputDevice.close() now happens in
the main thread, instead of in a new thread.
-Fix util.find_ecodes_by_regex not working across all supported Python versions.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-evdev_1.4.0.bb => python3-evdev_1.5.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-evdev_1.4.0.bb => python3-evdev_1.5.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.4.0.bb b/meta-python/recipes-devtools/python/python3-evdev_1.5.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-evdev_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-evdev_1.5.0.bb
index 97a8aedd79..e17920ba1d 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-evdev_1.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gvalkov/python-evdev"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2"
 
-SRC_URI[sha256sum] = "8782740eb1a86b187334c07feb5127d3faa0b236e113206dfe3ae8f77fb1aaf1"
+SRC_URI[sha256sum] = "5b33b174f7c84576e7dd6071e438bf5ad227da95efd4356a39fe4c8355412fe6"
 
 inherit pypi setuptools3
 
-- 
2.25.1


