Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EEFC27C6F
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:41 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.10787.1715677833427102751
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RrIAVtwK;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677840; x=1747213840;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Cwd2v1mXOzQ8Yxho+iwTIQHAo5V/QVRmUsUVl/L9pgE=;
  b=RrIAVtwK/dcYmL3TRODrOiB9gZuFxJxSpV+1pbqv6OM7OVvwUU3kwJjf
   8S5S70c3oigN657evf1PdP26umlirDRtqrztKfp/ZP1BUDgiuHHmtTH5n
   knw5ZRFei4V6aUAsP+xI3F6cJ7LTV6/iFonC/r9g70eXkjOjPHjr4v2HN
   cDDhVJIfjzyOkAtLIZXoTA83ARUeSMbMEwpjGeXPN8FmwOW5VygP5UJMT
   UJyzLOeqNT8OglYPTN5CZ7Ifd4/m2j+jQI03U/yuo8qJsAo8EjaY+3r+b
   5HYn4XPdKwtoMTLSJjksVy+3skwW/FTrKfKPMhj6oo6+n+Rw0ZvhzKXaQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="137527411"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="137527411"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:38 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B5FA3E8EB1
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:36 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id ED8F3D623B
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 84D7820076D15
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3285B1A000B;
	Tue, 14 May 2024 17:10:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/44] python3-nocasedict: upgrade 2.0.1 -> 2.0.3
Date: Tue, 14 May 2024 17:10:03 +0800
Message-Id: <1715677817-2223-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10--4.430500-10.000000
X-TMASE-MatchedRID: PXzrFdFmygGjz0nOeth/yak29rFswht+2+EDPw+8xrfVbZFdXapsKdzJ
	LyRJwSjvXr7NXg/pSgQSdsyRTAMwe2HZHUGvnBShqoeab9Xgz8/vQYvK/M6DTOM7CMEwq+YWMFd
	dv+pLbrf8NbUa8eS06HiY0fmQvuBmta0JofnNWy20sqHhc36lG/i4nVERfgwd8jflxBKMkr7mho
	PwYrefbVI0C8EDkpEsGnbcghulT6FHMehuZse+zgPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn6
	DBj/gsEIvrftAIhWmIAf/HImzvCGEWNbZfbxvwGOwpfLMeBwRuuLG21Eb4T84Fum2PEjqt1o8WM
	kQWv6iXBcIE78YqRWo6HM5rqDwqtPtwHIPhWgxx64tZu9NWV+CMvXqGq57+MKpviHcbP9i45zIu
	2d3e182T27atbdqroLciJ8un3xhfbPXhM1zQpIeIUKEjToVe4HSbhGbmGylXFJK7yLnZRGZdO3Q
	67ImL8gi4RUz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110374

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfixes:
=============
- Docs: Added Python 3.12 to the supported versions in the package metadata.
- Docs: Updated the README file with the changes from the introduction section
  w.r.t. Python 2 and limitations.
- Dev: Fixed flake8 issue about comparing types in test code.
- Fixed safety issues up to 2024-05-05. No changes in package dependencies.
- Test: Removed setup.py based installs from "make installtest", since one of
  them started installing a pre-release of a package on an unsupported Python
  version. The recommendation has been for a while now to no longer use
- Docs: Added RTD config file .readthedocs.yaml
- Test: In the Github Actions test workflow for Python 3.6 and 3.7, changed
  macos-latest back to macos-12 because macos-latest got upgraded from macOS 12
  to macOS 14 which no longer supports these Python versions.
- Test: Fixed issues resulting from removal of support for pytest.warns(None)
  in pytest version 8.
- Docs: Converted README file from RST to MarkDown to fix badge alignment issue
- Dev: Added missing dependency to minimum-constraints.txt to several make
  targets that used it with PACKAGE_LEVEL=minimum.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-nocasedict_2.0.1.bb => python3-nocasedict_2.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nocasedict_2.0.1.bb => python3-nocasedict_2.0.3.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_2.0.1.bb b/meta-python/recipes-devtools/python/python3-nocasedict_2.0.3.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-nocasedict_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-nocasedict_2.0.3.bb
index 5a2985817..105c20b5a 100644
--- a/meta-python/recipes-devtools/python/python3-nocasedict_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-nocasedict_2.0.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pywbem/nocasedict"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
 
-SRC_URI[sha256sum] = "960cb699f1209da80ac39e3ab50aa7342fe8ca9f70606c23447a510550435e50"
+SRC_URI[sha256sum] = "1c9226c7f5a8a97ad51dcb0ae3157a720e3f7cb9c4568d22ea3a05e3f85658a9"
 
 inherit pypi setuptools3
 
-- 
2.34.1


