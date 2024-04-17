Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE7DC07E8D
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:49 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.2726.1713318103627840586
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WKUAotj1;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318103; x=1744854103;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JzFNSasEey4HkhQys9fJf89UFH02mbIAnkTTHNoaHU4=;
  b=WKUAotj1s+paPVQlfY64wSV+AxUSokjy3F/TvDO9DtiZ3/lP1uK41qAF
   R1DFKClUBivpZhWZwQEDmSILdbOsZndloXovnNf5rRz/nvaz+k9YpBQZM
   1X/btsaEsqSJe+MV7s36osp4PXQURz6D/z5k18dOpl5Ld3HI8DFMIUIMV
   byQVPVNWDSonE9Jg5Fsn9kyQw5W8ngG3FmVrpJrlNFMbJtqFF/+G2SbHz
   HdWFDODXDlWsSomsOoGNrk/Eh/HAwpOVsJoovrzMOsLY54Jx0KLWAQgRZ
   piIWiGQsX6oe5MxlT5st46po5bfy7hniMLyllsNJfoQkRA8Lztkk7Gi2Q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="135076058"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="135076058"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:41 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DC3FDE05B2
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:38 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B77511ECB
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A3F4A22D91A
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 514E81A0002;
	Wed, 17 Apr 2024 09:41:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/49] python3-send2trash: upgrade 1.8.2 -> 1.8.3
Date: Wed, 17 Apr 2024 09:40:47 +0800
Message-Id: <1713318061-17128-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--0.406600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrF4r8H5YrEqweZzJlaRLGxb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AnWEI8uQPVnWAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5+LW
	imncUpHbHF/ZrrA5U2sapz3WKvJ0wvnUhK4nw8TzC0txZ2lruddWM7TizztI6nc7EvD9NDsZA7w
	WGOSNlvUXPEVvI9o7SCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110023

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Add support for any iterable type as input
-fix: Use os.fsdecode() for arguments to shutil.move()

License-Update:
 file type of LICENSE changed to ASCII text

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-send2trash_1.8.2.bb => python3-send2trash_1.8.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-extended/send2trash/{python3-send2trash_1.8.2.bb => python3-send2trash_1.8.3.bb} (59%)

diff --git a/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.2.bb b/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.3.bb
similarity index 59%
rename from meta-python/recipes-extended/send2trash/python3-send2trash_1.8.2.bb
rename to meta-python/recipes-extended/send2trash/python3-send2trash_1.8.3.bb
index eac89e629..0bbfb9a11 100644
--- a/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.2.bb
+++ b/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.3.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Send file to trash natively under Mac OS X, Windows and Linux"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a02659c2d5f4cc626e4dcf6504b865eb"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=05faa35ba1ca10b723f19d286c9d5237"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "c132d59fa44b9ca2b1699af5c86f57ce9f4c5eb56629d5d55fbb7a35f84e2312"
+SRC_URI[sha256sum] = "b18e7a3966d99871aefeb00cfbcfdced55ce4871194810fc71f4aa484b953abf"
 
 PYPI_PACKAGE = "Send2Trash"
 
-- 
2.34.1


