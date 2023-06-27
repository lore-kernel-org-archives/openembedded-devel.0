Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D16C04FDF
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:14:25 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.7508.1687850063027547518
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="101719700"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="101719700"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:14:22 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 34739C3F84
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:19 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7BD8CCF7C2
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:18 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id ADB1888D20;
	Tue, 27 Jun 2023 16:14:17 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymodbus: upgrade 3.3.1 -> 3.3.2
Date: Tue, 27 Jun 2023 15:12:12 +0800
Message-Id: <1687849939-19941-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
References: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27716.005
X-TMASE-Result: 10--0.188600-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvRnp8Qx+pp64O3
	HyUMPRbH/hVQa8+BRHY/oKDpdyJZNENSJBrOrDfXA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnp5g9gYJWDLeBzEkCCpnRlvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZI2QE71vhw5eNGExhul6+s+NaGcOFIjzWlhs7nr6aLxCqdR7
	riX7vkh3ZxsmSMUUqo3jqd6tkPRvIMVsB07KSorsdAkDdR/4iBLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 07:14:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103607

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
    Fix RemoteSlaveContext (#1599)
    Change version follow PEP 440. (#1609)
    Fix regression with REPL server not listening (#1604)
    Fix write function codes (#1598)
    Release corrections. (#1586)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.3.1.bb => python3-pymodbus_3.3.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.3.1.bb => python3-pymodbus_3.3.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.3.1.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.3.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.3.2.bb
index 0d90c91d9d..2b7dfd7741 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.3.2.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=430604f78bee72425da231d42eac9cee"
 DEPENDS += "python3-six-native"
 
-SRC_URI[sha256sum] = "82787121e293f31095c0e9721b3e561a01807a6ac20abcbfb187ce70d24fb40c"
+SRC_URI[sha256sum] = "33f427f39189567600ea1f8f6ebd7e5f26caf50ef330798792679fcae80ef339"
 S = "${WORKDIR}/pymodbus-${PV}"
 
 inherit pypi setuptools3
-- 
2.34.1


