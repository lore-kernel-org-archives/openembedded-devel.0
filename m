Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D0ABCA1013
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.7943.1756890238884739992
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mlfFKZdW;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890239; x=1788426239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R1PAD2ikVtvXm5uEDVvxMBofMWZFyILWvKtI/i5r2vo=;
  b=mlfFKZdWHx4iF5+jUTm0Z4umuGuGyv4vFv3BhWQ1nxqXUh9yFBr0P5fc
   rlpLxe09iFt0FTX250Dq4nMkT4rBZiTxdeupvajgnSTKJsSUEmiWb4sUK
   f057/b/cQjOl8CFn51J55tV3hYLlfCAShTgp3a2ClthvMNIGYEOTppeWD
   a1/NAgUzcM/BlLSDp1NCIzgPnKMUcCQRwEE0uJ6no6YUsj39UfkVb+O+f
   uQJc2gPUiF06mzB4eBFEmi4cflHrPOKvhf8ptOFi58Uv6y3aRc7YoKM8c
   Km4TlXeSfghOXAlc4dBzdEq6g2wunc5Kgt+/yygZO/EncDbnLK3S+p34J
   w==;
X-CSE-ConnectionGUID: pG/g6VEKReCtIRlAedXRPw==
X-CSE-MsgGUID: EkM59nusSg2UhVX8nK10kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="214919195"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="214919195"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:58 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 7BC47189F
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:57 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 306571800D7E
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:57 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 0A5538212E7
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 01E041A0069;
	Wed,  3 Sep 2025 17:03:51 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 46/56] python3-pyzmq: upgrade 27.0.1 -> 27.0.2
Date: Wed,  3 Sep 2025 17:03:07 +0800
Message-ID: <20250903090317.2002-46-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119245

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyzmq_27.0.1.bb => python3-pyzmq_27.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_27.0.1.bb => python3-pyzmq_27.0.2.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_27.0.1.bb b/meta-python/recipes-devtools/python/python3-pyzmq_27.0.2.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-pyzmq_27.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_27.0.2.bb
index 8a66c852ad..6607b7c34d 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_27.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_27.0.2.bb
@@ -29,7 +29,7 @@ SRC_URI:append = " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "45c549204bc20e7484ffd2555f6cf02e572440ecf2f3bdd60d4404b20fddf64b"
+SRC_URI[sha256sum] = "b398dd713b18de89730447347e96a0240225e154db56e35b6bb8447ffdb07798"
 
 inherit pypi pkgconfig python_setuptools_build_meta ptest cython
 
-- 
2.43.0


