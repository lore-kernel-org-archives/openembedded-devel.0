Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAEFAEA7973
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 05:15:27 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14215.1770268523151503549
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 21:15:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hXr1uMHP;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770268524; x=1801804524;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xIx44GLcu3t/ikcN8c604pzlhp3xFUuyvGeuSEjCnM0=;
  b=hXr1uMHP+F7vngi+azQjoGvouUEOrnOtEkFJ8jyBk+9Y5lF+HHrS90ID
   uitm7jkpXLLnPPY1CpfirBuTG9OJFuaA9BKF6h0mUAvFAiiQdPOxvHUfp
   GQL+0kNI0p9Lfu3uH2NQYmWol4WmzsKesv/VR2kFR/RyhKNcFbBhfeUgy
   oacEcGUveEHfXiGDZCYoCzwggYnS3Ryq4D7VyY2IivrgjQyhRdy28FSgx
   SCzf+BxdK7h1M97yLyOAogJJBdyHugzRej8Q7bOyq4vAB0Zw7+2mH9Y+j
   q0o9fJIejIgPWgrLjTX+K1LNTD8MS9KzrsJt1SsAKJvtLvqyPG42fAvqQ
   Q==;
X-CSE-ConnectionGUID: 3fuFtRqATH+hjwsJCPK+Yw==
X-CSE-MsgGUID: Q1LHjwpOSRqU8HGGJ9f0yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="228591660"
X-IronPort-AV: E=Sophos;i="6.21,274,1763391600"; 
   d="scan'208";a="228591660"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 14:15:22 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id 95D896749
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:21 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 47A281C135EF
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id B613120000C1;
	Thu,  5 Feb 2026 05:15:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 08/24] libio-compress-perl: upgrade 2.214 -> 2.217
Date: Thu,  5 Feb 2026 13:14:18 +0800
Message-ID: <20260205051435.1366-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260205051435.1366-1-wangmy@fujitsu.com>
References: <20260205051435.1366-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 05:15:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124160

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...io-compress-perl_2.214.bb => libio-compress-perl_2.217.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libio/{libio-compress-perl_2.214.bb => libio-compress-perl_2.217.bb} (86%)

diff --git a/meta-perl/recipes-perl/libio/libio-compress-perl_2.214.bb b/meta-perl/recipes-perl/libio/libio-compress-perl_2.217.bb
similarity index 86%
rename from meta-perl/recipes-perl/libio/libio-compress-perl_2.214.bb
rename to meta-perl/recipes-perl/libio/libio-compress-perl_2.217.bb
index bb49841422..3b9784d1dd 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-perl_2.214.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-perl_2.217.bb
@@ -14,11 +14,11 @@ HOMEPAGE = "https://metacpan.org/release/IO-Compress"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=6af707e7b2ec1d8f995b973c427fb244"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=a05fdd79b87a410b6178b73126ffafdd"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Compress-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "0cfbc4b4ac9b28f7cbf22f114e09c9a49ace9e0b6c3778432afa2cde55512d69"
+SRC_URI[sha256sum] = "4d075e04eeef3c451f5e7f572ebd695738bad033e8cd32cf519c68edb3f39dc7"
 
 S = "${UNPACKDIR}/IO-Compress-${PV}"
 
-- 
2.43.0


