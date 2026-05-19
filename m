Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A09CD5BA6
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:39:41 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19024.1779190776373970970
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DHc7GOH9;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190776; x=1810726776;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=759ghIo/sYgAPP1uRaRMG6P3tiPSX56QHr2UsrQ+ic4=;
  b=DHc7GOH9F1OuGbuYWT8EArt0ocvK0uXbxtASVrRy6gtKOOZv0qteMEno
   TfSIdyoGGBQ86Gl12mEKfQ9Pi+tEIdCNzBpVHV/4xpZuwOOBXAeGUhUP9
   W1JqRzlt2ZzKZ1vanB0X08DJkoMSTRVDlF/mpJX18FoQACgLLn2mCRwvl
   bwQ9C59NX3fiH7TLTbZKwavWen4VDKPejTh3Nd80ZtqS4ZdM6T5QTiHKD
   9iwuCbivv0r9XPsRd2/ZN+2I1nBdThUuo2vfP1/mXYYEBKKgi/RGXAl4o
   YS7vsgYUROmkvfUV4agnQa2zkQsO50kRHuvXvw4UEDWdGNTsNd469ILyn
   g==;
X-CSE-ConnectionGUID: FQwQRzBFT6aFwKJLl74Nog==
X-CSE-MsgGUID: SF+LzWWTRfK6870R9rgNSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="229071370"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="229071370"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:39:34 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9F3381C000B4
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:34 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 4830D1802AFC
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id C368D4059BD;
	Tue, 19 May 2026 11:39:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 04/38] dovecot: upgrade 2.4.3 -> 2.4.4
Date: Tue, 19 May 2026 19:38:47 +0800
Message-ID: <20260519113921.655-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127066

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dovecot/{dovecot_2.4.3.bb => dovecot_2.4.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/dovecot/{dovecot_2.4.3.bb => dovecot_2.4.4.bb} (97%)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb b/meta-networking/recipes-support/dovecot/dovecot_2.4.4.bb
similarity index 97%
rename from meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
rename to meta-networking/recipes-support/dovecot/dovecot_2.4.4.bb
index a6b78ea781..6cac8de964 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.4.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz \
            file://0001-m4-Check-for-libunwind-instead-of-libunwind-generic.patch \
            file://0001-adapt-lua_newstate-to-new-api.patch \
            "
-SRC_URI[sha256sum] = "ff0be85228122f250627b19e67505fdb7fb2f72a702ef6bf35f27fce54c072e5"
+SRC_URI[sha256sum] = "670f98d55a29b02ae6a97281e51374e553b94496480ab0a07439571ab30ca8c3"
 
 DEPENDS = "openssl xz zlib bzip2 libcap icu libtirpc bison-native"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
-- 
2.43.0


