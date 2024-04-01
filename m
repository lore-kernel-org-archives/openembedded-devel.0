Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E71DACD129B
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:43 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.39475.1711983096554025796
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Jgviu8jg;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983100; x=1743519100;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4mMZ/sh0mA1ZldX4690B6rzJARnB2z0Ji96q31Rcg4A=;
  b=Jgviu8jg6+Dd/Djxn60oi3JZr0cJ06zjV2UwG8Dn3ofwuomZvwZfE2eq
   BLgymbSb4u5RqnDZuF8p961RMdHxRzeg47qKHoC5wRDmHpTzabNCdw+pB
   uJOBNaeIUJk3LO9O45C4BRNftrBsr7uk9deUdWH/pFKhCTK2brxN+eEN6
   9C7Weon4oVxYCjbcAVvIYNflQ82VMhd1LuALVgLr/IfKtijS67v7DDUph
   sCqX1lRjJ2jiFNeLKv8N4PcqBzoT43DOjyfkGUV87FphSjHhK6LA2nln3
   MpwxSFBblLkhAHiLHstTftCdr9+Gkvoa1vMuzWY7CNmbb6ScE3tCM6DPK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="142720330"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="142720330"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:39 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E3F31D3EAC
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:36 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 25C83CF7C2
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A610020093240
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5C42B1A000A;
	Mon,  1 Apr 2024 22:51:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/47] python3-graphviz: upgrade 0.20.1 -> 0.20.3
Date: Mon,  1 Apr 2024 22:50:55 +0800
Message-Id: <1711983079-16849-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--5.435700-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/ySAWHOR37+ATpxAd6mi1Ga3Lzkqa1nfy/9nf
	JrUSEbFDTwauhvLbn2Dn0mg1/wVEeLvGEmcXHXAmqoeab9Xgz89/rIgn/0CiUwvrbFcH4G2rrdW
	eE/Aktywkw8PwVHl/nwXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZ7tatJRek2hQAe9
	bQqNv9QVjkSH9LOiJWmdusBrWLzNU7BOj1lchJLN0KiTeJteVBfS0Ip2eEHnwj/1Rbkzl1EymDn
	I5x2hWCjoczmuoPCq0UHnxDDUS7pGxXTa8EcAFVycDr8Kg3Mq4W8VD8ay25PV240ODfvUjx
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109740

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright updated to 2024

Changelog:
===========
-Revert improvements to the internal tools.deprecate_positional_args() decorator
 that caused false positive PendingDeprecationWarning: The signature of ... will
 be reduced warnings that have been misinterpreted in the 0.20.2 release process.
-Drop Python 3.7 support (end of life 27 Jun 2023).
-Tag Python 3.11 and 3.12 support.
-Add caveat about labe escaping/quoting to .node() and .render() API docs.
-Document that doctest_skip_exe() lines in doctest should be ignored.
-Improve internal tools.deprecate_positional_args() decorator and fix incorect test assertion.
-Update GitHub actions.
-Pin pytest test dependency to <8.1 as a workaround for import file mismatch
 error related to conftest.py files, in pytest 8.1.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-graphviz_0.20.1.bb => python3-graphviz_0.20.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-graphviz_0.20.1.bb => python3-graphviz_0.20.3.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-graphviz_0.20.1.bb b/meta-python/recipes-devtools/python/python3-graphviz_0.20.3.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-graphviz_0.20.1.bb
rename to meta-python/recipes-devtools/python/python3-graphviz_0.20.3.bb
index d381699a8..0fd81b0ee 100644
--- a/meta-python/recipes-devtools/python/python3-graphviz_0.20.1.bb
+++ b/meta-python/recipes-devtools/python/python3-graphviz_0.20.3.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "Graphviz protocol implementation"
 HOMEPAGE = "https://graphviz.readthedocs.io/en/stable/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=951dd0868a9606c867ffda0ea3ea6da2"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=bcdc1cf20245c598f9a563b550605785"
 
-SRC_URI[sha256sum] = "8c58f14adaa3b947daf26c19bc1e98c4e0702cdc31cf99153e6f06904d492bf8"
+SRC_URI[sha256sum] = "09d6bc81e6a9fa392e7ba52135a9d49f1ed62526f96499325930e87ca1b5925d"
 
 inherit pypi setuptools3
 
-- 
2.34.1


