Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53D7C71151
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:02 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.77956.1749526432094742799
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=o1LBCCWi;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526434; x=1781062434;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sb61VpGj7n7ztfXkIbZVFVijhFkrT7ETHRntWs5XbQo=;
  b=o1LBCCWiawdN+bgivnAdfCw11X06JnKZKvuaWRCaETPsaTP4IwpnLIWB
   Wyqxcuje5/JIxap6DWvjRZiDe2dRP9vihq6zTRgfaXzDk9noNUwKwCa7u
   1OZkCt7aN6AY3/8c8q+2HK55otdNuYJ/UdWZMfyd8xEmwTQP2LEKBVPrM
   Oa3d3JHih/isNv+7VJnYhdLCc05s6Hl1GqoDkydbciqLnkBtDVUyetxDn
   rV060ZONh0W417/cz+vpVQyjhbYDr/2EVWxIDyZXctK2CloDyKDIUBAaN
   hiQUPtal+15rk+wM8ntqjBQ+bJjDOZO8YKne9n+DflkA9ryrJDeXCDMLn
   A==;
X-CSE-ConnectionGUID: maAM7g2iQ++YL/04iqpriA==
X-CSE-MsgGUID: Jbn3c8gjS/+Kf0X/SpTTUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="190662480"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="190662480"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:52 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B7998D5051
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 67D0DD5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:50 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EBCB11A009A;
	Tue, 10 Jun 2025 11:33:49 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 44/64] python3-mlcommons-loadgen: upgrade 5.0.15 -> 5.0.17
Date: Tue, 10 Jun 2025 11:33:10 +0800
Message-ID: <20250610033330.924-44-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117835

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ns-loadgen_5.0.15.bb => python3-mlcommons-loadgen_5.0.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-mlcommons-loadgen/{python3-mlcommons-loadgen_5.0.15.bb => python3-mlcommons-loadgen_5.0.17.bb} (91%)

diff --git a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.15.bb b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.17.bb
similarity index 91%
rename from meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.15.bb
rename to meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.17.bb
index 26aacde3c9..641ca6d3c2 100644
--- a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.15.bb
+++ b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.17.bb
@@ -17,7 +17,7 @@ inherit setuptools3 pypi
 PYPI_PACKAGE = "mlcommons_loadgen"
 UPSTREAM_CHECK_PYPI_PACKAGE = "mlcommons_loadgen"
 
-SRC_URI[sha256sum] = "803121ffcfb35f86ffe837e4fb09860cf485c581589be70a4950c72a2e54b8fa"
+SRC_URI[sha256sum] = "06410ee545d6959221c7b66e3f3c536c305b3a833dd5f691642f1764d556b990"
 
 # Because the pyproject.toml contains invalid requirements.
 INSANE_SKIP += "pep517-backend"
-- 
2.43.0


