Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.22650.1611829767234820494
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 02:29:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43042 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l54YE-00080R-Ai; Thu, 28 Jan 2021 12:29:26 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-urllib3: Upgrade 1.26.2 -> 1.26.3
Date: Thu, 28 Jan 2021 12:29:01 +0200
Message-Id: <20210128102903.11760-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210128102903.11760-1-leon.anavi@konsulko.com>
References: <20210128102903.11760-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.26.3:

- Fixed bytes and string comparison issue with headers
- Changed ProxySchemeUnknown error message to be more actionable
  if the user supplies a proxy URL without a scheme

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-urllib3_1.26.2.bb => python3-urllib3_1.26.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.26.2.bb => python3-urllib3_1.26.3.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.26.2.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.26.3.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.26.2.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.26.3.bb
index fcd670901..739cf24f5 100644
--- a/meta-python/recipes-devtools/python/python3-urllib3_1.26.2.bb
+++ b/meta-python/recipes-devtools/python/python3-urllib3_1.26.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "19188f96923873c92ccb987120ec4acaa12f0461fa9ce5d3d0772bc965a39e08"
+SRC_URI[sha256sum] = "de3eedaad74a2683334e282005cd8d7f22f4d55fa690a2a1020a416cb0a47e73"
 
 inherit pypi setuptools3
 
-- 
2.17.1

