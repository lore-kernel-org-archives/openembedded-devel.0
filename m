Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F86C3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 08:23:58 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.9356.1720599835494209307
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jul 2024 01:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YSEh5eq3;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720599836; x=1752135836;
  h=from:to:cc:subject:date:message-id;
  bh=bJi1F73ChMK5sVLE8OEgo1Lpb0KvwpImxO1YqpVqdpU=;
  b=YSEh5eq3CBMfe3h6M2hNTdqpSsHN8LGXvoOq4cuVa+nHQ5I03r17WLVy
   ErJQbKeKO4PMrYo4dS2RXKK+WMjQIwqZK3nCMq/ernrcSNAyL2XMsV4IA
   rrE3DeuZx+5Bvx6mtPVnIe+JQDLxCmSZwQVJFG9FrgDXXZUPNxpK+neOR
   eDeB8D00uvk/rLSBNpPSA1Jhi3tx0TsW2YlOQ/K1yw2rhDNjthotLDnw9
   1zsjcy5RZAZjqlgKI8FsgbC+f+yFBxv9KDPhEC5pjKeDHdclFSTo87qAW
   caiZaMbnxxezioKZN2tCZoVEwo7nkJX2lKDuACs0kGCMWB9SR1E+QTlRU
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="165744929"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="165744929"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 17:23:53 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D420DB3C2
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 17:23:50 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B40FCD510E
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 17:23:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 353FF20086123
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 17:23:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B93A41A000A;
	Wed, 10 Jul 2024 16:23:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] fetchmail: disable rpath to  fix buildpaths warning.
Date: Wed, 10 Jul 2024 16:23:36 +0800
Message-Id: <1720599816-22915-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10-1.260000-10.000000
X-TMASE-MatchedRID: G+VdM6uSBxqFGhTClJy1Nu9kW9mxCQvtgf3FRZbpKzt4YeSlHZYFotN3
	A9FjogGZjf84k1uW53hV00+whwxVQ6cUQ7z3S96iEXjPIvKd74Aytf6nW43O0KSIGrjDxszFo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXJDw+uK3sejJB9QgpzB9O/kgTnJKjNaykEbBU
	W6PSXg3EQEv7DhYz3lY/x/jhGQ7Cvpl1i72UzkjQAGlfWuy44CHy3DV3uo14f+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 08:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111293

From: Wang Mingyu <wangmy@fujitsu.com>

There was an error with the last modification to the buildpaths warning, which could cause segment error.

fix the following warning about buildpath:
  WARNING: fetchmail-6.4.38-r0 do_package_qa: QA Issue: File /usr/bin/fetchmail in package fetchmail contains reference to TMPDIR [buildpaths]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/fetchmail/fetchmail_6.4.38.bb            | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb
index 6cde94b20..cc23d5a34 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb
@@ -16,13 +16,10 @@ SRC_URI[sha256sum] = "a6cb4ea863ac61d242ffb2db564a39123761578d3e40d71ce7b6f2905b
 
 inherit autotools gettext pkgconfig python3-dir python3native
 
-EXTRA_OECONF = "--with-ssl=${STAGING_DIR_HOST}${prefix}"
-
-INSANE_SKIP:${PN} = "already-stripped"
+EXTRA_OECONF = "--with-ssl=${STAGING_DIR_HOST}${prefix} --disable-rpath "
 
 do_install:append() {
     sed -i 's,${RECIPE_SYSROOT_NATIVE},,g' ${D}${bindir}/fetchmailconf
-    sed -i 's,${RECIPE_SYSROOT},,g' ${D}${bindir}/fetchmail
 }
 
 PACKAGES =+ "fetchmail-python"
-- 
2.34.1


