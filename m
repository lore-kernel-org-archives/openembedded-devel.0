Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.8088.1617805949326620103
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 07:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41274 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lU9EG-0007iS-MD; Wed, 07 Apr 2021 17:32:28 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/7] python3-bitarray: Upgrade 1.9.0 -> 1.9.1
Date: Wed,  7 Apr 2021 17:32:05 +0300
Message-Id: <20210407143209.21813-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210407143209.21813-1-leon.anavi@konsulko.com>
References: <20210407143209.21813-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.9.1:

- switch documentation from markdown to reStructuredText
- add tests

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_1.9.0.bb => python3-bitarray_1.9.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.9.0.bb => python3-bitarray_1.9.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.9.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.9.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.9.0.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.9.1.bb
index 12ac3d964..e6bfb25c4 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.9.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "db00073387af7fe30852d96b04742a0cdbc7feaf3158558520ab7898b0435ee2"
+SRC_URI[sha256sum] = "ec99acc1b18f99b7e9d0b77766b99f80b3c42d4e83306334deef9745b41a2079"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

