Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.12346.1616764360738189517
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Mar 2021 06:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57840 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lPmGT-0004oR-Q9; Fri, 26 Mar 2021 15:12:38 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-bitarray: Upgrade 1.8.0 -> 1.8.1
Date: Fri, 26 Mar 2021 15:12:28 +0200
Message-Id: <20210326131231.5839-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210326131231.5839-1-leon.anavi@konsulko.com>
References: <20210326131231.5839-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.8.1:

- moved implementation of and `hex2ba()` and `ba2hex()` to C-level
- add `bitarray.util.parity()`

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_1.8.0.bb => python3-bitarray_1.8.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.8.0.bb => python3-bitarray_1.8.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.8.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.8.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.8.0.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.8.1.bb
index f38791716..9bb5f280d 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.8.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "fe4444d92b17073bf1f9f24e3015a0e5bb70a645c47df93ef8a9ce8be33fcbad"
+SRC_URI[sha256sum] = "e02f79fba7a470d438eb39017d503498faaf760b17b6b46af1a9de12fd58d311"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

