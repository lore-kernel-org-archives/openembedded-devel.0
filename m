Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3594C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 00:31:03 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.46231.1702600258707486660
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 16:30:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="131071106"
X-IronPort-AV: E=Sophos;i="6.04,277,1695654000"; 
   d="scan'208";a="131071106"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 09:30:55 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 925B6E8E36
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 09:30:53 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B279AD94C4
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 09:30:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 89BE586578;
	Fri, 15 Dec 2023 09:30:51 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-websocket-client: upgrade 1.6.4 -> 1.7.0
Date: Fri, 15 Dec 2023 08:29:18 +0800
Message-Id: <1702600158-1901-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28058.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28058.003
X-TMASE-Result: 10--2.295300-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrt8aVFofjWHvdtCoZAk3E1F2d
	sxCRbuoBqh9drh/jR8ItD1kIcLD9bG5HKMIlyPKPUgKYbZFF6GhUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmis1RWeqLGIw6DIpcBQ49iRBCE2NlBjIjcKXqmmYTGpxiUg5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyh25y5ud52XA58rfj5YPs+aEF/
	rHUU1EBFzk6CMveUNGSKhKE46tTVqUalP1ijyeIHgk6z9Zm8e7xZfZRoOdfC8FYrFCkRyFp/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 00:31:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107477

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Renamed 'mask' variable in ABNF to prevent name collision with 'mask()' function
- Fixed old http import of HTTPStatus in _handshake.py
- Add 'send_text()' and 'send_bytes()' to _app.py
- Improved typehint support
- General readability improvements, made all string concatenations use f-strings
- Applied black formatting style to code

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...socket-client_1.6.4.bb => python3-websocket-client_1.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-websocket-client_1.6.4.bb => python3-websocket-client_1.7.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_1.6.4.bb b/meta-python/recipes-devtools/python/python3-websocket-client_1.7.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-websocket-client_1.6.4.bb
rename to meta-python/recipes-devtools/python/python3-websocket-client_1.7.0.bb
index 961cdb916..b202d6855 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_1.6.4.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_1.7.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/websocket-client/websocket-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6eae3bb7247ccb2c3a087ea8de759c01"
 
-SRC_URI[sha256sum] = "b3324019b3c28572086c4a319f91d1dcd44e6e11cd340232978c684a7650d0df"
+SRC_URI[sha256sum] = "10e511ea3a8c744631d3bd77e61eb17ed09304c413ad42cf6ddfa4c7787e8fe6"
 
 inherit pypi setuptools3
 
-- 
2.34.1


