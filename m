Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FEB3CFC504
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:03 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.50330.1728896158310042178
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:55:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cVrjBceo;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896158; x=1760432158;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=AgNIiTnZq54zhcZLZgfgn/gnXcbV3Ir5vRfvIkTk2t0=;
  b=cVrjBceoIo+5kv4mwRZjbHiRjcfMr1ZqiCepDdNXNtkSPaxWeuJkjA/s
   CSZ05wiW8KDZ4qrvZQGzXk1EAjXH5PmCRTwzE94yirqylxBoIwM8NNV38
   3i5zuTCUAafOPkd8gB4fs06R9dYmJwFxGU8jHoeSAjETmj2JQ6xE4n/p1
   IrJ1uUGkir6vI2MDXPxZm1WrcomPTKyU0kjIxeo4+8YEf4Co2/mjVVDum
   91aI2vjZjR4C/GKMzvY8OsskQwPC1Dn2RKeWP89o9DWdPJOMQibd+O4ga
   7uprhXOiuRef4VtV+s4CcfhQqe55my3K1TpMyvfXyraCjW5Uj8f6+7ry+
   Q==;
X-CSE-ConnectionGUID: mV3/LLbRSEOhYRTCLdSYHg==
X-CSE-MsgGUID: tv3z5+xgS+SZPGiBS2zmBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="165031656"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="165031656"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:55:56 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 29C60D6473
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:54 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 646F2D4BD2
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0122A200649DB
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A2A241A000A;
	Mon, 14 Oct 2024 16:55:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/54] ctags: upgrade 6.1.20240922.0 -> 6.1.20241006.0
Date: Mon, 14 Oct 2024 16:54:23 +0800
Message-Id: <1728896115-2944-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZ9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrQrU6u0ns/XCeCXn0FOd6Dixfy3SHnE9tx03HU0BLxOaiT00FH2W6WTv0T
	vynaFGT8ri0UMjOYhIC6QdbOuZAQB81h+uZ23xfx0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112852

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.1.20240922.0.bb => ctags_6.1.20241006.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20240922.0.bb => ctags_6.1.20241006.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20240922.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20241006.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20240922.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20241006.0.bb
index 436793c58..90b0e2cb4 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20240922.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20241006.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "7e96624c9be94c5b4b89e5ae1f093e58282abf43"
+SRCREV = "ecf0c4adcce9853d666590bf2be101f983bad1cf"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


