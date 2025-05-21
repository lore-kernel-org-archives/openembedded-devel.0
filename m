Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0208DC54FC6
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.6739.1747817996288026139
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 02:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bCRPkUye;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747818001; x=1779354001;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=HeDmsVG+1EtmxCxpGqp3pKArTYp0Lladphg82TA1Sc4=;
  b=bCRPkUyea4s0nRkm8s6B94ru9Vl0yQdtm4CqysbVGhUI2E8swOhgDSp1
   fN/psrInN/DQ6SMaJfmB+ZcES9WO7qIrlo/5/QlYuwTnW9XSm7TBSCJ75
   mqyswFpj2MdDbUCXS0sfsb3bXavDidnj+DN6Z82biTRGqPO5pUDZH9Jp1
   zT7S7R9pBI/PY4FD3TPL8eFOLWIZfCL/0YjDK/V6YHQ58WnNwW8xeYFRq
   I5fKTp5r+tDbf8MxsOHf1vM5yn/BerDoG4f5srpxMUN/dV5dJzBje21dy
   fnDkcDfyuTxGJB3HdTCmGo4fUWvVH1KZMyMV4QcOLT2gF6TE+nX2yLyFB
   w==;
X-CSE-ConnectionGUID: ISxchasvQoKfTqHsvEWTrg==
X-CSE-MsgGUID: SOKQYjDfRcmP7jGE1Lm+ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="188157669"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="188157669"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 18:00:00 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E27C0E8FE4
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A5BB9D8BCC
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:58 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 633BA1A00A0;
	Wed, 21 May 2025 16:59:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/43] python3-pyzstd: upgrade 0.16.2 -> 0.17.0
Date: Wed, 21 May 2025 16:59:19 +0800
Message-Id: <1747817972-28874-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117553

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Upgrade zstd source code from v1.5.6 to v1.5.7
- Raise an exception when attempting to decompress empty data
- Add ZstdFile.name property
- Deprecate (de)compress_stream functions
- Use a leading _ for private objects
- Build wheels for Windows ARM64
- Support for PyPy 3.11

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyzstd_0.16.2.bb => python3-pyzstd_0.17.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyzstd_0.16.2.bb => python3-pyzstd_0.17.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzstd_0.16.2.bb b/meta-python/recipes-devtools/python/python3-pyzstd_0.17.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pyzstd_0.16.2.bb
rename to meta-python/recipes-devtools/python/python3-pyzstd_0.17.0.bb
index e1c24404e8..d842a92caf 100644
--- a/meta-python/recipes-devtools/python/python3-pyzstd_0.16.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzstd_0.17.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aedb5a2679cd1552fb61c181ef974b9e"
 PYPI_PACKAGE = "pyzstd"
 
 SRC_URI += "file://0001-Bump-setuptools-dependency-from-74-to-79.patch"
-SRC_URI[sha256sum] = "179c1a2ea1565abf09c5f2fd72f9ce7c54b2764cf7369e05c0bfd8f1f67f63d2"
+SRC_URI[sha256sum] = "d84271f8baa66c419204c1dd115a4dec8b266f8a2921da21b81764fa208c1db6"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


