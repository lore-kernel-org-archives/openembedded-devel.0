Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.20796.1625663363152911432
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jul 2021 06:09:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39496 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1m17Im-0004Cr-Gy; Wed, 07 Jul 2021 16:09:21 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-bitarray: Upgrade 2.1.3 -> 2.2.1
Date: Wed,  7 Jul 2021 16:09:12 +0300
Message-Id: <20210707130913.13459-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210707130913.13459-1-leon.anavi@konsulko.com>
References: <20210707130913.13459-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.2.1:

- improve documentation
- speedup `vl_encode()`
- `bitarray.h`: make `getbit()` always an (inline) function
- add assertions in C code

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_2.1.3.bb => python3-bitarray_2.2.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.1.3.bb => python3-bitarray_2.2.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.1.3.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.2.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.1.3.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.2.1.bb
index 74626c7f96..e1f3e17b7a 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "a24aff72a7f1b09571b5daf9dbfcffd98481be1fe085ae5ef662cf11452a97e0"
+SRC_URI[sha256sum] = "31b40d716a1f0642ea9e2741c29b756299075db2e1d1ebe750e3e2c1469f589d"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

