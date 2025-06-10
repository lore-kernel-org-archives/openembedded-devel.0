Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27A6C7114B
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:02 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.77956.1749526432094742799
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=D2l50tf7;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526435; x=1781062435;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xe+/N9ZbpgrtFLlr9MMEdPu7/moFqti69Z3XYzAXY/E=;
  b=D2l50tf7YhQ7/6J6xPBPcAs95K76Qr4GB//8cjaKBwiRNCyb+lTG5O9f
   BapZUCiUm9sIK4WYDd+qoWhQKuYaXa/4d1khDpXWtsngKWVE8ZFsGJnlI
   7sEGfmC5pHZOWhxNhqJLo6p+SaNLuRE6LlGypSRaSqYitRQq4gjeSVhS8
   3jUJbHviAbwmZDgEAxKTbJh1jUgEu7KYL2LqMEOOjeBHK7sg5IVlGjFjW
   6F0GbcFrXuPyO1GhIpUuUUNgtsJcBd3n1qCXtIg2RG37T1b94FqGXkyIl
   ikT7G+yT3uihZ5PophJXvj2SskP4xIFAFyJRsjKvbQwsProGaqSuNocWl
   w==;
X-CSE-ConnectionGUID: DQ+I9zq6S0+VW1sIIGar/w==
X-CSE-MsgGUID: s/e0w+QiTWWPtoGcGFqNvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="190662489"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="190662489"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:53 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id DA8EAD4C24
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7BEC0BF3C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:51 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 03B5E1A009A;
	Tue, 10 Jun 2025 11:33:50 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 47/64] python3-py7zr: upgrade 0.22.0 -> 1.0.0
Date: Tue, 10 Jun 2025 11:33:13 +0800
Message-ID: <20250610033330.924-47-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117838

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-py7zr_0.22.0.bb => python3-py7zr_1.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-py7zr_0.22.0.bb => python3-py7zr_1.0.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-py7zr_0.22.0.bb b/meta-python/recipes-devtools/python/python3-py7zr_1.0.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-py7zr_0.22.0.bb
rename to meta-python/recipes-devtools/python/python3-py7zr_1.0.0.bb
index c5cf1e8362..61a9a5569b 100644
--- a/meta-python/recipes-devtools/python/python3-py7zr_0.22.0.bb
+++ b/meta-python/recipes-devtools/python/python3-py7zr_1.0.0.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPL-2.1-or-later"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "c6c7aea5913535184003b73938490f9a4d8418598e533f9ca991d3b8e45a139e"
+SRC_URI[sha256sum] = "f6bfee81637c9032f6a9f0eb045a4bfc7a7ff4138becfc42d7cb89b54ffbfef1"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


