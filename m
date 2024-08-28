Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F66C54E75
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:26:03 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.8736.1724833561591794413
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:26:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XUgG0fZx;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833561; x=1756369561;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Ee2+UDpncfp7uWyHksRKXRgaC/5dWmqpFIkGqk1JeL0=;
  b=XUgG0fZxl3029EM6J3VeZT1VihuVRIs1QkhHxrBV+S46JXL4SBmwiCqS
   2lxkTw12wYJiDAy8pRdCRvztnkYS+VeCCKuUTn1QAaZFmbMXLEIk9X7DT
   YKPeS0dlVKCXB3OcG+tn8/YcdLaVboVHPHa/uW8vt+pWsdKYTDlLFWTJv
   Qw73yue2RPI6GBuMFgPbm2hdTQnP8CH+3TNwoLC8zwD/9urlX2tMwBgWY
   5EaSrLzJtJkqQFMxkK6uWfv1Dx20CrA+Fmj/v+dkQ4uu2tytBMK7d4581
   B9+PEuPtH8n65Lq4FqgaJgnWYlc1QJlCrJ0vB+tk1O2m2FCExrB3Tefjz
   w==;
X-CSE-ConnectionGUID: K0nMZ/wVQPWxY+nrk17+iQ==
X-CSE-MsgGUID: fnVEniSqTxayqVS66GLStA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="160202080"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="160202080"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:59 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 58E9FC9323
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:57 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8072FD3F14
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0A6166BCF0
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AB3AC1A0002;
	Wed, 28 Aug 2024 16:25:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 44/46] samba: upgrade 4.19.7 -> 4.19.8
Date: Wed, 28 Aug 2024 16:25:22 +0800
Message-Id: <1724833525-2162-43-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10-3.091600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBLpCLN4NR43qQ5
	DAOsl5Pl4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0541SOymiJfTYXHqx
	sBjV0bTaESVL06fzYO9wU8VHXGipCHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6LhN
	y6oY5dUW7WevKcy4FOm/vcRStqgyo+OFEMeXWibKu0vPCKbGC08B+NfmW3TNHjRswIiBRK15Iho
	sfFLw3iR8WdX6/hdqWCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112022

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://www.samba.org/samba/history/samba-4.19.8.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../samba/{samba_4.19.7.bb => samba_4.19.8.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.19.7.bb => samba_4.19.8.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.19.7.bb b/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.19.7.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.19.8.bb
index 796f1697f..09d5608df 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.19.7.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb
@@ -31,7 +31,7 @@ SRC_URI:append:libc-musl = " \
            file://samba-4.3.9-remove-getpwent_r.patch \
            "
 
-SRC_URI[sha256sum] = "2bbb800af2d6bc7b9c23e708cd58d008da3bfa6ef7e621d9ec8b53387efee445"
+SRC_URI[sha256sum] = "1aeff76c207f383477ce4badebd154691c408d2e15b01b333c85eb775468ddf6"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.19(\.\d+)+).tar.gz"
 
-- 
2.34.1


