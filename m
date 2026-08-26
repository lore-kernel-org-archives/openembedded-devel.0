Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A2AC61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:09:53 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7652.1787731785967421453
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=epBhJ2+E;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787731789; x=1819267789;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DAKFvgJhBclIPKJqulkBV2k756ZXMJCFxC/Si/o4Ni4=;
  b=epBhJ2+EvLNLvUULeaXBoctXtghW0m4uGwUzAVaXEFoydqLJznNIcbya
   5tz5JyDnBYh6lLwymVt5xPxotRLX9t0gxKPJ3ykJIpvq2gJh8RlIZzymS
   iRVhswwWfz9P3wXGBi3Lhw/6yDVLGrf10aZN8KjD46XW+m7Dgg3N5+XY5
   P9kulEcy+ez/LFs+KJ25hSoPmh0ZcrEn+Q9J0+XNtguDHyb/22CxrQY4e
   CbfBOWUajYdgTFxAgQ6dPH0eIlm6xGiDm/sJN56OO7Z90CUqV1ia/ODc9
   Zvx2YXt5CHbEoy+q6idbqsmOAn4CoSwd7MqAnDPeOILBzjsxYUNNzl+Hf
   A==;
X-CSE-ConnectionGUID: E5nSy6XnTNWBgEAoZ5D2Nw==
X-CSE-MsgGUID: 7x1TzB7lRBW1zm9fYlQoCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="240168285"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="240168285"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:09:49 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1EA403D14
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:49 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id C927D1032BA2
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id D5F291404AFF;
	Wed, 26 Aug 2026 08:09:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/23] python3-evdev: upgrade 1.9.3 -> 2.0.0
Date: Wed, 26 Aug 2026 16:09:14 +0800
Message-ID: <20260826080926.989-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826080926.989-1-wangmy@fujitsu.com>
References: <20260826080926.989-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129503

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-evdev_1.9.3.bb => python3-evdev_2.0.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-evdev_1.9.3.bb => python3-evdev_2.0.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.9.3.bb b/meta-python/recipes-devtools/python/python3-evdev_2.0.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-evdev_1.9.3.bb
rename to meta-python/recipes-devtools/python/python3-evdev_2.0.0.bb
index ac687afbb4..f988a16b0a 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.9.3.bb
+++ b/meta-python/recipes-devtools/python/python3-evdev_2.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gvalkov/python-evdev"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d7bd1cc4c71b706c7e2d4053aef50f2a"
 
-SRC_URI[sha256sum] = "2c140e01ac8437758fa23fe5c871397412461f42d421aa20241dc8fe8cfccbc9"
+SRC_URI[sha256sum] = "442fb3f4c8dfc9e61e901133c356220c02d663eca8f34722e0cecdd637eba504"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


