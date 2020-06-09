Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.4787.1591701085331904100
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 04:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34040 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jicA7-00081E-Sq; Tue, 09 Jun 2020 14:11:24 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/6] python3-ujson: Upgrade 2.0.3 -> 3.0.0
Date: Tue,  9 Jun 2020 14:10:49 +0300
Message-Id: <20200609111050.32307-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200609111050.32307-1-leon.anavi@konsulko.com>
References: <20200609111050.32307-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.0.0.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-ujson_2.0.3.bb => python3-ujson_3.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_2.0.3.bb => python3-ujson_3.0.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_2.0.3.bb b/meta-python/recipes-devtools/python/python3-ujson_3.0.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-ujson_2.0.3.bb
rename to meta-python/recipes-devtools/python/python3-ujson_3.0.0.bb
index be3dc8e64..352aedcf9 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_2.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_3.0.0.bb
@@ -4,8 +4,8 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe"
 
-SRC_URI[md5sum] = "80d288c186dd02579e1561494b45aa41"
-SRC_URI[sha256sum] = "bd2deffc983827510e5145fb66e4cc0f577480c62fe0b4882139f8f7d27ae9a3"
+SRC_URI[md5sum] = "1c13a485776a2a0dfa1795d101bb3d57"
+SRC_URI[sha256sum] = "e0199849d61cc6418f94d52a314c6a27524d65e82174d2a043fb718f73d1520d"
 
 inherit pypi ptest setuptools3
 
-- 
2.17.1

