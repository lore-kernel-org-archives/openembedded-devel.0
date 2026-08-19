Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19990C5DF8A
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:01 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3258.1787132144375481651
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qlv9b7KX;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132159; x=1818668159;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WkU/v9PvtHo9Q5kffQIXnkmMNl2aQE0d8tKfvwszdoc=;
  b=qlv9b7KXVoGVYjXaXDIL1pRE2zxFekLi9pOm3yoB9peHoASw/5sT9Uft
   FS7PnrrgJNDWvINQo+UFsPm+088R7J1X67bdIuwA5ZZQYmmJiwG8+y5hJ
   7jGxWESv0wDmYucG6wWML1Et0KGqp2hRrjIlMADYfEtp3AKpY/rDVpdeA
   Zmh59tE6ZwU7DUvqpTDlQ7IqicFFiwvcDpkHztOsN37l2/OrgT3LAvilO
   2eVnCXmu2jL7UFrDf5OkM1CC3G8NVQcnp6Drt0891wivrflC/W67CKatj
   m+6ayZNfy+YPVwWG+Cx/xiMsSeuASkxz6VCs71y+IgB20cMAUxCpobB8L
   w==;
X-CSE-ConnectionGUID: NQhnpZouSnaDjzLjZ+kzpw==
X-CSE-MsgGUID: 7kEvsA0pQ86SPcuDK6SeAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="255507819"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="255507819"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:35:59 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 3AF8A3FE1
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:55 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E117EC013E2
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id C69021801C23;
	Wed, 19 Aug 2026 09:35:52 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/70] python3-bitarray: upgrade 3.10.0 -> 3.10.1
Date: Wed, 19 Aug 2026 17:34:24 +0800
Message-ID: <20260819093514.1101-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129290

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* move internal tests for 'util._Random' class into 'devel/test_random.py'
* add debug-mode introspection and tests for 'decodetree' structure
* fix 'util.pprint()' for very narrow output widths
* substantially simplify 'util.ba2int()' and 'util.int2ba()'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_3.10.0.bb => python3-bitarray_3.10.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.10.0.bb => python3-bitarray_3.10.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.10.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.10.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-bitarray_3.10.0.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.10.1.bb
index d61b280298..f6516b1833 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.10.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6abe80c028e4ee53045a33ae807c64fd"
 
-SRC_URI[sha256sum] = "d8f8dbcda062ea59b3a6d5233b5a9b67f6bf58c1418ad8f418c5138361f9f068"
+SRC_URI[sha256sum] = "c33e48906407ab3d0edb96cc5ab2a599bda5dd04704ebcd9b3e0eedce7310e0a"
 
 inherit python_setuptools_build_meta pypi
 
-- 
2.43.0


