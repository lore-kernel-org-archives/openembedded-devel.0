Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.4136.1617626986134025862
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Apr 2021 05:49:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55456 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lTOfo-0005yF-6u; Mon, 05 Apr 2021 15:49:45 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-bitarray: Upgrade 1.8.2 -> 1.9.0
Date: Mon,  5 Apr 2021 15:49:32 +0300
Message-Id: <20210405124933.8920-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210405124933.8920-1-leon.anavi@konsulko.com>
References: <20210405124933.8920-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.9.0:

- add shift operations (`<<`, `>>`, `<<=`, `>>=`)
- add `bitarray.util.ba2base()` and `bitarray.util.base2ba()`
- documentation and tests

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_1.8.2.bb => python3-bitarray_1.9.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.8.2.bb => python3-bitarray_1.9.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.8.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.9.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.8.2.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.9.0.bb
index 8fd4b6c31..12ac3d964 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.9.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "96136d9add2b9b3b73e1eb7538b8d12547ee82dc3fbd31addef829371ce2a1bd"
+SRC_URI[sha256sum] = "db00073387af7fe30852d96b04742a0cdbc7feaf3158558520ab7898b0435ee2"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

