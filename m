Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77167C2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:05 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.6737.1747817995751750177
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 01:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IOeAgx0H;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747817995; x=1779353995;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=hPXsmnya3yYiMTY3xJQpaF+CwiSyI0sMp+hWQcqQlqw=;
  b=IOeAgx0H2kluIjsVQAcVvJCKwF3buqlCt2e2xJ7LneUYO+U9PYDUPup9
   ctxm0ZHwAhZA0BdPf3hNFt8POLF5p5W3qDTTc127AuLkWRCaE1FnhxtTz
   UmbfjY94JWxAlMPnPgU5aueR5i7LDMzZ1YlO9m7+cLFzTZSdaCHiyjJcZ
   Q7D+Cx9t21E4yYqGyUP1DNtl1p2PR0VLQ0CljUoG6yDWZHezOkmFa2/9Q
   /b1STFYwZ2HDxeyasg3YqF9xFJMQnaQBJuV2grH91l/pHeVaMf+G4+bY3
   bqNi6qZA8h0M8hCoQSAzvIKUBevaQxXLUPVM7YhQuNuHEyU8kKaezNK/L
   A==;
X-CSE-ConnectionGUID: 4+b0vgltQziL6qrB2WqYEA==
X-CSE-MsgGUID: +JV+cTYeQnGy2i0kqLMlvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="179076126"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="179076126"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:59:53 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7A770D4C24
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 29F9CBDCBB
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:51 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AEEE01A009A;
	Wed, 21 May 2025 16:59:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 02/43] python3-apispec: upgrade 6.8.1 -> 6.8.2
Date: Wed, 21 May 2025 16:58:51 +0800
Message-Id: <1747817972-28874-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117527

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- MarshmallowPlugin doesn't override additionalProperties explicitly passed to fields.Dict
- Perf improvement to filter_excluded_fields

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-apispec_6.8.1.bb => python3-apispec_6.8.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-apispec_6.8.1.bb => python3-apispec_6.8.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-apispec_6.8.1.bb b/meta-python/recipes-devtools/python/python3-apispec_6.8.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-apispec_6.8.1.bb
rename to meta-python/recipes-devtools/python/python3-apispec_6.8.2.bb
index 7619210eb9..28b31991cf 100644
--- a/meta-python/recipes-devtools/python/python3-apispec_6.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-apispec_6.8.2.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a75956865b40c80a37c1e864716592b4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "f4916cbb7be156963b18f5929a0e42bd2349135834b680a81b12432bcfaa9a39"
+SRC_URI[sha256sum] = "ce5b69b9fcf0250cb56ba0c1a52a75ff22c2f7c586654e57884399018c519f26"
 
 RDEPENDS:${PN} += "python3-packaging"
-- 
2.43.0


