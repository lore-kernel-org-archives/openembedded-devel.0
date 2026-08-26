Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC1EC61DC4
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:09:43 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7613.1787731774832086305
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dCaXdgiL;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787731778; x=1819267778;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=53emVNMdibE9DsIo7gliypQyldUyVi5R/BmAE9k8l48=;
  b=dCaXdgiL+J3QnG158UVOEnJXlGzHdjyOiSydsTDoLN+JKb/ON+NeWZ5X
   av32e+LS0LROldVVmBp72eW4VyXXz7lv0AAIaCjMj7HfD4jdQQu3LZrEh
   SJevvEnpLpSPh568aABOAvMH4ijlkoTS0Wil2Ln3anwficvRLpd8Yc/WL
   8CvMSXBwAHk9Ny6D+sqI7Enou5EXUv2ejAjH3wxVlL+fGaUa8wEDwIruw
   5LzF6JNeewb75NTnChmQqEuOuudsoPNcXcAneSV2xMcNhDxYrnZW/qumW
   fFBGhSUiqVwpDcHu7d/0lMfC/lLxvI/dQkbkXYzmOlCQQhmwtcxGKMo/X
   g==;
X-CSE-ConnectionGUID: BweIf1qXQouMlEqOAVlbpg==
X-CSE-MsgGUID: 6kZfdNecQleWA68zWAB75Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="240666559"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="240666559"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:09:36 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C03FF1C1C71C
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:32 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 78BF3C09188
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 91F4714063AD;
	Wed, 26 Aug 2026 08:09:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 01/23] cockpit: upgrade 364 -> 366
Date: Wed, 26 Aug 2026 16:09:04 +0800
Message-ID: <20260826080926.989-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129493

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-webadmin/cockpit/{cockpit_364.bb => cockpit_366.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-webadmin/cockpit/{cockpit_364.bb => cockpit_366.bb} (98%)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_364.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_366.bb
similarity index 98%
rename from meta-webserver/recipes-webadmin/cockpit/cockpit_364.bb
rename to meta-webserver/recipes-webadmin/cockpit/cockpit_366.bb
index 2b9c7677fe..b8d12d5ea1 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_364.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_366.bb
@@ -9,7 +9,7 @@ SRC_URI += " \
     file://0001-Warn-not-error-if-xsltproc-is-not-found.patch \
     file://cockpit.pam \
     "
-SRC_URI[sha256sum] = "514cea072e1ef137323ab92bdb07a66bbb5106ecd584e7a046294cf0170cb690"
+SRC_URI[sha256sum] = "bf0a8c37eca303282a85777e049fce67fe2002743fabfb3e85f9de24855b099a"
 
 UPSTREAM_CHECK_URI = "https://github.com/cockpit-project/cockpit/tags"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)*)"
-- 
2.43.0


