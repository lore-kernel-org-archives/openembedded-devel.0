Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9962C36008
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:29 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.61525.1742893329607333293
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LXcMsekd;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893345; x=1774429345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7ci+68T9aBwxXwEIOjm4MoaBPk0EMqSWkaixsbRCpmM=;
  b=LXcMsekdMuj6d44tUkxpQQm/x9f09yH3FoUQ93fRLJGovQt7/pMi4c18
   txInnYIiZYn/lmxyInVahIEutOipafkgz9vjeRXrwbOM1KCc2KaRq6Tpc
   nmyUML5bAh093amLKnLHiMWpCaQPnzBPOba9eHebpakF8N3V3yILTaJiv
   p120fNXE18+NOGUcUIUKnk/UifGiOjJxqD2IPRDvrY2IHcxfPZWfquhXi
   tD4bwSzxkOCE0c6lYawCz6+7k7ma+Z19vG9FRjNvDN5aFqDNlF9N8TV8Q
   3yxyCVTCLgAa7TUrxecKO2DBlzSDJB7C6ksAC5l7aTy0OmKUNWtwKXead
   A==;
X-CSE-ConnectionGUID: cK1xze8qR/CYv5Lne+0XsA==
X-CSE-MsgGUID: sTsZOTELRc+50SO1D1QMdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="182576347"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="182576347"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:23 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D5130D6EE0
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A7F6FD50E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:19 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 66D791A00A2;
	Tue, 25 Mar 2025 17:02:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 39/45] python3-sqlalchemy: upgrade 2.0.38 -> 2.0.39
Date: Tue, 25 Mar 2025 17:01:46 +0800
Message-Id: <1742893312-3809-39-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116269

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.39

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_2.0.38.bb => python3-sqlalchemy_2.0.39.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.38.bb => python3-sqlalchemy_2.0.39.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.38.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.39.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.38.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.39.bb
index 4b2d049610..fd6853939e 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.38.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.39.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=061025f14213ac2818ff353223d6eca6"
 
-SRC_URI[sha256sum] = "e5a4d82bdb4bf1ac1285a68eab02d253ab73355d9f0fe725a97e1e0fa689decb"
+SRC_URI[sha256sum] = "5d2d1fe548def3267b4c70a8568f108d1fed7cbbeccb9cc166e05af2abc25c22"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.43.0


