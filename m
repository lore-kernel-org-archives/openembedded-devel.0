Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.5621.1615883876714702614
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Mar 2021 01:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35240 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lM5D8-0006gf-I5; Tue, 16 Mar 2021 10:37:55 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/6] python3-twine: Upgrade 3.3.0 -> 3.4.0
Date: Tue, 16 Mar 2021 10:37:42 +0200
Message-Id: <20210316083744.17558-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210316083744.17558-1-leon.anavi@konsulko.com>
References: <20210316083744.17558-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.4.0:

- Prefer importlib.metadata for entry point handling
- Rely on importlib_metadata 3.6 for nicer entry point processing
- Eliminated dependency on Setuptools/pkg_resources and replaced
  with packaging and importlib_metadata

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-twine_3.3.0.bb => python3-twine_3.4.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twine_3.3.0.bb => python3-twine_3.4.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-twine_3.3.0.bb b/meta-python/recipes-devtools/python/python3-twine_3.4.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-twine_3.3.0.bb
rename to meta-python/recipes-devtools/python/python3-twine_3.4.0.bb
index 0bc199992..2cbf16876 100644
--- a/meta-python/recipes-devtools/python/python3-twine_3.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twine_3.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://twine.readthedocs.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c"
 
-SRC_URI[sha256sum] = "fcffa8fc37e8083a5be0728371f299598870ee1eccc94e9a25cef7b1dcfa8297"
+SRC_URI[sha256sum] = "101f1c43ea4587ab19261d09157c63b6f37a0e55b215f0dd26304df1d49b620c"
 
 inherit pypi setuptools3
 
-- 
2.17.1

