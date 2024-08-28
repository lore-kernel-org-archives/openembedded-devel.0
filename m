Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A33C5475C
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:26:02 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.8726.1724833550442503744
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TOgd2Qc/;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833557; x=1756369557;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=lPKOiYjvyLkmGW0xkhPHRI2JCTCtjs7wsJS+6gdPTTA=;
  b=TOgd2Qc/55i+B0eCQlIPwDrKmFAo09jo7SjUkk9AWd7cMKnXo9Pgkj3P
   OgLIUEtWXDLqhVpacQ1P3YOpqHiWqhyd3Lk67TEvYpjngFI/uonO0UoNA
   hpjKIX/p81yBqX4B3CkegbVJmWcorUQ4xPaUx+84R5SD5R1wVWS8dhyO4
   uPGS1khdUPAZf1TWAA0dtJn1vVsZroSnie9VrTxTsecvzgSNoV4E6rs9w
   /2LXllFD4Se0B83F14Hxu7QJhrISEb6jpd4RcA3E2OQodN4nlae1RGWA4
   UYwQ2h2OSq0hJZFpNqvHEE+LchyGpxwicD525VR9Luw6XKj9g+PHlt8jt
   g==;
X-CSE-ConnectionGUID: 7eYStYRGR3Ok/P1KaxOPMg==
X-CSE-MsgGUID: s2r2frOqT7i3A5OR48z6uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="150902421"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="150902421"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:56 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 43A45C68E1
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:54 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8CD5BD50E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D1F56BD5F
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BE6961A000C;
	Wed, 28 Aug 2024 16:25:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/46] python3-tomlkit: upgrade 0.13.0 -> 0.13.2
Date: Wed, 28 Aug 2024 16:25:16 +0800
Message-Id: <1724833525-2162-37-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10-3.103800-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvWgyyBjSswzb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIMay5jJvrxqM1vZ
	7s3YIVDKbepuhA18xJLao0Zou4ee+HxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5tun
	BoWdY6y73LUUP67BGAtn23J+BpfGS90hscv2G4yWb2r8wtdKa98qqv3itNIaP/Qx9pOQIVyk8Ov
	0hvdVKV5w7Sawp5z3GCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112012

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 fix: delete keys from out of order table

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-tomlkit_0.13.0.bb => python3-tomlkit_0.13.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tomlkit_0.13.0.bb => python3-tomlkit_0.13.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-tomlkit_0.13.0.bb b/meta-python/recipes-devtools/python/python3-tomlkit_0.13.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-tomlkit_0.13.0.bb
rename to meta-python/recipes-devtools/python/python3-tomlkit_0.13.2.bb
index 761bab273..9fca14540 100644
--- a/meta-python/recipes-devtools/python/python3-tomlkit_0.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tomlkit_0.13.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/tomlkit/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=31aac0dbc1babd278d5386dadb7f8e82"
 
-SRC_URI[sha256sum] = "08ad192699734149f5b97b45f1f18dad7eb1b6d16bc72ad0c2335772650d7b72"
+SRC_URI[sha256sum] = "fff5fe59a87295b278abd31bec92c15d9bc4a06885ab12bcea52c71119392e79"
 
 inherit pypi python_poetry_core ptest
 
-- 
2.34.1


