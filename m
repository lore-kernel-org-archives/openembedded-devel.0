Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FFEBC41513
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 03:43:50 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.68.1718250223713798003
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jun 2024 20:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DYuorYos;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718250223; x=1749786223;
  h=from:to:cc:subject:date:message-id;
  bh=rwhul6/SAMrDIx9Q3DovIzj2ROp1DE00CV2Srqa2wLs=;
  b=DYuorYosTt3MvmNcrSsfD33QaCPig2mpSdPYw4Oe1PF2Vke2h8CSWRtA
   xiTz2pIXh0CGcxejV4lHE5EbLWa7Iqx7PzZ7OqTQl4PTsqUhMwic1LBhc
   pzY/rEpCAgLPILuS+Wv6hserYvDnt3cvdh11KKmdZPCb1ATLW8+IJ1ffc
   ThvhvncyVi50CWK0qzS96cndbxLEs9iSN0hh1N9TF6wwTD1UhqTIxUvc8
   friNCOEl/yejphqe2bCuErRgz0QOTAuWZuaBNG7uN7uAK+At8Fd27Mu9X
   sfV4QGk8odf+CVsaAVR8OmQpBrEK6JvJwP/Hv+U9sjvBuxArfeUbWnm3z
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="151181749"
X-IronPort-AV: E=Sophos;i="6.08,234,1712588400"; 
   d="scan'208";a="151181749"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 12:43:40 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id CF2A9E4289
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 12:43:38 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0FF27D3F06
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 12:43:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8A09CE2B24
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 12:43:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 35F061A0002;
	Thu, 13 Jun 2024 11:43:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 1/2] frr: use update-alternatives to solve conflicts with libsmi
Date: Thu, 13 Jun 2024 11:43:24 +0800
Message-Id: <1718250205-6029-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28450.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28450.004
X-TMASE-Result: 10--4.636600-10.000000
X-TMASE-MatchedRID: hVaMx/vKxVStxhXyTqc02bstbCLHbulS96ryTp77YeGysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLy9zcRSkKatcFBoCgEV4LyfUkgDiuGxn9csgu/IQFPzpsoi2XrUn/J8m+
	hzBStansfRoCwBzgRYidET58jp62S4js7mG3YW5ItSNW80Shhky1o7hQvlAixCfJpaH7oVpYJgH
	jCEk47zqs9DqSdQJZ+iew6+Kl5qFaAGZtD6/YT456sx2/x840VS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 03:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110886

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/share/yang/ietf-netconf-acm.yang conflicts between attempted installs of libsmi-yang-0.5.0-r0.aarch64 and frr-10.0-r0.aarch64
  file /usr/share/yang/ietf-netconf-with-defaults.yang conflicts between attempted installs of libsmi-yang-0.5.0-r0.aarch64 and frr-10.0-r0.aarch64
  file /usr/share/yang/ietf-netconf.yang conflicts between attempted installs of libsmi-yang-0.5.0-r0.aarch64 and frr-10.0-r0.aarch64

libsmi also uses the doc 'ietf-netconf-acm.yang ietf-netconf-with-defaults.yang ietf-netconf.yang'.
libsmi has a priority of 50.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-networking/recipes-protocols/frr/frr_10.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/frr/frr_10.0.bb b/meta-networking/recipes-protocols/frr/frr_10.0.bb
index bdc359667..afd2c95a0 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.0.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.0.bb
@@ -77,8 +77,11 @@ SYSTEMD_AUTO_ENABLE = "disable"
 inherit update-alternatives multilib_script multilib_header
 
 ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE:${PN} = " ietf-interfaces "
+ALTERNATIVE:${PN} = " ietf-interfaces ietf-netconf-acm ietf-netconf-with-defaults ietf-netconf"
 ALTERNATIVE_LINK_NAME[ietf-interfaces] = "${datadir}/yang/ietf-interfaces.yang"
+ALTERNATIVE_LINK_NAME[ietf-netconf-acm] = "${datadir}/yang/ietf-netconf-acm.yang"
+ALTERNATIVE_LINK_NAME[ietf-netconf-with-defaults] = "${datadir}/yang/ietf-netconf-with-defaults.yang"
+ALTERNATIVE_LINK_NAME[ietf-netconf] = "${datadir}/yang/ietf-netconf.yang"
 do_compile:prepend () {
    sed -i -e 's#${RECIPE_SYSROOT_NATIVE}##g' \
           -e 's#${RECIPE_SYSROOT}##g' ${S}/lib/version.h
-- 
2.34.1


