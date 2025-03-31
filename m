Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60ED7C3601B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.47785.1743412323595887987
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Q9ArChUJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412324; x=1774948324;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=J3sYbBJk1JvFm1F2dt6+P92bo5Wk4ayeZZ/OuZ4/LqA=;
  b=Q9ArChUJmbaeL5dvzhd2wwrfA9hV8HjPBRTdKq/1NqM9Fn6wH3t+646m
   eK8x4uyMb3F1NLM6YkHEKHuqBXzCzuFjKn7cOIisw4KuoFiv6W73XRlm5
   3IcIYxczXXn5sGkHbsjkJX3U03ICOxuXKzADSwTs0D6DUiuC2Z47k1ckW
   Va944Rnfa2RWzDv0FuRHxrmmlGAWWHYl/FCeWpfOLrQH2y6igdk47zhnD
   CZlgeHwe8OKxwrL47rQyFtjPbfaRdorK+769ijDFmX3uVx/rXI8oScXeB
   mO3/huEzMd0R19rC+RJa7yzw59hD0PdMCT8belT9hdj3L9dtD+Yuvl3ps
   A==;
X-CSE-ConnectionGUID: ws17OuRTQy6QLK86eqWbdg==
X-CSE-MsgGUID: UglugA3gSA6HgJdzahQOJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="173852159"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="173852159"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:12:03 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 172EDD5022
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:12:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C99A5D5093
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:59 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 897E41A009B;
	Mon, 31 Mar 2025 17:11:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/26] python3-pycodestyle: upgrade 2.12.1 -> 2.13.0
Date: Mon, 31 Mar 2025 17:11:42 +0800
Message-Id: <1743412308-21887-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116416

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-pycodestyle_2.12.1.bb => python3-pycodestyle_2.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycodestyle_2.12.1.bb => python3-pycodestyle_2.13.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pycodestyle_2.12.1.bb b/meta-python/recipes-devtools/python/python3-pycodestyle_2.13.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pycodestyle_2.12.1.bb
rename to meta-python/recipes-devtools/python/python3-pycodestyle_2.13.0.bb
index 9572d21f3b..f690d97b94 100644
--- a/meta-python/recipes-devtools/python/python3-pycodestyle_2.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pycodestyle_2.13.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a8546d0e77f416fb05a26acd89c8b3bd"
 
-SRC_URI[sha256sum] = "6838eae08bbce4f6accd5d5572075c63626a15ee3e6f842df996bf62f6d73521"
+SRC_URI[sha256sum] = "c8415bf09abe81d9c7f872502a6eee881fbe85d8763dd5b9924bb0a01d67efae"
 
 inherit pypi setuptools3
 
-- 
2.43.0


