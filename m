Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.11961.1596463530610278231
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 07:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40282 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k2b5k-00024S-GI; Mon, 03 Aug 2020 17:05:29 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/7] python3-ujson: Upgrade 3.0.0 -> 3.1.0
Date: Mon,  3 Aug 2020 17:05:14 +0300
Message-Id: <20200803140520.23250-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.1.0:

- PEP 489 Multi Phase Init support
- PyPy3 test fixes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-ujson_3.0.0.bb => python3-ujson_3.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_3.0.0.bb => python3-ujson_3.1.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_3.0.0.bb b/meta-python/recipes-devtools/python/python3-ujson_3.1.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-ujson_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_3.1.0.bb
index 352aedcf9..ef57b2a1f 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_3.1.0.bb
@@ -4,8 +4,8 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe"
 
-SRC_URI[md5sum] = "1c13a485776a2a0dfa1795d101bb3d57"
-SRC_URI[sha256sum] = "e0199849d61cc6418f94d52a314c6a27524d65e82174d2a043fb718f73d1520d"
+SRC_URI[md5sum] = "875ac729018f3cac786d471422306fa8"
+SRC_URI[sha256sum] = "00bda1de275ed6fe81817902189c75dfd156b4fa29b44dc1f4620775d2f50cf7"
 
 inherit pypi ptest setuptools3
 
-- 
2.17.1

