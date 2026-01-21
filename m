Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB794C44503
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:29:50 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9438.1768994985041757592
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:29:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=T9+G/fTT;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768994985; x=1800530985;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MiwXt/Kunati2EDyXsFWOIQ3SrVU05Kgi0IRxWeFKlE=;
  b=T9+G/fTTSRJkuyenwWJt1JdfDSSGWjP+YxR3UUcbzD+u8s+yT5Lc2AQo
   4/2fS46zhohq4QOmzSXfNAlUBGu4/q/lkb6qRdzaXdE3M7THmJg/4wei7
   vIBxKD7ORkwOnuVAJkudqOoV1b91VYB0nH6r/drnp5b3b+W++lj7KVe0+
   ID8IfBOlQsvYbEC8CAczA34XPVswfhJx342HUd1e+gxssP9JM/dcaIMaU
   oKTh17+74jL0yjUSvtAyphNxsMwjIUcy55hjggGUiEnYGmGCnUK/mhU47
   2Gthsxj7ipwjpoecXc0wpaJhWpapoyVO7Wj9hUoHhGyN9hKOEVDcxXw7c
   Q==;
X-CSE-ConnectionGUID: yuMyRQZGQh+APUhc9egudg==
X-CSE-MsgGUID: 8AY7dch6RkG58/Gxqs2Mfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="205542070"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="205542070"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:29:43 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 744801C000A2
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:43 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 1CF941C002A2
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 42EE41401D61;
	Wed, 21 Jan 2026 11:29:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 06/30] pure-ftpd: upgrade 1.0.52 -> 1.0.53
Date: Wed, 21 Jan 2026 19:28:57 +0800
Message-ID: <20260121112921.857-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123697

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pure-ftpd/{pure-ftpd_1.0.52.bb => pure-ftpd_1.0.53.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/pure-ftpd/{pure-ftpd_1.0.52.bb => pure-ftpd_1.0.53.bb} (82%)

diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.bb b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.53.bb
similarity index 82%
rename from meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.bb
rename to meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.53.bb
index c5c9c87c7f..02a10f8e84 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.bb
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.53.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Pure-FTPd is a free (BSD license), secure, production-quality and
 HOMEPAGE = "http://www.pureftpd.org/project/pure-ftpd"
 SECTION = "net"
 LICENSE = "0BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5138d4a8a877b32de6a78cf7e9e99c25"
+LIC_FILES_CHKSUM = "file://COPYING;md5=384872cb5bfd3a52956dc3743ed9fd48"
 
 DEPENDS = "libcap virtual/crypt"
 
@@ -11,7 +11,7 @@ SRC_URI = "http://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-${PV}.t
            file://0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch \
            file://nostrip.patch \
 "
-SRC_URI[sha256sum] = "1126f3a95856d08889ff89703cb1aa9ec9924d939d154e96904c920f05dc3c74"
+SRC_URI[sha256sum] = "b3f2b0194223b1e88bf8b0df9e91ffb5d1b9812356e9dd465f2f97b72b21265f"
 
 inherit autotools
 
-- 
2.43.0


