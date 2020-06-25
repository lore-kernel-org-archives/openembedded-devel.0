Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.6528.1593076109351395635
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 02:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47184 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1joNrs-0005y7-2x; Thu, 25 Jun 2020 12:08:28 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/12] python3-pyjks: Upgrade 19.0.0 -> 20.0.0
Date: Thu, 25 Jun 2020 12:07:13 +0300
Message-Id: <20200625090719.16068-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625090719.16068-1-leon.anavi@konsulko.com>
References: <20200625090719.16068-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=0.0
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

Upgrade to release 20.0.0:

- Mirrors keytool support for keystores with empty passphrases
- Add Python 3.7 and 3.8 to support matrix
- Docs and examples fixes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyjks_19.0.0.bb => python3-pyjks_20.0.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyjks_19.0.0.bb => python3-pyjks_20.0.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pyjks_19.0.0.bb b/meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pyjks_19.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb
index ee2f3075c..520899b8e 100644
--- a/meta-python/recipes-devtools/python/python3-pyjks_19.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb
@@ -6,8 +6,8 @@ HOMEPAGE = "http://github.com/kurtbrose/pyjks"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9694d6cc724caf7f7386be88a4a81958"
 
-SRC_URI[md5sum] = "b6e8f3b91be355d15e3ba99de2cccf9b"
-SRC_URI[sha256sum] = "9ce5b40289bcdffcd6a8e7118b333ba8ba2ec4c9ebc5e324885cc8a69767011a"
+SRC_URI[md5sum] = "1a6bce95484f1f62f8ff59755972c632"
+SRC_URI[sha256sum] = "0378cec15fb11b2ed27ba54dad9fd987d48e6f62f49fcff138f5f7a8b312b044"
 
 inherit pypi setuptools3
 
-- 
2.17.1

