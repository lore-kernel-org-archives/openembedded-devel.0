Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20201D1CDC6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 05:55:29 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.855.1765259722806461678
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 21:55:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IhGrTeWr;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765259723; x=1796795723;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yPTeCFfbRuSJA9L0QFPnYlb8ut8f3I0OscAQMNSbq1U=;
  b=IhGrTeWrjKsXHec/XC3EHQg3D7f/J3FU9lIBDBzebxOjOGQvBFkzwpAY
   yq+vyad3nkD3sBj9U6SWSM2K8Q148Yrhn0Ypoyx4pJUnbUSwS23haYCkW
   jBauM35jo1NNDLkAhf+poDdqDdT8H9j/tCpfTuQHhWhZ00x6I6UB++Yo3
   1bcMor3m0VPa2FHDtaSJTVAsNXyQLryRLOVOOBqeuwIZ+7Lpdgy4S7q/h
   QV00N+iUH2r2rg3l9M+HLy0w5RcfjFSvjHuxyGyP5FQ9Em9DKXrNRRcPi
   uDYYkEHqDTOsvkHMre14hM3y7bHmDJIKLgzWyUfhLBAJg1aXsJBYEWK2V
   A==;
X-CSE-ConnectionGUID: Nut+dTpDTpu04xAmVjvfyg==
X-CSE-MsgGUID: zmxs//SRSjSZ9kaRK9Jf6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="209385528"
X-IronPort-AV: E=Sophos;i="6.20,260,1758553200"; 
   d="scan'208";a="209385528"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 14:55:21 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id F1C5F1C000E0
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 05:55:20 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id A7CA018026F1
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 05:55:20 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 69D9318004EA
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 05:55:18 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 2/5] nspr: upgrade 4.38 -> 4.38.2
Date: Tue,  9 Dec 2025 13:55:11 +0800
Message-ID: <20251209055511.22324-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 05:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122395

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta-oe/recipes-support/nspr/{nspr_4.38.bb => nspr_4.38.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nspr/{nspr_4.38.bb => nspr_4.38.2.bb} (98%)

diff --git a/meta-oe/recipes-support/nspr/nspr_4.38.bb b/meta-oe/recipes-support/nspr/nspr_4.38.2.bb
similarity index 98%
rename from meta-oe/recipes-support/nspr/nspr_4.38.bb
rename to meta-oe/recipes-support/nspr/nspr_4.38.2.bb
index b0c03bfc1d..0d37a42f61 100644
--- a/meta-oe/recipes-support/nspr/nspr_4.38.bb
+++ b/meta-oe/recipes-support/nspr/nspr_4.38.2.bb
@@ -23,7 +23,7 @@ CACHED_CONFIGUREVARS:append:libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE
 UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 
-SRC_URI[sha256sum] = "72ee73ffcc6ef5e706965f855ecf470ec3986c3e188e12a8a8006e76f6b31a6f"
+SRC_URI[sha256sum] = "e4092faeab77bdc9b32db1113e4215948ee768e26c4666db3b5a60b35f2c9105"
 
 CVE_PRODUCT = "netscape_portable_runtime"
 
-- 
2.43.0


