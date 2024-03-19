Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42DE1C54E7A
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:47 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.8224.1710827203701663180
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=V1yMu9Yi;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827206; x=1742363206;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Ojb6WMzFLA90gqQ5DfWIkdni25c9VKWz9EEuq9Zcuog=;
  b=V1yMu9Yio6CYZgGEyqJjPW5oTrSJMxUqIhdVnqCGBlKGZiz0dq2Gr6y0
   87z1ClORK+Rg53sMEXTbXgUeOIM1GZPscZPvUx74XS+JE0bpf2RL8q4wo
   rSOOh2Uidffc0MWBXsfdJWlhMU5asT6a3bVyW2tkZnrcLysg/aT7eVpCZ
   Ica8kopO445kJdBGbX/XoC1hpgt2OTmjir4NSjNMjIhigPsvqzmD78e/o
   SdqvagXbEDl8bOMsArz4k+rbHjye4By46sU6xy0RqSfJ+qgqERcHvw8SH
   R8NpGFlDq37CIap1oR1zq1GfmUAl9V7s1P+oBex23YGOXWWjUBcQ75HJM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="131999409"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="131999409"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:45 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 22B732A0E02
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:43 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 603A67FD75
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id ECC4A2009325C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8D4041A006B;
	Tue, 19 Mar 2024 13:46:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/50] python3-ipython: upgrade 8.22.1 -> 8.22.2
Date: Tue, 19 Mar 2024 13:45:22 +0800
Message-Id: <1710827139-30056-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10-0.854400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrNte7AWpKXSuU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa0BQOqUsWgx5oFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXL0wQsakgojkAocUrJdJ95NBX3HqysndQMBcy
	oi4G2gDgHURG9eYLmcVpYL3142O36c3nJZyHITxm86LtOHQgRZU0XN5188caP+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109450

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Reexport arg_split on emscripten.
-back to dev

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_8.22.1.bb => python3-ipython_8.22.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.22.1.bb => python3-ipython_8.22.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.22.1.bb b/meta-python/recipes-devtools/python/python3-ipython_8.22.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_8.22.1.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.22.2.bb
index 6571eda7b..b8595fe9c 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.22.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.22.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "39c6f9efc079fb19bfb0f17eee903978fe9a290b1b82d68196c641cecb76ea22"
+SRC_URI[sha256sum] = "2dcaad9049f9056f1fef63514f176c7d41f930daa78d05b82a176202818f2c14"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.34.1


