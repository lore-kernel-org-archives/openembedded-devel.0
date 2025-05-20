Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D967C54799
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:55:20 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.16486.1747731313345111636
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 01:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WuDRRdG2;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747731314; x=1779267314;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=p0uJt/yJK21jr90tNPg8AtdG1t+luVUZmx0FNsUqcdk=;
  b=WuDRRdG2WM2Jonfzom4q6Z0BXMgCm81rpHqmMa17t0UXj5TBykR5SGVC
   MhBn0H+mLV/LN/u8jvPmSIZpA6vFr2LTFO/c3niwtJsrsrdsiZggD3U0J
   yITEGoEU8pr8C/wz8SK0+nqtD9f+po3/5jar/XhyYO6B3YVBKSox+nyXs
   il8fYeA/NpMb4rIeQRD76WNXW//0mP3ySBj5XrYPMM7VVhoSMYGPaBLoW
   cktpXx+iMpu0TfOib8AfHWHoSbE3dHlC+G71z2KEd1bwYNcTp6KLIQmF4
   1x0vwvwd+/cLkxc/x5OdC0ZlvLnnF7PQcS+hvTNuVs49PECMMZbpRbcOD
   w==;
X-CSE-ConnectionGUID: JrFSq4NgST6FrvGtxcOQBA==
X-CSE-MsgGUID: UJ6QfAuxQbOeectFWo+5CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="179533915"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="179533915"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:55:13 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 56254D5057
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 16581F336
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:10 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9D8791A0078;
	Tue, 20 May 2025 16:55:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/27] imapfilter: upgrade 2.8.2 -> 2.8.3
Date: Tue, 20 May 2025 16:54:36 +0800
Message-Id: <1747731299-20448-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
References: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 08:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117486

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Include body transfer encoding in fetch_structure() return value.
- Bug fix; minor incompatibility with Lua 5.3 and 5.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../imapfilter/{imapfilter_2.8.2.bb => imapfilter_2.8.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/imapfilter/{imapfilter_2.8.2.bb => imapfilter_2.8.3.bb} (88%)

diff --git a/meta-oe/recipes-support/imapfilter/imapfilter_2.8.2.bb b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.3.bb
similarity index 88%
rename from meta-oe/recipes-support/imapfilter/imapfilter_2.8.2.bb
rename to meta-oe/recipes-support/imapfilter/imapfilter_2.8.3.bb
index d47bcc3a58..7b6ed6fdd9 100644
--- a/meta-oe/recipes-support/imapfilter/imapfilter_2.8.2.bb
+++ b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.3.bb
@@ -3,8 +3,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f8d2fc4954306888fd0e4b27bef83525"
 
 # v2.7.6
-SRCREV = "9e6661278572009a92a8e125c9b339232a9735a1"
-SRC_URI = "git://github.com/lefcha/imapfilter;protocol=https;branch=master \
+SRCREV = "72f7fa621357299bb6c8f5d29b4efbafcbd34bf7"
+SRC_URI = "git://github.com/lefcha/imapfilter;protocol=https;branch=master;tag=v${PV} \
            file://ldflags.patch \
 "
 S = "${WORKDIR}/git"
-- 
2.43.0


