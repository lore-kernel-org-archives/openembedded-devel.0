Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 310EF103E304
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 02:32:34 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12956.1773282743793708929
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 19:32:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=T7IzRMSM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773282744; x=1804818744;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E2yQCaf5kHJdqsFRHAFAiKF9Dl0JgV/WpxBurlu5JyY=;
  b=T7IzRMSMDbYozOWroU0P/4IXBZMwlOJDunmx06oXHK8l9oUgD76RVfFj
   KTW2VODz5tL8Doj2fEfWpBVXda5s8gRGEtpobil10YsONPRZLHNK/dF4k
   8K77ZoCDC3OEimOLI1R73ogYnd9w50NPURAFHSKv7+xQHb48eWNwVB1EV
   pz/Mckr+62oA7d2IPuubEYhsrSF8hEg2cadW6o/4KrYmRjSvCxNpTQYfP
   HXi8yjfhmKMGUZDUpQA17+LXlatqo7f1uWOoWGuIn99EImtR9vYsUCGhw
   JEMW4UhNL7diJHMx6tzW2meOzMiXgy5ZCmcWvmlsv27udWBxmeigAz07c
   w==;
X-CSE-ConnectionGUID: LtvPJUDGT4m+Q4jbfqmh7Q==
X-CSE-MsgGUID: WsMukGLZTbqG6DHYUqD+Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="232945576"
X-IronPort-AV: E=Sophos;i="6.23,115,1770562800"; 
   d="scan'208";a="232945576"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 11:32:11 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 8CF361C166D6
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 02:32:11 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 4557E926765
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 02:32:11 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 091C2140025F
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 02:32:08 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH] tnftp: Add HOMEPAGE
Date: Thu, 12 Mar 2026 10:32:05 +0800
Message-ID: <20260312023207.3042-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 02:32:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125098

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta-networking/recipes-support/tnftp/tnftp_20260211.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/tnftp/tnftp_20260211.bb b/meta-networking/recipes-support/tnftp/tnftp_20260211.bb
index 90bff9a71b..70123eaa86 100644
--- a/meta-networking/recipes-support/tnftp/tnftp_20260211.bb
+++ b/meta-networking/recipes-support/tnftp/tnftp_20260211.bb
@@ -8,6 +8,7 @@ IPv6 support, modification time preservation, paging of local and \
 remote files, passive mode support (with fallback to active mode), \
 SOCKS support, TIS FWTK gate-ftp server support, and transfer rate \
 throttling."
+HOMEPAGE = "https://en.wikipedia.org/wiki/Tnftp"
 
 SECTION = "net"
 LICENSE = "BSD-2-Clause"
-- 
2.43.0

