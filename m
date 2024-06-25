Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9AC2C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:25 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.166864.1719305845108960847
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=A6cH3Zih;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305846; x=1750841846;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Ya0fBJRRiCGHX1jXK3rRXubSvt4ZbxKsj1lrwgKAJHs=;
  b=A6cH3ZihTA6NHLp9YxdXLyOzVmOwN3TUvTxGS+0XTw1uJNnyRm5RkB4l
   hjKPEhrnfahRS9hqhe2u20zs654fSPlWqaUik0lNh0XdVnMuiWau/w5B+
   W1ZMpmQNFE5bdYQ29dBcccNNFjPsmdhAoqL/EPslQaKLq7gT2BFuE/Bye
   Vn30FNXjT/o3yV++vqJR1p37xpsj2Nl0Y5axCF+0/2IWY8V2eaKCYQeF7
   TfytusPB54BaWPQbsFlwucP+HfTffzUovOzgeLw55n1zACw+85C/dO4xh
   JT2QiLyyOoCAid6n9WH1i+/rWztU7SEvy/Vu4Ae3YPfjEu5PJiMYfhhUL
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="144297055"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="144297055"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:24 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 272D2D8003
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:21 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6B58DBF3E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 072E92007CDC4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:20 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A957A1A0002;
	Tue, 25 Jun 2024 16:57:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/57] python3-marshmallow: upgrade 3.21.2 -> 3.21.3
Date: Tue, 25 Jun 2024 16:56:08 +0800
Message-Id: <1719305790-11484-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10-0.428400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyt2Ns65yZigxL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXKDzzFUx0OWp9X+3GSYswPFGrG4ytgCMSXzLz
	jFpRPZxAb/Z/WG8/yZLh67aF9zUlDpH+hGnR1Ux8zfo5i5VvCkVtG46M/2TuT+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111048

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
Fix memory leak that prevented schema instances from getting GC'd

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-marshmallow_3.21.2.bb => python3-marshmallow_3.21.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_3.21.2.bb => python3-marshmallow_3.21.3.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.21.2.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.21.3.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-marshmallow_3.21.2.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_3.21.3.bb
index 11351230c..9c29c810d 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.21.2.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.21.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
                     file://LICENSE;md5=27586b20700d7544c06933afe56f7df4 \
                     file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
 
-SRC_URI[sha256sum] = "82408deadd8b33d56338d2182d455db632c6313aa2af61916672146bb32edc56"
+SRC_URI[sha256sum] = "4f57c5e050a54d66361e826f94fba213eb10b67b2fdb02c3e0343ce207ba1662"
 
 inherit python_flit_core pypi ptest
 
-- 
2.34.1


