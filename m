Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FCDEB64DA
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 06:50:41 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.2282.1687157427260781352
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jun 2023 23:50:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="122527040"
X-IronPort-AV: E=Sophos;i="6.00,254,1681138800"; 
   d="scan'208";a="122527040"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 15:50:31 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id DC2BFDAE0C
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:28 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 32D0E142A0
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 62ED22FC8442;
	Mon, 19 Jun 2023 15:50:27 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xmodem: upgrade 0.4.6 -> 0.4.7
Date: Mon, 19 Jun 2023 14:48:26 +0800
Message-Id: <1687157308-17342-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
References: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27700.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27700.005
X-TMASE-Result: 10-1.316200-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrPYWAASIMdr99KJhEY+vRMXvU
	CoLZpk+xfif6PsvfsVJ82IENZx2kDTbcsMCH+ZLFtXpctKvGlKFUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmi7IWnvto+9Z1oMLOoNHsM9hCE2NlBjIjcKXqmmYTGpxiUg5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyGj0TTUTL0es1B/9GNmu/1tYt3
	a9syxFlTUGkjsAjy+yalC2w5NgUe3KDJWROKWXSHoMawA6AGtO3d478Q3tT1uI7o80gafQ8/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103377

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  bugfix: stall on some kinds of error in recv(), PR #56
  bugfix: sequence number miscalculation in send(), PR #52
  enhancement: callback function added for recv() method, PR #53
  bugfix: receiving empty file and stall condition in recv(), PR #50
  bugfix: callback is now called for some kinds of errors and some CLI fixes, 8a798e8
  bugfix: remove DepreactionWarning for logging.warn(), PR #49

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-xmodem_0.4.6.bb => python3-xmodem_0.4.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmodem_0.4.6.bb => python3-xmodem_0.4.7.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-xmodem_0.4.6.bb b/meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-xmodem_0.4.6.bb
rename to meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb
index 6df392e2d..80fe94555 100644
--- a/meta-python/recipes-devtools/python/python3-xmodem_0.4.6.bb
+++ b/meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "XMODEM protocol implementation"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRC_URI[sha256sum] = "089737298f5738eabc43f2519efdc80b402693768f16383f7013b9e6f8f279d7"
+SRC_URI[sha256sum] = "2f1068aa8676f0d1d112498b5786c4f8ea4f89d8f25d07d3a0f293cd21db1c35"
 
 inherit pypi setuptools3
 
-- 
2.34.1


