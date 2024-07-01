Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF723C3814E
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:44:22 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.13840.1719816258167615010
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fEPUHbuN;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719816259; x=1751352259;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=a2mZnA/eH+wzpdzmfkXiKYd88xa7K6vA/CcVPXCdDHM=;
  b=fEPUHbuN9LpYXcAwhWiWo8R/ecqtmRi8Aa9C3t8BgyFOeQzIi7G9wzHQ
   7YHSHzy186r3uvGSE9vESdTldr7rAD7QWJKvkSG40BYYd50dEXq2lL5Z/
   FA5rUC9EnqgiUtAKUVnDRGnzan5TR3GPV/7V/Lgp8MoLy9IgvsBL89v0A
   ZpO1Rz0Z64BCvX8MObsFZTT/Ay0i6M1S5wa9jTjjz6BfXdjMm1R56s2Jo
   wm58N/zZ5ZgUQguUO7otA+Kq4zmO5dEQdd13Nbm8fVIyzdgofN67SKF8j
   d9UQAlpchCmay1X71yqfjaFawviCq71MbKv3oiNAR8yasfZz0NjAGS3qM
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="165494043"
X-IronPort-AV: E=Sophos;i="6.09,175,1716217200"; 
   d="scan'208";a="165494043"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 15:44:16 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A3A15C9322
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:13 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D95B6D50B1
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 770E020071A33
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:12 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 267411A000A;
	Mon,  1 Jul 2024 14:44:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 06/25] networkmanager: upgrade 1.48.0 -> 1.48.2
Date: Mon,  1 Jul 2024 14:43:43 +0800
Message-Id: <1719816242-11839-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
References: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28494.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28494.005
X-TMASE-Result: 10--4.168500-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrJ1hCPLkD1Z1s1Ir4NZzFmiDv
	6zn31UzgYYTfceDHm63W3AiQrSd3pOyP04jCzhUoA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYo3m/SOHWG/blwV2iaAfSWcURSScn+QSXt0H8LFZNFG7/nnwJ52QYi+Std
	83kHCpUVl1Kx1MCLmRr5V0rMfxi2zQ7hkeUW7UZQxZikMCMjTFdCFqk6zpQ9BBgVKiGk4I33cT/
	0vF//gGp6dXktu+Uuzux1QKUr7MhoK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 06:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111172

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Support matching a OVS system interface by MAC address.
* Fix port reactivation when the controller is reactivating.
* Save connection timestamps when shutting down, so that the right
  connection autoactivates after restart.
* Fix handling of VPN secrets for 2-factor authentication.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{networkmanager_1.48.0.bb => networkmanager_1.48.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.48.0.bb => networkmanager_1.48.2.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.2.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.0.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.2.bb
index 47287951f..113068e27 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.2.bb
@@ -44,7 +44,7 @@ SRC_URI = " \
 "
 SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 
-SRC_URI[sha256sum] = "fc80b942de38e329468e6fc1dfb40aad6a78d02ddf6b8ec31f9acc6460b8723f"
+SRC_URI[sha256sum] = "3d9071cc62964ddf0e31f5d06f0603e17568b8c95114ae277703581add5a86a1"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.34.1


