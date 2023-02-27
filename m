Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3990AC64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:04:21 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.85487.1677485052855792338
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:04:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rkw2fZik;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485050; i=@fujitsu.com;
	bh=yPn69xt1X2l9b7d/1464aK1Aa9+vs98fyHF6vGwaNAk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=rkw2fZiku2ox2hbyT6qD9skwNRqlEbgUTG/zLfzoQgmsv54iOyvyVCmAoWordmvsv
	 v8YDQhl7yOoi2l0/tLdRtXaizB62YVsu1AYUBn2a8gi1r82muy9i+jsdDeCT6YNZDD
	 r06SizC2qYkgvgtTzhHYqs2V6MsgPtE2dy+fBLO8oT6CI5F5zY2D2c3y6Ggl7p73+d
	 0BONpiTa1kyhxQprDsyysW28ZwrlU6lfDXTvZgR7rx1Gr2XeHFPxlqCkBzh84VUj71
	 l5FLWiUN7eXVcgxqAo69YOhhUjcYTxTZHyD2YLq4gWsrPxyrKxk2fSMFQCyp5f8tWF
	 RGKvS2s+ywOTg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSfdX8p9
  kg71z5CwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owzneeZC64JVWx6d4exgXGPQBcjF4eQwBNG
  ieWbX7JBODeYJJrn72ftYuQEcvYyStw54w9iswlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgLXH7w14wm0VAVeL4lvdgc3gFnCSOzmtmBLElBBQkpjx8D9bLKeAscfHSHHaIXU4Sz1
  9eYYOoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdKtH74BWWrSVw9t4l5AqPgLCTts5C0L2B
  kWsVoXpxaVJZapGtorpdUlJmeUZKbmJmjl1ilm6iXWqqbl19UkqFrqJdYXqyXWlysV1yZm5yT
  opeXWrKJERi+KcVJd3Yw7uz7q3eIUZKDSUmUd5HTn2QhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKE
  rwHk4BygkWp6akVaZk5wFiCSUtw8CiJ8DIbAaV5iwsSc4sz0yFSpxgVpcR5+RKBEgIgiYzSPL
  g2WPxeYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMG5UANIUnM68EbvoroMVMQIu3P/wBsrg
  kESEl1cAUt/HVZj/zbRl5RvkajW1eM4Sk3qXvuvaVMdDvpXnPvym56hXsuxfXb63VV1wyNdxf
  feb8m4/NKk9NrRB7PklVN/+MxdU9gUpe+8+fmLU2L7f/85Vzu9+feyK7puYiX7bquunrvzWec
  9D7fWbCzGWq1Yy3F0R/WFC7XXrBrINnTq5rfHZke7jfVTvTtL/13f01+84JHU14mP9K0mnrgv
  +bUxc6VtbPlOe3FmKUKLauMnkqKal+2OBbVgTPxXXmojvj1E5+STVnDHwo+b3W8kmIa+3K12a
  3O2VOtIZnTT1g3hBmrtLy+sDdxHUbqqZfZa0zU8i/o7bhntuO0to5rYVTV5YHvmRpYTLXfO51
  tEdfiaU4I9FQi7moOBEApSFLCloDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-728.messagelabs.com!1677485050!192760!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25552 invoked from network); 27 Feb 2023 08:04:10 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-19.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:04:10 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D85F51000DC
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:04:09 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id CC7741000D7
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:04:09 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:04:08 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-alembic: upgrade 1.9.2 -> 1.9.4
Date: Mon, 27 Feb 2023 16:03:39 +0800
Message-ID: <1677485021-11417-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677485021-11417-1-git-send-email-wangmy@fujitsu.com>
References: <1677485021-11417-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101265

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 [bug] [mssql] Ongoing fixes for SQL Server server default comparisons under autogenerate,
 adjusting for SQL Server's collapsing of whitespace between SQL function
 arguments when reporting on a function-based server default, as well as its
 arbitrary addition of parenthesis within arguments; the approach has now
 been made more aggressive by stripping the two default strings to compare
 of all whitespace, parenthesis, and quoting characters.

 References: #1177

 [bug] [postgresql] Fixed PostgreSQL server default comparison to handle SQL expressions
 sent as text() constructs, such as text("substring('name', 1, 3)"),
 which previously would raise errors when attempting to run a server-based
 comparison.

 [bug] [autogenerate] Removed a mis-use of the
 EnvironmentContext.configure.render_item callable where the
 "server_default" renderer would be erroneously used within the server
 default comparison process, which is working against SQL expressions, not
 Python code.

 References: #1180

 [bug] [commands] Fixed regression introduced in 1.7.0 where the "config" object passed to
 the template context when running the merge() command
 programmatically failed to be correctly populated. Pull request courtesy
 Brendan Gann.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.9.2.bb => python3-alembic_1.9.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.9.2.bb => python3-alembic_1.9.4.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.9.2.bb b/meta-python/recipes-devtools/python/python3-alembic_1.9.4.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-alembic_1.9.2.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.9.4.bb
index 0d83f86c4..7f9ac2ec9 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.9.4.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e3023b042cb6002cb398344b51c67093"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "6880dec4f28dd7bd999d2ed13fbe7c9d4337700a44d11a524c0ce0c59aaf0dbd"
+SRC_URI[sha256sum] = "4d3bd32ecdbb7bbfb48a9fe9e6d6fd6a831a1b59d03e26e292210237373e7db5"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.34.1


