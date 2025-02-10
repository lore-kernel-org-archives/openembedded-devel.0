Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B921C021AC
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.46626.1739178120512085675
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JvkbONRa;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178120; x=1770714120;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=iTbHJcWhOJ9+cjRMcB0Nh8ECqIO2zt8qqdfQH0ChaWs=;
  b=JvkbONRaTrcsvH7RHHLBSZ619pASWPyR95SrJ53YcfjrAJ2SFLPbpk0R
   lbxsycauV9g0fLRVlAUOF5oF34VOeZRJgs6fNrPRlwOFv5UhTwQ0VDXLk
   W17NFPvEGLAic3kCKlicQ323sBjXojhnVnehP41ZaKlkX/ixXzk3wceBZ
   iaKGcWp7mBWcF81255GR/clD8y8bW6HztsJLXyI0A0xkHr8hwYD4BZsN/
   Vewql0HPJNfdgX5bmJ/cBreZcihkk7s7yehDNarg0In6PDChdxmhEBYqZ
   C+D8QD7sW4Ja/rdjmOnn0S8W+QUH2H5CiyT6MURb9igF+1JscbBsiuiHe
   w==;
X-CSE-ConnectionGUID: QUDNA6vAR0e76hjWehFzXg==
X-CSE-MsgGUID: RoZ/VcWhSvyAdhppCeL/ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="177444516"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="177444516"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:58 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 49941D4F41
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E44DD968C
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:56 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C823C1A006C;
	Mon, 10 Feb 2025 17:01:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/66] python3-cmd2: upgrade 2.5.9 -> 2.5.11
Date: Mon, 10 Feb 2025 17:00:58 +0800
Message-Id: <1739178095-26432-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115358

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fixed duplicated parameter tables in API documentation.
- Fixed docstring style for MkDocs API documentation so parameters are displayed properly.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmd2_2.5.9.bb => python3-cmd2_2.5.11.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_2.5.9.bb => python3-cmd2_2.5.11.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_2.5.9.bb b/meta-python/recipes-devtools/python/python3-cmd2_2.5.11.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-cmd2_2.5.9.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_2.5.11.bb
index b49bce53e5..45644b4e8f 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_2.5.9.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_2.5.11.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d2b71040983a2abc614fc4d0284771"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "09bb13637832bc818aad5577ccdf5dbeb0c9fbe5b9412ff78d5084f7846f83ab"
+SRC_URI[sha256sum] = "30a0d385021fbe4a4116672845e5695bbe56eb682f9096066776394f954a7429"
 
 inherit pypi python_setuptools_build_meta python3native
 
-- 
2.43.0


