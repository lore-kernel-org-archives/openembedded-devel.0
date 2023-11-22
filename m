Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA898C61D92
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 06:32:55 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.13788.1700634766207791869
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 22:32:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="128538792"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="128538792"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 15:32:43 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 09D83D9DA6
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:32:42 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4712ECFF89
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:32:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 366162FC843A;
	Wed, 22 Nov 2023 15:32:40 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pdm: upgrade 2.10.1 -> 2.10.3
Date: Wed, 22 Nov 2023 14:31:02 +0800
Message-Id: <1700634662-8194-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28012.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28012.005
X-TMASE-Result: 10--4.383300-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yUIIxwDaU5mrArRmBtM54pQyiHqxwIX2MQQW
	LaZtC5E2qlPqyPnNc5Fbj6b8Z54R4BSelORfcNsu0QlBRwJqtSPkwFzTzcgzhB0zI+Wuf+4mlmG
	OZvTvMRdGKUkNvsY+KW+yQYaVKDU1NYwYTEoASsEdahq+rGDn/+8bT8P/COx0GfNEYhR21t0ICk
	IqpWqjjdCQaPiFU4JxDcq+tTLukTptF6/n498MP/LeH1FBnhK0wTlc9CcHMZdH8jOVX4IxtnbmU
	bkSsKD2enlAY4xvwSAua2HxxNDjveVHGbcDbAq6FEUknJ/kEl4YSQiB0ZTudfoLR4+zsDTt+gmV
	y5VdZkkJInelVC+6aNybGdGu2b0moffWAjC8Caoh4corrLeEdw2mogDdpuGkY4lZk/E7W8vzbgu
	BIU2hv9Xlut9na2zxxBCD4xEILgDyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 06:32:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107002

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
-Create virtualenv for conda base Python. #2409
-Log the response text when pdm publish fails with HTTP error.
-Improve the error message when a specific package can't be found in the lockfile.
-prevent wrong project name (including space and illegal characters)
-Fix a bug that PDM cannot detect namespace packages correctly when creating symlinks.
-Fix template files created by pdm init being read-only when copied from a read-only PDM installation.
-Don't reset the build backend when asking for import.
-Never wrap the output of the export command.
-Forbid global project in conda base environment, since it may remove conda-managed packages.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pdm_2.10.1.bb => python3-pdm_2.10.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm_2.10.1.bb => python3-pdm_2.10.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.10.1.bb b/meta-python/recipes-devtools/python/python3-pdm_2.10.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pdm_2.10.1.bb
rename to meta-python/recipes-devtools/python/python3-pdm_2.10.3.bb
index d5aab3db7..54da38927 100644
--- a/meta-python/recipes-devtools/python/python3-pdm_2.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.10.3.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "d166531c659fc4905933546544dd2e16cf648c2ba6d898c82126ad6a42117a81"
+SRC_URI[sha256sum] = "46dafc8a4fe268c46479876e52c6967f7a9aa385e1e574e64248670a37b358ff"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


