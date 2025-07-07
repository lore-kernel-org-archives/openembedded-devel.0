Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E64C83F1E
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:27 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.56133.1751879234076487371
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QUwAXlX2;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879239; x=1783415239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JYYnig42mhnrdgfd5aGA0ZILYKACgtENdXftiYIcgfQ=;
  b=QUwAXlX2FoY0RzStlt8bskMEnatHTs6vU9evTZpbS0YhGsLYUorwx2w2
   C4e4Wf1G6HHiCgaY+Up15P3iiIlBD+Fya/tTv0pwSywgwDwDMdz8oqU7T
   fKNSWWvkhbevynxjCCO36yJX3tyqOL1kD41H5WuTmRRil7m0UjLn07Zm6
   js7zAZAh63e9D5epgdP7ewe4Ejl0UDAxV7svKaATa0Iz3EDBrEAQdB9SU
   KobVWw0btcW4SlhjjlYuQo1DzIamklftUA08HbMc4iMcp3ze4yWxpnN4X
   g5os/aDbVAmAe+ZTXZIzodIvB6W1uaNYlWTyAvyLBmAflbRs6cRqWfGk9
   Q==;
X-CSE-ConnectionGUID: BEdQHDuYTq6y4YyyBJgsHg==
X-CSE-MsgGUID: G3EAhb29TdiujMjqzhEmXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="193950583"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="193950583"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:18 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id E35061C0018C
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:17 +0000 (UTC)
Received: from oym-m2.gw.nic.fujitsu.com (oym-m2.gw.nic.fujitsu.com [10.85.9.162])
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTP id 625A21C0029E
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:17 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B7125BF3C1
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:15 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EDA771A0074;
	Mon,  7 Jul 2025 17:07:14 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/35] python3-bleak: upgrade 0.22.3 -> 1.0.1
Date: Mon,  7 Jul 2025 17:06:39 +0800
Message-ID: <20250707090656.1216-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118268

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-bleak_0.22.3.bb => python3-bleak_1.0.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bleak_0.22.3.bb => python3-bleak_1.0.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb b/meta-python/recipes-devtools/python/python3-bleak_1.0.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb
rename to meta-python/recipes-devtools/python/python3-bleak_1.0.1.bb
index 4c534e1892..f18502c7c4 100644
--- a/meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb
+++ b/meta-python/recipes-devtools/python/python3-bleak_1.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/hbldh/bleak"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bcbc2069a86cba1b5e47253679f66ed7"
 
-SRCREV = "2e6890f68f6718b4f92e602b9b926aa3d107b556"
+SRCREV = "bf224c0230ed9096429a21d782b5b4d9d7ab7bd7"
 PYPI_SRC_URI = "git://github.com/hbldh/bleak.git;protocol=https;branch=develop;destsuffix=${S}"
 
 inherit pypi python_poetry_core ptest-python-pytest
-- 
2.43.0


