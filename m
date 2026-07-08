Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 048E6C44506
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:46:13 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4730.1783503966898586091
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gK9FTL5g;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503967; x=1815039967;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Mpe+AT5hqze9GknBtLmhLD8BXVg79G5w1ef0AHpK0g8=;
  b=gK9FTL5gBJwc3yQnKkD+tVfeg3N5gg8T8f+8bQk1gv7NRTMGLXsF9z24
   SdP9IBJ/69QU6yLb330T5eZPuoZGg17eqxJkzTH6Bbsr01OHzpfXFeTuH
   TwN6So94zlFfWcFbj0bK/yhB3nzgBkBUT4tjlmSRgKdzFVPbaS8xaSyiu
   i/bNge/EuQTTRkA2lL7m2XmLIuLvdu8vS57bZurKaeqAcxxF8Iz0AcsPs
   PxJYXwJ5iiuLzHo300yRRIwbWwWGhs/hD1eqWYrZ42sTojfluWa+Dejkd
   mztVa7W6Zwx2aHx8fvrvrriocqdh9CsAwci3NdQ0oAo7biBO18cdlahaj
   A==;
X-CSE-ConnectionGUID: C1BcQG0ATNWeqZlghgJtQg==
X-CSE-MsgGUID: ykZIeP1RRG+p2VEKq5pkaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="250142805"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="250142805"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:46:05 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 578831892
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:46:05 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 0C267102096F
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:46:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 202C41801139;
	Wed,  8 Jul 2026 09:46:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 32/37] smarty: upgrade 5.8.3 -> 5.8.4
Date: Wed,  8 Jul 2026 17:44:42 +0800
Message-ID: <20260708094508.2060-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:46:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128103

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fixed a 'TypeError' on PHP 8 when 'Security::$static_classes' was set to a
  non-array value (e.g. the string ''none'') to disable static class access;
  any non-array value now cleanly denies access. Use 'Security::$static_classes =
  null' to disable access to all static classes.
- Security: the built-in 'stream:' resource type now validates the nested
  stream wrapper against the security policy, so a template such as
  'stream:php://filter/...' can no longer bypass 'Security::$streams' (including
  'Security::$streams = null') to read local files

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/smarty/{smarty_5.8.3.bb => smarty_5.8.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/smarty/{smarty_5.8.3.bb => smarty_5.8.4.bb} (95%)

diff --git a/meta-oe/recipes-support/smarty/smarty_5.8.3.bb b/meta-oe/recipes-support/smarty/smarty_5.8.4.bb
similarity index 95%
rename from meta-oe/recipes-support/smarty/smarty_5.8.3.bb
rename to meta-oe/recipes-support/smarty/smarty_5.8.4.bb
index f0779efb7e..dcb7c85a80 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.8.3.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.8.4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c0f216b2120ffc367e20f2b56df51b3"
 
 SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "042dff64a912c272e7692a442590880a3388c4b9"
+SRCREV = "94a27cbbc7820198d7adc17a2be8d457fb267753"
 
 
 INHIBIT_DEFAULT_DEPS = "1"
-- 
2.43.0


