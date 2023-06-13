Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187C2C88CB5
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:40:53 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.3821.1686620448027044036
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="108574437"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="108574437"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:40:45 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 98D0AC53CC
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:43 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C3B9CD4BF2
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:42 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A22F20074732;
	Tue, 13 Jun 2023 10:40:42 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] mpich: upgrade 4.1.1 -> 4.1.2
Date: Tue, 13 Jun 2023 09:39:58 +0800
Message-Id: <1686620422-29962-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10-3.136900-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mraEANKbBJN1269J0xOzYcX2lF
	7OhYLlctoiRiRqJbjhYF1Ec/oUIRldAy2LXTI7g3EXjPIvKd74AQhNjZQYyI3HZonBD1OvODssb
	EkSX6c0k7Iy4xMDtNnl365UWdO2/FrWL/xQJnm46eAiCmPx4NwGmRqNBHmBveeFIQTy0Zb4bfaY
	87m2dqxydET58jp62SVpTB88QGAhRgqVoH+go6xmHPclZmXvqHtwz9kbrUJJPkSZZoIB830mjHo
	CBWzuW1A7ahBaj029nbCd9JdG1gZg2qwIbXilwlS7+RMq/2CK6rA4c7UV2fQpvi2PQO/FFQiz2u
	jrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103226

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  with recent versions of LLVM/Clang
  different floating point values
  attribute on the same object

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/mpich/{mpich_4.1.1.bb => mpich_4.1.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/mpich/{mpich_4.1.1.bb => mpich_4.1.2.bb} (96%)

diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb b/meta-oe/recipes-devtools/mpich/mpich_4.1.2.bb
similarity index 96%
rename from meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
rename to meta-oe/recipes-devtools/mpich/mpich_4.1.2.bb
index cd13b91d7..ac8094d11 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_4.1.2.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f1804c45b8b4e816e53eb1f175d810f3"
 
 SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz"
-SRC_URI[sha256sum] = "ee30471b35ef87f4c88f871a5e2ad3811cd9c4df32fd4f138443072ff4284ca2"
+SRC_URI[sha256sum] = "3492e98adab62b597ef0d292fb2459b6123bc80070a8aa0a30be6962075a12f0"
 
 RDEPENDS:${PN} += "bash perl libxml2"
 
-- 
2.34.1


