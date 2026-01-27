Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1199BD2D8C8
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:44:08 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7124.1769507041712997004
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:44:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rkqYVU3q;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769507044; x=1801043044;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ulyx0bZRteq/vhx/kb1UpffU8f6qLVf7zvuQ4/uHTZA=;
  b=rkqYVU3qOW0JJXxTwI0uxFWVW7wq3fEMWoKwBCRwArM0D/C/uYJFWN4D
   hfyx+2BQ53XfDBDfX62tCSyyBEFpp8he6wuWBZMOzT2AaC0dMxX/cPWFn
   tgvTKwByvfIAEJDel4zSIkdnMg6CnVXq2prmSN66LxRQGaZD/OhKBFdb4
   t6ZZLfoa/pUL5GrpfvEGTAqewt5+TB1cQNnva1PRH3a8INAAb1KwulpNZ
   Ad88kFvbCp2RZwMs+s10hyJK3zywiktb8P0p3QEiDpThQojB1zAIsBLNr
   9HxlFMB17C40oRWsv7idRgdb2VrTXfYIFXxnR2TLeJk856tllok795d1k
   g==;
X-CSE-ConnectionGUID: YyHRRpMhQA2Pfe5stVEXfA==
X-CSE-MsgGUID: OPtCS/DSQtOdBKol9q5uXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="231321713"
X-IronPort-AV: E=Sophos;i="6.21,256,1763391600"; 
   d="scan'208";a="231321713"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:44:04 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 746641889
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:03 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 230911C04B00
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 9E1872000213;
	Tue, 27 Jan 2026 09:44:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 09/25] libtalloc: upgrade 2.4.3 -> 2.4.4
Date: Tue, 27 Jan 2026 17:43:23 +0800
Message-ID: <20260127094339.1081-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260127094339.1081-1-wangmy@fujitsu.com>
References: <20260127094339.1081-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123918

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtalloc/{libtalloc_2.4.3.bb => libtalloc_2.4.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.4.3.bb => libtalloc_2.4.4.bb} (96%)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.4.bb
similarity index 96%
rename from meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb
rename to meta-networking/recipes-support/libtalloc/libtalloc_2.4.4.bb
index 254d94064f..41f1714184 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.4.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://www.samba.org/ftp/talloc/talloc-${PV}.tar.gz \
            file://0002-Fix-pyext_PATTERN-for-cross-compilation.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "dc46c40b9f46bb34dd97fe41f548b0e8b247b77a918576733c528e83abd854dd"
+SRC_URI[sha256sum] = "55e47994018c13743485544e7206780ffbb3c8495e704a99636503e6e77abf59"
 
 inherit waf-samba pkgconfig ptest
 
-- 
2.43.0


