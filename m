Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A29C83013
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:11:57 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.13707.1750662711352179060
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kRD0aEiT;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662712; x=1782198712;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sGF2Kc8ge9F6ZJL16UcjP904TV6D804vtJPVD2fDxPA=;
  b=kRD0aEiTZb42Fg4/cYhb4IsYo38NYxOmZejNN+4qyA5j670wgR/0iGcs
   dwtGYJgQEcUPZ20TNSiS6xzJ11pQxUkpApip+qPVwbzPpJDm6uI3cKEpP
   khGozkv6hNYRsOwIUCzW8oKaVjlgUgrdVzXqvaJ+X3S0m+b/HFF+y7vhw
   Tqv3WJFXSZ6dwyolrIvlPkR/uKQFJOkYyfNNPDLXpjGJ0AONWhA9PF3Ha
   uyP4D/tzz4b/qkgS7Rz2BTM6J/T0bJsA/edoqFEYQhDa04/8Ol2bdVNHA
   kgplTFpaaYXs2U/53t+g4KXfdbB5hgKZhuV3Wni9lW+rJcT5kmhZ2p0cU
   Q==;
X-CSE-ConnectionGUID: +m0vQ4KkQB+0mevy5d84gQ==
X-CSE-MsgGUID: io+elNtlTvWPkI4F38aa3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="202852338"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="202852338"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:51 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 36851D5053
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E0F0DD9687
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:48 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5CF021A0071;
	Mon, 23 Jun 2025 15:11:48 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 08/30] python3-a2wsgi: upgrade 1.10.8 -> 1.10.10
Date: Mon, 23 Jun 2025 15:11:15 +0800
Message-ID: <20250623071138.402-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118033

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-a2wsgi_1.10.8.bb => python3-a2wsgi_1.10.10.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-a2wsgi_1.10.8.bb => python3-a2wsgi_1.10.10.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.8.bb b/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.10.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-a2wsgi_1.10.8.bb
rename to meta-python/recipes-devtools/python/python3-a2wsgi_1.10.10.bb
index b9daf044f0..699fc2daa2 100644
--- a/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.8.bb
+++ b/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.10.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e10d05d29ec6d8be8bfc503683f1bc9a"
 
 inherit pypi python_setuptools_build_meta ptest
 
-SRC_URI[sha256sum] = "fc00bab1fc792f89a8ce1b491b2ad1717b145d8caefb75d0a8586946edc97cb2"
+SRC_URI[sha256sum] = "a5bcffb52081ba39df0d5e9a884fc6f819d92e3a42389343ba77cbf809fe1f45"
 
 DEPENDS += " \
         python3-pdm-native \
-- 
2.43.0


