Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.11299.1614093756115502798
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 07:22:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56178 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lEZWE-00022z-69; Tue, 23 Feb 2021 17:22:35 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/10] python3-iso8601: Upgrade 0.1.13 -> 0.1.14
Date: Tue, 23 Feb 2021 17:22:16 +0200
Message-Id: <20210223152219.32129-7-leon.anavi@konsulko.com>
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

Upgrade to release 0.1.14:

- Add GitHub build actions for project
- Add project URLs in setup.py
- Update and fix README links
- Fix handling of README in setup.py (encoding fun in 3.5, 3.6
  and pypy3)
- Add Python 3.9 to test matrix
- Add type hints
- Derive ParseError from ValueError

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-iso8601_0.1.13.bb => python3-iso8601_0.1.14.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-iso8601_0.1.13.bb => python3-iso8601_0.1.14.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-iso8601_0.1.13.bb b/meta-python/recipes-devtools/python/python3-iso8601_0.1.14.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-iso8601_0.1.13.bb
rename to meta-python/recipes-devtools/python/python3-iso8601_0.1.14.bb
index 9e7494b3e0..c531fcc6d8 100644
--- a/meta-python/recipes-devtools/python/python3-iso8601_0.1.13.bb
+++ b/meta-python/recipes-devtools/python/python3-iso8601_0.1.14.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "http://pyiso8601.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844"
 
-SRC_URI[md5sum] = "df6e924305fd799d90be63336b2ab8b3"
-SRC_URI[sha256sum] = "f7dec22af52025d4526be94cc1303c7d8f5379b746a3f54a8c8446384392eeb1"
+SRC_URI[sha256sum] = "8aafd56fa0290496c5edbb13c311f78fa3a241f0853540da09d9363eae3ebd79"
 
 inherit pypi setuptools3
 
-- 
2.17.1

