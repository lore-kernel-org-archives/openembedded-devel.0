Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.7580.1617967451388417145
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Apr 2021 04:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38022 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lUpF8-0005lE-Tt; Fri, 09 Apr 2021 14:24:07 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-speedtest-cli: Upgrade 2.1.2 -> 2.1.3
Date: Fri,  9 Apr 2021 14:23:52 +0300
Message-Id: <20210409112355.18857-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 2.1.3:

- Address issue where a test server may return an HTTP error
  during upload or download
- Address issue where ignore_ids may be empty or have empty values

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...3-speedtest-cli_2.1.2.bb => python3-speedtest-cli_2.1.3.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-speedtest-cli_2.1.2.bb => python3-speedtest-cli_2.1.3.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.2.bb b/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.2.bb
rename to meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb
index a901bbac8..2fbbed326 100644
--- a/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/sivel/speedtest-cli"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "543d38f8939e1716641cc7c00169ca03"
-SRC_URI[sha256sum] = "cf1d386222f94c324e3125ba9a0d187e46d4a13dca08c023bdb9a23096be2e54"
+SRC_URI[sha256sum] = "5e2773233cedb5fa3d8120eb7f97bcc4974b5221b254d33ff16e2f1d413d90f0"
 
 inherit pypi setuptools3
 
-- 
2.17.1

