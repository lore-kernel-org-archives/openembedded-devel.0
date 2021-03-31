Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.4274.1617182293380820115
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Mar 2021 02:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56348 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lRWzI-0002MF-3F; Wed, 31 Mar 2021 12:18:11 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-bitarray: Upgrade 1.8.1 -> 1.8.2
Date: Wed, 31 Mar 2021 12:17:58 +0300
Message-Id: <20210331091801.17047-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210331091801.17047-1-leon.anavi@konsulko.com>
References: <20210331091801.17047-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.8.2:

- fix crash caused by unsupported types in binary operations
- speedup initializing or extending a bitarray from another with
  different bit endianness
- add formatting options to `bitarray.util.pprint()`
- add documentation on bitarray representations
- add and improve tests (all 291 tests run in less than half a
  second on a modern machine)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_1.8.1.bb => python3-bitarray_1.8.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.8.1.bb => python3-bitarray_1.8.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.8.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.8.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.8.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.8.2.bb
index 9bb5f280d..8fd4b6c31 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.8.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "e02f79fba7a470d438eb39017d503498faaf760b17b6b46af1a9de12fd58d311"
+SRC_URI[sha256sum] = "96136d9add2b9b3b73e1eb7538b8d12547ee82dc3fbd31addef829371ce2a1bd"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

