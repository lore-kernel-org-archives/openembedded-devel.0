Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F89FC43638
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:23:11 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16879.1782811385482692298
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G4zL5/6n;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811385; x=1814347385;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oylcG7gNjERu4RXTqSj2BCwnbOBXwqMGmM/iIhnawIo=;
  b=G4zL5/6nKf8u/rAmC0RmuO0Z7jBTPojM+Kn5RW5d4Sw9quOzxHKuNGH7
   xIqmkmRuODoIF46CA8bRQqo3uo5j8lPpax2IjK5jVASxTZVazL8hziDt5
   Bpgm1O2q+ojkA34RkxCTGvBRtTo2JBlZ1ublvNsbK9TCSq/WdgVbkxdCp
   Ruqz6gdoWb6lS9gnIKbegfN6KMOApl1rdtWy37Le+SbOb+jb5zNaCRIJJ
   zTIj0oHcs2Qvfcjsp/iU81RtwhJZQ78sMKE+MbhknS/QOy+Vl4Ynny5jz
   ZmeT1/QomEDMI2rn6MnvCDqsTYkLRdAskDKNIuVXWldJLINxEqmA03jZm
   A==;
X-CSE-ConnectionGUID: 3OyA4qMgSsGtq0HHGZe8SA==
X-CSE-MsgGUID: UwPptcCoQgCoLlW9nHrRnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="243961104"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="243961104"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:23:04 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id DE4C58204C2
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:23:03 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 94C0B8493A5
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:23:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id A20E982DDC0;
	Tue, 30 Jun 2026 09:23:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 34/37] smcroute: upgrade 2.5.7 -> 2.6.0
Date: Tue, 30 Jun 2026 17:22:02 +0800
Message-ID: <20260630092206.322-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:23:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127976

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../smcroute/{smcroute_2.5.7.bb => smcroute_2.6.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/smcroute/{smcroute_2.5.7.bb => smcroute_2.6.0.bb} (84%)

diff --git a/meta-networking/recipes-support/smcroute/smcroute_2.5.7.bb b/meta-networking/recipes-support/smcroute/smcroute_2.6.0.bb
similarity index 84%
rename from meta-networking/recipes-support/smcroute/smcroute_2.5.7.bb
rename to meta-networking/recipes-support/smcroute/smcroute_2.6.0.bb
index bb12d7a907..1255d2fd53 100644
--- a/meta-networking/recipes-support/smcroute/smcroute_2.5.7.bb
+++ b/meta-networking/recipes-support/smcroute/smcroute_2.6.0.bb
@@ -5,8 +5,8 @@ SECTION = "net"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "b315d06ddb0dad16a52fe91e5831b4030ce37010"
-SRC_URI = "git://github.com/troglobit/smcroute.git;branch=master;protocol=https"
+SRCREV = "b5cde07e76f994f6f93701462c90e25bb774ab74"
+SRC_URI = "git://github.com/troglobit/smcroute.git;branch=master;protocol=https;tag=${PV}"
 
 
 inherit autotools pkgconfig
-- 
2.43.0


