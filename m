Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3758D3B7F8
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:57:10 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4214.1765274223886249070
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:57:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sRu/9mzJ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274224; x=1796810224;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=REkPSfbEPO4BJHXZ8TL0VzbLEDAhDSOx/s4P37YeQnE=;
  b=sRu/9mzJyxu5Hq0qlfnGfTnByqet79bPXcuucZZxMIlJML6uXCplobWc
   /E09YiPOrwgh5WfWaHc8cCITI4G9apH4/BA+/a8zsl7qERZ9e6BpO0ORX
   /0nNvw5Hjh/P4bfWnVKqWzvkaJlDz/MV/kzEVVRhfc+C0XilgxU9smnrw
   rzU3OxIAgasTQ6Q2BDzwWxi50hwvx3+IkeWHTX6sLHNlkdQwJ9899g8CU
   QtoZM6fE6cuK609QxNPvYdiVUNxPPAoSddkrSA/xhX47z+nCXFpuKDBUa
   m9oMzS9D1n7CDVMI7GRcMiBuZ8CW8bn4GdgVzMegYLOqOEi+8hL0hoA1I
   A==;
X-CSE-ConnectionGUID: 5zjWCzOzSgGhVqCA6iTX0A==
X-CSE-MsgGUID: lvAg7PL2Ql6j+SlAmKll1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="221968189"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="221968189"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:57:02 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 5F47342A31F
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:57:02 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 04B9C1C002F4
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:57:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id A0BC320002B8;
	Tue,  9 Dec 2025 09:56:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 31/38] rsyslog: upgrade 8.2510.0 -> 8.2512.0
Date: Tue,  9 Dec 2025 17:55:45 +0800
Message-ID: <20251209095552.690-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122435

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rsyslog/{rsyslog_8.2510.0.bb => rsyslog_8.2512.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2510.0.bb => rsyslog_8.2512.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2510.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2510.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
index c92c11d8f3..63233fd278 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2510.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
@@ -30,7 +30,7 @@ SRC_URI = "https://www.rsyslog.com/files/download/rsyslog/${BPN}-${PV}.tar.gz \
 SRC_URI:append:libc-musl = " \
     file://disable-omfile-outchannel.patch \
 "
-SRC_URI[sha256sum] = "a70a9834186859539a6a4d1c7b3f68c23897e805829b764a45e92cb0cc95e66a"
+SRC_URI[sha256sum] = "93c50025d90b6c795fa350d56a3d832bfce45043ea9bd68240d9c2a9394bc629"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/tags"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


