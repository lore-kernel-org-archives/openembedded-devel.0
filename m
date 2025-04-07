Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ECBFC369AC
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:38 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.42483.1744017450798059012
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=grrB6DvK;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017451; x=1775553451;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=D4PcC3sUij2TKhZwWhADRa2feIFXU0JXaDe+W8iVIQQ=;
  b=grrB6DvK7XzVTKqNUpGtN7VdEaBxKWNIwIzPHePPwWEXu9Q1qdj0IVQV
   vr/TIziEAALvcpywY5ET5uDz4+mQOH4r8W995/1IK0wQDea01xoRdYFC8
   crqqRhBqh/F4jnbS/CuV/nEC31hURabp2QOdxw9G4TPIN84nfGcwNwYt8
   dAJC+U+7Mab5LcBbVyYjDQsFmEjr4QCXGGu/nSkmaCO2u6GG2QGf3dTnc
   dEZKDAKAcIs//IoI82qOrbP5tW6TMYCFMocxi00y4G5lLYZ+FkfJG3Joa
   nWCIHEdm0bREGi7/USxH3Z1AlGSYB/WZKh2ztqSU9rKscFZ5FqUztFRo6
   A==;
X-CSE-ConnectionGUID: uX+DDbhHTgyYYPofyGsPBA==
X-CSE-MsgGUID: +OIjumchQNCSlFLRH5K+YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="195694341"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="195694341"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:28 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 761D5C226A
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 38946D4C3B
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:26 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E937B1A0071;
	Mon,  7 Apr 2025 17:17:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/30] python3-multidict: upgrade 6.2.0 -> 6.3.2
Date: Mon,  7 Apr 2025 17:16:58 +0800
Message-Id: <1744017431-22217-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116642

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-multidict_6.2.0.bb => python3-multidict_6.3.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_6.2.0.bb => python3-multidict_6.3.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb b/meta-python/recipes-devtools/python/python3-multidict_6.3.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb
rename to meta-python/recipes-devtools/python/python3-multidict_6.3.2.bb
index 8b30574020..4e4d69bbd4 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_6.3.2.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 PV .= "+git"
 
-SRCREV = "af07d5b2b18bb30e041983db2bea1fcb3e1c4b79"
+SRCREV = "0d667589cd02c8ce8251226f8f64fd86afd7ffa3"
 PYPI_SRC_URI = "git://github.com/aio-libs/multidict;branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
-- 
2.43.0


