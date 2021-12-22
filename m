Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DABC4C433F5
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 07:02:44 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.16464.1640156563982795038
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 23:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=j2SgvxB1;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640156561; i=@fujitsu.com;
	bh=mijZDqGKnO1w3nTH/BiLfILy60L9usW8p4K+Y3CsjK4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=j2SgvxB1IvJO8ZagfYnNKc8/VoyIHWWT0Da0NGj5ueoUUELMPLS8p4jG1hhB4YRTj
	 7is3bSLzlOcBS1He7EzF8kEKy5AXCuAv7vI9RWq3WVU45VFzMLs6KkQtYNHsbaTNBP
	 8N6eVpYpwm4Jky4RIesCq72ra+PI/54h1JfOr9d5ORcDkWHUrkUDjotgg7cjRAifT/
	 CO3ooXNywU6c2Hj3OssmSL1WNozhiuXCWjAfPijWkNQfzPkCF+4FGELaOkLXbtLQxc
	 AiKr9gZA3NbMCGZifPRoe7k5zR3dciXOhieEuZ6LgKfdi/Cit2gsD8Oh35aUd1BZzE
	 x5IjBG5k26wIw==
Received: from [100.115.6.23] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id D2/3B-30341-19DC2C16;
 Wed, 22 Dec 2021 07:02:41 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqDvh7KF
  Eg4YJVhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bxM49ZC35wVfTce8zWwNjI1cXIxSEk8IRR
  YtGMfiYI5wKTROeB3ewQzklGiTVzzjF2MXJysAmoSzy++RrMFhHQl1g6ew8ziM0soCrRfXENO
  4gtLOAtcfpFMwuIzQIUf7tlOyuIzSvgLrHkfgMTiC0hoCAx5eF7sF5OAQ+JaVeXgMWFgGq6ly
  5mgqgXlDg58wkLxHwJiYMvXjBD9CpJnFjxEWpOhcTrw5eg4moSV89tYp7AKDgLSfssJO0LGJl
  WMVolFWWmZ5TkJmbm6BoaGOgaGprqmugaGVvqJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym
  56To5aWWbGIEhnFKMcv7HYxNfT/1DjFKcjApifJyvT6YKMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ
  0mCt+bkoUQhwaLU9NSKtMwcYEzBpCU4eJREeLNOA6V5iwsSc4sz0yFSpxgVpcR5558BSgiAJD
  JK8+DaYHF8iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwbxbIFJ7MvBK46a+AFjMBLVYK3w+
  yuCQRISXVwBT++Gace9vfby8PnNTsVn2jZT/18k/9ksdarbXGLddMFVU168/GN9ut+DrzBVN1
  ncB2z3oOC6tTPc3fp3yqy2WTuOhVPNVjio9kTHzsprX8eedDFglfP9y/ycO767tBicAWBRVHg
  V8L+rUvfwnYE5A0UfYxb5Wp7xNtf++VD5qEvFWEb68XuXRKc+LavxJXkjtilrw7825llgbLzu
  BtF29clDpxNzCn9Vur598Tuo7XXoq6R1ddy41LN59tPlnx6Zea78Hql3MfXFhiLN/KW2rnZp/
  W7cn/0OK9cXrAwWfy+XUZ+tmNZvsEdu6/kKh27IbMAzGN+Ns9VbHdzU8LjX415XGbCeufZN4q
  zRmvxFKckWioxVxUnAgAVHUst14DAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-585.messagelabs.com!1640156560!74189!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24750 invoked from network); 22 Dec 2021 07:02:40 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Dec 2021 07:02:40 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 748D7100194
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Dec 2021 07:02:40 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 67C6D10018F
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Dec 2021 07:02:40 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 22 Dec 2021 07:02:24 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-msgpack: upgrade 1.0.2 -> 1.0.3
Date: Wed, 22 Dec 2021 15:01:19 +0800
Message-ID: <1640156479-18846-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640156479-18846-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1640156479-18846-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Dec 2021 07:02:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94480

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
====================================================================
Release Date: 2021-11-24 JST

Fix Docstring (#459)
Fix error formatting (#463)
Improve error message about strict_map_key (#485)

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-msgpack_1.0.2.bb => python3-msgpack_1.0.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-msgpack_1.0.2.bb => python3-msgpack_1.0.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-msgpack_1.0.2.bb b/meta-python/recipes-devtools/python/python3-msgpack_1.0.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-msgpack_1.0.2.bb
rename to meta-python/recipes-devtools/python/python3-msgpack_1.0.3.bb
index 19c9caa406..92999255b6 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-msgpack_1.0.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
 PYPI_PACKAGE = "msgpack"
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "fae04496f5bc150eefad4e9571d1a76c55d021325dcd484ce45065ebbdd00984"
+SRC_URI[sha256sum] = "51fdc7fb93615286428ee7758cecc2f374d5ff363bdd884c7ea622a7a327a81e"
 
 RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-io \
-- 
2.25.1


