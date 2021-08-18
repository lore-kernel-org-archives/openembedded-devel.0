Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.52286.1629279651174601141
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Aug 2021 02:40:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57436 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mGI3u-00018Q-GV; Wed, 18 Aug 2021 12:40:47 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-bitarray: Upgrade 2.2.5 -> 2.3.0
Date: Wed, 18 Aug 2021 12:40:34 +0300
Message-Id: <20210818094038.21474-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.3.0:

- add optional `buffer` argument to `bitarray()` to import the
  buffer of another object
- update `.buffer_info()` to include: a read-only flag, an
  imported buffer flag, and the number of buffer exports
- add optional start and stop arguments to `util.rindex()`
- add [memory-mapped file](../examples/mmapped-file.py) example
- ignore underscore (`_`) in string input,
  e.g. `bitarray('1100_0111')`
- add missing type hinting for new `.bytereverse()` arguments
- fix `.extend()` type annotations, #145
- avoid `.reverse()` using temporary memory
- make `.unpack()`, `util.serialize()`, `util.vl_encode()`
  and `.__reduce__()` more memory efficient
- add and improve tests

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_2.2.5.bb => python3-bitarray_2.3.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.2.5.bb => python3-bitarray_2.3.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.2.5.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.3.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.2.5.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.3.0.bb
index f8e2489070..b198b47004 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "efb2dc83f0acb832a94af3687eea558d72512cf2e54a64fca56a10aacf57934c"
+SRC_URI[sha256sum] = "21f2e10420f9ae74d3bdfd3cb74947ddbe9fbc0b2e5662f2f039001954f1d8b6"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

