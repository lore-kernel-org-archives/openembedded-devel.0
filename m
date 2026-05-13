Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 221E2CD484C
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:09:28 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.98.1778645364478671989
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Es0NUG6b;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645367; x=1810181367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NgxTRB4pTaePs0mMkQSpy6IM48RB5SLL4vC6CVsqftA=;
  b=Es0NUG6bwZ1TODMt0BcJ4aFaoOf/s4AUiPhWDQwnPnX9/31BixmAHpha
   nrkBLk9v3mY4TVRCICYcZHeYCExVG7LPXdwkCNh8BnbVInKIGpOyr0W66
   dCOvv9fxdC3Hp0bnO93jhlDlE1iOBPQSAXFSK5lw8QUOeSWEeNrucLExm
   a99TG5haztbhU5Po0miX3lgq9Uv2o5sVoBjp3OXoTh6KnpG3DfdxqBfJD
   NPiSSP1NwuCZQ0oBkbQ/IXeY8NqremzZkzFJOUqdFDsqrGIOXMk0g09Bx
   wmT4MabsXn8eV8i0c4cbHN7x4EdeisOgo9ZsXB8g5Ma+XoRnRd4wrYRTC
   w==;
X-CSE-ConnectionGUID: ORW0JRf7R5Srta6ylKLOpA==
X-CSE-MsgGUID: 6075dAB3QlWOFDlzTmPZYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240206291"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240206291"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:09:26 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 7E7EC1C1C716
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:09:26 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 374E5180027F
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:09:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id D156D1400247;
	Wed, 13 May 2026 04:09:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 18/56] libtest-harness-perl: upgrade 3.50 -> 3.52
Date: Wed, 13 May 2026 12:05:17 +0800
Message-ID: <20260513040555.377-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126901

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 - Supports additional indicators on block scalars in YAML
 - fix string comparisons with $] to use numeric comparison instead

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ibtest-harness-perl_3.50.bb => libtest-harness-perl_3.52.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libtest/{libtest-harness-perl_3.50.bb => libtest-harness-perl_3.52.bb} (98%)

diff --git a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.50.bb b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.52.bb
similarity index 98%
rename from meta-perl/recipes-perl/libtest/libtest-harness-perl_3.50.bb
rename to meta-perl/recipes-perl/libtest/libtest-harness-perl_3.52.bb
index c4749095a3..67956748a3 100644
--- a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.50.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.52.bb
@@ -26,7 +26,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=29;endline=30;md5=d41d8cd98f00b204e9800998ecf8427e"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Test-Harness-${PV}.tar.gz"
-SRC_URI[sha256sum] = "79b6acdc444f1924cd4c2e9ed868bdc6e09580021aca8ff078ede2ffef8a6f54"
+SRC_URI[sha256sum] = "8fe65cfc0261ed3c8a4395f0524286f5719669fe305f9b03b16cf3684d62cd70"
 
 UPSTREAM_CHECK_REGEX = "Test\-Harness\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.43.0


