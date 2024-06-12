Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47815C2BA2B
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:57 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.2490.1718161123300457061
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jTtmr/rK;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161131; x=1749697131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=k0Bo19ltbZwIqjKuXDy+dADxeobO/CC1EMuMfhSUHjc=;
  b=jTtmr/rKlIduO7/AlLqA/wjpWTO7PmuK0f4dHguIp5zV/YlVYerOjnnl
   /fvEcGPmdIWr+24S/zgaeOmIPgCtgP3pArY2+pXQG5xJz/8wHj926w4IA
   2JA/02IvYw/TIcvPr+KJeToXlyKYM8plBFO4EsVvIwcmZwTXw1y5azW29
   cLIJUGrqoLQU/Ek5YvJ2JwwkYXhLJ0GgO5nLQSiM6ykY4zf3QfADMCAQX
   VAahyUEytW6N2LPMveynjW3ExrzHmRciViJV0c5Xv4HNVGK9mcKj1Wf8C
   ru+Aj4fxCcoLBGmMAbajeJxUjNiRsrxCBGARbZWRq6g1jLbcabDJGR8y2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="162860651"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="162860651"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:49 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E93BCD5A48
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:42 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3BF85D50B1
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C4832E290B
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6F3B21A000C;
	Wed, 12 Jun 2024 10:58:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/43] python3-py7zr: upgrade 0.20.8 -> 0.21.0
Date: Wed, 12 Jun 2024 10:57:54 +0800
Message-Id: <1718161096-29710-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10-0.256400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mr2FA7wK9mP9c8cwBuO6HB3z/4
	0Ae7LpB/4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2UgxSQxzSLAbaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFDLsi0PIqla6gJBL6NuX6AztwX
	IG+zX13sH7gsCJqHeZWIEgNLq49Zts+vUeGrdzIRz1tchrcpCsso51HdJGYp+yX7dGcotriOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110867

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Speed up extraction when number of files is large

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-py7zr_0.20.8.bb => python3-py7zr_0.21.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-py7zr_0.20.8.bb => python3-py7zr_0.21.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-py7zr_0.20.8.bb b/meta-python/recipes-devtools/python/python3-py7zr_0.21.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-py7zr_0.20.8.bb
rename to meta-python/recipes-devtools/python/python3-py7zr_0.21.0.bb
index 3d48b5116..cb405a535 100644
--- a/meta-python/recipes-devtools/python/python3-py7zr_0.20.8.bb
+++ b/meta-python/recipes-devtools/python/python3-py7zr_0.21.0.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPL-2.1-or-later"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "2a6b0db0441e63a2dd74cbd18f5d9ae7e08dc0e54685aa486361d0db6a0b4f78"
+SRC_URI[sha256sum] = "213a9cc46940fb8f63b4163643a8f5b36bbc798134746c3992d3bc6b14edab87"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


