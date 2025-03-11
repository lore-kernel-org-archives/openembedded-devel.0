Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF460C36000
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:38 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.4202.1741683326615161703
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=alIhucbf;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683331; x=1773219331;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=GcNC0ZTGDrYmatv83zlSEFphQQDX5BknJDErIeakyP4=;
  b=alIhucbfHR6xECymgHLxU5wfBhOUp1AnC6BurjfTuIcfg26Un+yp1hGR
   xlsZgnOcupz0kCS/IwrvJtq/KNjN5m2u6H3ARgpZqhoJjXzcJL/F9EbQb
   i5xy9B7vVT80ADwhBkcFIAQZLqkLdjS2uOoUX7JTBkd1lQbDtnFHTLV7I
   yADlVccqst5XU+XSIuKvQfty9UptTxuKxIXkFGSJEm+LKDYJEufLYu9hT
   1A/dh3V3Q0p1/uiSPCBWw/0yFyi2qf09IuJ4talxdABSz8DUkNKtp/Wpp
   TkXhUnTdtY7LOD8UjLPIqNYk1v1g/DXTJKWT0P2m4y+hhf7dLchTsB6jY
   w==;
X-CSE-ConnectionGUID: XWgdsJttTMum4PaIrqXE8w==
X-CSE-MsgGUID: qsgyZBSmT8GG2xboFSuOdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="180663313"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="180663313"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:29 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4965FE0765
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E3D3CF7E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:27 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9B55F1A0071;
	Tue, 11 Mar 2025 16:55:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/36] python3-argcomplete: upgrade 3.5.3 -> 3.6.0
Date: Tue, 11 Mar 2025 16:54:48 +0800
Message-Id: <1741683310-8681-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115865

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Support namespace package traversal when completing Python entry points
- zsh: skip repeat Python runs in the same completion run
- Make _parse_known_args signature more general for future API changes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-argcomplete_3.5.3.bb => python3-argcomplete_3.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_3.5.3.bb => python3-argcomplete_3.6.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.5.3.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.6.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-argcomplete_3.5.3.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.6.0.bb
index a38a247b75..f87ca4d925 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "c12bf50eded8aebb298c7b7da7a5ff3ee24dffd9f5281867dfe1424b58c55392"
+SRC_URI[sha256sum] = "2e4e42ec0ba2fff54b0d244d0b1623e86057673e57bafe72dda59c64bd5dee8b"
 
 PYPI_PACKAGE = "argcomplete"
 
-- 
2.43.0


