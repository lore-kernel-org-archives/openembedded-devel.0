Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.201.1616517231778649930
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Mar 2021 09:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60894 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lOjyV-0000KS-UJ; Tue, 23 Mar 2021 18:33:51 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/10] python3-twine: Upgrade 3.4.0 -> 3.4.1
Date: Tue, 23 Mar 2021 18:33:15 +0200
Message-Id: <20210323163317.26664-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210323163317.26664-1-leon.anavi@konsulko.com>
References: <20210323163317.26664-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.4.1:

- Fix a regression that was causing some namespace packages with
  dots in them fail to upload to PyPI

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-twine_3.4.0.bb => python3-twine_3.4.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twine_3.4.0.bb => python3-twine_3.4.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-twine_3.4.0.bb b/meta-python/recipes-devtools/python/python3-twine_3.4.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-twine_3.4.0.bb
rename to meta-python/recipes-devtools/python/python3-twine_3.4.1.bb
index 2cbf16876..111366dba 100644
--- a/meta-python/recipes-devtools/python/python3-twine_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twine_3.4.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://twine.readthedocs.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c"
 
-SRC_URI[sha256sum] = "101f1c43ea4587ab19261d09157c63b6f37a0e55b215f0dd26304df1d49b620c"
+SRC_URI[sha256sum] = "a56c985264b991dc8a8f4234eb80c5af87fa8080d0c224ad8f2cd05a2c22e83b"
 
 inherit pypi setuptools3
 
-- 
2.17.1

