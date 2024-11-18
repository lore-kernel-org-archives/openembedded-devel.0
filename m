Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B98D4400B
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:26 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.37273.1731922221603755468
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=piOYq4sB;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922221; x=1763458221;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=C7W2MtkPuaqv849QZaQeTiAevalQnjwfonHgJ+Zn32M=;
  b=piOYq4sBLlJgOm5ehUZ/B9vwQ9fHqM8+slBFqn+iAtsKbuh9ELAomf2g
   k20vd+1okTiN+6aw8EX7ms783EWfaSLDL0aYFKFi7nooLtGLMZy1Ekz28
   CWsemNonToZo9R+AsiqbHspwGfr1GzgcnlkHa/Troi4TzxliI4FLWw1Ch
   3AL004Ej2N3B9bf0sqaisfA04YKrU38s0iNppAR28pkzLLs+dPX9u1c6q
   KbkyH3Rstpk3cjGmO6iNp8QxAruCzE1+iYXRXxgRCurbKnkT8GKPI3RZG
   ercG4lfTCMEDsPnP05AscABMHee8H2n15SG6w4hzyqQu27YaY/Mf/Ohwf
   A==;
X-CSE-ConnectionGUID: JBVZPdoRQbu9klH01kdbjQ==
X-CSE-MsgGUID: K43NaorURt6ovj/QLy81Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="180997136"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="180997136"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:19 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0301ED5022
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7CAF917CD4
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 16B4B21FD58
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:16 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BB6CC1A000B;
	Mon, 18 Nov 2024 17:30:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/32] python3-typer: upgrade 0.12.5 -> 0.13.0
Date: Mon, 18 Nov 2024 17:29:51 +0800
Message-Id: <1731922195-5266-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10--1.026300-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXLfjYJLY4oVc0oZyBBJlD/DNqzJeNWiU/XZpx
	XoEj3ua9j8o8yzblMbk4zmUqACvbHOl/E5ERegUCKGC+63vcArzkGvtzwk9qL+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113896

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/fastapi/typer/releases/tag/0.13.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-typer_0.12.5.bb => python3-typer_0.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.12.5.bb => python3-typer_0.13.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.12.5.bb b/meta-python/recipes-devtools/python/python3-typer_0.13.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-typer_0.12.5.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.13.0.bb
index e175b5420..958c82354 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.12.5.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.13.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/tiangolo/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "f592f089bedcc8ec1b974125d64851029c3b1af145f04aca64d69410f0c9b722"
+SRC_URI[sha256sum] = "f1c7198347939361eec90139ffa0fd8b3df3a2259d5852a0f7400e476d95985c"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


