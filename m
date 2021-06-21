Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.45435.1624273124160456919
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jun 2021 03:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54610 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lvHdP-0001ID-Qj; Mon, 21 Jun 2021 13:58:32 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-cmd2: Upgrade 1.5.0 -> 2.1.1
Date: Mon, 21 Jun 2021 13:58:21 +0300
Message-Id: <20210621105825.28736-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 2.1.1:

- Fixed handling of argparse's default options group name which
  was changed in Python 3.10
- Restored plugins and tests_isolated directories to tarball
  published to PyPI for cmd2 release

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_1.5.0.bb => python3-cmd2_2.1.1.bb}   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_1.5.0.bb => python3-cmd2_2.1.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.5.0.bb b/meta-python/recipes-devtools/python/python3-cmd2_2.1.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_1.5.0.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_2.1.1.bb
index 18c7a66995..e663b9c815 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_2.1.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "701a8c9975c4abc45e5d13906ab149f959f812869106347323a3f89ac0e82a62"
+SRC_URI[sha256sum] = "a45f6a50b6081c5767b0e410da3f9cebdf6d8fb2aff80fab07d633c6eaaa6d70"
 
 inherit pypi setuptools3
 
@@ -14,6 +14,8 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-colorama \
     ${PYTHON_PN}-pyperclip \
     ${PYTHON_PN}-wcwidth \
+    ${PYTHON_PN}-compression \
+    ${PYTHON_PN}-pydoc \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

