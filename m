Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD6DCFC506
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:03 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.50335.1728896160399314028
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YchRT+8y;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896161; x=1760432161;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=iL8uNcXiR7ws6TstWguAvkAq7pwLenBMcO/1c2IDdU8=;
  b=YchRT+8ylJE/NFFiOz2WWYiSRXqqAY5Ify6Cw6RRG/T7ZwXYInutZcp5
   JYc9rONohGGMfyygB04VtZhi0EA6G7rGswAUSt8rn9GqtzWgn3kygi3rX
   IHEdJeujDtHpjyrdT7Wxxnc1UAD6XJhVvMpsIxWVGvJCYm2REKFdkfsUn
   jniMmoyX4lFG/PRsIGzZmGfD6oAsMJkmSCCYhtbFYQqscK3c5tD9+K2up
   cko+YHFacGKSXNR39YYt6gZtFHu5uuuNaDsEvWo5zqx/FfYFGqdTXOUDj
   H9wfiw81rGJBckM4sC+6jYfaMZQGbz91emcqJnkiTQCIxVsRgqRpS8LzX
   w==;
X-CSE-ConnectionGUID: KmBlzX98TauGn74BDNxFOA==
X-CSE-MsgGUID: 7y3vPhmfRl+6BVUsu7Y0Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="176692990"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="176692990"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:00 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id F22CECD6E0
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:56 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 34B63D5006
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id BA4A56BD6D
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 680BF1A000A;
	Mon, 14 Oct 2024 16:55:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/54] python3-aiohttp: upgrade 3.10.9 -> 3.10.10
Date: Mon, 14 Oct 2024 16:54:35 +0800
Message-Id: <1728896115-2944-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--0.056300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrrOCEGIPhtwipTkI0HK8zpaeA
	WaOlapBh4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbedlNc
	WZ7137CiBkESMI05d4uuLFZZYlisfHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4sOq
	9HgmBgWzIvw/gXZOj1kagpUN03JoqVRjc4zK0/WVCZDRAe1hV40YPbMRtULu9b4sTqiw+kCIocF
	/Nb/MwyX70Gxl+rExeCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112861

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fixed error messages from :py:class:~aiohttp.resolver.AsyncResolver being
  swallowed
- Added :exc:aiohttp.ClientConnectorDNSError for differentiating DNS resolution
  errors from other connector errors
- Simplified DNS resolution throttling code to reduce chance of race conditions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-aiohttp_3.10.9.bb => python3-aiohttp_3.10.10.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.10.9.bb => python3-aiohttp_3.10.10.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.10.9.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.10.10.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.10.9.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.10.10.bb
index cf39dd376..02c53ff91 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.10.9.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.10.10.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "143b0026a9dab07a05ad2dd9e46aa859bffdd6348ddc5967b42161168c24f857"
+SRC_URI[sha256sum] = "0631dd7c9f0822cc61c88586ca76d5b5ada26538097d0f1df510b082bad3411a"
 
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
-- 
2.34.1


