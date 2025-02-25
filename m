Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43FE7C18E7C
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:05 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.2203.1740525898314938418
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IbBtK9zj;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525903; x=1772061903;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=KoeemZoif9ejzfsoBVMpRMshGuB3qPx5K9zRUmESmEw=;
  b=IbBtK9zjC3KV+zLudeaiT19bp3hhSyBmD9iiRevmBWuKZou0sZSJ6Rpa
   I9+pU8idhdYrv+0XrZKxr0KMVbvDzA9pOsWE1ICi3FgVYuZFUIVtR0Aap
   WEv+vgcRMxrCrd9Wy63ykGtCHYfW9Y7xvmaZwlnlSEfP0F9yWTgjWa+dK
   +x+sVOHpCzpxe3IQoVpfaU/3fU78oDyJHPZn/ubG65k+mWC0EIyHZlolX
   dhM1k/tI8+x1ZcS0MFi8O2+ypY092dw6USiBbhbBpWmaDxq3ZTy1fMY/n
   mfGVGHd5D5mhzHqI3fL6psxaEu+MxEDMMLHk5wf00BCrSt9akwY++x/X7
   w==;
X-CSE-ConnectionGUID: ykWwtXceSP+TAdbPXMGfcA==
X-CSE-MsgGUID: PO5Z40UkQjuttdrz5m004w==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="179142888"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="179142888"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:25:01 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id AA1E7D5076
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7283EC8BF7
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:59 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1526B1A000B;
	Wed, 26 Feb 2025 07:24:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/51] python3-psycopg: upgrade 3.2.4 -> 3.2.5
Date: Wed, 26 Feb 2025 07:24:25 +0800
Message-Id: <1740525881-21103-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115632

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 3x faster UUID loading thanks to C implementation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-psycopg_3.2.4.bb => python3-psycopg_3.2.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/python/{python3-psycopg_3.2.4.bb => python3-psycopg_3.2.5.bb} (85%)

diff --git a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.4.bb b/meta-oe/recipes-devtools/python/python3-psycopg_3.2.5.bb
similarity index 85%
rename from meta-oe/recipes-devtools/python/python3-psycopg_3.2.4.bb
rename to meta-oe/recipes-devtools/python/python3-psycopg_3.2.5.bb
index 1c01092691..fb8135ae82 100644
--- a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.4.bb
+++ b/meta-oe/recipes-devtools/python/python3-psycopg_3.2.5.bb
@@ -7,7 +7,7 @@ features offered by PostgreSQL."
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
 
-SRC_URI[sha256sum] = "f26f1346d6bf1ef5f5ef1714dd405c67fb365cfd1c6cea07de1792747b167b92"
+SRC_URI[sha256sum] = "f5f750611c67cb200e85b408882f29265c66d1de7f813add4f8125978bfd70e8"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


