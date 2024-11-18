Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48375D44001
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:16 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.37267.1731922213179768646
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GmdGYq/x;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922214; x=1763458214;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=G0qQ8pnpDe1sZsORy/u24Tp8zjHdDloHlWIpnk2zpN0=;
  b=GmdGYq/xqqaP2T5rzfYqIAb5xKpACjl/e+Wc+Oij0qn+ovscPoy8Hx+d
   fs0ZAb48ZOpLOY5YuSfBxH1ajv1tgTSwvXNG2IFEVCwXztkwRJtCYYdtv
   LGZXXM8M3Vge8uLQdDdFnRbM2+2Mhn6qF40tJwp72JKU1x6cJ6Ki7N9pZ
   LYuUUy212cgPEbDRLzfAQWySuXGXPd+q1SZDl797HHyXaKvy8Zm6SS/j7
   PfS3Y6g0oitCHMC8fmx0sbEN4eqRNZx/qT4b6T3aQ+N3gmGHzGiCCmNj2
   +tuFtTFRgx6pkrn3MLk0pDAXuc7essPZHApnTj8h0YeqQ3V5ikCuIXmhs
   w==;
X-CSE-ConnectionGUID: VOFSLHPfR/+qsem8MMJ1IQ==
X-CSE-MsgGUID: +M5Ybq9/TEynvQwrUP3F+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="168136707"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="168136707"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:11 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0AEA1D4F59
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:09 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A1104F87F
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F33BE368F
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:08 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E2B601A01E9;
	Mon, 18 Nov 2024 17:30:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/32] python3-alembic: upgrade 1.13.3 -> 1.14.0
Date: Mon, 18 Nov 2024 17:29:35 +0800
Message-Id: <1731922195-5266-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10--2.076600-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrKQNhMboqZlqYOldwn+9MqL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXLB9V5TU/zf9h/fmoyo94jKy/jA82qDY1u18A
	wtQ4piDKTdVCihfgAS6beKELKUZEMkrfo+g5xLnX8NuyKBe85dAXEZwtduOm7+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113879

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Added a new hook to the DefaultImpl DefaultImpl.version_table_impl().

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.13.3.bb => python3-alembic_1.14.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.13.3.bb => python3-alembic_1.14.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.13.3.bb b/meta-python/recipes-devtools/python/python3-alembic_1.14.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-alembic_1.13.3.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.14.0.bb
index f046c3ebc..5f09fb899 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.13.3.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.14.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=00f8f5c8aab58c3e1cd61525a6675174"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "203503117415561e203aa14541740643a611f641517f0209fcae63e9fa09f1a2"
+SRC_URI[sha256sum] = "b00892b53b3642d0b8dbedba234dbf1924b69be83a9a769d5a624b01094e304b"
 
 RDEPENDS:${PN} += "\
     python3-dateutil \
-- 
2.34.1


