Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B1DC64EC4
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 11:03:44 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.6896.1677927818358998417
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 03:03:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=O1IyfFQQ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677927816; i=@fujitsu.com;
	bh=VpP1csWcC+65oqQhKqsSzU/kiB9NXy16X3e9F7crIxY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=O1IyfFQQyN5+JPz3wCiYJqkijp83iHndXYrFauZgrEmzWBaLFj9K0XT6dvkAnwtyX
	 13KqqNiNwxneiNdb2/cmlB/sFAH7MO17qCBb7Ce62EzXNPIJSUKKYoVs7fa5MK5Gji
	 CpO7iEpMZuiYVO74Mf/xWp1lLSg7yxHJWYip9CriVSvKn2MqU1OPIqXnj5+Q3xIhCd
	 wl/7pbSZbJ+ACAnEQ6C65iHfx8e4UwIHUgiurK+xXmXE9UTvdL1TQsOy0p5BqG8yIm
	 kfHETfDxKogcvjiP5sMOhOcUzbNQMNdQebugXqO3ptE+LmtuR1nb79nsjNgoBODP54
	 QcYca4heX0/CQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8OxWbddlTn
  F4O1LDYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP/mdNsBY08Feua57I2MD7j6mLk4hASeMgo
  sXPWOlYI5wqTxO7lDxkhnD2MEssuLmfpYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAWeLA5qtgNgtQfOfF12D1vAJOEhe//AarlxBQkJjy8D2YzQlU/+LiXzBbCKimbdVhRo
  h6QYmTM5+wQMyXkDj44gVUr6LE7MvNLBB2pUTrh19QtprE1XObmCcwCs5C0j4LSfsCRqZVjKb
  FqUVlqUW6hnpJRZnpGSW5iZk5eolVuol6qaW65anFJUCZxPJivdTiYr3iytzknBS9vNSSTYzA
  4E0pZmHewXi456/eIUZJDiYlUd5JrAwpQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4ORSZU4QEi
  1LTUyvSMnOAkQSTluDgURLh3SIClOYtLkjMLc5Mh0idYtTl2HT4yl5mIZa8/LxUKXFeAWWgIg
  GQoozSPLgRsKi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY9z/IFJ7MvBK4Ta+AjmACOkL
  jNAPIESWJCCmpBia2B8Ufrm+WNT9VKOVuFL/7xLHV7XI712pUnV4QaKhmUV7yXVpHQN3ISneG
  jMWO88fzOUJSTufcfCcUU57AHbR5x0nZrpn/HCdpvXNQzDQ5KqDL9NfW+7Tmh6olCyI38wXfm
  ty07k6u6b2Zof/sy9nj2N8Hma9TvquvynmFvc7iktxZNxZXr8LXTFWigh2+lr9z025HH97+41
  cKc9jytW79G9S38Uh+yYv8qBqd5bjB+dJi2e7vp29Nn2cqaOx1vb3w+Gq5SQJVP7yOT1LIUnM
  5XdKvuFDNt6JhG1f8kUVTF3HLJPlemibvaxNRP6t488UvXhz3Jz4+sL/PpFL37k3fR1nHF+al
  eixWs49MVmIpzkg01GIuKk4EAAJ0h5BlAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-587.messagelabs.com!1677927815!148568!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30203 invoked from network); 4 Mar 2023 11:03:35 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-22.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2023 11:03:35 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 4758A142
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:03:35 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 3B6ED73
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:03:35 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 4 Mar 2023 11:03:33 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] byacc: upgrade 20230201 -> 20230219
Date: Sat, 4 Mar 2023 19:03:17 +0800
Message-ID: <1677927799-22851-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677927799-22851-1-git-send-email-wangmy@fujitsu.com>
References: <1677927799-22851-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 11:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101358

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* test/yacc/ok_syntax1.tab.h, test/yacc/ok_syntax1.tab.c,
  test/btyacc/ok_syntax1.tab.h, test/btyacc/ok_syntax1.tab.c:
regen

* test/ok_syntax1.y:
modify test for %union to add tag for testing reader.c

* reader.c:
provide for a named union, e.g., "%union foo" by detecting the name and
deferring the typedef in that case until the end of copying the union
definition

* VERSION, package/byacc.spec, package/debian/changelog,
  package/mingw-byacc.spec, package/pkgsrc/Makefile:
bump

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../byacc/{byacc_20230201.bb => byacc_20230219.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/byacc/{byacc_20230201.bb => byacc_20230219.bb} (82%)

diff --git a/meta-oe/recipes-extended/byacc/byacc_20230201.bb b/meta-oe/recipes-extended/byacc/byacc_20230219.bb
similarity index 82%
rename from meta-oe/recipes-extended/byacc/byacc_20230201.bb
rename to meta-oe/recipes-extended/byacc/byacc_20230219.bb
index 409212e69..614bcaf64 100644
--- a/meta-oe/recipes-extended/byacc/byacc_20230201.bb
+++ b/meta-oe/recipes-extended/byacc/byacc_20230219.bb
@@ -7,4 +7,4 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=b56b7454f5f865de2e6e35ee2185b461"
 require byacc.inc
 
-SRC_URI[sha256sum] = "576cc9d9ae5e22503ed5e3582498cf2cccacef401969106420547b4d05c87d76"
+SRC_URI[sha256sum] = "36b972a6d4ae97584dd186925fbbc397d26cb20632a76c2f52ac7653cd081b58"
-- 
2.34.1


