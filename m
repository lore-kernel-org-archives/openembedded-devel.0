Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA02C52D7B
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:06 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.2884.1722934017995171001
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pDcAF0rk;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934018; x=1754470018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=GD0BOpzhXLWiatrVmIS9kJZBaTNa9TCpyNNExXHp3sw=;
  b=pDcAF0rk2Z6YspN5YQSLquMlAEQbyk5WWeU7D9VJI4pjs0Xb0V24jyLe
   nuQ1ClBNZ/Ok2qGnwCRULY/NfyIM/eok2Uoy9YgwMAxtCcAU7vxgqzoKK
   zI7scwwrFwiTdn60rQOnsZQC6L0/AZJvQ9KE2yOZCcSXl8uUtb2byVuAZ
   yKPBONiXZvdfqfok/aQgvbW3enkjl2xaRtTu0dq2K5sI1crYkHauBV4ib
   YHpGGhjzpqBtwSCxPeMLS9W61TqZy1p2ZBR9sXTkKHasNYA1glIzRZjxd
   GUzCWY5vTaEbywvP3G6mueN1293QK1Xr7+QWG3IOKuoOHvCJQGGlXmr8o
   A==;
X-CSE-ConnectionGUID: +7UhyWCoQlOXqXbzs3X6QA==
X-CSE-MsgGUID: FbWBmfXtQPqK25GmozX4gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="148811718"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="148811718"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:56 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2F4D9C68E4
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:54 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 723F8CFBB0
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EF515E5A19
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9ECA31A000C;
	Tue,  6 Aug 2024 16:46:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 15/60] liblinebreak: upgrade 1.2 -> 2.1
Date: Tue,  6 Aug 2024 16:45:49 +0800
Message-Id: <1722933994-32549-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-4.474500-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yXg2y0j5vXZGSc4iQ7VD4M2U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN194/5X9VfCyE7VJ7hrAQ1v67wpKrIJNBipR
	+sdTs/I0Wm/gAtjCd7AYUFsN5WfiFr34zwKXxmIFIcJTn2HkqsQYAPqHoVmYRXE5Co/aUb2CjxY
	yRBa/qJV/Hpl/zcOjl5MIx11wv+CPGVuWouVipcgos8jQ0F92scfsH5Dj5AhZ5wqysgFY85WZcd
	ifeRaBAIunHVu+NYrvgRLKNcW/M5rhL/m2XPovxnY1n+FKVgx7aQNakDWAG+/6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111538

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated from 2008 to 2008-2011

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{liblinebreak_1.2.bb => liblinebreak_2.1.bb}             | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/liblinebreak/{liblinebreak_1.2.bb => liblinebreak_2.1.bb} (69%)

diff --git a/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb b/meta-oe/recipes-support/liblinebreak/liblinebreak_2.1.bb
similarity index 69%
rename from meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
rename to meta-oe/recipes-support/liblinebreak/liblinebreak_2.1.bb
index 539b58bc5..c6caf450a 100644
--- a/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
+++ b/meta-oe/recipes-support/liblinebreak/liblinebreak_2.1.bb
@@ -2,11 +2,10 @@ DESCRIPTION = "Liblinebreak is an implementation of the line breaking algorithm
 HOMEPAGE = "http://vimgadgets.sourceforge.net/liblinebreak/"
 SECTION = "libs"
 LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=3715191da62bafb5cfc4ff36195b2ec3"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=f89a1ce02e2dba48c1c0a8e6038464c2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/vimgadgets/liblinebreak/${PV}/liblinebreak-${PV}.tar.gz"
-SRC_URI[md5sum] = "d18039259001ccb24b5dd4648c49c5ad"
-SRC_URI[sha256sum] = "9efcb0cb1afc75ad1e92d2b2dbf4d9c77b072d6656c5f1a150af8b718d0c7b76"
+SRC_URI[sha256sum] = "dd8cba554d260cf686865cc53d0c6be98102a80f56f8152ca5e7307bf06a66b8"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/vimgadgets/files/liblinebreak/"
 UPSTREAM_CHECK_REGEX = "${BPN}/(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


