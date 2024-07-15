Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F3AC52CDC
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:06 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.33786.1721034178267353362
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oG4N0E+d;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034179; x=1752570179;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=3L3P6ouNkO8j/Z+lRZYXuhhAYEy5bhPUiN2zl3aTpHM=;
  b=oG4N0E+d+rsUEeSY/IziAM0SVl04pqMpwKCdp8CdqWEBtdkE9enh35lP
   sZM4cTuo8Le8JkX+8W8OWWJYJM7Oe9qVRFS0fLdzn+rqDt4lmkXeEZpmx
   5CVhDwagCEtdUbDXrcw/vjDinosgF/rPmuzpirZ71pc7JNtZc/qRFu8kH
   Nafr8GP4PDs9Ue4An54q2z9yCJpkmFaqIaf7vJp+ak03g1tUcUBu3XOuk
   tSm648RB1z994wMR9RIhgCx8ICQH+QWKXipq4xr4X5B/8gSF6iL4wmHHS
   mCDoJQHtw/tMweWuyk3IBQbNOsuXAubUD9/PRIPTQNUJgksmBR542pBzR
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="145800156"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="145800156"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:02:57 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 15A44D29E1
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:56 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 52876D7483
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C39F520071A3B
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8F9CF1A000D;
	Mon, 15 Jul 2024 17:02:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 14/38] networkmanager: upgrade 1.48.2 -> 1.48.4
Date: Mon, 15 Jul 2024 17:02:07 +0800
Message-Id: <1721034151-540-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.006
X-TMASE-Result: 10--0.244900-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrJ1hCPLkD1Z3+Aw16GgqpOz1u
	ZlSSRLdYmlzuGrlcP4cNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2Zx2
	5js+HUUPi8zVgXoAltsIJ+4gwXrEtJ0RPnyOnrZK4U4LE/fhGRaF6wPOCdDJwFJmAeeYHOD8XMY
	jb0fZFNcV/l8WrRcc0FgPypjYiMEoEUPTuHkrryXXfokTdycZwx9AHs/Vh9vJLv5Eyr/YIrqsDh
	ztRXZ9Cm+LY9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111335

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Support matching a OVS system interface by MAC address.
* When looking up the system hostname from the reverse DNS lookup of
  addresses configured on interfaces, NetworkManager now takes into
  account the content of /etc/hosts.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{networkmanager_1.48.2.bb => networkmanager_1.48.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.48.2.bb => networkmanager_1.48.4.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.4.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.2.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.4.bb
index 113068e27..8573a7327 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.4.bb
@@ -44,7 +44,7 @@ SRC_URI = " \
 "
 SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 
-SRC_URI[sha256sum] = "3d9071cc62964ddf0e31f5d06f0603e17568b8c95114ae277703581add5a86a1"
+SRC_URI[sha256sum] = "f25f35fe2ea1a473f7d184ccc72c8d4adc9705926fe4f3a7a3c8549941f56b03"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.34.1


