Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B939DCD8CAA
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:29:51 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76503.1781000987360731933
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:29:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hG8D35H7;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781000991; x=1812536991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zO8w2qnzoQvI6qDPjA6S17j6Uy/YAYbStUPkRIKBvbM=;
  b=hG8D35H7iAk9NpI/P+a08WmN8RAfspFOEx/uvlQQZvU3akQFputWA7Dt
   vJwxdSC7JxCbT/1SIkAVqnaHKJksczyXPW0jXzcmW2SkIjW9d7mcBcNxa
   YuYotbeVjUhW1YpmlDQoPZs2PiqpghkpbynNKHo1xcVmbVlJX3GtGXMXi
   F+hx0KjOfsacENmIl3LfxVz7rC8MB6l74DZORjVx/4nGAGUrl68QMSCga
   eUJzbmRe4nm+Jrpf/xg9advWTU0XN13hk2ImEUisZJ5UOD4ubmRuCpl1T
   /K7Zq/LBVYBMz64DXLaWdkM2vTRkmFnj/cBzRLx+M4OKD3hdNvyFdYz0Z
   Q==;
X-CSE-ConnectionGUID: GfLEt0C5RCGDRtGNBN5XVw==
X-CSE-MsgGUID: GJsUjyufSwej6StN52Bw2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="241652295"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="241652295"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:29:50 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 939D442A305
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:50 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 4972F102FBB0
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 5AD6210003CE;
	Tue,  9 Jun 2026 10:29:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 11/30] proftpd: upgrade 1.3.9a -> 1.3.9b
Date: Tue,  9 Jun 2026 18:28:54 +0800
Message-ID: <20260609102913.2204-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127465

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Issue 2057 - SQL Injection in mod_wrap2_sql via reverse DNS
  hostname (CVE-2026-44331).
- Issue 2056 - Incomplete fix for session management with OpenSSL 3.2.x or
  later, when using TLSv1.2 or earlier.  This complements the fix for
  Issue #1963.
- Issue 2098 - Hard quota limits on uploads do not cause SFTP WRITE requests
  to fail as expected.
- Issue 2102 - SSH payload length underflow calculation for ETM/ChaChaPoly
  algorithms in mod_sftp.
- Issue 2104 - SSH packet with empty payload triggers null pointer dereference
  in mod_sftp.
- Issue 2106 - Bad DSA signatures can lead to out-of-bounds read of heap memory
  in mod_sftp.
- Issue 2108 - Mismatched RSA/DSA algorithm signatures can lead to null
  dereference in mod_sftp.
- Issue 2115 - SFTP request payload length underflow calculation in mod_sftp.
- Issue 2120 - Several modules fail to build using OpenSSL 4.0.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../proftpd/{proftpd_1.3.9a.bb => proftpd_1.3.9b.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.9a.bb => proftpd_1.3.9b.bb} (99%)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9a.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9b.bb
similarity index 99%
rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.9a.bb
rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.9b.bb
index 2e164a574b..3da67c9e1c 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9a.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9b.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.proftpd.org"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb0d1484d11915fa88a6a7702f1dc184"
 
-SRCREV = "ec8a5544e81df54e202f52f1f70d206439389577"
+SRCREV = "390b21555268bbc64b66d2dfa7ae40476419b80f"
 BRANCH = "1.3.9"
 
 SRC_URI = "git://github.com/proftpd/proftpd.git;branch=${BRANCH};protocol=https;tag=v${PV} \
-- 
2.43.0


