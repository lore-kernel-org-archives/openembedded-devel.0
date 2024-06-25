Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48143C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:36 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.166865.1719305846987426076
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=l7WCICFY;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305847; x=1750841847;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=SQx+DxMVnzYTyDg+sBa1XGGw2FbrXvuGz7t4P4yWV5c=;
  b=l7WCICFYVgbeBYrTmrkMUw4IfWk6/SwDMaSUun2dm3lKrppyFWPNSs54
   03lUnwxDe1jDfj9tTIqIs3JwE0+pJBKXkOvefhDB74JtJ7beXXFsjyJ2U
   nfhD57UJscDa8yuXU8hyqAP9QW2p6OmFm2EP3jUA4De8OB+/RPsT+tVrj
   5F3MFZJHojGbusLyPkei88UFydKhTeEGMnIy3UHrXpuxT5cBGCuhps8xv
   dY/b8cDut9ogmWbIwYw/adMD8ZS2YZYLUuobPGYo6/Lofh7o/IUxfcfjG
   Xn5CDz7PVHoh2vwCMT5VhAp50ePCEeMA/lszkgyi1XePK+6VPCgSAwhlF
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="143913900"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="143913900"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:24 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A6E27D4F54
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:22 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 07A2CF769
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 83AA32007CDD9
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 320311A0002;
	Tue, 25 Jun 2024 16:57:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/57] python3-meh: upgrade 0.51 -> 0.52
Date: Tue, 25 Jun 2024 16:56:09 +0800
Message-Id: <1719305790-11484-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10-1.013600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mr8FHp8LCpZ7S4n9bqPhfH2wQF
	TLnXm7yY4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0547KeTtOdjMy6fr0
	mqpu8k1/i8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFEqQ9DJRw5PjkAS5tj+f8UqfAf
	wtNpkujcZAptrRmDkQGIa47nNUD2bspeit3sSbNmAh/Tz79nxxklodjbBtxPwgrT9BdJvLdux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111049

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Merge pull request #42 from M4rtinK/master-optional_libreport
- Make libreport optional
- Merge pull request #40 from M4rtinK/master-make_buildrequires
- Add BuildRequires: make

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python-meh/{python3-meh_0.51.bb => python3-meh_0.52.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-meh/{python3-meh_0.51.bb => python3-meh_0.52.bb} (90%)

diff --git a/meta-python/recipes-extended/python-meh/python3-meh_0.51.bb b/meta-python/recipes-extended/python-meh/python3-meh_0.52.bb
similarity index 90%
rename from meta-python/recipes-extended/python-meh/python3-meh_0.51.bb
rename to meta-python/recipes-extended/python-meh/python3-meh_0.52.bb
index e83514af1..266b94c9d 100644
--- a/meta-python/recipes-extended/python-meh/python3-meh_0.51.bb
+++ b/meta-python/recipes-extended/python-meh/python3-meh_0.52.bb
@@ -11,6 +11,6 @@ S = "${WORKDIR}/git"
 
 SRC_URI = "git://github.com/rhinstaller/python-meh.git;protocol=https;branch=master"
 
-SRCREV = "eb5d4adc3b838704b6a68f0f77ada2063a11ab1b"
+SRCREV = "f0fcc3ce1943dce9cf958f4a2f7398daff619c9f"
 
 FILES:${PN} += "${datadir}/python-meh"
-- 
2.34.1


