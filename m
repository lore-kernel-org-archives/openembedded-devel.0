Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.35232.1591013078744721187
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 05:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39878 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jfjBF-00086p-Su; Mon, 01 Jun 2020 15:04:38 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-serpent: Upgrade 1.28 -> 1.30.2
Date: Mon,  1 Jun 2020 15:04:18 +0300
Message-Id: <20200601120419.13396-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200601120419.13396-1-leon.anavi@konsulko.com>
References: <20200601120419.13396-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=0.2
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

Upgrade to release 1.30.2.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-serpent_1.28.bb => python3-serpent_1.30.2.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-serpent_1.28.bb => python3-serpent_1.30.2.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-serpent_1.28.bb b/meta-python/recipes-devtools/python/python3-serpent_1.30.2.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-serpent_1.28.bb
rename to meta-python/recipes-devtools/python/python3-serpent_1.30.2.bb
index af2d4aa4a..64edff76b 100644
--- a/meta-python/recipes-devtools/python/python3-serpent_1.28.bb
+++ b/meta-python/recipes-devtools/python/python3-serpent_1.30.2.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Serialization based on ast.literal_eval"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=5cd70632b6cdb96df9ddaf6a4ce619e6"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=5271c65b7cf83bd28055e592c2d14667"
 
-SRC_URI[md5sum] = "15ef8b67c76a6d19bac9c16731a1e62a"
-SRC_URI[sha256sum] = "f306336ca09aa38e526f3b03cab58eb7e45af09981267233167bcf3bfd6436ab"
+SRC_URI[md5sum] = "cbef4f9c88f88c38195d11a0363a095f"
+SRC_URI[sha256sum] = "72753820246a7d8486e8b385353e3bbf769abfceec2e850fa527a288b084ff7a"
 
 inherit pypi ptest setuptools3
 
-- 
2.17.1

