Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12EBACD12A7
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:44 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.39475.1711983096554025796
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qbTquW2R;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983096; x=1743519096;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aFfA5yNsG4gHO4spZ1USni+Nadl5nLbr6jkMICbHDt0=;
  b=qbTquW2REJm+Vv0yaZSyikwvNYr6LDCHkp0nx44u7/aY9ZBAcDbjB8Xz
   3QQN1jwJ0qVtKjHtF/bjGRHWRu1hxyEHd2q4m9VrjTuaNRocFscQlun3+
   tOOWu2GOUyLjsEj9ZAEgdAQ85rmvCB4/F8OfkCl28sgOd1iNe9mqxbZ++
   SvNM47Xo6bshGC88F9txgc4C50SkHQZDmEhDLNwbVMd+ExVmcdW4obu7L
   C4ueB/faToPLRooKN9yRxSj/8sRRFHX5sUDbwn87g8PaU1fbWgfHTFbd2
   nN90aAClz+tbRF/oj0mxRvBzLyHtonpllJo49q+iTdANkyr2ZWAmWwwrb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="142720323"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="142720323"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:34 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0CCE7C680B
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 396DD1B860
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BDE6720093240
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7336A1A000A;
	Mon,  1 Apr 2024 22:51:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/47 v2] python3-cassandra-driver: upgrade 3.29.0 -> 3.29.1
Date: Mon,  1 Apr 2024 22:50:45 +0800
Message-Id: <1711983079-16849-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--1.498200-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIS3Fe1CtDUbdz4cH5hW96YOwpfLMeBwRuuLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXKxDK2gVJ8/AKwG8m5UZk9RzoPQ5uVrSuXPrD
	edNoujBgPG+GXObFAg8ie970zcTeeDq8jmOoQcvZLPApjFyIc2gZFLdw7uEuH+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109732

From: Wang Mingyu <wangmy@fujitsu.com>

bugfix:
=======
-cassandra-driver for Python 3.12 Linux is compiled without libev support
-Consider moving to native wheel builds for OS X and removing universal2 wheels

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ndra-driver_3.29.0.bb => python3-cassandra-driver_3.29.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cassandra-driver_3.29.0.bb => python3-cassandra-driver_3.29.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.0.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.0.bb
rename to meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.1.bb
index b8565d17e..3003e84ac 100644
--- a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.1.bb
@@ -8,7 +8,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 SRCNAME = "cassandra-driver"
 
-SRC_URI[sha256sum] = "0a34f9534356e5fd33af8cdda109d5e945b6335cb50399b267c46368c4e93c98"
+SRC_URI[sha256sum] = "38e9c2a2f2a9664bb03f1f852d5fccaeff2163942b5db35dffcf8bf32a51cfe5"
 
 inherit pypi setuptools3
 
-- 
2.34.1


