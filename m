Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.6817.1611235040359528877
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 05:17:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46072 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l2Zpu-0002jH-F4; Thu, 21 Jan 2021 15:17:19 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-bitarray: Upgrade 1.6.1 -> 1.6.3
Date: Thu, 21 Jan 2021 15:17:07 +0200
Message-Id: <20210121131709.27097-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210121131709.27097-1-leon.anavi@konsulko.com>
References: <20210121131709.27097-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.6.3:

- add missing .h files to sdist tarball
- use `Py_SET_TYPE()` and `Py_SET_SIZE()` for Python 3.10
- add official Python 3.10 support
- fix slice assignement to same object, e.g. a[2::] = a or
  a[::-1] = a
- add bitarray.h

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_1.6.1.bb => python3-bitarray_1.6.3.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.6.1.bb => python3-bitarray_1.6.3.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.6.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.6.3.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.6.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.6.3.bb
index f54d54f92..16beab551 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.6.3.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[md5sum] = "a082075dbae478fb53c69e25cc7f9cd6"
-SRC_URI[sha256sum] = "ab85b38365dd9956264226b30dababa02161ed49bb36c7ee82cc6545e07b1599"
+SRC_URI[sha256sum] = "ae27ce4bef4f35b4cc2c0b0d9cf02ed49eee567c23d70cb5066ad215f9b62b3c"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

