Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.9156.1600160604242539261
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 02:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43802 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kI6ry-0007I7-3D; Tue, 15 Sep 2020 12:03:23 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/10] python3-pyrsistent: Upgrade 0.16.0 -> 0.17.3
Date: Tue, 15 Sep 2020 12:03:03 +0300
Message-Id: <20200915090303.14367-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200915090303.14367-1-leon.anavi@konsulko.com>
References: <20200915090303.14367-1-leon.anavi@konsulko.com>
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

Upgrade 0.17.3:

- Remove Python 2 support code. This includes dropping some
  compatibility code and the dependency on six.
- Python 3 exception chaining. This is a minor backwards
  incompatibility, hence stepping to 0.17.0.
- Restrict package to Python >= 3.5 to not break unpinned
  Python 2 dependencies.
- Release v0.17.3 with proper meta data requiring Python >= 3.5.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...on3-pyrsistent_0.16.0.bb => python3-pyrsistent_0.17.3.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyrsistent_0.16.0.bb => python3-pyrsistent_0.17.3.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-pyrsistent_0.16.0.bb b/meta-python/recipes-devtools/python/python3-pyrsistent_0.17.3.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-pyrsistent_0.16.0.bb
rename to meta-python/recipes-devtools/python/python3-pyrsistent_0.17.3.bb
index dec661143..72736c891 100644
--- a/meta-python/recipes-devtools/python/python3-pyrsistent_0.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyrsistent_0.17.3.bb
@@ -3,14 +3,13 @@ HOMEPAGE = "https://github.com/tobgu/pyrsistent"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE.mit;md5=ca574f2891cf528b3e7a2ee570337e7c"
 
-SRC_URI[md5sum] = "4ba30da6f0a63554e70ac6c4c1904929"
-SRC_URI[sha256sum] = "28669905fe725965daa16184933676547c5bb40a5153055a8dee2a4bd7933ad3"
+SRC_URI[md5sum] = "cd38658ea772a7f9b12b6f9485a7018b"
+SRC_URI[sha256sum] = "2e636185d9eb976a18a8a8e96efce62f2905fea90041958d8cc2a189756ebf3e"
 
 inherit pypi setuptools3
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-six \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

