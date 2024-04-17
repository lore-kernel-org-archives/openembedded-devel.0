Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1924FC10F00
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:39 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.2758.1713318098254481968
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Dpvu4bT2;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318098; x=1744854098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=L2I+yKcw7YVpOBBILfwxGj5R5e8dEtJrSWV0NZ3P3sI=;
  b=Dpvu4bT2FHQfv8Z5YuzrqwuOnsl9LKDVcrLRq9uhgNZx3FFoBUPm21ij
   rCy9Iu/BDy36g51I6bEMQBXxhUVW0vOSuTlxa2iN2icyW0eV0+W1ZXRDo
   NzTZh/g3KrNax/1dHbzpEq1c/mOIwvWxG3nSV14ZsMiKZXDWNJJNyKaZF
   vpb57AhSxirbCl0NNFfRULjD3jr1KzJ/F1yIg6w/postUb0FQmek5rCo6
   YjTjuD4OBlTfjSmYW+VuhmH8GBnuytSEt3Ph8khPUR2VxOPaPdwp2J8Rs
   VdOTfDJKO1jK9WoVRRL8Mb0WbFvYiwIRmtF2DbZLWa+XgI5KYGQvsrzKg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="143772378"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="143772378"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:36 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1EBC7D4801
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:34 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B10F1531E0
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D632D200932D3
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 822D71A0002;
	Wed, 17 Apr 2024 09:41:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/49] python3-parso: upgrade 0.8.3 -> 0.8.4
Date: Wed, 17 Apr 2024 09:40:40 +0800
Message-Id: <1713318061-17128-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10-0.250400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mregIHHX2L4YyU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa0BQOqUsWgx5oFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXL1iTaGi4jGbdp2fQxQOaok4z2zOYJdmA4uK2
	R5vbxjc3rwOUrY5GMGdykjL8g3l5EU+iKWk6nbJoglRLWLtIH1gK9xqz3LYlz+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110014

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add basic support for Python 3.13

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-parso_0.8.3.bb => python3-parso_0.8.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-parso_0.8.3.bb => python3-parso_0.8.4.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-parso_0.8.3.bb b/meta-python/recipes-devtools/python/python3-parso_0.8.4.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-parso_0.8.3.bb
rename to meta-python/recipes-devtools/python/python3-parso_0.8.4.bb
index 217c821fb..176bf6f27 100644
--- a/meta-python/recipes-devtools/python/python3-parso_0.8.3.bb
+++ b/meta-python/recipes-devtools/python/python3-parso_0.8.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cbaa2675b2424d771451332a7a69503f"
 
 PYPI_PACKAGE = "parso"
 
-SRC_URI[sha256sum] = "8c07be290bb59f03588915921e29e8a50002acaf2cdc5fa0e0114f91709fafa0"
+SRC_URI[sha256sum] = "eb3a7b58240fb99099a345571deecc0f9540ea5f4dd2fe14c2a99d6b281ab92d"
 
 inherit setuptools3 pypi
 
-- 
2.34.1


