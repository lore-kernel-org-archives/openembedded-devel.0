Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59189EDE99E
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:43 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.18336.1725959012835706305
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mIwnVFS8;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959014; x=1757495014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=UrQXyYIXomTWiGc6uQ5Rh7QNCadgIH3D10imIqnz2QY=;
  b=mIwnVFS8pZdxtfL/fzANs6Vu4bhh6LPuD5ejnP7Iunrb2WExVGScsuMP
   i7962HtagTcYASQ+GZtlybEEi8l/CJQcZd6I7X7YgYWv4qN0JsuQvncKz
   U4VjYnOTYIT3u+DHdOn5Keetn4I4eY+RUALQmygShcvPYe6JXV9wnENhx
   JFCFoQJXMbXeIbb8cY8qz0vC8mLn+gnjfsIfJilEtZeXWUtSxJEDXq1hU
   iPiIe36cfRGEvbWQBQVchX0rRLsRReTGcgsbOc5iCNTraaFV1ySrSEPgD
   gE79Cl9X3lImvNAxF+PWV5uoaq1FnJe5sK+MA2cujo0h3Gox0kWlItppY
   w==;
X-CSE-ConnectionGUID: Hw83ljfOT7+f1y9tUXmb3w==
X-CSE-MsgGUID: X17WOvvxSqGk7SM2zjycgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="173393781"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="173393781"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:33 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 25B07C68E2
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:31 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 68A16D3F0D
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 02630200894AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A9C911A01E9;
	Tue, 10 Sep 2024 17:03:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/42] python3-scikit-build: upgrade 0.18.0 -> 0.18.1
Date: Tue, 10 Sep 2024 17:02:59 +0800
Message-Id: <1725958990-5719-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10--3.209600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrtwvME24mZU5s1Ir4NZzFmglL
	L5sqnwn2kPI1/ZdqoS07blYJVFl87+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ6Po
	oNqqZn93i8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFDnVudZMGE93pEtu5pyq7+fqrz
	6bPy2ndmL+c6kVgRj4475LXseU2i97h8CtieDWlazfz7ViuC3W7FHQtlhDXSMBTIEWae3uuex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112215

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Support for setuptools 74
- iOS and Android support
- Fix for distutils change
- Remove test directives

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-scikit-build_0.18.0.bb => python3-scikit-build_0.18.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-scikit-build_0.18.0.bb => python3-scikit-build_0.18.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-scikit-build_0.18.0.bb b/meta-python/recipes-devtools/python/python3-scikit-build_0.18.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-scikit-build_0.18.0.bb
rename to meta-python/recipes-devtools/python/python3-scikit-build_0.18.1.bb
index 2351b697d..eacd67a05 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build_0.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-scikit-build_0.18.1.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "scikit_build"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "71a13af467d1a38510c3494786e2edb73ead53ea922bde6e519dc5372aa65096"
+SRC_URI[sha256sum] = "a4152ac5a084d499c28a7797be0628d8366c336e2fb0e1a063eb32e55efcb8e7"
 
 RDEPENDS:${PN} = " \
 	python3-distro \
-- 
2.34.1


