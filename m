Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.6520.1593076098641803632
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 02:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47184 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1joNrk-0005y7-RQ; Thu, 25 Jun 2020 12:08:17 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/12] python3-twine: Upgrade 3.1.1 -> 3.2.0
Date: Thu, 25 Jun 2020 12:07:11 +0300
Message-Id: <20200625090719.16068-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625090719.16068-1-leon.anavi@konsulko.com>
References: <20200625090719.16068-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.2.0:

- Improve display of HTTP errors during upload
- Use red text when printing errors on the command line
- Print packages and signatures to be uploaded when using
  --verbose option
- Update URL to .pypirc specification
- Require repository URL scheme to be http or https
- Don't raise an exception when Python version can't be parsed
  from filename
- Fix inaccurate retry message during upload
- Clarify error messages for archive format
- Add type annotations, checked with mypy, with PEP 561 support
  for users of Twine's API

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-twine_3.1.1.bb => python3-twine_3.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-twine_3.1.1.bb => python3-twine_3.2.0.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-twine_3.1.1.bb b/meta-python/recipes-devtools/python/python3-twine_3.2.0.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-twine_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-twine_3.2.0.bb
index 31b55302a..34309585f 100644
--- a/meta-python/recipes-devtools/python/python3-twine_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-twine_3.2.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://twine.readthedocs.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c"
 
-SRC_URI[md5sum] = "faf033a3458de37df6cdecceb6da2c2b"
-SRC_URI[sha256sum] = "d561a5e511f70275e5a485a6275ff61851c16ffcb3a95a602189161112d9f160"
+SRC_URI[md5sum] = "41ce5c8aad253ef4b43b19c76997e2f2"
+SRC_URI[sha256sum] = "34352fd52ec3b9d29837e6072d5a2a7c6fe4290e97bba46bb8d478b5c598f7ab"
 
 inherit pypi setuptools3
 
-- 
2.17.1

