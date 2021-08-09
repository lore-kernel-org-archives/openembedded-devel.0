Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.22818.1628516558790495938
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Aug 2021 06:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=49496 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mD5Y4-0007HK-N5; Mon, 09 Aug 2021 16:42:37 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-bitarray: Upgrade 2.2.3 -> 2.2.5
Date: Mon,  9 Aug 2021 16:42:26 +0300
Message-Id: <20210809134227.27647-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210809134227.27647-1-leon.anavi@konsulko.com>
References: <20210809134227.27647-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.2.5:

- speedup `find_bit()` and `find_last()` using uint64 checking,
  this means a speedup for `.find()`, `.index()`, `.search()` and
  `util.rindex()`
- add optional start and stop arguments to `.bytereverse()`
- add example to illustrate how unaligned copying works internally
- add documentation
- add tests

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_2.2.3.bb => python3-bitarray_2.2.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.2.3.bb => python3-bitarray_2.2.5.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.2.3.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.2.5.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.2.3.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.2.5.bb
index b72ca3b560..f8e2489070 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.2.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "b5d707d9c4aa75e684e21ff1848b234f3d2ff41d5038db89e2465e5527f90c68"
+SRC_URI[sha256sum] = "efb2dc83f0acb832a94af3687eea558d72512cf2e54a64fca56a10aacf57934c"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

