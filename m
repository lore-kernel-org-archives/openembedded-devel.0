Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C17E9C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 16:54:04 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.1621.1645030443732352532
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 08:54:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 21GGs24f025018
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 08:54:02 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 16 Feb 2022 08:54:01 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 16 Feb 2022 08:54:01 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] rsyslog: update to 8.2202
Date: Wed, 16 Feb 2022 08:54:01 -0800
Message-ID: <20220216165401.152617-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Feb 2022 16:54:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95339

Package changes are mostly bug fixes, and additions to modules/tests:
   https://github.com/rsyslog/rsyslog/blob/master/ChangeLog

I removed the md5sum line since it's obsolete.

ptest results for qemux86-64 with kvm and a timeout
of 1000 seconds to allow stress tests to complete:

Version          | Passed      | Failed   | Skipped
8.2106           | 428         | 0        | 5
8.2202           | 456         | 0        | 5

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../rsyslog/{rsyslog_8.2106.0.bb => rsyslog_8.2202.0.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2106.0.bb => rsyslog_8.2202.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2106.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2202.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2106.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2202.0.bb
index 9d7e494d0..b9c4e60cb 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2106.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2202.0.bb
@@ -31,8 +31,7 @@ SRC_URI:append:libc-musl = " \
     file://0001-Include-sys-time-h.patch \
 "
 
-SRC_URI[md5sum] = "b90659d85dce1df0f6c69a79c4ef053a"
-SRC_URI[sha256sum] = "faf45c25a2265c001739e8888b3652cf685eb3f35cd65d17d5c38fd44b9ddd81"
+SRC_URI[sha256sum] = "e41308a5a171939b3cbc246e9d4bd30be44e801521e04cd95d051fa3867d6738"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.31.1


