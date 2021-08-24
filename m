Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.36378.1629793126048650984
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Aug 2021 01:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45220 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mIRdm-0003rk-Ia; Tue, 24 Aug 2021 11:18:43 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-bitarray: Upgrade 2.3.0 -> 2.3.2
Date: Tue, 24 Aug 2021 11:18:15 +0300
Message-Id: <20210824081816.1806-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824081816.1806-1-leon.anavi@konsulko.com>
References: <20210824081816.1806-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.3.2:

- fix slice assignment for shared buffer with offset case
- add tests (including internal debug mode tests for
  `buffers_overlap()`)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_2.3.0.bb => python3-bitarray_2.3.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.3.0.bb => python3-bitarray_2.3.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.3.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.3.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.3.2.bb
index b198b47004..8b473b543d 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.3.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "21f2e10420f9ae74d3bdfd3cb74947ddbe9fbc0b2e5662f2f039001954f1d8b6"
+SRC_URI[sha256sum] = "4bee3ba9164b66cef64f1099e9a3b88e99ddcd0c943807e99443613e184b48b4"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

