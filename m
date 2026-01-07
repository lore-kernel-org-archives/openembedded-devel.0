Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AFCDCD5840
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:29:54 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3069.1767781793061565753
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:29:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IDRYIfXM;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781792; x=1799317792;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FzbyIdwTb1AnrSFFHHP1m3rv5WUEP/kzzF7HDOts2kM=;
  b=IDRYIfXMY2mrV7TtJphSHoza3KgLZU/HMeMMbmbKXVS3+sc4yGMaEThI
   CZ62t9JzSUdnAPy9xKneVfcqL0WjRhS2XGfdFzbhmPKWKl6eIqB65BbMh
   AIX0WKapXOeUeVYJcHU41XjEZLxOTYQ+xdN/akT+3VF3M+pvYXfRVvffa
   dD+lmoIeVeaghGmEz+KeaHiK9/gTAY8otrNrNyRGv1SS/CG/Ppbhp1P67
   +gfYDO8fCqT1pi7PzKJ/AG+XecxmnIJUicBMdBX2xhEahwmYXESs88QGV
   Sk35lSdRBeSnT83SLvu3RK4Eq+DE2eJetF1WnaSf0tKjZTaguH4Jm9wxZ
   A==;
X-CSE-ConnectionGUID: jSKCd8CAT/KtV+XpahD/FA==
X-CSE-MsgGUID: FlS9kVs2S3qPWtjPCpsLTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="212496149"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="212496149"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:29:50 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 8878282073B
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:51 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 3ECFD896E27
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6E2A682173E;
	Wed,  7 Jan 2026 10:29:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 24/24] tcpdump: upgrade 4.99.5 -> 4.99.6
Date: Wed,  7 Jan 2026 18:28:55 +0800
Message-ID: <20260107102855.228-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107102855.228-1-wangmy@fujitsu.com>
References: <20260107102855.228-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123222

From: Wang Mingyu <wangmy@fujitsu.com>

add-ptest.patch
refreshed for 4.99.6

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/tcpdump/tcpdump/add-ptest.patch      | 9 +++------
 .../tcpdump/{tcpdump_4.99.5.bb => tcpdump_4.99.6.bb}     | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.99.5.bb => tcpdump_4.99.6.bb} (93%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch b/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
index c46de4b963..e1aaa31f2f 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
@@ -1,4 +1,4 @@
-From 5f0f70192b0e20336e642b02ca9662ba2fef66cf Mon Sep 17 00:00:00 2001
+From 266090c3af1db8e43e5ee349f5dd515983e651f8 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Fri, 19 Feb 2021 15:21:18 -0500
 Subject: [PATCH] Add ptest for tcpdump
@@ -19,10 +19,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 10 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index ea1ef1d0..e7987bd8 100644
+index 72dd01d..3f90901 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -445,9 +445,18 @@ distclean:
+@@ -448,9 +448,18 @@ distclean: clean
  	    tests/failure-outputs.txt
  	rm -rf autom4te.cache tests/DIFF tests/NEW
  
@@ -42,6 +42,3 @@ index ea1ef1d0..e7987bd8 100644
  extags: $(TAGFILES)
  	ctags $(TAGFILES)
  
--- 
-2.29.2
-
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.5.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.6.bb
similarity index 93%
rename from meta-networking/recipes-support/tcpdump/tcpdump_4.99.5.bb
rename to meta-networking/recipes-support/tcpdump/tcpdump_4.99.6.bb
index 144a12560b..f1bd32485c 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.5.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.6.bb
@@ -26,7 +26,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "d76395ab82d659d526291b013eee200201380930793531515abfc6e77b4f2ee5"
+SRC_URI[sha256sum] = "40a8cefd45f0d2a06827e6658efb830d484868c449ad80f7efb33516af44f3da"
 
 UPSTREAM_CHECK_REGEX = "tcpdump-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.43.0


