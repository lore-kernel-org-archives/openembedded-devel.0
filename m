Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48077C021A8
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.46626.1739178120512085675
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TG86owR3;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178122; x=1770714122;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=EFQVCe3FOpUBV/MBb6FkP8XxwWxIHZr36PN84e5J8nE=;
  b=TG86owR3cmGesouzQlexje10nG+vDRomhnp6GeOL9UaN59Jvuqj8ZCzp
   i4KWpWcX0r/jQ8rB2IEUrHtq8B3DwfPK53Py/y8eKg5bxumujJ2lHSGEW
   lgM1J0kThKFyA4pNb4J3MDuD2/AC2ZGcEHLKliqCepi9Ap1A0abUWQOjH
   Vl10iQgtK1Pi1SEt0iyp1487tWHmEB3sen2hQc7G/jH4MIy2sxuGJa0Nd
   RlXerkiYSoq5lwrXYhM8r5ijTqyHLcXNsYe38iMy0d2mwaoI6K3CF6ypD
   UDR41s+GnZug5AhqFYEVahDP7SSQB3ownBmiEcHFMUpJj1CHM7day9ZKN
   Q==;
X-CSE-ConnectionGUID: pHKR8FLUTv667/hrfnTFlg==
X-CSE-MsgGUID: iWdtB6oXSKyOD6arQsE0FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="177444522"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="177444522"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:00 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1913FDC6A4
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D0352D88B1
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:58 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 750311A006C;
	Mon, 10 Feb 2025 17:01:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/66] python3-fsspec: upgrade 2024.12.0 -> 2025.2.0
Date: Mon, 10 Feb 2025 17:01:06 +0800
Message-Id: <1739178095-26432-37-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115364

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- add open() to referenceFS
- don't make async open() in async-wrapper
- fix CI following dask-expr upstream change
- cope with zarr3 "Buffer" objects in referenceFS
- use itemgetter in archiveFS
- document that newline is included in readline(s)
- format/spelling

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-fsspec_2024.12.0.bb => python3-fsspec_2025.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fsspec_2024.12.0.bb => python3-fsspec_2025.2.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-fsspec_2024.12.0.bb b/meta-python/recipes-devtools/python/python3-fsspec_2025.2.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-fsspec_2024.12.0.bb
rename to meta-python/recipes-devtools/python/python3-fsspec_2025.2.0.bb
index faf33d28dd..31e5243d25 100644
--- a/meta-python/recipes-devtools/python/python3-fsspec_2024.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fsspec_2025.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/fsspec/filesystem_spec"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b38a11bf4dcdfc66307f8515ce1fbaa6"
 
-SRC_URI[sha256sum] = "670700c977ed2fb51e0d9f9253177ed20cbde4a3e5c0283cc5385b5870c8533f"
+SRC_URI[sha256sum] = "1c24b16eaa0a1798afa0337aa0db9b256718ab2a89c425371f5628d22c3b6afd"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


