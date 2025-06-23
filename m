Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A06C7115D
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:11:57 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.13874.1750662712468065205
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ePFEJ1Oa;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662716; x=1782198716;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xY7F54Dr7B1iwcQ6sxE9Yk88FFbe93MQChwYeW8mgJs=;
  b=ePFEJ1Oaib6MF7tYTu9+tf+HnwaEiZI/ETJPmtQv4sgyHa0nBGTgO/fM
   C8/aBL6JVZWxiSQ57jqNw/82meTzD1lulmPhs+qXy6Drw5FtQNIsMyYXV
   Khykv4EBZi2TLgjehaA+UqfS8x4ToAICukoo1zwAmT+fHC1kNY2bMPwr6
   D9lpV5AFnfzsW/lVxB1GlYfAjsodv5BuSSxRnqxjkZvNMHGmLsjLAqA5P
   OrF4/GwJYw1ljZpoOP5P2QpTiF/D7n2v3GfO4j1Q905Ara748Dzn7dw/i
   EMoVW52DYBlPW0djVJqnU6cQ/fRCb7sZRierXWQBe2SY6qPW57b6RDVql
   Q==;
X-CSE-ConnectionGUID: gM++NWntS3OHWOYpxD2bFw==
X-CSE-MsgGUID: k/INng9dRYiFeiQ7zTELmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="192069985"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="192069985"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:54 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8DBFBE0ABE
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 47B7BBF3C1
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:52 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BBC891A0073;
	Mon, 23 Jun 2025 15:11:51 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/30] python3-msgpack: upgrade 1.1.0 -> 1.1.1
Date: Mon, 23 Jun 2025 15:11:24 +0800
Message-ID: <20250623071138.402-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118045

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Update Cython to 3.1.1 and cibuildwheel to 2.23.3.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-msgpack_1.1.0.bb => python3-msgpack_1.1.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-msgpack_1.1.0.bb => python3-msgpack_1.1.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-msgpack_1.1.0.bb b/meta-python/recipes-devtools/python/python3-msgpack_1.1.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-msgpack_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-msgpack_1.1.1.bb
index cf755517e7..6704829f7d 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-msgpack_1.1.1.bb
@@ -6,7 +6,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 PTEST_PYTEST_DIR = "test"
 
-SRC_URI[sha256sum] = "dd432ccc2c72b914e4cb77afce64aab761c1137cc698be3984eee260bcb2896e"
+SRC_URI[sha256sum] = "77b79ce34a2bdab2594f490c8e80dd62a02d650b91a75159a63ec413b8d104cd"
 
 RDEPENDS:${PN}:class-target += "\
     python3-io \
-- 
2.43.0


