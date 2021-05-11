Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.1891.1620751947362690566
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 May 2021 09:52:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60228 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lgVcO-0007jj-FU; Tue, 11 May 2021 19:52:25 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-serpent: Upgrade 1.30.2 -> 1.40
Date: Tue, 11 May 2021 19:52:13 +0300
Message-Id: <20210511165217.18433-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.40:

- dotnet: added optiononal bytes repr (de)serialization
- java: added optional bytes-repr (de)serialization
- added unittest for new bytes-repr form
- add parameter to serialize bytes into byte literal
  representation instead of base-64 (which remains the default)

License-Update: Use file LICENSE.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-serpent_1.30.2.bb => python3-serpent_1.40.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-serpent_1.30.2.bb => python3-serpent_1.40.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-serpent_1.30.2.bb b/meta-python/recipes-devtools/python/python3-serpent_1.40.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-serpent_1.30.2.bb
rename to meta-python/recipes-devtools/python/python3-serpent_1.40.bb
index 64edff76ba..305222f764 100644
--- a/meta-python/recipes-devtools/python/python3-serpent_1.30.2.bb
+++ b/meta-python/recipes-devtools/python/python3-serpent_1.40.bb
@@ -1,9 +1,8 @@
 SUMMARY = "Serialization based on ast.literal_eval"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=5271c65b7cf83bd28055e592c2d14667"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d7c28f460fafe7be454fcdcac0b60263"
 
-SRC_URI[md5sum] = "cbef4f9c88f88c38195d11a0363a095f"
-SRC_URI[sha256sum] = "72753820246a7d8486e8b385353e3bbf769abfceec2e850fa527a288b084ff7a"
+SRC_URI[sha256sum] = "10b34e7f8e3207ee6fb70dcdc9bce473851ee3daf0b47c58aec1b48032ac11ce"
 
 inherit pypi ptest setuptools3
 
-- 
2.17.1

