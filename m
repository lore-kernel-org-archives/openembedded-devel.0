Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.11231.1614093754171719354
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 07:22:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56178 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lEZWC-00022z-8l; Tue, 23 Feb 2021 17:22:33 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/10] python3-httplib2: Upgrade 0.18.1 -> 0.19.0
Date: Tue, 23 Feb 2021 17:22:14 +0200
Message-Id: <20210223152219.32129-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210223152219.32129-1-leon.anavi@konsulko.com>
References: <20210223152219.32129-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.19.0:

- auth: parse headers using pyparsing instead of regexp
- auth: WSSE token needs to be string not bytes

License-Update: Use file LICENSE instead of PKG-INFO

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-httplib2_0.18.1.bb => python3-httplib2_0.19.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-httplib2_0.18.1.bb => python3-httplib2_0.19.0.bb} (52%)

diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.18.1.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.19.0.bb
similarity index 52%
rename from meta-python/recipes-devtools/python/python3-httplib2_0.18.1.bb
rename to meta-python/recipes-devtools/python/python3-httplib2_0.19.0.bb
index 9c9b6c5b01..f720723a65 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.18.1.bb
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.19.0.bb
@@ -2,9 +2,8 @@ SUMMARY = "A comprehensive HTTP client library, httplib2 supports many features
 HOMEPAGE = "https://github.com/httplib2/httplib2"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=7e04d1303d64a7b62421751ecb490dc2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=56e5e931172b6164b62dc7c4aba6c8cf"
 
-SRC_URI[md5sum] = "0b331f96cdb2ae0e0342d4ea0f5f0502"
-SRC_URI[sha256sum] = "8af66c1c52c7ffe1aa5dc4bcd7c769885254b0756e6e69f953c7f0ab49a70ba3"
+SRC_URI[sha256sum] = "e0d428dad43c72dbce7d163b7753ffc7a39c097e6788ef10f4198db69b92f08e"
 
 inherit pypi setuptools3
-- 
2.17.1

