Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83375ECE564
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:31 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.18329.1725959003028888389
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HPLP3Ksf;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959003; x=1757495003;
  h=from:to:cc:subject:date:message-id;
  bh=lg6zvgQQund+nfojYmYU20o9Hxt5FOs73UPGy3Dfz3k=;
  b=HPLP3KsfXI650UaNivD2D8+7AEXOoXXWkRwEsCNilTtsHeYkQv3AlAaG
   sDB4gM499r4bOZVEB1jX0B0SfEcEX1KT+Ag65jlRFECRIES4XZRbL1E04
   XbRri22f6AkZ3cxwFo9Q4PESw6igEQEiGg+RMzY4FKWOTBFQhiz2Do1yT
   4O42HzYJ+2UFpeN652htsq0hgeFFJUBsvxtwF+pnM+XoHotAXxbhpmIu2
   1GGnmjJ8YOef2iMNXU8bxRsElobMj6T0kMPVpRyShuqcWTZFutiOJz7af
   de6RdYkI1g2Zyp39hhwdyZmSinbKp7x6NEFpJQL99kDt/diNRr/l2lqqf
   Q==;
X-CSE-ConnectionGUID: fLBF2Q+HQJOlJFg6DxxyDQ==
X-CSE-MsgGUID: 7QYVeV0WQJWKTu+9OFWu+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="172474615"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="172474615"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:20 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 31AAEE8522
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 71A7C10353
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EFC916BE52
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7DCF11A000B;
	Tue, 10 Sep 2024 17:03:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/42] ctags: upgrade 6.1.20240825.0 -> 6.1.20240908.0
Date: Tue, 10 Sep 2024 17:02:29 +0800
Message-Id: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZ9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8Krf6xT0R2N79X9xFrQZZk+DiB/JUiBnVLLzzIL9puNk3dCsqOHvFClMB9Da
	euj7o923wXHGsI2l8Myu92Y8BKQ0z8U++rz5HoRR0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112187

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.1.20240825.0.bb => ctags_6.1.20240908.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20240825.0.bb => ctags_6.1.20240908.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20240825.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20240908.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20240825.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20240908.0.bb
index 88b5f9fa1..01e7e5e3f 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20240825.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20240908.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "a7b07d75535163f45331ca910245ad4b516379fa"
+SRCREV = "0a2ad188848b75f56bb2af33bcf556bd7cf422ed"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


