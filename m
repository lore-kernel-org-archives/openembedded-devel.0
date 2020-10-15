Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.7041.1602746535288025691
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2020 00:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40534 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kSxaV-0005mO-DB; Thu, 15 Oct 2020 10:22:12 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-iniconfig: Upgrade 1.0.1 -> 1.1.1
Date: Thu, 15 Oct 2020 10:22:01 +0300
Message-Id: <20201015072201.13634-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201015072201.13634-1-leon.anavi@konsulko.com>
References: <20201015072201.13634-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.1.1:

- typing stubs
- ci fixes
- fix version determination

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-iniconfig_1.0.1.bb => python3-iniconfig_1.1.1.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-iniconfig_1.0.1.bb => python3-iniconfig_1.1.1.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb b/meta-python/recipes-devtools/python/python3-iniconfig_1.1.1.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-iniconfig_1.1.1.bb
index 9ed0e033b7..af4291bbf4 100644
--- a/meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-iniconfig_1.1.1.bb
@@ -3,6 +3,7 @@ SUMMARY = "A small and simple INI-file parser module"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 
-SRC_URI[sha256sum] = "e5f92f89355a67de0595932a6c6c02ab4afddc6fcdc0bfc5becd0d60884d3f69"
+SRC_URI[md5sum] = "0b7f3be87481211c183eae095bcea6f1"
+SRC_URI[sha256sum] = "bc3af051d7d14b2ee5ef9969666def0cd1a000e121eaea580d4a313df4b37f32"
 
 inherit pypi setuptools3
-- 
2.17.1

