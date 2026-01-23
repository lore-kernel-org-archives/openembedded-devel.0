Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C9AD6CFCC
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 05:23:25 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62032.1769145802714887470
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 21:23:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GBqbcJXu;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769145801; x=1800681801;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6hKw3bqZF8KukrEJuKJ6eSICQFPADg9uG3z2r0iNdIk=;
  b=GBqbcJXuhLQw0EzNRKkXJJlehfkD8pkh4+CRUECLkaLrmewneLyhyyRv
   uASpMQI5ncmeqVyNz9Gjqko7h4qPiB0lJT+nEPlH1z3PJh1wWQzVC5Gef
   6DvckZLiooAU+ZvNAWs7JzBJI4ucztEp9i0/KLFvfgesrrxXQsOQauERQ
   em/cGwNjDHwkvFlmnnq/EPd1Ukq++rohTB+WsOTPS6L9fXYHXVwDfeUdv
   0OhnhMAh5oVZCdu6kntou0hN0QOJu6DeZKNOGMcVT+ogZhY1IJNLXPtYS
   IIAnkcaZbmr4MaXs7Tv9jHbAoKrzHMyzaUJkCERaBFNI3MYX5jiDWKsmN
   g==;
X-CSE-ConnectionGUID: oQVcMgWrSIKT8+c4ka/fww==
X-CSE-MsgGUID: 6SVDnXxIS8S32BEX+eNzrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="215395498"
X-IronPort-AV: E=Sophos;i="6.21,247,1763391600"; 
   d="scan'208";a="215395498"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 14:23:19 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 11D4F820C2B
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 05:23:21 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id BAF9892675F
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 05:23:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 20EA82000101;
	Fri, 23 Jan 2026 05:23:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] mcelog: upgrade 208 -> 210
Date: Fri, 23 Jan 2026 13:23:11 +0800
Message-ID: <20260123052312.958-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 05:23:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123761

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/mcelog/{mcelog_208.bb => mcelog_210.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/mcelog/{mcelog_208.bb => mcelog_210.bb} (92%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog_208.bb b/meta-oe/recipes-support/mcelog/mcelog_210.bb
similarity index 92%
rename from meta-oe/recipes-support/mcelog/mcelog_208.bb
rename to meta-oe/recipes-support/mcelog/mcelog_210.bb
index 4a72cd4d66..f009ba98ad 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_208.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_210.bb
@@ -5,12 +5,12 @@ and should run on all Linux systems that need error handling."
 HOMEPAGE = "https://mcelog.org/"
 SECTION = "System Environment/Base"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;;branch=master \
+SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;;branch=master;tag=v${PV} \
            file://0001-client-Include-string.h-form-mem-function-prototypes.patch \
            file://run-ptest \
            "
 
-SRCREV = "2965a540ac2fbf1e0a992afd17c01747d6fd66aa"
+SRCREV = "357b136f95be23be1dda2c5e220e0430e9b20765"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-- 
2.43.0


