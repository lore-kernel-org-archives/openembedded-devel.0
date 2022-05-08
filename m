Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B0EC433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 12:12:26 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.4058.1652875945150137603
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 05:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IJcO3t0h;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652875943; i=@fujitsu.com;
	bh=O7lidbMK4IUfybvTS051SzhAsZCxoTFjSBElK4X9WXw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=IJcO3t0h6RQikWCUm9V/iHLUi4uOSNOxzSO16n8lrkxlVAbaOw7nXQh9Io9DXtPpf
	 JIgqH/NMyI/CvrRbb4ILi6V3SAZSStAVhibeD/M22RiE+YnNZ4S6MCMcjsx3/hGYYB
	 wosN6BQxzLngRf3UtZF0a0zw+X99xWF3cyH5S5njD0dBiIMk59F4oM+m1xDNUfBtGA
	 WSeocr7GKtkXU94h5rpJ3X9VxtJKqDCA/FoGClfOa0E5DNvHtNV2NOy1KSJzHRlXQy
	 xdJ6QJkj6Jp7qjnO5TeNcz+lk10qNqvICu+dzZqYH2zD0El1NcAdN1MHvxxy+xS5mW
	 1ci08FCvbIH2w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8MxSXfZo5Y
  kg1OPNSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oz2pzeZC3q4K2ZNOc/cwDiLq4uRi0NI4Amj
  xMKfLcwQzgUmiXm7+qCcPYwSr7ufATmcHGwCahLTb91gBbFFBPQlls7eAxZnFlCRePG7hx3EF
  hbwlZj47AVYnAUovrP/ElicV8BJ4tzVw4wgtoSAgsSUh++ZIeKCEidnPmGBmCMhcfAFRK+EgK
  LE7MvNLBB2hcSMGdvYIGw1iavnNjFPYOSfhaR9FpL2BYxMqxjtkooy0zNKchMzc3QNDQx0DQ1
  Ndc1MdI1MTPUSq3QT9VJLdZNT80qKEoHSeonlxXqpxcV6xZW5yTkpenmpJZsYgeGZUuzwdQfj
  8b6feocYJTmYlER5b55rSRLiS8pPqcxILM6ILyrNSS0+xCjDwaEkwZv8ECgnWJSanlqRlpkDj
  BWYtAQHj5II781rQGne4oLE3OLMdIjUKUZdjrsL9+5lFmLJy89LlRLnTb4OVCQAUpRRmgc3Ah
  a3lxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ834CuYQnM68EbtMroCOYgI4Q0W8EOaIkESE
  l1cC0ZXXMxtCctf0/mV9OuH5Npo8n9rz3b92CNTHW4rdP3WJMbJwb8Xwb790PraqlE1PStxya
  HRQos2/v6fPlxyJ8tSe+iz0SVBx2YbF5qMLVufb1e9/8aNkYfZfT41ze83eLT3HW6n+5YPb8s
  NO2W2+WZrq5NM1cW8KY/ebeYjWddYyT/hlcEe6MsFnTYnqr39ut5fO2X3GeRhqlP3QfZTYEXN
  CPfs7r3bU0/FCnpaSXk2jOrFnxoRMEfwsevZ1f9YxTzuYn7/ZLi1Zv3ZP6rvCY2znN5OkyDYy
  L3Fe2RvdO1lH6V/r5wOKQwgSdhG13rII+K+XGzT6eclXm736jiEI1nd7uLQ+ZV3k13DZd8TBB
  iaU4I9FQi7moOBEAAkSXzVYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-545.messagelabs.com!1652875942!56344!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14120 invoked from network); 18 May 2022 12:12:22 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 May 2022 12:12:22 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 1DFD410032A
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 13:12:22 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id DE7D0100331
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 13:12:21 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 18 May 2022 13:12:00 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-traitlets: upgrade 5.1.1 -> 5.2.0
Date: Sun, 8 May 2022 19:54:16 +0800
Message-ID: <1652010856-26250-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 May 2022 12:12:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97159

License-Update: remove extra spaces.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-traitlets_5.1.1.bb => python3-traitlets_5.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.1.1.bb => python3-traitlets_5.2.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.1.1.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.2.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.1.1.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.2.0.bb
index 8f80426e6..56ebaac67 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.2.0.bb
@@ -2,11 +2,11 @@ SUMMARY = "Traitlets Python config system"
 HOMEPAGE = "http://ipython.org"
 AUTHOR = "IPython Development Team <ipython-dev@scipy.org>"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46"
+LIC_FILES_CHKSUM = "file://COPYING.md;md5=9c125dfc5ff5364d40b5f56f02cd9de3"
 
 PYPI_PACKAGE = "traitlets"
 
-SRC_URI[sha256sum] = "059f456c5a7c1c82b98c2e8c799f39c9b8128f6d0d46941ee118daace9eb70c7"
+SRC_URI[sha256sum] = "60474f39bf1d39a11e0233090b99af3acee93bbc2281777e61dd8c87da8a0014"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-ipython-genutils \
-- 
2.25.1


