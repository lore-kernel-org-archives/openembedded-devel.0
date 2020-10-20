Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.8640.1603207570984971045
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2020 08:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33424 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kUtWZ-0007NG-5r; Tue, 20 Oct 2020 18:26:08 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-regex: Upgrade 2020.10.11 -> 2020.10.15
Date: Tue, 20 Oct 2020 18:25:59 +0300
Message-Id: <20201020152601.26261-1-leon.anavi@konsulko.com>
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

Upgrade to release 2020.10.15:

- Fix GCC 10 warnings

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-regex_2020.10.11.bb => python3-regex_2020.10.15.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2020.10.11.bb => python3-regex_2020.10.15.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.10.11.bb b/meta-python/recipes-devtools/python/python3-regex_2020.10.15.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-regex_2020.10.11.bb
rename to meta-python/recipes-devtools/python/python3-regex_2020.10.15.bb
index df2c00bbaa..b72aabd0f4 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2020.10.11.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2020.10.15.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c0
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "642c259122a3b578cec66d8bba5665e4"
-SRC_URI[sha256sum] = "463e770c48da76a8da82b8d4a48a541f314e0df91cbb6d873a341dbe578efafd"
+SRC_URI[md5sum] = "ef9f43ab182949c79b2c8f869788f8aa"
+SRC_URI[sha256sum] = "d25f5cca0f3af6d425c9496953445bf5b288bb5b71afc2b8308ad194b714c159"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

