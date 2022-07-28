Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C4BBC19F28
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 02:16:54 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.27973.1658974604972877084
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 19:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VYq4KU06;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658974603; i=@fujitsu.com;
	bh=MWm6C4GdEw0bhZJKDi+wIkXUCmiPiHhjp5f58nTwmRc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=VYq4KU06hJbhRG3uK1XCFHC6p90LURq1pQU37yPMrtANQC1eXBbuNqHogwixI6+HP
	 N6Ho3Gc1i9nydwyHTDbzIytfWHa9tshCu0Nf7gXENZdMKicl5E/P9xTS5uEFEwmhyd
	 pETmwLAkjChohkSj4lvYEAmFqf2B7jsLNfufTw4r2rvNMsJw2S8AFZZBp81ZEwWEgN
	 f30nDwSqa99cOJXKli2CajuEDEE4xX4OF4SjS1+8V0b6NMTlbbCB8K2daCmN3Pz9+u
	 3OeIFD3KUYt/ZBlSn1yK01n85Qno7JnFu3Reh+2lEhYi6oI99HlZVCvovJNB/A4/Qx
	 8fG6oXUbTi0Wg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8ORpNv18WG
  Swft2JouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPihGlsBTOFKjY9OM3YwPiRv4uRi0NI4CGj
  xNZ3G5i7GDmBnCtMEkcem0PYexgldu7hArHZBNQkpt+6wQpiiwjoSyydvQesnllAReLF7x52E
  FtYIERi+utfbCA2i4CqxOH9HYwgNq+Ak8SPpY/A4hICChJTHr4H6+UUcJY4P/M+E8QuJ4l1Sw
  +yQNQLSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyRmzNgGNVNN4uq5TcwTGAVnIWmfhaR9ASP
  TKkbLpKLM9IyS3MTMHF1DAwNdQ0NTXWNdCzO9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzk
  nBS9vNSSTYzAAE4pZg7bwfin96feIUZJDiYlUd6ZCx8mCfEl5adUZiQWZ8QXleakFh9ilOHgU
  JLg3fQKKCdYlJqeWpGWmQOMJpi0BAePkgjvg7dAad7igsTc4sx0iNQpRl2OmV/bDjALseTl56
  VKifNWfAAqEgApyijNgxsBi+xLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5BUGm8GTmlcB
  tegV0BBPQEVsUHoAcUZKIkJJqYDKruqHd7a17/21D1Ku3q0T2P9ueWns0zNSsiOutU9ncoobp
  U+Rl3Dke1hv81+H1mOS+ot1/wp2EjU3rjrziP7lzhkTI270PV7qodSaVW9tU2TxtFxH/6HHjw
  2vteVxxvy4Z5fsbxAeVl7iad2tciVXieHVQY66C2OrJbyMbGjpY7GWbA/sUeZkjU0LZvzi2BP
  FOvlN9Z6Hf7eoHJW89drmeizx++uOJPR83eH6uNFl/4/62yb2KHTLx+1hfZ0m22QUUeMQ7uHS
  f8jonH3nA9/XzX3w/D7dFc2hN+vnX4JHeocV72Ny3xy/2/aoV+OudPJ+ie9UqxnOeJ8KePkxg
  DIzuONLxc+rj1dvznxWuVWIpzkg01GIuKk4EAPIcAA9nAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-585.messagelabs.com!1658974601!972527!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13632 invoked from network); 28 Jul 2022 02:16:42 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-15.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Jul 2022 02:16:42 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id A4BF71AC
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jul 2022 03:16:41 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 99C351AB
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jul 2022 03:16:41 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Jul 2022 03:16:40 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [oe] [meta-python] [PATCH] python3-werkzeug: upgrade 2.1.2 ->
 2.2.0
Date: Thu, 28 Jul 2022 10:16:28 +0800
Message-ID: <1658974589-10681-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658974589-10681-1-git-send-email-wangmy@fujitsu.com>
References: <1658974589-10681-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Jul 2022 02:16:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98027

Add dependence python3-markupsafe

Changelog:
==========
-  Deprecated get_script_name, get_query_string, peek_path_info, pop_path_info,
   and extract_path_info. #2461
-  Remove previously deprecated code. #2461
-  Add MarkupSafe as a dependency and use it to escape values when rendering
   HTML. #2419
-  Added the werkzeug.debug.preserve_context mechanism for restoring
   context-local data for a request when running code in the debug console.
-  Fix compatibility with Python 3.11 by ensuring that end_lineno and
   end_col_offset are present on AST nodes. #2425
-  Add a new faster matching router based on a state machine. #2433
-  Names within options headers are always converted to lowercase. This matches
   RFC 6266 that the case is not relevant. #2442
-  AnyConverter validates the value passed for it when building URLs. #2388
-  The debugger shows enhanced error locations in tracebacks in Python 3.11. #2407
-  Added Sans-IO is_resource_modified and parse_cookie functions based on WSGI versions.
-  Added Sans-IO get_content_length function. #2415

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-werkzeug_2.1.2.bb => python3-werkzeug_2.2.0.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_2.1.2.bb => python3-werkzeug_2.2.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.2.bb b/meta-python/recipes-devtools/python/python3-werkzeug_2.2.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-werkzeug_2.1.2.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_2.2.0.bb
index 74796d8962..c9e3b0de40 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_2.2.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
 PYPI_PACKAGE = "Werkzeug"
 
-SRC_URI[sha256sum] = "1ce08e8093ed67d638d63879fd1ba3735817f7a80de3674d293f5984f25fb6e6"
+SRC_URI[sha256sum] = "fe8bcdcef40275ed915fc734c2527a39d705b57a716d4f09e790296abbd16a7f"
 
 inherit pypi setuptools3
 
@@ -36,4 +36,5 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-unixadmin \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-profile \
+    ${PYTHON_PN}-markupsafe \
 "
-- 
2.25.1


