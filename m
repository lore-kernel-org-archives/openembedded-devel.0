Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C3DE75444
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:14:50 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.117315.1766567682154704725
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:14:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Gv1Z6ZWo;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766567682; x=1798103682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tQssywzKq7lhof2z75YogQTu//jCJnLeHD9VJQavzCs=;
  b=Gv1Z6ZWoOxC+oHamXWP7sSXS7n3x7aI/sKiZ+60Dc12HGCRDA2zS9M+A
   KIt/sN2TeZK14IQCVmzIa/iWBU4EVfKq48zJe4Xo5Gm8pKuntnf7nvx6j
   x2u1oWlSSIoqNPvp6f+OyRcBKwjHoAp9Fcym/YVZ+HixjKrwKmzgmqxcg
   GxxJ7YI9jxBPdmZXROlzVdIZZwg4zEa/KgJpq/skwjlDADO8KMCIzxU1Q
   Hu50nPj7sQGTq7gYYj9pJMIhyzQH29kVLmxJsDL8uEo9Nnonik1NjOohp
   vno58Mmn8Coejndu5J0sjExaEsSEJKVfqZlYxCN7k3mEY1ovCuFYomd9x
   Q==;
X-CSE-ConnectionGUID: mS5hORWwReaPZxWeLMz2/g==
X-CSE-MsgGUID: WwMQr9ZFSBWhCHI/kTxKRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="224409986"
X-IronPort-AV: E=Sophos;i="6.21,173,1763391600"; 
   d="scan'208";a="224409986"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:14:40 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 9823482073B
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:40 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 515DF18000B5
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 870B82000763;
	Wed, 24 Dec 2025 09:14:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/28] python3-smbus2: upgrade 0.5.0 -> 0.6.0
Date: Wed, 24 Dec 2025 17:13:00 +0800
Message-ID: <20251224091304.974-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251224091304.974-1-wangmy@fujitsu.com>
References: <20251224091304.974-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122873

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Python 3.14 added.
- Fix SystemError: buffer overflow on Python 3.14+ on 64-bit systems by using
   c_ulong instead of c_uint32 for I2C_FUNCS ioctl.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-smbus2_0.5.0.bb => python3-smbus2_0.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-smbus2_0.5.0.bb => python3-smbus2_0.6.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-smbus2_0.5.0.bb b/meta-python/recipes-devtools/python/python3-smbus2_0.6.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-smbus2_0.5.0.bb
rename to meta-python/recipes-devtools/python/python3-smbus2_0.6.0.bb
index dc73f915e0..33613d9abe 100644
--- a/meta-python/recipes-devtools/python/python3-smbus2_0.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus2_0.6.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2a3eca2de44816126b3c6f33811a9fba"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "4a5946fd82277870c2878befdb1a29bb28d15cda14ea4d8d2d54cf3d4bdcb035"
+SRC_URI[sha256sum] = "9b5ff1e998e114730f9dfe0c4babbef06c92468cfb61eaa684e30f225661b95b"
 
 CLEANBROKEN = "1"
 
-- 
2.43.0


