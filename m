Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F44CD98F7
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 08:58:38 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11266.1781686715732472523
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2026 01:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jMrFrDMB;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781686715; x=1813222715;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6NcxZKrtZvsGjvW2jSPrLAc5+Xu1MNRrdJn5FVGMxNQ=;
  b=jMrFrDMBb6xvd9dkniIbU4GEqHRB0PWGdJmjQM2e0C0UEuDF0IDr7oTo
   EWxHN0dFlyTZyr4XfT3BS3XyMeCboL3an1S8ch8WOOJGsTHw8x23CUUHj
   OLzekwVmtrX2ZVnbum0Xeg95UlhpUP0TsAN3b5nYFBujDtbLeRoeLAXuC
   1gr4G6LN1pzusnH74E3b/kqbDBgFW+N+1GdJ6K73cLKFhnqUh6R5It3hl
   7XLF242XveJZIyOocdSFyu+Vk5QDEnBmi7OYKgUDCdVnzPfSUiypJ0ygq
   BdLzh0l2llBOmhQRhoCdJcUfy/xjAVF5YVc8Cmgp/vqMJSxr6Eb9kjWGQ
   g==;
X-CSE-ConnectionGUID: l4Ux59e0Q4azoAQ2/cNFKQ==
X-CSE-MsgGUID: 60XP/VWxSvqtaJ5jQ01mMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="223301148"
X-IronPort-AV: E=Sophos;i="6.24,209,1774278000"; 
   d="scan'208";a="223301148"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 17:58:34 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 0C631820083
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:34 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id BB504968469
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id E80561000A47;
	Wed, 17 Jun 2026 08:58:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/17] python3-msgpack: upgrade 1.1.2 -> 1.2.0
Date: Wed, 17 Jun 2026 16:58:02 +0800
Message-ID: <20260617085807.542-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260617085807.542-1-wangmy@fujitsu.com>
References: <20260617085807.542-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127649

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Support free threaded Python. #654, #686
- Dropped support for Python 3.9. #656
- Fix missing error checks in C code. #665, #666, #667, #672
- Fix strict_map_key option didn't work for object_pairs_hook. #673
- Increase DEFAULT_RECURSE_LIMIT of Unpacker to 1024. #676
- Fix memory leak when Unpacker returns error for invalid input. #671
- Fix Packer.pack_ext_type() ignored autoreset option. #663
- Fix Timestamp.from_datetime() returning wrong value for pre-epoch datetimes. #662
- Fix use-after-free in unpackb() and Unpacker.unpack() for non-contiguous input. #677
- Fix possible memory leak when calling Unpacker.__init__() several times. #687

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-msgpack_1.1.2.bb => python3-msgpack_1.2.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-msgpack_1.1.2.bb => python3-msgpack_1.2.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-msgpack_1.1.2.bb b/meta-python/recipes-devtools/python/python3-msgpack_1.2.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-msgpack_1.1.2.bb
rename to meta-python/recipes-devtools/python/python3-msgpack_1.2.0.bb
index 5b201a7554..079730d18f 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-msgpack_1.2.0.bb
@@ -6,7 +6,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 PTEST_PYTEST_DIR = "test"
 
-SRC_URI[sha256sum] = "3b60763c1373dd60f398488069bcdc703cd08a711477b5d480eecc9f9626f47e"
+SRC_URI[sha256sum] = "8e17af38197bf58e7e819041678f6178f4491493f5b8c8580414f40f7c2c3c41"
 
 RDEPENDS:${PN}:append:class-target = " \
     python3-io \
-- 
2.43.0


