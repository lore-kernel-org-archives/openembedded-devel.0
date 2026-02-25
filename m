Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE8CEFD227
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:38:01 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41949.1772012273283836627
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:37:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gTGKd0Y9;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012272; x=1803548272;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p0y7mbKnmY4TlTq9RcZg+5EaTmt9uplMkFEXr1enzGw=;
  b=gTGKd0Y9XttCPR66z3Y25+wZbnmMRkyLiDEL81Q0PeS5DBzGt/XSa2Ns
   YQiCP2B1TYaU75JbMkEFuzyOCqcZmsOOeVeMRDQsmc5A54v8UbjXKG/Qu
   IQQMNbssPy6pj/p300NKVkYB4nfRiu248J5zU+gA/KYFNLvp92uUStfCh
   YPIt/dzRdIkffkO+kULY95z1KGngCXHCKQRw4yof/NFoC5AgZEHVkgcbS
   zrpAsfcGX72OKantp5mxX+oavK6evkWKd9POM99W66QfFWNQRQ6y7pxZ2
   VXxBl0/YpxXUWwJ5/T5f0mGv8Ch0Ux5qYRa7vey7dU6fvjS4vjPyTfA78
   w==;
X-CSE-ConnectionGUID: aibR4ETsQHCzudOzTibxdA==
X-CSE-MsgGUID: potAqUflTSm7sMAIYBTjcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="235192615"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="235192615"
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id DD9E4100036A
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:51 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 9273FC02194
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id C8454101BB6B;
	Wed, 25 Feb 2026 09:37:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/33] feh: upgrade 3.11.2 -> 3.11.3
Date: Wed, 25 Feb 2026 17:37:03 +0800
Message-ID: <20260225093727.1284-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124621

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Support DOS-style \r\n line breaks when loading filelists. Note that
  they will be saved with UNIX-style \n line breaks regardless of input
  format. This is intentional.
* Fix --action, --info, --title and similar commands hard-coding the
  maximum length of the formatted output to 4095 characters.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/feh/{feh_3.11.2.bb => feh_3.11.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/feh/{feh_3.11.2.bb => feh_3.11.3.bb} (88%)

diff --git a/meta-oe/recipes-graphics/feh/feh_3.11.2.bb b/meta-oe/recipes-graphics/feh/feh_3.11.3.bb
similarity index 88%
rename from meta-oe/recipes-graphics/feh/feh_3.11.2.bb
rename to meta-oe/recipes-graphics/feh/feh_3.11.3.bb
index 57c30c3475..c79ad488ba 100644
--- a/meta-oe/recipes-graphics/feh/feh_3.11.2.bb
+++ b/meta-oe/recipes-graphics/feh/feh_3.11.3.bb
@@ -9,7 +9,7 @@ DEPENDS = "\
 "
 
 SRC_URI = "https://feh.finalrewind.org/feh-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "020f8bce84c709333dcc6ec5fff36313782e0b50662754947c6585d922a7a7b2"
+SRC_URI[sha256sum] = "f2cca3592a433922c0db7a9365fd63e5402c121d932a9327e279c71be6501063"
 
 inherit mime-xdg features_check
 # depends on virtual/libx11
-- 
2.43.0


