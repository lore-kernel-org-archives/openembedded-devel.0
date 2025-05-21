Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5DE8C54F32
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:05 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.6713.1747817996313122889
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 01:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WaurBegf;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747817996; x=1779353996;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=yy8lCjG6mvLVsOzh8Sz533zJuBrK9ce2uMiNYJ3bZxk=;
  b=WaurBegfhKVBhca4tWabQoe/HrKQ8vYXqwtN8sJMN9Lwcg6IqyqwdRDd
   4xyEK6YHRWx5rJPxtkWauEBdhLmiuTBapFhatOx1/O5qpjIlAO3bBkvAM
   eSmNJQfyF9+EUyzvxr+EIpHx6kVI52G482x9QjruEL4HALGmm5m3Jueq/
   bcVpExaScyKwUGuwO3V2C2MZvWOKguWwcdLlgCoJ3ZBcnbA7X+H9M3+lf
   zVUjfVI6/CN1SWGvt5JTbl4CYS2zR+ZqhJxVyhy0PTSILankAwEILhgRS
   FZkHqnZwse5gV0id/P1I5KDIR92c17ouBdwkwMtkQg7rhlvbUgoYbibc7
   A==;
X-CSE-ConnectionGUID: n3Vr1GAWRPWcG0kMLbVEKw==
X-CSE-MsgGUID: KnR1yn2wT42AcLEVUGia/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="188581259"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="188581259"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:59:54 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id EE0D3D8E67
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id ACBE9D8B94
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:51 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3EEFD1A00A1;
	Wed, 21 May 2025 16:59:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 04/43] python3-bitarray: upgrade 3.3.1 -> 3.4.1
Date: Wed, 21 May 2025 16:58:53 +0800
Message-Id: <1747817972-28874-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117531

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* add 'pyproject.toml'
* implement 'bits2bytes()' in C
* optimize 'delslice()' when 'step' is larger than about 5
* consistently name '*_span()' and '*_range()' in C for
  invert, set and count
* organize and add tests
* remove '.endian()' method in favor of data descriptor '.endian'
* allow bitarray initializer 'bytes' or 'bytearray' to set buffer directly
* allow calling '.extend()' with 'bytes' object (although the only
  valid bytes are 0x00 and 0x01)
* add 'util.byteswap()'
* add 'util.correspond_all()'
* fix '.reverse()' for imported buffer
* drop Python 3.5 support
* add tests
* fix off-by-one-error in check for length of count argument
  in 'util.canonical_decode()'
* simplify 'util.int2ba()'
* add tests
* add [masked indexing example](../examples/masked.py)
* add [tricks example](../examples/tricks.py)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_3.3.1.bb => python3-bitarray_3.4.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.3.1.bb => python3-bitarray_3.4.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.3.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.4.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-bitarray_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.4.1.bb
index ccb0238382..01030b43f7 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.4.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6abe80c028e4ee53045a33ae807c64fd"
 
-SRC_URI[sha256sum] = "8c89219a672d0a15ab70f8a6f41bc8355296ec26becef89a127c1a32bb2e6345"
+SRC_URI[sha256sum] = "e5fa88732bbcfb5437ee554e18f842a8f6c86be73656b0580ee146fd373176c9"
 
 inherit setuptools3 pypi
 
-- 
2.43.0


