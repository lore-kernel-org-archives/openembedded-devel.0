Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.11984.1619618108561281867
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Apr 2021 06:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=44422 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lbkeW-0000GX-Qc; Wed, 28 Apr 2021 16:54:57 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-cachetools: Upgrade 4.2.1 -> 4.2.2
Date: Wed, 28 Apr 2021 16:54:47 +0300
Message-Id: <20210428135448.9231-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.2.2:

- Update build environment.
- Remove Python 2 remnants.
- Format code with Black.

License-Update: Fix copyright year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-cachetools_4.2.1.bb => python3-cachetools_4.2.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_4.2.1.bb => python3-cachetools_4.2.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_4.2.1.bb b/meta-python/recipes-devtools/python/python3-cachetools_4.2.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-cachetools_4.2.1.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_4.2.2.bb
index 616e880453..43049dafe7 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_4.2.2.bb
@@ -6,7 +6,7 @@ Python 3 Standard Library @lru_cache function decorator."
 SECTION = "devel/python"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2d1e1bf0ccb26126a230c51f997ce362"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=439a07e400525964c3c82684146e46eb"
 
 inherit pypi setuptools3 ptest
 
@@ -27,6 +27,6 @@ do_install_ptest() {
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
 
-SRC_URI[sha256sum] = "f469e29e7aa4cff64d8de4aad95ce76de8ea1125a16c68e0d93f65c3c3dc92e9"
+SRC_URI[sha256sum] = "61b5ed1e22a0924aed1d23b478f37e8d52549ff8a961de2909c69bf950020cff"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

