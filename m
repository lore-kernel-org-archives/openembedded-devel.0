Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D7FCFC525
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:24 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.50498.1728896176490697559
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=USz5kxP3;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896177; x=1760432177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=am41aPLzUXsm9ovjHnoDtNLYe3Hn0EOa+NDa2YSdgys=;
  b=USz5kxP3UyK4A0WwH58khYIgEsyfy+MI7nnrj2mFn01ggwR5J8TCx9G6
   G4IymbyZGvYxrGkmk3Wmc3Taecvc6dRyi04KX4X3IsntBvtfSdiKrfpbs
   tfIcF0PIY7JfPkOpR4PsCQovwhRhOSKXEltR6rZlkAu9rgMF5qgfLc0ab
   9NBNW3Qb3U9CwO55XYjnC59Fjqxe3uftw40yahI9uuwNoZL1iRQo9LxVM
   9cO/Oovml1VbLdrdICKuAeHJZUg9uqaClxyHXTTmQm0aWw7T5zY0HNxWK
   zc7j1oxHCo8aTjy3efH8UjD95RBWF6Ktr8guASZ5X99tJe92ce92TenW8
   Q==;
X-CSE-ConnectionGUID: h1k5rEWrSFe+w6RClZ3EVA==
X-CSE-MsgGUID: W6AKild3QOitGS9SybaQsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="175895934"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="175895934"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:15 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4B4BCD4334
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B4AED752B
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 07A3620071A28
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C5D001A000A;
	Mon, 14 Oct 2024 16:56:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 43/54] python3-termcolor: upgrade 2.4.0 -> 2.5.0
Date: Mon, 14 Oct 2024 16:55:04 +0800
Message-Id: <1728896115-2944-43-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--1.003600-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqz0tC1XEqEg676p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXJ/XtXar9YiW0YsmYe604jVk7OEMGtvs7xJu9
	g0KxS39TTvBBJs4Ep4sViTOZPIxTpEis25UOtP3daCswCUhPJV0nwM7vLrG5r+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112895

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Add strike attribute
- Generate and upload attestations to PyPI
- Drop support for Python 3.8

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-termcolor_2.4.0.bb => python3-termcolor_2.5.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-termcolor_2.4.0.bb => python3-termcolor_2.5.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-termcolor_2.4.0.bb b/meta-python/recipes-devtools/python/python3-termcolor_2.5.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-termcolor_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-termcolor_2.5.0.bb
index ea6b68399..6df8341c8 100644
--- a/meta-python/recipes-devtools/python/python3-termcolor_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-termcolor_2.5.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=e5f5f7c9b280511f124dba5dda3d180e"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "aab9e56047c8ac41ed798fa36d892a37aca6b3e9159f3e0c24bc64a9b3ac7b7a"
+SRC_URI[sha256sum] = "998d8d27da6d48442e8e1f016119076b690d962507531df4890fcd2db2ef8a6f"
 
 DEPENDS += " \
 	python3-toml-native \
-- 
2.34.1


