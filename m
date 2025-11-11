Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB91ACCFA18
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 07:56:06 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12760.1762847757065544917
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 23:55:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PD1O3GvC;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762847757; x=1794383757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dXbn74Qp4RaQ3NoThmrsZH14+HQhFdLClCPPczV1cdQ=;
  b=PD1O3GvCNrZkpeZMptwxuj/53CiaPMobbfWtPksumDL3bhwWLeFJq7AS
   AVISrvI4kOvYibmytrrurmm8wjTD9kFzd6ZmAAtsVoqcwU3P14i3n/Fc4
   USsGblf9lL+04iG5LZVGsQte9Uv79PBlDsMt0U/iSLDu7VS3V2UloP0um
   jeQPUGJ4hGCp3HWfYnDwibSpP9QLVOryYhQubU9UD22vkzVP4O25rkQLU
   7DcqAb6Tezg/mU9dXzU3Su1oLc7mzTEvxGBLIRg1A/zT5q3dX1ICJ95Rf
   ajk4+QlvLwIKcnbLuP3EyEqfNfDuNAGF8K61lJ1BTwlEocG03TYA/3pJu
   A==;
X-CSE-ConnectionGUID: ffFVnAWiRD+SWUUsZCksHg==
X-CSE-MsgGUID: 9rytFXv6QBuau2t0fEMpPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="219428916"
X-IronPort-AV: E=Sophos;i="6.19,296,1754924400"; 
   d="scan'208";a="219428916"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:55:55 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 83D0D1C0008F
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:55 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 3F972100044F
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id BFEB21800D78;
	Tue, 11 Nov 2025 07:55:52 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/23] python3-pint: upgrade 0.25 -> 0.25.2
Date: Tue, 11 Nov 2025 15:55:11 +0800
Message-ID: <20251111075517.1650-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251111075517.1650-1-wangmy@fujitsu.com>
References: <20251111075517.1650-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:56:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121496

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Revert typing change in 'pint.Unit'
- Fix raising exception in 'Quantity.from_tuple' with invalid units
- Several unit definition fixes.
- Add devcontainer.json to add GitHub Codespace support
- Add support for 'numpy.geomspace'
- Add support for 'linalg.diagonal', 'linalg.matrix_transpose', 'diag', 'tril', 'triu', 'linalg.eigvals', 'linalg.eigvalsh', 'linalg.matrix_norm' and 'linalg.vector_norm'
- An example of performing currency conversions that change over time has been added to the docs.
- Add support for 'pint.Quantity' being used as Generic.
- Add a typing and IDE autocomplete page to the documentation.
- Fixed 'nan'/'nan' to return 'nan' rather than 1 in unit conversion

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pint_0.25.bb => python3-pint_0.25.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.25.bb => python3-pint_0.25.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.25.bb b/meta-python/recipes-devtools/python/python3-pint_0.25.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pint_0.25.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.25.2.bb
index c85805e1f4..97ee4b48bc 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.25.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.25.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bccf824202692270a1e0829a62e3f47b"
 
 inherit pypi python_hatchling ptest-python-pytest python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "22911a30d682ee0540d656571c19a7b1806ce00b2be88a16f67218108b7b8cc2"
+SRC_URI[sha256sum] = "85a45d1da8fe9c9f7477fed8aef59ad2b939af3d6611507e1a9cbdacdcd3450a"
 
 DEPENDS += "python3-setuptools-scm-native python3-hatch-vcs-native"
 
-- 
2.43.0


