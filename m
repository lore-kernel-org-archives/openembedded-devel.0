Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14268D3C520
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 02:01:19 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4584.1765332075012107486
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 18:01:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZYprwPWh;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765332074; x=1796868074;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/w+npbO0j49ShWN7LD+wHtZy+tlGd9KPxwY9mP2mKNs=;
  b=ZYprwPWhW3ZP3NFYfmWMzgkrXtD3MreuWpop9Vzs6zFJkSgnyZxBD1KG
   h0Fj4DSMPpINUjXaYTYEIcn/oGaZ0uLl4E0K5gfesFxb3eAHl9CeAqITB
   UocBAg40MeSff9RCw4g/TU+U0OmV+vNLxjhZJsO5dUwNyH87MREwsz3oF
   RASQks8jXuMPF5odL0azyLqaa2dOFwB2Od4GsXUFO4OnzSSfoqDvn30hn
   Q+SUCZuOV2ZzgiDyLhn2TciAFIJV9X51067rK8YpYFD6AxiG8PGKRhXXK
   Ci20t+iNf5wNULyUkQyBkN8TL7Ac+qs9qHxE4oC4pqVwCNi0VDSQygVSU
   g==;
X-CSE-ConnectionGUID: 7O5ffRkLQPKvqr5YUAp4Fg==
X-CSE-MsgGUID: GeUxgJIWTbGfUIcAlNJbnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="209488906"
X-IronPort-AV: E=Sophos;i="6.20,262,1758553200"; 
   d="scan'208";a="209488906"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 11:00:59 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id A1DBA1C1C736
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 02:01:00 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 599F7C0246D
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 02:01:00 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 1556A1019063
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 02:00:57 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] gflags: add tag to SRC_URI
Date: Wed, 10 Dec 2025 10:00:35 +0800
Message-ID: <20251210020035.23202-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 02:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122480

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta-oe/recipes-support/gflags/gflags_2.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/gflags/gflags_2.3.0.bb b/meta-oe/recipes-support/gflags/gflags_2.3.0.bb
index 0e510bb59a..bb8f144f90 100644
--- a/meta-oe/recipes-support/gflags/gflags_2.3.0.bb
+++ b/meta-oe/recipes-support/gflags/gflags_2.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gflags/gflags"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=c80d1a3b623f72bb85a4c75b556551df"
 
-SRC_URI = "git://github.com/gflags/gflags.git;branch=main;protocol=https"
+SRC_URI = "git://github.com/gflags/gflags.git;branch=main;protocol=https;tag=v${PV}"
 SRCREV = "33bb3461e10864b5406353d3a1fb7ff34c2314b8"
 
 inherit cmake
-- 
2.43.0


