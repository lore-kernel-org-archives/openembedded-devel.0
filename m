Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34AE1C3065C
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:44:33 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.13626.1719816264731183233
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qW/8k+nh;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719816264; x=1751352264;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=w8mobhqqk85HdVXXZ7ltbfiJfkzJkSBdXat576UUgvk=;
  b=qW/8k+nhnwRjifmuVy2sdBT4pYyt4j8Cnt3/97lE1X7lLAgB2g548LPK
   yW3z7EnS3uZ5sFCSbzmI8yqn2YCgcga/gnaT61CO8lL02PP1nc09ijE/w
   z6RPwkKBrpR5dkk/uq+kchCBBkgWOqC4QRsgMzfXWagVlmGbjcaTzd8Ox
   wK0cms0Nvh0CmR773LPzMxk8mfLI+zolbBmFucA4qIFBzhX69ofG1nsBz
   WAel4hew7nFqolg37OGwzgOQUfFzAlZf9finsfvuFhji4LPqXODsq00g8
   fA0yi9VqPzKuEgLiQRKldBzSC2iijXDjxXndVFBoMrFlp7cugUA+a6ts7
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="144351958"
X-IronPort-AV: E=Sophos;i="6.09,175,1716217200"; 
   d="scan'208";a="144351958"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 15:44:22 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E8F18D800A
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 32BB7D8B0F
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C2934E206A
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:19 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 736A41A000A;
	Mon,  1 Jul 2024 14:44:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/25] python3-redis: upgrade 5.0.6 -> 5.0.7
Date: Mon,  1 Jul 2024 14:43:59 +0800
Message-Id: <1719816242-11839-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
References: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28494.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28494.005
X-TMASE-Result: 10--1.096600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrrzD8YrC59vwN538HGe6I3zyO
	6MgDLhRAoftpkb0YXswNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt77Fo
	gUQ0vV9iBkESMI05d4uuLFZZYlisfHxPMjOKY7A9wK7mZ44aKbi8z+bJ2nm9UKrauXd3MZDWysA
	SzD2HFtVMRjOCyhPyO9yr+74c6LGKIRI/jMEg+Bve3Mv6isWdAMExmhJmgCONVeFdoezOoPdnE/
	SFFq46cZOiv9pPBvvRiW2eA9nSDIFPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 06:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111190

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- None UnixDomainSocket timeout
- Updated redis version to represent latest available build

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-redis_5.0.6.bb => python3-redis_5.0.7.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_5.0.6.bb => python3-redis_5.0.7.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_5.0.6.bb b/meta-python/recipes-devtools/python/python3-redis_5.0.7.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-redis_5.0.6.bb
rename to meta-python/recipes-devtools/python/python3-redis_5.0.7.bb
index f9bd65dd0..8eb176c09 100644
--- a/meta-python/recipes-devtools/python/python3-redis_5.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_5.0.7.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=609ded3add9111c4c6e102f1d421d3f8"
 
-SRC_URI[sha256sum] = "38473cd7c6389ad3e44a91f4c3eaf6bcb8a9f746007f29bf4fb20824ff0b2197"
+SRC_URI[sha256sum] = "8f611490b93c8109b50adc317b31bfd84fff31def3475b92e7e80bf39f48175b"
 
 inherit pypi setuptools3
 
-- 
2.34.1


