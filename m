Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C600D29F9D
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:33:04 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.40041.1730874775923573845
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:32:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HiDLYVKn;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874776; x=1762410776;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=bslbHk+mxRSxB23M2pL+mMzybhC7AAzkUWiNJRSutSg=;
  b=HiDLYVKnfb7mlKNR7IMntfm3vadXPSpkipmIgR3M/ZGxxWoU/Y5sUOOi
   /Iql2POmt65gSe4Ici2g3LUyCwvkWb1ffgjFou3LU7D+n+LRPCupULkZf
   R6IFU/9slUB5hTCOIxb/sE8QYsvwlLmqnIgzPThS/wfikuMEJG7nemr4p
   d2VDHMfYYUn8iz9yzHt6YyJsSI/6nzppWLhKxNDlFI2tQkY7lz/hGsO0w
   fh+OGIrg4VMReFd0r77/5iQ2cItnzObG/GD0q+i8+4q/O4J0Y16S1kqJU
   HyOxwir6nIumRt7M+La90RTZZtcx+h1ETGBN4Zzb/NderpOWQcap1FWNW
   w==;
X-CSE-ConnectionGUID: Q7eKCnisT9mcDJDqJjY91Q==
X-CSE-MsgGUID: 83vDhPzdRqq1tPWHOpZ4Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="179274618"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="179274618"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:32:54 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id CB223C6843
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:32:51 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 104DA17CB5
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:32:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9E4C320071A01
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:32:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4BF9B1A000A;
	Wed,  6 Nov 2024 14:32:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 42/46] python3-xmlschema: upgrade 3.4.2 -> 3.4.3
Date: Wed,  6 Nov 2024 14:30:56 +0800
Message-Id: <1730874660-2364-42-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10--1.481500-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysxkLdkW7C5qr0h
	4a7VzXxjn+4dmUIyMUZMNbrUuyXyo+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKINUccATRyd1AYUFsN5WfiFlwV2iaAfSWcURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2FR9
	Hau8GO7nXgXsQkv148M99Oxb0VS7VsEg6kI7Qb6/vl8Hx1NXm2CqkEBGXiCsBe0GMh99oUdcTi+
	VmQY27qUWC98YxYKHGpEkOKR9411oJXtKB2OUbbU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:33:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113728

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix incorrect validation error for substitution group with abstract head
- Refactor XSD identities processing using also typed XPath 2.0+ for getting values
- Clean tag retrieval during encode for some converter types

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-xmlschema_3.4.2.bb => python3-xmlschema_3.4.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_3.4.2.bb => python3-xmlschema_3.4.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_3.4.2.bb b/meta-python/recipes-devtools/python/python3-xmlschema_3.4.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-xmlschema_3.4.2.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_3.4.3.bb
index b29862b1d..92143ac19 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_3.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_3.4.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=26aa26eda991a3a2b61c11b62d3fda65"
 
-SRC_URI[sha256sum] = "d35023ea504ea46127302d1297b046d023b96fec5fe4b4b690534ea85b5e9bf8"
+SRC_URI[sha256sum] = "0c638dac81c7d6c9da9a8d7544402c48cffe7ee0e13cc47fc0c18794d1395dfb"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


