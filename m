Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38554C46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 05:28:38 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.16718.1673414911995856598
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 21:28:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gHiUrIlz;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673414910; i=@fujitsu.com;
	bh=QBoeEE30RBVum0r33NImzZvSd77Xm4v0lMq67U1I4pc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=gHiUrIlzfPP+pzoDNagQYkvHmAmovdafl6a/NfoijFBbExQAOoHFAaIjJK1hO05sU
	 GWmnCgz7aMsNruXWw2XAsbT6b1R7KD6VNK33wfPZT9bcUIxGGX3KPTsz0Q+OPG99O6
	 +U6YzIy8T/9DIFmLRt95AmdV41Zt8s6EThWfAz/pcxJkhV6qid3f8muhWHheJdJLl4
	 i42kfhrro4XFyAttkIgd/UPtMlDGmy5Xmp62KNiYcAvTil3vYip8s6ooqOuqPTJjH+
	 RXXQrb1RZv88uerlH6xk/JTWTpNvWZt580j7oTzbJ73iigjG1By4YH4EEYOG6gadCP
	 7XDezA+NFgN1A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORpPvXY1+
  ywbMfchYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a6W4tYCyZxVdw4dY2pgXEJZxcjF4eQwENG
  ieVXrjJ2MXICOVeYJJ4fi4NI7GWUuPf1AjtIgk1ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  8BqhAU8Je5M+sMKYrMIqEp827sfrIZXwEli1uWlYL0SAgoSUx6+h4oLSpyc+YQFYo6ExMEXL5
  ghahQlZl9uZoGwKyVaP/yCstUkrp7bxDyBkX8WkvZZSNoXMDKtYjQrTi0qSy3SNTTVSyrKTM8
  oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMxpRihUs7GN8s+6N3
  iFGSg0lJlDdPYl+yEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQleFVegnGBRanpqRVpmDjAyYNISH
  DxKIry1jkBp3uKCxNzizHSI1ClGRSlxXmd3oIQASCKjNA+uDRaNlxhlpYR5GRkYGIR4ClKLcj
  NLUOVfMYpzMCoJ8zI7A03hycwrgZv+CmgxE9Diw117QRaXJCKkpBqYBAvPH07vyV++tEcy9ea
  +P/L2PPU3t3BssuYWyRT+O5lLtHb+p5SNUk+T0nRiAg5P8N4Zdujxy1XTAlYtWby4pvBw+RZT
  zT9neHsCOG+G7OUV1T23TC5pdqRD22Ipz9PqYnOWJ1yXdGjguXLjVIYIz/O/0fNTgrT8Hda/j
  nzgKz5fLIT/vixLYBD75lv1SW5xPncPHS1NWSquY3pPpVN0mZJoVcuuI2zLl9p7cqT/y9m9OI
  3fWfTNv7b5K7rTVpyKnHyjqbPN6uRGcYOnr5bluptynjg2q6dp94oPG/o+rpr3US653m2vhbb
  Yu7dPnzHP8+BwX13fO9u56HCuh9SDtWwH129R9py8PM/mDb+9EktxRqKhFnNRcSIAzGoinEED
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-571.messagelabs.com!1673414909!898979!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11313 invoked from network); 11 Jan 2023 05:28:29 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-14.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jan 2023 05:28:29 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 396B31AF
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:28:29 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 2D2C17B
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:28:29 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 11 Jan 2023 05:28:27 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-ujson: upgrade 5.6.0 -> 5.7.0
Date: Wed, 11 Jan 2023 13:28:16 +0800
Message-ID: <1673414898-13896-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:28:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100539

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Support ujson.loads(bytearray(...)) and other bytes-like objects. 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-ujson_5.6.0.bb => python3-ujson_5.7.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_5.6.0.bb => python3-ujson_5.7.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.6.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.7.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-ujson_5.6.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_5.7.0.bb
index ee12deffb..5c431fa00 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.7.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e0039a83d8a99726b5418f0b03302d0a"
 
-SRC_URI[sha256sum] = "f881e2d8a022e9285aa2eab6ba8674358dbcb2b57fa68618d88d62937ac3ff04"
+SRC_URI[sha256sum] = "e788e5d5dcae8f6118ac9b45d0b891a0d55f7ac480eddcb7f07263f2bcf37b23"
 
 inherit pypi ptest setuptools3
 
-- 
2.25.1


