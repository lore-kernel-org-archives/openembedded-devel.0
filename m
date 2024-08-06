Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01441C54748
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:09 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.2889.1722934026583223788
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tTgnAflw;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934027; x=1754470027;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=t5LoaRSyWEgGeMSUVXnB2l1DfNHsvtuC2NgumqKvdJg=;
  b=tTgnAflwtO3Phle2LUr9GxnpjZqrxx0YZ+m+sct/KEbNGfrGpd81teKh
   FLWZayKZy5B1CGHFLG3iFfB9OWJtmG/Jw9kk+T42X+QR4tCtJKffBBQoJ
   oWYF4H97FEB6Q9YFZprPi+HfyDLs1Q1U+qSd/LnXjLkcNktstKhPDirfz
   p7JNuSsdIaB8u8WXc8Bztx2xvnGwWnk41tYM7nhkdubyC4TlzHd26pnyu
   N4gCg3SoeF7IJDOZnEvsJ+IUJtb7n1klqq2nI5+kPVWCtuBIxaApHu1Dl
   z+91rLycMT9Du0EFvm1oyYmFFa065cCEVyOK6UKJyLIGUXsbHQziDR6u7
   Q==;
X-CSE-ConnectionGUID: nN1EtqSoSFW+JFf4qr2uxA==
X-CSE-MsgGUID: ynS0gQ3nQr+xbARyESIXrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="157929872"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="157929872"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:05 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B00F2D8012
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:03 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 03257BF496
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B9D11E9448
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:02 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 29D0B1A0002;
	Tue,  6 Aug 2024 16:47:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 58/60] ttf-abyssinica: upgrade 2.100 -> 2.201
Date: Tue,  6 Aug 2024 16:46:32 +0800
Message-Id: <1722933994-32549-58-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-2.072400-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yXg2y0j5vXZGSc4iQ7VD4M3gm7lSO4VWy3/K
	dTO4XUruVAQKVQh21MkNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErRQn+XKnweZisC5DTEMxpeQ7m0
	K7bkUDKK2HuxiqanPcpg+xMERr0NZeBzEkCCpnRlhW/KqLK7NUARryDXHx6oX118T8WwfutVvve
	+Fp2Rg4+LzNWBegCW2U9w4XVXDWCYLbigRnpKlKZx+7GyJjhAU4/YWBxl2uvrCfeSV92NPznuQz
	ZICc5n2DrE87fiKQNxaDKOpIw1/K4W6Q/LJFERgvWDfBO89JVHGdCu5pjCORsT5jqNqmejm7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111576

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 Copyright year updated to 2023, SIL International changged to "https://www.sil.org/"
 Modern Gurage glyphs Copyright updated to 2022

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{ttf-abyssinica_2.100.bb => ttf-abyssinica_2.201.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/ttf-fonts/{ttf-abyssinica_2.100.bb => ttf-abyssinica_2.201.bb} (71%)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.100.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.201.bb
similarity index 71%
rename from meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.100.bb
rename to meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.201.bb
index b9880f402..1253cf883 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.100.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.201.bb
@@ -3,7 +3,7 @@ require ttf.inc
 SUMMARY = "Ethiopia and Eritrea (Amharic) font - TTF Edition"
 HOMEPAGE = "http://software.sil.org/abyssinica/"
 LICENSE = "OFL-1.1"
-LIC_FILES_CHKSUM = "file://OFL.txt;md5=fd664aaab50445c3c1c97544554a6bda"
+LIC_FILES_CHKSUM = "file://OFL.txt;md5=347eaa34fdf555aaf6b2144a5ccca45b"
 
 SRCNAME = "AbyssinicaSIL"
 SRC_URI = "http://software.sil.org/downloads/r/abyssinica/${SRCNAME}-${PV}.zip"
@@ -11,7 +11,7 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 UPSTREAM_CHECK_URI = "https://software.sil.org/abyssinica/download/"
 
-SRC_URI[sha256sum] = "1a1fc8e82f0c0f2e824f42bff05c1f4a0356330a89dc7ba798c1a20bc3e333e0"
+SRC_URI[sha256sum] = "961259a1d9ace083f737eb1e55cec40c9a56f4855866d7474bf212d2a4366ab8"
 
 FONT_PACKAGES = "${PN}"
 FILES:${PN} = "${datadir}"
-- 
2.34.1


