Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63D0C282C1
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:05 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.2300.1740525899545131700
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=h+lKbAjb;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525901; x=1772061901;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=2T0oXPiFJOi6ID0QoU7jezDt0nPlrLFpNzZqvOhee30=;
  b=h+lKbAjbfDlPrcXrzMaIcTzZYXVc5mDqEnuip5xIHG+yOFZLmJvOxtnZ
   95eQ/bipG21QUGufRN7FDI4zU3SdUxq0FpCz+n953NxbTEyNsX7RQfDiE
   QmWShmIwOvSCPviUDjq5LARMB3cQ9NAvd+BxJPSR4ZKbfyAYx9WEUmZky
   7URWzE3O8PQ0Eg/Y4ZP3k34jGEOF14/YtSEZTt7WQXhedAJXWyoFQZ/Vo
   PS1lmLaS59QA6fDIzcS1/fCNHAzPR1kSWMujttXAM2upCMBlt9lfd2QZd
   SM1FhqgMRWquIrp3xBXsijTtzrkylvwrCw3k3LaZrg8utWTE6PQke2wLz
   g==;
X-CSE-ConnectionGUID: 4RWFkFpSR36WqzgE6NOHVQ==
X-CSE-MsgGUID: 1mfZeEQATMqq6NTjFaTpRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="191193467"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="191193467"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:25:00 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id F13AED500C
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B5048C8BF5
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:57 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7AA721A006C;
	Wed, 26 Feb 2025 07:24:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/51] python3-cantools: upgrade 40.2.0 -> 40.2.1
Date: Wed, 26 Feb 2025 07:24:18 +0800
Message-Id: <1740525881-21103-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115627

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Update CDD parser to load all possible data types
- add a strict par to fix EncodeError when init value is bigger than maximum value

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cantools_40.2.0.bb => python3-cantools_40.2.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_40.2.0.bb => python3-cantools_40.2.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_40.2.0.bb b/meta-python/recipes-devtools/python/python3-cantools_40.2.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cantools_40.2.0.bb
rename to meta-python/recipes-devtools/python/python3-cantools_40.2.1.bb
index e80ee2be39..51f97bdd25 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_40.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_40.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "fc75f9fe5b37ef992fafdf981ff822087e1baf18162bbbb35d8b0b1321ed72df"
+SRC_URI[sha256sum] = "dd3bedf69b0dc450a227099d00a913a8bb8febe4a84415eeb55eb6992265c3e0"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.43.0


