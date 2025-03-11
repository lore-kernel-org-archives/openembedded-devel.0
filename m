Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18FA2C36007
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:39 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.4202.1741683326615161703
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qeelxoD5;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683329; x=1773219329;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=iK4+wcGoxaYSquD52JI7G0wt/PTqD5v0IPDwoQ1BsAo=;
  b=qeelxoD52GBO4zkr7z8A58qiHzmABKdf3Aykvf3WAMXlH6nAYv0WPGHJ
   w/p7uSmRvPk5T50ssrd1HhgmGXVJNRRZiZeJWCy/JB5EcT5cFgLqaNdAD
   ocC3D/3j45mlzxfR/bs8dQ4f8HQeSZnwjAMog9ZPKXCnreFbdlrYTPEsq
   a2Xq5EUZM3QctZf1qf4EEO5KUK6GExlx3JFbvx8kBU7Ls4XRJ6X01A8UU
   B4Pi6zDC7itIS5FLgSa5TcDNwm/3Mtu7cbTBmP7M9iWh38h9ndIJFJ8r/
   qj4y0YWWm6tO4JcWnrCai9FFaT3FQBSkk6gQVXRHUpiblTBibXvTf/IR5
   w==;
X-CSE-ConnectionGUID: yGoqyHvzQayD9urXju6y9A==
X-CSE-MsgGUID: RuQ7hd4HRG2XMjtnEy1rQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="180663306"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="180663306"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:27 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 95C59E076B
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5BFA2D3F3E
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:25 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E961D1A0071;
	Tue, 11 Mar 2025 16:55:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/36] nss: upgrade 3.108 -> 3.109
Date: Tue, 11 Mar 2025 16:54:45 +0800
Message-Id: <1741683310-8681-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115862

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nss/{nss_3.108.bb => nss_3.109.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nss/{nss_3.108.bb => nss_3.109.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss_3.108.bb b/meta-oe/recipes-support/nss/nss_3.109.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.108.bb
rename to meta-oe/recipes-support/nss/nss_3.109.bb
index 0c42f40bb0..f14c722693 100644
--- a/meta-oe/recipes-support/nss/nss_3.108.bb
+++ b/meta-oe/recipes-support/nss/nss_3.109.bb
@@ -33,7 +33,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/$
            file://0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch \
            file://0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "a0f6fcb5dbadc1635b43827517a979e3a6d005d0788527802a6b31e2c5f66eec"
+SRC_URI[sha256sum] = "bea46c256118cd8910202f05339627d75291f13b80054527df58419b9d29c18b"
 
 UPSTREAM_CHECK_URI = "https://ftp.mozilla.org/pub/security/nss/releases/"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>\d+(\_\d+)+)"
-- 
2.43.0


