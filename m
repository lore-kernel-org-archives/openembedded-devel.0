Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD4BC2BB9A
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:57 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.2493.1718161130528599590
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Wkg6X4rC;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161130; x=1749697130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=PkgSfTimddbPwi0ENGqgr/OcVbJPWM9uj+6PWqO5Ras=;
  b=Wkg6X4rCifStBxsiAL5jlcwwrfSVkAml+q4CZMCcTYY08eThCkWshufP
   w77WuOQBaOokX5f317BmfWmrzWhme923cVltmeADwn0HdlWTKuujpAgiU
   UW7tQvYScXhVdfO7xpkz5MhnO9grFllhbvPRBzNgxa9SjA2ivaKqDy8/9
   bgfP//RuA3/RjDXkOhHWLb3Hd3kQCUfwSW7ZryKbv5EomsGoBDrWnbzLo
   U7una1gaapyMTUByllRv8G84SFreOaOCZmRXBP87VLjUb8Nzt2HyByuZY
   ndbiQU8WDu9eHAP8crX/CPVoMioLLJw0InXc+eCkjR6cFHKbrikjCDHIG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="141617823"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="141617823"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:47 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B5A33C9446
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:45 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 01B2BD3F1B
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6D99D20071A06
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 166581A000C;
	Wed, 12 Jun 2024 10:58:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/43] python3-pyyaml-include: upgrade 1.3.2 -> 2.1
Date: Wed, 12 Jun 2024 10:57:59 +0800
Message-Id: <1718161096-29710-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10-3.382200-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mrMVx/3ZYby7/ozDhGeQC9Eg/D
	Z+ACFMnI20LJwH8Y3EWkkeCG6SYiOXMTV8jo3aw7uce7gFxhKa0E9jhJ6ArePBAWKUxS1eDig9x
	e4gtUJtqTHhr/k/Hv+uy+BhcaAeRuNq95An4vAG+XmVAzMqYX0tXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpiAH/xyJs7whjOtS99eBvZ8DsKXyzHgcEbguwtqyXlE6E/p2KUR7RZU6PFj
	JEFr+olGF878ceIunLkwjHXXC/4I8ZW5ai5WKlyCa1eeRi8YAPlEjvnsCtP66Chyq8TwPoJPjQF
	VngBbD2jOZMj7yrXJFh2s1K6bCEZeElBYzy97Vjd2+WkXsBYcMmJQE7qNnWu/r/b+dmSKFo6AH9
	/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110865

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Remove custom PyYAML types definition module, use that from types-PyYAML instead.
- Add mypy hook in pre-commit
- Better type hints/annotations
- Better type hints
- Some optimizations and bugfix
- Add py.typed file, make the package PEP-561 friendly
- data-class attribute order changed in yaml_include.Constructor
- namespace changed to yaml_include
- Data class for include statement.
- autoload attribute for Constructor class, controlling if open and parse including files, or return a Data object.
- Representer class for YAML dumping.
- load and lazy_load function - recursive open and parse for Data object.
- Custom loader
- Introduce fsspec to open including files. Now we can include files from local filesystem, s3, http, sftp ...
- New parameters for the tag in YAML
- Drop python support blow 3.8
- The tag constructor class YamlIncludeConstructor renamed to Constructor
- Readers for JSON, TOML, INI ... YAML only now
- The argument relative and encoding was removed from the tag class's load method.
- Anchor (Maybe recovered in future)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-pyyaml-include_1.3.2.bb => python3-pyyaml-include_2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyyaml-include_1.3.2.bb => python3-pyyaml-include_2.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb b/meta-python/recipes-devtools/python/python3-pyyaml-include_2.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
rename to meta-python/recipes-devtools/python/python3-pyyaml-include_2.1.bb
index 3a5bd99a7..f989f4c25 100644
--- a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/tanbro/pyyaml-include"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS += "python3-setuptools-scm-native"
-SRCREV = "36b6975aa8fc7a6cbf37de40aa2ed6d996b2f7be"
+SRCREV = "dc16153b28f5cab997814c0ce9b43dc4c58507e7"
 
 SRC_URI = " \
             git://github.com/tanbro/pyyaml-include;protocol=https;branch=main \
-- 
2.34.1


