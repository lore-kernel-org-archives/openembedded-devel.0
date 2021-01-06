Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.1117.1609970838080078302
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 14:07:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=51612 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kxGxU-0004lA-5j; Thu, 07 Jan 2021 00:07:16 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/10] python3-twine: Upgrade 3.2.0 -> 3.3.0
Date: Thu,  7 Jan 2021 00:06:54 +0200
Message-Id: <20210106220702.10483-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210106220702.10483-1-leon.anavi@konsulko.com>
References: <20210106220702.10483-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.3.0:

- Print files to be uploaded using upload --verbose
- Print configuration file location when using upload --verbose
- Print source and values of credentials when using upload
  --verbose
- Add support for Python 3.9
- Turn warnings into errors when using check --strict

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-twine_3.2.0.bb => python3-twine_3.3.0.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-twine_3.2.0.bb => python3-twine_3.3.0.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-twine_3.2.0.bb b/meta-python/recipes-devtools/python/python3-twine_3.3.0.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-twine_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-twine_3.3.0.bb
index 34309585f8..0bc1999923 100644
--- a/meta-python/recipes-devtools/python/python3-twine_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twine_3.3.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://twine.readthedocs.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c"
 
-SRC_URI[md5sum] = "41ce5c8aad253ef4b43b19c76997e2f2"
-SRC_URI[sha256sum] = "34352fd52ec3b9d29837e6072d5a2a7c6fe4290e97bba46bb8d478b5c598f7ab"
+SRC_URI[sha256sum] = "fcffa8fc37e8083a5be0728371f299598870ee1eccc94e9a25cef7b1dcfa8297"
 
 inherit pypi setuptools3
 
-- 
2.17.1

