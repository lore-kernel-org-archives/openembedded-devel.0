Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E63DC3DA63
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:05 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.33825.1721034176804143516
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NPAjEISX;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034182; x=1752570182;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Q8Jpi0i6rerwxn5GxpC4kjgnNa0oBVuqMdQhiIdn+1M=;
  b=NPAjEISXebYdYoaEHRe+SD7AtEUquKqmZtWwub20LLCwlouG+9MJIyid
   jYoLo+o7zKetXY99DOKdc6yr9xRrMkuJTtuWL0ZdRe/y4xAMAEUEvddV/
   +TxS0rZr4k432RBX+iYQi9YLW7m7Z/Hm3/mu+VvQO1RmTUbyaXsnM1kxY
   SkKcO4+gDv7WeGjizzOqNJ9bWln0zy9L3BGeZwgiEs7pbX0USsYni2tRV
   0UoUsjfOS5xbbXAh2dBvfmRHh1XKdKj3vEmUg8rcutNNXO1zJCyenOwMq
   PWmTkEVy04zdkzCT2KGwJVNEjBPAseEcWpLLF8yZs79A2BW44iyPrenjv
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="154933601"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="154933601"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:03:01 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4DF0FD29E6
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:59 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9148ED8B01
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 253286BE53
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C644B1A000A;
	Mon, 15 Jul 2024 17:02:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/38] python3-types-setuptools: upgrade 70.1.0.20240627 -> 70.3.0.20240710
Date: Mon, 15 Jul 2024 17:02:22 +0800
Message-Id: <1721034151-540-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.005
X-TMASE-Result: 10--0.562500-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mr8ej03A8UqeVMotU/QFIFG2Uz
	B7Xp5yOCNscteyNb+fhQtsMBCXfG8226GIB67GXyA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnp5g9gYJWDLpq8+q/dfv9c7Cl8sx4HBG30tCKdnhB589yM15V5aWpj6C0
	ePs7A07Zbv1Srwoyj1ES45oQM8aDOEq6CzBK2QkoLjKCSEoRAXvOd5GqACa+B3N5GJLBFDjpaqh
	cnkFZhQgom78ZPMzSNjk9zf0AU315veSLEI9u3k8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4A
	EOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111347

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Support for loading distutils from the standard library is now deprecated,
  including use of SETUPTOOLS_USE_DISTUTILS=stdlib and importing distutils
  before importing setuptools.
- Bugfix for building Cython extension on Windows
- Updated distutils including significant changes to support Cygwin and mingw compilers.
- Fix distribution name normalisation (PEP 625) for valid versions that are not canonical (e.g. 1.0-2).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ....20240627.bb => python3-types-setuptools_70.3.0.20240710.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-setuptools_70.1.0.20240627.bb => python3-types-setuptools_70.3.0.20240710.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-types-setuptools_70.1.0.20240627.bb b/meta-python/recipes-devtools/python/python3-types-setuptools_70.3.0.20240710.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-types-setuptools_70.1.0.20240627.bb
rename to meta-python/recipes-devtools/python/python3-types-setuptools_70.3.0.20240710.bb
index 6e2c6a70f..b461e7445 100644
--- a/meta-python/recipes-devtools/python/python3-types-setuptools_70.1.0.20240627.bb
+++ b/meta-python/recipes-devtools/python/python3-types-setuptools_70.3.0.20240710.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=ef4dc1e740f5c928f1
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "385907a47b5cf302b928ce07953cd91147d5de6f3da604c31905fdf0ec309e83"
+SRC_URI[sha256sum] = "842cbf399812d2b65042c9d6ff35113bbf282dee38794779aa1f94e597bafc35"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


