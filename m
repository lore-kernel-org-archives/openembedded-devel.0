Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64805C25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 06:39:55 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.8626.1717569591232656585
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Jun 2024 23:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=i9l5a0Db;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717569591; x=1749105591;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0+8tnKYZHZ8toDUAxw0tjR+WdSJZWKXQ7cFSL/HZgM4=;
  b=i9l5a0DbV4uG4JmsqnbgXYaPEz/dpW7Gyhbx3DPGFFkT3g0uoXhUt/P4
   UIYPDrMNhANp21glpudqC76YZwZH6YlV0wnxtzP9VWxnkfDWqNIEge4r4
   /VFCpw+G3L8SOBqFLT3tzdWJEQ0Fw9x5FqEvaMtQwxRBnsAQSm4uzNwPH
   JYE2lcPBCOYX4XJFp8JnqfXveOWW791h5+qrxgnzgZvNUGbQUAayOfdNJ
   qOGqzNTr7nx7JNR2L9TYx95GJRVT6bYJ9LJec9K5Fb45IXbrJgkt/gjHe
   vupnAFf6oHPaAq/U6nx2KfJfmC50IJHajYfNLm1xuXq+gt0bI2C8nOHhh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="161925358"
X-IronPort-AV: E=Sophos;i="6.08,215,1712588400"; 
   d="scan'208";a="161925358"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 15:39:49 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 07C46D63C7
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Jun 2024 15:39:46 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3CE4FD728D
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Jun 2024 15:39:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C5D57E2915
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Jun 2024 15:39:44 +0900 (JST)
Received: from ubuntu24.04 (unknown [10.193.130.22])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 707321A000A;
	Wed,  5 Jun 2024 14:39:44 +0800 (CST)
From: leimaohui@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [PATCH 1/2] cmpi-bindings: ignore incompatible-pointer-types errors for now.
Date: Wed,  5 Jun 2024 14:39:44 +0800
Message-ID: <20240605063946.83219-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28432.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28432.005
X-TMASE-Result: 10-2.241600-10.000000
X-TMASE-MatchedRID: rY5+U3d69IdXY5ze6zUPKRVof5GwqGWEW9DGjPU7rM/fUZT83lbkEO79
	DJRUi35pTQ0JkPG287/mn3xyPJAJoo20xpayFHBZrltvlARhKR0QhNjZQYyI3AjGzxulqlQso8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXLwUlDxotAy1r05f5Hl/LgCUe6MrMr8nCfR5n
	ahHc4MXOHslKEnRCRinW6o3MSfwDu8reH1S2caYWiJpnOFktpZN7P5/8GUK64RZbRsQk5MBUB1Q
	Pq9bxnWZkAxAwjIrrMHz/H0kiLyEqGAtHMDjkk9
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jun 2024 06:39:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110695

From: Lei Maohui <leimaohui@fujitsu.com>

GCC 14 implicitly turns a warning into a compiler error:

| /build-ubinux-daily/tmp/work/aarch64-ubinux-linux/cmpi-bindings/1.0.4/git/swig/python/../../src/target_python.c:168:21: error: passing argument 1 of 'Py_SetProgramName' from incompatible pointer type [-Wincompatible-pointer-types]
|   168 |   Py_SetProgramName("cmpi_swig");
|       |                     ^~~~~~~~~~~
|       |                     |
|       |                     char *

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
index 781dc83da9..d062e46bb9 100644
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
@@ -27,7 +27,7 @@ EXTRA_OECMAKE = "-DLIB='${baselib}' \
 # With Ninja it fails with:
 # ninja: error: build.ninja:282: bad $-escape (literal $ must be written as $$)
 OECMAKE_GENERATOR = "Unix Makefiles"
-
+CFLAGS += "-Wno-error=incompatible-pointer-types"
 FILES:${PN} =+"${libdir}/cmpi/libpy3CmpiProvider.so ${PYTHON_SITEPACKAGES_DIR}/*"
 FILES:${PN}-dbg =+ "${libdir}/cmpi/.debug/libpyCmpiProvider.so"
 
-- 
2.34.1


