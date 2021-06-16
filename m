Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.5181.1623836058547907530
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jun 2021 02:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47840 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1ltRw6-0004CE-9G; Wed, 16 Jun 2021 12:34:15 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-bitarray: Upgrade 2.1.2 -> 2.1.3
Date: Wed, 16 Jun 2021 12:34:04 +0300
Message-Id: <20210616093408.19873-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.1.3:

- Fix building with MSVC / Bullseye

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_2.1.2.bb => python3-bitarray_2.1.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.1.2.bb => python3-bitarray_2.1.3.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.1.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.1.3.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.1.2.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.1.3.bb
index bc5c86631b..74626c7f96 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.1.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "8745782cb201295963edbd7073072198e001dbe5132718234860b853c901ef66"
+SRC_URI[sha256sum] = "a24aff72a7f1b09571b5daf9dbfcffd98481be1fe085ae5ef662cf11452a97e0"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

