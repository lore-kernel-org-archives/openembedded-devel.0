Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 948E4C0218A
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.30361.1735032442964034340
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PVeIUBkv;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032443; x=1766568443;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=d6IsB6/7f28SoacaQ3PRJBYV2mdvus/bVb3YT5eGi+Q=;
  b=PVeIUBkvv7XO6WHgawqaYeIZZwPZ1MEFWwF4dXaT7psGb9AZf/JmViOL
   y/8exAfPtNTMO72i19IHGvm4v0fckJO1yaOivpk3UHjUo7HWsYw5pp+hs
   yWVnHxmpaf5MoNA+AtbNtaTJiSNoBiTO9363UcS18m11V1EboiDXapjNC
   QV2Oog9MOiG/7awfPgN9iOe/Apu5xmdQRSGXouzuJ33jQPlaMSVSg3+RZ
   YOsAHLZ86yyVy5FwCcLIDAukza0/9WxNSN38N4ZwMt436MRLBWOD0x2EL
   Pd9gV2wSwKp1t3LnyW4OeMjYrTAYHI+pOYHVLuIEOHdwkHbfyFgfLdQsX
   A==;
X-CSE-ConnectionGUID: i+oleKpgR5a4MjMc/hkJ2Q==
X-CSE-MsgGUID: 15gaHBkeSp6SpsrWcKOFwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="184809909"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="184809909"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:21 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 164B1D4807
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DF8EAD4C17
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F18020071A3A
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:18 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2798E1A006C;
	Tue, 24 Dec 2024 17:27:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/67] python3-eth-keyfile: upgrade 0.7.0 -> 0.8.0
Date: Tue, 24 Dec 2024 17:26:15 +0800
Message-Id: <1735032421-13513-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-0.250400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mregIHHX2L4YyU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN3IFFT9wqfr0QhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXLc7tydvPRpBxPMz+VrXoT+L+C2bUDRZXl/FY
	5V32spKr+yK/MSGgrPm1cXIrvICqaKmGPVT0fR1/G8Z7WyOZUaFvZsmv9Hl+H+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114494

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add decode keyfile json v4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-eth-keyfile_0.7.0.bb => python3-eth-keyfile_0.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-keyfile_0.7.0.bb => python3-eth-keyfile_0.8.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-keyfile_0.7.0.bb b/meta-python/recipes-devtools/python/python3-eth-keyfile_0.8.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-eth-keyfile_0.7.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-keyfile_0.8.0.bb
index 2afc288bce..741db5ced0 100644
--- a/meta-python/recipes-devtools/python/python3-eth-keyfile_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-keyfile_0.8.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6749008d847c14b9718949c2e24d5c0a"
 
-SRC_URI[sha256sum] = "6bdb8110c3a50439deb68a04c93c9d5ddd5402353bfae1bf4cfca1d6dff14fcf"
+SRC_URI[sha256sum] = "02e3c2e564c7403b92db3fef8ecae3d21123b15787daecd5b643a57369c530f9"
 
 inherit pypi setuptools3
 
-- 
2.43.0


