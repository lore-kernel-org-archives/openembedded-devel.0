Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.3748.1618471363587719804
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Apr 2021 00:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53130 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lWwKl-00077s-C1; Thu, 15 Apr 2021 10:22:41 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-bitarray: Upgrade 1.9.2 -> 2.0.0
Date: Thu, 15 Apr 2021 10:22:28 +0300
Message-Id: <20210415072230.5957-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.0.0:

- require more specific objects, int (0 or 1) or bool
- items are always returned as int 0 or 1
- remove `.length()` method (deprecated since 1.5.1 - use `len()`)
- in `.unpack()` the `one` argument now defaults to 0x01
  (was 0xff)
- `.tolist()` now always returns a list of integers (0 or 1)
- fix frozenbitarray hash function, see #121
- fix frozenbitarray being mutable by `<<=` and `>>=`
- support sequence protocol in `.extend()` (and bitarray creation)
- improve OverflowError messages from `util.int2ba()`
- add examples/hexadecimal.py

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_1.9.2.bb => python3-bitarray_2.0.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.9.2.bb => python3-bitarray_2.0.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.9.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.0.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.9.2.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.0.0.bb
index 0716e8e1d8..5c00d7df66 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "d7a49d21ae04c5af195023b140800186ebf208e3a4fc5b21a1389531cb7a7170"
+SRC_URI[sha256sum] = "ee13850d3237c254c7af8acce2f1a044a1c4f22dcec5380cba7443c8be38f701"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

