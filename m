Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49F2C41513
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:49:48 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.12859.1716860977979860549
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XgpaRK64;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716860980; x=1748396980;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Erzy8kznm9LPOMJstazMQa0mPueHei32TlWfuPDXCAE=;
  b=XgpaRK64GYclCXQ1RsTa3aTOAbdvlHYMU+bUYxp2H4kFux5VbW+x1Cgy
   yARw0T0RNIWv+ohDYFrLfBXUcssUboT9/dTp1n0H5NsWG48SA9v2Hi+VG
   brXaTTHF/d/14GimmBHpNVkDNY0BdAAgJ0FGRCJNo+69j6M6jQkXdF1ut
   7NMUaB+++GBc45cHKYpbLHo/wD1jVp3uCyIMsi7KiZymE0b6uM7CLURc2
   xwhMDVUb+ijUgO+KXsPsBpFXTwEPnP4uFMaX3HPLVPVUzYbUrQPYq1DGZ
   uzn2AC9QR2fgATFgDAaxgCKZUC0JgiUFcos7MaI2UTpZNbc9GUZRKbwK1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="160525324"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="160525324"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:49:38 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 924A3CA1E6
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:35 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C1319D6308
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4BCE241063
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EEE9E1A000A;
	Tue, 28 May 2024 09:49:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/40] python3-pylint: upgrade 3.1.0 -> 3.2.2
Date: Tue, 28 May 2024 09:48:03 +0800
Message-Id: <1716860901-863-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10-0.678000-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrYdBG+bhhiNR3Y7kpVKWrnzoj
	JH9oiMoV4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054/67wpKrIJNBI+e
	Ym11U0iYdA8XPYQyAUAYUFsN5WfiFnpdzfoA7wedoMLOoNHsM9vWr7HvOSEla+rqUUJgYWfRR7G
	A0OjF0luOh9uw0T/dxLWHV5Rz6nrytYv/FAmebjp4CIKY/Hg3Am4n49vyf9XEvM/mydp5vVCq2r
	l3dzGQ1lyK+d4daslKswqZ8xxjiKbBTXUEQSqraaBmwswgiRawxM0ZPHKYPUaHEYpnXma2s/y9E
	VS4EpiBw/HDJ4KEvN1neWhkg1Rra/OzX972hRyhTyZ1y9sjWHZLqPOO5dObQxMzMgJrM/hR6Fi1
	pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110553

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix multiple false positives for generic class syntax added in Python 3.12
- Exclude context manager without cleanup from
  contextmanager-generator-missing-cleanup checks.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pylint_3.1.0.bb => python3-pylint_3.2.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_3.1.0.bb => python3-pylint_3.2.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb b/meta-python/recipes-devtools/python/python3-pylint_3.2.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pylint_3.2.2.bb
index 12f4f908a..0de1576af 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_3.2.2.bb
@@ -3,11 +3,11 @@ HOMEPAGE= "http://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRC_URI += "git://github.com/pylint-dev/pylint;branch=maintenance/3.1.x;protocol=https \
+SRC_URI += "git://github.com/pylint-dev/pylint;branch=main;protocol=https \
            file://0001-Adjust-test-expectations-for-ptest.patch \
            file://run-ptest \
            "
-SRCREV = "053c2c3a25f97f043e10cdd41d2609e495a68f57"
+SRCREV = "769ffd20bbf321a6cf23f5e7221a0b8221f51482"
 
 inherit python_setuptools_build_meta ptest
 
-- 
2.34.1


