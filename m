Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1991ECFD37A
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:12:18 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13193.1764061932385349967
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:12:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ck32vCkh;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764061932; x=1795597932;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3/NF6kj6QvtRWIkWJWkYzEi7dFZDrHs0wxQzSmb1Fcs=;
  b=ck32vCkhGhyvktGiJb9QeOlZHdmvgbnMh0v+Hazyr9Wbc14ZCYxCpzeA
   h0MRlBOTIMQJ47lfUXWkPwrbmLThawFlZvKC7SGCqAkH5n1RAVgzLq6oD
   xb7PgOwe6j9xR69wazmhpBjm0Kw/TsvF8GakcWxGx3uBir7b0vmsOGtON
   3wFwZWcwi4KMsDHTmU3i1m0zFsimGT0cHwdQiK2i6RmUaiIWFPLnjRlnu
   m0B1CeXI7oaLd93J9psu1dvpm2hmT/ZV+FCBiaBdG+z9hO5vNH3JOYqHe
   FIZJTLhSzZsPHH0wOzQ1SHgsuIit2tF0uwINjkbNwR+aTMLsYeRwEYDo7
   A==;
X-CSE-ConnectionGUID: T2+yIy0DTpCYewaKpcUjcg==
X-CSE-MsgGUID: 6RFDBvNZRyyKXiVB93/MhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="220317755"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="220317755"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 18:12:05 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 872C78203C2
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:12:05 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 48C2D14003BD
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:12:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id EA31B14001E6;
	Tue, 25 Nov 2025 09:12:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/26] debootstrap: upgrade 1.0.141 -> 1.0.142
Date: Tue, 25 Nov 2025 17:11:31 +0800
Message-ID: <20251125091156.1376-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122027

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{debootstrap_1.0.141.bb => debootstrap_1.0.142.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/debootstrap/{debootstrap_1.0.141.bb => debootstrap_1.0.142.bb} (89%)

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.141.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.142.bb
similarity index 89%
rename from meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.141.bb
rename to meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.142.bb
index 9287962ab7..1478ebb1e4 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.141.bb
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.142.bb
@@ -11,7 +11,7 @@ SRC_URI  = "\
     file://0003-do-not-hardcode-the-full-path-of-dpkg.patch \
 "
 
-SRC_URI[sha256sum] = "232ec755f4b1f445f829996885846abba6f1b6fd55d049476ab26ddd8c4b4e1b"
+SRC_URI[sha256sum] = "334b188c2bab5c1aa6f858a044274631d342f07f5ddec1bad870d728f02fd652"
 
 S = "${UNPACKDIR}/debootstrap"
 
-- 
2.43.0


