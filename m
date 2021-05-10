Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.32173.1620655668244161615
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 07:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57184 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lg6ZV-000657-5h; Mon, 10 May 2021 17:07:47 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/10] python3-bitarray: Upgrade 2.0.1 -> 2.1.0
Date: Mon, 10 May 2021 17:07:19 +0300
Message-Id: <20210510140722.27201-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210510140722.27201-1-leon.anavi@konsulko.com>
References: <20210510140722.27201-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.1.0:

- add `.find()` method
- `.find()`, `.index()`, `.search()` and `.itersearch()` now all
  except both (sub-) bitarray as well as bool items to be searched
  for
- improve encode/decode error messages
- add lexicographical permutations example
- add tests

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_2.0.1.bb => python3-bitarray_2.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.0.1.bb => python3-bitarray_2.1.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.0.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.1.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.1.0.bb
index a91e246d40..12de2c97ae 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "ec3a4f6d711a79ed23aea9541638d3353dc3f083f293a13180b14b482e3e19ef"
+SRC_URI[sha256sum] = "97224a19325ecee49a3bf4df3ee0531d3af9cf288b67d089a7ef44a3c4ea3839"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

