Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED275CA0FE9
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:40:09 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.15255.1755679204336650566
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=L5fOs+rc;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679204; x=1787215204;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O1pwap9c9OeSmpO9ZB9ff5mqSlIlM/3r4YBHKGtv918=;
  b=L5fOs+rc9Q2d67HLxd3KG993xEeSW+e4KDKchWu3X7B5oBCrMFsRmMCX
   ugyf6r1YwrU8YnnWvyhp/QqPLoDf7FzRD4q2iTHKGQXFAjp1QiJ85zKzY
   Z5bw+6fblKkOYDJ4dHcZSgGYgYy72yb7DvLk1QGTLLUQtw7MUMWFdrLFw
   yWPLrUEtdRV6QTNI2onoDdhEQocHARLPtAdr7MPUvvkddooanTVfod8ct
   1p16IsptcFpIgPqjOXyAk7SPSsMnavPmsDO84a0Gh1YaYY9xETaBUfQEf
   VucEVH8bUxyW+bijMrY+RhTqggWyPoDije6Iym++7AOVbPEKHGAX52Eyn
   w==;
X-CSE-ConnectionGUID: 1Zesnw4dQZyb3GpYv+66sA==
X-CSE-MsgGUID: 6aNInz9FTwunlCg8NlYOoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="209365707"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="209365707"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:40:03 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 91414C00201
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:02 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 4DD6E1809176
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:02 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 48E2C18001E0
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 506501A0086;
	Wed, 20 Aug 2025 16:39:57 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 11/26] libtevent: upgrade 0.17.0 -> 0.17.1
Date: Wed, 20 Aug 2025 16:39:30 +0800
Message-ID: <20250820083945.802-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250820083945.802-1-wangmy@fujitsu.com>
References: <20250820083945.802-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119025

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtevent/{libtevent_0.17.0.bb => libtevent_0.17.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/libtevent/{libtevent_0.17.0.bb => libtevent_0.17.1.bb} (95%)

diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.17.0.bb b/meta-networking/recipes-support/libtevent/libtevent_0.17.1.bb
similarity index 95%
rename from meta-networking/recipes-support/libtevent/libtevent_0.17.0.bb
rename to meta-networking/recipes-support/libtevent/libtevent_0.17.1.bb
index 7ee044d146..3f67b7b842 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.17.0.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.17.1.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://samba.org/ftp/tevent/tevent-${PV}.tar.gz \
 
 LIC_FILES_CHKSUM = "file://tevent.h;endline=26;md5=47386b7c539bf2706b7ce52dc9341681"
 
-SRC_URI[sha256sum] = "7702fb373b69da2960b86134b6a9ec6fa0b949a01756fec00a4a6a43575c8361"
+SRC_URI[sha256sum] = "1be2dea737cde25fe06621f84945e63eb71259e0c43e9f8f5da482dab1a7be92"
 
 inherit pkgconfig ptest waf-samba
 
-- 
2.43.0


