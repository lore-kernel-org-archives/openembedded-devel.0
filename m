Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 506C2C282D5
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.2205.1740525899882152988
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=syozIOiN;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525900; x=1772061900;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=CH+mi02DSxzf6ACsFgLdvc31RzT5GVUGIhxXTSR3fww=;
  b=syozIOiNlJtdvnPlpNFwmrF77pf0JMxWeDJMJJHRIVJsaxw/qJMxh6tS
   8loHyX8V5ywPn+tjCM0uvz4Jhwo/3Ub/7j5t0TKFrgMs7/7My5hi5V9vt
   E9VAcGNaQRl5zn2GGHu4pwkPMtuw2NNQFPIBjBayQfmgjTBvFTEvOELEe
   jKE7GpMNJ4RWOJkYqALgqMwnjig079GCYUutX5UQGcR+fFo1VvCCUk/io
   yXg5PoF2BhShHNcP9RJRunOk70VBiDIgazU5mRPJ8y+/yP8/CmP7eMrWw
   Tb5NTCJwXhKTp1B7B1oYzOMNOq0hYARPSB29x5hV/l4BfaJt1TtZTjR+j
   A==;
X-CSE-ConnectionGUID: dbPliqgpSrqGp4T06p6qdg==
X-CSE-MsgGUID: nzKmlqyrRgy45UhOFKjdZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="170032172"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="170032172"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:58 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B7BE3D480C
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 81131D729A
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:56 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 252391A006C;
	Wed, 26 Feb 2025 07:24:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 22/51] openfortivpn: upgrade 1.22.1 -> 1.23.1
Date: Wed, 26 Feb 2025 07:24:12 +0800
Message-Id: <1740525881-21103-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115617

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- fix a few coverity warnings
- Support older mac0S versions that lack vdprintf()
- Patch certificate login error for FortiOS 7.4.4
- Clear OTP after run
- Support SAML login authentication

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{openfortivpn_1.22.1.bb => openfortivpn_1.23.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/openfortivpn/{openfortivpn_1.22.1.bb => openfortivpn_1.23.1.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.22.1.bb b/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.23.1.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.22.1.bb
rename to meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.23.1.bb
index b69a7e2355..4e964b3448 100644
--- a/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.22.1.bb
+++ b/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.23.1.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d575262a651a6f1a17210ce41bf907d"
 
 SRC_URI = "git://github.com/adrienverge/openfortivpn.git;protocol=https;branch=master"
-SRCREV = "388fa98f639ef91733461de50b06dd57f1ffb099"
+SRCREV = "a011b5c916075bd240db6a03c02eac95baf09ad8"
 
 DEPENDS = "openssl"
 
-- 
2.43.0


