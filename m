Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42021FD7F69
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:14:20 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92443.1772187253999427039
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:14:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UfnlkaUU;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187254; x=1803723254;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D9epQDi6bIGFs0BqaHqJ5/2OvvdK3FGzMt9XadmlltM=;
  b=UfnlkaUU2Hy3eWOGdgAcP+5ab6PA22dope6lm3UIuEfvdjifFrYcx0bM
   tobVgSRq6yLRbFZ/dU6NT39OHdwflWnly6hsysgrvB3/oW7bgZ8AgiX/i
   a0QC3mGUclL4b2OPV//fGcEFQnPSnCf3Z+SvX+UKEk8jKIZssCbwp0Ayq
   BXF+vbj/YWTWy4kATe5kdJ/bNz11wA0zMwJBPmTr8WcMIKY98PjcEmQTK
   /M4dFJTcFu1R0Wd8a2KY6ckqwk6WJ0DkgypRykC1qMq9iptXA5jmPznh6
   2oDsnQGNLCUAjj4oyMRrXgDR9ipOtIlVPrTtiLCGA0xbRj5gC8K339Tvc
   Q==;
X-CSE-ConnectionGUID: 2FSoeVI0Sqm6yPJPxCbV6Q==
X-CSE-MsgGUID: l8FJhf+PSv+9giSkYwqfdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="210131554"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="210131554"
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.fujitsu.com (Postfix) with ESMTPS id 4D7D21002B98
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:12 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 03E6C14042DB
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1752C180059F;
	Fri, 27 Feb 2026 10:14:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/52] python3-icu: upgrade 2.16 -> 2.16.1
Date: Fri, 27 Feb 2026 18:12:50 +0800
Message-ID: <20260227101327.1432-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124715

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-icu_2.16.bb => python3-icu_2.16.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-icu_2.16.bb => python3-icu_2.16.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-icu_2.16.bb b/meta-python/recipes-devtools/python/python3-icu_2.16.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-icu_2.16.bb
rename to meta-python/recipes-devtools/python/python3-icu_2.16.1.bb
index c46e4e9f8b..44d8b9a701 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.16.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.16.1.bb
@@ -10,7 +10,7 @@ DEPENDS += "icu"
 PYPI_PACKAGE = "pyicu"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "42b3a8062e3b23e927ca727e6b5e1730d86c70279834e4887152895d2eb012d9"
+SRC_URI[sha256sum] = "cafdc2bc6cfbb4b6e511dedeff37316f902af900993b576116b8243f4ad6478c"
 
 SRC_URI += "file://0001-Fix-host-contamination-of-include-files.patch"
 
-- 
2.43.0


