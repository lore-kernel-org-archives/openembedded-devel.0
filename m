Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.13605.1610475844477892785
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 10:24:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47040 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kzOKn-0007kQ-8u; Tue, 12 Jan 2021 20:24:02 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-rsa: Upgrade 4.6 -> 4.7
Date: Tue, 12 Jan 2021 20:23:53 +0200
Message-Id: <20210112182354.15359-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.7:

- Fix: CVE-2020-25658 - Bleichenbacher-style timing oracle in
  PKCS#1 v1.5 decryption code
- Add padding length check as described by PKCS#1 v1.5
- Reuse of blinding factors to speed up blinding operations
- Declare & test support for Python 3.9

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-rsa_4.6.bb => python3-rsa_4.7.bb}          | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-rsa_4.6.bb => python3-rsa_4.7.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-rsa_4.6.bb b/meta-python/recipes-devtools/python/python3-rsa_4.7.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-rsa_4.6.bb
rename to meta-python/recipes-devtools/python/python3-rsa_4.7.bb
index d2b108635..c4c36020f 100644
--- a/meta-python/recipes-devtools/python/python3-rsa_4.6.bb
+++ b/meta-python/recipes-devtools/python/python3-rsa_4.7.bb
@@ -4,8 +4,7 @@ AUTHOR = "Sybren A. Stuvel"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634"
 
-SRC_URI[md5sum] = "bbf1c954865319bd542600ab07f92aca"
-SRC_URI[sha256sum] = "109ea5a66744dd859bf16fe904b8d8b627adafb9408753161e766a92e7d681fa"
+SRC_URI[sha256sum] = "69805d6b69f56eb05b62daea3a7dbd7aa44324ad1306445e05da8060232d00f4"
 
 inherit pypi setuptools3 update-alternatives
 
-- 
2.17.1

