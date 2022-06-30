Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D8AC43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 02:16:58 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.19916.1656555414785704315
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jun 2022 19:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uM46sqFB;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656555413; i=@fujitsu.com;
	bh=74P4bwAMigYAEmt6AJsdDHhil4N/R0q2FtVvFCmVxHs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=uM46sqFBCPpn0cxCFOv3BPygehG9SNtzUHAVOnka+vXGIhtIhqEEph1SvEpGZ+2QV
	 h+NagUpJdbKllnW5HD1vESewfDNpZYvmTBne+LCQPvYHhasj3Cf/ZfxNmHAPmh5aeb
	 ACeJMJ6EJOB6d6LIzcquyuqqyWxchMImELkY89FXXdf8IW/I12XIuUHCQNiKzmytcf
	 3uA23rFcwZBXQ31yY+/PjBzBgaYeatgHc5mCTdhXDQT1SNJw1xbkkAwFnqZHUP1hyk
	 QwvXdAhlc77txjGA6i4Y+kH/FScvPQ5BUP8PcKnyFq2WEL0ZySxKxnZTDWEU3n2W+q
	 7hdK1mAnlclqA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8ORpDuFfW+
  SweRF0hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bPBRuYCg5xVhzcvIetgfEJRxcjB4eQwENG
  if8OXYxcQOYVJokzZ5czdTFyAjkHGCXWTrEHsdkEdCVe/FjMAmKLCOhLLJ29hxnEFhbwl+j88
  R0sziKgKvH9bzMjyExeAXeJvv+BIGEJAQWJKQ/fg5XzCghKnJz5BKycWUBC4uCLF8wg5RICih
  Kzp8tDlFdIvD58iRnCVpO4em4T8wRGvllIumch6V7AyLSK0TKpKDM9oyQ3MTNH19DAQNfQ0FT
  XWNfCTC+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzDkUoqZw3Yw/un9qXeI
  UZKDSUmU9+m0PUlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHjXM+xNEhIsSk1PrUjLzAGGP0xag
  oNHSYT3xnegVt7igsTc4sx0iNQpRl2OmV/bDjALseTl56VKifOuZAGaIQBSlFGaBzcCFouXGG
  WlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzMrABTeHJzCuB2/QK6AgmoCN2TgM7oiQRISXVwGT
  J8qvw7k6vK3cPHU9m1fp1nuveovkNzH2PfJdzfLjyXJl71qQgo+qyKi/XvJvF7P0T7j1xmX/p
  rFC/jKb32RvN2o1ne1oUWQ5vfr0pfLKq2r6nXhu6Xt449Pv5lkMXeT/e9d1o4jHlgLjG6Z5/H
  M8sb9iWlBv480jcF7n1epnRewW3P4pX/xa1MDy8fsHj/vG39zuagguP7ag6ncod0nhXsrAnK2
  WR3rNlc0TXlactqVsr8FedLbvHq1cvOltc9O8t98kz14jJvmXULn/+5REH65W59zs3HIuNOGB
  w9V82R3qw2/fyD3Pu2u1fy5L/hOnJRJ8fjMzTrLYb1c1e97qo8v9HHnu1jL29yXPy7dYpsRRn
  JBpqMRcVJwIA5qgWcUADAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-591.messagelabs.com!1656555412!79387!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13525 invoked from network); 30 Jun 2022 02:16:52 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-18.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Jun 2022 02:16:52 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 0B9101B1
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 03:16:52 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 000E31AB
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 03:16:51 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 30 Jun 2022 03:16:50 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.7.0 ->
 2.8.0
Date: Thu, 30 Jun 2022 10:16:44 +0800
Message-ID: <1656555404-9840-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jun 2022 02:16:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97630

Changelog:
==========
add experimental GDCH support (#1044) (94fb5e2)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ython3-google-auth_2.7.0.bb => python3-google-auth_2.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.7.0.bb => python3-google-auth_2.8.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.7.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.8.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.7.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.8.0.bb
index 195b668d9..46371d76b 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.8.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8a954960f852d5f19e6af14dd8e75c20159609e85d8db37e4013cc8c3824a7e1"
+SRC_URI[sha256sum] = "819b70140d05501739e1387291d39f0de3b4dff3b00ae4aff8e7a05369957f89"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


