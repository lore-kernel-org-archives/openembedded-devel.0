Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97039FF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:18 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17227.1777546216317367145
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SwVLDyr7;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546216; x=1809082216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/BnC/MaaOHJ+Pp8EI0KsUD1O3LEVRYx9z4uV3+LX9rw=;
  b=SwVLDyr7eYJjIpQUcfjWoAo6/LENdoywtZVrERrKfTqddh46baWktUQS
   WKsnUxJAgejv/iyBLkYa0UecdgCwSUw4NL7ZDuiPvhVat5tAwFq0rgIzy
   TGhGj7vY6G18FofEFV2oRpCQc5B0u5fhLEdqAvnk1j5QmrOQXj0wfTaTx
   f+qd7XVVMAhsd5rOCE/R+hKF633iXSp1yDB8juuv0AEpoCea4v2VErH/n
   iyr1wcFfQmp+ii5YiNe4CivBv9mDILM7D5j9PJOuKTIFNxZb6SvLjK+AR
   eerqncODXGi9sReMB+NcEe9PJZdN4aPmfoLGR1g9mlChXScu8JK7WU+AL
   g==;
X-CSE-ConnectionGUID: 05skHzxtSw2hcSlpBYn85A==
X-CSE-MsgGUID: T1WUbXmPR1yQP+Kk0LYDcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="226100977"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="226100977"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:15 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id DB00E1002B86
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:14 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 9737BC00227
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:14 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 3F46A1801137;
	Thu, 30 Apr 2026 10:50:12 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/64] python3-bumble: upgrade 0.0.226 -> 0.0.228
Date: Thu, 30 Apr 2026 18:48:48 +0800
Message-ID: <20260430104924.1106-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126699

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- release command semaphore after timeout
- fix: add input validation to prevent remote crash from empty/malforme
- SDP: Fix wrong parameter size
- Hash and cache 128 bytes of UUID
- SDP: Migrate to dataclasses
- Make ConnectionPHY dataclass
- Add --locked to allow installing cargo-all-features
- Add read classic remote features support
- Fix Hive demo install failure
- Keys: Remove appdirs and improve typing
- Feature - Add SMP Debug Mode (Core Vol.3, Part H)
- Advertise in run_gatt_client_and_server

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bumble_0.0.226.bb => python3-bumble_0.0.228.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bumble_0.0.226.bb => python3-bumble_0.0.228.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-bumble_0.0.226.bb b/meta-python/recipes-devtools/python/python3-bumble_0.0.228.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-bumble_0.0.226.bb
rename to meta-python/recipes-devtools/python/python3-bumble_0.0.228.bb
index d5cc66f74d..aa011258f8 100644
--- a/meta-python/recipes-devtools/python/python3-bumble_0.0.226.bb
+++ b/meta-python/recipes-devtools/python/python3-bumble_0.0.228.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/google/bumble"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a775f1b11285b6abedd76748d176125"
 
-SRC_URI[sha256sum] = "e96f62c282a7376ab56b2f799e232d0985a8965e049030c50a59c4ff0b10f592"
+SRC_URI[sha256sum] = "78fb156548dd738a28ecba539e7aaa138117516a8811482e9801bcd35a4fbbbd"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


