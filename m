Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF644C3814E
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:36 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.166865.1719305846987426076
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q60AGNkh;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305847; x=1750841847;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9nOTx2/uey738e3wU4Cqc1QHySsFEXn15XGU6P28ZYs=;
  b=q60AGNkhfmYDHJ3Biuj0g1H88TC9qbEEswr5Qgh2/Z8MAP2lwgF8W27K
   Rr9YosH5bqAr2xWTO0Au0lC1dY6XpnUBVNhkenSfEwgMhqBf6OhGvbGC6
   WUzbfGVLNe7PD6pfeDTQ8IvK2vTP6AjPIDVxDpf2GrTRIuDH+ASvcx6XN
   BCsbZk3zKfmGZd/WZQMnRFW9TZKATHf64RWTXFSGDREYgy6ONhVLTp0Xo
   FpKnl+DQLugPzd4yqf56ndMBGT/nwZoo0un3/YcM4qswTayiSxLaVvU09
   CocBjFst/iUv1f2x1w4GMaEyLpC7z0MrO0P7gyAnDfcWQK78zZkRX7ZOV
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="143913904"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="143913904"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:26 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 536B2CC145
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:24 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C04FBF3D7
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 25BD92007CDC4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:23 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C75BE1A0002;
	Tue, 25 Jun 2024 16:57:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/57] python3-openpyxl: upgrade 3.1.3 -> 3.1.4
Date: Tue, 25 Jun 2024 16:56:10 +0800
Message-Id: <1719305790-11484-37-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10-1.791800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQQ6EfMOwvTmQR7lWMXPA1s8a+/GjoiAqr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AJlr1xKkE5uYMNZlevXKUzaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFKqD2T0yDWgPaWTFOsYPxI9fnZ
	tTMNW0Y950Se8HsTgRAsFll0WoFieT22zsrqsmrYh9pL4+xE/N2MM4/L2Qyce67wP15AlxW+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111050

From: Wang Mingyu <wangmy@fujitsu.com>

Changelo:
==============
- #2189 Assigning named styles doesn't work
- #2190 Problems caused when saving workbooks created by LibreOffice
- Python 3.6 and 3.7 are no longer supported.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-openpyxl_3.1.3.bb => python3-openpyxl_3.1.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-openpyxl_3.1.3.bb => python3-openpyxl_3.1.4.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_3.1.3.bb b/meta-python/recipes-devtools/python/python3-openpyxl_3.1.4.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-openpyxl_3.1.3.bb
rename to meta-python/recipes-devtools/python/python3-openpyxl_3.1.4.bb
index 934bf319b..018b93b9c 100644
--- a/meta-python/recipes-devtools/python/python3-openpyxl_3.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-openpyxl_3.1.4.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8dd482e5350125b2388070bb2477927be2e8ebc27df61178709bc8c8751da2f9"
+SRC_URI[sha256sum] = "8d2c8adf5d20d6ce8f9bca381df86b534835e974ed0156dacefa76f68c1d69fb"
 
 RDEPENDS:${PN} += "\
 	python3-compression \
-- 
2.34.1


