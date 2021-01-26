Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.11742.1611665421436434971
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jan 2021 04:50:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37874 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l4NnX-0007hT-7U; Tue, 26 Jan 2021 14:50:20 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-xmlschema: Upgrade 1.4.1 -> 1.4.2
Date: Tue, 26 Jan 2021 14:50:03 +0200
Message-Id: <20210126125003.27620-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210126125003.27620-1-leon.anavi@konsulko.com>
References: <20210126125003.27620-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.4.2:

- Add decoding of binary datatypes (xs:hexBinary and
  xs:base64Binary)
- Fix encoding from string values for some builtin datatypes
  (decimal, binary, duration and datetime)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-xmlschema_1.4.1.bb => python3-xmlschema_1.4.2.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_1.4.1.bb => python3-xmlschema_1.4.2.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb b/meta-python/recipes-devtools/python/python3-xmlschema_1.4.2.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_1.4.2.bb
index c60993105..055a82d4c 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_1.4.2.bb
@@ -3,14 +3,13 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f"
 
-SRC_URI[md5sum] = "f4c46f8c4415a0ca31dc2f623b668664"
-SRC_URI[sha256sum] = "ade693114ff2e4a9ed5a2371ce29ae888f689bc58e326e5796f8a7dc8954dd4a"
+SRC_URI[sha256sum] = "f372005d08dfc231ce7f001c3a7a2c7f7ae138295349268bc551a9df3c700b82"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
 
 DEPENDS += "\
-    ${PYTHON_PN}-elementpath \
+    ${PYTHON_PN}-elementpath-native \
 "
 
 RDEPENDS_${PN} += "\
-- 
2.17.1

