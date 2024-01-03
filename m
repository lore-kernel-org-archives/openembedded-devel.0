Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F5EC3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 08:40:03 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.13738.1704271194265559664
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jan 2024 00:39:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="133113962"
X-IronPort-AV: E=Sophos;i="6.04,327,1695654000"; 
   d="scan'208";a="133113962"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 17:39:51 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 96209D66DD
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Jan 2024 17:39:49 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D3F4DF2FD4
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Jan 2024 17:39:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 584BA200968ED
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Jan 2024 17:39:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EADF31A0070;
	Wed,  3 Jan 2024 16:39:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pydantic-core: upgrade 2.14.5 -> 2.14.6
Date: Wed,  3 Jan 2024 16:38:27 +0800
Message-Id: <1704271107-17682-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1704271107-17682-1-git-send-email-wangmy@fujitsu.com>
References: <1704271107-17682-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28096.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28096.006
X-TMASE-Result: 10-2.066700-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyu6FTbg6ndROc4a
	vCMaKsA/4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbed1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0X9r
	pBZuBDbYRzPoxVQ+/bFJO9iy0HQY0Hs7zFkB43iOdJ8K9wDfi7oLIlrwQG7mvogvFM3gwjdfq/B
	2UTG+fry6FFKfMLrEG6y0dr49D6q/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jan 2024 08:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108026

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 fix memory leak with recursive definitions creating reference cycles

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-pydantic-core_2.14.5.bb => python3-pydantic-core_2.14.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.14.5.bb => python3-pydantic-core_2.14.6.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.14.5.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.14.6.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pydantic-core_2.14.5.bb
rename to meta-python/recipes-devtools/python/python3-pydantic-core_2.14.6.bb
index 01f180c8c..601ba25b6 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.14.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.14.6.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://github.com/pydantic/pydantic-core"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
 
-SRC_URI[sha256sum] = "6d30226dfc816dd0fdf120cae611dd2215117e4f9b124af8c60ab9093b6e8e71"
+SRC_URI[sha256sum] = "1fd0c1d395372843fba13a51c28e3bb9d59bd7aebfeb17358ffaaa1e4dbbe948"
 
 DEPENDS = "python3-maturin-native python3-typing-extensions"
 
-- 
2.34.1


