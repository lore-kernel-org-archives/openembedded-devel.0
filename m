Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.2443.1596535815707055885
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2020 03:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52502 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k2tta-0006Y3-01; Tue, 04 Aug 2020 13:10:14 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-xxhash: Upgrade 1.4.4 -> 2.0.0
Date: Tue,  4 Aug 2020 13:10:05 +0300
Message-Id: <20200804101005.7169-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.0.0:

- Require xxHash version >= v0.8.0
- Upgrade xxHash to v0.8.0
- XXH3 hashes: xxh3_64, xxh3_128, and their oneshot functions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-xxhash_1.4.4.bb => python3-xxhash_2.0.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xxhash_1.4.4.bb => python3-xxhash_2.0.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-xxhash_1.4.4.bb b/meta-python/recipes-devtools/python/python3-xxhash_2.0.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-xxhash_1.4.4.bb
rename to meta-python/recipes-devtools/python/python3-xxhash_2.0.0.bb
index 97f4e358b..c5add103c 100644
--- a/meta-python/recipes-devtools/python/python3-xxhash_1.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-xxhash_2.0.0.bb
@@ -3,8 +3,8 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5a8d76283514a1b7e6a414aba38629b5"
 
-SRC_URI[md5sum] = "0194cc926dd7676d27aba0f89da9798b"
-SRC_URI[sha256sum] = "7d6df9d217977d085b8abd74b61efa40405ac416f2d8bdacc40826bd5cb1b746"
+SRC_URI[md5sum] = "010fda0427b621e5fe6930ad42511d88"
+SRC_URI[sha256sum] = "58ca818554c1476fa1456f6cd4b87002e2294f09baf0f81e5a2a4968e62c423c"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.17.1

