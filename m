Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9715C433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 00:29:48 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.5070.1642379388275787153
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jan 2022 16:29:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bEKjcsUI;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642379386; i=@fujitsu.com;
	bh=j3Db/fQMY2B32LQTDRo+XHYsyQKJRYotp8scbvgxdPk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=bEKjcsUIULdV73JNcQWp3ThX+OWKABIazb0EulCRkkmCzByWJ47+omQHXtq1CJzUb
	 j+vSb265Ov2SwBB0HEBWJZ12ri19nD+MgJviYtCwAHGNLSiYtv506HX3Ts3WVNL8jz
	 SZkYqm3B6Wwxj0+vdvHHn0Wq9snSrgYwRiifCANedckrhT6SQqdlx1Fe9xr0pd+eLx
	 eVq941Js+eWXtxK7x/D5GWJCS67QHpqKxFEArWpnMdJzK0xJsFUEjHXzTr7io8eA4y
	 HSG0z4qEgIvwG2tX1PJVS+zei9//L/nEBgaab+UvjewQKooGD23YsjekkUa3IdA69n
	 G8PCKObWj9Elg==
Received: from [100.115.65.13] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 42/1F-15539-978B4E16; Mon, 17 Jan 2022 00:29:45 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphleJIrShJLcpLzFFi42Kxs+GYpFu540m
  iwZ49qhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bD9tmMBfelKh6cncrewLhFrIuRi0NI4Amj
  xLFFF5khnAtMErfX9rNDOCcYJZqfnWbtYuTkYBNQk5h+6waYLSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBRYv2M7WBxFgFVifNzDoLV8wo4SVy8d5ERxJYQUJCY8vA9WA2ngLNE6+orQDYH0DIniS
  Pr6iHKBSVOznzCAjFeQuLgixfMEK2KErMvN7NA2BUSs2a1MUHYahJXz21insAoOAtJ+ywk7Qs
  YmVYx2iUVZaZnlOQmZuboGhoY6BoamuqaAykzM73EKt1EvdRS3eTUvJKiRKC0XmJ5sV5qcbFe
  cWVuck6KXl5qySZGYDCnFLst28G4r++n3iFGSQ4mJVHekC+PEoX4kvJTKjMSizPii0pzUosPM
  cpwcChJ8NZue5IoJFiUmp5akZaZA4wsmLQEB4+SCC/bdqA0b3FBYm5xZjpE6hRjOMebtUsWMX
  O8BZNt9+4CyXYwOXPBwdXMHLPA5P32Q0DyAYgUYsnLz0uVEuddBzJOAGRcRmke3DJY4rjEKCs
  lzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3AcgUnsy8EribXgGdywR07qqPj0DOLUlESEk1MHEE
  ff3d0HM/v16+t2DW2bq7jn2Wc0qEljJdVHz1P2OiUFNC9fS5Dl13X64S7BVbs27tl/TqqXLZw
  juzron2trtmhqz8bvXqZA3TuWc32L6LJFXd7Kv9dEJr76PI9wWqqX+CVrbH5tmpxxZZGR3N55
  uZskxu9rkf35tUtmW9svl6snkB223W/0ozfuxblHgw/RrfnnUymQlz1vEn6TLqX73+pGqH4cE
  pscbTWNouG63w2fI+ZZrrlbV7l+Yt2f6P++WvdWU/HvWYX51564nDlPk3yu80WV2Mn8jucDXm
  QBjbay2Bw5azFk/9K3Rm3X6V7wdmHW166xBq+HHzpw3LH4ZY1a/ev/tal1puUeyc7QVJSizFG
  YmGWsxFxYkANcm2k5cDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-532.messagelabs.com!1642379385!146558!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25544 invoked from network); 17 Jan 2022 00:29:45 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jan 2022 00:29:45 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 12EA41000FB
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 00:29:45 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 059711000D2
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 00:29:45 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 17 Jan 2022 00:29:23 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] uriparser: upgrade 0.9.5 -> 0.9.6
Date: Mon, 17 Jan 2022 08:28:57 +0800
Message-ID: <1642379337-12144-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642379337-12144-1-git-send-email-wangmy@fujitsu.com>
References: <1642379337-12144-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jan 2022 00:29:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94892

