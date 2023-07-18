Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F14C001DE
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:16 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.685.1689654371853954200
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="103641340"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="103641340"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:09 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A50F8C68E9
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:07 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id DFBFFCF7C6
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:06 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6945920077821;
	Tue, 18 Jul 2023 13:26:06 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-obd: upgrade 0.7.1 -> 0.7.2
Date: Tue, 18 Jul 2023 12:25:19 +0800
Message-Id: <1689654348-30702-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10--5.729800-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yaoXHZz/dXlxyqyllX6UJIsVdewhX2WAAUw7
	mOUQLXqYbFMiA8bgkE2bI/nYONQmMixsmu2ROb+D8Jb881FGn9lUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmi7IWnvto+9Z10nAlKzysDOWKlAOJxAWDGTIySrl8Ye7Z5Wz
	SyTIRpLZgvVfiqe2AOzD59ilFX7wQ7BOj1lchJLN0KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtw1tMVU7ONTxwmEvWLnKzv5F+WYhk0mTTWeBtLDn2ACPDoC9rW6XfmQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103910

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
  Add a common issue section and document the Bluetooth issue.
  Adds support for the Mode 9 PIDS, including VIN and CVN.

Changelog:
===========
  Updated pint dependency for compatibility with python >= 3.10
  Support for Mode 9 PIDs
  Added 1 second read-retry loop for unresponsive dongles

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-obd_0.7.1.bb => python3-obd_0.7.2.bb}    | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-obd_0.7.1.bb => python3-obd_0.7.2.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-obd_0.7.1.bb b/meta-python/recipes-devtools/python/python3-obd_0.7.2.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-obd_0.7.1.bb
rename to meta-python/recipes-devtools/python/python3-obd_0.7.2.bb
index 0cb1b85e5a..d78642a9bd 100644
--- a/meta-python/recipes-devtools/python/python3-obd_0.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-obd_0.7.2.bb
@@ -1,9 +1,8 @@
 DESCRIPTION = "A python module for handling realtime sensor data from OBD-II vehicle ports"HOMEPAGE = "https://github.com/brendan-w/python-OBD"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://README.md;md5=58ba896fa086c96ad23317cebfeab277"
+LIC_FILES_CHKSUM = "file://README.md;md5=176d0f9ad45c10895296260d426fa862"
 
-SRC_URI[md5sum] = "305efcb6c650db7b9583532355ebeb7c"
-SRC_URI[sha256sum] = "8b81ea5896157b6e861af12e173c10b001cb6cca6ebb04db2c01d326812ad77b"
+SRC_URI[sha256sum] = "20d38c9ded3daad1e8affab3ff367a70788d4f29ac77ab7aacddc6a6d2a43d61"
 
 inherit setuptools3 pypi
 
-- 
2.34.1


