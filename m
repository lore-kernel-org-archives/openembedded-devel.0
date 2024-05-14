Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A40AC25B7E
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:52 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.10758.1715677843301773887
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QSmpMaFp;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677845; x=1747213845;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=dVLP/bsvF9KUvRyUIa6ZkuSVaazI8wfz9qAz6qpzcxM=;
  b=QSmpMaFpeY8mvKTex21uTkDKsbWd2vPbm1aW0V2u3VDKd5+kWOvu/sYl
   8OI8t8JZ4Lz2L4UMFhXiCWCC33KtlC9cQgJ2WX3GAKqSJ7RTJbu32L3/O
   y5zzGksBKzK9wFTaNwNLtnnm3pn4tji9EMqvlrzvdbx6d4Oixo/lw+Wy0
   KzzUBwE+wocAgsv6lOSg2kB4hjnnszPiw3EAsukbtPh6nWUJPvAM4+wDQ
   gA3BDKwVr8/4P4/pVeppBzjOI2P5qAJ9LGBpEB3kj8CT1SKhil4UmMGsF
   7IYpmNF59FjevrT3Usc1EY/3Ywg8WsdlXZjTJ34SGqY9KuAFIPv69vyO8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="157675059"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="157675059"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:42 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DA3D8DB658
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:39 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 15807D52E7
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A560520076D15
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 52E631A000B;
	Tue, 14 May 2024 17:10:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/44] python3-uswid: upgrade 0.4.7 -> 0.5.0
Date: Tue, 14 May 2024 17:10:11 +0800
Message-Id: <1715677817-2223-38-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10--2.106300-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/ybHhZAaKjUKtpxAd6mi1Ga14YeSlHZYFopHn
	G194oCm2A9dmUDS4LC2FP8I8yHPnEyFhER5AQz1Ji82UiskMqcxULRRq00o2mcj0QMA/92m2li+
	BaqMwTNr1vHe0RNYkzORPW6D6wj13PubnqD2XLwjy3h9RQZ4StME5XPQnBzGXR/IzlV+CMba4PG
	uTA1D+L0TsEthTK2dwiw7QLADA+jo7BOj1lchJLN0KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtDbLQl5n/OxxaFVs/3Tl6pXi3unnKqRKYq4qgCxGn1g410f6yyInY6dD0yNMPcMSWH1Y5
	pY2we0UaPp8pHFXAeplQRDuGD14CnQCUNcnj6GbyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgA
	Q4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110385

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Relicense from LGPL-2.1+ to BSD-2-Clause-Patent

Changelog:
==========
- trivial: Fix make ruff
- Correctly validate missing license and compiler links
- Use the correct link rel in the compiler example
- trivial: Provide more __str__ for the IntEnum classes
- Be more forgiving when using importlib
- trivial: Fix up all the mypy and pylint warnings
- Rename identity to component
- Add initial support for VEX
- Add a validation failure for REDACTED text
- Relicense from LGPL-2.1+ to BSD-2-Clause-Patent
- trivial: Document --generate
- Use flynt to convert to f-strings
- trivial: Add a make target for ruff
- Save HEX strings as bytes to minimize coSWID size
- Allow outputting multi-document SWID XML files
- trivial: Allow saving uSWID with no compression
- trivial: post release version bump

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-uswid_0.4.7.bb => python3-uswid_0.5.0.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-uswid_0.4.7.bb => python3-uswid_0.5.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-uswid_0.4.7.bb b/meta-python/recipes-devtools/python/python3-uswid_0.5.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-uswid_0.4.7.bb
rename to meta-python/recipes-devtools/python/python3-uswid_0.5.0.bb
index 4499edb21..1381d7e88 100644
--- a/meta-python/recipes-devtools/python/python3-uswid_0.4.7.bb
+++ b/meta-python/recipes-devtools/python/python3-uswid_0.5.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = "A pure-python library for embedding CoSWID data"
 HOMEPAGE = "https://github.com/hughsie/python-uswid"
 SECTION = "devel/python"
-LICENSE = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=40d2542b8c43a3ec2b7f5da31a697b88"
+LICENSE = "BSD-2-Clause-Patent"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f3636dfe71e94cc72918423cec0d1971"
 
-SRC_URI[sha256sum] = "de15c2421bedaa5f54606558700c1f628f07d73da49ec69d1888214ac52c49e6"
+SRC_URI[sha256sum] = "bdcd7ee5afac1da60ee688c357aa12f5f8d74bc28012446b10e2b4a9cf52fc6d"
 
 inherit setuptools3 python3native pypi
 
-- 
2.34.1


