Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD2B8C48BD2
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:59 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.26334.1649658015857687963
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 23:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=g+CsZDCW;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649658014; i=@fujitsu.com;
	bh=PhPUqdFbMpzP0XLwIAEXKpEPBT7RVBaTgikgTAelip8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=g+CsZDCWKv4jYbUBuxqyHRSNHU5B9GmHFCSo93nmLqezARxkZ1FInzJ+c2igLq8c3
	 XdHn7ciRGQ+o8C6s57LvlevG4Tsw2oS3FmQcIBKCW61nff4+522LtPaK/DE8iDGWid
	 ZMgxPfXh7bzQDv/KYbQ/6AJJMbAJLc0JnkKglD4Wl0RvgXLUU/5TJhwf/luNqecgLP
	 2c5f74Lh/C1RpSsWefP++ShMtArTh8dN29GURdmw16bOJF3+3MJ8qr9kiJVN98foiL
	 i2ncfItpn2fqoW/tG0IcIoLEjKeaxwHEYtNE7lxNs2u95YeyNygP6JnWgfBn4NRLac
	 8erTAqIx8B1aw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8MxSXfuieA
  kg7crNC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oz9Mx6xFVzgqTj2cyFjA+Ny7i5GLg4hgSeM
  ErMvvGbuYuQEci4wSTQuVoCw9zBKdEwQALHZBNQkpt+6wQpiiwjoSyydvQesnllAReLF7x52E
  FtYwFli2tM/jCA2C1D88MxWNhCbV8BJ4nj7azBbQkBBYsrD92C9nED1yxfMYofY5STx/sVZVo
  h6QYmTM5+wQMyXkDj44gUzRK+ixOzLzSwQdoXErFltTBC2msTVc5uYJzAKzkLSPgtJ+wJGplW
  MVklFmekZJbmJmTm6hgYGuoaGprrGlroWRnqJVbqJeqmluuWpxSW6QG55sV5qcbFecWVuck6K
  Xl5qySZGYAinFKsH7WD8tuKn3iFGSQ4mJVHe4E3BSUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQke
  GuOAeUEi1LTUyvSMnOA8QSTluDgURLhVT8IlOYtLkjMLc5Mh0idYtTl2HT4yl5mIZa8/LxUKX
  Fe1eNARQIgRRmleXAjYLF9iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw73SQKTyZeSVwm14
  BHcEEdETotkCQI0oSEVJSDUxrF1b0SVr4bdN/XCGf/tNPXUoye+VFpfOVMSeet7GnMSmfYA7f
  uWPev8vF0473nG9o6lat4yywMo5YafugSCiBx/drNquN1ZfeewyTfG0/v4ovceQQ6+m8qTwnb
  PXWnXNi+19+fBKu9m7bw8yvAis7Nz0P3lJevbra8sVD54p5E65JWa3/kzxDWvdYafVCsylHN0
  Qvua8f2OP9oKbfREX2iON6jW0vDs+L2Nt+Y/qhGRGf3+8+Gr98b0ugwEaZ30c9mv4tFvZ7N3t
  LSPuO8PeXl/xsWvNuet0nTcEjhnLdEzfMN9jqtfCn4PbNAilnZtduO/G2qWde9ZfTlw7+4qvh
  k+bsyz/4W8PgkcNdJTZJJZbijERDLeai4kQADZurr2gDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-565.messagelabs.com!1649658013!236599!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9873 invoked from network); 11 Apr 2022 06:20:13 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-19.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Apr 2022 06:20:13 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 40A66100478
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 07:20:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 341E8100450
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 07:20:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 11 Apr 2022 07:19:56 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] byacc: upgrade 20211224 -> 20220128
Date: Fri, 8 Apr 2022 21:16:31 +0800
Message-ID: <1649423791-29819-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649423791-29819-1-git-send-email-wangmy@fujitsu.com>
References: <1649423791-29819-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96544

All changes from 20211224 to 20220128 included in
https://invisible-island.net/byacc/CHANGES.html

License-Update:
----------------
- Add Format, Upstream-Name, Upstream-Contact to byacc.
- Add "Copyright:  2001-2021,2022 by Thomas E. Dickey" to all files of
  byacc.
- Copyright of aclocal.m4 and package/debian/* updated to 2022.
- Modify Licence to License.
- Add "Copyright: 1992-2021 Free Software Foundation, Inc." and "License: GPL-3"
  to config.guess config.sub

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../byacc/{byacc_20211224.bb => byacc_20220128.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/byacc/{byacc_20211224.bb => byacc_20220128.bb} (65%)

diff --git a/meta-oe/recipes-extended/byacc/byacc_20211224.bb b/meta-oe/recipes-extended/byacc/byacc_20220128.bb
similarity index 65%
rename from meta-oe/recipes-extended/byacc/byacc_20211224.bb
rename to meta-oe/recipes-extended/byacc/byacc_20220128.bb
index 85e5072716..8aa8767d37 100644
--- a/meta-oe/recipes-extended/byacc/byacc_20211224.bb
+++ b/meta-oe/recipes-extended/byacc/byacc_20220128.bb
@@ -4,7 +4,7 @@
 # Setting to PD as this is what the upstream has it as.
 
 LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=e13dd32663e3159031608d536530a080"
+LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=62c37a10a2faf90235ee64280ad72737"
 require byacc.inc
 
-SRC_URI[sha256sum] = "7bc42867a095df2189618b64497016298818e88e513fca792cb5adc9a68ebfb8"
+SRC_URI[sha256sum] = "42c1805cc529314e6a76326fe1b33e80c70862a44b01474da362e2f7db2d749c"
-- 
2.25.1


