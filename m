Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B122ACE8D53
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:49 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.11430.1726716760599533637
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=c/b0ZKqW;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716763; x=1758252763;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=6aLSPZn/m15+/sO94XnTn9NDSdnZoAocKg2xVzyE1dI=;
  b=c/b0ZKqWXZKO+KDfZEqpLrSzmnzJ5kDprd94y9DyT+8GMlv94tioiyEQ
   jEgqBUbFRPu2kGF/1q/DP4esijBhhBmkHGaQ+wEtBzU95zYiIgKdmGyWO
   nFlprsBTzVMNremK+vpnVmqvssZYtLdOe1vcCjWwRcL+KdUcY3NhQEL8S
   r/xA/0QAEiUqnCIj6uo5R8hc0FFOMPIEfy0q6n6arweYrxdnvRvcTheMK
   vACUL0gYeaEXE5OjNknH/Tk0ttIRJ1ytQTqXYrzyveFI7hHChqOKgxpJl
   vTQHLFbFzixgE6QTNyoC3HFlVgH1Yl5f4PM98joyP+6RIwhg80L8WYZnW
   g==;
X-CSE-ConnectionGUID: V4qmHk2fSy6baH4dWzzwjw==
X-CSE-MsgGUID: k32dBK8jQ6S7eYfcSsxT1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="173360397"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="173360397"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:42 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B3D5DB3C1
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:39 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7BA8DD5109
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0F9DD21FC6A
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AF6291A000A;
	Thu, 19 Sep 2024 11:32:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/28] python3-yarl: upgrade 1.10.0 -> 1.11.1
Date: Thu, 19 Sep 2024 11:32:10 +0800
Message-Id: <1726716733-14548-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10--2.184600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrC8LXg/kJ8lAsAkOSASMZR76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIOmHqf6ZGvCR1vZ
	7s3YIVDKIp/k2x3jvkRAISLmT6dDEHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6lOU
	UDpMdd9AANgkMpQOaTMkHjm6pIS4hCqWHbWlPecY9C51MINjpE/5yHwlE7/jAbyqEbS0zfMo7Cs
	di1NnpA8v9K67qHTtWCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112383

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Allowed scheme replacement for relative URLs if the scheme does not require a host
- Allowed empty host for URL schemes other than the special schemes listed in the WHATWG URL spec
- Loosened restriction on integers as query string values to allow classes that implement __int__
- Improved performance of normalizing paths

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-yarl_1.10.0.bb => python3-yarl_1.11.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.10.0.bb => python3-yarl_1.11.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.10.0.bb b/meta-python/recipes-devtools/python/python3-yarl_1.11.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-yarl_1.10.0.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.11.1.bb
index 0ff3041db..37d77b718 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.11.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "3bf10a395adac62177ba8ea738617e8de6cbb1cea6aa5d5dd2accde704fc8195"
+SRC_URI[sha256sum] = "1bb2d9e212fb7449b8fb73bc461b51eaa17cc8430b4a87d87be7b25052d92f53"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.34.1


