Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B967FC02191
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.30506.1735032440799266974
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lOAXpOKn;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032441; x=1766568441;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=40yrR1yvhsymn1QOWanT0ghA+XJB6AIjgz1NA/o/vt0=;
  b=lOAXpOKnZsjohExINopf5wiWumPHzlduYHmSj73WTvmkLbOWMx4ZNTEU
   NhcYU2o76VBt74sbOJDOSAUmR9G5OqXdoQSCD7yp8L1v4Zj+lGD5yeQHN
   NF4pwGGsRrOIAx/w0o2/vHMtOWNwXvfW972JV5/0u8oiJZgLbRUV/FOR3
   lCApjplplpkJ6c7HmfIeOH0emjJ51fuxG3fulID08THbR0EsEfNC+MEuT
   tY+bd8a1R4N6V9ueTd6AIfpAQ1ScDF15ayBuj++mOkB6JCqManX2/wuvS
   4b4DYaZKVv/1PW9Q/UtTAvkEYb2UoTNT7ToqebrfnV8Ebo8212bL6HLoX
   A==;
X-CSE-ConnectionGUID: jzY19YXLQVqcM2XO+hBogA==
X-CSE-MsgGUID: 7Im0k6loRWej1Zpd1+Bysw==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="185003191"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="185003191"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:18 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 06909D480D
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id D3512D4C17
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 74D356BB6B
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:16 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3ADA91A006C;
	Tue, 24 Dec 2024 17:27:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/67] python3-cassandra-driver: upgrade 3.29.1 -> 3.29.2
Date: Tue, 24 Dec 2024 17:26:07 +0800
Message-Id: <1735032421-13513-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--8.823700-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mrMVVFhl7NwvPozDhGeQC9EoW3
	qa3jbRSUs6i3XbqCbETKAFZyCt3MP9PKvSkrFLVXboT9s9dVCZp7tnRTJA7lM1v1PFEUIEU/UNz
	M39IykFhevs1eD+lKBOoOoTBx+4tjMrohFrdLwZ8apIb9znReA86EuKapBq5DE8cL830eUMq+qc
	W0zo2r8vu0HEWlaGvJxiiH+oQX+1WhhjsqgSuNbxF4zyLyne+AbkygYp8Zf7pgDeovr2termkRc
	A7PBu0x4vM1YF6AJbbCCfuIMF6xLSAHAopEd76visq5cMPXMXGefSAPsUzlitABvDCihGCyEejm
	U8VaZt8rACTbf8t5oQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114489

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Features
--------
- Convert to pytest for running unit and integration tests (PYTHON-1297)
- Add support for Cassandra 4.1.x and 5.0 releases to CI (PYTHON-1393)
- Extend driver vector support to arbitrary subtypes and fix handling of variable length types (PYTHON-1369)

Bug Fixes
----------
- Python NumpyProtocolHandler does not work with NumPy 1.24.0 or greater (PYTHON-1359)
- cibuildwheel appears to not be stripping Cython-generated shared objects (PYTHON-1387)
- Windows build for Python 3.12 compiled without libev support (PYTHON-1386)

Others
---------
- Update README.rst with badges for version and license (PR 1210)
- Remove dependency on old mock external module (PR 1201)
- Removed future print_function, division, and with and some pre 3.7 handling (PR 1208)
- Update geomet dependency (PR 1207)
- Remove problematic escape sequences in some docstrings to avoid SyntaxWarning in Python 3.12 (PR 1205)
- Use timezone-aware API to avoid deprecated warning

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ndra-driver_3.29.1.bb => python3-cassandra-driver_3.29.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cassandra-driver_3.29.1.bb => python3-cassandra-driver_3.29.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.1.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.1.bb
rename to meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.2.bb
index 3003e84acf..f60167d309 100644
--- a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.2.bb
@@ -8,7 +8,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 SRCNAME = "cassandra-driver"
 
-SRC_URI[sha256sum] = "38e9c2a2f2a9664bb03f1f852d5fccaeff2163942b5db35dffcf8bf32a51cfe5"
+SRC_URI[sha256sum] = "c4310a7d0457f51a63fb019d8ef501588c491141362b53097fbc62fa06559b7c"
 
 inherit pypi setuptools3
 
-- 
2.43.0


