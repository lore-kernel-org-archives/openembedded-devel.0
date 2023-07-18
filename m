Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E55EB64DD
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:26 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.692.1689654385490517538
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="124701731"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="124701731"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:24 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 709D1CD7E4
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:21 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 87A1EBF4A9
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:20 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1DF9E20077821;
	Tue, 18 Jul 2023 13:26:20 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] tesseract: upgrade 5.3.1 -> 5.3.2
Date: Tue, 18 Jul 2023 12:25:45 +0800
Message-Id: <1689654348-30702-43-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10--0.645300-10.000000
X-TMASE-MatchedRID: AFiVwG0qm0+jz0nOeth/yUIIxwDaU5mrxZpjHSMI6w4ErOtgylrM6o/j
	4gKDoVqZayGr0D0+EpjAWjBctGeHtA+Y/cURKjWPEhGH3CRdKUUE9jhJ6ArePHhh5KUdlgWinUy
	hUZL1jLZz6MiWhurs/HZlk8Get9s6Q13AvFtLFPsZca7SN08UZF7OZ6hrwwnzSMg2Oe/b8EyR5x
	tfeKAptiLMJX9YYHBwWrb1MzA3JCqh8NIgadoMHgPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn6
	DBj/gsEIvrftAIhWmIAf/HImzvCGO/Ui0F8hu7QgyKXAUOPYkQQhNjZQYyI3HztJgOULF9rREff
	Vh/puQ7egKf/r6b46i5rYfHE0OO95UcZtwNsCroURSScn+QSXt0H8LFZNFG76sBnwpOylLPe3bZ
	kZJL/dggccIj/NcEFy9ljqvnKo/0hBMIBV8tNhNBmzfustCo1h0AIsmjomDf2XiJbBrBjqq/5aW
	Tru8mggTNKdAh2w46IHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103936

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Updates for snap package building.
* Support for Sgaw and W Pwo Karen languages in the Myanmar validator (#4065).
* Improve format of logging from lstmtraining.
* Use less digits in filenames of checkpoints written by lstmtraining.
* Replace deprecated sprintf.
* Remove unused code in function fix_rep_char.
* Avoid 32 bit overflow in multiplication (fixes 3 CodeQL CI alerts).
* Avoid conversions from std::string to char* to std::string.
* Abort with error message if OSD is requested with LSTM-only model.
* cmake: allow to disable tiff (-DDISABLE_TIFF=ON).
* cmake: provide info about disabled LibArchive and CURL.
* cmake: check if leptonica was build with tiff support.
* Remove old broken GitHub action vcpkg-4.1.1 (fixes issue #4078).
* Create config.yml.
* Fix typos.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tesseract/{tesseract_5.3.1.bb => tesseract_5.3.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/tesseract/{tesseract_5.3.1.bb => tesseract_5.3.2.bb} (91%)

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.3.1.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.3.2.bb
similarity index 91%
rename from meta-oe/recipes-graphics/tesseract/tesseract_5.3.1.bb
rename to meta-oe/recipes-graphics/tesseract/tesseract_5.3.2.bb
index 8e54a2791e..db66e890fa 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.3.1.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.3.2.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://github.com/tesseract-ocr/tesseract/issues"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "71af4542990adae6d9f31d6657068bc0139c6ec4"
+SRCREV = "489f101c7e2276c00490f3ab70e9e7926fc6b481"
 SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


