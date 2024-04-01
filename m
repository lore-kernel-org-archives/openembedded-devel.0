Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC483CD129F
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:43 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.39477.1711983098182685926
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q0oBnYRm;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983098; x=1743519098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=qDTVNaJvFfgJyLaVxj5XQUAf2FyClMNgLHtHFHIJM2M=;
  b=q0oBnYRmbmQhoyVh+MHfzxD59itNBTd0Iq65/S9Lw+UmXEBzEZxA03Gc
   P6eYkhYF1/jRZUinDNp7/PFJzSZe0JaWu1fSQAZenyP3ldCTpYdZWvFfq
   Hxvok0EppEVbjXKMzP+v0NaMuvFlCvfsVtxVIYUjpG5PcKqDJBoULnomB
   RAD9vxwJuXSJNlgB2NSTLyKrTgFa1f0+UGMK7HmVffItdkc15o9T0MIsA
   YWPOLh5vvjN1GoMHbVnJrHDRpE1U/MYzzPaaDlyBO/5zBvkHn/vbFobpv
   B14sfavrgL3+71a25nlmJ+PV4K0eHDMlKZn7na7MHCAiTqF0GnrEDXey4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="142245639"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="142245639"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:35 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 170B9E48CA
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:34 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 464D0D9681
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CB50820093240
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 812341A000A;
	Mon,  1 Apr 2024 22:51:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/47 v2] python3-filelock: upgrade 3.13.1 -> 3.13.3
Date: Mon,  1 Apr 2024 22:50:49 +0800
Message-Id: <1711983079-16849-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--0.545300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mruHhIuIeXPm/djG9Z16h2wb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AGAD6h6FZmEV42zm1Zi+MJ1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0JC+
	VZi2gQEeay4isaCjpNm+SlBbJSFEewxoiOeT1hIXtylNAs3V87kWNnq47klLId46rC0nMNv/wbH
	FyVw3THM0z2tYQKLTv8RVBqa+ewGvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109735

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Make singleton class instance dict unique per subclass

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-filelock_3.13.1.bb => python3-filelock_3.13.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.13.1.bb => python3-filelock_3.13.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.13.1.bb b/meta-python/recipes-devtools/python/python3-filelock_3.13.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-filelock_3.13.1.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.13.3.bb
index ab0b114e4..f1477d1dc 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.13.1.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.13.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://py-filelock.readthedocs.io/"
 LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 
-SRC_URI[sha256sum] = "521f5f56c50f8426f5e03ad3b281b490a87ef15bc6c526f168290f0c7148d44e"
+SRC_URI[sha256sum] = "a79895a25bbefdf55d1a2a0a80968f7dbb28edcd6d4234a0afb3f37ecde4b546"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1


