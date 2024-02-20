Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E9EC5478A
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:14 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.9340.1708419304857475840
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:55:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jBTMZxoH;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419304; x=1739955304;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1rthW3A88KUXZ4EHyrpGkdYw9pxkDF8UsV2zEE95A+g=;
  b=jBTMZxoHsQk/fgf5U6dnueZHVGJsZgBi7pRSDx7L7S59P6/X1hbJPzTy
   grVA7XRFcKg5ZlCPN50L4DFRPL2L0rZMYhPad9DurTGwevqXenNKPzP/O
   HD0ykFWE9J2HTniZYEzpP4qYvoicX3pinT9tqNZ91EdJ5LDwYAR7vyv92
   /LVqQ+oqBdUY7fu5mwrepJp2JT5Wa+xHh1wyNp+WrZL2/Whdd4nmrqWcC
   5Ac1V9ZrQVutFqFpuiu8NIK15gitR5syzz+p68dqIca0ECdXriGmydBtQ
   TTKjVo3qSOLQibjiHy4j1fPjQ0zaVGgAFqFydhakG3uOtwyDLLxPjos1h
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="137518849"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="137518849"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:55:02 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 414661F4752
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:55:00 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7ADDCCF7D2
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0DAE5200A7687
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AE2E21A006B;
	Tue, 20 Feb 2024 16:54:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/26] python3-zopeinterface: upgrade 6.1 -> 6.2
Date: Tue, 20 Feb 2024 16:54:38 +0800
Message-Id: <1708419281-26047-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10--0.037000-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mregIHHX2L4Yw3KP3mZa+qgeWK
	hkPxF9XA4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2ZjmdWmKHGLD4Yy
	coNpBJWCa7IVNHJKd7tOq8pg5T0yx5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2mZ3
	96Gt5HhcWEToV/vUK53dtOBHnuevLIIH5IFTqeWUXkr1nyQoU3RDzQJp3+IZJu8Dk8ofxNAjGbA
	PlQ8e2S0TYiX3LRK9716kpkggCR2vIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:55:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108944

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Add preliminary support for Python 3.13 as of 3.13a3.
-Add support to use the pipe (|) syntax for typing.Union.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-zopeinterface_6.1.bb => python3-zopeinterface_6.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zopeinterface_6.1.bb => python3-zopeinterface_6.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_6.1.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_6.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-zopeinterface_6.1.bb
rename to meta-python/recipes-devtools/python/python3-zopeinterface_6.2.bb
index 07e329a4a..eb20d21d4 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_6.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423
 PYPI_PACKAGE = "zope.interface"
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "2fdc7ccbd6eb6b7df5353012fbed6c3c5d04ceaca0038f75e601060e95345309"
+SRC_URI[sha256sum] = "3b6c62813c63c543a06394a636978b22dffa8c5410affc9331ce6cdb5bfa8565"
 
 PACKAGES =. "${PN}-test "
 
-- 
2.34.1


