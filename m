Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.9303.1600160600209583170
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 02:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43802 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kI6rt-0007I7-8l; Tue, 15 Sep 2020 12:03:18 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/10] python3-pymisp: Upgrade 2.4.130 -> 2.4.131
Date: Tue, 15 Sep 2020 12:02:59 +0300
Message-Id: <20200915090303.14367-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200915090303.14367-1-leon.anavi@konsulko.com>
References: <20200915090303.14367-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.4.131:

- [test] Validate tag removal.
- [describeTypes] updated and sha3 added.
- Bump version, file template version objects and dependencies.
- Rename blacklist -> blocklist.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymisp_2.4.130.bb => python3-pymisp_2.4.131.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.130.bb => python3-pymisp_2.4.131.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.130.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.131.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.130.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.131.bb
index 2e9259466..82ab80314 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.130.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.131.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[md5sum] = "be91a479c689857617fbfc7ce919e291"
-SRC_URI[sha256sum] = "2610bfb5cb942e882c247b468769a6f68817b5a413358c381f73ba91d01edaf6"
+SRC_URI[md5sum] = "8844204f8b059ff2fc508ba9ac07dcb2"
+SRC_URI[sha256sum] = "59adb7ee95bfb1b5c35abbc01b5372df7327baea4a8df9efe30140ea64b73c18"
 
 inherit pypi setuptools3
 
-- 
2.17.1

