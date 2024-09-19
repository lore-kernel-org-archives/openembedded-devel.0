Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1217CE8D56
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:49 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.11431.1726716761383500340
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kETBf9SF;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716762; x=1758252762;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=keXZcHO3b3JEGAZ/L9PQF/4IIy2VawRPce8Qjd7/1f0=;
  b=kETBf9SFa/F+mQoqdVaBWYFdI+RQLVMMja581ncg3OeWRHMo3pyalrPK
   e/T5/bVBVH9S+fHYhRVCMwT4XqfiOpT1M0oeEUyDOghvEzaNsgWMlXGr8
   ehA47M76o8jU51WoqwEBh+hytkk5WxPNxrfQBgyjLzhZ/YAKsIvTpkcCE
   apYho4TMwTB7zDZj3cuaq6vwMvwpULUJ6ATi9y65V/xckjVpqAhrqe+bQ
   qjDwCZrr6fPUSeQ+PAmzElBndS9ENY4Mtg7LOuHHZE2dhJ4pTxN0IP2fm
   LguGiebrztvipamUyqbrCX6fzICmQR0GOOlKwokoAlVMEmNTb+unjy7JW
   g==;
X-CSE-ConnectionGUID: vyTrFh4YSUme48M3dYSN3g==
X-CSE-MsgGUID: GgEjyLJNSEWipdSWZfg+TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="174102938"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="174102938"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:39 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id F079AD4F54
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:36 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 26F5CD510C
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B4DF720086EB0
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6185F1A01E9;
	Thu, 19 Sep 2024 11:32:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/28] python3-regex: upgrade 2024.7.24 -> 2024.9.11
Date: Thu, 19 Sep 2024 11:32:05 +0800
Message-Id: <1726716733-14548-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10-0.313400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrSc4iQ7VD4M2U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa2YkAyCbA7KV5soi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62ShlKDpxNznwpUCjJdiJ1tvk0wDBwXD5Typs3jFZTq47zh57
	8DPUvoJa/Cul+Z2+naoBgym6qXgk2IJAf8abiRRQyDPsEkdmwCS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112379

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Updated to Unicode 16.0.0.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2024.7.24.bb => python3-regex_2024.9.11.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2024.7.24.bb => python3-regex_2024.9.11.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2024.7.24.bb b/meta-python/recipes-devtools/python/python3-regex_2024.9.11.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2024.7.24.bb
rename to meta-python/recipes-devtools/python/python3-regex_2024.9.11.bb
index b6e09fc83..8fbae0cdc 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2024.7.24.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2024.9.11.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "9cfd009eed1a46b27c14039ad5bbc5e71b6367c5b2e6d5f5da0ea91600817506"
+SRC_URI[sha256sum] = "6c188c307e8433bcb63dc1915022deb553b4203a70722fc542c363bf120a01fd"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.34.1


