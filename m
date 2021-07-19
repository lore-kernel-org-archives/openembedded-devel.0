Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.27323.1626698517641036064
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jul 2021 05:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48938 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1m5Sag-0002eI-3F; Mon, 19 Jul 2021 15:41:46 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-bitarray: Upgrade 2.2.1 -> 2.2.2
Date: Mon, 19 Jul 2021 15:41:40 +0300
Message-Id: <20210719124140.13408-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210719124140.13408-1-leon.anavi@konsulko.com>
References: <20210719124140.13408-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.2.2:

- Speedup slice assignment
- Speedup bitwise operations
- Optimize `getbit()` and `setbit()` in `bitarray.h`
- Fix TypeError messages when bitarray or int (0, 1) are expected
  (bool is a subclass of int)
- Add and improve tests

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_2.2.1.bb => python3-bitarray_2.2.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.2.1.bb => python3-bitarray_2.2.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.2.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.2.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.2.2.bb
index e1f3e17b7a..01f474d0bb 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.2.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "31b40d716a1f0642ea9e2741c29b756299075db2e1d1ebe750e3e2c1469f589d"
+SRC_URI[sha256sum] = "5ed37f0482199de5a3e096405a646ab3f45dd020d234c42539b3c11ea0e2278d"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

