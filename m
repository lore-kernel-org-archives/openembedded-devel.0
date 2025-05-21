Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942BEC5B558
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.6738.1747817995896623808
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 01:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aM6vjxKk;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747817997; x=1779353997;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=HQVglbU6A0WW00XnZA/oUIeJ5Kd5VsyzVN8DAHtk3uw=;
  b=aM6vjxKkzifNz/dcY8f9ehQrRs52cLku34+cIyDWjV0MBgqp4cM26nDU
   zPW0Be+byv6/6qoCiYGRlC2pzDUQk/IFRiwWbTe4zN8yFGtz1l3lOp9z4
   /HwHK4c31ly5c33do9DhECc9alxueAezOLPmyimmYfNXxw8XObzbVU0+x
   BrVS/JqaW5wRhewEqMV/yuMH/tftdMhn7mYYcWoHYgFu5ls5uCulAC0EO
   rwNhmOG4XDaWhhyczRDRRR0MZVAWsfxIpLdLIdgGCyp+Emg8+wwSfBGJb
   0EpvYVjx2m7DZvxQUpHGKeN6eh3e5I3dChIhu8LDOXuTEySroEEM1NsHv
   Q==;
X-CSE-ConnectionGUID: bYhmlYb/RxaZVhK4+oSHxg==
X-CSE-MsgGUID: JXBM3ROiRNCVc2OICYZHAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="200152529"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="200152529"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:59:56 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E9628D5057
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A2588CFA50
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:53 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 235781A0078;
	Wed, 21 May 2025 16:59:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/43] python3-flask: upgrade 3.1.0 -> 3.1.1
Date: Wed, 21 May 2025 16:59:00 +0800
Message-Id: <1747817972-28874-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117536

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix signing key selection order when key rotation is enabled via SECRET_KEY_FALLBACKS.
- Fix type hint for cli_runner.invoke.
- flask --help loads the app and plugins first to make sure all commands are shown.
- Mark sans-io base class as being able to handle views that return AsyncIterable.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-flask_3.1.0.bb => python3-flask_3.1.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask_3.1.0.bb => python3-flask_3.1.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-flask_3.1.0.bb b/meta-python/recipes-devtools/python/python3-flask_3.1.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-flask_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-flask_3.1.1.bb
index 7e1988606e..a1bea8e69b 100644
--- a/meta-python/recipes-devtools/python/python3-flask_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_3.1.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pallets/flask"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "5f873c5184c897c8d9d1b05df1e3d01b14910ce69607a117bd3277098a5836ac"
+SRC_URI[sha256sum] = "284c7b8f2f58cb737f0cf1c30fd7eaf0ccfcde196099d24ecede3fc2005aa59e"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


