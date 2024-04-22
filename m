Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30858C10F19
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 09:16:21 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.14073.1713777373314830962
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 02:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gqGuaw8m;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713777373; x=1745313373;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jidZN6RR0m8qpxgPtDclWBMuwVj4ijtRM5METzWC+rE=;
  b=gqGuaw8mU8FQV/cvobQ8miqNzI00ShtErGYvF4qhq3tS6qw+YezB0TWz
   7nWUjUp0hRyQ4pw6iLR6G1oxE5GllwpXVUkJIudfAw1Zo22iwqwcYbN8Z
   6owQYYucFQ83GT9ts1d4myPGYrTlkuGVPAJij10RiHc46i3Z67LDvg4yD
   EU8dd9ry6Fzje7Gzoed0vG3vNYXRQo2nO9AKhj6FWq06H9mSVlGlicFPA
   VZV1ATIp09ZvfM17vyVjpbo8G01eNgeHYzdy0IF2iA3OZz+Yq6m4V3qyt
   3Vi3sAR8YLq7fgxzhsR5zgQvcwjWVzD6sQf13vb+HGz5F0E0KMcsICFJW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="156594051"
X-IronPort-AV: E=Sophos;i="6.07,220,1708354800"; 
   d="scan'208";a="156594051"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 18:16:10 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D057C2ABE
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:08 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id CFD6F1590B
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6AE9B20093278
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 152781A000B;
	Mon, 22 Apr 2024 17:16:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/15] python3-pymisp: upgrade 2.4.188 -> 2.4.190
Date: Mon, 22 Apr 2024 17:15:40 +0800
Message-Id: <1713777345-29264-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
References: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28336.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28336.006
X-TMASE-Result: 10-1.229000-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOuce7gFxhKa2+OGVbYwYsiZtwlo64JqFBlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzSrDj4F59F0wJ2S
	7R2nk1L+Alts/thJ8OmarA14M04UL/4kNzDHClWwX7fLt2V7cD6HZbLpFhJq0lZbHCv5snMODAK
	BXptdEgiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 09:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110094

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Correct way to convert bytes to string if orjson exists.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.188.bb => python3-pymisp_2.4.190.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.188.bb => python3-pymisp_2.4.190.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.188.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.190.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.188.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.190.bb
index 59a00be15..c1389982d 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.188.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.190.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "c2313d059a9f4d1221243fcda64fb8ae11603c1745e92d57c4071aad04336696"
+SRC_URI[sha256sum] = "e7374295bfd8c7d25f56867e4395a029433360d95420e39b7f78eb1d4f8b48b4"
 
 inherit python_poetry_core pypi
 
-- 
2.34.1


