Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2118C61DB8
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.6738.1747817995896623808
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 01:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YAdCw4KD;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747817996; x=1779353996;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=rD6IBZXok6HK+faVTsybn7fqAhhGtcGDzqud5jiSstU=;
  b=YAdCw4KDV6AemTid4rQuFAjKEeZ0c9PXVqPRfZ5psoPAWlb1j2JBibW+
   aM3uMmgkUAB8SHIcpxIgwpp8jDM3Jgw1mW20CQLGMz0u1NelWapFDJOic
   drVriNH6n1O3o2hLTNNVXV47fEly2Sc2WRHYVDgJjr7XdAg5IdD9gD9Zc
   uMDZpVVlNSw7VOULyszSef/A2Y6Wgi3q8+ITcs5VBChbCYei9Qe/wSN9k
   iY+Y232GAswgrw5q93tf/5Xa+9R07d6kkeMIELsxGU+HwL2v1PUrmZji1
   IOZz2NnM/hzzStvo49htk0hs0F1B0PtaTYwm9P6d7GOA2gVynJLjT2X93
   w==;
X-CSE-ConnectionGUID: /zUJexLnTEqy1fhU8Yn3fQ==
X-CSE-MsgGUID: Q1quNCXUQUueMdYyd35Wag==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="200152522"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="200152522"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:59:54 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A70B2E8FE6
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 692E0BDCBD
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:51 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F195B1A00A0;
	Wed, 21 May 2025 16:59:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 03/43] python3-astroid: upgrade 3.3.9 -> 3.3.10
Date: Wed, 21 May 2025 16:58:52 +0800
Message-Id: <1747817972-28874-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117529

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Avoid importing submodules sharing names with standard library modules.
- Fix bug where pylint code.custom_extension would analyze code.py or code.pyi instead if they existed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_3.3.9.bb => python3-astroid_3.3.10.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_3.3.9.bb => python3-astroid_3.3.10.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_3.3.9.bb b/meta-python/recipes-devtools/python/python3-astroid_3.3.10.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_3.3.9.bb
rename to meta-python/recipes-devtools/python/python3-astroid_3.3.10.bb
index 9617e25e3b..b595335b99 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_3.3.9.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_3.3.10.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "622cc8e3048684aa42c820d9d218978021c3c3d174fb03a9f0d615921744f550"
+SRC_URI[sha256sum] = "c332157953060c6deb9caa57303ae0d20b0fbdb2e59b4a4f2a6ba49d0a7961ce"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


