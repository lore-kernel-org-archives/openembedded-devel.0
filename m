Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.8714.1610547998461975916
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Jan 2021 06:26:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48560 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kzh6a-0000Li-W7; Wed, 13 Jan 2021 16:26:37 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/10] python3-regex: Upgrade 2020.10.28 -> 2020.11.13
Date: Wed, 13 Jan 2021 16:26:22 +0200
Message-Id: <20210113142626.27599-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113142626.27599-1-leon.anavi@konsulko.com>
References: <20210113142626.27599-1-leon.anavi@konsulko.com>
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

Upgrade to release 2020.11.13:

- clock() calls for timeout cause slowdown in Docker
- Unexpected behaviour in fuzzy matching with limited character
  set with IGNORECASE flag
- Added password arguments to twine upload in .travis.yml

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-regex_2020.10.28.bb => python3-regex_2020.11.13.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2020.10.28.bb => python3-regex_2020.11.13.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.10.28.bb b/meta-python/recipes-devtools/python/python3-regex_2020.11.13.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-regex_2020.10.28.bb
rename to meta-python/recipes-devtools/python/python3-regex_2020.11.13.bb
index c3cddd8f1..b5f714397 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2020.10.28.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2020.11.13.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c0
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "8150da7f676e73751b4e3c7b1ba79a34"
-SRC_URI[sha256sum] = "dd3e6547ecf842a29cf25123fbf8d2461c53c8d37aa20d87ecee130c89b7079b"
+SRC_URI[sha256sum] = "83d6b356e116ca119db8e7c6fc2983289d87b27b3fac238cfe5dca529d884562"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

