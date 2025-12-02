Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C79DBD11700
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:52:19 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4299.1764669133250177200
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:52:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HKKAtoYc;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764669133; x=1796205133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V+446qRfNfMN/O6WHM/aL2qJfaV6tJeuMYdry0noShQ=;
  b=HKKAtoYcVbRVQU5H/BMqR9ago3VoJ6a4zTRTQeaFjGgteo3UxOc4tcJK
   DE7UuZYx83wPAJ6Thj6Dibeq3+gm9RnepzzyTg5HZwis2c2kRjoX9z50g
   UpgZ8gwSl9wwRprSeQbJuWz6HSkJ13rRjxjvSnswxe+/XT8B3gyXodKez
   kwNzyKflv+r6qgefWfPZXoDI7kYaIemMQeF+6qLKyNx6QvK9oDNPex+dd
   WsetyGXa7RgqaDKL5fmLUVVYEw+cymzRmY7d7SM4hp0urQ3vfTYr4x2UC
   OfM0HU1HiLjtGVPIx5rWBqncV5FVSkmJM440QpsntkQwUs00SiaDIKljh
   g==;
X-CSE-ConnectionGUID: m7EMIhbDTymGMBkfH9VCKA==
X-CSE-MsgGUID: 8VqD9v9OQym9jez6EX7VGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="209743856"
X-IronPort-AV: E=Sophos;i="6.20,242,1758553200"; 
   d="scan'208";a="209743856"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:52:11 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id CB3C542A325
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:11 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 8026518009E5
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:11 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 0FA7D101A438;
	Tue,  2 Dec 2025 09:52:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/25] python3-pybcj: upgrade 1.0.6 -> 1.0.7
Date: Tue,  2 Dec 2025 17:51:24 +0800
Message-ID: <20251202095132.652-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251202095132.652-1-wangmy@fujitsu.com>
References: <20251202095132.652-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 09:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122250

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Support for python 3.14
- ci: fix test and release workflows

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pybcj_1.0.6.bb => python3-pybcj_1.0.7.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pybcj_1.0.6.bb => python3-pybcj_1.0.7.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pybcj_1.0.6.bb b/meta-python/recipes-devtools/python/python3-pybcj_1.0.7.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pybcj_1.0.6.bb
rename to meta-python/recipes-devtools/python/python3-pybcj_1.0.7.bb
index 1d3d0ee245..299677b072 100644
--- a/meta-python/recipes-devtools/python/python3-pybcj_1.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pybcj_1.0.7.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPL-2.1-or-later"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "70bbe2dc185993351955bfe8f61395038f96f5de92bb3a436acb01505781f8f2"
+SRC_URI[sha256sum] = "72d64574069ffb0a800020668376b7ebd7adea159adbf4d35f8effc62f0daa67"
 
 inherit pypi python_setuptools_build_meta pypi
 
-- 
2.43.0


