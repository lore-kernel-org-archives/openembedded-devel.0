Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.17406.1621249900082282163
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 May 2021 04:11:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33204 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lib9t-0007uL-5M; Mon, 17 May 2021 14:11:37 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-sh: Upgrade 1.14.1 -> 1.14.2
Date: Mon, 17 May 2021 14:11:25 +0300
Message-Id: <20210517111129.11619-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.14.2:

- bugfix where setting _ok_code to not include 0, but 0 was the
  exit code

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-sh_1.14.1.bb => python3-sh_1.14.2.bb}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sh_1.14.1.bb => python3-sh_1.14.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-sh_1.14.1.bb b/meta-python/recipes-devtools/python/python3-sh_1.14.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-sh_1.14.1.bb
rename to meta-python/recipes-devtools/python/python3-sh_1.14.2.bb
index 89d5008e98..5728ccf252 100644
--- a/meta-python/recipes-devtools/python/python3-sh_1.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sh_1.14.2.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/amoffat/sh"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6"
 
-SRC_URI[md5sum] = "50fc0a2953930ed8d0f6570835e88abf"
-SRC_URI[sha256sum] = "39aa9af22f6558a0c5d132881cf43e34828ca03e4ae11114852ca6a55c7c1d8e"
+SRC_URI[sha256sum] = "9d7bd0334d494b2a4609fe521b2107438cdb21c0e469ffeeb191489883d6fe0d"
 
 PYPI_PACKAGE = "sh"
 
-- 
2.17.1

