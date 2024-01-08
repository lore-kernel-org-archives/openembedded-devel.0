Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4B2C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:37:55 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.6716.1704721065532053959
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:37:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="145456108"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="145456108"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:37:43 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6604AD4F51
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:37:41 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 941AA30F95
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:37:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D170202DB180
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:37:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B46731A0072;
	Mon,  8 Jan 2024 21:37:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libio-pty-perl: upgrade 1.17 -> 1.20
Date: Mon,  8 Jan 2024 21:33:02 +0800
Message-Id: <1704720782-30351-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10-4.254300-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yW03YawHJvPCkdS3kPlaZyVkDFfw8NSG/L6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AAtH/ey8zRp8SiwizsgluQ1vZ
	7s3YIVDIcfwGQIbwrkGNNfJA/RgDhbZ3DSPtWJmueAiCmPx4NwGmRqNBHmBveeFIQTy0Zb4bfaY
	87m2dqxydET58jp62SHl7r+fJIAfxh08cM3o/+5p7RAxC3MZLBsvCtzSKXAqTrtEPqo5JC7QMtO
	11Q8SfK8y3BJPzFccEAdUzGLRvmXdIDyl58bskNS7+RMq/2CK6rA4c7UV2fQpvi2PQO/FFQiz2u
	jrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:37:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108145

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Make-function-checks-more-robust-within-shared-libs.patch
removed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libio-pty-perl_1.17.bb => libio-pty-perl_1.20.bb}     | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/perl/{libio-pty-perl_1.17.bb => libio-pty-perl_1.20.bb} (74%)

diff --git a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.17.bb b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.20.bb
similarity index 74%
rename from meta-oe/recipes-devtools/perl/libio-pty-perl_1.17.bb
rename to meta-oe/recipes-devtools/perl/libio-pty-perl_1.20.bb
index e5c1ec1c8..6029b7aae 100644
--- a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.17.bb
+++ b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.20.bb
@@ -3,10 +3,9 @@ SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=12;md5=b2562f94907eeb42e8ce9d45f628e587"
 
-SRC_URI = "http://www.cpan.org/modules/by-module/IO/IO-Tty-${PV}.tar.gz \
-           file://0001-Make-function-checks-more-robust-within-shared-libs.patch \
-           "
-SRC_URI[sha256sum] = "a5f1a83020bc5b5dd6c1b570f48c7546e0a8f7fac10a068740b03925ad9e14e8"
+SRC_URI = "http://www.cpan.org/modules/by-module/IO/IO-Tty-${PV}.tar.gz"
+
+SRC_URI[sha256sum] = "b15309fc85623893289cb9b2b88dfa9ed1e69156b75f29938553a45be6d730af"
 
 S = "${WORKDIR}/IO-Tty-${PV}"
 
-- 
2.34.1


