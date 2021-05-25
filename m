Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.10182.1621951274015422726
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 May 2021 07:01:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60008 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1llXcM-0006YJ-EG; Tue, 25 May 2021 17:01:11 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-xmlschema: Upgrade 1.6.1 -> 1.6.2
Date: Tue, 25 May 2021 17:00:55 +0300
Message-Id: <20210525140058.6416-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.6.2:

- Fix for issue key/keyref with dynamic types
- Change default decoding of mixed content with only text to a
  string instead of a dictionary

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-xmlschema_1.6.1.bb => python3-xmlschema_1.6.2.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_1.6.1.bb => python3-xmlschema_1.6.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_1.6.1.bb b/meta-python/recipes-devtools/python/python3-xmlschema_1.6.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-xmlschema_1.6.1.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_1.6.2.bb
index 91697e39a..acdb39942 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_1.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_1.6.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f"
 
-SRC_URI[sha256sum] = "d02b82bb4fce3af09495b85e6ada5ce0cfdaa865b09b28ecc0f5ab81fad7e328"
+SRC_URI[sha256sum] = "31ddf77a44e4b121de212beeb2cc039e2e8b7a7a4f1678c9b29be1f5341aec52"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
@@ -14,6 +14,7 @@ DEPENDS += "\
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-elementpath \
+    ${PYTHON_PN}-modules \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

