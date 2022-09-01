Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6373ECAAD1
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 10:18:12 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.10330.1662027491307364472
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Sep 2022 03:18:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uPJ/78P4;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662027489; i=@fujitsu.com;
	bh=KuZqcOal2LwRo+5fWIDQz4OIhj0xypMwx6wpbw68UUY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=uPJ/78P4LXWuwptMbWlwh9WLMVDTl9+EwkbCMkgVQFmsy/yGpGa6VDC4Ne/PWSTov
	 ZQ7/vL2kg883y8VfwehoyRRSf0jA0xLXeyUTjp1zxl5xt2GmxicKde4j4TWclGB7pA
	 5+AHy0ySMOGsU1dHrqvW0WUPw/EimXsCmO2ayXOzUx/UBqhbVMw5Ppo3OABwin+QfN
	 XHwtgnKrNVnekKVt4hucAlccKrKUisgcH1pMLm+4tT5F2UYfaTg24iMDC7DREgZtt9
	 Thm6VEp1LdKwdTcgs3AkTg2UUeOupnPuTVKRXUmzJq5WuAv7Z/FtV8e/7AQhpR7t0l
	 Oft9Nn/vfi25g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8OxWfdhm0C
  yweNuRouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPCv/PMBS85Km50BTQwTuXoYuTkEBJ4yChx
  4IF9FyMXkH2FSeJh1xNmCOcAo0TP/rNMIFVsAroSL34sZgGxRQT0JZbO3sMMYgsLeEpcvnENr
  IZFQEVie+szNhCbV8BD4smrWWC2hICCxJSH75kh4oISJ2c+AZvDLCAhcfDFC6A4B1CNosTs6f
  IQ5ZUSrR9+sUDYahJXz21insDINwtJ9ywk3QsYmVYxWiYVZaZnlOQmZuboGhoY6Boamuoa6pp
  a6iVW6SbqpZbqlqcWl+ga6iWWF+ulFhfrFVfmJuek6OWllmxiBIZdSjGj9Q7Gjr6feocYJTmY
  lER5+3UEkoX4kvJTKjMSizPii0pzUosPMcpwcChJ8Oo1AeUEi1LTUyvSMnOAMQCTluDgURLh3
  dsClOYtLkjMLc5Mh0idYtTlmPm17QCzEEtefl6qlDjvWpAiAZCijNI8uBGweLzEKCslzMvIwM
  AgxFOQWpSbWYIq/4pRnINRSZi3AmQKT2ZeCdymV0BHMAEdMX0mP8gRJYkIKakGJpvUF6Yn2dP
  /Pvtbc/b4H40bv5wVMx5NvuMW2NyYf/QX+92DWx7yv5dM6NjmGMqpHDfNbUHU5AWRPfJ6R9a4
  2Fdqztyo7+RSHFstcjx+kcf6b4G8zueLE398lZR56+iWM9Xj1u2pV0p/lkf65mZJCrHPfKv/8
  cbbw7YuapyVfxa/VxNS/3xyuSpv38Gbb7mnix1XnrL7Z9ayBimhr1m3tKyOXVhlaXssyUI2fF
  78Y6sX+W/5p9z0r76xpFPu5F2nDwW+HrYG6j7HdxefvOjhwHX+fpfflWVscx7Izzohy7Ex+fz
  HKednxfvW3f6TPbPpO5tOxK4YzV0hV18mfg/4bcXH8WP70l0C0m4H4pK5nZVYijMSDbWYi4oT
  AcczV3RCAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-587.messagelabs.com!1662027488!504492!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8509 invoked from network); 1 Sep 2022 10:18:09 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-9.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Sep 2022 10:18:09 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 9F5A5142
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  1 Sep 2022 11:18:08 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 86B777C
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  1 Sep 2022 11:18:08 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 1 Sep 2022 11:18:07 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-gnupg: upgrade 0.4.9 -> 0.5.0
Date: Thu, 1 Sep 2022 18:18:01 +0800
Message-ID: <1662027481-13243-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Sep 2022 10:18:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98584

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-gnupg_0.4.9.bb => python3-gnupg_0.5.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gnupg_0.4.9.bb => python3-gnupg_0.5.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-gnupg_0.4.9.bb b/meta-python/recipes-devtools/python/python3-gnupg_0.5.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-gnupg_0.4.9.bb
rename to meta-python/recipes-devtools/python/python3-gnupg_0.5.0.bb
index 9e13e4c26f..b97c4f3f5d 100644
--- a/meta-python/recipes-devtools/python/python3-gnupg_0.4.9.bb
+++ b/meta-python/recipes-devtools/python/python3-gnupg_0.5.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dabe659eadd6d97325b1582e41cfc11"
 
 PYPI_PACKAGE = "python-gnupg"
-SRC_URI[sha256sum] = "aaa748795572591aaf127b4ac8985684f3673ff82b39f370c836b006e68fc537"
+SRC_URI[sha256sum] = "70758e387fc0e0c4badbcb394f61acbe68b34970a8fed7e0f7c89469fe17912a"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


