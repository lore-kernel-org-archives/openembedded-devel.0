Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7320EC197BF
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:05 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.2199.1740525896246915191
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VQ9vkoi2;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525902; x=1772061902;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OUjrI5i34R+UdcHFHSr02TMyeE4oY0epBqHpl+LrrwU=;
  b=VQ9vkoi2CTouWLOHMAfvVs3utFbIDgBPhQ54lIiNV1ueANaKdBpRXIIP
   Ve0F7HgczAvNwPQkYjkNABjM5zCcSwgUK6OHkc3IO8x3hgeYkvbzMf0DU
   gnn3mnZpvnfQrSiG4+uEcdWJWNHNAVO6zprTNiTHKuXFHkXM6Nmh2dIAA
   PirJExOvihZH7LNPdldYPmSb+m+0LqCLN7Mqa3GZbYetO0xfs+JpT3JFY
   F1DkCccu0DTiCRiAGpXoy4/o4Sqdhv7iM928aEeDa0B6xdOa9jtX9BuZh
   rA/dHy9f3SvZ8eCBwc4C1dgLDJKI1glFJcbQ/itfaWpvisffAx8DNyA0l
   g==;
X-CSE-ConnectionGUID: tnm2rcDZTpSnle5HAP7foQ==
X-CSE-MsgGUID: eMXtsOdlRMyjkcL0qJsFeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="191127607"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="191127607"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:25:01 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C49D8D480F
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 86DABD50B1
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:58 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2B20E1A006C;
	Wed, 26 Feb 2025 07:24:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/51] python3-humanize: upgrade 4.12.0 -> 4.12.1
Date: Wed, 26 Feb 2025 07:24:21 +0800
Message-Id: <1740525881-21103-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115628

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix regression in naturalsize for float

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-humanize_4.12.0.bb => python3-humanize_4.12.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_4.12.0.bb => python3-humanize_4.12.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_4.12.0.bb b/meta-python/recipes-devtools/python/python3-humanize_4.12.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-humanize_4.12.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_4.12.1.bb
index 1b9ea94300..334f788747 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_4.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_4.12.1.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "87ff7b43591370b12a1d103c9405849d911d4b039ed22d80b718b62c76eec8a3"
+SRC_URI[sha256sum] = "1338ba97415c96556758a6e2f65977ed406dddf4620d4c6db9bbdfd07f0f1232"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


