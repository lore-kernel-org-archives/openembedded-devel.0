Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.3702.1618471363589144986
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Apr 2021 00:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53130 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lWwKn-00077s-1Y; Thu, 15 Apr 2021 10:22:41 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-xxhash: Upgrade 2.0.0 -> 2.0.2
Date: Thu, 15 Apr 2021 10:22:29 +0300
Message-Id: <20210415072230.5957-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210415072230.5957-1-leon.anavi@konsulko.com>
References: <20210415072230.5957-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.0.2:

- Fix Travis CI OSX dpl python2.7 get-pip.py error
- Only to trigger Python 3.9 wheels building

License-Update: Update year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-xxhash_2.0.0.bb => python3-xxhash_2.0.2.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xxhash_2.0.0.bb => python3-xxhash_2.0.2.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-xxhash_2.0.0.bb b/meta-python/recipes-devtools/python/python3-xxhash_2.0.2.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-xxhash_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-xxhash_2.0.2.bb
index c5add103cd..965e8107d3 100644
--- a/meta-python/recipes-devtools/python/python3-xxhash_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xxhash_2.0.2.bb
@@ -1,10 +1,9 @@
 SUMMARY = "xxhash is a Python binding for the xxHash library by Yann Collet."
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5a8d76283514a1b7e6a414aba38629b5"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3a9dab7f159514231249aa3e108ab26b"
 
-SRC_URI[md5sum] = "010fda0427b621e5fe6930ad42511d88"
-SRC_URI[sha256sum] = "58ca818554c1476fa1456f6cd4b87002e2294f09baf0f81e5a2a4968e62c423c"
+SRC_URI[sha256sum] = "b7bead8cf6210eadf9cecf356e17af794f57c0939a3d420a00d87ea652f87b49"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.17.1

