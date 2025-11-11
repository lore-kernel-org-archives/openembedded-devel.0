Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 901A2CD13D8
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 07:55:46 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12751.1762847744089550191
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 23:55:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=d1DDl/ir;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762847744; x=1794383744;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+0VwIsVKUraJy5DXQiimhujQIoQZd4yXtfoWy7vdlw0=;
  b=d1DDl/irpLZBsdBAiKp4p0IDmXjyXEgF6joVrLlC3ySBCbYZmMo+Tm6/
   Wox37e2Qe92+SzesK7HvXV5m89unZf8Uvrz/vxY2p/r7GARcbfaYHnV0F
   aIx43DMlg4dWdpcmaIQ6ZfLrz+BHAYwfLRlc6Z3LCyISH4tX5JqTxlQ2O
   HwtiSWG55fqJ7Qaxbxdo4Z7bWcz5c53O3HyAtke56WfsvDm7X5+rOrcVm
   q9JhMKFjoVvSPY+3r8xz2FsrnpCBy7nQPEbYXsdQwII8sYjj6x+brSVc2
   cm8mTbdXqROUB7wT8andzfOEbagmanhiiN/ILAkS4anLAZTQhtxBsqr+R
   w==;
X-CSE-ConnectionGUID: DuYcwFE5So+qfdCAC4jZnA==
X-CSE-MsgGUID: qVuGpDI4Q+CiKWg6OnBDRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="222576629"
X-IronPort-AV: E=Sophos;i="6.19,296,1754924400"; 
   d="scan'208";a="222576629"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:55:42 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 6E251188B
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:42 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 2EE9110001EE
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id BEE3C1802185;
	Tue, 11 Nov 2025 07:55:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/23] python3-bitarray: upgrade 3.7.2 -> 3.8.0
Date: Tue, 11 Nov 2025 15:55:04 +0800
Message-ID: <20251111075517.1650-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251111075517.1650-1-wangmy@fujitsu.com>
References: <20251111075517.1650-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121489

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* add experimental support for free-threaded builds (GIL disabled)
* remove '_set_default_endian()'
* add '.__bytes__()'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_3.7.2.bb => python3-bitarray_3.8.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.7.2.bb => python3-bitarray_3.8.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.7.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.8.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-bitarray_3.7.2.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.8.0.bb
index 0ded3c3bd2..4cacd79522 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.8.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6abe80c028e4ee53045a33ae807c64fd"
 
-SRC_URI[sha256sum] = "27a59bb7c64c0d094057a3536e15fdd693f8520771ee75d9344b82d0a5ade2d0"
+SRC_URI[sha256sum] = "3eae38daffd77c9621ae80c16932eea3fb3a4af141fb7cc724d4ad93eff9210d"
 
 inherit python_setuptools_build_meta pypi
 
-- 
2.43.0


