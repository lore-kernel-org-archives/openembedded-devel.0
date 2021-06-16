Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.5139.1623836059022940496
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jun 2021 02:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47840 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1ltRw8-0004CE-2S; Wed, 16 Jun 2021 12:34:16 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-license-expression: Upgrade 1.2 -> 21.6.14
Date: Wed, 16 Jun 2021 12:34:06 +0300
Message-Id: <20210616093408.19873-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210616093408.19873-1-leon.anavi@konsulko.com>
References: <20210616093408.19873-1-leon.anavi@konsulko.com>
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

Upgrade to release 21.6.14:

- Switch to calver for package versioning to better convey the
  currency of the bundled data.
- Include https://scancode-licensedb.aboutcode.org/ licenses list
  with ScanCode (v21.6.7) and SPDX licenses (v3.13) keys. Add new
  functions to create Licensing using these licenses as
  LicenseSymbol.
- Add new License.dedup() method to deduplicate and simplify
  license expressions without over simplifying.
- Add new License.validate() method to return a new ExpressionInfo
  object with details on a license expression validation.
- Drop support for Python 2.
- Adopt the project skeleton from https://github.com/nexB/skeleton
  and its new configure script

License-Update: Adopt latest skeleton, license remains the same.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ..._1.2.bb => python3-license-expression_21.6.14.bb} | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-license-expression_1.2.bb => python3-license-expression_21.6.14.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-license-expression_1.2.bb b/meta-python/recipes-devtools/python/python3-license-expression_21.6.14.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-license-expression_1.2.bb
rename to meta-python/recipes-devtools/python/python3-license-expression_21.6.14.bb
index c033bd3527..0513d091f9 100644
--- a/meta-python/recipes-devtools/python/python3-license-expression_1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-license-expression_21.6.14.bb
@@ -2,16 +2,20 @@ SUMMARY = "Utility library to parse, compare, simplify and normalize license exp
 HOMEPAGE = "https://github.com/nexB/license-expression"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
+LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=9429839cdc4b292ff46e88b524c6e0c9"
 
-SRC_URI[md5sum] = "fd4cb295cc345be1071274cdbd81c969"
-SRC_URI[sha256sum] = "7960e1dfdf20d127e75ead931476f2b5c7556df05b117a73880b22ade17d1abc"
+SRC_URI[sha256sum] = "9de87a427c9a449eee7913472fb9ed03b63036295547369fdbf95f76a8b924b2"
 
 inherit pypi ptest setuptools3
 
+DEPENDS += "\
+    ${PYTHON_PN}-setuptools-scm-native \
+    ${PYTHON_PN}-wheel-native \
+"
+
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-booleanpy \
-    "
+"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.17.1

