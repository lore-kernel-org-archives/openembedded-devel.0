Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484D7C41513
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:04 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.166850.1719305823566395119
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=akR4cJWP;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305823; x=1750841823;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7UsRXS887H8QswMTBr+Ne5XWx+s20SYpkaoK9mh4dSw=;
  b=akR4cJWPsw82ThPMW191g/bQYIjKHO2ZzDHP1xZEHthDx8WPvnVNLs5E
   74gjbQ+OjKxmr/K8vYYcKjTlPGzdRUCHPWT0Rth/17QmAGiQ7+xC/9pYM
   deYS8rxXu93cXDPq7Kdvr4+PLAhLUVNT6ZZCKC+/vDRV+5tQjRqWSe1yh
   zmD1EJuAO1JXwbqRuoN2CAERP6XG+UaGrGf+nnCy8xFswnTbd/g93kSxJ
   BjQDagzRAWQ1DWOQJaWzrMYcw9D9YU8/1uBkuh3LFM7wYqcK54e0dx5++
   pPGnRGO7VTBiek8w8xL1gbqlUIckCriMYQBfMFoiiDSBoIoDuNwp+WS3p
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="153145148"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="153145148"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:01 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id F2DD5D424E
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:58 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3DDF6D4C00
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D5096E2B14
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 80B4B1A000C;
	Tue, 25 Jun 2024 16:56:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/57] gensio: upgrade 2.8.4 -> 2.8.5
Date: Tue, 25 Jun 2024 16:55:40 +0800
Message-Id: <1719305790-11484-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--5.512600-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/ySrLqyE6Ur/jyqyllX6UJIuK6YeLVLZH4Gdv
	IBM8UuLShbC0kuS6Txcep5R/z/M+R8+MAVVuGGsdSs47mbT7SATYUDvAr2Y/1wySorGVJadytzB
	kuk8VO0CxPRD4jEJEVw3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXR/IzlV+CMbbW9n
	uzdghUMjeWrdgSBjom/Sj/WnCM/LMfE8yM4pjsDwtuKBGekqUpI/NGWt0UYPBj3PY9lvkF0fsb7
	geuyVgTPjxzvUw2gsnkgbKJxmfb+aUgZdIaXg4f
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111026

From: Wang Mingyu <wangmy@fujitsu.com>

Chanelog:
==========
- Fix relinking issue
- README.rst: fix typos
- Add initial EditorConfig support
- .gitignore: ignore ctags generated tags file
- tests:conacc: Add a test for a connection failure
- conacc: Null the connection data if the connection fails
- Fix a compile error when GCC atomics are off
- tools:gtlsshd: Add handling of accepter parmlog events
- tools:agwpe: Fix missing nil termination and uninitialized variable
- Fix some formatting in the README

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gensio/{gensio_2.8.4.bb => gensio_2.8.5.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.8.4.bb => gensio_2.8.5.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.8.4.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.8.5.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.8.4.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.8.5.bb
index 1f85c46e2..27b806970 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.8.4.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.8.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     "
 
-SRCREV = "300644fc02b7099ca27ca5bac88c47e159ba8a6b"
+SRCREV = "a776fb6fd56d5b0aedb1219ca17474faa1705260"
 
 SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master"
 
-- 
2.34.1


