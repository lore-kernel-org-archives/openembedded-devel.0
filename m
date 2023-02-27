Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D6CBC64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:12:21 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.85547.1677485539228093699
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:12:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=swUZGP6P;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485537; i=@fujitsu.com;
	bh=3ATsfRpH7zDsXgnYnvp5YnD7Au2q27fUeY/wNXci/SU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=swUZGP6PiJl/lbdz2lEtFP+zoM34VKyAGGLKYQAauaGc/7w7KNl0dW7AQeS+LyQuP
	 wp8I+K8Prk6xcNJ+2oZDBTBvapVTh8Zls11lsmPVn27LSd9dtELT7rlA8jvgShYLVW
	 QfCNDXTNSo8RtWMNXtQ2kNqQKxPj+hgb97zJNBSpZz0komiZ6zhMAYF38gv2Uh6dQt
	 5t78Hsw6uDEV6zWY+2TExrRHaJ5p8MsCQDtLSJz8wEx5CGc7w7lcLwh04N6gaGPM+5
	 r8hk15ILlqLeduJ+mgcKxfASixHoQ9TDPvFg4BZFbF1NQAisjE2Y3/Rz4TwU8sJTHx
	 GTjAbjYwjtNXA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqPsw9U+
  yQetVYYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNxTwtzwT3OikmbjjI2MP7i6GLk4hASeMIo
  sXjWerYuRk4g5waTxI3DzhCJvYwS/6/NZAJJsAlISdy4/x+sSERAX2Lp7D3MIDazgIrEi9897
  CC2sICnxPVZTWA2i4CqxLST58B6eQWcJLb9awazJQQUJKY8fA/Uy8HBKeAssek9I8ReJ4m77R
  tZIcoFJU7OfMICMV5C4uCLF8wQrYoSsy83s0DYlRKtH35B2WoSV89tYp7AKDgLSfssJO0LGJl
  WMZoVpxaVpRbpGprpJRVlpmeU5CZm5uglVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibnpOjl
  pZZsYgSGbkqxuvsOxiN9f/UOMUpyMCmJ8i5y+pMsxJeUn1KZkVicEV9UmpNafIhRhoNDSYL3Y
  BJQTrAoNT21Ii0zBxhHMGkJDh4lEV5mI6A0b3FBYm5xZjpE6hSjopQ4L18iUEIAJJFRmgfXBo
  vdS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeaMSgKbwZOaVwE1/BbSYCWjx9oc/QBaXJCK
  kpBqYzumv0/hf2qwvwPn3mfi9DzNPbWhsk/73Yar201WdhhvreTt9ivasnH/ERdhJ9cVmBef3
  XkpJ4Ze6F6+xuy52PHl98EW2ZS/u1sXM5I30Ur16r7/2j7vLHv2sjN1WW0r0ym6rlUipPUl43
  2GTW9Aa1vg5/vRSvd8X46OWTOj/cWWT/rJIe96Udbbrfh7I+vSpev+WB/PSHpjWFlY9vpjAfs
  8mQUg+3HPR/WyPJ0t3urvlLuF9r7yVwVBHd8EN931K/O2cBZH7QyMirIOkiliWM6gd1ZWRK3K
  +HLb6KYveo5/en0/2bp+YZyoqpHf2g+/V538N39cVHzxfMiuN7dmnYh5r1km3H3+0u/1ZVDxV
  iaU4I9FQi7moOBEA42RDG1gDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-548.messagelabs.com!1677485537!170623!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18282 invoked from network); 27 Feb 2023 08:12:17 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-22.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:12:17 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id F140910018D
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:12:16 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E43A3100182
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:12:16 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:12:15 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-redis: upgrade 4.4.2 -> 4.5.1
Date: Mon, 27 Feb 2023 16:12:01 +0800
Message-ID: <1677485523-11699-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677485523-11699-1-git-send-email-wangmy@fujitsu.com>
References: <1677485523-11699-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:12:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101285

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfix:
Fix #2581 UnixDomainSocketConnection object has no attribute _command_packer (#2583)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-redis_4.4.2.bb => python3-redis_4.5.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_4.4.2.bb => python3-redis_4.5.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_4.4.2.bb b/meta-python/recipes-devtools/python/python3-redis_4.5.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-redis_4.4.2.bb
rename to meta-python/recipes-devtools/python/python3-redis_4.5.1.bb
index 37c64b11f..9b2698589 100644
--- a/meta-python/recipes-devtools/python/python3-redis_4.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_4.5.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1db1f331d351900707368237cc4880cf"
 
-SRC_URI[sha256sum] = "a010f6cb7378065040a02839c3f75c7e0fb37a87116fb4a95be82a95552776c7"
+SRC_URI[sha256sum] = "1eec3741cda408d3a5f84b78d089c8b8d895f21b3b050988351e925faf202864"
 
 inherit pypi setuptools3
 
-- 
2.34.1


