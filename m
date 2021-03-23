Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.182.1616517215226342253
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Mar 2021 09:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60894 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lOjyB-0000KS-Cw; Tue, 23 Mar 2021 18:33:32 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/10] python3-bitarray: Upgrade 1.7.1 -> 1.8.0
Date: Tue, 23 Mar 2021 18:33:08 +0200
Message-Id: <20210323163317.26664-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.8.0:

- Add `bitarray.util.serialize()` and `bitarray.util.deserialize()`
- Allow whitespace (ignore space and `\n\r\t\v`) in input strings,
  e.g. `bitarray('01 11')` or `a += '10 00'`
- Add `bitarray.util.pprint()`
- When initializing a bitarray from another with different bit
  endianness, e.g. `a = bitarray('110', 'little')` and
  `b = bitarray(a, 'big')`, the buffer used to be simply copied,
  with consequence that `a == b` would result in `False`.  This is
  fixed now, that is `a == b` will always evaluate to `True`.
- Add example showing how to jsonize bitarrays
- Add tests

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_1.7.1.bb => python3-bitarray_1.8.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.7.1.bb => python3-bitarray_1.8.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.7.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.8.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.7.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.8.0.bb
index f859283ab..f38791716 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.8.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "e4de977d708b7024760266d827b8285e4405dce4293f25508c4556970139018a"
+SRC_URI[sha256sum] = "fe4444d92b17073bf1f9f24e3015a0e5bb70a645c47df93ef8a9ce8be33fcbad"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

