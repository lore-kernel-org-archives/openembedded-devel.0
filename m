Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CFFC02187
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:12 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.40064.1736843346670641287
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eoPfNK4r;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843346; x=1768379346;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=MPEjFxvbBpRgQVp4ds18g7oYimHYxMsJtYPZYLh8L5k=;
  b=eoPfNK4r9hvbKUfhxoV3uYxDPsjoWn56lmf4Aha3b7bkah0STVsDTK62
   dUJN6IXPwUjOKgEdba+LiKhl0tOP6OYb5nzdeCsJWd/XvQWrF4QI+cSH2
   ms9kOmQRHlQRkCNjIAT7oMZ78fB50UwOQOpZECPTXnPiDpj7pgozvOKCZ
   8blS+RTJe9ReXyS9hDU1dblpmZ5+nXjYxdRg7gRgmBhIryK3urE5RYjAC
   KK8fNgXLD1+eIBaanIhLMx54hgH4WEFig6r/q8AnOnUkrIfFum8Api+tC
   EIAd6PKESsecDUdl2edBBStiahlAcWmyoR4r49rtXFfXgDwTk9DLyLyJ+
   w==;
X-CSE-ConnectionGUID: aagNpaqWS6uKf1k4ROQYpg==
X-CSE-MsgGUID: jajDyyvBTKyUO1i9allT2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="174843751"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="174843751"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:05 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id AE729C2267
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:04 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 86C25D88BA
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2110F20071A35
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:04 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C3C681A000B;
	Tue, 14 Jan 2025 16:29:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 11/30] lldpd: upgrade 1.0.18 -> 1.0.19
Date: Tue, 14 Jan 2025 16:28:30 +0800
Message-Id: <1736843329-4131-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10--1.850200-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrETae8Q/uL1EWxRFlzVAvGh+D
	i3+4QSRcfBXWVWbMWwXQ8p/dAv6bUtRzdb2x24TcI0cHLI6lhgJ+tO36GYDlsnhh5KUdlgWiSh0
	ZXUsahvmN/ziTW5bneOpe9co8GDkGbRev5+PfDD9O5y1KmK5bJTZlY6a4lRLZpS6t4C9cuqajxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipct0/GINySC33j0OErbZ7wRlV7RWiRss6OpOin
	CBUSkd8ghU6hWjbMTQhnWqfoIZTUbkYc50Fz0Au9j2NQpsAltaaSUOSWV26X/6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114855

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Support of both Apple Silicon and Intel for macOS package.
- Add cvlan/svlan/tpmr capabilities.
- Disable LLDP in firmware for Intel X7xx cards on FreeBSD.
- Add lldpctl_watch_sync_unblock to liblldpctl.
- Add C++ wrapper for lldpctl.
- Fix AppArmor policy for /run/lldpd/lldpd.socket.lock.
- Do not query stats for a down interface on Linux.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-daemons/lldpd/{lldpd_1.0.18.bb => lldpd_1.0.19.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.18.bb => lldpd_1.0.19.bb} (96%)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.18.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.19.bb
similarity index 96%
rename from meta-networking/recipes-daemons/lldpd/lldpd_1.0.18.bb
rename to meta-networking/recipes-daemons/lldpd/lldpd_1.0.19.bb
index 4deab153c4..f4c030f7ce 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.18.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.19.bb
@@ -12,7 +12,7 @@ SRC_URI = "\
     file://run-ptest \
     "
 
-SRC_URI[sha256sum] = "4b320675d608901a4a0d4feff8f96bb846d4913d914b0cf75b7d0ae80490f2f7"
+SRC_URI[sha256sum] = "f87df3163d5e5138da901d055b384009785d1eb50fdb17a2343910fcf30a997f"
 
 inherit autotools update-rc.d useradd systemd pkgconfig bash-completion github-releases ptest
 
-- 
2.43.0


