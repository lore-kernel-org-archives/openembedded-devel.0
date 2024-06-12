Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB0C0C2BD09
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:46 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.2430.1718161117886735695
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fYXPQ6tN;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161121; x=1749697121;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7uTr5BbuSbUv4N87TXl/lE7KlqwDuwwUXYzWr6RkXVc=;
  b=fYXPQ6tNVv0w6V5WQt5kkVbEqnxzJ0TjP9HER5gbnO8prJa/qxXGMLtC
   fUZ8LJxewO2nIUD0iO/kD7vmBOadMkijsiKWGVhI91yLDUi8vNiEsM+nB
   SCBU/2AIxnIAnMCHLmg1YhBHKO1mMTqAyz6UpSgZ2PZoKccuugFaJhAON
   2VB9ri7jAlUyxIf314M0VBR+eTdaBteJmHskxp2nvlJRYePBL+tDycoYX
   FZJ3BohKvMLzbfj5rpbnsLZQHkgVWXLsM7iXwg6BAoO7BbONgouOr4EfO
   ZHCPsw9Kpm46tD1DwTovgfAI0MFnfcRO9RWvBIjSrajfWq4oLc/luzNyC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="151034567"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="151034567"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:39 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B01BFC1496
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:37 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 024DFBDC95
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 610D6E290B
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0DBDA1A0002;
	Wed, 12 Jun 2024 10:58:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/43] python3-future: upgrade 0.18.3 -> 1.0.0
Date: Wed, 12 Jun 2024 10:57:42 +0800
Message-Id: <1718161096-29710-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10--1.834200-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yXg2y0j5vXZGlEDhvi2wR879wRnyxuPjhIVD
	0TJVgsKEjDVMw6TJvuFzFYvwgunzdnKeD88zx4xBA9lly13c/gFm8qF4pBsxHwfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmi7IWnvto+9Z1rzsINdopFUvioIsi7Sa0gYA3qL69rXq7Tz3
	WZR30lVGNw6d41LPEFgDLqnrRlXrYbaLjLw/bFed0H8LFZNFG76sBnwpOylLORpssGOndexaIX6
	imnxjAu3UZhcOQZZvONAF1y24hfkkStZkArqBjLEzTUAPcinzsDt8znc2VDDiyJKchoRxtUHsxQ
	WKgQ0OGIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110845

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

Changelog:
==========
- Small updates to the docs
- Add SECURITY.md describing security policy
- Fix pasteurize: NameError: name 'unicode' is not defined
- Move CI to GitHub Actions
- Add setuptools to requirements for building docs
- Fix typos in docs
- Make the fix_unpacking fixer more robust
- Small improvements to shell scripts according to shellcheck

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-future_0.18.3.bb => python3-future_1.0.0.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-future_0.18.3.bb => python3-future_1.0.0.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-future_0.18.3.bb b/meta-python/recipes-devtools/python/python3-future_1.0.0.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-future_0.18.3.bb
rename to meta-python/recipes-devtools/python/python3-future_1.0.0.bb
index e4a4b5c19..eb66a7d33 100644
--- a/meta-python/recipes-devtools/python/python3-future_0.18.3.bb
+++ b/meta-python/recipes-devtools/python/python3-future_1.0.0.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "Clean single-source support for Python 3 and 2"
 HOMEPAGE = "https://python-future.org"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a253924061f8ecc41ad7a2ba1560e8e7"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ce268d4c2f911490f47ac5473a24bb89"
 
-SRC_URI[sha256sum] = "34a17436ed1e96697a86f9de3d15a3b0be01d8bc8de9c1dffd59fb8234ed5307"
+SRC_URI[sha256sum] = "bd2968309307861edae1458a4f8a4f3598c03be43b97521076aebf5d94c07b05"
 
 PYPI_PACKAGE_HASH = "99abde815842bc6e97d5a7806ad51236630da14ca2f3b1fce94c0bb94d3d"
 
-- 
2.34.1


