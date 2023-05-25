Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EAEBC7EE2C
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:56:47 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.6065.1684997797955182375
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="119045412"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="119045412"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:56:32 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8B65BCD7E2
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:56:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id BB3EFD63A4
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:56:29 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4E8912007CA83;
	Thu, 25 May 2023 15:56:29 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] fetchmail: upgrade 6.4.23 -> 6.4.37
Date: Thu, 25 May 2023 14:56:17 +0800
Message-Id: <1684997777-2061-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997777-2061-1-git-send-email-wangmy@fujitsu.com>
References: <1684997777-2061-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27648.005
X-TMASE-Result: 10--0.298000-10.000000
X-TMASE-MatchedRID: PWXwJQp0B9ujz0nOeth/yW/6CCblACLhcDzcoONn/M4XC9p0ThKQ4US3
	N7Ud/ZNyq4wtfVaPl00VyPxAiNsiTBs7n0Ur0F2YqTb2sWzCG36OVBD4weLV07Bm7KRKfr78UK/
	HNleb7IuZve+nCDih1Ygb9TwUngz5cRZVcflu3NB73wuui2ClVJv7eN3eThF+IMYstsSWV718Oh
	9OmzIIr93O0mPHmUouDcq+tTLukTptF6/n498MP/LeH1FBnhK0wTlc9CcHMZdH8jOVX4Ixtk0KI
	W4xXLV44dmNj+FgmYllUEBJ/GKnsUabKAwppBdStw+xHnsmQjMBQOqUsWgx5gIZ++dWnH7bnptr
	8PnHpyni8zVgXoAltsIJ+4gwXrEtJ0RPnyOnrZLfJpNcwN8SxNGYmDFMAQxOY8jOIJzfhTjt8WZ
	cYCY8zz7lYML+NDDNiAl8JNNKprgdtAQYaGZxY0g+uurJw0irHcuXHMq/bsBLv5Eyr/YIrqsDhz
	tRXZ9Cm+LY9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:56:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102817

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Update SSL configure instructions and license info.

Changelog:
===========
- OpenSSL 1.1.1t and 3.0.8 and wolfSSL 5.5.4 (or newer on the respective compatible branches) remain supported.
- updated translations and bumped SSL/TLS library version requirements.
- fixed a critical softbounce bug
- finds both rst2html5 with and without .py suffix when rebuilding the distribution.
- updated the configure script for --with-ssl properly identifying the right
  OpenSSL on a system with multiple OpenSSL versions installed, and updates the
  manual page and its HTML conversion process, and adds some error checking to the .netrc parser.
- added a wolfSSL compatibility workaround
- updated the manual page and several other documentation files, adds preliminary
  wolfSSL 5.0 support on systems that provide a C99 compiler, fixed up a specific
  fix for a compatibility issue with the end-of-life OpenSSL 1.0.2 around the
  expiry of the DST Root CA X3 certificate which impairs connectivity to
  Let's-Encrypt-certified sites. Supported OpenSSL versions 1.1.1 and newer are unaffected.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fetchmail/{fetchmail_6.4.23.bb => fetchmail_6.4.37.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/fetchmail/{fetchmail_6.4.23.bb => fetchmail_6.4.37.bb} (85%)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.23.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.37.bb
similarity index 85%
rename from meta-networking/recipes-support/fetchmail/fetchmail_6.4.23.bb
rename to meta-networking/recipes-support/fetchmail/fetchmail_6.4.37.bb
index 266573681e..4560ef84c3 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.23.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.37.bb
@@ -6,13 +6,13 @@ connections). It supports every remote-mail protocol now in use on the Internet:
 RPOP, APOP, KPOP, all flavors of IMAP, ETRN, and ODMR. It can even support IPv6 and IPSEC."
 SECTION = "mail"
 LICENSE = "GPL-2.0-only & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c3a05d9b9d3784c824c9b92a648e1353"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ee6b9f41d9324434dd11bd8a38f1b044"
 
 DEPENDS = "openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "5f7a5e13731431134a2ca535bbced7adc666d3aeb93169a0830945d91f492300"
+SRC_URI[sha256sum] = "4a182e5d893e9abe6ac37ae71e542651fce6d606234fc735c2aaae18657e69ea"
 
 inherit autotools gettext pkgconfig python3-dir python3native
 
-- 
2.34.1


