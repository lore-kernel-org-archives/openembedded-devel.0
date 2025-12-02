Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 999E6D116FE
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:51:59 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4289.1764669115028056352
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:51:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kbhg2Kgl;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764669116; x=1796205116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cY4sIOm70bObjGXUNK3pZpqNlcL4bUQ2WvXNJ/erJAk=;
  b=kbhg2KglElcfIQWtenN5Pf6bDzFhQ7DKZ5gJgH9bYUqcZ3YdO90JPrib
   4ERKp4NMK+G31nZUSUOrbMUgB/iaE21pd11wD3Vs/kQzbVlxVThAuRJke
   3ERhOMo5L6HeeBo75PDPq6IO2B9CXuHeQ8PMfNppfGfBbNnVNcPk8VlZu
   EZuNqflsQi3WjygfA26BRQpi4VtcCab5a50QJyaAXt0k/SQMz+x47G11r
   47fqbv7rt1Futdh6WNz5It0i8Bh02XnZ2mnVbYWoExBKTER+CN/7H3X/B
   t5NnclTpscTRMee7cXlWTi5DTxtjnKvp3DbLWvSQpf83aUDGkyR6fXNCE
   g==;
X-CSE-ConnectionGUID: fW/hu3+xSa+FgJVYCrA7nQ==
X-CSE-MsgGUID: //cVxNA0SB+YJxqY9DjCYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="225034796"
X-IronPort-AV: E=Sophos;i="6.20,242,1758553200"; 
   d="scan'208";a="225034796"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:51:54 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 70F8F100034C
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:51:53 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 270D4C012A0
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:51:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id AC627101A430;
	Tue,  2 Dec 2025 09:51:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 07/25] postfix: upgrade 3.10.5 -> 3.10.6
Date: Tue,  2 Dec 2025 17:51:14 +0800
Message-ID: <20251202095132.652-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251202095132.652-1-wangmy@fujitsu.com>
References: <20251202095132.652-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 09:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122240

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../postfix/{postfix_3.10.5.bb => postfix_3.10.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.10.5.bb => postfix_3.10.6.bb} (99%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.5.bb b/meta-networking/recipes-daemons/postfix/postfix_3.10.6.bb
similarity index 99%
rename from meta-networking/recipes-daemons/postfix/postfix_3.10.5.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.10.6.bb
index 02fe9df7ed..647680bf25 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.10.5.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.10.6.bb
@@ -28,7 +28,7 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
            "
 
-SRC_URI[sha256sum] = "6a926bf702173861b08e49bcb51fca3a2f269f9a337f72ef159bf46052087e35"
+SRC_URI[sha256sum] = "71b383f57d4cb363201be8a301bcbafe304aadbe7f38ebde41cd5b952248465b"
 
 UPSTREAM_CHECK_URI = "https://www.postfix.org/announcements.html"
 UPSTREAM_CHECK_REGEX = "postfix-(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


