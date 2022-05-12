Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9EAC433EF
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 09:21:22 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.2117.1652347273262309171
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 02:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bRhjnscU;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652347271; i=@fujitsu.com;
	bh=fbiW5OvxIQbNaa492mi1oaSESw8oK3ByYFC6NGVPLOI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bRhjnscU9OdfvaafKbXmyfsXpqnb4pSOu8wd0oa01cyuCp/DV6h6mwatlInXRyUZO
	 VoCvplkR3xAkqYAc8nZyDyWpD0D0T5RhChBw5iES2FsOnOdh8YdPRSsf/qK9VLE2nm
	 5/5iuPRimK2ocC8zIC+TnUbsqNJyCTxmWouDMQo8LmTXFpuHgVo300j7BFLZg4Igo0
	 f259YBpLacKtDwVMv2fJZnNOhy4LOT0HrRYq5ePz24vWRQmSaa4KdMGwAifsbQC9sE
	 OKE6hAxn+ZQBJ1dCRiyBjU0c4Ok9jnu0TdnPBYE04dIzP/PQTxXrtFbwRJP7DowAmY
	 mDy7eb1ixXXQg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8ORqNt+sSb
  J4FA3t8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrHi6DGWgiNcFZsWvGNtYDzB2cXIxSEk8IRR
  Ysbc30wQzgUmiZ9vrrF0MXICOScZJX51O4PYbALqEo9vvmYEsUUE9CWWzt7DDGIzC6hKdF9cw
  w5iCwt4Smxe9AKol4ODBSj+ZIU8SJhXwE1ixZozbCC2hICCxJSH75kh4oISJ2c+YYEYIyFx8M
  ULZogaJYkTKz4yQdgVEq8PX4KKq0lcPbeJeQIj/ywk7bOQtC9gZFrFaJdUlJmeUZKbmJmja2h
  goGtoaKprZqpraGGkl1ilm6iXWqqbnJpXUpQIlNZLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMzZRi
  x207GE/1/dQ7xCjJwaQkynvufE2SEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQneneeAcoJFqempF
  WmZOcA4gUlLcPAoifAWg6R5iwsSc4sz0yFSpxgVpcR5P+wDSgiAJDJK8+DaYLF5iVFWSpiXkY
  GBQYinILUoN7MEVf4VozgHo5Iw72mQy3gy80rgpr8CWswEtHi/ayXI4pJEhJRUA5PSj69H5t7
  e/96h6e6utXte+C+dHTJFrvD98t+lz1dL6vYvv2lq9XI/b+mN9rRv1xt0LzBlZxUee3J9xe72
  ir5puf9r5ieZqd+rc2X/Hhn5PDn88Gy+rN1Xjwh6moQoPauU/qRSkLzayH/9PNF1P6XT2XYzT
  nw8/33vs/md4umv7PfbyvdcmCPbkbZMO/fRBIt3K34Y/vxvYPl/6/YtOlJGnG4Nf51V8hgs8/
  +zrFrlHbfUa+ohX/u7WfP0uX9sZFm3a89xtq2tDB2Lb/eW/7l74EWn6vkItsDbdWpxh6tYxW2
  XPW6y++4tmbiac3rgmSkbz20wTejyeMNWdNmiMsjy3Zr5/HGSL657mfZOkD2vxFKckWioxVxU
  nAgAaPQW+kgDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-545.messagelabs.com!1652347270!749295!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19693 invoked from network); 12 May 2022 09:21:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 May 2022 09:21:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 9FD331001A6
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 10:21:10 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9120C100191
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 10:21:10 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 12 May 2022 10:20:48 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-click: upgrade 8.1.2 -> 8.1.3
Date: Thu, 12 May 2022 17:20:31 +0800
Message-ID: <1652347241-2533-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 09:21:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97074

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Released 2022-04-28
    Use verbose form of typing.Callable for @command and @group.
    Show error when attempting to create an option with multiple=True, is_flag=True. Use count instead.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-click_8.1.2.bb => python3-click_8.1.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-click_8.1.2.bb => python3-click_8.1.3.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-click_8.1.2.bb b/meta-python/recipes-devtools/python/python3-click_8.1.3.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-click_8.1.2.bb
rename to meta-python/recipes-devtools/python/python3-click_8.1.3.bb
index a623fe104..006742f15 100644
--- a/meta-python/recipes-devtools/python/python3-click_8.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-click_8.1.3.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "479707fe14d9ec9a0757618b7a100a0ae4c4e236fac5b7f80ca68028141a1a72"
+SRC_URI[sha256sum] = "7682dc8afb30297001674575ea00d1814d808d6a36af415a82bd481d37ba7b8e"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


