Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07EE7C0218C
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:13 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.40064.1736843346670641287
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LcRmBFsO;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843350; x=1768379350;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1BewJz4eX+tTWmBXsX8kzj0Ztqf8MJgTysTeGggF1/4=;
  b=LcRmBFsOjowczC4Xfpfz+LhOcUbIBfiKxAhPqhByqRgue03RdyjWvp6R
   8aywdmCbNGiP1FLsXAaNYkEl4S5oUnllt6zN4iM5jVe6aVDW3tgf5QhyH
   oUFo5FdQ0Y2K+ZlsAnP99Cse+3tIZd4Jnj5VdutJWvN1qHRjLxWjRFLMJ
   3Pzg8mxBP8ODJn07OUsq6keQd57udKdEVNvz9Dz3LtpFBrmA/uhHEnUS2
   /6oDnouuNVvkL4UvxpgrsFpxQFPhH8puQtxTXioNkwfKWAfZ1aeauxjJz
   irfbCdV5lnj7haYd/C3sc7chALvO+H48AAynu0gj0K2wsPdaNfBFDDZHr
   Q==;
X-CSE-ConnectionGUID: FiCvuqwARfGp/2oaJ9mpuQ==
X-CSE-MsgGUID: w3nFd9nqQ8GI15F3t2G7SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="174843763"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="174843763"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:09 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0167B96749
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:09 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C3507D3F08
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 545436B5DB
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:08 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 028FB1A000B;
	Tue, 14 Jan 2025 16:29:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/30] python3-flask-marshmallow: upgrade 1.2.1 -> 1.3.0
Date: Tue, 14 Jan 2025 16:28:37 +0800
Message-Id: <1736843329-4131-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10-0.832500-10.000000
X-TMASE-MatchedRID: V7gFd1X8+4Wjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmI/dksnGuGmFZH0YXYnbGozFEUknJ/kEl5lVdRvgpNpe/oLR4+zsDTtF/a
	6QWbgQ21quJ6yL4oliMgFBN8GIxqizYCckEt9A5MykJuGI1cKD2dUhKL/3idhs+bN7y8QpUTFjq
	A0BvetJLXllHh7N6Gh/9QEHPIJUQfyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114860

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-marshmallow_1.2.1.bb => python3-flask-marshmallow_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-marshmallow_1.2.1.bb => python3-flask-marshmallow_1.3.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.2.1.bb b/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.3.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-flask-marshmallow_1.2.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-marshmallow_1.3.0.bb
index 7d87d8c28d..631ea14c3d 100644
--- a/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.3.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "flask_marshmallow"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "00ee96399ed664963afff3b5d6ee518640b0f91dbc2aace2b5abcf32f40ef23a"
+SRC_URI[sha256sum] = "27a35d0ce5dcba161cc5f2f4764afbc2536c93fa439a793250b827835e3f3be6"
 
 RDEPENDS:${PN} += "\
     python3-flask \
-- 
2.43.0


