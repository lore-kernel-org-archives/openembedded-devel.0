Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.11063.1619092275842558685
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 04:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59522 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lZXrV-0003Zx-1t; Thu, 22 Apr 2021 14:51:15 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-bitarray: Upgrade 2.0.0 -> 2.0.1
Date: Thu, 22 Apr 2021 14:50:59 +0300
Message-Id: <20210422115100.28615-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210422115100.28615-1-leon.anavi@konsulko.com>
References: <20210422115100.28615-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.0.1:

- update documentation
- improve some error messages

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_2.0.0.bb => python3-bitarray_2.0.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.0.0.bb => python3-bitarray_2.0.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.0.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.0.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.0.1.bb
index 5c00d7df66..a91e246d40 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "ee13850d3237c254c7af8acce2f1a044a1c4f22dcec5380cba7443c8be38f701"
+SRC_URI[sha256sum] = "ec3a4f6d711a79ed23aea9541638d3353dc3f083f293a13180b14b482e3e19ef"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

