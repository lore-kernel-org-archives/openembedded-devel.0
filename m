Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB56CD129A
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:43 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.39357.1711983100517075574
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qdxGO9vD;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983101; x=1743519101;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NEBFtgaJPtMemh05rvS1UMobm+SiXDqlN1/mFqAdWt8=;
  b=qdxGO9vD2/5izt9SVWBxZ8YT4HLqZvuGJXax4xkf1yvjFBffAmNAEbDo
   vbtnw7EzebOIV2iC3Nlogwk8RGOWua9/lpfxcXWXAedPH4ZNy9E3ENumZ
   eHwPlqPIeNkPqB+9mpaKnA/MY9FO9DN0NV0g9SSYfn48tQBX9SmpYYW/e
   3I76KRD0MNEF1Yfpt1mGd81JG6J27dvfE3lRtzeCq8v4aOi5/X3TDv88+
   t/jW1Z5FmeCnZeHddXo+dMBl+CILrcZ7ZCudy81uVhLT0Wt5FkArC2yFy
   gMshj9+kDQtQG+cfbXNEDJ+YAT9vjoYQBE3HwKncwItQ80vn5uPRgDIrX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="133627000"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="133627000"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:39 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6B39EE48C8
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:36 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A7985D5602
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3588C227AA8
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DE63F1A000A;
	Mon,  1 Apr 2024 22:51:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/47] python3-google-auth: upgrade 2.28.2 -> 2.29.0
Date: Mon,  1 Apr 2024 22:50:54 +0800
Message-Id: <1711983079-16849-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10-1.146000-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrB8N4SAwGIo7sB9h4BclZPvKj
	TM8u7G174K9FmervsqX+kfjo+nx5BG0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDKIp/k2x3jvkS1h1eUc+p68rWL/xQJnm46eAiCmPx4NwGmRqNBHmBve3lNiXXOK75AQlc
	/KvwU4CCdET58jp62SGhgxjQRTkiSuqmhUUoqczoQX3LXA7J9/cuxvSHxqnWyzEr5wGcPR91b7z
	Wkslb4SxJFVv+mDH0DpctFKUkl44EynQRCoJahCS7+RMq/2CK6rA4c7UV2fQpvi2PQO/FFQiz2u
	jrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109739

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Adds support for custom suppliers in AWS and Identity Pool credentials
-Refactor tech debt in aws and identity pool credentials

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.28.2.bb => python3-google-auth_2.29.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.28.2.bb => python3-google-auth_2.29.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.28.2.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.29.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.28.2.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.29.0.bb
index d344b7016..e8d438df0 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.28.2.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.29.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "80b8b4969aa9ed5938c7828308f20f035bc79f9d8fb8120bf9dc8db20b41ba30"
+SRC_URI[sha256sum] = "672dff332d073227550ffc7457868ac4218d6c500b155fe6cc17d2b13602c360"
 
 SRC_URI += " \
         file://run-ptest \
-- 
2.34.1