Changelog:
=========
  * Fixed: [CVE-2021-46141]
      Fix a bug affecting both uriNormalizeSyntax* and uriMakeOwner*
      functions where the text range in .hostText would not be duped using
      malloc but remain unchanged (and hence "not owned") for URIs with
      an IPv4 or IPv6 address hostname; depending on how an application
      uses uriparser, this could lead the application into a use-after-free
      situation.
      As the second half, fix uriFreeUriMembers* functions that would not
      free .hostText memory for URIs with an IPv4 or IPv6 address host;
      also, calling uriFreeUriMembers* multiple times on a URI of this
      very nature would result in trying to free pointers to stack
      (rather than heap) memory (GitHub #121, GitHub #124)
      Commit 987b046e41f407d17c622e580fc82a5e834b4329
      Commit b1a34743bc1472e055d886e29e9b53f670eb3282
  * Fixed: [CVE-2021-46142]
      Fix functions uriNormalizeSyntax* for out-of-memory situations
      (i.e. malloc returning NULL) for URIs containing empty segments
      (any of user info, host text, query, or fragment) where previously
      pointers to stack (rather than heap) memory were freed (GitHub #122,
      GitHub #124)
      Commit c0483990e6b5b454f7c8752b36760cfcb0d093f5
  * Fixed: CMake: Call "enable_language(CXX)" prior to tinkering with
      CMAKE_CXX_* variables (GitHub #110)
  * Fixed: CMake: Support absolute paths for both CMAKE_INSTALL_LIBDIR
      and CMAKE_INSTALL_INCLUDEDIR (GitHub #114)
  * Fixed: Windows: Address MSVC compiler warnings (GitHub #111, GitHub #113)
  * Fixed: Documentation: Space requirements for uriUriStringToUnixFilename
      did not take into account short form "file:/bin/bash" of RFC 8089 of 2017
      (with prefix "file:/" rather than "file:///") that uriparser supports
      since release 0.8.6 in 2018 (GitHub #118, GitHub #119)
  * Fixed: Compile error with MinGW GCC 9 related to a mismatched prototype
      for function inet_ntop (GitHub #117, GitHub #120)
  * Fixed: Compile warnings in test suite code (GitHub #120)
  * Improved: Respect variable ${CPP} in doc/preprocess.sh (GitHub #115)
  * Added: Test suite invocation for MinGW using Wine (GitHub #120)
  * Soname: 1:29:0 - see https://verbump.de/ for what these numbers do

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../uriparser/{uriparser_0.9.5.bb => uriparser_0.9.6.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/uriparser/{uriparser_0.9.5.bb => uriparser_0.9.6.bb} (84%)

diff --git a/meta-oe/recipes-support/uriparser/uriparser_0.9.5.bb b/meta-oe/recipes-support/uriparser/uriparser_0.9.6.bb
similarity index 84%
rename from meta-oe/recipes-support/uriparser/uriparser_0.9.5.bb
rename to meta-oe/recipes-support/uriparser/uriparser_0.9.6.bb
index f50622358..0d45a1559 100644
--- a/meta-oe/recipes-support/uriparser/uriparser_0.9.5.bb
+++ b/meta-oe/recipes-support/uriparser/uriparser_0.9.6.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fcc5a53146c2401f4b4f6a3bdf3f0168"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${BP}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "1987466a798becb5441a491d29e762ab1a4817a525f82ef239e3d38f85605a77"
+SRC_URI[sha256sum] = "10e6f90d359c1087c45f907f95e527a8aca84422251081d1533231e031a084ff"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
-- 
2.25.1


