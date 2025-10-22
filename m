Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 051CDCCD1A5
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:23:30 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.4838.1761099800598486730
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:23:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=A/kBvotZ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099800; x=1792635800;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FGEHHNtEl07R+eCU4IGQoVDDKI4ICCveZLlvTnLBziQ=;
  b=A/kBvotZQqbyx0gsemDtGiFuuLgPxYqv3y5+PM8ZGNDfWG+maYSG/6Nt
   tUnzyA63BUfCbPMVJg+RPtqJoNKA0fstg8+J/Ak2vRG8lPPXJnbvw/hEQ
   pgiYyMT4DKdKjIKwdnGMX84sMf6g4Uqz2PjJHRcL+Obhs1jO0AUqVpimt
   VdK3pGv63vykj36+GVDmTa+K6mi27/qd7TLnOGVRrHTaBXFy7EWzEYnTp
   rDTjcogfosUfDbSRF8UP5xNoNaFINrVEwC+994dfAGEPepP3MJGF/211G
   C/yAwk2IllH/P9D2eFPUUDDAhKKFWB6gXt4pi4BGH2LBiIngRzWWNqSj0
   w==;
X-CSE-ConnectionGUID: t8NE4gefQPCaXYXPhkt1UA==
X-CSE-MsgGUID: PvCQr4/oT8azT0nMbPhazg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="216654749"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="216654749"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:23:19 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id D9DAB1002BBE
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:18 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 9469EC0083E
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id E3B4A82C0DE;
	Wed, 22 Oct 2025 02:23:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/29] python3-psycopg: upgrade 3.2.10 -> 3.2.11
Date: Wed, 22 Oct 2025 10:22:19 +0800
Message-ID: <20251022022227.226-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120870

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix spurious readiness flags in some of the wait functions
- Fix high CPU usage using the wait_c function on Windows
- Fix bad data on error in binary copy
- Respect Copy.set_types() in TEXT copy in C version, consistently with the Python version
- Don't raise warning, and don’t leak resources, if a builtin function is used as JSON dumper/loader function
- Improve performance of Python conversion on results loading

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-psycopg_3.2.10.bb => python3-psycopg_3.2.11.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/python/{python3-psycopg_3.2.10.bb => python3-psycopg_3.2.11.bb} (85%)

diff --git a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.10.bb b/meta-oe/recipes-devtools/python/python3-psycopg_3.2.11.bb
similarity index 85%
rename from meta-oe/recipes-devtools/python/python3-psycopg_3.2.10.bb
rename to meta-oe/recipes-devtools/python/python3-psycopg_3.2.11.bb
index d9d2091c38..b10c3caab9 100644
--- a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.10.bb
+++ b/meta-oe/recipes-devtools/python/python3-psycopg_3.2.11.bb
@@ -7,7 +7,7 @@ features offered by PostgreSQL."
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
 
-SRC_URI[sha256sum] = "0bce99269d16ed18401683a8569b2c5abd94f72f8364856d56c0389bcd50972a"
+SRC_URI[sha256sum] = "398bb484ed44361e041c8f804ed7af3d2fcefbffdace1d905b7446c319321706"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


