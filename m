Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BDFC36003
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:38 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.4164.1741683327713565964
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jSb3Vfd5;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683332; x=1773219332;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WGzhCsSdHE1ClqTrckS3cpEkv/M0JXZ9apg2NMVa3bY=;
  b=jSb3Vfd5yUMhvdbywnW+MyPJeNm9SUchkJmw4ZAK2UiwFnV2lh/Ny9DC
   xpA/ugw/WfM63AZQWh4dqV4vzExsgTxxs34lKz9w/tCLYFhC4Y57LWs07
   3PkjYQO9qLy4jqZ2fY4YwikdW3uZxUSiy7vT66Jh/6DCOzgNY6vISMe7e
   zue+K+B2lxpIcaz0A6mkEsf+ENihO0zsOBDktxr8QXOaM2DAXfb4HdWca
   3aTWJBL7gbDLAyqzEXPe4yR5AG2XVreedhef9EyJ20Fyfik9I7KWfVJyg
   yrZvcLLtyKFONK9wKH+cNQ/cj0JXo3GQmmy/jPAeHJNooHDNxtcPsmlLV
   g==;
X-CSE-ConnectionGUID: GfTcB9RfSPqRNsF4MCpnag==
X-CSE-MsgGUID: DguXRBN3R/yQ//H0CPtYwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="180034247"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="180034247"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:31 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 09860E0767
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C1417D50B3
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:28 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5B24C1A009B;
	Tue, 11 Mar 2025 16:55:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/36] python3-elementpath: upgrade 4.7.0 -> 4.8.0
Date: Tue, 11 Mar 2025 16:54:52 +0800
Message-Id: <1741683310-8681-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115867

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add full PSVI type labeling in XDM to solve type errors with XSD 1.1 assertion-s
- Add schema optional argument to dynamic context
- Add a RootToken as a proxy of the parsed token tree for compatibility with xmlschema<=3.4.3
- Extend XDM to split ElementTree/lxml processing from schema nodes and to allow future extensions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-elementpath_4.7.0.bb => python3-elementpath_4.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_4.7.0.bb => python3-elementpath_4.8.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_4.7.0.bb b/meta-python/recipes-devtools/python/python3-elementpath_4.8.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-elementpath_4.7.0.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_4.8.0.bb
index 2a9eb43b5e..912a7a00d1 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_4.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_4.8.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "a2029dc8752fcfec49663d1ed1b412c6daf278c0c91938f50f63c4fe9ed1848e"
+SRC_URI[sha256sum] = "5822a2560d99e2633d95f78694c7ff9646adaa187db520da200a8e9479dc46ae"
 
 PYPI_PACKAGE = "elementpath"
 inherit pypi setuptools3
-- 
2.43.0


