Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F22C433F5
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 02:56:57 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.7644.1637809016912846742
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Nov 2021 18:56:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RYYt0fO/;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637809014; i=@fujitsu.com;
	bh=Usm/i/l85E1BoGUqOyLgBB/uhKuP0wDvUYn+bVu3aUc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=RYYt0fO/EhliTseVkcjCrPTrCsz5/wgw1NnwQKhgLXLBUwSqXCPlKhBFqIVFpHJnz
	 6M/gMS+uEM9yRZP1meMWJAuxE4g+QRhDSD2OBqfIpO4vozp6UbigUrgo7x1n9H1cMZ
	 uU+5g1+fmzGd8nKztWbBzPJF2h7CLrzaFwFXqv4up4ONAMnFyITOOg0AnbJbRekKvP
	 kEXUZlc9ttVDQA1EvhkgTDysOQrnyo/0502E7QMo1KDPsDh++qJ367Jo3QM9ZGjgJ1
	 8Bb/uduzH8A/EVbRN/DGHP/7tQpDzpn9LdjDPTxO6I5lQsCchlpz68GK/RC949stDl
	 N4+fVU+YdGXnA==
Received: from [100.115.36.91] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id 39/AB-01854-57BFE916;
 Thu, 25 Nov 2021 02:56:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRWlGSWpSXmKPExsViZ8MRolv6e16
  iQes2cYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP/3XPMBXsFKhbNusLYwPiCr4uRi0NIYCaT
  xMklx9ghnBOMEudurGXsYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvHnYQW1jAX6Lt5
  nOwehYBVYk3d1+A2bwCzhIXH6xjA7ElBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL14wQ9QoSsy+3M
  wCYVdIzJrVxjSBkXcWkpZZSFoWMDKtYrRKKspMzyjJTczM0TU0MNA1NDTVNTbWNTTTS6zSTdR
  LLdUtTy0u0TXSSywv1kstLtYrrsxNzknRy0st2cQIDLKUYkWBHYxfL33TO8QoycGkJMr74tW8
  RCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvM6/gHKCRanpqRVpmTnAgIdJS3DwKInwHgFJ8xYXJ
  OYWZ6ZDpE4x6nK8bvm5g1mIJS8/L1VKnFfkJ1CRAEhRRmke3AhY9F1ilJUS5mVkYGAQ4ilILc
  rNLEGVf8UozsGoJMwrA7KKJzOvBG7TK6AjmICO6N0zG+SIkkSElFQDU59LZML77rZbLY39bWb
  igoZ9O7QnP4/tesb0p+uOokfT18hZJnE3ut78XHlxjXvdloMLHic4yrsfXtSnFjy75NSUldu+
  a4aencD6VLPWVTkluOVwRqz0VsYTy8Jqss54LW3wX3zFWfLFdo+rb4p5py179a9Kgys33o0xI
  G2dDV+72+GSkt7/4iptVtsT2A8a5zKvZ0tcaHPx6qS1rg5dkxn6L+tvtVkodFVDqOg2mynb7J
  WLH93YvE1w0/5im4tTUtTXywd+mVezZMky0RUzs0/tUfviuHuSbTN32c8dz7uWld64vD1Jda7
  GYe5KUd5XUxbsPMDS3fpWUGtZWfGTBZ9/LhKqSMj7dd6MOcT8hBJLcUaioRZzUXEiAN2dCcg5
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-571.messagelabs.com!1637809013!28326!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16123 invoked from network); 25 Nov 2021 02:56:53 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-14.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Nov 2021 02:56:53 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1AP2ules015229
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Nov 2021 02:56:53 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 25 Nov 2021 02:56:45 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-autobahn: upgrade 21.3.1 ->
 21.11.1
Date: Thu, 25 Nov 2021 10:56:36 +0800
Message-ID: <1637808996-106567-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Nov 2021 02:56:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94123

Changelog:
fix: autobahn installation in docker
     (https://github.com/crossbario/crossbar/issues/1503)
new: refactor SigningKey class for reusability
     (https://github.com/crossbario/crossbar/issues/1500,
     https://github.com/crossbario/crossbar/issues/1501)
new: expand XBR node pairing helpers
fix: build with nvx by default and don't publish universal wheel.
     (https://github.com/crossbario/crossbar/issues/1493)
fix: update wamp flatbuffer schema for r2r links
fix: don't clobber factory
     (https://github.com/crossbario/crossbar/issues/1480)
fix: explicitly require setuptools
new: expand wamp auth scram and xbr argon2/hkdf
     (https://github.com/crossbario/crossbar/issues/1479)
fix: WebSocket compression, window size (zlib wbits) == 8 is illegal nowerdays
     (https://github.com/crossbario/crossbar/issues/1477)
fix: XBR IDL code generator - all 4 WAMP actions working now
new: add automated build of xbrnetwork CLI (single-file EXE) in CI

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-autobahn_21.3.1.bb => python3-autobahn_21.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_21.3.1.bb => python3-autobahn_21.11.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_21.3.1.bb b/meta-python/recipes-devtools/python/python3-autobahn_21.11.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-autobahn_21.3.1.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_21.11.1.bb
index d11c70e13d..857862d31b 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_21.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_21.11.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://crossbar.io/autobahn"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
 
-SRC_URI[sha256sum] = "e126c1f583e872fb59e79d36977cfa1f2d0a8a79f90ae31f406faae7664b8e03"
+SRC_URI[sha256sum] = "bd6f46315419ca0a5be4109f737410208ad5f19718f67ca6a4a674cc66ca9b18"
 
 inherit pypi setuptools3
 
-- 
2.25.1


