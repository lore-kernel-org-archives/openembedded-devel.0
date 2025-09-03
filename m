Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 038A6CA1010
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:03:50 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.7933.1756890227660505659
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ffs+aWVc;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890228; x=1788426228;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lk7D8rhXGR5QL0cbNrpFD36uoHllAb3YZWP1HujkOR8=;
  b=ffs+aWVcsc3KnZrNZx1raGn1gOP+FX9RWYYiB/xSsDwmYrOWP9jgvvwb
   z3Km/2kyVeX9iQYShXONjqlW5mpRnL+bZqykaL/bFlj04mQLQfH1HcvMJ
   H8rxrmJB/PUrPpVagCv6hHprikps+pj7nb6acl1se+VmU7nE9urlE8qfk
   asiPLgHh4OuxQ883AIlMI8rhTGD7gHgtqBtAYKh0cdkFHHmHdaDdBwvv5
   oJAczQD7aSwtCMOCbupBKtjyxHS6UXn48M/iWQnF5JUR+4cv236DK3UOd
   Bs4RZLmkfyY4Q8RF1Av6GuNL9OMN6auh732zTo4/addcOwsK4gTWIDHIC
   g==;
X-CSE-ConnectionGUID: 8nXQiiCsRVuVzYnllMEY9A==
X-CSE-MsgGUID: e0QTwWP4T1CMBhHABXlXIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="214919157"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="214919157"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:46 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 2F18F100034B
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:46 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id DB54F1150728
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:45 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 985301801C54
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AD6D81A0069;
	Wed,  3 Sep 2025 17:03:40 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 17/56] networkmanager-openvpn: upgrade 1.12.2 -> 1.12.3
Date: Wed,  3 Sep 2025 17:02:38 +0800
Message-ID: <20250903090317.2002-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119214

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nager-openvpn_1.12.2.bb => networkmanager-openvpn_1.12.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.12.2.bb => networkmanager-openvpn_1.12.3.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.3.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.2.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.3.bb
index 2dec7cbb86..159c3f7100 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.3.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${PV}")}/Netw
 
 SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 
-SRC_URI[sha256sum] = "aa1b5f9addf8d64bc8c459361cf0d5e3eb99f14b60ea82a3500631928af62a6f"
+SRC_URI[sha256sum] = "4bda1c8559bb8c35f6f131c09edae90cdfccd0314e8b8cb98ac55e09b6005adc"
 
 S = "${UNPACKDIR}/NetworkManager-openvpn-${PV}"
 
-- 
2.43.0


