Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F391C52D71
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:46:56 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.2878.1722934011958228024
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:46:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PA0zoxaK;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934015; x=1754470015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0EeUUMNqAy/OKCMq6oMcKRFC4Einx3Fpz3/v1RhBB+U=;
  b=PA0zoxaK2S602dx2Wuy2OPlp6cO5+I0OPFnM+baDsIeHX1nwpNsdKI5f
   yF8WziNnUqNIzn/wd8j6mcoPmR+2ztb1Z4Fi3O5rbmC2o7miXL2W+3kyg
   nhqr5AMxFAYPULdL9kXwa5N23e/4z7qXgaIib2b6NpTkiKv7kUMpkwt3c
   Sv1+rknhYkwPnVq+6zrc4QXsvOpPigMDIYzpeZBFR2Gr2f8Efj91hxMEk
   peypT9qKkKA47Z22l3Ullj9VNJs6t0gflrMiHKxALkCVnfLGKqA2Fa95f
   RJr672Mut8U007DE7bY4EcdkckCEJusIrrqU5F8Qz2MJUJ7/CPXcDQsRk
   g==;
X-CSE-ConnectionGUID: B5++MTpoSlSXfO3znuyozQ==
X-CSE-MsgGUID: VqUopy5SR2qXD+C+Nq/7CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="169971729"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="169971729"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:54 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8F3A4D64B4
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:51 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DFBC9D4C15
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 31FB6E5A19
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D4EA21A0002;
	Tue,  6 Aug 2024 16:46:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/60] ctags: upgrade 6.1.20240714.0 -> 6.1.20240804.0
Date: Tue,  6 Aug 2024 16:45:39 +0800
Message-Id: <1722933994-32549-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZ9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrYLegXUSHpCecGw6wl2KdZyeX23v4NJaj1ICkJdZILM2NH8gWiqqrgelYa
	Y26Mq10jT/i6gzMIPiiEMMaBzY1yOg1PJYT4zgxB0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111521

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.1.20240714.0.bb => ctags_6.1.20240804.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20240714.0.bb => ctags_6.1.20240804.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20240714.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20240804.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20240714.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20240804.0.bb
index 8474a90ff..afddf155f 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20240714.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20240804.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "e79e67dc64805a616725c3668ad7ec284de053ed"
+SRCREV = "a9e213cabeda252c2706f59616f455f07057d542"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


