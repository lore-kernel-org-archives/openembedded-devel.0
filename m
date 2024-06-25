Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7E7C31D97
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:36 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.167244.1719305852975534140
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=g8jlo8Cw;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305853; x=1750841853;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WFBiAlBnesgzlZpBtX/ZGTJy9hMdj4zZql9SWfOZooE=;
  b=g8jlo8Cw4JPjI+rZnNZd5upO+mujat5t+B3/E/SlP6Ys2jf8T0/Fixhg
   iKPezPBBUjJUJP3E37J/Cs+VCrKuD7cKV3naA1XgIvQFLVsyY7tznWKOf
   Ck1FshBMnQ/THQZRDVmW02ZV+cw4eDO9mwopPvfj5VVV9xp/bWWLZE0Kt
   bMCuHOh5YQx/RlsLOe3JcNE35IgFo2t2zs4iiMYGxg63+DbSokfsSPloe
   Rh8/cttONndyous6Zl2dYyP5fFMQC8d/QlNazj6eIX6888EDUhqQqi5F3
   Kc2nmSOMCgl1ENxtdHQqPRvbQNx5zCdfZl7K3gUORalHOGfR2nN2x02o7
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="152254729"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="152254729"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:30 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C2D6C9443
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:28 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id EA168CFAB0
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8123F2007CDC4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2F5EA1A0002;
	Tue, 25 Jun 2024 16:57:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 43/57] python3-pycodestyle: upgrade 2.11.1 -> 2.12.0
Date: Tue, 25 Jun 2024 16:56:16 +0800
Message-Id: <1719305790-11484-43-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--0.709600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuawtBEBljY2YCu
	qghmtWfX4K9FmervsqXQdf1OKvQxXaJEq6b8z4ap/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQD5+
	EY120A3oWm/gAtjCd7AYUFsN5WfiFlwV2iaAfSWcURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0Nst
	CXmf87HLngb5rvym1lGwAfHDEbF/VaM8cfwPX21KOGpG//N99/TgPi3CEWZu17qiXQxqo0/BLhA
	F9t6U1FVlQJLxB5Bqj5Fwt7wtoyv/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111056

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* E721: Fix false positive of the form 'x.type(...) =='.
* E502: Fix false-negative with a backslash escape in a comment.
* E204: New lint forbidding whitespace after decorator '@'.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-pycodestyle_2.11.1.bb => python3-pycodestyle_2.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycodestyle_2.11.1.bb => python3-pycodestyle_2.12.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pycodestyle_2.11.1.bb b/meta-python/recipes-devtools/python/python3-pycodestyle_2.12.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pycodestyle_2.11.1.bb
rename to meta-python/recipes-devtools/python/python3-pycodestyle_2.12.0.bb
index a282afb46..506af8e3d 100644
--- a/meta-python/recipes-devtools/python/python3-pycodestyle_2.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pycodestyle_2.12.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a8546d0e77f416fb05a26acd89c8b3bd"
 
-SRC_URI[sha256sum] = "41ba0e7afc9752dfb53ced5489e89f8186be00e599e712660695b7a75ff2663f"
+SRC_URI[sha256sum] = "442f950141b4f43df752dd303511ffded3a04c2b6fb7f65980574f0c31e6e79c"
 
 inherit pypi setuptools3
 
-- 
2.34.1


