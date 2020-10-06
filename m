Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.10121.1601975138217895386
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Oct 2020 02:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59138 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kPiue-0007g5-Hf; Tue, 06 Oct 2020 12:05:37 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-pywbemtools: Upgrade 0.7.1 -> 0.7.2
Date: Tue,  6 Oct 2020 12:05:23 +0300
Message-Id: <20201006090526.24310-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201006090526.24310-1-leon.anavi@konsulko.com>
References: <20201006090526.24310-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.7.2:

- Test: Fixed attempt in test_class_cmds.py to invoke a non-static
  method on a class object.
- Test: Preventive fix for potential issue with virtualenv raising
  AttributeError during installtest on Python 3.4.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-pywbemtools_0.7.1.bb => python3-pywbemtools_0.7.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-extended/pywbemtools/{python3-pywbemtools_0.7.1.bb => python3-pywbemtools_0.7.2.bb} (87%)

diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.1.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.2.bb
similarity index 87%
rename from meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.1.bb
rename to meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.2.bb
index 05f77288e7..9121f81079 100644
--- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.1.bb
+++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.2.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://pywbemtools.readthedocs.io/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 
-SRC_URI[md5sum] = "a789da735c04ddc08ba828cd8022243e"
-SRC_URI[sha256sum] = "d2fe776c78a740215142f4f033055093f2283fd9327440c59734716e51e19989"
+SRC_URI[md5sum] = "54ebb824d7ab231ef1f1e88d8d69ac69"
+SRC_URI[sha256sum] = "36d70f7d33498cab626e9a2871ea82e434a2c36fe6c240f400615082965f1e4e"
 
 inherit pypi setuptools3
 
-- 
2.17.1

